Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85C5C48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 14:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sHD801A9PiRJ9MbuEBg9/878uQrrE/gkTl7Bfrq4OI=; b=lJyijq1z4Z/WDp
	L+pcXCeU+4GxW1AutsTEhF0ACgLllVfaHvg8K+uTkHrPDQ7yeeIoo0yoyGopZ27RFCmnMJoV+MJ5S
	9B/37SfIaZgyI7WRCfgKh1kvleFjUdRfRfblyjMF/mnmeMUrabscLCnN6LHlWSPEIILtvF0f/LT+w
	p1u3X33PsPH6kCPQ/deNuv/Xalt/FaQNLC/t3SF8NjMs6swWaovCxTHRG266Uyqb5nbDJxyQQR2aM
	6sM65kVwqVbt5zQNU4A/H6XvFo4YcndaYwYPCLuSbDaZ4nm33Dh2FoblzJcfY3BG7xz0K/qG/UlIM
	ocKc0Gx9dLZbi1rfE3lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raywK-00000002ZAw-2E36;
	Fri, 16 Feb 2024 14:11:44 +0000
Received: from mail-yb1-f171.google.com ([209.85.219.171])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raywH-00000002Z9P-42bm
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 14:11:43 +0000
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso1985355276.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:11:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092699; x=1708697499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxU+OH4tOB8SnuDggPv443FXpkfBxYUxV4DulHiEADs=;
        b=cyDPCTGfjMV/GN5j7o+q3V8PeYlPUxofW4IuZLW1JFZkjpqp31bqtLIDQuGMIRop9j
         oZunw9fKcLBbywXGD3bULiruylId06Ae/e+4dS/v3VrYWnro8u0SvIHhi7nGmQOkcEq/
         TlL26sotqN5YLT/C3zCOzL8JB7tr/hsmQ5IlRhei2FlQqqvcJSe008X/ZJ9GLjga7At8
         /t0fTTQTes68tYEdvy6TNMJR3/GO5A8N2TotLeshScJil57H4vqoJ/AfdiM3kCefjshB
         tLFSmsw/nDKMkG09AH3Z9NXH5aduh0XFf6QbKDNBhTbRdGiScC5XVzxVaAerbbffaXZe
         dJ6w==
X-Forwarded-Encrypted: i=1; AJvYcCUZCXj1qvTxWv6shWW+S5mgXzHBxfzobTmuW3YPQR1+T6FGZwcGoiy4LsicFhacfoNgZgHE9RKX8ZyS1Wu2brzj1YkNSInZ2ArSy4jx/Qcl
X-Gm-Message-State: AOJu0YxlKrVAbWjewYJQ2UypZA1pPIX5hWB+zjbq6CrtYZiWwReNwKt6
	VlQrPSRwZhR7J4Mq4pTGQmgRbDcTwaxtNj9CcBbNhaCXz8AthqA5mOitTI5hKgQ=
X-Google-Smtp-Source: AGHT+IGeEyc4bj8U2rEi8uj+c4IVZIjGhQ/aCyM30PDW9wW1QZ8xV6gT66A0Ydt711hYwrwWXDNaMQ==
X-Received: by 2002:a25:b949:0:b0:dcb:b41c:77ef with SMTP id s9-20020a25b949000000b00dcbb41c77efmr4392743ybm.24.1708092698881;
        Fri, 16 Feb 2024 06:11:38 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 2-20020a250c02000000b00dcbbea79ffcsm325346ybm.42.2024.02.16.06.11.38
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 06:11:38 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-607ec539525so12805937b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:11:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXVLup7vQaRI6/6YOARw2//OFgEjrXP2Q+HMZbtE0pDD/9f10ikRmFQquw44lEPIFlkjK1w+H1Ma8Wk+PXLwVZ8zDDQwSXXYMew8A+fN1MK
X-Received: by 2002:a81:ae4d:0:b0:607:f50f:3770 with SMTP id
 g13-20020a81ae4d000000b00607f50f3770mr2394746ywk.41.1708092697973; Fri, 16
 Feb 2024 06:11:37 -0800 (PST)
MIME-Version: 1.0
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com> <20240208124300.2740313-15-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240208124300.2740313-15-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 15:11:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXoRiH5rCO+RqA1ZYMVtbdMGjW2WC3cCTE44ipWR9ccnw@mail.gmail.com>
Message-ID: <CAMuHMdXoRiH5rCO+RqA1ZYMVtbdMGjW2WC3cCTE44ipWR9ccnw@mail.gmail.com>
Subject: Re: [PATCH 14/17] arm64: dts: renesas: r9a07g044: Update
 #power-domain-cells = <1>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_061142_020362_AC9885AA 
X-CRM114-Status: GOOD (  18.00  )
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
YXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgo+Cj4gVXBkYXRlIENQRyAjcG93ZXItZG9t
YWluLWNlbGxzID0gPDE+IGFuZCBtb3ZlIGFsbCB0aGUgSVBzIHRvIGJlIHBhcnQgb2YgdGhlCj4g
YWx3YXlzIG9uIHBvd2VyIGRvbWFpbiBhcyB0aGUgZHJpdmVyIGhhcyBiZWVuIG1vZGlmaWVkIHRv
IHN1cHBvcnQgbXVsdGlwbGUKPiBwb3dlciBkb21haW5zLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2xh
dWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgoKVGhhbmtzIGZv
ciB5b3VyIHBhdGNoIQoKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdn
MDQ0LmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQ0LmR0
c2kKPiBAQCAtMjM4LDcgKzIzOCw3IEBAIG10dTM6IHRpbWVyQDEwMDAxMjAwIHsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAidGdpYTgiLCAidGdpYjgiLCAidGdp
YzgiLCAidGdpZDgiLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICJ0Y2l2OCIsICJ0Y2l1OCI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZj
cGcgQ1BHX01PRCBSOUEwN0cwNDRfTVRVX1hfTUNLX01UVTM+Owo+IC0gICAgICAgICAgICAgICAg
ICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JmNwZz47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cG93ZXItZG9tYWlucyA9IDwmY3BnIFI5QTA3RzA0NF9QRF9BTFdBWVNfT04+OwoKVGhpcyBzaG91
bGQgYmUgUjlBMDdHMDQ0X1BEX01UVSwgYnV0IHRoYXQgZG9tYWluIGlzIG5vdCB5ZXQgc3VwcG9y
dGVkCmJ5IHRoZSBkcml2ZXIuICBJbnN0ZWFkIG9mIGFkZGluZyBpbmNvcnJlY3QgaGFyZHdhcmUg
ZGVzY3JpcHRpb25zLApJJ2QgcmF0aGVyIGRlZmVyIHRoaXMgdW50aWwgYWxsIGRvbWFpbnMgYXJl
IGhhbmRsZWQgYnkgdGhlIGRyaXZlci4KCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmVzZXRz
ID0gPCZjcGcgUjlBMDdHMDQ0X01UVV9YX1BSRVNFVF9NVFUzPjsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAjcHdtLWNlbGxzID0gPDI+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1
cyA9ICJkaXNhYmxlZCI7CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAg
ICAgIEdlZXJ0CgoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVy
c2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1
dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
