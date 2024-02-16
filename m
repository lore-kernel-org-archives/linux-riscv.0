Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643F6C48BC4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 14:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UNYqzKDuLjre+kafzyLhyPlxIXWRCl2rRR9AAQ2hdGc=; b=ECERdjhh0/mryw
	iekBblS597vnfuqG9P5/gSLp256LW8FamfX3GFkY/giiPBkURH4HSPAXCqey5KaIwbgx4PGuXu8JN
	dXO8b9qiCj4G3w1dTsGcxTvp3iRseeNoO1Dx2H10BT3Rebl2qUtl7Pz5kTIfP/XvIjcTGBnqIvrGU
	JnL/BMrOENxdMCCp6wDbLGB/Xs/7QYOdddr+p6fVL7wF2M5n8/5xSni0WUZTbfosSl2T02TrlKR5y
	551nivAK+kVXWWfDHgp9gSatlNo5SG1TEjQfIPfsUQeB2jWyNFUPma7VcOB0OtrYInQoon4HRtnnG
	D8rnE4nAv3OoPSb1BXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rayuN-00000002YQC-1QWK;
	Fri, 16 Feb 2024 14:09:43 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rayuJ-00000002YNd-3ffJ
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 14:09:41 +0000
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6e2e42fb159so918307a34.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:09:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092577; x=1708697377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXpydOa1GZBXod51r6i4Y0/sHZuwIIC1LzAR83s7/AE=;
        b=Dkh0uuRgM/7z7BxuW3N02dfFrYEe40aqlLz0SlaXNvK7xsjlnP+JkCIH1ZCCAP6HTy
         TjZOfosoY3YMkWF3Ghmko8Q2IiUedQl6qTyN0nRMNbbmdp4u2S3I4gj3JZsX8RuDmMqI
         kSVWhU42NZbx8WqMCYlmo7Jpqls0goYHZ9P4zBtXfyLuNNo61F4Tehij9FGIPk7MqMud
         eMoPGKTosarhROQ1z9rxjDinphnYQcQ79g0nYMqoRpXCp+eO8YuBXfUUaGkFmqkVdsyS
         TQ+Vk6or7/VTO6xMhkxU4nACkkuIXkj/AHKNk9CaPh4pjKyLf3ylO/IrEFeoWLzA9J0n
         mnMw==
X-Forwarded-Encrypted: i=1; AJvYcCWyHUXaFKA62p+KoZCNqADU8R6GhPcjTg/jUkhin5fj0//tdJ5xEB0miDIdUtY8aWH2bmDGkFRrCTIUy6d2gKI5+aySbjNeHH0iREWeuTK8
X-Gm-Message-State: AOJu0YyzFLzwLz2dHy11jAF7zBalha8RwUx3wQ9HqoppU3j4EAutMjAa
	PkbjZ0ZG1AgGigtELGXnJIUSoWX2YA5ydrEHFZuh9Uq/2q8D8GixJYbN8imo+cE=
X-Google-Smtp-Source: AGHT+IHLFkLrhrlVvwCpBappTAtaTl8+EXySfTnPQZjUNPIErdv3rZGpobdQQhGQidrm0qq7nk4gSw==
X-Received: by 2002:a9d:66c9:0:b0:6e2:f24d:697c with SMTP id t9-20020a9d66c9000000b006e2f24d697cmr5576927otm.11.1708092577328;
        Fri, 16 Feb 2024 06:09:37 -0800 (PST)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com. [209.85.161.54])
        by smtp.gmail.com with ESMTPSA id j2-20020a9d7682000000b006e2ea96949csm3373otl.29.2024.02.16.06.09.37
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 06:09:37 -0800 (PST)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5986d902ae6so1054800eaf.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:09:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7wBFA5z0cxIMXSPRpqZHAX8hdmGjiOfV64xBtJYeGB76bv8ztIuBeXNvTTfJtlYrR48ET7xkmU6e7X8RWwFEuX8biSx9EUZATyYARid1l
X-Received: by 2002:a05:6358:63a2:b0:176:a071:5ce1 with SMTP id
 k34-20020a05635863a200b00176a0715ce1mr5968961rwh.27.1708092576933; Fri, 16
 Feb 2024 06:09:36 -0800 (PST)
MIME-Version: 1.0
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com> <20240208124300.2740313-9-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240208124300.2740313-9-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 15:09:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=qpVCokRW1vGDS3_ZF3RE0nVcNi9URXMNS6bUtxqTZA@mail.gmail.com>
Message-ID: <CAMuHMdV=qpVCokRW1vGDS3_ZF3RE0nVcNi9URXMNS6bUtxqTZA@mail.gmail.com>
Subject: Re: [PATCH 08/17] clk: renesas: r9a07g043: Add initial support for
 power domains
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_060939_934472_A46B9846 
X-CRM114-Status: GOOD (  14.84  )
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

SGkgQ2xhdWRpdSwKCk9uIFRodSwgRmViIDgsIDIwMjQgYXQgMTo0NOKAr1BNIENsYXVkaXUgPGNs
YXVkaXUuYmV6bmVhQHR1eG9uLmRldj4gd3JvdGU6Cj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNs
YXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgo+Cj4gSW5zdGFudGlhdGUgYWx3YXlzLW9u
IHBvd2VyIGRvbWFpbiBmb3IgUjlBMDdHMDQzIFNvQy4gQXQgdGhlIG1vbWVudCwgYWxsCj4gdGhl
IElQcyBhcmUgcGFydCBvZiB0aGlzIGRvbWFpbi4KPgo+IFNpZ25lZC1vZmYtYnk6IENsYXVkaXUg
QmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4KClRoYW5rcyBmb3IgeW91
ciBwYXRjaCEKCkFzIG5vdCBhbGwgSVBzIGFyZSBwYXJ0IG9mIHRoZSBhbHdheXMtb24gZG9tYWlu
LCBJJ2QgcmF0aGVyIGRlZmVyIHRoaXMKdW50aWwgYWxsIGRvbWFpbnMgYXJlIGhhbmRsZWQgaW4g
dGhlIGRyaXZlci4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQKCgotLQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRp
b25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cndo
ZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Ig
c29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
