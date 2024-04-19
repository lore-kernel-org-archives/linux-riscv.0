Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8E1C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 07:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNwWdeTUm5E2X6fjsi8qMi4WM463uSgARmg+ovD23DM=; b=sYLXj8J7Gsvtxv
	rttnUYt6KvBqoUVTk5/4kHwVv6hNwAn4YTHNCS1bTQEPBK+zbk//nsAqB0sucbujdKrP46DOsGyeX
	aZ0bomV71ZMZinnSr6zBx7SbIWDF/d8LipDEl10pcaeACsgOnZ7XQsV3SRxGJTYjA4dQFUaI0PoZV
	Tux4xQb1gLH5CsT9uPtOVnjaLNG+zSPYHKMA3uIIwnzN5Toe9TlwB9+LI3zNP1ViKrAKnuFIo63HV
	XIrdOqkTE5TyKflRTLt3C40r0aPYOC+QUF6zICyfc79BHV/G1MGmBKhTAebPGm/XCNOgY/EZy1Opo
	2cGRvZB4L0FNI/CXv5ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxivO-00000004pN1-1LC5;
	Fri, 19 Apr 2024 07:44:46 +0000
Received: from mail-yw1-f179.google.com ([209.85.128.179])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxivK-00000004pL0-3PWY
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 07:44:44 +0000
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6157c30fbc9so16428067b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 00:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713512679; x=1714117479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9aGfGVkclitK9fGaCPJLToKLvFSDmM3YASsQou3aVI=;
        b=g/NvGzqQs+PPu6650lfIKnqCwy1qvAM1caonYXchc2FwD37wM2i/W+V31gMIkD+RH2
         OAf4ITiodUIfyqyAWbB7hUq2l/FPby4EuHUdQWAvIOibWqnsis8C1I00Km8WaoAeObBS
         gAYdg/YlL+3wJPN94DexqwshriDV0DK0AhNC+GkAZ6ubVYcJ0cpA3hJDXuXbzGez1aqK
         I00e3cBRYfbXmNx16QrmMjIZr5e8leqWSL9tPCss/In2UePvrEtiKkUb0jQpkbn7GyOc
         oIImqiFTgUUNEc4uIRcQRdh7MQtC0Zx52Rdj51rXrgenPWLM35EBS4+/whbfT/6z1EmM
         ReQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqTu6UFEVDT3G+UOwX1uDzR+O7gad8w4a+WISReJp0+pi62VnQ+vIVZzLsJ50KTN7fFs1IKd4QwMVs/6+j7AXHA+5t2kEtfQAjp5d5damn
X-Gm-Message-State: AOJu0YyPVWZxWQl8n2MqMeEv8XtNJLSRepApIZx7fQ31sk5tAUOlkhJM
	fBSRUplgS/R5i2rJYxTOxT6M2A5ETQlUNLZrrGfgaEblvD5x5z54J0wsN6VO
X-Google-Smtp-Source: AGHT+IHmhAuEVHxhyAVURz/UcK/X9Bp2ExfqzOjd68ewIdTdcJSehyv/McjBOt0GnlCxzfAW988VTg==
X-Received: by 2002:a05:690c:f89:b0:61a:cde6:6542 with SMTP id df9-20020a05690c0f8900b0061acde66542mr1402213ywb.16.1713512679364;
        Fri, 19 Apr 2024 00:44:39 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id g125-20020a0ddd83000000b0061b06ae1d09sm678128ywe.29.2024.04.19.00.44.37
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Apr 2024 00:44:38 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-de47485532cso1377540276.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 00:44:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVeaciJ/9W2QDZCSChwx7pDu0vHivZYHNTBgyuBxio01+6kHyL4j5L5F8CX5Dm41+i2lMLCapl9HV+RMF1U7F+UO4dEtSHzCBrWJ0StCcw+
X-Received: by 2002:a05:6902:218d:b0:dc6:bcb3:5d8e with SMTP id
 dl13-20020a056902218d00b00dc6bcb35d8emr1436727ybb.20.1713512677738; Fri, 19
 Apr 2024 00:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240403203503.634465-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240403203503.634465-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW7kiSYm8n8CfMs9zKaN+PhVt+=16nx=ttLk6Ur_jOa-g@mail.gmail.com> <CA+V-a8t6B3pGjrciDNRzdpGQp-8cGW0JXV9k0udpku3GVA0ckA@mail.gmail.com>
In-Reply-To: <CA+V-a8t6B3pGjrciDNRzdpGQp-8cGW0JXV9k0udpku3GVA0ckA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Apr 2024 09:44:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCHD+AuP9v2fBygDv-fJqP4RZ=Gtp3PX9b1K-GX1+XQg@mail.gmail.com>
Message-ID: <CAMuHMdWCHD+AuP9v2fBygDv-fJqP4RZ=Gtp3PX9b1K-GX1+XQg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] irqchip/renesas-rzg2l: Add support for RZ/Five SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_004442_878497_B2F1ED60 
X-CRM114-Status: GOOD (  30.44  )
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

SGkgUHJhYmhha2FyLAoKT24gRnJpLCBBcHIgMTksIDIwMjQgYXQgOToxNeKAr0FNIExhZCwgUHJh
Ymhha2FyCjxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MTgsIDIwMjQgYXQgNDoxMeKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+IHdyb3RlOgo+ID4gT24gV2VkLCBBcHIgMywgMjAyNCBhdCAxMDozNuKAr1BNIFByYWJo
YWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiBGcm9tOiBMYWQg
UHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gPiA+
Cj4gPiA+IFRoZSBJWDQ1IGJsb2NrIGhhcyBhZGRpdGlvbmFsIG1hc2sgcmVnaXN0ZXJzIChOTVNL
L0lNU0svVE1TSykgYXMgY29tcGFyZWQKPiA+ID4gdG8gdGhlIFJaL0cyTCAoZmFtaWx5KSBTb0Mu
Cj4gPiA+Cj4gPiA+IEludHJvZHVjZSBtYXNraW5nL3VubWFza2luZyBzdXBwb3J0IGZvciBJUlEg
YW5kIFRJTlQgaW50ZXJydXB0cyBpbiBJUlFDCj4gPiA+IGNvbnRyb2xsZXIgZHJpdmVyLiBUd28g
bmV3IHJlZ2lzdGVycywgSU1TSyBhbmQgVE1TSywgYXJlIGRlZmluZWQgdG8KPiA+ID4gaGFuZGxl
IG1hc2tpbmcgb24gUlovRml2ZSBTb0MuIFRoZSBpbXBsZW1lbnRhdGlvbiB1dGlsaXplcyBhIG5l
dyBkYXRhCj4gPiA+IHN0cnVjdHVyZSwgYHN0cnVjdCByemcybF9pcnFjX2RhdGFgLCB0byBkZXRl
cm1pbmUgbWFzayBzdXBwb3J0IGZvciBhCj4gPiA+IHNwZWNpZmljIGNvbnRyb2xsZXIgaW5zdGFu
Y2UuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5t
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+ID4gLS0tCj4gPiA+IHYxLT52Mgo+ID4g
PiAtIEFkZGVkIElSUUNISVBfTUFUQ0goKSBmb3IgUlovRml2ZQo+ID4gPiAtIFJldGFpbmluZyBh
IGNvcHkgb2YgT0YgZGF0YSBpbiBwcml2Cj4gPiA+IC0gUmViYXNlZCB0aGUgY2hhbmdlcwo+ID4K
PiA+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSEKPiA+Cj4gPiA+IC0tLSBhL2RyaXZlcnMvaXJxY2hp
cC9pcnEtcmVuZXNhcy1yemcybC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmVu
ZXNhcy1yemcybC5jCj4gPiA+IEBAIC02NiwxNSArNjgsMjUgQEAgc3RydWN0IHJ6ZzJsX2lycWNf
cmVnX2NhY2hlIHsKPiA+ID4gICAgICAgICB1MzIgICAgIHRpdHNyWzJdOwo+ID4gPiAgfTsKPiA+
ID4KPiA+ID4gKy8qKgo+ID4gPiArICogc3RydWN0IHJ6ZzJsX2lycWNfb2ZfZGF0YSAtIE9GIGRh
dGEgc3RydWN0dXJlCj4gPiA+ICsgKiBAbWFza19zdXBwb3J0ZWQ6IEluZGljYXRlcyBpZiBtYXNr
IHJlZ2lzdGVycyBhcmUgYXZhaWxhYmxlCj4gPiA+ICsgKi8KPiA+ID4gK3N0cnVjdCByemcybF9p
cnFjX29mX2RhdGEgewo+ID4gPiArICAgICAgIGJvb2wgICAgbWFza19zdXBwb3J0ZWQ7Cj4gPiA+
ICt9Owo+ID4gPiArCj4gPiA+ICAvKioKPiA+ID4gICAqIHN0cnVjdCByemcybF9pcnFjX3ByaXYg
LSBJUlEgY29udHJvbGxlciBwcml2YXRlIGRhdGEgc3RydWN0dXJlCj4gPiA+ICAgKiBAYmFzZTog
ICAgICBDb250cm9sbGVyJ3MgYmFzZSBhZGRyZXNzCj4gPiA+ICsgKiBAZGF0YTogICAgICBPRiBk
YXRhIHBvaW50ZXIKPiA+ID4gICAqIEBmd3NwZWM6ICAgIElSUSBmaXJtd2FyZSBzcGVjaWZpYyBk
YXRhCj4gPiA+ICAgKiBAbG9jazogICAgICBMb2NrIHRvIHNlcmlhbGl6ZSBhY2Nlc3MgdG8gaGFy
ZHdhcmUgcmVnaXN0ZXJzCj4gPiA+ICAgKiBAY2FjaGU6ICAgICBSZWdpc3RlcnMgY2FjaGUgZm9y
IHN1c3BlbmQvcmVzdW1lCj4gPiA+ICAgKi8KPiA+ID4gIHN0YXRpYyBzdHJ1Y3QgcnpnMmxfaXJx
Y19wcml2IHsKPiA+ID4gICAgICAgICB2b2lkIF9faW9tZW0gICAgICAgICAgICAgICAgICAgICpi
YXNlOwo+ID4gPiArICAgICAgIGNvbnN0IHN0cnVjdCByemcybF9pcnFjX29mX2RhdGEgKmRhdGE7
Cj4gPgo+ID4gVGhhdCdzIG5vdCBhIGNvcHksIGJ1dCBhIHBvaW50ZXIuCj4gPgo+IE9vcHMsIHNo
b3VsZCB0aGF0IGJlIE9LIG9yIHNoYWxsIEkgY3JlYXRlIGEgY29weSBpbnN0ZWFkPwoKSWYgeW91
IHdvdWxkIHVzZSBhIGNvcHksIGFsbCBTb0Mtc3BlY2lmaWMgcnpnMmxfaXJxY19vZl9kYXRhIHN0
cnVjdHVyZXMKY291bGQgYmVjb21lIF9faW5pdGNvbnN0LgoKSG93ZXZlciwgZGVwZW5kaW5nIG9u
IGhvdyBmYXIgeW91IHdhbnQgdG8gZ28gd2l0aCB0aGUgaXJxX2NoaXAKc2VwYXJhdGlvbiwgeW91
IG1heSBubyBsb25nZXIgbmVlZCB0aGlzIGZpZWxkIGFueXdheS4KCkdye29ldGplLGVldGluZ31z
LAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4g
LS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsu
b3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBj
YWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMg
SSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
