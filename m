Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FD3FF8875
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 00:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rv6jVEJGnlBPsib0eBrqELwViaotwvhEriOf+FFaXsg=; b=rrdQQwX2hVPya4
	oC2QShOcIsoFgG3KAeLXf8VwKciPTvm+1rpEP3f/VeQyVBPnWWfHaBpH77iWByfQe0G2+F3tlnY5X
	6RUuO+ikjP1oy3olKe2e3eA4KslyLVh2vvSemAaerk4d9QaIZCyrGG1AaFTRcdLVcKuOoNW2pFhlB
	8OgVN2yN9b/i/ZcrM/ZQiKOcMp40JdLvbWX9hUOFC1wmxaFLzeXwodmGKWFo9j/R3F3MD5kpK3PTf
	BVL+Xq7LNmVRne0GvyCDUdlRLTm59VlGM0Sa96NuowtWbfFTL4N7u0GFAGpSwnZUr0Lf8lvbgQct3
	v0v4llVbPkxP0Ef52P9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtEe-00000002gRG-226Y;
	Wed, 29 Apr 2026 00:57:04 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtEa-00000002gQl-38RQ
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 00:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=KMl/DXyKt0CwRNL4eOdNzXil5p4m9/51p
	alhvFtb1Jk=; b=lkwrEdAVJ3T33HJmbKZ8FbOsYr7gxijC3om73VoICJecU+gRD
	fx6AIw2ycIdUDBYNXaLyQ2bRPVd0KLT3Z3E6+lBXo6dRo4dVHC2lYtPvlTPqpab/
	Xc2PogI4t7kkANU6nXW37oGq8rMsEIW1Qjg16K1szgulRBnMlkPHaPJEvY=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUJ5V_Fp_B4DAA--.1799S2;
	Wed, 29 Apr 2026 08:57:29 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH v5 2/4] serial: 8250_dw: build Renesas RZN1 CPR value
 from DW_UART_CPR_* definitions
From: Jia Wang <wangjia@ultrarisc.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jia Wang <wangjia@ultrarisc.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 linux-serial <linux-serial@vger.kernel.org>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <afCS7GEG7gtyC7RH@ashevche-desk.local>
References: <20260428-ultrarisc-serial-v5-0-97de63b1e3eb@ultrarisc.com>
 <20260428-ultrarisc-serial-v5-2-97de63b1e3eb@ultrarisc.com>
 <afBhkbGLsuqUitOl@ashevche-desk.local>
 <23c80500-f2c1-0eb3-f640-00f7b108059b@linux.intel.com>
 <177736726936.2886867.7725295920724488690.b4-reply@b4>
 <afCS7GEG7gtyC7RH@ashevche-desk.local>
Date: Wed, 29 Apr 2026 08:56:45 +0800
Message-Id: <177742420562.3222151.9689419292413018986.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777424206; l=1149;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=4czbswj4ht+A87lTkdcd08crGu9AEPernCdFv5ThrwI=;
 b=aleoixAjfRCIOq4JvlJdssuNfQRSsaLUgal5WrjqOTgcvlwjcpvsyS6aVVeeZSRyDQLO2GjPq
 FHF8Ra0GbLxDxcUS8OtHSaYRbFpqmV2H9q6SyPpx0Vc/piOJ0/gNUHC
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwA3cUJ5V_Fp_B4DAA--.1799S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XrykAF4fZr1rur18uF4fAFb_yoWDZrX_Ar
	W0kr4kua1kC39Fvw4DK3sIkws0krW7Zw4YqryrWF12kr9rX3s8Xwn5uasYgFnav3yIkr92
	93WYqryF9F4qgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAKEWnti78ACwA6sb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_175701_155841_773C8427 
X-CRM114-Status: GOOD (  12.37  )
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

T24gMjAyNi0wNC0yOCAxMzo1OCArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IE9uIFR1
ZSwgQXByIDI4LCAyMDI2IGF0IDA1OjA3OjQ5UE0gKzA4MDAsIEppYSBXYW5nIHdyb3RlOgo+ID4g
T24gMjAyNi0wNC0yOCAxMTo0MSArMDMwMCwgSWxwbyBKw6RydmluZW4gd3JvdGU6Cj4gPiA+IE9u
IFR1ZSwgMjggQXByIDIwMjYsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiA+ID4gPiBPbiBUdWUs
IEFwciAyOCwgMjAyNiBhdCAwMToyNjoyN1BNICswODAwLCBKaWEgV2FuZyB3cm90ZToKPiAKPiAu
Li4KPiAKPiA+ID4gI2RlZmluZSBEV19VQVJUX0NQUl9GSUZPX01PREVfRlJPTV9TSVpFKHNpemUp
CQkJXAo+ID4gPiAoewkJCQkJCQkJXAo+ID4gPiAJdHlwZW9mIChzaXplKSBfX3NpemUgPSBzaXpl
OwkJCQlcCj4gPiA+IAkJCQkJCQkJXAo+ID4gPiAJc3RhdGljX2Fzc2VydChJU19BTElHTkVEKChf
X3NpemUpLCAxNikpOwkJXAo+ID4gPiAJc3RhdGljX2Fzc2VydChfX3NpemUgPD0gRFdfVUFSVF9D
UFJfRklGT19NT0RFX01BWCk7CVwKPiA+ID4gCQkJCQkJCQlcCj4gPiA+IAlGSUVMRF9QUkVQX0NP
TlNUKERXX1VBUlRfQ1BSX0ZJRk9fTU9ERSwgX19zaXplIC8gMTYpOwlcCj4gPiA+IH0pCj4gPiAK
PiA+IFRoYW5rcy4gSSB0cmllZCB0aGF0IGFwcHJvYWNoLCBidXQgdGhlIHN0YXRlbWVudC1leHBy
ZXNzaW9uIGZvcm0gZG9lcwo+ID4gbm90IHdvcmsgaW4gdGhpcyBjYXNlIGJlY2F1c2UgdGhlIGhl
bHBlciBpcyB1c2VkIGluIHN0YXRpYyBpbml0aWFsaXplcnMuCj4gPiBTbyBJJ2xsIGtlZXAgaXQg
YXMgYSBwbGFpbiBleHByZXNzaW9uIG1hY3JvIGZvciBub3csIGFuZCBqdXN0IHJld29yayBpdAo+
ID4gaW50byBhIGNsZWFuZXIgbXVsdGktbGluZSBmb3JtLgo+IAo+IFN0aWxsIHlvdSBjYW4gbW92
ZSBGSUVMRF9QUkVQX0NPTlNUKCkgaW50byBpdC4KPgoKUmlnaHQsIEknbGwgbW92ZSBGSUVMRF9Q
UkVQX0NPTlNUKCkgaW4uIEJ5IHRoZSB3YXksIGRvZXMgeW91ciBSZXZpZXdlZC1ieQpzdGlsbCBo
b2xkPwogCj4gLS0gCj4gV2l0aCBCZXN0IFJlZ2FyZHMsCj4gQW5keSBTaGV2Y2hlbmtvCj4gCj4g
Cj4gCgpCZXN0IFJlZ2FyZHMsCkppYSBXYW5nCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
