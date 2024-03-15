Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A8CC54E67
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 17:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=RsK2XPDhnIzzfELmory8I9lTAyG789v8rBnmjdT5NkU=; b=N7SCbeUCKBsP8G4TiqLwEW4NqA
	KmPp7ty3l4tTPGW3O7PcVACelEnjxjPRVtudGa6WtTSIifRawP5enmCJBpxb2+PrK1zsSyXkpkGVy
	JVSRUrDYlxYEXbcCCQLhdFWcnt4lOdGNU2Ph5/Du+BZcBUEJeopAo2396NeNnSaZfiosx8TeLPdlp
	bDUM64Q6V5A7sUFTbyENLCcdZQ4hukioRZN8VCtjTj7dsG13RJ5B+4f/IqgOqYb7ve3ucVOfFiy5W
	IhDnFMiJBlWHiSeXUKkfp/44uW520cHjtxwe+fkFQbk2z1X7pVztZCLin9b13LvyU4JEFQD4bABLl
	qh1Oxjxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlBF8-00000000zRo-3Gfq;
	Fri, 15 Mar 2024 17:21:19 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlBF6-00000000zQh-1X97
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 17:21:17 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6e6b729669bso2357432b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Mar 2024 10:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1710523275; x=1711128075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4Uu/E9gE0652T6hoQJRicZh5VPvjIkh0J3KEQ5/ek4=;
        b=hCXDf0GWvoFoE5Ka5p33xaEAHvvHc8amnW6QG8q9bbAcE6cjG+X1/Q36sGCzFnAgAi
         DR60+3Eq2aim5gGPxAKB2QQwiA12fZY1YIEsihdJJVgS7F7oNI/RJiUxKC7XW2r3KFdH
         HVnXRkUFiKMqA4SHsr0NOsiA7AJb06LmKTTtUrwoFjBJA1OE8B1uLNlP8EHJkdiDZLE0
         m2s8B0Dz5YDndP5qcCdZwCCeN+rsOib4RQvFdvXmIf5DYsFnqpWAmYE0LZJVL4KGpQps
         QWSNXjXsJ+Wgc9SCvrfPi0hoSy25BoRibVb8bQIR670BUGwFIiWxjDyEYMJGbudIu6qe
         gzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710523275; x=1711128075;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4Uu/E9gE0652T6hoQJRicZh5VPvjIkh0J3KEQ5/ek4=;
        b=AuFxyaxonLvujlsy6JohIv4Z1nVOLskEPwCdMxrqV2XaXL/L/y6h2ji9CB1j294Lr/
         hKV4kiIvq0R4AWIXOn62QDACt4JxaJRhY0lgyhZhYgGwYOx5t+SRsMosyTCjy8xUjBhU
         wbJI9Qt64NOFZEjAoTzepbx2F29W57PfBd9+RJz/5pJBAf91vdfwD0ZLAM7BgbknWvow
         cSZILmBU4DXE4Rbs8kwjrYEzne2UpczoBp3UufDOHvZr1uzdVDv0DMyCvMg4xhJICj5L
         K27UQeZ6gLIYTHYz3kXmSIAXUy3LfEGhPw5bwgMVuV5QJQ9s8z66JLkQU2PbKYtkZ5r+
         PKsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKlMpZR5N5nSs6c1XiXm+fdSBRunKR/s3j2b05vAGhS/SCoIipifqnOWwjHdqMssE22IM+5tFG4E1NptObckK8gMwkYoQpZ1IjPPydCSdp
X-Gm-Message-State: AOJu0YwmIPUtFw6kyacnrSSTYu2n57mNaDQD77KJHFPrIiKs2+OLGvLz
	FPqAJOSEwEZcwlQq105YxwTpa38+Wd4ivwXop2mp+uyA/I0iVRrhggUYDT6U/vs=
X-Google-Smtp-Source: AGHT+IFobowEw/BZzPFUGcWVFl2f0Ay+g8tIGVtL6ZeOGfHYkRhGF70dEpXmyMZCMSlq5eClBe2ngg==
X-Received: by 2002:a05:6a00:b52:b0:6e5:d88:a73e with SMTP id p18-20020a056a000b5200b006e50d88a73emr6658033pfo.9.1710523274903;
        Fri, 15 Mar 2024 10:21:14 -0700 (PDT)
Received: from localhost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id b18-20020aa78712000000b006e6be006637sm3614761pfo.135.2024.03.15.10.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 10:21:14 -0700 (PDT)
Date: Fri, 15 Mar 2024 10:21:14 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Mar 2024 10:18:57 PDT (-0700)
Subject: Re: [PATCH v3 1/4] dt-bindings: reset: sophgo: support SG2042
In-Reply-To: <MA0P287MB282221F8E750206EA615B3CEFE282@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
CC: unicornxw@gmail.com, inochiama@outlook.com, arnd@kernel.org,
  aou@eecs.berkeley.edu, chao.wei@sophgo.com, Conor Dooley <conor@kernel.org>,
  krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, p.zabel@pengutronix.de,
  robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
  jszhang@kernel.org, krzysztof.kozlowski@linaro.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: unicorn_wang@outlook.com
Message-ID: <mhng-76918908-fb82-4312-9320-959318b98b5f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_102116_457811_817FB099 
X-CRM114-Status: GOOD (  17.23  )
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

T24gVGh1LCAxNCBNYXIgMjAyNCAxNzoxNToxMSBQRFQgKC0wNzAwKSwgdW5pY29ybl93YW5nQG91
dGxvb2suY29tIHdyb3RlOgo+Cj4gT24gMjAyNC8zLzE0IDIzOjE3LCBQYWxtZXIgRGFiYmVsdCB3
cm90ZToKPj4gT24gTW9uLCAyOSBKYW4gMjAyNCAxNzo0OTo0NSBQU1QgKC0wODAwKSwgdW5pY29y
bnh3QGdtYWlsLmNvbSB3cm90ZToKPj4+IEZyb206IENoZW4gV2FuZyA8dW5pY29ybl93YW5nQG91
dGxvb2suY29tPgo+Pj4KPj4+IEFkZCBiaW5kaW5ncyBmb3IgdGhlIHJlc2V0IGdlbmVyYXRvciBv
biB0aGUgU09QSEdPIFNHMjA0MiBSSVNDLVYgU29DLgo+Pj4KPj4+Cj4gWy4uLl0KPj4KPj4gVGhp
cyBpcyBub3cKPj4KPj4gRml4ZXM6IDFjZTc1ODdlNTA3ZSAoInJpc2N2OiBkdHM6IGFkZCByZXNl
dCBnZW5lcmF0b3IgZm9yIFNvcGhnbwo+PiBTRzIwNDIgU29DIikKPj4KPj4gd2hpY2ggbGFuZGVk
IGluIExpbnVzJyB0cmVlLsKgIExvb2tzIGxpa2UgdGhhdCB3ZW50IHVwIHZpYSBJbm9jaGkgYW5k
Cj4+IEFybmQuwqAgSSBkb24ndCBoYXZlIHRoYXQgaW4gbXkgZm9yLW5leHQgeWV0LCBzbyBJJ20g
anVzdCBzdGFzaGluZyBhd2F5Cj4+IHRoaXMgcGF0Y2ggZm9yIG15IHRlc3Rlci4KPj4KPj4gSSdt
IGhhcHB5IHRvIHBpY2sgdGhpcyB1cCBpZiBmb2xrcyB3YW50LCBidXQgaXQnbGwgcHJvYmFibHkg
YmUgY2xlYW5lcgo+PiBzb21ld2hlcmUgZWxzZS4KPgo+IEhpLCBQYWxtZXIsCj4KPiBJIHNlZSBB
cm5kIGhhcyBwcmVwYXJlZCBhIHRhZwo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3NvYy9zb2MuZ2l0L3RhZy8/aD1zb2MtbGF0ZS02LjkKPiB3aGljaCBj
b250YWlucyB0aGUgYmluZGluZ3MgcGFydCBjaGFuZ2VzIGZvciBzZzIwNDIgcmVzZXQgZHJpdmVy
Lgo+Cj4gTGV0J3Mgd2FpdCBmb3IgQXJuZCB0byBzdWJtaXQsIGFsdGhvdWdoIEkgaGF2ZW4ndCBz
ZWVuIHRoaXMgaW4gTGludXMncwo+IHRyZWUgYW5kIG5vdCBzdXJlIGlmIEFybmQgaGF2ZSBzdWJt
aXR0ZWQgdGhpcy4KCk9LLCBzb3VuZHMgZ29vZC4gIEkgcmVhbGl6ZWQgSSBkcm9wcGVkIHRoZSBi
YWxsIG9uIGEgZml4LCBzbyBJJ20gbm90IApzZW5kaW5nIGEgUFIgdGhpcyBtb3JuaW5nIGVpdGhl
ciB3YXkgKEkgaGFkbid0IHBpY2tlZCB0aGlzIHVwIHlldCwgCnRob3VnaCwgc28gc2hvdWxkbid0
IG1ha2UgbXVjaCBvZiBhIGRpZmZlcmVuY2UpLgoKSSdsbCBqdXN0IGxlYXZlIHRoaXMgaW4gbXkg
bm90LWZvci1uZXh0IHVudGlsIGl0IGdldHMgc29ydGVkIG91dC4KClRoYW5rcyEKCj4KPiBUaGFu
a3MsCj4KPiBDaGVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
