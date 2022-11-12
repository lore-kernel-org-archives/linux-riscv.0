Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A264C433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Nov 2022 11:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9yRDTp3/JNjKKUq0gKZISwMzO55art5x5E+uGKSR1Ps=; b=hlRm/UmDohOd1e
	j4YoZfMpSXWI+qxPzbkZN9SAF6IDLFdcNU3hU4ZtFHndbyuntYp9bafJ5yM6iE7i72qgnBs3THQ0M
	hRidjsRNcnLYDaWCobnav3fW8YKNUicMxL5VgxXQwJw5gclchmjLFznBorqY5iSZgB+71wFSiFWWX
	rSL1gvwf1A3Di7afh4E/ogSLSyr6ZyGpmgQ9xNTVo2dyZWNvvflIJp/MU9Mca1A0kXOPdqf1WOGVo
	dToUrgWYNmn8BLZVcDZ0W5Xomskn8LpSCHiLjbkc0qkeDInrVbMS8UHVhAO0L0sMkaJ17yN00Y4qv
	JM1oHvGP759FLhGnWlBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otooF-005JeH-1C; Sat, 12 Nov 2022 11:36:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otooC-005JdG-M3
	for linux-riscv@lists.infradead.org; Sat, 12 Nov 2022 11:36:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 60A2FB80735;
	Sat, 12 Nov 2022 11:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B5DC433D6;
	Sat, 12 Nov 2022 11:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668252979;
	bh=hDVkWMmXvy2usab42Pc4A58JK6SsyDaWks6I8QgP8bk=;
	h=From:To:Cc:Subject:Date:From;
	b=SjXafSr5zGyfTqqO0sFinbDUJUaU5S/UA2HoFSWvFS5lMOl+CUuzlfdh9RcQaFQNy
	 pnNseQmagf4UeJB/kNtF0bHhmJbvvFMEh4LXdiRN5rOJ7UchYwfZHGhlgYcfXMGPoW
	 w1J4SMKXVuV7bWpegZPcFmyz1KkzM2ciLMNAZQCsnK6dQwN2Kx1pD1uRQwi+3YSf68
	 v7KSJT9/V8E7HXuAHMZ45SjsL3YkRG6PcdzYEriMdI5JhTVr0kKWa+raZqQr/oV7T7
	 VuyCJIamdjNv+GPCZmSHQTvbfwpvJZHJ8qeehk03cGxrMkKI14Qpj3AOzu97LWUIIs
	 3gvvZETRV/IXA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: mm: Proper page permissions after initmem free
Date: Sat, 12 Nov 2022 12:35:43 +0100
Message-Id: <20221112113543.3165646-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221112_033624_904338_2703C9E6 
X-CRM114-Status: GOOD (  14.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKNjQtYml0IFJJU0MtViBr
ZXJuZWxzIGhhdmUgdGhlIGtlcm5lbCBpbWFnZSBtYXBwZWQgc2VwYXJhdGVseSwgYW5kIGluCmFk
ZGl0aW9uIHRvIHRoZSBsaW5lYXIgbWFwLiBXaGVuIHRoZSBrZXJuZWwgaXMgbG9hZGVkLCB0aGUg
bGluZWFyIG1hcApvZiBrZXJuZWwgaW1hZ2UgaXMgc2V0IHRvIFBBR0VfUkVBRCBwZXJtaXNzaW9u
LCBhbmQgdGhlIGtlcm5lbCBtYXAgaXMKc2V0IHRvIFBBR0VfUkVBRCBhbmQgUEFHRV9FWEVDLgoK
V2hlbiB0aGUgaW5pdG1lbSBpcyBmcmVlZCwgdGhlIGNvcnJlc3BvbmRpbmcgcGFnZXMgaW4gdGhl
IGxpbmVhciBtYXAKc2hvdWxkIGJlIHJlc3RvcmVkIHRvIFBBR0VfUkVBRCBhbmQgUEFHRV9XUklU
RS4gVGhlIGNvcnJlc3BvbmRpbmcKcGFnZXMgaW4gdGhlIGtlcm5lbCBtYXAgc2hvdWxkIGFsc28g
YmUgcmVzdG9yZWQgdG8gUEFHRV9SRUFEIGFuZApQQUdFX1dSSVRFLCBieSByZW1vdmluZyB0aGUg
UEFHRV9FWEVDIHBlcm1pc3Npb24sIGFuZCBhZGRpbmcKUEFHRV9XUklURS4KClRoaXMgaXMgbm90
IHRoZSBjYXNlLiBGb3IgNjQtYml0IGtlcm5lbHMsIG9ubHkgdGhlIGxpbmVhciBtYXAgaXMKcmVz
dG9yZWQgdG8gaXRzIHByb3BlciBwYWdlIHBlcm1pc3Npb25zIGF0IGluaXRtZW0gZnJlZSwgYW5k
IG5vdCB0aGUKa2VybmVsbWFwLgoKSW4gcHJhY3Rpc2UgdGhpcyByZXN1bHRzIGluIHRoYXQgdGhl
IGtlcm5lbCBjYW4gcG90ZW50aWFsbHkganVtcCB0bwpkZWFkIF9faW5pdCBjb2RlLCBhbmQgc3Rh
cnQgZXhlY3V0aW5nIGludmFsaWQgMHhjYyBpbnN0cnVjdGlvbnMsCndpdGhvdXQgZ2V0dGluZyBh
biBleGNlcHRpb24uCgpSZXN0b3JlIHRoZSBmcmVlZCBpbml0bWVtIHByb3Blcmx5LCBieSBzZXR0
aW5nIGJvdGggdGhlIGFsaWFzIChrZXJuZWwKbWFwKSBhbmQgdGhlIGxpbmVhciBtYXAgdG8gdGhl
IGNvcnJlY3QgcGVybWlzc2lvbnMuCgpGaXhlczogZTVjMzVmYTA0MDE5ICgicmlzY3Y6IE1hcCB0
aGUga2VybmVsIHdpdGggY29ycmVjdCBwZXJtaXNzaW9ucyB0aGUgZmlyc3QgdGltZSIpClNpZ25l
ZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jp
c2N2L2tlcm5lbC9zZXR1cC5jIHwgMTAgKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC9zZXR1cC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwppbmRleCBhZDc2YmI1OWIwNTku
LjM2MWU2MzUwNzBmZSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYworKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCkBAIC0zMjEsMTAgKzMyMSwxMiBAQCBzdWJzeXNf
aW5pdGNhbGwodG9wb2xvZ3lfaW5pdCk7CiAKIHZvaWQgZnJlZV9pbml0bWVtKHZvaWQpCiB7Ci0J
aWYgKElTX0VOQUJMRUQoQ09ORklHX1NUUklDVF9LRVJORUxfUldYKSkKLQkJc2V0X2tlcm5lbF9t
ZW1vcnkobG1fYWxpYXMoX19pbml0X2JlZ2luKSwgbG1fYWxpYXMoX19pbml0X2VuZCksCi0JCQkJ
ICBJU19FTkFCTEVEKENPTkZJR182NEJJVCkgPwotCQkJCQlzZXRfbWVtb3J5X3J3IDogc2V0X21l
bW9yeV9yd19ueCk7CisJaWYgKElTX0VOQUJMRUQoQ09ORklHX1NUUklDVF9LRVJORUxfUldYKSkg
eworCQlpZiAoSVNfRU5BQkxFRChDT05GSUdfNjRCSVQpKQorCQkJc2V0X2tlcm5lbF9tZW1vcnko
bG1fYWxpYXMoX19pbml0X2JlZ2luKSwgbG1fYWxpYXMoX19pbml0X2VuZCksCisJCQkJCSAgc2V0
X21lbW9yeV9ydyk7CisJCXNldF9rZXJuZWxfbWVtb3J5KF9faW5pdF9iZWdpbiwgX19pbml0X2Vu
ZCwgc2V0X21lbW9yeV9yd19ueCk7CisJfQogCiAJZnJlZV9pbml0bWVtX2RlZmF1bHQoUE9JU09O
X0ZSRUVfSU5JVE1FTSk7CiB9CgpiYXNlLWNvbW1pdDogNDQyYmNiZmQyYzU0MDE1ODdiOTgzZTM0
YmVkMGI0MDcyMTQ3MzVjMwotLSAKMi4zNy4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
