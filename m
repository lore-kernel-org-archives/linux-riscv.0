Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA04C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 09:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SZmh91feBUCR4obxNyqO9YSppQ79fGQIf1IpBj0wX4Q=; b=TAr/UTKihyeK6H
	QlblMIn6R3E4HDFXvIL8v9Y+zrkpUnZcqxOKoQh9sl4o7v2vf/rNkV4WPMqeU426h1j34Gck732ea
	T8qbf63bPtI6W5ju+y2EujkBkT4iNXPuMkd1pl/8lBwDLsEUImhG3GTJpwv821AfNzHUbLqaByY0Q
	tqcq6q0rwsrEV9e6q+UkbFjJi4ZVD3V/ukj/tp5LWSlwWEE981hbAHeBaOAiLYsk1SEr+ahMUdtCA
	Qz1Z4F0a1hDbJY2Ir/svP8US2aP6TboVW3KtTPrqtNbBP4XkD0A/w3mv/n+PaM332lCd7vgUxJGBY
	AtfkDf0eJ4e24uVO63dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouruG-009AAe-9h; Tue, 15 Nov 2022 09:07:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouruD-009A8V-GL
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 09:06:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 03BF3B81333;
	Tue, 15 Nov 2022 09:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DDCC433D6;
	Tue, 15 Nov 2022 09:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668503214;
	bh=lQ25xsrNZM5Z1Ywp9OfLkW92htJuaG7QNPDZY6Gaer0=;
	h=From:To:Cc:Subject:Date:From;
	b=BndV4nbll6dYyq+hmOudIIps0Es6DLuquMKLDoZ0ItQudlQ1X/ev70P8UrHfToCPz
	 VdI8+mVlhmV7E7WuDj92mBMzdwGcz7K9TXpX0lVNUrkanYXOsZg8KWIAS8SgyYXzpx
	 tpdwQ1iIXDc3jQOs7GKfcUoO/Q97l4xTs0et6XSnRxIdFP+A4wLMh5EaFwCQd6IltR
	 Af+FHGuMSl3UvFOeiOP1i7rQRSCgBU/z0vo01MUPWHPLV8ICvhL1aFMhTc5rWWIR/P
	 T/2eh11YZWSJITjq9FaiqRV+ZrVF4EZiI118gqIJNrVOXODK7qRZVJS/tQd41mqWne
	 SVDwEorwYXLKw==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: mm: Proper page permissions after initmem free
Date: Tue, 15 Nov 2022 10:06:40 +0100
Message-Id: <20221115090641.258476-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_010657_713555_0699A644 
X-CRM114-Status: GOOD (  16.34  )
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
ZXJuZWxzIGhhdmUgdGhlIGtlcm5lbCBpbWFnZSBtYXBwZWQgc2VwYXJhdGVseSB0byBhbGlhcwp0
aGUgbGluZWFyIG1hcC4gVGhlIGxpbmVhciBtYXAgYW5kIHRoZSBrZXJuZWwgaW1hZ2UgbWFwIGFy
ZSBkb2N1bWVudGVkCmFzICJkaXJlY3QgbWFwcGluZyIgYW5kICJrZXJuZWwiIHJlc3BlY3RpdmVs
eSBpbiBbMV0uCgpBdCBpbWFnZSBsb2FkIHRpbWUsIHRoZSBsaW5lYXIgbWFwIGNvcnJlc3BvbmRp
bmcgdG8gdGhlIGtlcm5lbCBpbWFnZQppcyBzZXQgdG8gUEFHRV9SRUFEIHBlcm1pc3Npb24sIGFu
ZCB0aGUga2VybmVsIGltYWdlIG1hcCBpcyBzZXQgdG8KUEFHRV9SRUFEfFBBR0VfRVhFQy4KCldo
ZW4gdGhlIGluaXRtZW0gaXMgZnJlZWQsIHRoZSBwYWdlcyBpbiB0aGUgbGluZWFyIG1hcCBzaG91
bGQgYmUKcmVzdG9yZWQgdG8gUEFHRV9SRUFEfFBBR0VfV1JJVEUsIHdoZXJlYXMgdGhlIGNvcnJl
c3BvbmRpbmcgcGFnZXMgaW4KdGhlIGtlcm5lbCBpbWFnZSBtYXAgc2hvdWxkIGJlIHJlc3RvcmVk
IHRvIFBBR0VfUkVBRCwgYnkgcmVtb3ZpbmcgdGhlClBBR0VfRVhFQyBwZXJtaXNzaW9uLgoKVGhp
cyBpcyBub3QgdGhlIGNhc2UuIEZvciA2NC1iaXQga2VybmVscywgb25seSB0aGUgbGluZWFyIG1h
cCBpcwpyZXN0b3JlZCB0byBpdHMgcHJvcGVyIHBhZ2UgcGVybWlzc2lvbnMgYXQgaW5pdG1lbSBm
cmVlLCBhbmQgbm90IHRoZQprZXJuZWwgaW1hZ2UgbWFwLgoKSW4gcHJhY3Rpc2UgdGhpcyByZXN1
bHRzIGluIHRoYXQgdGhlIGtlcm5lbCBjYW4gcG90ZW50aWFsbHkganVtcCB0bwpkZWFkIF9faW5p
dCBjb2RlLCBhbmQgc3RhcnQgZXhlY3V0aW5nIGludmFsaWQgaW5zdHJ1Y3Rpb25zLCB3aXRob3V0
CmdldHRpbmcgYW4gZXhjZXB0aW9uLgoKUmVzdG9yZSB0aGUgZnJlZWQgaW5pdG1lbSBwcm9wZXJs
eSwgYnkgc2V0dGluZyBib3RoIHRoZSBrZXJuZWwgaW1hZ2UKbWFwIHRvIHRoZSBjb3JyZWN0IHBl
cm1pc3Npb25zLgoKWzFdIERvY3VtZW50YXRpb24vcmlzY3Yvdm0tbGF5b3V0LnJzdAoKRml4ZXM6
IGU1YzM1ZmEwNDAxOSAoInJpc2N2OiBNYXAgdGhlIGtlcm5lbCB3aXRoIGNvcnJlY3QgcGVybWlz
c2lvbnMgdGhlIGZpcnN0IHRpbWUiKQpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9y
bkByaXZvc2luYy5jb20+Ci0tLQp2MjogKiBEbyBub3Qgc2V0IHRoZSBrZXJuZWwgaW1hZ2UgbWFw
IHRvIFBBR0VfV1JJVEUuIChBbGV4KQogICAgKiBNYXNzYWdlZCB0aGUgY29tbWl0IG1lc3NhZ2Ug
YSBiaXQuCiAgICAKU2FtdWVsLCBJIHJlbW92ZWQgeW91ciBSZXZpZXdlZC1ieTovVGVzdGVkLWJ5
OiBmb3IgdGhlIHYyLgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgfCA5ICsrKysrLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0
dXAuYwppbmRleCA2N2VjMWZhZGNmZTIuLjg2YWNkNjkwZDUyOSAxMDA2NDQKLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvc2V0dXAuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCkBAIC0z
MjIsMTAgKzMyMiwxMSBAQCBzdWJzeXNfaW5pdGNhbGwodG9wb2xvZ3lfaW5pdCk7CiAKIHZvaWQg
ZnJlZV9pbml0bWVtKHZvaWQpCiB7Ci0JaWYgKElTX0VOQUJMRUQoQ09ORklHX1NUUklDVF9LRVJO
RUxfUldYKSkKLQkJc2V0X2tlcm5lbF9tZW1vcnkobG1fYWxpYXMoX19pbml0X2JlZ2luKSwgbG1f
YWxpYXMoX19pbml0X2VuZCksCi0JCQkJICBJU19FTkFCTEVEKENPTkZJR182NEJJVCkgPwotCQkJ
CQlzZXRfbWVtb3J5X3J3IDogc2V0X21lbW9yeV9yd19ueCk7CisJaWYgKElTX0VOQUJMRUQoQ09O
RklHX1NUUklDVF9LRVJORUxfUldYKSkgeworCQlzZXRfa2VybmVsX21lbW9yeShsbV9hbGlhcyhf
X2luaXRfYmVnaW4pLCBsbV9hbGlhcyhfX2luaXRfZW5kKSwgc2V0X21lbW9yeV9yd19ueCk7CisJ
CWlmIChJU19FTkFCTEVEKENPTkZJR182NEJJVCkpCisJCQlzZXRfa2VybmVsX21lbW9yeShfX2lu
aXRfYmVnaW4sIF9faW5pdF9lbmQsIHNldF9tZW1vcnlfbngpOworCX0KIAogCWZyZWVfaW5pdG1l
bV9kZWZhdWx0KFBPSVNPTl9GUkVFX0lOSVRNRU0pOwogfQoKYmFzZS1jb21taXQ6IDIyZGNlMmI4
OWQ2MDQzZDVjM2Y2ODM4NDI4NWZmZjU1MDYxMDkzMTcKLS0gCjIuMzcuMgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
