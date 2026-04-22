Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47A3F9B600
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2026 09:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hB2fmHCg6tOhhDlazfylMzVucCpF5hNWG/ITxo3loZ8=; b=ijJCJ10+lDQbgm
	SQmGultOWhM9bc0/O6c99UDQ1MxxidwEG0UtE0h+M8A53B1YpKa3ZUoZAcqNRBpijd93vqpeyPQlG
	LJrY0c0Rv8fYsuPUDCrwoiIV649qGGS1qJHsFmX/xBkbXx8J5dZwTkoTDRxHHXkj+WkSpXjUjl9Mh
	InxfCvrnQ9PztlsLz+aXOtor6GTpxP61mjThNDxBRBNDcXL/Mq9uMgAO7ROUbGT+r24CuwkCNL7Qf
	XvIZ8TsNhzkeZVUMmlRAGkJDDfrfSF2VdqJ4oUBVjRaUnF1X8FLvMuyBUhfuAwXT2uCF0Rj0V65YE
	ujGMj8dG/jcbjiXVOOwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFU4B-00000009s8w-2Qh0;
	Wed, 22 Apr 2026 09:40:19 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFU47-00000009s8G-2CbE
	for linux-riscv@lists.infradead.org;
	Wed, 22 Apr 2026 09:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=dmP7ZaHB64U7ys4IfwlhMNPCsnVDYMS74
	p08LUPcoio=; b=KKk7NyhqNjknXtzgoAC3hCikoq5w1lT7q2PD0DfZYyAHcpZe1
	lqo3inwFanPlb8S6AUJ3gVoB5b7Ooq4cDLQ5vcr1PtOarEZk87lOwc6Nh+nAa4W+
	HOSS15aNC4Xbx2T/FERNjPOu122Zkw3WksRQ6iFgjqtYLnteEyz9hW9w9Q=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUKKl+hpkqQCAA--.1625S2;
	Wed, 22 Apr 2026 17:40:27 +0800 (CST)
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
In-Reply-To: <aeiK-350Uozq3pVa@ashevche-desk.local>
References: <20260421-ultrarisc-serial-v3-0-3d7f09c2420e@ultrarisc.com>
 <20260421-ultrarisc-serial-v3-2-3d7f09c2420e@ultrarisc.com>
 <979c9543-3ea0-25de-f97b-9c6d2fa3ac61@linux.intel.com>
 <177681947637.2697678.10937675549830278979.b4-reply@b4>
 <aeiKsv3bFPJ94InI@ashevche-desk.local>
 <aeiK-350Uozq3pVa@ashevche-desk.local>
Date: Wed, 22 Apr 2026 17:39:41 +0800
Message-Id: <177685078199.768471.14774992461649696859.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776850782; l=1125;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=/sSF/6KnPX46G3W0/83UVoWHCgXMVyaJn54X61E/PdA=;
 b=+p7a/VWJK3ydtMjmUT+oU0zV7nW0LXW4uCDTVsx9FgpNUQMDN7xHWqRV7of9SccuSBUHcZMlO
 yVTLt6YKuolCRIAgsU+/bkJkqGpCxgY+7FvVxzS3uxm/FYp1l/uzGXb
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwA3cUKKl+hpkqQCAA--.1625S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtFyUtw45WFWDKF4kAFWxXrb_yoWDCrgE9F
	WUua9293W8Aa9rX3Z7Aw13uFZ0vay0vr15J3s5XFnFyr1Utr98Wws8Cw13Za4Fyry8KFsx
	Kr4Fgryrtw12kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAFEWnoRb4ACQALst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_024016_023167_ED1DBF09 
X-CRM114-Status: GOOD (  18.81  )
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

T24gMjAyNi0wNC0yMiAxMTo0NiArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IE9uIFdl
ZCwgQXByIDIyLCAyMDI2IGF0IDExOjQ1OjQ0QU0gKzAzMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90
ZToKPiA+IE9uIFdlZCwgQXByIDIyLCAyMDI2IGF0IDA4OjU3OjU2QU0gKzA4MDAsIEppYSBXYW5n
IHdyb3RlOgo+IAo+IC4uLgo+IAo+ID4gPiBKdXN0IHRvIGNvbmZpcm06IHNpbmNlIHlvdSBtZW50
aW9uZWQgdGhhdCB0aGUgcHJlcGFyYXRvcnkgcGF0Y2ggbW92aW5nCj4gPiA+IHRoZSBEV19VQVJU
IHJlZ2lzdGVyIGRlZmluZXMgaXMgYWxyZWFkeSBpbiBwbGFjZSwgSSBkb24ndCBuZWVkIHRvIG1v
dmUKPiA+ID4gdGhlbSBhZ2FpbiwgY29ycmVjdD8KPiA+ID4gCj4gPiA+IEkgd2lsbCB1cGRhdGUg
bXkgcGF0Y2ggdG8gdXNlIHRoZSBEV19VQVJUX0NQUl8qIG1hY3JvcyBhbmQKPiA+ID4gRklFTERf
UFJFUF9DT05TVCgpIGFjY29yZGluZ2x5LCBhbmQgSeKAmW0gaGFwcHkgdG8gYWRkIGEgc2VwYXJh
dGUgcGF0Y2ggaW4KPiA+ID4gdGhlIG5leHQgcmV2aXNpb24gdG8gY29udmVydCB0aGUgUmVuZXNh
cyAuY3ByX3ZhbHVlIGFzIHdlbGwuCj4gPiAKPiA+IE15IHVuZGVyc3RhbmRpbmcgdGhhdCB5b3Ug
d2FudCB0byBzZW5kIGEgcGF0Y2ggc2VyaWVzIG9mIDMgcGF0Y2hlczoKPiA+IC0gbW92aW5nIERX
X1VBUlRfQ1BSXyogdmFsdWVzIGZyb20gQy1maWxlIHRvIGgtZmlsZQo+ID4gLSBtb2RpZnkgZXhp
c3RpbmcgUmVuZXNhcyBjYXNlCj4gCj4gLSBEVCBiaW5kaW5nIGZvciBuZXcgSFcgKHBhdGNoIDEg
b2YgdGhpcyBzZXJpZXMpCj4gCj4gPiAtIGFkZCBzdXBwb3J0IGZvciB5b3VyIEhXICh0aGlzIHBh
dGNoIGluIHVwZGF0ZWQgZm9ybSkKPgoKWWVzLCBJIHdpbGwgZm9sbG93IHRoaXMgb3JkZXIgYW5k
IHJlc2VuZCB0aGUgc2VyaWVzIGluIHY0LgogCj4gQW5kIEkgZm9yZ290IHRoYXQgeW91IGhhdmUg
YSBEVCBiaW5naW5nIG9uZS4uLiBTbyA0IHBhdGNoZXMgYWZ0ZXIgYWxsLgo+IAo+IC0tIAo+IFdp
dGggQmVzdCBSZWdhcmRzLAo+IEFuZHkgU2hldmNoZW5rbwo+IAo+IAo+CgpSZWdhcmRzLApKaWEg
V2FuZyAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
