Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D502FEB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 10:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zxzHTf7FUA1AuZ+tFGpQy2vgQQrgOs13ofg/fEsugPk=; b=TDTms4jry0nrZn
	R0Xp5Zvn69HzoolhDX4JLb0KcwaFlnr47XJUPSCN4RQ6/E/cbXFKvm7AjEzB2mPN6d1r+cOhhG1Rb
	obT6rxkp7+xEnmndxaenbgXq2Tk8LhkWIcdwmI7Re/jVpLCScGWRg5e2LLg459XgPzzfMYYx2eScp
	o6rgSVm2VFoLdVn69zlAMVGK01Pj8Vmql0n7HB8Pq5c/uuy80ad/ui7Jxp4hDeZdL6N8UtRd46+pq
	NqNW0F6ew1mitdNd6rNnqHbxKWC1UnurYlvzY07gus6P1TFMCZUNCoM/eI6Eapr39/RYgIjq4WNK6
	aQucUSAPPtDy9GYNxfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQi3-00AiP6-21;
	Thu, 20 Jul 2023 10:16:35 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQi0-00AiOY-1q
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 10:16:34 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b70bfc8db5so8169831fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 03:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689848190; x=1690452990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYiLa4u+MTqh8C9SMSMYqQrfYRu7ZFEq+xyyji42VYE=;
        b=bVvtsauMFB62DU8vBl8gUAS627fFY4ZdSGJG5xymmmih6oMshAWewuWrZjdBCutbm3
         wb+ja+DjM15k/djMMv/iHzuHwqAS/UQZgyWCCFI+IJcz3WT4ng+Go3ztOAXxB7CuswaR
         HD7E8lwZRShYjkwfoRH0V26Bxub/+iW3Arw+DR6tkYpvaPkLTG7Jn5SoZPlYXHvh0qhA
         CKVnLGWLItVMQFHrqCP+oDvaAab4zkha4yWMUgnG5mMoL7ZgfzgrELwM+F13ozNgsWSC
         39IO1alqPQiWmi5DnyAWSHsl4m+fHX6msdjDTFNJuNs+LJmB+hSOAyMT5yuDJvEvWzAa
         NOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689848190; x=1690452990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYiLa4u+MTqh8C9SMSMYqQrfYRu7ZFEq+xyyji42VYE=;
        b=ba9LD+l2Q1xrSu1NTqbq10xWsEwfubsFSwy8syE+oGza3IpGPC3LafD62LdkVMI7Mp
         PbCXfVIXe/VO5QeKP1hbLsgjVj2yr8uoPrCvHnpsAhqu1V2y9BedWaU4Vy0SYneof8EQ
         iFkN0xfeGwsn8c4r3tvJZGptVKDCP+9dHiNNWRyPhlN82OhWYoiquVXdDJE7OvLU2Dja
         wXzIZHt/u6bdMokNaRm3CGDFQ0+Yq+dsLlAlHLwVosQ8qkgED/Mz2HoZZu7wEa7vGjMW
         KjNF0yrWtiKseXh4ZoArWNDb/DMuKP0u5ETJfwnD2i0zZD2sOcozjYdXWaN0MxE6KK+2
         gIrA==
X-Gm-Message-State: ABy/qLbXIkrsWacrMvlN0lY2wuM56qry7+1sfzjwJXEvRFTl0vXlvBBt
	JXHQRiTSIY+7NhKcLc47PlMpM5IAvgeAtmoG9Kxisw==
X-Google-Smtp-Source: APBJJlGPAo7nfpmFNyXqdwGSXn8kws4LlB9dGHdGK27p2J81w/bW6cXdRPeo3wUpjTWtsubxehiwboVRMZq2QRffFPs=
X-Received: by 2002:a2e:9604:0:b0:2b6:e128:e7a3 with SMTP id
 v4-20020a2e9604000000b002b6e128e7a3mr1863330ljh.33.1689848190396; Thu, 20 Jul
 2023 03:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230616063210.19063-1-eric.lin@sifive.com> <20230616063210.19063-4-eric.lin@sifive.com>
 <2437bda9-bbdb-ad80-7201-1e16e1388890@linaro.org> <CAPqJEFoTsmVZ4kvsSB0RkQZaQGyXC96KV6RvdpeC5XxURCOZ0w@mail.gmail.com>
 <8c9ed2d4-83ab-ecc0-a300-e6bc8e2047b6@linaro.org> <CAPqJEFqhmxksvEgvC61cJcRGR0DrSWDZxJC3J7tdgcG8UY+sFw@mail.gmail.com>
 <f5275617-d68c-c76b-d799-106f67cc2071@linaro.org> <20230712110908.GA23216@hsinchu16>
 <0865b422-d587-c1c7-9463-510832ddddf4@linaro.org> <20230712-parking-acting-e91f24204467@wendy>
In-Reply-To: <20230712-parking-acting-e91f24204467@wendy>
From: Eric Lin <eric.lin@sifive.com>
Date: Thu, 20 Jul 2023 18:16:19 +0800
Message-ID: <CAPqJEFqN-13MyDaCPV31RJjrgmXkx=pTVmgZ6KhabY3xTP6kxg@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, conor@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dslin1010@gmail.com, 
	Zong Li <zong.li@sifive.com>, vincent.chen@sifive.com, 
	Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_031632_639373_51A5FD8C 
X-CRM114-Status: GOOD (  37.08  )
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

SGkgQ29ub3IsCgpPbiBXZWQsIEp1bCAxMiwgMjAyMyBhdCA4OjQ54oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1bCAxMiwg
MjAyMyBhdCAwMjozMDowNlBNICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+ID4g
T24gMTIvMDcvMjAyMyAxMzowOSwgRXJpYyBMaW4gd3JvdGU6Cj4gPiA+IE9uIFNhdCwgSnVsIDAx
LCAyMDIzIGF0IDEwOjIyOjI1QU0gKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4g
PiA+PiBPbiAyOC8wNi8yMDIzIDE4OjMxLCBFcmljIExpbiB3cm90ZToKPiA+ID4+Cj4gPiA+Pj4+
Pj4KPiA+ID4+Pj4+Pj4gKyAgICAgIC0gZW51bToKPiA+ID4+Pj4+Pj4gKyAgICAgICAgICAtIHNp
Zml2ZSxwTDJDYWNoZTAKPiA+ID4+Pj4+Pj4gKyAgICAgICAgICAtIHNpZml2ZSxwTDJDYWNoZTEK
PiA+ID4+Pj4+Pgo+ID4gPj4+Pj4+IFdoYXQgaXMgIjAiIGFuZCAiMSIgaGVyZT8gV2hhdCBkbyB0
aGVzZSBjb21wYXRpYmxlcyByZXByZXNlbnQ/IFdoeSB0aGV5Cj4gPiA+Pj4+Pj4gZG8gbm90IGhh
dmUgYW55IFNvQyByZWxhdGVkIHBhcnQ/Cj4gPiA+Pj4+Pgo+ID4gPj4+Pj4gVGhlIHBMMkNhY2hl
MSBoYXMgbWlub3IgY2hhbmdlcyBpbiBoYXJkd2FyZSwgYnV0IGl0IGNhbiB1c2UgdGhlIHNhbWUK
PiA+ID4+Pj4+IHBsMiBjYWNoZSBkcml2ZXIuCj4gPiA+Pj4+Cj4gPiA+Pj4+IFRoZW4gd2h5IGFy
ZW4ndCB0aGV5IGNvbXBhdGlibGU/Cj4gPiA+Pj4+Cj4gPiA+Pj4KPiA+ID4+PiBUaGUgcEwyQ2Fj
aGUxIGhhcyByZW1vdmVkIHNvbWUgdW51c2VkIGJpdHMgaW4gdGhlIHJlZ2lzdGVyIGNvbXBhcmVk
IHRvCj4gPiA+Pj4gcGwyQ2FjaGUwLgo+ID4gPj4+IEZyb20gdGhlIGhhcmR3YXJlIHBlcnNwZWN0
aXZlLCB0aGV5IGFyZSBub3QgY29tcGF0aWJsZSBidXQgdGhleSBjYW4KPiA+ID4+PiBzaGFyZSB0
aGUgc2FtZSBwbDIgY2FjaGUgZHJpdmVyIGluIHNvZnR3YXJlLgo+ID4gPj4KPiA+ID4+IFNvIHRo
ZXkgYXJlIGNvbXBhdGlibGUuLi4gSWYgdGhleSB3ZXJlIG5vdCBjb21wYXRpYmxlLCB5b3Ugd291
bGRuJ3QgYmUKPiA+ID4+IGFibGUgdG8gdXNlIHRoZSBzYW1lIG1hdGNoIGluIHRoZSBkcml2ZXIu
Cj4gPiA+Pgo+ID4gPj4+IFRodXMsIHdlIHdvdWxkIGxpa2UgdG8ga2VlcCBib3RoLiBJdCB3b3Vs
ZCBiZSBncmVhdCBpZiB5b3UgY2FuIHByb3ZpZGUKPiA+ID4+PiBzb21lIHN1Z2dlc3Rpb25zLiBU
aGFua3MuCj4gPiA+Pgo+ID4gPj4gSSBwcm9wb3NlIHRvIG1ha2UgdGhlbSBjb21wYXRpYmxlLCBs
aWtlIGV2ZXJ5IG90aGVyIHBpZWNlIG9mIFNvQy4gSQo+ID4gPj4gZG9uJ3Qgc2VlIGFueSBiZW5l
Zml0IG9mIGhhdmluZyB0aGVtIHNlcGFyYXRlLgo+ID4gPj4KPiA+ID4gU29ycnkgZm9yIHRoZSBs
YXRlIHJlcGx5Lgo+ID4gPiBUaGUgcGwyIGNhY2hlIGlzIG91ciBpbnRlcm5hbCBwbGF0Zm9ybSBJ
UCBhbmQgaXMgbm90IHBhcnQgb2YgYW55IFNvQy4KPiA+ID4KPiA+ID4gVGhlIHJlYXNvbiB3aHkg
dGhpcyBkcml2ZXIgaXMgY29tcGF0aWJsZSB3aXRoIHRoZSBoYXJkd2FyZSAicGwyY2FjaGUwIiBh
bmQgaGFyZHdhcmUgInBsMmNhY2hlMSIKPiA+ID4gaXMgdGhhdCBpdCBkb2Vzbid0IHByb2dyYW0g
dGhlIGRpZmZlcmVudCBwYXJ0cyBvZiB0aGUgY29uZmlnIHJlZ2lzdGVyCj4gPiA+IEhvd2V2ZXIs
IG91ciBpbnRlcm5hbCBzb2Z0d2FyZSAoZS5nLiwgYmFyZS1tZXRhbCBzb2Z0d2FyZSkgd2lsbCBw
cm9ncmFtIHRoZXNlIGRpZmZlcmVudCBwYXJ0cywKPiA+ID4gc28gaXQgbmVlZHMgdG8gcmVseSBv
biB0aGUgZGlmZmVyZW50IGNvbXBhdGlibGUgc3RyaW5nIHRvIGlkZW50aWZ5IHRoZSBoYXJkd2Fy
ZS4KPiA+ID4KPiA+ID4gQWRkaXRpb25hbGx5LCB3ZSB3b3VsZCBsaWtlIHRoZSBjb21wYXRpYmxl
IHN0cmluZ3MgdG8gcmVmbGVjdCB3aGljaCBoYXJkd2FyZSBpcyBiZWluZyB1c2VkIFRoYW5rcy4K
PiA+Cj4gPiBJIGRvbid0IHVuZGVyc3RhbmQgaG93IGRvZXMgaXQgY29udHJhZGljdHMgYW55dGhp
bmcgSSBzYWlkLiBTbyB5b3UgZG8KPiA+IGFncmVlIHdpdGggbWU/IE9yIHdoYXQ/Cj4KPiBJIHBy
b2JhYmx5IHNob3VsZCd2ZSBiZWVuIGtlZXBpbmcgYSBjbG9zZXIgZXllIGhlcmUsIHNvcnJ5Lgo+
Cj4gSSBhc3N1bWUgd2hhdCBLcnp5c3p0b2YgbWVhbnMgaXMgd2h5IGRvIHlvdSBwZXJtaXQgYm90
aAo+ICJzaWZpdmUscEwyQ2FjaGUwIiBhbmQgInNpZml2ZSxwTDJDYWNoZTEiIGFwcGVhcmluZyBp
biBpc29sYXRpb24uIElPVywKPiBib3RoIG9mCj4gY29tcGF0aWJsZSA9ICJzaWZpdmUscGwyY2Fj
aGUwIjsKPiBhbmQKPiBjb21wYXRpYmxlID0gInNpZml2ZSxwbDJjYWNoZTEiOwo+IGFyZSB2YWxp
ZCBpbiB5b3VyIGJpbmRpbmcuCj4KPiBUaGUgaGFyZHdhcmUgZm9yIGJvdGggbWlnaHQgYmUgZGlm
ZmVyZW50LCBhbmQgdGhlaXIgZnVsbCBmZWF0dXJlc2V0cyBtYXkKPiBiZSBpbmNvbXBhdGlibGUs
IGJ1dCB0aGV5IGltcGxlbWVudCBhIGNvbXBhdGlibGUgc3Vic2V0IG9mIGZlYXR1cmVzLiBJCj4g
d291bGQgZXhwZWN0IHRoYXQgdGhlIGZvbGxvd2luZyB3b3VsZCBiZSB0aGUgcGVybWl0dGVkIGNv
bXBhdGlibGUgc2V0dXBzOgo+IGNvbXBhdGlibGUgPSAic2lmaXZlLHBsMmNhY2hlMCI7Cj4gYW5k
Cj4gY29tcGF0aWJsZSA9ICJzaWZpdmUscGwyY2FjaGUxIiwgInNpZml2ZSxwbDJjYWNoZTAiOwo+
Cj4gQSBjb25zdW1lciBvZiB0aGUgRFQgdGhhdCBkb2VzIGNhcmUgZm9yIHRoZSBkaWZmZXJlbmNl
cyBzaG91bGQgYmUKPiBsb29raW5nIGZvciB0aGUgc3BlY2lmaWMgY29tcGF0aWJsZSwgYW5kIE9T
IGNvZGUgdGhhdCBkb2VzIG5vdCBjYXJlIGNhbgo+IGFsd2F5cyBiaW5kIHRvIHRoZSAiMCIgdmVy
c2lvbi4KPgoKWWVzLCBidXQgSSB0aGluayB0aGUgcHJvcGVyIGNvbXBhdGlibGUgc3RyaW5nIGZv
ciBodyBwbDJjYWNoZTAgYW5kIGh3CnBsMmNhY2hlMSBzaG91bGQgYmUgYXMgZm9sbG93czoKaHcg
cGwyY2FjaGUwIC0+IGNvbXBhdGlibGUgPSAic2lmaXZlLHBsMmNhY2hlMCIsInNpZml2ZSxwbDJj
YWNoZTEiOwpodyBwbDJjYWNoZTEgLT4gY29tcGF0aWJsZSA9ICJzaWZpdmUscGwyY2FjaGUxIjsK
ClNpbmNlIHRoZSBodyBwbDJjYWNoZTAgaW1wbGVtZW50cyBtb3JlIGZlYXR1cmVzIHRoYW4gaHcg
cGwyY2FjaGUxLCBpdApjYW4gYmUgY29tcGF0aWJsZSB3aXRoIHRoZSBwbDJjYWNoZTEgZHJpdmVy
LgpIb3dldmVyLCBodyBwbDJjYWNoZTEgb25seSBpbXBsZW1lbnRzIGEgc3ViLWZlYXR1cmUgb2Yg
aHcgcGwyY2FjaGUwLApzbyBpdCBjYW5ub3QgYmUgY29tcGF0aWJsZSB3aXRoIHRoZSBwbDJjYWNo
ZTAgZHJpdmVyLgpUaHVzLCBJJ2xsIGtlZXAgb25seSB0aGUgY29tcGF0aWJsZSA9ICJzaWZpdmUs
cGwyY2FjaGUxIi4gaW4gdGhlCmRyaXZlciBhbmQgZHQtYmluZGluZy4gIFRoYW5rcyBmb3IgdGhl
IHN1Z2dlc3Rpb25zLgoKPiBEbyB0aGUgIjAiICYgIjEiIGhlcmUgcmVmZXIgdG8gdGhlIElQIHZl
cnNpb24sIGFzIGluCj4gc2lmaXZlLWJsb2Nrcy1pcC12ZXJzaW9uaW5nLnR4dD8gSSBkaWRuJ3Qg
dGhpbmsgdGhlIGNvbXBhdGlibGVzCj4gY29udGFpbmluZyB0aG9zZSBJUCB2ZXJzaW9ucyB3ZXJl
IHN1cHBvc2VkIHRvIGFwcGVhciBpbiBpc29sYXRpb24sCj4gd2l0aG91dCBhIHNvYy1zcGVjaWZp
YyBvbmU/Cj4KWWVzLCBJIHRoaW5rIHRoZXkgcmVmZXIgdG8gSVAgdmVyc2lvbnMuIE9LLCBJJ2xs
IGZpeCBpdCBpbiB2Mi4KVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKQmVzdCByZWdhcmRzLApFcmlj
IExpbgoKPiBUaGFua3MsCj4gQ29ub3IuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
