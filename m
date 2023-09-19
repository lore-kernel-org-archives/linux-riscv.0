Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D5ECD54AC
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 09:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kMLJbV1rMohivge+jorqDUIM3Df2jwlj6s5CFSSXTOo=; b=axSV5FHltOW1Ni
	5ypbYLCqrLcqODd2/P+mITkQ+D5rFOz3ZBw1TnC9L+y+v1Je3udUg6S1JO15a3yAn1oRMy+8NYFle
	FNlLtprnO+Z9S8jxczFKaTBX2pcRjrURY8x7iUoFFtkl7Zhl9jItK/ruQ2TlsQczdDWbjm9x6mL9X
	oFdlebq+mdDsBTybjOpGQ29IrbNm0suRD08Jy3ejpHwmA/zmN3MUigocvmcVywa79L7sxlgCA8jgj
	KEU4MZxpfH9RnWaLjtnQPMzvzgB30necp4J0hGcVilhIbJhEHWZVUyHJ0SKjuOgsPpIxkoZOgbZA1
	L9YyjwDbhjUI7lWMohcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiWoY-00HQnR-2A;
	Tue, 19 Sep 2023 09:14:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiWoW-00HQn5-1l
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 09:14:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 01917B81262
	for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 09:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0E6C433C7
	for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 09:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695114873;
	bh=HybvwmhtyJesrVC22Rh7+YLNJe2p1RpasmQCB/Dldfc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BTxBUNRxDo8BBc71pE/LG13Ckbea7DicktBvolK5R5kKi2gw1Um3czp8B+WJ/V1Io
	 a1EPFo3XIALvhMaAZ0nzYevTcexOLSvPbQWihhmhRHWZbSMN9TCELt4mGrPUID7WqW
	 r0hau1g+dxfvdho1vLbQ+IBRds+T0rxAOVL1+NkVxjxPI7V2PA3Y2PSQD++Xpt/R2h
	 4WxUMtH26UykPDK8IFh6k5pX80UI/HC7vIlk4AI9+3UBoEkMsZodw4cKg+X0l/sgdO
	 76y6PqLvrfDMokALzfy/NuJJUyUtdRDkKe3EDfTaxEKp4bURqmaNIzIX4QbTj170vG
	 AMRdsWKu7TfSg==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-529fb04a234so6650427a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 02:14:33 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw2nBwqXeJBTig3GoUr6b9nTzW7vNRX6MfWACkjqf+7Y9KyL7w0
	A1jxsDSDPMKragyXgMcMCcFJ/CdKvEu/Ah7klXw=
X-Google-Smtp-Source: AGHT+IGS9l0z8unte+sTRED9Gzkj31X9NjUD+GwvTkR8yI8Ja3cCauOflzugWFIGsC1E/8MGxUZ8QcWj+4yH7SpKllU=
X-Received: by 2002:a17:906:5a63:b0:9ad:dfe5:f8d8 with SMTP id
 my35-20020a1709065a6300b009addfe5f8d8mr8634206ejc.63.1695114871998; Tue, 19
 Sep 2023 02:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230918045125.4000083-1-k.son@samsung.com> <CGME20230918045134epcas1p1b80b338b66512a976c3783cd0e51da50@epcas1p1.samsung.com>
 <20230918045125.4000083-2-k.son@samsung.com> <20230918-4ef7f52da269f3a7e4023bb3@fedora>
 <005301d9eab7$5688c920$039a5b60$@samsung.com> <20230919-42333064be342f6ab125dd75@fedora>
In-Reply-To: <20230919-42333064be342f6ab125dd75@fedora>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 19 Sep 2023 17:14:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR6unxNBMs-xV_BU-+MxemR_GOgzPb1tz0A-aah0Y2U9g@mail.gmail.com>
Message-ID: <CAJF2gTR6unxNBMs-xV_BU-+MxemR_GOgzPb1tz0A-aah0Y2U9g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Document th1520 reset control
To: Conor Dooley <conor@kernel.org>, wefu@redhat.com
Cc: Kwanghoon Son <k.son@samsung.com>, p.zabel@pengutronix.de, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jszhang@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	inki.dae@samsung.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_021436_724767_8A908A76 
X-CRM114-Status: GOOD (  19.99  )
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

T24gVHVlLCBTZXAgMTksIDIwMjMgYXQgNDo0N+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBHdW8sCj4KPiBPbiBUdWUsIFNlcCAxOSwgMjAyMyBhdCAwMjow
ODozMlBNICswOTAwLCBLd2FuZ2hvb24gU29uIHdyb3RlOgo+ID4gPiA+ID4gKyAgICAgIC0gY29u
c3Q6IHRoZWFkLHRoMTUyMC1yZXNldAo+ID4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IHN5c2Nvbgo+
ID4gPiA+Cj4gPiA+ID4gaUR1bWIgcXVlc3Rpb24gcGVyaGFwcywgYnV0IHdoeSBpcyB0aGlzIGEg
c3lzY29uPwo+ID4gPgo+ID4gPiBUaGlzIGlzIGdvb2QgcG9pbnQuCj4gPiA+IEluIGZhY3QsIEkg
dG9vayBpdCBmcm9tIHRoZSB2ZW5kb3Iga2VybmVsLCBhbmQgSSB0cmllZCB0byBrZWVwIGl0IGFz
IHNhbWUgYXMgSSBjb3VsZC4KPiA+ID4gVmVuZG9yIGFsc28gZm9sbG93ZWQgZHJpdmVycy9yZXNl
dC9yZXNldC1pbXg3LmMKPiA+ID4gQXMgUm9iIHNhaWQsIGlmIGRvbid0IG5lZWQgaXQsIEknbGwg
Y2hhbmdlIGl0Lgo+Cj4gPiBJIGhhdmUgaW52ZXN0aWdhdGVkIHZlbmRvciBrZXJuZWxzLCBidXQg
aXQgaXMgc3RpbGwgbm90IHN1cmUgcmVzZXQgaW5mb3JtYXRpb24uCj4gPiBJIHRob3VnaHQgdGhp
cyBpcyBhYm91dCBzeXNfcmVnLCBidXQgd2l0aG91dCBkYXRhc2hlZXQsIGNhbid0IHRlbGwuCj4g
PiBUaGVyZWZvcmUsIHNob3VsZCBiZSBzdG9wcGVkIHBhdGNoIGZvciBhIHdoaWxlIHVudGlsIGtu
b3dzIGJldHRlciBjb21lcyBvdXQuCj4KPiBJcyB0aGVyZSBkb2N1bWVudGF0aW9uIGluIEVuZ2xp
c2ggeW91IGNhbiBwcm92aWRlIHRvIHRoZXNlIHBlb3BsZSB0aGF0Cj4gYXJlIHRyeWluZyB0byBh
ZGQgc3VwcG9ydCBmb3IgeW91ciBwcm9kdWN0PwpZZXMsIEZ1d2VpIHdvdWxkIGhlbHAgd2l0aCB0
aGlzLCBhbmQgdGh4IGZvciBhbGwgb2YgeW91ciB3b3JrLgoKPgo+IFRoYW5rcywKPiBDb25vci4K
CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
