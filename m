Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCDAC072A2
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 09:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mSdV7/BvaVX+iJ6lf1MVp1jrlu+JlQcoBkqcj/r5qM8=; b=dHS1+rO2GlJQwN
	3sHluCFWO+GfVioSyJ65MYOITOyx2Y1nf9CftE/x3Wx43rlqXRz0F/0FrNVRwP8JknFTgIn51xZXi
	jklfoOJM+Jl5qJYjUmK6iGd0y3foJ9Ff44K8Ajl/m4pd8HJ5QyRKxRiLMxw0b0vSN9guhsaLSxyse
	jdhW0oY3IbBGkr0Q6OSd2LvYefl6g49/dDiT0rPS6c7HYB+qP8IL9m83fK+jPKl2vP9FXTiqzM+J9
	06m1uAlT6LEUmGg2704Rd8O+e8v7SpkR1VPW+RHmYt8UXb9dDbGTFOUfiiu1D/alFDxBXHUbcdS2s
	Tw/Qvc2EEUo6NL5C5Geg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uuN-0061oh-1b;
	Fri, 17 Nov 2023 09:13:03 +0000
Received: from mail-yw1-f177.google.com ([209.85.128.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uuK-0061o0-2N;
	Fri, 17 Nov 2023 09:13:02 +0000
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5a7dd65052aso20024477b3.0;
        Fri, 17 Nov 2023 01:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700212378; x=1700817178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvynnOaR8xM7O4hHqd8ZbKUHknCSu+mkNKpvTcNlZWQ=;
        b=KbHxk470LUFrwaaf4/YUy689vabOGPo4vRp1s/k2GkaFWtLgmEqfvpEMlhmR6GQAsc
         bF2aYpIuD2tLHr5/4u81RIOO7o5KKcDV34e58bH3d9Ca687zxfNutDMq18jrbOxqxd+n
         bj7PlziFJr9G4WQc8Zxuj491qLjYnnh2GV6oyoMdhzjKR3aWGgk/bh7tIIf2JHARhmIr
         n6361bnjnJaJyX1e4YrObRBcHRoCzZRuqH3IVt0OK5am9/MhJwaIuRx7PPxRfaukUK8H
         O5VfIcQIZv4+yZUm2ub4OtzhwcyPb98C0JW5xC2dgPXLtjsuDpnOKnjYLM7h3PLLm1oc
         eA3w==
X-Gm-Message-State: AOJu0YxI8Xq4nl5RVMhu/GAAQHosn24npUvBZloijt4hlZ+Ew7MOaX1k
	1HaALSk8iQ0cuw1twk+vywuVboLTJzJOLg==
X-Google-Smtp-Source: AGHT+IGLXtzNPU2hYxhm1XMt11wVruPPCcxP3D8Bk1deYu0+4FIra9q4Bc3n2TMePI2a73zvaGoKTg==
X-Received: by 2002:a0d:cb8b:0:b0:5a7:ab55:b9af with SMTP id n133-20020a0dcb8b000000b005a7ab55b9afmr18311847ywd.35.1700212378015;
        Fri, 17 Nov 2023 01:12:58 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id i133-20020a81548b000000b005a206896d62sm383211ywb.111.2023.11.17.01.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 01:12:57 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d9fe0a598d8so1690293276.2;
        Fri, 17 Nov 2023 01:12:57 -0800 (PST)
X-Received: by 2002:a25:3792:0:b0:da3:743d:ea3e with SMTP id
 e140-20020a253792000000b00da3743dea3emr18343937yba.21.1700212377409; Fri, 17
 Nov 2023 01:12:57 -0800 (PST)
MIME-Version: 1.0
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <f253b50a-a0ac-40c6-b13d-013de7bac407@lunn.ch> <233a45e1-15ac-40da-badf-dee2d3d60777@collabora.com>
 <cb6597be-2185-45ad-aa47-c6804ff68c85@collabora.com> <20231116-stellar-anguished-7cf06eb5634a@squawk>
 <CAMuHMdXdeW9SRN8hq-0722CiLvXDFVwpJxjFTGgdc2mhT=ppYw@mail.gmail.com>
 <b4a3a139-4831-447e-94ed-d590986aed8c@collabora.com> <84fd076b-6db4-4251-aff8-36befc28e574@collabora.com>
In-Reply-To: <84fd076b-6db4-4251-aff8-36befc28e574@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Nov 2023 10:12:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVXAx+b6=70PdgJrpbegBkDpb3w1UF0_u1Odi=JoYL2-w@mail.gmail.com>
Message-ID: <CAMuHMdVXAx+b6=70PdgJrpbegBkDpb3w1UF0_u1Odi=JoYL2-w@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] [UNTESTED] riscv: dts: starfive:
 beaglev-starlight: Enable gmac
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Conor Dooley <conor@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Samin Guo <samin.guo@starfivetech.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_011300_771321_2E08AA0E 
X-CRM114-Status: GOOD (  35.26  )
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

SGkgQ3Jpc3RpYW4sCgpPbiBGcmksIE5vdiAxNywgMjAyMyBhdCA5OjU54oCvQU0gQ3Jpc3RpYW4g
Q2lvY2FsdGVhCjxjcmlzdGlhbi5jaW9jYWx0ZWFAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4gT24g
MTEvMTcvMjMgMTA6NDksIENyaXN0aWFuIENpb2NhbHRlYSB3cm90ZToKPiA+IE9uIDExLzE3LzIz
IDEwOjM3LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPj4gT24gVGh1LCBOb3YgMTYsIDIw
MjMgYXQgNjo1NeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4g
Pj4+IE9uIFRodSwgTm92IDE2LCAyMDIzIGF0IDAzOjE1OjQ2UE0gKzAyMDAsIENyaXN0aWFuIENp
b2NhbHRlYSB3cm90ZToKPiA+Pj4+IE9uIDEwLzMwLzIzIDAwOjUzLCBDcmlzdGlhbiBDaW9jYWx0
ZWEgd3JvdGU6Cj4gPj4+Pj4gT24gMTAvMjkvMjMgMjA6NDYsIEFuZHJldyBMdW5uIHdyb3RlOgo+
ID4+Pj4+PiBPbiBTdW4sIE9jdCAyOSwgMjAyMyBhdCAwNjoyNzoxMkFNICswMjAwLCBDcmlzdGlh
biBDaW9jYWx0ZWEgd3JvdGU6Cj4gPj4+Pj4+PiBUaGUgQmVhZ2xlViBTdGFybGlnaHQgU0JDIHVz
ZXMgYSBNaWNyb2NoaXAgS1NaOTAzMVJOWENBIFBIWSBzdXBwb3J0aW5nCj4gPj4+Pj4+PiBSR01J
SS1JRC4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBUT0RPOiBWZXJpZnkgaWYgbWFudWFsIGFkanVzdG1l
bnQgb2YgdGhlIFJYIGludGVybmFsIGRlbGF5IGlzIG5lZWRlZC4gSWYKPiA+Pj4+Pj4+IHllcywg
YWRkIHRoZSBtZGlvICYgcGh5IHN1Yi1ub2Rlcy4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gUGxlYXNlIGNv
dWxkIHlvdSB0cnkgdG8gZ2V0IHRoaXMgdGVzdGVkLiBJdCBtaWdodCBzaGVkIHNvbWUgbGlnaHQg
b24KPiA+Pj4+Pj4gd2hhdCBpcyBnb2luZyBvbiBoZXJlLCBzaW5jZSBpdCBpcyBhIGRpZmZlcmVu
dCBQSFkuCj4gPj4+Pj4KPiA+Pj4+PiBBY3R1YWxseSwgdGhpcyBpcyB0aGUgbWFpbiByZWFzb24g
SSBhZGRlZCB0aGUgcGF0Y2guIEkgZG9uJ3QgaGF2ZSBhY2Nlc3MKPiA+Pj4+PiB0byB0aGlzIGJv
YXJkLCBzbyBpdCB3b3VsZCBiZSBncmVhdCBpZiB3ZSBjb3VsZCBnZXQgc29tZSBoZWxwIHdpdGgg
dGVzdGluZy4KPiA+Pj4+Cj4gPj4+PiBARW1pbCwgQENvbm9yOiBBbnkgaWRlYSB3aG8gbWlnaHQg
aGVscCB1cyB3aXRoIGEgcXVpY2sgdGVzdCBvbiB0aGUKPiA+Pj4+IEJlYWdsZVYgU3RhcmxpZ2h0
IGJvYXJkPwo+ID4+Pgo+ID4+PiBJIGRvbid0IGhhdmUgb25lICYgSSBhbSBub3Qgc3VyZSBpZiBF
bWlsIGRvZXMuIEdlZXJ0IChDQ2VkKSBzaG91bGQgaGF2ZQo+ID4+Cj4gPj4gSSBiZWxpZXZlIEVz
bWlsIGhhcy4KPiA+Pgo+ID4+PiBvbmUgdGhvdWdoLiBJcyB0aGVyZSBhIHNwZWNpZmljIHRlc3Qg
eW91IG5lZWQgdG8gaGF2ZSBkb25lPwo+ID4+Cj4gPj4gSSBnYXZlIGl0IGEgdHJ5LCBvbiB0b3Ag
b2YgbGF0ZXN0IHJlbmVzYXMtZHJpdmVyc1sxXS4KPgo+IFsuLi5dCj4KPiA+Pgo+ID4+IExvb2tz
IGxpa2UgaXQgbmVlZHMgbW9yZSBub24tY29oZXJlbnQgc3VwcG9ydCBiZWZvcmUgd2UgY2FuIHRl
c3QKPiA+PiBFdGhlcm5ldC4KPiA+Cj4gPiBIaSBHZWVydCwKPiA+Cj4gPiBUaGFua3MgZm9yIHRh
a2luZyB0aGUgdGltZSB0byB0ZXN0IHRoaXMhCj4gPgo+ID4gQ291bGQgeW91IHBsZWFzZSBjaGVj
ayBpZiB0aGUgZm9sbG93aW5nIGFyZSBlbmFibGVkIGluIHlvdXIga2VybmVsIGNvbmZpZzoKPiA+
Cj4gPiAgIENPTkZJR19ETUFfR0xPQkFMX1BPT0wKPiA+ICAgQ09ORklHX1JJU0NWX0RNQV9OT05D
T0hFUkVOVAo+ID4gICBDT05GSUdfUklTQ1ZfTk9OU1RBTkRBUkRfQ0FDSEVfT1BTCj4gPiAgIENP
TkZJR19TSUZJVkVfQ0NBQ0hFCgpDT05GSUdfRE1BX0dMT0JBTF9QT09MIGFuZCBDT05GSUdfUklT
Q1ZfTk9OU1RBTkRBUkRfQ0FDSEVfT1BTIHdlcmUKaW5kZWVkIG5vIGxvbmdlciBlbmFibGVkLCBh
cyB0aGV5IGNhbm5vdCBiZSBlbmFibGVkIG1hbnVhbGx5LgoKQWZ0ZXIgY2hlcnJ5LXBpY2tpbmcg
Y29tbWl0IGUxNGFkOWZmNjdmZDUxZGMgKCJyaXNjdjogZXJyYXRhOiBBZGQKU3RhckZpdmUgSkg3
MTAwIGVycmF0YSIpIGluIGVzbWlsL3Zpc2lvbmZpdmUgdGhlc2Ugb3B0aW9ucyBiZWNvbWUKZW5h
YmxlZC4gTm93IGl0IGdldHMgYSBiaXQgZnVydGhlciwgYnV0IHN0aWxsIGxvdHMgb2YgQ0NBQ0hF
IERhdGFGYWlsCmVycm9ycy4KCj4gQWxzbyBwbGVhc2Ugbm90ZSB0aGUgc2VyaWVzIHJlcXVpcmVz
IHRoZSBTaUZpdmUgQ29tcG9zYWJsZSBDYWNoZQo+IGNvbnRyb2xsZXIgcGF0Y2hlcyBwcm92aWRl
ZCBieSBFbWlsIFsxXS4KPgo+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMx
MDMxMTQxNDQ0LjUzNDI2LTEtZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbS8KClRo
YXQgc2VyaWVzIGRvZXMgbm90IGNvbnRhaW4gYW55IEtjb25maWcgY2hhbmdlcywgc28gdGhlcmUg
bXVzdCBiZQpvdGhlciBtaXNzaW5nIGRlcGVuZGVuY2llcz8KClBlcmhhcHMgSSBzaG91bGQganVz
dCBkZWZlciB0byBFbWlsIDstKQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
