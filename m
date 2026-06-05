Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30567CD6E79
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 14:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ewCZ8kQcCFpS7Hy6qIFizo8ewevakBmziiuRzXBiskA=; b=xWamWVln7CGQTI
	S63GH/bzTz0PY6Hhdh2riD02uJkZeXXxJZaKGyQm7QR049zgyaS1L66BJrg+tY2LA+5x/bDBGbnwB
	iinAUJGETSXoIq9Ym0oaBWt6/myrc1LQsMrHORvvloXHZLk+xRBtq3dDxruTajEE7FlhZQDkV6b5w
	gziw3zQwsmVm0bfy41p9hNgveX97FE9FqRNIN4YETtEOvFvEu0aYt9vZwq2uEdxMUbmRYAaY15GMg
	Nwy2Wsxj4s4XuFNIBFJ99zLMFbsrsjTA2zy0zc8LpFRYQM83wevbnaN1DZo4S3CIPjopLlyznoBZN
	2Fmi8tyPMZ1oHiVOPykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVVIa-00000000iMn-0Cv5;
	Fri, 05 Jun 2026 14:13:24 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVVIX-00000000iLy-3yTh
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 14:13:23 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gX3LZ6Zplz9tnp;
	Fri,  5 Jun 2026 16:13:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mssola.com; s=MBO0001;
	t=1780668790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BeU53WTNN3WRgj7/DWG54MEURJQ3xLzp3W1oAv5adgU=;
	b=Fgj4wnTQMvTy8ameFzuUpaaHw4m1N7KuhhNtaStri9JqxuCsajEz69l2YEAI/r49NqejZx
	gsMq4+h9dNpHgYV44nULWPh70IJj3TQ5Mt6H2qQcIj7QyzNSePGq+VfIPX4ZbiXTjG0CtX
	Tu/Sqf1DvsiqH3FfMo0JApv1LffrQ28gQocxnTpggdVpg/NbJvGWAmmcTVwPiH00KUYEcy
	vqrq6Yn5jcxdFijYCtDfenyZ2YsNSUzyRDAdTjtaE3RCV+vZ3TPxJ9ANQXKMHZ7YWPMJUy
	P3UecSD0pSdJ/vKLRNomwwh8Jp+FJVoxJk5BfL3o50LMFFVpLBBja17mlOSyxw==
From: =?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mssola@mssola.com>
To: linux-riscv@lists.infradead.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mssola@mssola.com>
Subject: [PATCH RESEND] riscv: enable HAVE_CMPXCHG_{DOUBLE,LOCAL}
Date: Fri,  5 Jun 2026 16:12:47 +0200
Message-ID: <20260605141247.253315-1-mssola@mssola.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_071322_224511_DDD69774 
X-CRM114-Status: GOOD (  12.09  )
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

U3VwcG9ydCBmb3IgYXRvbWljIENvbXBhcmUtQW5kLVN3YXAgaW5zdHJ1Y3Rpb25zIGhhcyBiZWVu
IGluIHRoZSBSSVNDLVYKcG9ydCBvZiB0aGUgTGludXgga2VybmVsIGZvciBhIGxvbmcgdGltZS4g
VGhhdCBiZWluZyBzYWlkLCB3ZSBhcHBhcmVudGx5Cm5ldmVyIGJvdGhlcmVkIHRvIHNldCBIQVZF
X0NNUFhDSEdfRE9VQkxFIGFuZCBIQVZFX0NNUFhDSEdfTE9DQUwgaW4gdGhlCktjb25maWcsIGRl
c3BpdGUgaGF2aW5nIGFsbCB0aGUgZnJhbWV3b3JrIHRvIHN1cHBvcnQgdGhlbS4KClNpZ25lZC1v
ZmYtYnk6IE1pcXVlbCBTYWJhdMOpIFNvbMOgIDxtc3NvbGFAbXNzb2xhLmNvbT4KLS0tClRoaXMg
aXMgYSByZXNlbmQgb2YgWzFdLCByZWJhc2VkIG9uIHRvcCBvZiB0aGUgbGF0ZXN0IGNvbW1pdCBm
cm9tIHRoZQpmb3ItbmV4dCBicmFuY2guCgpJIGhhdmUgYnVpbHQgdGhpcyBwYXRjaCB3aXRoIG11
bHRpcGxlIGNvbmZpZ3VyYXRpb25zIGFuZCByYW4gaXQgd2l0aCBLVk0KKHRoZSBWaXNpb25GaXZl
MiBib2FyZCB0aGF0IEkgaGF2ZSBsYWNrcyB0aGUgbmVlZGVkIGV4dGVuc2lvbnMpLiBBbGwgc2Vl
bXMKdG8gd29yaywgYnV0IEkgZG8gd29uZGVyIGlmIHdlIGRpZCBub3QgZW5hYmxlIHRoZXNlIGZv
ciBhIHJlYXNvbiBvciB0aGlzCmp1c3Qgc2xpcHBlZCB0aHJvdWdoLiBTbyBmYXIgaW4gdGhlIGNv
ZGUgSSBiZWxpZXZlIGV2ZXJ5dGhpbmcgaXMgaW4gcGxhY2UsCmFuZCBJIGhhdmVuJ3Qgc2VlbiBh
bnkgY29tbWl0IGluIHRoZSBnaXQgbG9nIHN0YXRpbmcgb3RoZXJ3aXNlLgoKWzFdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDIyMDA3NDQ0OS44NTI2LTEtbXNzb2xhQG1zc29sYS5j
b20vCgogRG9jdW1lbnRhdGlvbi9mZWF0dXJlcy9sb2NraW5nL2NtcHhjaGctbG9jYWwvYXJjaC1z
dXBwb3J0LnR4dCB8IDIgKy0KIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZmVhdHVy
ZXMvbG9ja2luZy9jbXB4Y2hnLWxvY2FsL2FyY2gtc3VwcG9ydC50eHQgYi9Eb2N1bWVudGF0aW9u
L2ZlYXR1cmVzL2xvY2tpbmcvY21weGNoZy1sb2NhbC9hcmNoLXN1cHBvcnQudHh0CmluZGV4IDJj
M2E0YjkxZjE2ZC4uMjhkNWZhOGMzYjRmIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2ZlYXR1
cmVzL2xvY2tpbmcvY21weGNoZy1sb2NhbC9hcmNoLXN1cHBvcnQudHh0CisrKyBiL0RvY3VtZW50
YXRpb24vZmVhdHVyZXMvbG9ja2luZy9jbXB4Y2hnLWxvY2FsL2FyY2gtc3VwcG9ydC50eHQKQEAg
LTIwLDcgKzIwLDcgQEAKICAgICB8ICAgIG9wZW5yaXNjOiB8IFRPRE8gfAogICAgIHwgICAgICBw
YXJpc2M6IHwgVE9ETyB8CiAgICAgfCAgICAgcG93ZXJwYzogfCBUT0RPIHwKLSAgICB8ICAgICAg
IHJpc2N2OiB8IFRPRE8gfAorICAgIHwgICAgICAgcmlzY3Y6IHwgIG9rICB8CiAgICAgfCAgICAg
ICAgczM5MDogfCAgb2sgIHwKICAgICB8ICAgICAgICAgIHNoOiB8IFRPRE8gfAogICAgIHwgICAg
ICAgc3BhcmM6IHwgVE9ETyB8CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNo
L3Jpc2N2L0tjb25maWcKaW5kZXggMTk1NWZjYzVlZmZkLi5iOGNhNTc5MmEzOTIgMTAwNjQ0Ci0t
LSBhL2FyY2gvcmlzY3YvS2NvbmZpZworKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKQEAgLTE1Miw2
ICsxNTIsOCBAQCBjb25maWcgUklTQ1YKIAlzZWxlY3QgSEFWRV9BUkNIX1VTRVJGQVVMVEZEX1dQ
IGlmIDY0QklUICYmIE1NVSAmJiBVU0VSRkFVTFRGRCAmJiBSSVNDVl9JU0FfU1ZSU1c2MFQ1OUIK
IAlzZWxlY3QgSEFWRV9BUkNIX1ZNQVBfU1RBQ0sgaWYgTU1VICYmIDY0QklUCiAJc2VsZWN0IEhB
VkVfQVNNX01PRFZFUlNJT05TCisJc2VsZWN0IEhBVkVfQ01QWENIR19ET1VCTEUgaWYgUklTQ1Zf
SVNBX1pBQ0FTICYmIFJJU0NWX0lTQV9aQUJIQQorCXNlbGVjdCBIQVZFX0NNUFhDSEdfTE9DQUwg
aWYgUklTQ1ZfSVNBX1pBQ0FTICYmIFJJU0NWX0lTQV9aQUJIQQogCXNlbGVjdCBIQVZFX0JVSUxE
VElNRV9NQ09VTlRfU09SVAogCXNlbGVjdCBIQVZFX0NPTlRFWFRfVFJBQ0tJTkdfVVNFUgogCXNl
bGVjdCBIQVZFX0RFQlVHX0tNRU1MRUFLCi0tCjIuNTQuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
