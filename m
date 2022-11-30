Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD387C4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 20:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=614VV8b/gZIlGnzPEKjwx5dUOmYNHb1OQ5/D2fWUAwU=; b=aUmv0Fc5x2l7TXw79I6r9CfDe1
	caFCRT31miwq+dSsDIxrdBFjAIutOuQEInk8uorvNNtciIgsDqFMxHzc6g6oaPCStLoo5K+pyDD10
	E/bEioh6aGVAT+skYgWJTbeCG/+u5Eyf3uh9FQik5ZhzPrYu/LSTANBQuNj0iBUlOVN2sY9kfzrpY
	4pqYyrpqNOqfT1Sqe4jwiHTNzXW/Ycmun4HWwuQETEWnEnNQdJx8Jw1RZ9d/J9xIrC7kofAGIGTNu
	SRnPKRUfKTilm/9W9b5AVfNrv8xjTX2XwXGK6C7pcpQ5V/h7UdyIyQH9TrMZZZCVbjUphqQ9npsB9
	99gdSeUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Td1-002PCL-Qn; Wed, 30 Nov 2022 20:24:23 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Tcp-002P69-Jf
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 20:24:13 +0000
Received: by mail-pf1-x430.google.com with SMTP id q12so13811016pfn.10
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 12:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IwIJM8t3rDu4EdnqkCy1u4N3uOvpgT7lYcnoQOxoBxE=;
        b=K93k2mvjpeJmh7SUsLe6tYcwRq+hH6itdOWtDK/qup3vkBSoXOAabgZOUyQOF6nNlZ
         iF9fzK6JZK8196XZ/rLoxF1OhHJpv0yw9gUW1g1484ZWcMJS7LJRu6+n2DGqfVg/JADG
         dqYopca9+Nd/tpLzPlDmBA3WmifFAMlwuriRY9rUJ5j7Mc1P2vFHxocNdGJxZqzKnq57
         v/c/aoT3oHrY8TzoHtDAOy/OUomBsJ/JIUnr52noH6rS+iDuddG8BXSGa7siRmXaVEOz
         kcUotKwSUv09OMzLP5Vrov9bH2nMrtpfZtQ/PJVAQmVeKVVLODI0SP9G/aEK19XmgRRQ
         /j5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwIJM8t3rDu4EdnqkCy1u4N3uOvpgT7lYcnoQOxoBxE=;
        b=1l1r2Q/HJKh2rnd5j48hVpvUnkJ/kN7vCLGhoF/tirungis0StVNnRXCygpkrufdZO
         gURHLAMuYL3DErj6TFtj0cDBp50VK6TtflJWcSc4VyVyqonRPr0Xvu2CATLiriQbpS9/
         K8pJCwQIG1ZZXsoojJoHVLr5ZZ/wu0ZQbH/zCqFul6AHloKu7B0KsoqJ5wbecRK7VX5j
         XixKAQY5P+ZXFJmcgZiqlWhwGsvmi/60HJGqtzaHSNLEUZvQxNKVU4SmbyQeskGMr8FC
         Ue39vL5my9yjCNreHxigON0BuD1U6XEQwydptqu8BhahNUhfJNSS7jhjhGaWO9yMaBbU
         C+5A==
X-Gm-Message-State: ANoB5pl8PNk482xzNPx0+x1nPVYAxo7i+UlFP8oaU2yFC6iP0i4sElVq
	sKIFnRcV9+ICxqIMwhczPl65JA==
X-Google-Smtp-Source: AA0mqf7tSFcxtMxKDfiy+UvOsM0wZq+I6jJp/XfbS2vu+XRn8HfqshC0r1AVmiaoBTapt2hLTUT4+g==
X-Received: by 2002:a63:5c23:0:b0:46f:b6e1:1966 with SMTP id q35-20020a635c23000000b0046fb6e11966mr46862935pgb.625.1669839849429;
        Wed, 30 Nov 2022 12:24:09 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id o17-20020a170902d4d100b00186cf82717fsm1917646plg.165.2022.11.30.12.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 12:24:08 -0800 (PST)
Date: Wed, 30 Nov 2022 12:24:08 -0800 (PST)
X-Google-Original-Date: Wed, 30 Nov 2022 12:23:48 PST (-0800)
Subject: Re: [PATCH v2 12/12] riscv: defconfig: Enable the Allwinner D1 platform and drivers
In-Reply-To: <BBF52D3D-B8D3-4895-B316-33555E22C56B@kernel.org>
CC: ajones@ventanamicro.com, heiko@sntech.de, samuel@sholland.org, wens@csie.org,
  jernej.skrabec@gmail.com, linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
  devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, jszhang@kernel.org,
  linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, andre.przywara@arm.com, aou@eecs.berkeley.edu,
  apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>, christianshewitt@gmail.com,
  Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org, heinrich.schuchardt@canonical.com, linus.walleij@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, stano.jakubek@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
  Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>
Message-ID: <mhng-f034544d-5b0a-47c5-8e45-3dbcefc0aaaa@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_122411_893310_106B6635 
X-CRM114-Status: GOOD (  34.47  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyOCBOb3YgMjAyMiAyMjo1NDoxOCBQU1QgKC0wODAwKSwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+Cj4KPiBPbiAyOSBOb3ZlbWJlciAyMDIyIDA2OjQ5OjI1IEdNVCwgQW5kcmV3IEpvbmVz
IDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+T24gTW9uLCBOb3YgMjgsIDIwMjIg
YXQgMDk6MTc6MzhQTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+Pj4gT24gMjgvMTEvMjAy
MiAyMToxMSwgSGVpa28gU3TDvGJuZXIgd3JvdGU6Cj4+PiA+IEFtIFNhbXN0YWcsIDI2LiBOb3Zl
bWJlciAyMDIyLCAxNzo0MDoxMSBDRVQgc2NocmllYiBDb25vciBEb29sZXk6Cj4+PiA+PiBPbiBG
cmksIE5vdiAyNSwgMjAyMiBhdCAwNTo0Njo1NlBNIC0wNjAwLCBTYW11ZWwgSG9sbGFuZCB3cm90
ZToKPj4+ID4+PiBOb3cgdGhhdCBzZXZlcmFsIEQxLWJhc2VkIGJvYXJkcyBhcmUgc3VwcG9ydGVk
LCBlbmFibGUgdGhlIHBsYXRmb3JtIGluCj4+PiA+Pj4gb3VyIGRlZmNvbmZpZy4gQnVpbGQgaW4g
dGhlIGRyaXZlcnMgd2hpY2ggYXJlIG5lY2Vzc2FyeSB0byBib290LCBzdWNoIGFzCj4+PiA+Pj4g
dGhlIHBpbmN0cmwsIE1NQywgUlRDICh3aGljaCBwcm92aWRlcyBjcml0aWNhbCBjbG9ja3MpLCBT
UEkgKGZvciBmbGFzaCksCj4+PiA+Pj4gYW5kIHdhdGNoZG9nICh3aGljaCBtYXkgYmUgbGVmdCBl
bmFibGVkIGJ5IHRoZSBib290bG9hZGVyKS4KPj4+ID4+Cj4+PiA+PiBBbGwgb2YgdGhhdCBsb29r
cyBnb29kLgo+Pj4gPj4KPj4+ID4+PiBPdGhlciBjb21tb24KPj4+ID4+PiBvbmJvYXJkIHBlcmlw
aGVyYWxzIGFyZSBlbmFibGVkIGFzIG1vZHVsZXMuCj4+PiA+Pgo+Pj4gPj4gVGhpcyBJIGFtIG5v
dCBzdXJlIGFib3V0IHRob3VnaC4gSSdsbCBsZWF2ZSB0aGF0IHRvIFBhbG1lciBzaW5jZSBJJ20K
Pj4+ID4+IHByZXR0eSBzdXJlIGl0IHdhcyBoaW0gdGhhdCBzYWlkIGl0LCBidXQgSSB0aG91Z2h0
IHRoZSBwbGFuIHdhcyBvbmx5Cj4+PiA+PiB0dXJuaW5nIG9uIHN0dWZmIHJlcXVpcmVkIHRvIGJv
b3QgdG8gYSBjb25zb2xlICYgdGhpbmdzIHRoYXQgYXJlCj4+PiA+PiBnZW5lcmFsbHkgdXNlZnVs
IHJhdGhlciB0aGFuIGVuYWJsaW5nIG1vZHVsZXMgZm9yIGV2ZXJ5b25lJ3MgInJhbmRvbSIKPj4+
ID4+IGRyaXZlcnMuIFBhbG1lcj8KPj4+ID4gCj4+PiA+IElzbid0IHRoZSBkZWZjb25maWcgbWVh
bnQgYXMgYSBzdGFydGluZyBwb2ludCB0byBnZXQgd29ya2luZyBzeXN0ZW1zCj4+PiA+IHdpdGgg
bWluaW1hbCBjb25maWcgZWZmb3J0PyBBdCBsZWFzdCB0aGF0IHdhcyBhbHdheXMgdGhlIHdheSB0
byBnbyBvbiBhcm0KPj4+ID4gc28gZmFyIDotKSAuCj4+PiA+IAo+Pj4gPiBTbyBoYXZpbmcgYm9v
dC1yZXF1aXJlZCBkcml2ZXJzIGJ1aWx0LWluIHdpdGggdGhlIHJlc3QgZW5hYmxlZCBhcyBtb2R1
bGVzCj4+PiA+IGZvciBzdXBwb3J0ZWQgYm9hcmRzIHdpbGwgYWxsb3cgcGVvcGxlIHRvIGJvb3Qg
dGhlaXJzIHdpdGhvdXQgaGVhZGFjaGVzLgo+Pj4gPiAKPj4+ID4gRGlzYWJsaW5nIHVubmVlZGVk
IGRyaXZlcnMgaWYgeW91J3JlIHN0YXJ2ZWQgZm9yIHN0b3JhZ2Ugc3BhY2UgaW4gYSBzcGVjaWFs
Cj4+PiA+IHByb2plY3QgaXMgYWx3YXlzIGVhc2llciB0aGFuIGh1bnRpbmcgZG93biBhbGwgdGhl
IGRyaXZlcnMgdG8gZW5hYmxlIGZvciBhCj4+PiA+IHNwZWNpZmljIGJvYXJkLiAKPj4+IAo+Pj4g
SSB3b3VsZG4ndCBtaW5kIGJlaW5nIGFibGUgdG8gdHVybiBvbiBhbGwgdGhlIFBvbGFyRmlyZSBT
b0Mgc3R1ZmYgYW5kCj4+PiB5ZWFoLCB0aGF0IHdvdWxkIGJlIHRoZSB3YXkgdGhhdCBhcm02NCBk
b2VzIGl0LiBCdXQgSSBkbyByZWNhbGwgaGVhcmluZwo+Pj4gdGhhdCBJIHNob3VsZCBub3QgdHVy
biBzdHVmZiBvbiB0aGlzIHdheSwgd2hlbiBJIGluaXRpYWxseSB0cmllZCB0bwo+Pj4gdHVybiBz
dHVmZiBvbiB2aWEgc2VsZWN0cywgZ290IGEgbmFjayBhbmQgYXNrZWQgaWYgSSBjb3VsZCBkbyB0
aGlzIGluc3RlYWQuCj4+PiAKPj4+IEJ1dCBpdCBtYXkgYmUgdGhhdCBJIG1pc3JlbWVtYmVyLCB3
aGljaCBpcyB3aHkgSSBhcHBlYWxlZCB0byB0aGUgSGlnaGVyCj4+PiBQb3dlcnMgZm9yIGNsYXJp
ZmljYXRpb24gOikKPj4KPj5GV0lXLCBJIGRvbid0IHdvcnJ5IHRvbyBtdWNoIGFib3V0IG1vZHVs
ZXMgaW4gZGVmY29uZmlnIGJlY2F1c2UgSSBhbHdheXMKPj5pbW1lZGlhdGVseSBhcHBseSBhICdM
U01PRD0kUFdEL0wgbG9jYWxtb2Rjb25maWcnIHRvIGl0LCB3aGVyZSB0aGUgTAo+PmZpbGUgaXMg
YW4gbHNtb2Qgb3V0cHV0IHdoaWNoIG9ubHkgaW5jbHVkZXMgbW9kdWxlcyBJIG5lZWQuCj4KPiBp
ZGssIGRlZmNvbmZpZyB0byBtZSBpcyBub3QgYWJvdXQgeW91IG9yIEksIGl0J3MgYWJvdXQgQSBE
ZXZlbG9wZXIgdGhhdCBnZXRzIGFuIFNCQyBvciBhIGRldmtpdCBhbmQgdGhlaXIgZXhwZXJpZW5j
ZS4KPiBPciBhbHRlcm5hdGl2ZWx5LCBzb21lb25lJ3MgQ0kgOykKPiBJJ2QgbGlrZSB0byBwdXQg
ZXZlcnl0aGluZyBpbiwgYnV0IEkgcmVjYWxsIHRoYXQgYmVpbmcgc2hvdCBkb3duLCB0aGF0J3Mg
YWxsLgoKVGhlIHdob2xlICJ3aG8gaXMgZGVmY29uZmlnIGZvciIgZGlzY3Vzc2lvbiBhbHdheXMg
ZW5kcyB1cCBraW5kIG9mIAp2YWd1ZSwgYnV0IElJVUMgaXQncyBnZW5lcmFsbHkgYWltZWQgYXQg
a2VybmVsIGhhY2tlcnMgYXMgb3Bwb3NlZCB0byBlbmQgCnVzZXJzIC0tIHNvIGl0J3Mgbm90IG1l
YW50IHRvIGJlIGEgZGlzdG8gY29uZmlnLCB0aGF0J3Mgd2h5IHdlIGhhdmUgCnRoaW5ncyBsaWtl
IHRoZSBkZWJ1ZyBvcHRpb25zIHR1cm5lZCBvbi4gIEkgdGVuZCB0byB0aGluayBvZiBpdCBhcyBh
ICJpZiAKYSBwYXRjaCBzdWJtaXR0ZXIgaXMgZ29pbmcgdG8gdGVzdCBvbmx5IG9uZSBjb25maWcs
IHRoZW4gd2hhdCBkbyBJIHdhbnQgCmluIGl0PyIgYW5kIGxldCB0aGF0IGRldGVybWluZSB3aGF0
IGdvZXMgaW4gZGVmY29uZmlnLgoKSU1PIGhhdmluZyBkZWZjb25maWcgY29udGFpbiB0aGUgZHJp
dmVycyBuZWNlc3NhcnkgdG8gYm9vdCBldmVyeSBjb21tb24gCmRldiBib2FyZCBhcyA9eSwgYW5k
IGhhdmluZyA9bSBmb3IgYW55dGhpbmcgZWxzZSBvbiB0aG9zZSBib2FyZHMgYWxzbyAKc2VlbSBy
ZWFzb25hYmxlLiAgVGhhdCB3aWxsIG1ha2UgdGhlIHRyYW5zaXRpb24gZnJvbSB2ZW5kb3IvZGlz
dHJvIAprZXJuZWxzIHRvIHVwc3RyZWFtIGEgYml0IHNtb290aGVyLCB3aGljaCBpcyBhbHdheXMg
Z29vZC4gIEkgZ3Vlc3MgCnRoZXJlJ3Mgc29tZSBzbGlnaHQgYnVpbGQgdGltZSBhbmQgaW1hZ2Ug
c2l6ZSBpc3N1ZXMsIGJ1dCBhc2lkZSBmcm9tIApzb21lIHZlcnkgc21hbGwgc3lzdGVtcyB0aGF0
IHNob3VsZG4ndCBiZSB0b28gYmFkIGZvciBrZXJuZWwgZGV2ZWxvcGVycyAKLS0gYW5kIGlmIHdl
IHJlYWxseSBlbmQgdXAgd2l0aCBhbm90aGVyIHBvcHVsYXIgc3lzdGVtIHdpdGggNk1pQiBvZiBS
QU0gCndlIGNhbiBqdXN0IHN0aWNrIGFub3RoZXIgdGlueSBkZWZjb25maWcgaW4gdGhlcmUgZm9y
IGl0LgoKSSBhY3R1YWxseSBkb24ndCB1c2UgbW9kdWxlcyB3aGVuIGRvaW5nIGtlcm5lbCBkZXZl
bG9wbWVudCBiZWNhdXNlIEkgCmZpbmQgaXQgZWFzaWVyIHRvIHRyYWNrIHRoaW5ncyB3aGVuIHRo
ZXkncmUgcGFja2VkIGludG8gYSBzaW5nbGUgYmluYXJ5LCAKYnV0IEkgZG9uJ3QgdGhpbmsgaXQn
cyBuZWNlc3NhcnkgdG8gc3RlZXIgZXZlcnlvbmUgdGhhdCB3YXkuCgpBZGRpbmcgc29tZSBvZiB0
aGUgQXJtIGZvbGtzIGhlcmUsIGluIGNhc2UgdGhleSBoYXZlIHRob3VnaHRzLiAgVGhlIGJlc3Qg
CmJldCBpcyBwcm9iYWJseSB0byB0cnkgYW5kIGRvIHNvbWV0aGluZyBzaW1pbGFyLCB0aG91Z2gg
bXkgd29ycnkgaXMgdGhhdCAKdGhlIGFuc3dlciBpcyBzb21ldGhpbmcgbGlrZSAidGFyZ2V0IHN0
YW5kYXJkIHBsYXRmb3JtcyIgYW5kIHdlIGRvbid0IApoYXZlIGFueS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
