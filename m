Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12488C53216
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 07:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oOjfrCaJN6C+GxvgL/zwPJ49AHPgNdjB5RX8rlsFVn0=; b=XS4XwhPwrzxGz5
	E+Q+38sEa//GgbjrdJtfL4/ZqMQOqhPAeNzIesbiV2ampqPnBjEKpG0tlBL0YFpSDKXxmsTQ6K/RS
	xrccUaMdRHoPXNAlveaUrj+H0YAlSYVYShAgTZGcsjQE3NVN9I2Ne+LSSBEvhNaXwLdnVgWGFPmW1
	5OuvxC0CqNwEruofkQm5dp34yT62lU/J6AySITV9z+tqra6fTKm7o2SZNjZjhfS6C2+AlUMg0xz7n
	Y57c67nRX9Vik86gEIbXT2XyOiw6toJrsoREb9HBchryhm4P5d58VD0tCNUc5a4DuadQH3ZjlAMah
	ir04lfxH63HvxHw15TsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLCT-0000000DMYy-3LwO;
	Fri, 20 Feb 2026 07:45:21 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLCR-0000000DMWu-17yi
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 07:45:21 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fHMjM3FbTz9tSb;
	Fri, 20 Feb 2026 08:45:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mssola.com; s=MBO0001;
	t=1771573511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n4eMS6/Net3WxTG0smxuB9tYPb7LU4qNNJlcQmsg+TM=;
	b=b3IWYsKb/u5z6mIx1FGeMyLA5tLQYSoZK96te1TM8fd50AsZrT1a1ds2/aX4nLlUBCyf2v
	Wrbg+mE2W3gOpqSyuSWaQot3DwZejB6P15NU6d/ul6Ss2lj2rBjybjjwuNwXVfqyLfCaha
	bN+IL8HRrKqir+66+MrurphTWJuHcqsjCakzoYo+HprMob/4d6nXZ/6U5zsj8gP7jmk6So
	fcIA6Wn01JjwNydCM2CaMrqW2xOzsqyuHxKe9v9BYgJf8c5suSt4bO7D18mpjZrD2gdql8
	jTZzguHyVisvphpbdi/PlNqLP/8wNZ7GwAEBx2Kag9O5uUGNouKG6t1BObotbQ==
From: =?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mssola@mssola.com>
To: pjw@kernel.org
Cc: palmer@dabbelt.com,
	alex@ghiti.fr,
	corbet@lwn.net,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mssola@mssola.com>
Subject: [PATCH] riscv: enable HAVE_CMPXCHG_{DOUBLE,LOCAL}
Date: Fri, 20 Feb 2026 08:44:49 +0100
Message-ID: <20260220074449.8526-1-mssola@mssola.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_234519_535149_B202DFED 
X-CRM114-Status: GOOD (  12.25  )
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
ZmYtYnk6IE1pcXVlbCBTYWJhdMOpIFNvbMOgIDxtc3NvbGFAbXNzb2xhLmNvbT4KLS0tCkkgaGF2
ZSBidWlsdCB0aGlzIHBhdGNoIHdpdGggbXVsdGlwbGUgY29uZmlndXJhdGlvbnMgYW5kIHJhbiBp
dCB3aXRoIEtWTQoodGhlIFZpc2lvbkZpdmUyIGJvYXJkIHRoYXQgSSBoYXZlIGxhY2tzIHRoZSBu
ZWVkZWQgZXh0ZW5zaW9ucykuIEFsbCBzZWVtcwp0byB3b3JrLCBidXQgSSBkbyB3b25kZXIgaWYg
d2UgZGlkIG5vdCBlbmFibGUgdGhlc2UgZm9yIGEgcmVhc29uIG9yIHRoaXMKanVzdCBzbGlwcGVk
IHRocm91Z2guIFNvIGZhciBpbiB0aGUgY29kZSBJIGJlbGlldmUgZXZlcnl0aGluZyBpcyBpbiBw
bGFjZSwKYW5kIEkgaGF2ZW4ndCBzZWVuIGFueSBjb21taXQgaW4gdGhlIGdpdCBsb2cgc3RhdGlu
ZyBvdGhlcndpc2UuCgogRG9jdW1lbnRhdGlvbi9mZWF0dXJlcy9sb2NraW5nL2NtcHhjaGctbG9j
YWwvYXJjaC1zdXBwb3J0LnR4dCB8IDIgKy0KIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZmVhdHVyZXMvbG9ja2luZy9jbXB4Y2hnLWxvY2FsL2FyY2gtc3VwcG9ydC50eHQgYi9Eb2N1
bWVudGF0aW9uL2ZlYXR1cmVzL2xvY2tpbmcvY21weGNoZy1sb2NhbC9hcmNoLXN1cHBvcnQudHh0
CmluZGV4IDJjM2E0YjkxZjE2ZC4uMjhkNWZhOGMzYjRmIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL2ZlYXR1cmVzL2xvY2tpbmcvY21weGNoZy1sb2NhbC9hcmNoLXN1cHBvcnQudHh0CisrKyBi
L0RvY3VtZW50YXRpb24vZmVhdHVyZXMvbG9ja2luZy9jbXB4Y2hnLWxvY2FsL2FyY2gtc3VwcG9y
dC50eHQKQEAgLTIwLDcgKzIwLDcgQEAKICAgICB8ICAgIG9wZW5yaXNjOiB8IFRPRE8gfAogICAg
IHwgICAgICBwYXJpc2M6IHwgVE9ETyB8CiAgICAgfCAgICAgcG93ZXJwYzogfCBUT0RPIHwKLSAg
ICB8ICAgICAgIHJpc2N2OiB8IFRPRE8gfAorICAgIHwgICAgICAgcmlzY3Y6IHwgIG9rICB8CiAg
ICAgfCAgICAgICAgczM5MDogfCAgb2sgIHwKICAgICB8ICAgICAgICAgIHNoOiB8IFRPRE8gfAog
ICAgIHwgICAgICAgc3BhcmM6IHwgVE9ETyB8CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25m
aWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKaW5kZXggN2U3NmI2MzE2NDI1Li43YzY3MjZhOGQ3Mzgg
MTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZworKysgYi9hcmNoL3Jpc2N2L0tjb25maWcK
QEAgLTE1MSw2ICsxNTEsOCBAQCBjb25maWcgUklTQ1YKIAlzZWxlY3QgSEFWRV9BUkNIX1VTRVJG
QVVMVEZEX1dQIGlmIDY0QklUICYmIE1NVSAmJiBVU0VSRkFVTFRGRCAmJiBSSVNDVl9JU0FfU1ZS
U1c2MFQ1OUIKIAlzZWxlY3QgSEFWRV9BUkNIX1ZNQVBfU1RBQ0sgaWYgTU1VICYmIDY0QklUCiAJ
c2VsZWN0IEhBVkVfQVNNX01PRFZFUlNJT05TCisJc2VsZWN0IEhBVkVfQ01QWENIR19ET1VCTEUg
aWYgUklTQ1ZfSVNBX1pBQ0FTICYmIFJJU0NWX0lTQV9aQUJIQQorCXNlbGVjdCBIQVZFX0NNUFhD
SEdfTE9DQUwgaWYgUklTQ1ZfSVNBX1pBQ0FTICYmIFJJU0NWX0lTQV9aQUJIQQogCXNlbGVjdCBI
QVZFX0NPTlRFWFRfVFJBQ0tJTkdfVVNFUgogCXNlbGVjdCBIQVZFX0RFQlVHX0tNRU1MRUFLCiAJ
c2VsZWN0IEhBVkVfRE1BX0NPTlRJR1VPVVMgaWYgTU1VCi0tCjIuNTMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
