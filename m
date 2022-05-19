Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC51C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 19 May 2022 08:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vn5pieWYvhYXuc62dxONSyFjCQzxkqZK1gLni07Rky8=; b=iZ/Wj4XkSghI+c
	vw/Q5cnjhY/rUvutXwxpOtAtO6bG3vpXgdC8f2gfeam3sI5cAy7wx/FvTJUAmb5WrDLda8nX835Gp
	mPcHEJ9b4Xc65MMSDXoBRc43FG2xrhapQUQJ1FPgkJjxsPYjY9buMPvnbTlxA7u/TUoQR7HgFhiAU
	TvliEI4cTWHGeHqLYOEtDBn8g6iaz8FaTXgSrvofZDOKL+3CYGXftEIOMKZXOBpdTvMfwWKNAkTfM
	Evr9nHTiGy17WvRQ0BcuF+F+sSX4PA0eHw5CJBse2ep09F0ea6qvEhbzM/JuRfD9TUuBIVys/aPOu
	VzTmGMu8Eys7lw5Y5jaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrbOu-005mE0-RE; Thu, 19 May 2022 08:20:52 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrbMs-005krz-EK
 for linux-riscv@lists.infradead.org; Thu, 19 May 2022 08:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652948326; x=1684484326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3RnQRuR6bhTHb3WuNEk9N0DsLlzhv/5aX1wkEj3xq6s=;
 b=Pe38nKUvqUGa9O8Grqny5xBwz4UWALdJa40640aobUI9YIvoKIHgPKVq
 t+yWxdFQwUmZHDt0sOLvrbYkbCTbT9jQqKtitOLKqI8zk/QTU24RpN4/j
 LOEehbPL3rGqTu3Zy07lhswmXjNKjEBDQCrAzQxnl01OhBSpkn5NZ1fXS
 49T2Y64+sjCmyMZSJS3U58A4mQlpMdp7gFjRLX7tUj4r2jN40vR+qu9bH
 fOpAtX6XcdNhXQt8US/1MJpHuImdGZ3jLeAOQdHSUbUeetuPmZvfDgqUK
 OvhUIR3oOkfZheGE9yWCDrLfx08Akd3kjxLg0k0bpOIGgkYwPF2SCNFGT Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="335135288"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="335135288"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 01:18:42 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="598431479"
Received: from ivanovbx-mobl1.ger.corp.intel.com (HELO
 ijarvine-MOBL2.ger.corp.intel.com) ([10.249.33.234])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 01:18:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 6/9] serial: sifive: Sanitize CSIZE and c_iflag
Date: Thu, 19 May 2022 11:18:05 +0300
Message-Id: <20220519081808.3776-7-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519081808.3776-1-ilpo.jarvinen@linux.intel.com>
References: <20220519081808.3776-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_011846_611752_423074AC 
X-CRM114-Status: GOOD (  10.55  )
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

T25seSBDUzggaXMgc3VwcG9ydGVkIGJ1dCBDU0laRSB3YXMgbm90IHNhbml0aXplZCB0byBDUzgu
CgpTZXQgQ1NJWkUgY29ycmVjdGx5IHNvIHRoYXQgdXNlcnNwYWNlIGtub3dzIHRoZSBlZmZlY3Rp
dmUgdmFsdWUuCkluY29ycmVjdCBDU0laRSBhbHNvIHJlc3VsdHMgaW4gbWlzY2FsY3VsYXRpb24g
b2YgdGhlIGZyYW1lIGJpdHMgaW4KdHR5X2dldF9jaGFyX3NpemUoKSBvciBpbiBpdHMgcHJlZGVj
ZXNzb3Igd2hlcmUgdGhlIHJvdWdobHkgdGhlIHNhbWUKY29kZSBpcyBkaXJlY3RseSB3aXRoaW4g
dWFydF91cGRhdGVfdGltZW91dCgpLgoKU2ltaWxhcmx5LCBJTlBDSywgUEFSTVJLLCBhbmQgQlJL
SU5UIGFyZSByZXBvcnRlZCB0ZXh0dWFsbHkgdW5zdXBwb3J0ZWQKYnV0IHdlcmUgbm90IGNsZWFy
ZWQgaW4gdGVybWlvcyBjX2lmbGFnIHdoaWNoIGlzIHRoZSBtYWNoaW5lLXJlYWRhYmxlCmZvcm1h
dC4KCkNjOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+CkZpeGVzOiA0
NWMwNTRkMDgxNWIgKHR0eTogc2VyaWFsOiBhZGQgZHJpdmVyIGZvciB0aGUgU2lGaXZlIFVBUlQp
ClNpZ25lZC1vZmYtYnk6IElscG8gSsOkcnZpbmVuIDxpbHBvLmphcnZpbmVuQGxpbnV4LmludGVs
LmNvbT4KLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvc2lmaXZlLmMgfCA2ICsrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdHR5L3NlcmlhbC9zaWZpdmUuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zaWZpdmUuYwpp
bmRleCBmNWFjMTRjMzg0YzQuLmMxYzBmYjljMTgyMiAxMDA2NDQKLS0tIGEvZHJpdmVycy90dHkv
c2VyaWFsL3NpZml2ZS5jCisrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zaWZpdmUuYwpAQCAtNjY2
LDEyICs2NjYsMTYgQEAgc3RhdGljIHZvaWQgc2lmaXZlX3NlcmlhbF9zZXRfdGVybWlvcyhzdHJ1
Y3QgdWFydF9wb3J0ICpwb3J0LAogCWludCByYXRlOwogCWNoYXIgbnN0b3A7CiAKLQlpZiAoKHRl
cm1pb3MtPmNfY2ZsYWcgJiBDU0laRSkgIT0gQ1M4KQorCWlmICgodGVybWlvcy0+Y19jZmxhZyAm
IENTSVpFKSAhPSBDUzgpIHsKIAkJZGV2X2Vycl9vbmNlKHNzcC0+cG9ydC5kZXYsICJvbmx5IDgt
Yml0IHdvcmRzIHN1cHBvcnRlZFxuIik7CisJCXRlcm1pb3MtPmNfY2ZsYWcgJj0gfkNTSVpFOwor
CQl0ZXJtaW9zLT5jX2NmbGFnIHw9IENTODsKKwl9CiAJaWYgKHRlcm1pb3MtPmNfaWZsYWcgJiAo
SU5QQ0sgfCBQQVJNUkspKQogCQlkZXZfZXJyX29uY2Uoc3NwLT5wb3J0LmRldiwgInBhcml0eSBj
aGVja2luZyBub3Qgc3VwcG9ydGVkXG4iKTsKIAlpZiAodGVybWlvcy0+Y19pZmxhZyAmIEJSS0lO
VCkKIAkJZGV2X2Vycl9vbmNlKHNzcC0+cG9ydC5kZXYsICJCUkVBSyBkZXRlY3Rpb24gbm90IHN1
cHBvcnRlZFxuIik7CisJdGVybWlvcy0+Y19pZmxhZyAmPSB+KElOUENLfFBBUk1SS3xCUktJTlQp
OwogCiAJLyogU2V0IG51bWJlciBvZiBzdG9wIGJpdHMgKi8KIAluc3RvcCA9ICh0ZXJtaW9zLT5j
X2NmbGFnICYgQ1NUT1BCKSA/IDIgOiAxOwotLSAKMi4zMC4yCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
