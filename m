Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0041CC02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/vz82zCLqQSQJhUf6Em7w9cCMfpgZPeg9DR6JEd1hfI=; b=upezxzF8A6eKAK
	M0ld04f8rzpIjK+jfGyW3TuzDAYoXmqfRUkrRPPw7IwmGpcpUhAZDB6BNtOEgjyCG4OgDyYthkBEP
	cOSN0y+PYuaCVlae6ybwuBYu+ElVqCVQ2gNaQzWJk7QrCokWMfYBw2Ad9raj3szwY6eflN9lrfkAf
	f0/YN464McQMBpEo5dDEVKwAIacFmN0aqEpz2Vdjw4gL0jX382s+6ChRwRtX80wuoLp2EzvoZLRjv
	dy+w793a8FsiBWNDQ0MTp27t2mBHTq4o5JJUHfMpIZvVe8HKLRZS/pOYaEqWul+FTVzQUA2YOyoH+
	SJqpWMqcZCcPYKdHTxdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY85p-0000000CkSj-1PUd;
	Wed, 15 Jan 2025 18:26:17 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY85m-0000000CkSM-3jBF
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 18:26:16 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6dccccd429eso1231276d6.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 10:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736965573; x=1737570373; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56NS9QFu3nqyt2X92cCfR3Efbv5GWPlnT7v7XAEeafM=;
        b=bREsmdDySRXfF0GOXW2ETl6+pY9qojTL164xFSFZTi0RqfEqacvq872rBkG4pwCkht
         I01VypWga/SWobXRpSEM+XXW4209uF/tFN6RRj8RMREZMZxoxUFcDcVoT5jqzoSf4hkO
         LZE4Hm0KpDGS3vpRZZfxdkPnRrPVxzN1OH7KcP5+iNNGZ3pyYDSBH5NJ0ePrR0RVpv17
         7F2Z7B2hIb10KKksLAQ59xc3uoE4FcBZafAQDDOJxK+VbqIz9gtgwGtmkiLQs+O0Hx9A
         w6Ty60xXMsSWYPelNJfUvuluwtuDZcxyzbI9jCRPGWrbtrfxjVQ+K4EWlYsmwZAdK4OH
         6cPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965573; x=1737570373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56NS9QFu3nqyt2X92cCfR3Efbv5GWPlnT7v7XAEeafM=;
        b=J36UycB9AmUjFP5rJC2WGp3DHjidPOypdXl6RxCaETqsys2+qLoYqoJlIB5EB1pEPK
         66IDOLX/1qNHRY9b2nz9c6pV1Yl5tkc8IRgk6MvZrZ6QPdWPU3Xjq8neQoJO1nxbHVg8
         WX96ZSngSIGHZ2LoNVPI9CwibUghRoPMs5Z8HNkQGwY3mFTTm7dZTfYkkDUeDLJ2sKav
         yDaSMl4UQZm/QzR1xfcppzvyrtfiYzHUpVcJ+uLqkvrUJGjU1L9asPGsG3laitZmKU8i
         QaqGKheviKIKFce8XPpxaigkdZJWi3oOXBq2vojcptJhmw189V699hZin5s19OB5eBmR
         xvVQ==
X-Gm-Message-State: AOJu0Yzrd8D8Uj1LCaK82zKFeNnxkRaCg9HV6Z3UOwT3v+HE8kLdHhvF
	wxiNqzkwF0j6oI/cqVwHNoRIUJMWWnExoBVkBSYTUgBkL2BRwDUrFkqCdj7yQVNSGsgY9yFZvmn
	7PxEN3BvX0TGh4208aSbJjUfEkT4=
X-Gm-Gg: ASbGncv/RH5V+6bddUyOZCFo2jQZOnz1aPspzb5P6Dg6DGIuijKfA/QWfc/yMoyXIpC
	TMHENVhdqXiTcwRk8IS4TsDPIziP2JBZqBdu1fw==
X-Google-Smtp-Source: AGHT+IFZ7LDpCgk+/ixdVgpNuaVhVLnP72hjhsHZcggTnKpcAZNiZOdxIC0i/Y0rcAWUWwUH/WEMoeQpL02BdxVsSe4=
X-Received: by 2002:a05:6214:5bc2:b0:6d8:a730:110d with SMTP id
 6a1803df08f44-6df9b0eea41mr464717506d6.0.1736965573650; Wed, 15 Jan 2025
 10:26:13 -0800 (PST)
MIME-Version: 1.0
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
 <0cac0b13-128c-4d8b-b235-09d7b440ad8e@vates.tech>
In-Reply-To: <0cac0b13-128c-4d8b-b235-09d7b440ad8e@vates.tech>
From: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Date: Wed, 15 Jan 2025 19:26:03 +0100
X-Gm-Features: AbW1kvamvNb2xBNlt0NnBIzllhDKyUtK5Hh8vPP6WZ7rdE4FF79WjPfZk5asYMA
Message-ID: <CAKp59VHBLtpxk7MD3StO8v8M5vdqbWU7AZaoxukzYPFCmSF91w@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-V
To: Teddy Astie <teddy.astie@vates.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_102614_929679_10DC84D3 
X-CRM114-Status: GOOD (  18.79  )
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
Cc: jgross@suse.com, aou@eecs.berkeley.edu, Milan.Djokic@rt-rk.com, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org, oleksandr_tyshchenko@epam.com, iommu@lists.linux.dev, sstabellini@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, Slavisa.Petrovic@rt-rk.com, takakura@valinux.co.jp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8gVGVkZHksCgpPbiBUdWUsIEphbiAxNCwgMjAyNSBhdCA2OjUx4oCvUE0gVGVkZHkgQXN0
aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+IHdyb3RlOgo+Cj4gTGUgMTQvMDEvMjAyNSDDoCAx
NzoxMywgTWlsYW4gRGpva2ljIGEgw6ljcml0IDoKPiA+IGRpZmYgLS1naXQgYS90ZXN0LnR4dCBi
L3Rlc3QudHh0Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAw
Li5lNTQyNjc5OTg5ODIKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3Rlc3QudHh0Cj4gPiBA
QCAtMCwwICsxLDIxIEBACj4gPiArV0FSTklORzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0ZWQgZmls
ZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0aW5nPwo+ID4gKyMxMjA6Cj4gPiArbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiA+ICsKPiA+ICtXQVJOSU5HOiBkbyBub3QgYWRkIG5ldyB0eXBl
ZGVmcwo+ID4gKyM4MDg6IEZJTEU6IGluY2x1ZGUveGVuL3Jpc2N2L2ludGVyZmFjZS5oOjE1Ogo+
ID4gKysgICAgdHlwZWRlZiBzdHJ1Y3QgeyB1bmlvbiB7IHR5cGUgKiBwOyB1aW50NjRfYWxpZ25l
ZF90IHE7IH07IH0gIFwKPiA+ICsKPiA+ICtXQVJOSU5HOiBwbGVhc2UsIG5vIHNwYWNlcyBhdCB0
aGUgc3RhcnQgb2YgYSBsaW5lCj4gPiArIzEwMDY6IEZJTEU6IGluY2x1ZGUveGVuL3Jpc2N2L3N3
aW90bGIteGVuLmg6MTA6Cj4gPiArKyAgICByZXR1cm4gMDskCj4gPiArCj4gPiArdG90YWw6IDAg
ZXJyb3JzLCAzIHdhcm5pbmdzLCA4MTAgbGluZXMgY2hlY2tlZAo+ID4gKwo+ID4gK05PVEU6IEZv
ciBzb21lIG9mIHRoZSByZXBvcnRlZCBkZWZlY3RzLCBjaGVja3BhdGNoIG1heSBiZSBhYmxlIHRv
Cj4gPiArICAgICAgbWVjaGFuaWNhbGx5IGNvbnZlcnQgdG8gdGhlIHR5cGljYWwgc3R5bGUgdXNp
bmcgLS1maXggb3IgLS1maXgtaW5wbGFjZS4KPiA+ICsKPiA+ICswMDAxLXJpc2N2LUFkZC1pbml0
aWFsLVhlbi1ndWVzdC1zdXBwb3J0LWZvci1SSVNDLVYucGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1z
LCBwbGVhc2UgcmV2aWV3Lgo+ID4gKwo+ID4gK05PVEU6IElmIGFueSBvZiB0aGUgZXJyb3JzIGFy
ZSBmYWxzZSBwb3NpdGl2ZXMsIHBsZWFzZSByZXBvcnQKPiA+ICsgICAgICB0aGVtIHRvIHRoZSBt
YWludGFpbmVyLCBzZWUgQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPgo+IEkgYW0gbm90IHN1
cmUgeW91IHdhbnQgdGhpcyBoZXJlLgo+ClNvcnJ5LCB0aGlzIG9uZSBpcyBhZGRlZCBieSBhY2Np
ZGVudC4gV2lsbCBiZSByZW1vdmVkLgoKPiAgPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9oeXBlcnZpc29yLmgKPiBiL2FyY2gvcmlzY3YvaW5jbHVkZS8+IGFzbS9oeXBlcnZp
c29yLmgKPiAgPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ICA+IGluZGV4IDAwMDAwMDAwMDAwMC4u
M2ExMTdhZmU1N2YwCj4gID4gLS0tIC9kZXYvbnVsbAo+ICA+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaHlwZXJ2aXNvci5oCj4gID4gQEAgLTAsMCArMSw5IEBACj4gID4gKy8qIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4gID4gKyNpZm5kZWYgX0FTTV9SSVNDVl9I
WVBFUlZJU09SX0gKPiAgPiArI2RlZmluZSBfQVNNX1JJU0NWX0hZUEVSVklTT1JfSAo+ICA+ICsK
PiAgPiArI2luY2x1ZGUgPGFzbS94ZW4vaHlwZXJ2aXNvci5oPgo+ICA+ICsKPiAgPiArdm9pZCBr
dm1faW5pdF9oeXBfc2VydmljZXModm9pZCk7Cj4gID4gKwo+ICA+ICsjZW5kaWYKPgo+IGt2bV9p
bml0X2h5cF9zZXJ2aWNlcyBzZWVtcyBLVk0tc3BlY2lmaWMgYW5kIGRvZXNuJ3Qgc2VlbSB0byBl
eGlzdCAoeWV0KQo+IGZvciBSSVNDLVYuCj4KWWVzLCB3ZSdsbCByZW1vdmUgaXQgaW4gdGhlIG5l
eHQgcmV2aXNpb24uCgpCUiwKTWlsYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
