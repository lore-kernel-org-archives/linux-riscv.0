Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570C1C04FF8
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 14:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EYbzO1u3TcferCPeD2yT48966SEiWrtUhOX4+J0hscg=; b=DpW9D5bFdORyE8
	gqaAjk5KUEiKVZHCYPNDfajUNjb+/PjRtL87pkEf3crNoY5kzUSSImDymLxhrt4OgvvAEaNt3wR93
	pWiKm2dwV8s3oUw8iYqWd03uvA3beyDOj+zoCU//u/BjVw/OjrwgI4/K1vZD9YdI+mpjF36ECH0/R
	tDtzNT2pLv7pG3ND7sPRHhN32EWbxsPiAT6HJlMQEt1CdxnUryJgHTWy+IFghL2bFIATAbNh3Ag8d
	xRxrrAm5kr6owGREVdyJYV0gyBFZIpzVO9ukTT3BdA/5FT588k5/1As+YfQrG4t5nC6qNioT+03hO
	W2BvtAcg+8vu94jkefkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSqd-00000002eIc-1JuZ;
	Thu, 18 Apr 2024 14:34:47 +0000
Received: from mail-yw1-f171.google.com ([209.85.128.171])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSqV-00000002eGI-2ng3
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 14:34:45 +0000
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6150670d372so8653747b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 07:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713450876; x=1714055676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4qMhjuBqY7JwfLnRM9VZooBQ1VsIWFaDYIE/bOR1ec=;
        b=Cy2P5zNdBlpx19tMSe8AI9Nig48Af0/gBPnlMFKw99izKBGkiIoskuvuIIHLc11vz5
         M3yqmTafCb5mbqPQdc9bDHjGAE8U6gRAHjH0kak2Epj6iuIHE5KflXwFdJEj4jpbHmKd
         +FSCUTdKpaHQxEtrhws3KrNcq02E3VHZH1TUigoRXS/4daaHgLce1OqV0Kg8LUDcPFeg
         HDxrFkNUj2Z4BO6V/ItiOlu2VSeG6VW3nFJJ1dQqi5D2CPb0w7IqAd8EhnbUoSJbZaCv
         JeCxQ+iEP2EphrQzkXxz2WVtegwzPSEFZloGDbwNzvY7eYjdnh8ro9IfdCxD9Yv9wDf0
         qwBg==
X-Forwarded-Encrypted: i=1; AJvYcCVgnw4BhRJUdrRW1/C6OOnsgh/BviXEmKkQHNm3A9kCNMdexZXiyr0Y5PAp6KyBtnD5SnGREDY2KiPv4LGSOTfdVCPc+udAwo944KtUNzHg
X-Gm-Message-State: AOJu0Yyw1quFgmUVTEnFYEC970sbUGI+i1/ycxpDJuC8peSd9BgjnNaz
	+naYA7NdOMh1vXDMAcengc8HfHszKJCI1fO8/+4qivoONdJJBn44WHwYLUli
X-Google-Smtp-Source: AGHT+IG/01rNYfv7OGF7rLXfIJzMl7AZ1Rp0qTjGVjP80uYJddTfmhtx5+yiOjqQKQz2HJaETy4A7A==
X-Received: by 2002:a05:690c:7082:b0:61a:da7e:1f66 with SMTP id jg2-20020a05690c708200b0061ada7e1f66mr3197646ywb.2.1713450876420;
        Thu, 18 Apr 2024 07:34:36 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id o4-20020a81ef04000000b00617c48add4csm352494ywm.73.2024.04.18.07.34.36
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 07:34:36 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-de45e5c3c84so1004968276.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 07:34:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9ypIHuzVVLk+M11AUHGjY9h1VYX1dtpT6wkMc4sEuHiLbB23EHn8BXLdr+kTbt6oEdEYO6jXUTMg9CMfL89Djwc6tdF/GNgwkJ+sD6KrO
X-Received: by 2002:a25:df11:0:b0:de4:16b0:c8f6 with SMTP id
 w17-20020a25df11000000b00de416b0c8f6mr2918064ybg.14.1713450876072; Thu, 18
 Apr 2024 07:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240403203503.634465-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240403203503.634465-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240403203503.634465-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Apr 2024 16:34:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWUooMrm2GjGwoK4xo-BfOmX+mwvT-62KHqPcCg8kBMEw@mail.gmail.com>
Message-ID: <CAMuHMdWUooMrm2GjGwoK4xo-BfOmX+mwvT-62KHqPcCg8kBMEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Document RZ/Five SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_073439_724170_3074C7B3 
X-CRM114-Status: GOOD (  17.00  )
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

T24gV2VkLCBBcHIgMywgMjAyNCBhdCAxMDozNuKAr1BNIFByYWJoYWthciA8cHJhYmhha2FyLmNz
ZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5t
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IERvY3VtZW50IFJaL0ZpdmUgKFI5QTA3
RzA0M0YpIElSUUMgYmluZGluZ3MuIFRoZSBJUlFDIGJsb2NrIG9uIHRoZSBSWi9GaXZlCj4gU29D
IGlzIGFsbW9zdCBpZGVudGljYWwgdG8gdGhlIG9uZSBmb3VuZCBvbiB0aGUgUlovRzJMIFNvQywg
d2l0aCB0aGUgb25seQo+IGRpZmZlcmVuY2UgYmVpbmcgdGhhdCBpdCBoYXMgYWRkaXRpb25hbCBt
YXNrIGNvbnRyb2wgcmVnaXN0ZXJzIGZvcgo+IE5NSS9JUlEvVElOVC4KPgo+IEhlbmNlIG5ldyBj
b21wYXRpYmxlIHN0cmluZyAicmVuZXNhcyxyOWEwN2cwNDNmLWlycWMiIGlzIGFkZGVkIGZvciBS
Wi9GaXZlCj4gU29DLgo+Cj4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2Fy
Lm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+IC0tLQo+IHYxLT52Mgo+IC0gRHJvcHBl
ZCB0aGUgY2hlY2tzIGZvciBpbnRlcnJ1cHRzIGFzIGl0cyBhbHJlYWR5IGhhbmRsZWQKPiAtIEFk
ZGVkIFNvQyBzcGVjaWZpYyBjb21wYXQgc3RyaW5nCgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KCkdye29ldGplLGVldGluZ31zLAoKICAg
ICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhl
cmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJ
biBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15
c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0
IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
