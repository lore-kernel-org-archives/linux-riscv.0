Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6C7EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 09:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7uc3dHkdWBSMftlWrKrdWYr7osqeZIysl4LvhJ92ej0=; b=lLQAEvWhFulmxX
	P3XK8zYB7M/AHuhe21pLvVZy3vKdzWcPgK7UIkaPm9KHQBe5YdtxBYYfGtdikl/5IWbXOT6IKCaQN
	JOKw3yGPok3GkMJm0z26sw4QEW6mhWdW0t2WYCNsx/jOsdzruy+uOrHqQdzya81KEWkWUXa9C4ZN8
	rRN1NbkGfrgKXg/L/+kA2zuegnc7F2f+J5F1nTfT0KXxH/XJMz9cuarGpg0GAoavyFvglK+5GwZBm
	K8igCrQ4aEnD4bTyZhl95QlvWzoXmz/O2M4eIVI628wEgbVubRW8ycfHGHgq8Q60SFavXlYLp5iNy
	og3CldbMAAlGNlpRvu4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHKtP-0011zf-00;
	Thu, 06 Jul 2023 09:03:15 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHKtM-0011yR-1Q
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 09:03:14 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso378166f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 02:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1688634188; x=1691226188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybQ/CZNAG22pD3nH7OaccSop7ti/KICGWdaCbCpWb14=;
        b=SPRuhrsU4TSIm81nyIGiQJOxNSGVrgc2ZnWi4srtTkZ0wWkAx3AXtw/nFgSNPwXheH
         UBhUkZjxKYkzswW+UnUCuciCyPkB2pKklhz0ldSLRLlZL29npRWKBX/tZeOCgkfkan8I
         NyaM7QtBrB3wVE4d1I+p6eri/YCF1nSQkXixTTKRW7OHMLF5DGPAUwfmIp+a9kQFi+QZ
         dwrZuwue0Nsv/nLw6+5+pnn+yLGBJvolGR5UH6bhotiRs7gsW3XV7zLLa6rU26uSG3NA
         PaP4+xsD8moXD9ofLXVV5AnVmq43PoQuefdVLnuLRA2O7E2LgY9jYwFMyX1q0lBIwmUW
         dO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688634188; x=1691226188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybQ/CZNAG22pD3nH7OaccSop7ti/KICGWdaCbCpWb14=;
        b=G3u5KIEJfngQWrzfqria2xajKz2L5civs59R56iwcZxpP42PB5mBpjVhEqS2JoEcYQ
         VRVg9/mtTNa4R2G9JvyCcOCCgCDdAZtPX3iqH8xTqvfa6bL+h+zWpL10ynXySoyccjsG
         vB7nPh6IeOczcqcmBP2iNUou2RC84Ds5cnHvyOx3EeMrkNC/xxcxsZBzO5Ctj0qgLOuz
         xJzuj5AQR6gruZz5M46eenoqEqSEJ3+8mrMj07UqJOleCyKuFKnlC9P/TGxI5ndtnVoP
         TCS+3C3AMJfBYchxPv+d6NOAH4rvYWwNV37XiyLhu/VYYeb1odulrj9eILaUWqUlyGzg
         Fxmg==
X-Gm-Message-State: ABy/qLZCxq+MdcLAoN+gy+u0njVxeDzeleg1PRMTHqSfBjtZ48bTZzW1
	+HrK1tSs6FkwD1zOiN5Bf0xTYaTjvniHkk5J2i0IPw==
X-Google-Smtp-Source: APBJJlF97KD9nLAou+VLQkV6g+z36j8hSfywgVoYBVe0e6ASGIqI6D+7x6tZL67ba1/M8KAZyS4Nqzkvo9nQIHhhqzA=
X-Received: by 2002:a5d:6047:0:b0:313:e8f9:803 with SMTP id
 j7-20020a5d6047000000b00313e8f90803mr891587wrt.3.1688634187925; Thu, 06 Jul
 2023 02:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230705114251.661-1-cuiyunhui@bytedance.com> <20230705114251.661-5-cuiyunhui@bytedance.com>
 <20230705-oblivious-unstuffed-8e028a5b243c@spud> <CAEEQ3wmG1OiE3GFqQp9SP+oKUbTfuTPx=rNGd-sjKsW7vv3bew@mail.gmail.com>
 <20230706-syndrome-wise-c1097518f2c6@wendy>
In-Reply-To: <20230706-syndrome-wise-c1097518f2c6@wendy>
From: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Date: Thu, 6 Jul 2023 17:02:56 +0800
Message-ID: <CAEEQ3wk5AnesBhgHVkCqQbjC=ALShzJnRnppmFQfSeAxZ-51pw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 4/4] dt-bindings: firmware: Document
 ffitbl binding
To: Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_020312_654400_7752F6DA 
X-CRM114-Status: GOOD (  31.78  )
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
Cc: mark.rutland@arm.com, allen-kh.cheng@mediatek.com, rafael@kernel.org, lpieralisi@kernel.org, jdelvare@suse.com, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, ardb@kernel.org, geshijian@bytedance.com, tinghan.shen@mediatek.com, pierre-louis.bossart@linux.intel.com, linux-acpi@vger.kernel.org, lenb@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, robh+dt@kernel.org, paul.walmsley@sifive.com, angelogioacchino.delregno@collabora.com, weidong.wd@bytedance.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, rminnich@gmail.com, palmer@dabbelt.com, yc.hung@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQ29ub3IsCgpPbiBUaHUsIEp1bCA2LCAyMDIzIGF0IDI6NDXigK9QTSBDb25vciBEb29sZXkg
PGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgSnVsIDA2LCAy
MDIzIGF0IDExOjQzOjU1QU0gKzA4MDAsIOi/kOi+ieW0lCB3cm90ZToKPiA+IE9uIFdlZCwgSnVs
IDUsIDIwMjMgYXQgMTE6MDfigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4gPiBPbiBXZWQsIEp1bCAwNSwgMjAyMyBhdCAwNzo0Mjo1MVBNICswODAwLCBZdW5o
dWkgQ3VpIHdyb3RlOgo+ID4gPiA+IEFkZCB0aGUgZGVzY3JpcHRpb24gZm9yIGZmaXRibCBzdWJu
b2RlLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVp
QGJ5dGVkYW5jZS5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Zpcm13YXJlL2ZmaXRibC50eHQgICB8IDI3ICsrKysrKysrKysrKysrKysrKysKPiA+ID4g
PiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+
ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykKPiA+ID4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9maXJtd2FyZS9m
Zml0YmwudHh0Cj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL2ZmaXRibC50eHQgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZmlybXdhcmUvZmZpdGJsLnR4dAo+ID4gPiA+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5jNDIzNjg2MjYxOTkKPiA+ID4gPiAt
LS0gL2Rldi9udWxsCj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Zpcm13YXJlL2ZmaXRibC50eHQKPiA+ID4KPiA+ID4gRmlyc3RseSwgbmV3IGR0LWJpbmRp
bmdzIG5lZWQgdG8gYmUgZG9uZSBpbiB5YW1sLCBub3QgaW4gdGV4dCBmb3JtLgo+ID4gPiBTZWNv
bmRseSwgeW91IGRpZG4ndCByZS1ydW4gZ2V0X21haW50YWluZXIucGwgYWZ0ZXIgYWRkaW5nIHRo
aXMgYmluZGluZywKPiA+ID4gc28geW91IGhhdmUgbm90IENDZWQgYW55IG9mIHRoZSBvdGhlciBk
dC1iaW5kaW5nIG1haW50YWluZXJzIG5vciB0aGUKPiA+ID4gZGV2aWNldHJlZSBtYWlsaW5nIGxp
c3QuCj4gPgo+ID4gUmUtcnVuIGdldF9tYWludGFpbmVyLnBsIGFuZCBhZGRlZCBtYWludGFpbmVy
cyBpbnRvIHRoZSBtYWlsbGlzdC4KPiA+IGVtbS4uIFRoZXJlIGlzIHNvbWUgKnR4dCBpbgo+ID4g
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlLywgaXNuJ3QgaXQ/Cj4K
PiBUaGVyZSBtaWdodCBiZSwgYnV0IHRoYXQncyBub3QgYW4gZXhjdXNlIGZvciBhZGRpbmcgX25l
d18gb25lcywgc29ycnkuCgpPa2F5LCBJJ2xsIHVwZGF0ZSBpdCBvbiB2NC4KCgo+ID4gPiA+ICtG
RkkoRkRUIEZJUk1XQVJFIElOVEVSRkFDRSkgZHJpdmVyCj4gPiA+ID4gKwo+ID4gPiA+ICtSZXF1
aXJlZCBwcm9wZXJ0aWVzOgo+ID4gPiA+ICsgLSBlbnRyeSAgICAgICAgICAgICA6IGFjcGkgb3Ig
c21iaW9zIHJvb3QgcG9pbnRlciwgdTY0Cj4gPiA+ID4gKyAtIHJlZyAgICAgICAgICAgICAgICAg
ICAgICAgOiBhY3BpIG9yIHNtYmlvcyB2ZXJzaW9uLCB1MzIKPiA+ID4KPiA+ID4gUGxlYXNlIGdv
IGxvb2sgYXQgYW55IG90aGVyIGR0LWJpbmRpbmcgKG9yIHRoZSBleGFtcGxlIHNjaGVtYSkgYXMg
dG8gaG93Cj4gPiA+IHRoZXNlIHByb3BlcnRpZXMgc2hvdWxkIGJlIHVzZWQuIEEgInJlZyIgY2Vy
dGFpbmx5IHNob3VsZCBub3QgYmUgYmVpbmcKPiA+ID4gdXNlZCB0byBzdG9yZSB0aGUgcmV2aXNp
b24uLi4KPiA+Cj4gPiBPa2F5LCBJZiBzb++8jEknbGwgYWRkIGEgcHJvcGVydHkgInZlcnNpb24i
IGludG8gdGhlIGR0cyBpbnN0ZWFkIG9mCj4gPiAicmVnIiwganVzdCBsaWtlLCBXRFlUPwo+ID4g
ZmZpdGJsIHsKPgo+IEZpcnN0bHksIEknZCBtdWNoIHJhdGhlciB5b3Ugc3BlbHQgdGhpcyBvdXQs
IGxpa2UgImZmaS10YWJsZSIuCj4KPiA+ICAgICBzbWJpb3Mgewo+ID4gICAgICAgICBlbnRyeSA9
ICIiOwo+Cj4gSSBzdGlsbCBkb24ndCB1bmRlcnN0YW5kIHdoeSAiZW50cnkiLCB3aGljaCBpcyBh
biBhZGRyZXNzLCBpcyBiZWluZwo+IHJlcHJlc2VudGVkIGJ5IGFuIGVtcHR5IHN0cmluZy4KPiBJ
IGFsc28gZG9uJ3QgcmVhbGx5IGdldCB3aHkgeW91IGhhdmUgbm90IHVzZWQgInJlZyIgdG8gZGVz
Y3JpYmUgaXRzCj4gc3RhcnQgYWRkcmVzcyBhbmQgc2l6ZS4KPgo+ID4gICAgICAgICB2ZXJzaW9u
ID0gPCAweDAyID47Cj4KPiBQcm9iYWJseSBtaXNzaW5nIGEgdmVuZG9yIHByZWZpeCwgYW5kIHRo
ZSBzcGFjZXMgYXJlIHVudXN1YWwsIGJ1dCBiZXR0ZXIKPiB0aGFuIGl0IHdhcywgeWVzLgoKQmFz
ZWQgb24geW91ciByZXZpZXcsIEkgcGxhbiB0byBtb2RpZnkgaXQgYXMgZm9sbG93czoKCmZmaS10
YWJsZSB7CiNhZGRyZXNzLWNlbGxzID0gPDI+Owojc2l6ZS1jZWxscyA9IDwwPjsKICAgICAgICBz
bWJpb3NAZW50cnkxIHsKICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic21iaW9zIjsKICAg
ICAgICAgICAgICAgIHJlZyA9IDxlbnRyeTE+OwogICAgICAgICAgICAgICAgdmVyc2lvbiA9IDwy
PjsKICAgICAgICB9OwogICAgICAgIHNtYmlvc0BlbnRyeTIgewogICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJzbWJpb3MiOwogICAgICAgICAgICAgICAgcmVnID0gPGVudHJ5Mj47CiAgICAg
ICAgICAgICAgICB2ZXJzaW9uID0gPDM+OwogICAgICAgIH07CiAgICAgICAgYWNwaUBlbnRyeSB7
CiAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFjcGkiOwogICAgICAgICAgICAgICAgcmVn
ID0gPGVudHJ5PjsKICAgICAgICAgICAgICAgIHZlcnNpb24gPSA8Nj47CiAgICAgICAgfTsKfQoK
VGhlIHJlYXNvbiB3aHkgI3NpemUtY2VsbHMgaXMgMCBpcyBiZWNhdXNlIG9ubHkgb25lIGl0ZW0g
aXMgbmVlZGVkLAojYWRkcmVzcy1jZWxscyA9IDwyPjsgYmVjYXVzZSB0d28gdTMyIGFyZSBuZWVk
ZWQgdG8gZXhwcmVzcyB0aGUgNjQtYml0CmFkZHJlc3MuClRoZSBtZW1vcnkgZm9yIHRoZSBTTUJJ
T1MgdGFibGUgaXRzZWxmIHdpbGwgYmUgcHJlc2VydmVkIGluICJyZXNlcnZlZAptZW1vcnkiICwg
c28gd2UgZG9uJ3QgaGF2ZSB0byB3b3JyeSBhYm91dCB0aGlzIHBpZWNlIG9mIG1lbW9yeSBnZXR0
aW5nCmNvcnJ1cHRlZC4gQUNQSSBhcyB3ZWxsLiBXRFlUPwoKPiA+ICAgICB9Cj4gPiAgICBhY3Bp
IHsKPiA+ICAgICAgICAgIGVudHJ5ID0gIiI7Cj4gPiAgICAgICAgICB2ZXJzaW9uID0gPCAweDA2
ID47Cj4gPiAgIH0KPiA+IH0KPgo+IFRoYW5rcywKPiBDb25vci4KClRoYW5rcywKWXVuaHVpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
