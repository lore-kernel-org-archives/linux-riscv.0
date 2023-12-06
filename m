Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF45C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5lidyEaiwcpUZGJz33YaEJtGm7R9fY9jMLSOrZ/E6Y=; b=n1hDi/MGmoIg2Z
	bscdYY+g3JoeggiqZXNR+acVOUrryx7Ht0LuAIRjNjY9ypqwDhvm5yYmTxrPw1U0jyO9910iFkJO0
	MPA/WryqkYERDNTcw2aeXyxTlFv0H9u8qshggr7K+f+VVjz486VXAFBt1HWGETe3nnbGXzszgbSw9
	qKIqYy9yGEXynUIZ0zQCwq/mFrG3WnbiomjDTbL1lEMb2mxtS2xHFG75agkcL3/RpeENLAgF6QOBM
	jXSC2wGfgFKvGxRNUYdRNH4qq0L5CqqIUP84Mv4Gc77d7zPedpoiaWKO/Zxn+z+S9BiJZs8+KkCGI
	zb/90F5UiGHeK5oEyb0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAsul-00AUlU-39;
	Wed, 06 Dec 2023 14:30:15 +0000
Received: from mail-yw1-f177.google.com ([209.85.128.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAsuj-00AUkk-0R
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 14:30:14 +0000
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5d3d5b10197so61977067b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 06:30:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701873012; x=1702477812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKgGiwP9nAffHhrzMau6NrZ+ya7fy76CJB3C0voaPJ0=;
        b=pb4fI0mdfQm+gmnNEoaWaciIxdQDWZrYk87KbWjS5dnxsbIgVxrJkIU2kitsiPtemw
         fKW9XRTTWF5XZhpVlS/0Rotr0RNLu4NVLpWAdHp2tsZTZCwaHMsxgmkil69qEzjeeLyX
         V3vFl3hWtxsaRaqguLSnAfAjkFQm8hrPH31ebdk+Iaw+h9nvn3A2voMOVXxSZJbCU7K5
         wtDLOqmQCnnz9ioY8cAKdvIXS1CN2d46YmOh0ac3l4UI8pb2UwE0jpfwBl93rBKua2V6
         qTcFfJOgHXeK0pF65AJnd/PN7f8oCtjiGrJcMHa21vzDaFOvSBMvlXLWcRS2XJ4Z5JvU
         EnoQ==
X-Gm-Message-State: AOJu0YyA5/+QvSqq4hDZPCnbPS3ZTLzj7cGYiX3SPrPQzj1DZpbUO59B
	PPOuGrN1u1cZ0TT7U7OuCQ+5pwaTlYShTJBr
X-Google-Smtp-Source: AGHT+IFXN1jyPRYXKJH/0JgnTaHHzCM1tiTIHHVztqlTa8mqQxbd9YWs+JGSqwTJFQA/riGf/vS+Tw==
X-Received: by 2002:a81:9253:0:b0:5c8:9a98:74b7 with SMTP id j80-20020a819253000000b005c89a9874b7mr780318ywg.30.1701873010671;
        Wed, 06 Dec 2023 06:30:10 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id l68-20020a815747000000b005d36f6c7836sm4797003ywb.104.2023.12.06.06.30.07
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 06:30:07 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5d8a772157fso34558807b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 06:30:07 -0800 (PST)
X-Received: by 2002:a05:690c:706:b0:5d7:1941:acb with SMTP id
 bs6-20020a05690c070600b005d719410acbmr666458ywb.102.1701873007473; Wed, 06
 Dec 2023 06:30:07 -0800 (PST)
MIME-Version: 1.0
References: <20231201131551.201503-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20231201131551.201503-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20231201131551.201503-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Dec 2023 15:29:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=1tLt0QX7jR9+2ZvYBW4BEGwM9OJQkKch3y5KLvtQww@mail.gmail.com>
Message-ID: <CAMuHMdW=1tLt0QX7jR9+2ZvYBW4BEGwM9OJQkKch3y5KLvtQww@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: dts: renesas: r9a07g043f: Update
 gpio-ranges property
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_063013_176507_10DDDB14 
X-CRM114-Status: GOOD (  17.88  )
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

SGkgUHJhYmhha2FyLAoKVGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKT24gRnJpLCBEZWMgMSwgMjAy
MyBhdCAyOjE24oCvUE0gUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJl
bmVzYXMuY29tPgo+Cj4gT24gUlovRml2ZSB3ZSBoYXZlIGFkZGl0aW9uYWwgcGlucyBjb21wYXJl
ZCB0byB0aGUgUlovRzJVTCBTb0Mgc28gdXBkYXRlCj4gdGhlIGdwaW8tcmFuZ2VzIHByb3BlcnR5
IGluIFJaL0ZpdmUgU29DIERUU0kuCj4KPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxw
cmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+CgpSZXZpZXdlZC1ieTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KCj4gLS0tIGEvYXJjaC9y
aXNjdi9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M2YuZHRzaQo+ICsrKyBiL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDNmLmR0c2kKPiBAQCAtNDYsNiArNDYsMTAgQEAgY3B1
MF9pbnRjOiBpbnRlcnJ1cHQtY29udHJvbGxlciB7Cj4gICAgICAgICB9Owo+ICB9Owo+Cj4gKyZw
aW5jdHJsIHsKPiArICAgICAgIGdwaW8tcmFuZ2VzID0gPCZwaW5jdHJsIDAgMCAyMzI+Owo+ICt9
Owo+ICsKPiAgJnNvYyB7Cj4gICAgICAgICBkbWEtbm9uY29oZXJlbnQ7Cj4gICAgICAgICBpbnRl
cnJ1cHQtcGFyZW50ID0gPCZwbGljPjsKCkkgYmVsaWV2ZSB0aGlzIGhhcyBhIGhhcmQgZGVwZW5k
ZW5jeSBvbiB0aGUgcGluY3RybCBkcml2ZXIgY2hhbmdlcywgZHVlIHRvCnRoZSBmb2xsb3dpbmcg
Y2hlY2sgaW4gaW4gcnpnMmxfZ3Bpb19yZWdpc3RlcigpOgoKICAgIGlmIChvZl9hcmdzLmFyZ3Nb
MF0gIT0gMCB8fCBvZl9hcmdzLmFyZ3NbMV0gIT0gMCB8fAogICAgICAgIG9mX2FyZ3MuYXJnc1sy
XSAhPSBwY3RybC0+ZGF0YS0+bl9wb3J0X3BpbnMpIHsKICAgICAgICAgICAgZGV2X2VycihwY3Ry
bC0+ZGV2LCAiZ3Bpby1yYW5nZXMgZG9lcyBub3QgbWF0Y2ggc2VsZWN0ZWQgU09DXG4iKTsKICAg
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAgICB9CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAg
ICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJl
J3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4g
cGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNl
bGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBz
YXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
