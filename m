Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B596C77B6E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Apr 2023 21:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAv5Gzc+0r7eXb9QThRHtND49ELaq/8l1DvGmS57n8w=; b=RIqyjKU0QPraFF
	W/kvgKEWRA0P0eIAjwgi/BoTOkfI7bTAX6jUg8d9qysv2HnPBtmSTW0z5lTSYRk6/C355kgbHxGF8
	i2lFMTY2U9+WOs0FNtriXVMBQHFgRXgIXCHmA3qo9sXa6pGO6BQC3DOBvbK9VCYpsyflwsD8YT8l9
	OwP1A9w3IgJUuJnRvByxuuKWIz+UtSHOIgzS1ZXNflHG1+MRxjz5PL56/XKhNFsU2t/jjsZ2trCs6
	zuNbje5Nz+My+FkPvwzfhitOHAEDQRDr2HazrUXimd2zr694FqjhAWt/EjVMid/RART4PxIqwVMPS
	TgTHQ7RL1+dPLA9FWKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn49N-0079ig-1s;
	Thu, 13 Apr 2023 21:06:37 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pn49K-0079hz-20
	for linux-riscv@lists.infradead.org;
	Thu, 13 Apr 2023 21:06:36 +0000
Received: by mail-io1-xd36.google.com with SMTP id c10so2528117iob.9
        for <linux-riscv@lists.infradead.org>; Thu, 13 Apr 2023 14:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681419993; x=1684011993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SRchkl1detoLRdtvEPNw+w/WWg3qTy8HU5Uobm8Vwk=;
        b=VRDisKIvUI6C/VKlm/axDEIrjWxjUxh0UpBHqLJoJVv6Z+MVEEpnwTnQguhH8Tnsus
         8nXKRTYiq9IiT29tFVn+wPHKfrSsolbtq7w7L+ibWP6dYKpMvUPS1nvWASM6rsROveod
         dsF84bz2dukGKVYQhE0Tz20adVD6ujgQI+gEpAD0IEJ/u6C73UzT6WOqqDRZn7cX6tgw
         xbxMvwKIavXy0KbJCYeMw4kSo/drdQWZ0P1uzPpuB6HmlMYtnIiJM5mk4/L7tFcNViXW
         BEP9cgByst4FjjymIy9VIVKUzfeBz9p/obFzcXR03LIrfs81ozW8QC8pw289RWBkykGk
         ipJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681419993; x=1684011993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SRchkl1detoLRdtvEPNw+w/WWg3qTy8HU5Uobm8Vwk=;
        b=ApjJgqvin9I4EzcOQwK9AsS7vjxwRg0UU5s+rnAlraKW/m1P02ekaz2yuvplHTzK78
         ggpiAx9zcAQeDZkizrccAeHbIFYqwZXlc3kvtECGNe4n4IrlpfdYZxaErZHTKreDNbj9
         wtoOJJBNFd9Jewtrxd00k72w8IKV8ok732fzuGwR5PhlwkZm5tURDAdTTh8G+0N58+fH
         wYq0X1n6r4Sg11zqF3juKy0sbzDncg1XH4ZIkIg95xa7KoOzeBhcJLisVJ6HQDt2rOQP
         TXZP9c0RDV3ZV7vjmwzPHjKFF/rFy/VotXHrjqqFa0xgDtyHrqvqWiFsmztnpCvvunz0
         QZvw==
X-Gm-Message-State: AAQBX9f8Cu6XkpebfvZ8HjProLS4/kV7DJV1PSllQuVs2XrVC+LI0XOg
	7j5JGs4Q5NHtilR7GN/trVA583O8VjAo1CPXsEo=
X-Google-Smtp-Source: AKy350aT652d/KwurFfw90Ox4CWRMRjX+PAvoseFaNyYXPjgTJvo2BjSO0kyWOLVZDQox7IFfzPWYCyvL17WareaCZE=
X-Received: by 2002:a6b:680a:0:b0:760:c237:bdd7 with SMTP id
 d10-20020a6b680a000000b00760c237bdd7mr468142ioc.1.1681419993239; Thu, 13 Apr
 2023 14:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230412110900.69738-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230412-cheddar-prune-5ce03ccf5581@spud> <20230413-aorta-unheated-c9bb35411fb2@wendy>
 <CA+V-a8uksWMihUadYc_dCoef7vaC5ncOicX0oGpSP9HRnHgScw@mail.gmail.com> <20230413-staunch-superman-e71fd3303176@spud>
In-Reply-To: <20230413-staunch-superman-e71fd3303176@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Apr 2023 22:06:06 +0100
Message-ID: <CA+V-a8sGsbz5snMzc7JqFVktafzvEJTq3RNH+ndNBV6Fxj5bbQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/7] cache: Add L2 cache management for Andes AX45MP
 RISC-V core
To: Conor Dooley <conor@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Conor Dooley <conor.dooley@microchip.com>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Guo Ren <guoren@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel@sholland.org>, linux-riscv@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_140634_676121_CE84DFF0 
X-CRM114-Status: GOOD (  11.63  )
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

T24gVGh1LCBBcHIgMTMsIDIwMjMgYXQgNzo0NuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiA+IElzCj4gPiBkbWEtbm9uY29oZXJlbnQuYyBhbHNvIHZhbGlk
IGZvciBSSVNDVi0zMj8gSWYgbm90IHRoZW4gd2UgY2FuIG1ha2UKPiA+IHBtZW0uYyBjb21waWxl
IGNvbmRpdGlvbmFsbHkgaWYgRE1BIG5vbi1jb2hlcmVuZXQgaXMgZW5hYmxlZCBhbmQgd2UKPiA+
IG1ha2UgRE1BIG5vbi1jb2hlcmVudCBkZXBlbmQgb24gNjRiaXQuCj4KPiBDb3VsZCB5b3UgZHJv
cCB0aGUge3MsbH1kIGluIGV4Y2hhbmdlIGZvciB7cyxsfXcgaW5zdGVhZCwgb3IgYW0gSQo+IHBy
b2dyZXNzaW5nIGV2ZW4gZnVydGhlciBpbnRvIGJyYWlubyB0ZXJyaXRvcnk/Ckp1c3QgdGhlIGRp
cmVjdCBleGNoYW5nZSB3b250IHdvcmsgaW4gYWRkaXRpb24gc2hpZnRpbmcgKyBvcmluZyB0bwp0
YWtlIGNhcmUgb2YgNjQtYml0IHdpbGwgcmVxdWlyZS4gKENvcnJlY3QgbWUgaWYgSSdtIHdyb25n
IGhlcmUpCgpJIHdhcyB3b25kZXJpbmcgbm93IGlmIHdlIG5lZWQgdG8gc3RvcmUvcmVzdG9yZSB0
aGUgczAgYW5kIHJhCnJlZ2lzdGVycy4gSSBzdHVtYmxlZCBvbiBhbiBYODYgaW1wbGVtZW50YXRp
b24gd2hpY2ggaGFzIGNhbGwgWzBdIGluCnRoZSBBTFRFUk5BVElWRV9YKCkgbWFjcm8gYnV0IGhl
cmUgd2UgZG9udCBzdG9yZS9yZXN0b3JlIHRoZQpyZWdpc3RlcnMuIElzIHRoZSBSSVNDLVYgaW1w
bGVtZW50YXRpb24gb2YgQUxUIG1hY3JvIGRpZmZlcmVudApjb21wYXJlZCB0byB4ODY/CgpbMF0g
aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS91YWNjZXNzXzY0LmgjTDEwNQoKQ2hlZXJzLApQcmFiaGFrYXIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
