Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC45C47DA9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 03:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gYUYZ6QlW8uvs53O3EjlBjGVj4/V9CopNVplIVj/QUs=; b=CZlvrHIW3f2c6l
	BWpeCNRd1mXsN0ON1/BD7iUSovEP+iacBX5otw/oOubs1zSkrWwAaJSKh3p9Yu1vuH0ekBd8PIMrK
	4s+ITCeOD1kPzP3RVTtN5WO0pjxVPVXFnZnRwqqzFE+DkjuftHoQ4P8kIG0SoG4PJFg0KCqZ73NLh
	+YBIvKxg4g+rqmUCYkSFJmG9GbbxDUem0OD1xNDSkjnS0DCMYc03hSH1t4DJTY7SBfUf8VMGLiBv2
	3hwZoagELZ3//fXoBiwtfDeaexo3cG2Sqzv1Zi7G4oGUfGMNR3FW5aJNX5K1DAibMdGFub80PBWz/
	UWNloQq6NggGTd3IHifg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUeeA-0000000F5x4-3nyD;
	Tue, 30 Jan 2024 03:18:50 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUee8-0000000F5wI-13FZ
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 03:18:49 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-21432e87455so2273170fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 19:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1706584722; x=1707189522; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tsSKt6lkSZda2RgWTGSLfUCs4NSgTk8YkR/HGv8Ilk=;
        b=FcbBuS6rRqJ+2jm7wfcGflPBX3pzrn9mW/EalhCG2/SMVYfW/ei/bJojiNmc2LqOgt
         Tk1KNNWATldzNmC3kEBgVo4eZday1N7rymdTbubjMXtQxjSLPIExzr5KxXyVApDAo1BM
         9a9NJszl6Heumyz7qXcxiq6+UMDUovabeTRjbfpPZxa66i7/TXjLyW4bMz6KDKg+RZZz
         l62RPUq8sHEsiF+27lrMnY7jiR0MuEd8ZgufBLU8BrmzzdJmiS/Q95hzfCItk/NWiU1C
         Cli+xHSmrNkxbA2aJaf+qBks814GcLi9zPjLYn/UN/Q5ZAa9yKjc+0lrE1sXKgpCNgRW
         4Amw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706584722; x=1707189522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tsSKt6lkSZda2RgWTGSLfUCs4NSgTk8YkR/HGv8Ilk=;
        b=WqfHqyNCncky6liKcEAmUwUcto9mTzStuM1lApc3QVC0wUhyXUqw8kyNFTS3iSvVNs
         Tq6jPlHILI3vDrSg8RuTLZ0nQqIt4qAP5iS69skQZtJyZu29ixhD5JuX5kcLFiifBCni
         X7uXYSsdKI23N10ga/1Dw6m1K45TwnD+EG/uPn6odSuoMXiap/w6Mna1gc2YCk3uE6Lf
         NyX5vT0qsfX2HKm6WNswVSIqyNuntDh0OTbBLsOEhkPr3l/QUSyF9j/jc6J+k8SQ28HQ
         JPdmzmDlv07aHcQagrQ1qMsw+qBlXBG0JUUIVP2WUyfmiTT4te3hEbE/QTFrBlWlhYSG
         50KQ==
X-Gm-Message-State: AOJu0YzDV3wAeRXyOicAT9kP8LYaFk3NGK+LAU2XkrBMm6xKx/1B7De9
	N8yXR1RU4DaYju9oMfqYZmyTBOWYV/fziGVJdPk0kCccS/VX532iLcmsMtDvRiiDCLIgXzH6hU8
	JYWWA/IZM3oNHVCgmhXk+wxahu1uL7vLch3c4vw==
X-Google-Smtp-Source: AGHT+IEnApZiO6fO+ZztjhLKw2ACObTpDVhy9g1oXuXUYkA9KkWANrP+yAqwJY4XdWOHjz7JDnisD2oN/bRT8QaUxTo=
X-Received: by 2002:a05:6870:a18f:b0:218:3f78:a279 with SMTP id
 a15-20020a056870a18f00b002183f78a279mr7918052oaf.45.1706584722255; Mon, 29
 Jan 2024 19:18:42 -0800 (PST)
MIME-Version: 1.0
References: <20240125062044.63344-1-cuiyunhui@bytedance.com>
 <ZbdYijWK1PnHXn47@xhacker> <CAEEQ3wnSN8dLh3FcmHq5yPwQRdjLQa_VjcuTH+7YYZLOqCzaCQ@mail.gmail.com>
 <ZbdyLJ24I2fa6oNb@xhacker> <CAEEQ3w=gpSTxzxTzh-zHbP37P8s5eVCzG6RZndBXF-U+mNrziw@mail.gmail.com>
 <ZbeRgRBhvNnnTd8h@xhacker>
In-Reply-To: <ZbeRgRBhvNnnTd8h@xhacker>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 30 Jan 2024 11:18:31 +0800
Message-ID: <CAEEQ3wmoQ=f9OWu5FsuinFDRUtGE6kFk6xac-diYD664Mt_VFg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: add uniprocessor flush_tlb_range() support
To: Jisheng Zhang <jszhang@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alexghiti@rivosinc.com, samuel.holland@sifive.com, ajones@ventanamicro.com, 
	mchitale@ventanamicro.com, dylan@andestech.com, 
	sergey.matyukevich@syntacore.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_191848_311547_A8A12F4B 
X-CRM114-Status: GOOD (  26.16  )
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

SGkgSmlzaGVuZywKCgpPbiBNb24sIEphbiAyOSwgMjAyNCBhdCA4OjA14oCvUE0gSmlzaGVuZyBa
aGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSmFuIDI5LCAyMDI0
IGF0IDA3OjAyOjEwUE0gKzA4MDAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiBIaSBKaXNoZW5nLAo+
ID4KPiA+IE9uIE1vbiwgSmFuIDI5LCAyMDI0IGF0IDU6NTHigK9QTSBKaXNoZW5nIFpoYW5nIDxq
c3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBNb24sIEphbiAyOSwgMjAy
NCBhdCAwNDoyNjo1N1BNICswODAwLCB5dW5odWkgY3VpIHdyb3RlOgo+ID4gPiA+IEhpIEppc2hl
bmcsCj4gPiA+ID4KPiA+ID4gPiBPbiBNb24sIEphbiAyOSwgMjAyNCBhdCA0OjAy4oCvUE0gSmlz
aGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4g
PiBPbiBUaHUsIEphbiAyNSwgMjAyNCBhdCAwMjoyMDo0NFBNICswODAwLCBZdW5odWkgQ3VpIHdy
b3RlOgo+ID4gPiA+ID4gPiBBZGQgc3VwcG9ydCBmb3IgZmx1c2hfdGxiX3JhbmdlKCkgdG8gaW1w
cm92ZSBUTEIgcGVyZm9ybWFuY2UgZm9yCj4gPiA+ID4gPiA+IFVQIHN5c3RlbXMuIEluIG9yZGVy
IHRvIGF2b2lkIHRoZSBtdXR1YWwgaW5jbHVzaW9uIG9mIHRsYmZsdXNoLmgKPiA+ID4gPiA+ID4g
YW5kIGh1Z2V0bGIuaCwgdGhlIFVQIHBhcnQgaXMgYWxzbyBpbXBsZW1lbnRlZCBpbiB0bGJmbHVz
aC5jLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEhpIFl1bmh1aSwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBJ
SVJDLCBTYW11ZWwgc2VudCBzaW1pbGFyIHBhdGNoIHNlcmllcyBhIGZldyB3ZWVrcyBhZ28uCj4g
PiA+ID4gPgo+ID4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAy
NDAxMDIyMjAxMzQuMzIyOTE1Ni0xLXNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20vCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gQWZ0ZXIgdGhhdCBzZXJpZXMsIGRvIHlvdSBzdGlsbCBuZWVkIHRoaXMgcGF0
Y2g/Cj4gPiA+ID4KPiA+ID4gPiBUaGFuayB5b3UgZm9yIHlvdXIgcmVtaW5kZXIuIEkgZGlkbid0
IGZpbmQgaXQgYmVmb3JlIEkgbWFpbGVkIG15Cj4gPiA+ID4gcGF0Y2guIEkganVzdCBsb29rZWQg
YXQgdGhlIGNvbnRlbnQgb2YgdGhpcyBwYXRjaC4gSSB1bmRlcnN0YW5kIHRoYXQKPiA+ID4gPiBt
eSBwYXRjaCBpcyBuZWVkZWQuIEZvciBhIHNpbmdsZSBjb3JlLCBhIG1vcmUgY29uY2lzZSBUTEIg
Zmx1c2ggbG9naWMKPiA+ID4gPiBpcyBuZWVkZWQsIGFuZCBpdCBpcyBoZWxwZnVsIHRvIGltcHJv
dmUgcGVyZm9ybWFuY2UuCj4gPiA+Cj4gPiA+IEN1cnJlbnRseSwgcmlzY3YgVVAgZmx1c2hfdGxi
X3JhbmdlIHN0aWxsIHVzZSBmbHVzaCBhbGwgVExCIGVudHJpZXMsCj4gPiA+IG9idmlvdXNseSBp
dCdzIGlzIGEgYmlnIGhhbW1lciwgdGhpcyBpcyB3aGF0IHlvdXIgcGF0Y2ggaXMgdHJ5aW5nIHRv
Cj4gPiA+IG9wdGltaXplLiBJJ20gbm90IHN1cmUgd2hldGhlciBJIHVuZGVyc3RhbmQgeW91ciBj
b2RlIGNvcnJlY3RseSBvciBub3QuCj4gPiA+IExldCBtZSBrbm93IGlmIEkgbWlzdW5kZXJzdGFu
ZCB5b3VyIGNvZGUuCj4gPiA+Cj4gPiA+IEFmdGVyIHBhdGNoNSBvZiB0aGUgU2FtdWVsJ3Mgc2Vy
aWVzLCBfX2ZsdXNoX3RsYl9yYW5nZSBpcyB1bmlmaWVkIGZvcgo+ID4gPiBTTVAgYW5kIFVQLCBz
byB0aGF0IFVQIGNhbiBhbHNvIGJlbmVmaXQgZnJvbSByZWNlbnQgaW1wcm92ZW1lbnRzLCBzdWNo
Cj4gPiA+IGFzIHJhbmdlIGZsdXNoIHJhdGhlciB0aGFuIGFsbC4KPiA+Cj4gPiBJbiBteSBvcGlu
aW9uLCBVUCBkb2VzIG5vdCBuZWVkIHRvIGNvbWJpbmUgc29tZSBTTVAgaWYuLi4gZWxzZSwKPiA+
IG9uX2VhY2hfY3B1KC4uLikgbG9naWMsIHdoaWNoIGlzIGFsc28gYSBtYW5pZmVzdGF0aW9uIG9m
IHBlcmZvcm1hbmNlCj4KPiBIaSBZdW5odWksCj4KPiBJSVJDLCB0aGUgY29tcGlsZXIgd2lsbCBv
cHRpbWlzZSBvdXQgdGhlIHVubmVjZXNzYXJ5IGxvZ2ljIHVuZGVyIFVQLCBJCj4gbWF5IG1pc3Jl
YWQgdGhlIGNvZGUuIEJ1dCBpZiBubywgaW5kZWVkLCB0aGVyZSdzIGltcHJvdmVtZW50IHJvb20u
Cj4gSG93ZXZlciwgZXZlbiBpbiB0aGlzIGNhc2UsIElNSE8sIGl0J3MgYmV0dGVyIGlmIHlvdSBj
YW4gYmFzZSBvbgo+IFNhbXVlbCdzIHNlcmllcy4KPiBBbnl3YXksIHRoZSBvcHRpbWl6YXRpb24o
cmFuZ2UgdGxiIGVudHJpZXMgcmF0aGVyIHRoYW4gKmFsbCogZW50cmllcyB1bmRlcgo+IFVQIGNh
c2UpIHlvdSB3YW50IHRvIGRvIGhhcyBiZWVuIGltcGxlbWVudGVkLiBXaGlsZSBJJ20gbm90IHN1
cmUgd2hldGhlcgo+IHdlIGNhbiByZWx5IG9uIHRoZSBjb21waWxlciB0byBvcHRpbWl6ZSBvdXQg
YWxsIHVubmVjZXNzYXJ5IGxvZ2ljcy4KCk9rYXksIGxldCdzIHNlZSBpZiB0aGVyZSBhcmUgYW55
IG5lY2Vzc2FyeSBvcHRpbWl6YXRpb25zIGJhc2VkIG9uClNhbXVlbCdzIHNlcmllcy4KClRoYW5r
cywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
