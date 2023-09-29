Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622C2E743F8
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 08:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kyCNgSetXgvO4nXgr3f3PhQK+PUmDF3RqNyXztL/Pgk=; b=nWzMJO/PJkZwWz
	ZHzwol+iq+uHyrPZR3SZHabT+rjwXvs7sChgYB59EqkYiBjxG+6LtdY5Hk1BBm1ZH0h/u1dodLmf6
	yw2UsPfQk4zdf0wINSpH6TRrxoLoNFZaJ+i+Gib9op4QUAaLK0kvdPjbvrCuRZlufR1Cip+rUprj/
	rn2VwXyn3kMqYLdbyGO8lV1D7O40Lfgeg/ZYj3IaIyJJuaJx54Tri0w766W6A4W63NBf6m6be/Bav
	UtnK6Q/E+9xkIcobZgpOolYCEVem8T3JI+P2GPYnt33muFoZc4+3PSUOaesDnP41a/AMjvNiZtz4t
	VPu+XSaxXrPU0G8HjabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm8z2-007Nej-3D;
	Fri, 29 Sep 2023 08:36:24 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm8z0-007NeI-0O
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 08:36:23 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-496d3e18f19so5482330e0c.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 01:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695976579; x=1696581379; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5Kz8VFA+B2AxBslxteitG48MqhtGdsjVZBje8m+de0=;
        b=GOmXTOkHlp3rbGAVZgHFq4j7UcpBSduDD2HxIOrsVvOmySUonzjEwfDQW4Oxy22wfW
         qLlccd4oaIOaAe1J2euK31cC7ZZ8sDbtecYjbYF2NrRshm7mzBauhnu/E2R87KJtnrUb
         e1V44/BUa5P8WUd7nTM6cL1ZQ7xC+erMCACinhf15CMc3+ilhyw7lRafnw70OH3g7YIL
         ZoLmuY5vpilzey3SUx/gv3H914DNB8DT9KoSov3odOkSP5pZxQEIZtOn8WE5dXBDj9rI
         zAwGBPkSEKSV630mMoAD+Lgq6/2CwjNHTaLXf4cdvZyVng+VaTN9q9LqiQ1RjTOx+2yL
         5FGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695976579; x=1696581379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5Kz8VFA+B2AxBslxteitG48MqhtGdsjVZBje8m+de0=;
        b=o4HfruckBaVpWwBj8Qqa0pG6hJChwpa8kZFYCSYnBKDG62xcjoyNjx9u9lZ4UbtVJp
         IBLatNujthxGENcj/Zq1Yj/LNiicPIP4leBz969aAhk3d8jUbGHDx1UOjI2NDlUUBKnM
         TSNayWXAb8WANOR6ft+2MAulIoPBciB3CoQqRapNsPt83ICWO2dGZofU0YWlaTGUkRA8
         MoQT1BanSjG3ZTMAT/8aI/ya3TGj363v6WiTUwm9WXJcXGA4YnqiuynDMvCVSpaot4Of
         tu7Og4B+hOcIebyXXOkZXF3y9exj15ulbrbU52QqWY8Quv8xcctFq3iVN+6gxwRpErw4
         o+Pg==
X-Gm-Message-State: AOJu0YxCKhVe9Z6Ym9gDkZ09sAUbJzpXRU+6WIV1MMOuJNy78Vu0Akib
	tuDakqS2l3zLAM6H4lKTsZD3nVdW9ZpOjnCMOfE=
X-Google-Smtp-Source: AGHT+IHclMXMPLNIE54QUwl5QiPwm1i2DMnOHWq32pITFa8iicU/ER3VPH4Fz0mWUm2pdxJCcgkESqSRAqq9PTE2Xj0=
X-Received: by 2002:a1f:d686:0:b0:49a:5b11:1996 with SMTP id
 n128-20020a1fd686000000b0049a5b111996mr3076694vkg.6.1695976579560; Fri, 29
 Sep 2023 01:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230929000704.53217-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <3d9eb660-e255-4477-a04b-6db8d249a20d@sifive.com>
In-Reply-To: <3d9eb660-e255-4477-a04b-6db8d249a20d@sifive.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 29 Sep 2023 09:35:53 +0100
Message-ID: <CA+V-a8v+eYk3Hmi7G74Na-=O5AF5hhovKmJ6VDj4DX9b7sXvzw@mail.gmail.com>
Subject: Re: [PATCH 4/5] riscv: dts: renesas: rzfive-smarc: Drop dma
 properties from SSI1 node
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_013622_186909_CA1F9812 
X-CRM114-Status: GOOD (  19.08  )
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

SGkgU2FtdWVsLAoKT24gRnJpLCBTZXAgMjksIDIwMjMgYXQgMTozMOKAr0FNIFNhbXVlbCBIb2xs
YW5kCjxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIFByYWJoYWthciwK
Pgo+IE9uIDIwMjMtMDktMjggNzowNyBQTSwgUHJhYmhha2FyIHdyb3RlOgo+ID4gRnJvbTogTGFk
IFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4K
PiA+IFdpdGggRE1BIGVuYWJsZWQgYXVkaW8gY2FwdHVyZS9wbGF5YmFjayBoYXMgc29tZSBlY2hv
IG5vaXNlLiBTbyBmb3IKPiA+IG5vdyBzd2l0Y2ggdG8gUElPIG1vZGUgdW50aWwgZml4ZWQuCj4K
PiBJcyBpdCByZWFsbHkgYXBwcm9wcmlhdGUgdG8gd29yayBhcm91bmQgYSBMaW51eCBzb2Z0d2Fy
ZSBidWcgd2l0aCBhIERUIGNoYW5nZQo+IGxpa2UgdGhpcz8gUmVtZW1iZXIsIHRoZSBkZXZpY2V0
cmVlcyBhcmUgdXNlZCBieSBzb2Z0d2FyZSBvdGhlciB0aGFuIExpbnV4Lgo+CkFncmVlZCBub3Qg
YSBnb29kIGlkZWEsIHRoaXMgd29ya2VkIHdpdGggcHJldmlvdXMga2VybmVsIHZlcnNpb24gYW5k
IEkKd2FudGVkIHRvIG1ha2Ugc3VyZSBwZW9wbGUgdXNpbmcgdXBzdHJlYW0ga2VybmVsIGJlIGF3
YXJlIG9mIHRoaXMKaXNzdWUuIEFzIHlvdSBtZW50aW9uZWQgdGhpcyBpcyBub3QgYSBjb3JyZWN0
IGFwcHJvYWNoIEltIGhhcHB5IGZvcgp0aGlzIHBhdGNoIHRvIGJlIGRyb3BwZWQgZnJvbSB0aGUg
c2VyaWVzLgoKQ2hlZXJzLApQcmFiaGFrYXIKCj4gUmVnYXJkcywKPiBTYW11ZWwKPgo+ID4gU2ln
bmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJl
bmVzYXMuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy9yZW5lc2FzL3J6Zml2
ZS1zbWFyYy5kdHNpIHwgNSArKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9yZW5lc2FzL3J6Zml2
ZS1zbWFyYy5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9yZW5lc2FzL3J6Zml2ZS1zbWFyYy5k
dHNpCj4gPiBpbmRleCBhODU3M2ZkZmQ4YjEuLjg1Zjk2ZTI0YTk2ZSAxMDA2NDQKPiA+IC0tLSBh
L2FyY2gvcmlzY3YvYm9vdC9kdHMvcmVuZXNhcy9yemZpdmUtc21hcmMuZHRzaQo+ID4gKysrIGIv
YXJjaC9yaXNjdi9ib290L2R0cy9yZW5lc2FzL3J6Zml2ZS1zbWFyYy5kdHNpCj4gPiBAQCAtNiwz
ICs2LDggQEAKPiA+ICAgKi8KPiA+Cj4gPiAgI2luY2x1ZGUgPGFybTY0L3JlbmVzYXMvcnpnMnVs
LXNtYXJjLmR0c2k+Cj4gPiArCj4gPiArJnNzaTEgewo+ID4gKyAgICAgL2RlbGV0ZS1wcm9wZXJ0
eS8gZG1hczsKPiA+ICsgICAgIC9kZWxldGUtcHJvcGVydHkvIGRtYS1uYW1lczsKPiA+ICt9Owo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
