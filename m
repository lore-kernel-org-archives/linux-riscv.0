Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3390C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 17 May 2022 11:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vn5pieWYvhYXuc62dxONSyFjCQzxkqZK1gLni07Rky8=; b=Jjnzdusq045751
	/gQKEcYe5yL/RFOcjNmdgAQ++vt1KQd0MXUWWzkw8onF17IpVqmLr2b9Tg9yHgEk/4sZOP+fTZAw9
	NtfGHIg/lEIHw5gjitcYEc30ju9FOgCZT8nr4qfnW7AHw3uhUVEAYIPf1N3exWnVUEzJFZgr6FAjS
	pfxyheV+0MGhbBLntcBrS9xLee4sXo3MP4y62RM7VlDakkh3Yw3ac5GPYgtG9Nw0VNsC/p7QdTviU
	AuCF/i1Juhml8deGMdxgBBzOuonvFJG1IgizQIIK2lefW2tqmGKYoPvp9e23HLthjrt6s5+C4kH1E
	S0h8k0pQUW3mEk8G71Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqv45-00DHcx-Nn; Tue, 17 May 2022 11:08:33 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqv3q-00DHVG-NT
 for linux-riscv@lists.infradead.org; Tue, 17 May 2022 11:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652785698; x=1684321698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3RnQRuR6bhTHb3WuNEk9N0DsLlzhv/5aX1wkEj3xq6s=;
 b=DGmrsPiS7fkJXO49MlbQIamTNA4ChHVj4iEoFbzYRoTQKoAA8h/pG+0a
 SDj1JAsD06QX5EChO3g50Nloor/loGFtjq4PT0wLxFXq+faxGmVrds6KR
 3iiEdxxrEftfti4xmzz0cMDgfzk+VNgUwSjlGZP9NVjS0buB/WddREx8A
 MGarZdX+b3gK1E0R1Zp/FkHZxWfX6Orvyk9qflkPGJJYHNzeGdrMzb80q
 zSyuOvXMWUfcYUskBELUp9o0arDzPubobwT1i0HJO6UIexbwTP+XjGgf1
 q6JQrk8HXYx+UCxVBSa8rloO5O4DGGyuhoZeLkfyNdkKTOZPv8VNSwlsn g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="251658937"
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; d="scan'208";a="251658937"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 04:08:17 -0700
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; d="scan'208";a="568831099"
Received: from mtarral-mobl.ger.corp.intel.com (HELO
 ijarvine-MOBL2.ger.corp.intel.com) ([10.252.52.88])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 04:08:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 6/9] serial: sifive: Sanitize CSIZE and c_iflag
Date: Tue, 17 May 2022 14:07:34 +0300
Message-Id: <20220517110737.37148-7-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220517110737.37148-1-ilpo.jarvinen@linux.intel.com>
References: <20220517110737.37148-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_040818_829114_6341BFCE 
X-CRM114-Status: GOOD (  10.13  )
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
