Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A34C001DF
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 06:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdAWm6u9Q3UrebhYKJm4Q4J5DbVdlI8TVTInfx4GUr4=; b=AjrpbTw9qMlzkW
	fk816SIABaUz6SuVqPi9tQzRIto5xcvstlK/b/lGCsITbHK+/r0EAoBT/ayMzhYHZGi3d5yGiNtyG
	ErpDoyHKIFRXGxkSg3/DRdinXWBsoxTOcoWJRrjBng+Ko8NYZNNO2hO2jTiGUbQF1yduhpXic5Htw
	ngN29L7jfN6vic9sSme9pULmKyrII+q0BlK0MjzP4bCkuwJseaTsepVvzULCbjilcHu4EpRLjAlqA
	G+4e4U6QPPiM1zJaXAoTO8HYaRX98iUEJNK45ZSlyCrlHTQvNzIF8fqatjE3yIkylAmU15TMEyxaq
	6NaZxGbynYWgjlazQ3/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPGXv-001phh-1F;
	Fri, 28 Jul 2023 06:01:51 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPGXs-001pff-0m
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 06:01:49 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b9c2dc636dso23779891fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 23:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690524100; x=1691128900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jjGYCkpEYu58BQfAwhDMVJPr8BDJrnt1s54RDMlMPA=;
        b=EnOmxiQ6Hqmfy468wQrckhNRtCZUvLNfddXLnUKst3m5+Y0BW/6amJY7gYXx93hbzs
         sLFVbe4SCueWxW0c4vDtLXQpXxTYItb40QIoGjlZAf5Q2gtjlqT5bYnU05UwhrAFts80
         1Jmlt+8A4WgU3xkX0A8vfJrce924O4THWo5b4UMGc9wfwkCT/3z6WS33GgeLPbhmw4BZ
         vWbzRrv/vFXJbiDnTGA/u7UGeyqtFpHrjLnt7MOKuI4dShzt47mnjHPOnlNB+V4d2HEz
         FothBpUXrwksIcuDHGmEAKHZfgkx1PFGKHcBEZ18x13fxtLRAuU/Hh7SUb0z3ldmouW9
         f54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690524100; x=1691128900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jjGYCkpEYu58BQfAwhDMVJPr8BDJrnt1s54RDMlMPA=;
        b=Ywub7e9z+YK5JmL5WoStIS6nEsce1Ut7PqffM1Nl0vUcEKNhjh+VGftWzkekO+zXRg
         HebZlxAb36UUbgkd3W96EhQbOv+Ruwho0obTnnn59QiV3BjTZgH2ieom0z0ZiTp6NIPi
         pcGm2gsjF/IF8RT2x7iFysEezqGsvHGu7C0OsHya9DRWz4vUUX4PPg/navAXyz/BXbib
         pePdKhpGTHVafGnjhAAN6ovtTJNJzIjOsOR5ME02mhG/Oy6E5p8V3pbPBSKZ60QKHRRC
         12caOm09iKvYGy++KfnprriJIENK8oauFgXA16jyJlGXDH1YLOSD7R3W1foph0HXiqjv
         VXPg==
X-Gm-Message-State: ABy/qLZhfZrH9M/eMOlz9DqR7QIh2l0f3u+E9DlrFDjKQ9ByWXn5dXsK
	SkToRmvntLiRlEV6kFInjW5FdPQ6uNj+A8zeVPBW7Q==
X-Google-Smtp-Source: APBJJlGRtJ5h9JlYPOw784edK7V79G0d0vYdwCpHUuo8Is7oxaLejqe++lmUOh2FkvVkmSEOAEMEiq2mT/bVif0U91I=
X-Received: by 2002:a2e:7c01:0:b0:2b9:4476:ab28 with SMTP id
 x1-20020a2e7c01000000b002b94476ab28mr977256ljc.38.1690524099313; Thu, 27 Jul
 2023 23:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230720135125.21240-1-eric.lin@sifive.com> <20230720135125.21240-2-eric.lin@sifive.com>
 <cbf0a8fd-3479-1684-fe90-81f2159804ef@linaro.org>
In-Reply-To: <cbf0a8fd-3479-1684-fe90-81f2159804ef@linaro.org>
From: Eric Lin <eric.lin@sifive.com>
Date: Fri, 28 Jul 2023 14:01:28 +0800
Message-ID: <CAPqJEFr5h+5+F4TdNuRMaWsrmeedbfGgbgd9wh8sUUQsj2Pw-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zong.li@sifive.com, greentime.hu@sifive.com, 
	vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_230148_285264_E593C502 
X-CRM114-Status: GOOD (  17.62  )
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

SGkgS3J6eXN6dG9mLAoKT24gRnJpLCBKdWwgMjEsIDIwMjMgYXQgNDozNeKAr1BNIEtyenlzenRv
ZiBLb3psb3dza2kKPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBP
biAyMC8wNy8yMDIzIDE1OjUxLCBFcmljIExpbiB3cm90ZToKPiA+IFRoaXMgYWRkIFlBTUwgRFQg
YmluZGluZyBkb2N1bWVudGF0aW9uIGZvciBTaUZpdmUgUHJpdmF0ZSBMMgo+ID4gY2FjaGUgY29u
dHJvbGxlcgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEVyaWMgTGluIDxlcmljLmxpbkBzaWZpdmUu
Y29tPgo+ID4gUmV2aWV3ZWQtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiA+IFJl
dmlld2VkLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+Cj4KPgo+IC4uLgo+Cj4gPiAr
cHJvcGVydGllczoKPiA+ICsgIGNvbXBhdGlibGU6Cj4gPiArICAgIGl0ZW1zOgo+ID4gKyAgICAg
IC0gY29uc3Q6IHNpZml2ZSxwbDJjYWNoZTEKPgo+IEkgc3RpbGwgaGF2ZSBkb3VidHMgdGhhdCBp
dCBpcyBub3QgdXNlZCBpbiBhbnkgU29DLiBUaGlzIGlzIHdoYXQgeW91Cj4gc2FpZCBsYXN0IHRp
bWU6ICJpcyBub3QgcGFydCBvZiBhbnkgU29DLiIKPiBJZiBub3QgcGFydCBvZiBhbnkgU29DLCB0
aGVuIHdoZXJlIGlzIGl0PyBXaHkgYXJlIHlvdSBhZGRpbmcgaXQgdG8gdGhlCj4ga2VybmVsPwo+
CgpTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuIEkgZGlkbid0IGRlc2NyaWJlIGl0IGNsZWFybHkg
bGFzdCB0aW1lLgpDdXJyZW50bHksIHdlIGhhdmUgdHdvIGhhcmR3YXJlIHZlcnNpb25zIG9mIHBs
MmNhY2hlOiBwbDJjYWNoZTAgYW5kIHBsMmNhY2hlMS4KVGhlIHBsMmNhY2hlMCBpcyB1c2VkIGlu
IHVubWF0Y2hlZCBib2FyZCBTb0MuIFRoZSBwbDJjYWNoZTEgaXMKdXRpbGl6ZWQgaW4gb3VyIGlu
dGVybmFsIEZQR0EgcGxhdGZvcm0gZm9yIGV2YWx1YXRpb247IGl0J3Mgb3VyIGNvcmUKSVAuCgo+
Cj4KPiA+ICsgICAgICAtIGNvbnN0OiBjYWNoZQo+ID4gKwo+ID4gKyAgY2FjaGUtYmxvY2stc2l6
ZTogdHJ1ZQo+ID4gKyAgY2FjaGUtbGV2ZWw6IHRydWUKPiA+ICsgIGNhY2hlLXNldHM6IHRydWUK
PiA+ICsgIGNhY2hlLXNpemU6IHRydWUKPiA+ICsgIGNhY2hlLXVuaWZpZWQ6IHRydWUKPiA+ICsK
PiA+ICsgIHJlZzoKPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ICsKPiA+ICsgIG5leHQtbGV2ZWwt
Y2FjaGU6IHRydWUKPiA+ICsKPiA+ICtyZXF1aXJlZDoKPiA+ICsgIC0gY29tcGF0aWJsZQo+ID4g
KyAgLSBjYWNoZS1ibG9jay1zaXplCj4gPiArICAtIGNhY2hlLWxldmVsCj4gPiArICAtIGNhY2hl
LXNldHMKPiA+ICsgIC0gY2FjaGUtc2l6ZQo+ID4gKyAgLSBjYWNoZS11bmlmaWVkCj4gPiArICAt
IHJlZwo+ID4gKwo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gKwo+ID4gK2V4
YW1wbGVzOgo+ID4gKyAgLSB8Cj4gPiArICAgIGNhY2hlLWNvbnRyb2xsZXJAMTAxMDQwMDAgewo+
ID4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJzaWZpdmUscGwyY2FjaGUxIiwiY2FjaGUiOwo+Cj4g
TWlzc2luZyBzcGFjZS4KCk9LLCBJJ2xsIGZpeCBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKPgo+
ID4gKyAgICAgICAgY2FjaGUtYmxvY2stc2l6ZSA9IDw2ND47Cj4gPiArICAgICAgICBjYWNoZS1s
ZXZlbCA9IDwyPjsKPiA+ICsgICAgICAgIGNhY2hlLXNldHMgPSA8NTEyPjsKPiA+ICsgICAgICAg
IGNhY2hlLXNpemUgPSA8MjYyMTQ0PjsKPiA+ICsgICAgICAgIGNhY2hlLXVuaWZpZWQ7Cj4gPiAr
ICAgICAgICByZWcgPSA8MHgxMDEwNDAwMCAweDQwMDA+Owo+Cj4gcmVnIGlzIGFmdGVyIGNvbXBh
dGlibGUuCgpPSywgSSdsbCBmaXggaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4KVGhhbmtzIGZvciB5
b3VyIHJldmlldy4KCkJlc3QgcmVnYXJkcywKRXJpYyBMaW4KCj4KPiA+ICsgICAgICAgIG5leHQt
bGV2ZWwtY2FjaGUgPSA8Jkw0PjsKPiA+ICsgICAgfTsKPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5
c3p0b2YKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
