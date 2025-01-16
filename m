Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AE2C02180
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=94or+juqvBw10TGTifXINgnB9b/O1lFr3oDRpC1rDMI=; b=O7edyDRhipJ7SS
	iMs/SEz298T87JsQUfgdCg22M4vp/G8I6wUMjOf6XpxIUXStS4yYVdMKImYKAuj9F8W4G76YDZl/0
	+QKwi4FlRQdqPoBvN7QKvD0T687MnNcksZuSiCGBeYlWuW7rfyxZifklhe0T/8llTF7EJr8rqwjWv
	I3BhWxiFR3GDu0gqfFewka3/ZVJFCp6VCQsCwz/0BJH67iCOJ1KJFJzAyrBthUGW/ivN3wQ770Cdg
	+pABn0TOeEnO5g7RzAK97E5dudByiJEdLv0JvqmGN3Gxv4Y1HRl3rOjLB1SVRvVxAkjL3u06KA1mR
	FQgFiBYSLGRJpBKO7qPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLb8-0000000EGwY-37L6;
	Thu, 16 Jan 2025 08:51:30 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLb6-0000000EGw6-27S4
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 08:51:29 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-385dece873cso348460f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jan 2025 00:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1737017486; x=1737622286; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vdYGACSqmD06pBhAeXOqTAZ8uvEoU3CDJANNyc9PH5I=;
        b=gYtjkrNnmmdVUeKXKeOZbsPIY9ZieJBJ/Ut764HCx+LdeYw2FeJNXhOwOxTVfXHyaS
         amcLP3qccbvE/7jwbdH0+sCsw9MS9SumuBC+VyirS1PPAX8yMok433W4BqTcma29HOxV
         ULn0/6RP7QfByb8GuxTAMsOU5UK5TI43aD8Mw/wOfsA0vhzr/nee6SqWeqyrih1Xw2QC
         xka6WJxFMEkJKlLurbvr5ppIukxLGbOGO6YommjciL47C/sUHxbOsMvnoJ8brRU1mmw0
         SsXgsBt7fYdbrsqcC+p9n2XCkjAEpUU1lgcPBPOeQOOevJtPmwpy7ARfKIAgN47A+C7m
         NocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737017486; x=1737622286;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vdYGACSqmD06pBhAeXOqTAZ8uvEoU3CDJANNyc9PH5I=;
        b=is0ZZhIVGEiPKMroM7wN/uX0HhzSZsDMG6ZA6R4g/3I67IhmhlapNiPHa9iIrIgzap
         xcIGsfUD6vUifDRmuv3AlVJjWJE2upMNqXmu/ED3L3leRLIeu5wi1yfaLoPWKlsMli79
         2/Y7HecwgJtMGO0ZUoIIi3vJfDB825srPeCIVtGJJ02s/KO1j8t4rnDysAusYz2OihSi
         GWOXQa8RHA8/oZVLt1XqjdqmE7CRt1I/F4Fz4nJXMjjD1qGyhPlTBe2V7dpAU6Qu4lBS
         l64puI/vbR0Fo52VpVgN+ZThUsKPA/BrCmMxxXDnQZu66ITlIOkNVA9F2UfKcW1YBUJk
         TJHg==
X-Gm-Message-State: AOJu0YwPLg/l/JAEwRKgFdSE15TyvzjR5p+qF5gpiCKoU8LUfyJtpMWC
	p4Sa19IbRODQ/xIEw/3DqTgPJFGNEkWNjHksG3REtRDfnHED2gL5PTWLlHQ7vdQ=
X-Gm-Gg: ASbGncsro3CuNscVCOZatKxkKZv1+NY4iXrrUWA1/1c/8b3Tkzj2LPhXcMyERivciu8
	q6CN9WyzIM0uamUylO2l0KgqjrmpeiGUaXoDOp6BjSoWviwZBr7KRVShCE2PSUDlNTkbViNxaJM
	OC5apx81X69EfNTmzvYtr9w85XpidLBnZ+vU1sCBxMBExJL72LRvMYQQKSVgbZJ3SLDkIkUNUtv
	CnnRFac8jHPJc8OyYnzJHRG6BSJ2AFJMln0Bo/WEkqoXnj+enZSu8Nb7sMaAMLP6III3NhHzWX8
	sOTmp8bjP7MWcFlBliuyj7FyWF7LU09TMu8CBnDFOA==
X-Google-Smtp-Source: AGHT+IEsbulHh7PZVHSAEnmDh38IVvfobmbwOpTAusRtk5MN3iwIfCnGsZ4ArTaC23pmkWtqt4FHJQ==
X-Received: by 2002:a5d:47c4:0:b0:385:ed16:c8b with SMTP id ffacd0b85a97d-38a87309d21mr11955948f8f.23.1737017486382;
        Thu, 16 Jan 2025 00:51:26 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c3428sm19402764f8f.87.2025.01.16.00.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 00:51:25 -0800 (PST)
Date: Thu, 16 Jan 2025 09:51:25 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Milan =?utf-8?B?xJBva2nEhw==?= <milandjokic1995@gmail.com>
Cc: linux-riscv@lists.infradead.org, jgross@suse.com, 
	aou@eecs.berkeley.edu, Milan.Djokic@rt-rk.com, rafael.j.wysocki@intel.com, 
	linux-kernel@vger.kernel.org, oleksandr_tyshchenko@epam.com, iommu@lists.linux.dev, 
	sstabellini@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	xen-devel@lists.xenproject.org, Slavisa.Petrovic@rt-rk.com, takakura@valinux.co.jp
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-V
Message-ID: <20250116-aa9eadde9279e66dbc01c705@orel>
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
 <20250114-316084c962eb867c0b681043@orel>
 <CAKp59VFkW8F2xHsgAxiw138ZrpQJL8R5cTkF8f9vY40iEoRbWg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKp59VFkW8F2xHsgAxiw138ZrpQJL8R5cTkF8f9vY40iEoRbWg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_005128_548857_581980D5 
X-CRM114-Status: GOOD (  21.51  )
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

T24gV2VkLCBKYW4gMTUsIDIwMjUgYXQgMDg6MDQ6MDVQTSArMDEwMCwgTWlsYW4gxJBva2nEhyB3
cm90ZToKPiBIZWxsbyBBbmRyZXcsCj4gCj4gT24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgNzoxOOKA
r1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+
IE9uIFR1ZSwgSmFuIDE0LCAyMDI1IGF0IDA1OjA5OjM2UE0gKzAxMDAsIE1pbGFuIERqb2tpYyB3
cm90ZToKLi4uCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YveGVuL2h5cGVyY2FsbC5TCj4gPiA+IEBA
IC0wLDAgKzEsNzEgQEAKPiA+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
ICovCj4gPiA+ICsjaW5jbHVkZSA8bGludXgvbGlua2FnZS5oPgo+ID4gPiArI2luY2x1ZGUgPGFz
bS9hc3NlbWJsZXIuaD4KPiA+ID4gKyNpbmNsdWRlIDx4ZW4vaW50ZXJmYWNlL3hlbi5oPgo+ID4g
PiArRVhQT1JUX1NZTUJPTF9HUEwoSFlQRVJWSVNPUl9ldmVudF9jaGFubmVsX29wKTsKPiA+ID4g
K0VYUE9SVF9TWU1CT0xfR1BMKEhZUEVSVklTT1JfZ3JhbnRfdGFibGVfb3ApOwo+ID4gPiArRVhQ
T1JUX1NZTUJPTF9HUEwoSFlQRVJWSVNPUl94ZW5fdmVyc2lvbik7Cj4gPiA+ICtFWFBPUlRfU1lN
Qk9MX0dQTChIWVBFUlZJU09SX2NvbnNvbGVfaW8pOwo+ID4gPiArRVhQT1JUX1NZTUJPTF9HUEwo
SFlQRVJWSVNPUl9zY2hlZF9vcCk7Cj4gPiA+ICtFWFBPUlRfU1lNQk9MX0dQTChIWVBFUlZJU09S
X2h2bV9vcCk7Cj4gPiA+ICtFWFBPUlRfU1lNQk9MX0dQTChIWVBFUlZJU09SX21lbW9yeV9vcCk7
Cj4gPiA+ICtFWFBPUlRfU1lNQk9MX0dQTChIWVBFUlZJU09SX3BoeXNkZXZfb3ApOwo+ID4gPiAr
RVhQT1JUX1NZTUJPTF9HUEwoSFlQRVJWSVNPUl92Y3B1X29wKTsKPiA+ID4gK0VYUE9SVF9TWU1C
T0xfR1BMKEhZUEVSVklTT1JfcGxhdGZvcm1fb3BfcmF3KTsKPiA+ID4gK0VYUE9SVF9TWU1CT0xf
R1BMKEhZUEVSVklTT1JfbXVsdGljYWxsKTsKPiA+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKEhZUEVS
VklTT1Jfdm1fYXNzaXN0KTsKPiA+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKEhZUEVSVklTT1JfZG1f
b3ApOwo+ID4gPiArRVhQT1JUX1NZTUJPTF9HUEwocHJpdmNtZF9jYWxsKTsKPiA+ID4gKyNkZWZp
bmUgU0JJX0VDQUxMIDB4RQo+ID4KPiA+IFNob3VsZG4ndCB0aGlzIGJlIDB4QTAwMDAwNywgaS5l
LiB0aGUgU0JJIGZpcm13YXJlIHNwZWNpZmljIGV4dGVuc2lvbgo+ID4gZm9yIFhlbi4gT3RoZXJ3
aXNlIHdoeSByZWZlciB0byBTQkk/IE5vdGUsICcweEUnIGlzIGFuIGludmFsaWQsIGxlZ2FjeQo+
ID4gZXh0ZW5zaW9uIElEIGluIFNCSS4KPiA+Cj4gSHlwZXJjYWxsIGlzIHRyaWdnZXJlZCB0aHJv
dWdoIFNCSSBhbmQgd2UgZGVmaW5lZCAweEUganVzdCBhcyBhbgo+IFNCSV9FQ0FMTCBJRCBvbiBY
ZW4gc2lkZSBmb3IgaHlwZXJjYWxsIGhhbmRsaW5nIChhbW9uZyBvdGhlciBvcGVyYXRpb24KPiBJ
RHMpLCBzbyB3ZSdyZSBub3QgcmVmZXJyaW5nIHRvIHNvbWUgc3RhbmRhcmQgL2xlZ2FjeSBJRCBo
ZXJlLCBqdXN0Cj4gdXRpbGl6aW5nIFNCSSBmb3IgaHlwZXJjYWxsIGhhbmRsaW5nLgoKSWYgdGhl
IFNCSSBzcGVjaWZpZWQgRUlEcyBhbmQgYmluYXJ5IGVuY29kaW5nIGFyZW4ndCB1c2VkLCB0aGVu
IHRoZQpoeXBlcmNhbGxzIGFyZW4ndCAidHJpZ2dlcmVkIHRocm91Z2ggU0JJIiwgWGVuIGlzIGp1
c3QgZG9pbmcgaXRzIG93bgp0aGluZyBvbiBhbiBlY2FsbC4gWGVuIGRvZXNuJ3QgaGF2ZSB0byBp
bXBsZW1lbnQgU0JJIGF0IGFsbCwgYnV0IGlmCml0IHdhbnRzIHRvIHByb3ZpZGUgU0JJIHNlcnZp
Y2VzLCBhcyB3ZWxsIGFzIGl0cyBvd24gaHlwZXJjYWxscywgdGhlbgp0aGUgaHlwZXJjYWxscyBz
aG91bGQgYmUgZW5jb2RlZCBpbiB0aGUgc2FtZSB3YXkgYXMgU0JJIGZ1bmN0aW9ucyBhbmQKYW4g
RUlEIGFsbG93ZWQgYnkgdGhlIFNCSSBzcGVjaWZpY2F0aW9uIGZvciBoeXBlcnZpc29yLXNwZWNp
ZmljCmZ1bmN0aW9ucyBzaG91bGQgYmUgdXNlZC4gRm9yIFhlbiwgdGhhdCBFSUQgaXMgYWxyZWFk
eSBzcGVjaWZpZWQgYW5kCml0J3MgMHhBMDAwMDA3LgoKPiBJcyB0aGlzIHNwZWNpZmljIElEICgw
eEUpIG5vdCBhbGxvd2VkIHRvIGJlIHVzZWQgb24gdGhlIGtlcm5lbCBzaWRlCj4gZm9yIHNvbWUg
cmVhc29uPyBJZiB0aGF0IGlzIHRoZSBjYXNlLCB3ZSBjYW4gdXNlIGFueSBvdGhlciBJRCwKPiBp
bmNsdWRpbmcgdGhlIG9uZSB3aGljaCB5b3Ugc3VnZ2VzdGVkLgo+CgpMaW51eCBjYW4gdXNlIGFu
eSBJRCwgYW5kIFhlbiBjYW4gZGVjaWRlIHdoYXQgdGhhdCBJRCBpcywgYnV0LCBpZiBYZW4Kd2Fu
dHMgdG8gaW1wbGVtZW50IFNCSSwgdGhlbiBYZW4gY2FuJ3QgdXNlIDB4RSwgYmVjYXVzZSB0aGF0
IEVJRCBpcwpub3QgYWxsb3dlZCBieSB0aGUgc3BlYyBmb3IgdGhlIHB1cnBvc2Ugb2YgaHlwZXJj
YWxscy4KClRoYW5rcywKZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
