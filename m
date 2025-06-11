Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC6CC7113D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kl3lFTrzEVbniDThal7TLJD3JrRZMHE7bE54Af7G0S8=; b=hhLnNvd9phMSq6
	Ao7l4q+Ty0Vpse1WYlYh3eCztffQ4QCjzUwx/EYJdukZ5GicO/KMIjtbMo1rtQzB/iB+0M3LX5g7X
	0Xdx8SRiNqJhoOLBarw+83ddlE0KISB756nx38oQavobw2oxnij5zH1GRv+ZuOsOwJHVCvuCsZ8+i
	xFfvM02WSFafSmLg20513brlL0H62RwG9/Lmg2WsBeFXofIb0FioUrsP1y8k/OY4VgJkp0pmO3Vco
	f/QM00LvWF0yI2hwGCuICB9vikFc/g42aNRtHt0j0K5yMvJwtHUNlSdI/bnil2HnmtxgfqIhPf/13
	CcIKLfUWgkN+baFVppLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGQB-00000009BjV-0gTW;
	Wed, 11 Jun 2025 08:02:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2s-000000097sH-2zgP
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 07:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VYgtidffxNZR2vi7Ilvk4ikd2wExNwWXZn779oXpOZw=; b=SLZ2+aNpjjptklp8qQyIiBndU5
	TTR50A7arK97KAsm5cFbsqWV6ELv7l0nG/hzF5WoGs/u6ZLzRNJbGSuIwGSoov6BZTlbig0oGsUJn
	/k3/pf4KPFg0NdHS4l0dv59nPrtEd4z/89g98bPReQFAD9IJ9tQwMr8f8bK+AlpVoeauTsEMXyY7X
	I4PP6IFwRRQhf+IKGibVjGPSoKn5RmMFwQjMWUss8QWCsg5edXPI1fuTeruznaUm5QDWnUV1tGP2C
	NUukZw1Saa7BHan1RfJl5tpNJPhiJ5T6heONGn0nuqqv7lb8nQNAPddxNE9Jx9CvGWGys9OFKmnyo
	aLDY1xBQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2p-00000002A5z-295a
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:38:50 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749627514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VYgtidffxNZR2vi7Ilvk4ikd2wExNwWXZn779oXpOZw=;
	b=DvYyg6QvrAo5e+rlyt/4KLUOfbkR1iPns2d35AFrnM0IieJ3DplwfsMtI6Xne+BZslL3BN
	/Gb1bwfvg97Vn1v3WOxkwnSmldUde2QM5k6twv3hg6l4GwndFFSuA29I+Sj+fXHkT5vI3z
	VzYXudrr3iM+krKkavjQ/2clQ9ddURFv9+xNs9U76m0bQuURPESAqroseTaKg3XPvkpMn3
	9dy0zuRxUGOEHsU/RcQBCZzrXpPqBGl/lYVdhCtKnqMHnYfkODKzMcNaH00B+rKmFL6di8
	ae47FP0aw0RuczB1ZAMsOg1w0gcRTNqUmPeEAbpZabS7nRy+LZWAizlM8+LiGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749627514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VYgtidffxNZR2vi7Ilvk4ikd2wExNwWXZn779oXpOZw=;
	b=iNdYa4BGqT8T0LBKV8V4HUwFq81N8ZO5b2HUwUfdOfNoS62BHJdUQRxRci9ajmsS4kAcHd
	9Mwt3V27vHBKwCBQ==
Date: Wed, 11 Jun 2025 09:38:14 +0200
Subject: [PATCH v3 08/16] kunit: tool: Add test for nested test result
 reporting
MIME-Version: 1.0
Message-Id: <20250611-kunit-kselftests-v3-8-55e3d148cbc6@linutronix.de>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
In-Reply-To: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 workflows@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749627510; l=2070;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=lI/60pEr6pY3/pLg+6Hxz2diPV2LL+wQWsSjlOiVzgY=;
 b=sHO8F73U/BrcQR+S5CdVr2kAfBk6sOvpmwGLe0GkHA6MtLjeLt3qQ2pEdENOYL4cGlV2NaBsp
 I53K+L8LC7pDqkqfZsB1bte48hcxCzXlCnvHHw8owd8DlTq+B8X/8Wx
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_083847_612515_1BA375D0 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

Q3VycmVudGx5IHRoZXJlIGlzIG5vIHRlc3QgdmFsaWRhdGluZyB0aGUgcmVzdWx0IHJlcG9ydGlu
ZyBmcm9tIG5lc3RlZAp0ZXN0cy4gQWRkIG9uZSwgaXQgd2lsbCBhbHNvIGJlIHVzZWQgdG8gdmFs
aWRhdGUgdXBjb21pbmcgY2hhbmdlcyB0byB0aGUKbmVzdGVkIHRlc3QgcGFyc2luZy4KClNpZ25l
ZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4
LmRlPgotLS0KIHRvb2xzL3Rlc3Rpbmcva3VuaXQva3VuaXRfdG9vbF90ZXN0LnB5ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCA5ICsrKysrKysrKwogLi4uL2t1bml0L3Rlc3RfZGF0YS90ZXN0
X2lzX3Rlc3RfcGFzc2VkLWZhaWx1cmUtbmVzdGVkLmxvZyAgICAgICB8IDcgKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGlu
Zy9rdW5pdC9rdW5pdF90b29sX3Rlc3QucHkgYi90b29scy90ZXN0aW5nL2t1bml0L2t1bml0X3Rv
b2xfdGVzdC5weQppbmRleCBiYmJhOTIxZTBlYWNiMTg2NjNhYmZjYWJiMmJjY2YzMzBkODY2NmY1
Li42OTFjZGU5YjAzMGY3NzI5MTI4NDkwYzFiZGI0MmNjZWUxOTY3YWQ2IDEwMDc1NQotLS0gYS90
b29scy90ZXN0aW5nL2t1bml0L2t1bml0X3Rvb2xfdGVzdC5weQorKysgYi90b29scy90ZXN0aW5n
L2t1bml0L2t1bml0X3Rvb2xfdGVzdC5weQpAQCAtMTY1LDYgKzE2NSwxNSBAQCBjbGFzcyBLVW5p
dFBhcnNlclRlc3QodW5pdHRlc3QuVGVzdENhc2UpOgogCQlzZWxmLmFzc2VydEVxdWFsKGt1bml0
X3BhcnNlci5UZXN0U3RhdHVzLkZBSUxVUkUsIHJlc3VsdC5zdGF0dXMpCiAJCXNlbGYuYXNzZXJ0
RXF1YWwocmVzdWx0LmNvdW50cy5lcnJvcnMsIDApCiAKKwlkZWYgdGVzdF9wYXJzZV9mYWlsZWRf
bmVzdGVkX3Rlc3RzX2xvZyhzZWxmKToKKwkJbmVzdGVkX2xvZyA9IHRlc3RfZGF0YV9wYXRoKCd0
ZXN0X2lzX3Rlc3RfcGFzc2VkLWZhaWx1cmUtbmVzdGVkLmxvZycpCisJCXdpdGggb3BlbihuZXN0
ZWRfbG9nKSBhcyBmaWxlOgorCQkJcmVzdWx0ID0ga3VuaXRfcGFyc2VyLnBhcnNlX3J1bl90ZXN0
cyhmaWxlLnJlYWRsaW5lcygpLCBzdGRvdXQpCisJCXNlbGYuYXNzZXJ0RXF1YWwoa3VuaXRfcGFy
c2VyLlRlc3RTdGF0dXMuRkFJTFVSRSwgcmVzdWx0LnN0YXR1cykKKwkJc2VsZi5hc3NlcnRFcXVh
bChyZXN1bHQuY291bnRzLmZhaWxlZCwgMikKKwkJc2VsZi5hc3NlcnRFcXVhbChrdW5pdF9wYXJz
ZXIuVGVzdFN0YXR1cy5GQUlMVVJFLCByZXN1bHQuc3VidGVzdHNbMF0uc3RhdHVzKQorCQlzZWxm
LmFzc2VydEVxdWFsKGt1bml0X3BhcnNlci5UZXN0U3RhdHVzLkZBSUxVUkUsIHJlc3VsdC5zdWJ0
ZXN0c1sxXS5zdGF0dXMpCisKIAlkZWYgdGVzdF9ub19oZWFkZXIoc2VsZik6CiAJCWVtcHR5X2xv
ZyA9IHRlc3RfZGF0YV9wYXRoKCd0ZXN0X2lzX3Rlc3RfcGFzc2VkLW5vX3Rlc3RzX3J1bl9ub19o
ZWFkZXIubG9nJykKIAkJd2l0aCBvcGVuKGVtcHR5X2xvZykgYXMgZmlsZToKZGlmZiAtLWdpdCBh
L3Rvb2xzL3Rlc3Rpbmcva3VuaXQvdGVzdF9kYXRhL3Rlc3RfaXNfdGVzdF9wYXNzZWQtZmFpbHVy
ZS1uZXN0ZWQubG9nIGIvdG9vbHMvdGVzdGluZy9rdW5pdC90ZXN0X2RhdGEvdGVzdF9pc190ZXN0
X3Bhc3NlZC1mYWlsdXJlLW5lc3RlZC5sb2cKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uODM1ODE2ZTBhMDc3MTVhNTE0
ZjVmNWFmYWIxYjYyNTAwMzdmZWFmNAotLS0gL2Rldi9udWxsCisrKyBiL3Rvb2xzL3Rlc3Rpbmcv
a3VuaXQvdGVzdF9kYXRhL3Rlc3RfaXNfdGVzdF9wYXNzZWQtZmFpbHVyZS1uZXN0ZWQubG9nCkBA
IC0wLDAgKzEsNyBAQAorS1RBUCB2ZXJzaW9uIDEKKzEuLjIKK25vdCBvayAxIHN1YnRlc3QgMQor
ICAgIEtUQVAgdmVyc2lvbiAxCisgICAgMS4uMQorICAgICAgICBub3Qgb2sgMSB0ZXN0IDEKK25v
dCBvayAyIHN1YnRlc3QgMgoKLS0gCjIuNDkuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
