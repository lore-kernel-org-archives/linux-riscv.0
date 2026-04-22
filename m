Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C142FF9B5F5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2026 09:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f2ekPpN6Cr7dHeDRoOigT9RSrHZV9ISM10AUpKc7XmE=; b=XdDOEUKEHd4RQw
	Rfeze4GGuOAbCU4iB0AUc0UKzC44Jg760oglmjPdtJ2FzsRdvvAaEu0aJD3U2cIy58P+oYPtMNq6c
	kRsZYBk0Ha18MXU3v4yAdguzhEP9/fTzVNo+erO2lfOEewQJpy9ifbTQPj9kFIUOt1mxCjMnGyzFa
	GKFJPhWf6+ylCygY2C5t4mJNWg4BpT9Hc6GxTnGHE/pBMw0y8gQCY20COtJiM10CYTH869F40Aj7s
	RScS7vxwOj63SxY8+N/JFK186gLmEPEHSym3dOHIkmoShNn8PjsgEEH8qJkiX8wn1Un93fsnowW1h
	reX7QYzZLlmlL9+hOj1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUFH-00000009tYY-2bts;
	Wed, 22 Apr 2026 09:51:47 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUFF-00000009tXg-0q7G
	for linux-riscv@lists.infradead.org;
	Wed, 22 Apr 2026 09:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=EtRd6D/CF3RVrZvVz0/gBH672srYMoqzc
	SaYXBbAJkg=; b=Spj/0Nucf/j0sVVZfIeJZ3xs3PIrYUzncceQdrl5hBQ+B9xBB
	Po9SDW+Fg8HEjsOGWaro4fEEI1f0zVqsEmaWdimKBX3hzF2cehSc0uvYH2CFIRlE
	P8VhRjZHUkRg9fvh56XisMJnfmiGAVj9CFIRvWmBaRt2/wmOMqdgy8zuwo=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYUJUmuhptqQCAA--.1546S2;
	Wed, 22 Apr 2026 17:52:21 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] serial: 8250_dw: Use a fixed CPR value for
 UltraRISC DP1000 UART
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
In-Reply-To: <aeiYLLXTprlzmcpF@ashevche-desk.local>
References: <20260421-ultrarisc-serial-v3-0-3d7f09c2420e@ultrarisc.com>
 <20260421-ultrarisc-serial-v3-2-3d7f09c2420e@ultrarisc.com>
 <979c9543-3ea0-25de-f97b-9c6d2fa3ac61@linux.intel.com>
 <177681947637.2697678.10937675549830278979.b4-reply@b4>
 <aeiKsv3bFPJ94InI@ashevche-desk.local>
 <aeiK-350Uozq3pVa@ashevche-desk.local>
 <177685078199.768471.14774992461649696859.b4-reply@b4>
 <aeiYLLXTprlzmcpF@ashevche-desk.local>
Date: Wed, 22 Apr 2026 17:51:36 +0800
Message-Id: <177685149611.768471.11403282263671013638.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776851496; l=1505;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=PP6AHgmpH1XCDhT3rzVmkbEs9J97prw7sKGs06DkRFY=;
 b=0TzUGSw04gbT4BOOvnfyRG1x4X1EQrhcNfVgdZaR5WDLTaZB9xepnsQv0eOTTtyZt+Y7wJhXt
 RC/ltJox1UuB9PXTESDOnFrO7wFyX1XpHKBJ/TKVTvl95oaQiK6u/li
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwAnYUJUmuhptqQCAA--.1546S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyxXr1rtw4rAr1rArWDJwb_yoW8GrWUpa
	yrJFW3Ka9rKrnayrnFkF1DAF4Fq3Z3Ka4UXw1qgry7t3Wqyr1YqrWvqrW5uF9rWw15Gw4I
	vw48X3y3W3WUAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAFEWnoRb4ACQASs0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_025145_668844_12039591 
X-CRM114-Status: GOOD (  20.95  )
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

T24gMjAyNi0wNC0yMiAxMjo0MyArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IE9uIFdl
ZCwgQXByIDIyLCAyMDI2IGF0IDA1OjM5OjQxUE0gKzA4MDAsIEppYSBXYW5nIHdyb3RlOgo+ID4g
T24gMjAyNi0wNC0yMiAxMTo0NiArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+ID4gPiBP
biBXZWQsIEFwciAyMiwgMjAyNiBhdCAxMTo0NTo0NEFNICswMzAwLCBBbmR5IFNoZXZjaGVua28g
d3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBBcHIgMjIsIDIwMjYgYXQgMDg6NTc6NTZBTSArMDgwMCwg
SmlhIFdhbmcgd3JvdGU6Cj4gCj4gLi4uCj4gCj4gPiA+ID4gPiBKdXN0IHRvIGNvbmZpcm06IHNp
bmNlIHlvdSBtZW50aW9uZWQgdGhhdCB0aGUgcHJlcGFyYXRvcnkgcGF0Y2ggbW92aW5nCj4gPiA+
ID4gPiB0aGUgRFdfVUFSVCByZWdpc3RlciBkZWZpbmVzIGlzIGFscmVhZHkgaW4gcGxhY2UsIEkg
ZG9uJ3QgbmVlZCB0byBtb3ZlCj4gPiA+ID4gPiB0aGVtIGFnYWluLCBjb3JyZWN0Pwo+ID4gPiA+
ID4gCj4gPiA+ID4gPiBJIHdpbGwgdXBkYXRlIG15IHBhdGNoIHRvIHVzZSB0aGUgRFdfVUFSVF9D
UFJfKiBtYWNyb3MgYW5kCj4gPiA+ID4gPiBGSUVMRF9QUkVQX0NPTlNUKCkgYWNjb3JkaW5nbHks
IGFuZCBJ4oCZbSBoYXBweSB0byBhZGQgYSBzZXBhcmF0ZSBwYXRjaCBpbgo+ID4gPiA+ID4gdGhl
IG5leHQgcmV2aXNpb24gdG8gY29udmVydCB0aGUgUmVuZXNhcyAuY3ByX3ZhbHVlIGFzIHdlbGwu
Cj4gPiA+ID4gCj4gPiA+ID4gTXkgdW5kZXJzdGFuZGluZyB0aGF0IHlvdSB3YW50IHRvIHNlbmQg
YSBwYXRjaCBzZXJpZXMgb2YgMyBwYXRjaGVzOgo+ID4gPiA+IC0gbW92aW5nIERXX1VBUlRfQ1BS
XyogdmFsdWVzIGZyb20gQy1maWxlIHRvIGgtZmlsZQo+ID4gPiA+IC0gbW9kaWZ5IGV4aXN0aW5n
IFJlbmVzYXMgY2FzZQo+ID4gPiAKPiA+ID4gLSBEVCBiaW5kaW5nIGZvciBuZXcgSFcgKHBhdGNo
IDEgb2YgdGhpcyBzZXJpZXMpCj4gPiA+IAo+ID4gPiA+IC0gYWRkIHN1cHBvcnQgZm9yIHlvdXIg
SFcgKHRoaXMgcGF0Y2ggaW4gdXBkYXRlZCBmb3JtKQo+ID4gCj4gPiBZZXMsIEkgd2lsbCBmb2xs
b3cgdGhpcyBvcmRlciBhbmQgcmVzZW5kIHRoZSBzZXJpZXMgaW4gdjQuCj4gCj4gVGhhbmtzLCBh
bmQgc2luY2UgSWxwbyBtZW50aW9uZWQsIG1vdmUgYWxsIERXX1VBUlRfKiByZWdpc3RlciBvZmZz
ZXRzL2JpdGZpZWxkcwo+IHRvIHRoZSBoZWFkZXIgZmlsZSAoaW4gcGF0Y2ggMSBvZiBhIG5ldyBz
ZXJpZXMpLgo+CgpUaGFua3MsIGdvdCBpdC4gSeKAmWxsIGZvbGxvdyB0aGlzIGluIHY0LgogCj4g
PiA+IEFuZCBJIGZvcmdvdCB0aGF0IHlvdSBoYXZlIGEgRFQgYmluZ2luZyBvbmUuLi4gU28gNCBw
YXRjaGVzIGFmdGVyIGFsbC4KPiAKPiAtLSAKPiBXaXRoIEJlc3QgUmVnYXJkcywKPiBBbmR5IFNo
ZXZjaGVua28KPiAKPiAKPiAKClJlZ2FyZHMsCkppYSBXYW5nCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
