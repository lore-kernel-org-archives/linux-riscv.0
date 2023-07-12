Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2321DEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 09:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ElpcWubhOhdYnT7aH6Y0yH3lJE/DBipaQz4FZmcLJk=; b=a4ddADMumje4Tv
	rXQsK6tsEwDg4AMhA5LAmBfVHZ0XwoJMOTJfv4R10uWmUBvw9bFt336Jp5TOB1aQk+We65V23g1iK
	esTFlpkYqDidU7ai97zPlG3picWZhkvFt2TwVFKNJv87i3Htgyz5npvvTxc0RRSO/kuMXGtXaWnye
	lcsuOnmFzhs70u392tx+1wPEf1JXeorR0P3aUpGliyQrjBpuPKS+rbRpeiENqUVmnVl4D5CyLfHTe
	pJ5ZC82N9ZVHfuJoPvSyW/cfpbIIb4H4FPFe3EKv7Zo5/BwzhnU1BF3Oks2m6j4g/g9U5OPPFh0GW
	B+pADqJ6QzgDhsi2t33w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJVv8-00H0Iq-2F;
	Wed, 12 Jul 2023 09:14:02 +0000
Received: from mail-yb1-f179.google.com ([209.85.219.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJVv6-00H0I0-0U
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 09:14:01 +0000
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-c5ffb6cda23so7553443276.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 02:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689153239; x=1691745239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+pzM/ps0J0V255RZBWb0G0YFpNEXWLUJowIcR6XiYjk=;
        b=koBV+iod3GC6PDeOzKTtZaiwBmpNkux0hT8vlJ8bDS4cEwvAxUsI206M0Ax01tlb6P
         xyPZaZoqt3SzxmKPQevIGx7blKuuHr2Pit6u26wjThvM72PjjqQ/pewNJWYYilgek7VR
         aKZZLOHphLjTNErYizLUSaxgo3bH5YXD/S25Tg+TqLcjb/JjAdvgDe/Xp2jvQPcaHY3j
         81PaUjYPYsikJ1licLuZBxvzl7vebUIuXCcCkBjLfTXKiusfKjp20yOGit2Loespffjs
         HoUDSKGhzGnRY9Nj6U7D30ImPFJ9uhFhhtVJu2KqGtxknBXtuxoSSh2+4Kz1+cGoR9Zv
         wDCw==
X-Gm-Message-State: ABy/qLbxUN/0AHtBC7EsgT2d3gp9ByRVZUcdn9zqQGeToR9eurvI0b8K
	mJZ8CYnjpmwiYK+X/uJMy1EXR9pASeoDiQ==
X-Google-Smtp-Source: APBJJlGrgZ9BoX2XIjmLOP5nTPpyyKYKHRTjgiqkqUibUZLRhh2OQ5vYOxuBCtInQr8CBSMXaoPj4g==
X-Received: by 2002:a25:453:0:b0:c63:7758:7015 with SMTP id 80-20020a250453000000b00c6377587015mr14746870ybe.57.1689153238720;
        Wed, 12 Jul 2023 02:13:58 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id t3-20020a5b0dc3000000b00bb21aeddeffsm823597ybr.18.2023.07.12.02.13.57
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 02:13:58 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-c4cb4919bb9so7517845276.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 02:13:57 -0700 (PDT)
X-Received: by 2002:a25:9a03:0:b0:bc1:dfa5:83a4 with SMTP id
 x3-20020a259a03000000b00bc1dfa583a4mr15070011ybn.13.1689153237624; Wed, 12
 Jul 2023 02:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230712-squealer-walmart-9587342ddec1@wendy> <18871eff-f2be-9eed-ee4c-99eba87686d8@gmail.com>
In-Reply-To: <18871eff-f2be-9eed-ee4c-99eba87686d8@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jul 2023 11:13:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX00X=L387jSrP_mZo04u0zkU8V6-g13Y2urrU1cRgS-A@mail.gmail.com>
Message-ID: <CAMuHMdX00X=L387jSrP_mZo04u0zkU8V6-g13Y2urrU1cRgS-A@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: dts: renesas: clean up dtbs_check W=1 warning
 due to empty phy node
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, conor@kernel.org, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_021400_186253_B3B5E438 
X-CRM114-Status: GOOD (  21.87  )
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

SGkgU2VyZ2VpLgoKT24gV2VkLCBKdWwgMTIsIDIwMjMgYXQgMTA6NDPigK9BTSBTZXJnZWkgU2h0
eWx5b3YKPHNlcmdlaS5zaHR5bHlvdkBnbWFpbC5jb20+IHdyb3RlOgo+IE9uIDcvMTIvMjMgMTE6
MTQgQU0sIENvbm9yIERvb2xleSB3cm90ZToKPgo+ID4gZHRic19jaGVjayB3LyBXPTEgY29tcGxh
aW5zOgo+ID4gV2FybmluZyAodW5pdF9hZGRyZXNzX3ZzX3JlZyk6IC9zb2MvZXRoZXJuZXRAMTFj
MjAwMDAvZXRoZXJuZXQtcGh5QDc6IG5vZGUgaGFzIGEgdW5pdCBuYW1lLCBidXQgbm8gcmVnIG9y
IHJhbmdlcyBwcm9wZXJ0eQo+ID4gV2FybmluZyAoYXZvaWRfdW5uZWNlc3NhcnlfYWRkcl9zaXpl
KTogL3NvYy9ldGhlcm5ldEAxMWMyMDAwMDogdW5uZWNlc3NhcnkgI2FkZHJlc3MtY2VsbHMvI3Np
emUtY2VsbHMgd2l0aG91dCAicmFuZ2VzIiBvciBjaGlsZCAicmVnIiBwcm9wZXJ0eQo+ID4KPiA+
IFRoZSBldGhlcm5ldEAxMWMyMDAwMCBub2RlIGlzIGd1YXJkZWQgYnkgYW4gYCNpZiAoIVNXX0VU
MF9FTl9OKWAgaW4KPiA+IHJ6ZzJ1bC1zbWFyYy1zb20uZHRzaSwgd2hlcmUgdGhlIHBoeSBjaGls
ZCBub2RlIGlzIGFkZGVkLiBJbgo+ID4gcnpmaXZlLXNtYXJjLXNvbS5kdHNpLCB0aGUgZXRoZXJu
ZXQgbm9kZSBpcyBtYXJrZWQgZGlzYWJsZWQgJiB0aGUKPiA+IGludGVycnVwdCBwcm9wZXJ0aWVz
IGFyZSBkZWxldGVkIGZyb20gdGhlIHBoeSBjaGlsZCBub2RlLiBBcyBhIHJlc3VsdCwKPiA+IHRo
ZSBwcm9kdWNlZCBkdHMgbG9va3MgbGlrZToKPiA+ICAgICAgIGV0aGVybmV0QDExYzIwMDAwIHsK
PiA+ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA3ZzA0My1nYmV0aFww
cmVuZXNhcyxyemcybC1nYmV0aCI7Cj4gPiAgICAgICAgICAgICAgIC8qIHNuaXAgKi8KPiA+ICAg
ICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MHgwMT47Cj4gPiAgICAgICAgICAgICAgICNz
aXplLWNlbGxzID0gPDB4MDA+Owo+ID4gICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQi
Owo+ID4KPiA+ICAgICAgICAgICAgICAgZXRoZXJuZXQtcGh5QDcgewo+ID4gICAgICAgICAgICAg
ICB9Owo+ID4gICAgICAgfTsKPiA+Cj4gPiBBZGRpbmcgYSBjb3JyZXNwb25kaW5nIGAjaWYgKCFT
V19FVDBfRU5fTilgIGFyb3VuZCB0aGUgbm9kZSBpbgo+ID4gcnpmaXZlLXNtYXJjLXNvbS5kdHNp
IGF2b2lkcyB0aGUgY29tcGxhaW50LCBhcyB0aGUgZW1wdHkgY2hpbGQgbm9kZSBpcwo+ID4gbm90
IGFkZGVkOgo+ID4gICAgICAgZXRoZXJuZXRAMTFjMjAwMDAgewo+ID4gICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gInJlbmVzYXMscjlhMDdnMDQzLWdiZXRoXDByZW5lc2FzLHJ6ZzJsLWdiZXRo
IjsKPiA+ICAgICAgICAgICAgICAgLyogc25pcCAqLwo+ID4gICAgICAgICAgICAgICAjYWRkcmVz
cy1jZWxscyA9IDwweDAxPjsKPiA+ICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MHgwMD47
Cj4gPiAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPiAgICAgICB9Owo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5j
b20+Cj4gWy4uLl0KPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvcmVuZXNh
cy9yemZpdmUtc21hcmMtc29tLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3JlbmVzYXMvcnpm
aXZlLXNtYXJjLXNvbS5kdHNpCj4gPiBpbmRleCBkNmYxODc1NGViNWQuLmM2MmRlYmM3Y2E3ZSAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvcmVuZXNhcy9yemZpdmUtc21hcmMt
c29tLmR0c2kKPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvcmVuZXNhcy9yemZpdmUtc21h
cmMtc29tLmR0c2kKPiA+IEBAIC0yMiw2ICsyMiw3IEBAICZkbWFjIHsKPiA+ICAgICAgIHN0YXR1
cyA9ICJkaXNhYmxlZCI7Cj4gPiAgfTsKPiA+Cj4gPiArI2lmICghU1dfRVQwX0VOX04pCj4KPiAg
ICBBcmUgdGhlIHBhcmVucyByZWFsbHkgbmVlZGVkIGhlcmU/CgpObyB0aGV5IGFyZW4ndC4gQnV0
IHRoaXMgZm9sbG93cyB0aGUgZXhpc3Rpbmcgc3R5bGUgb2YgdGhlIG90aGVyIHVzZXJzLgoKPgo+
ID4gICZldGgwIHsKPiA+ICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPgo+IFsuLi5dCgpH
cntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2Vl
cnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBn
ZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2hu
aWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5n
IHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtl
IHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
