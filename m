Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89477C001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 08:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3gxa7XYSdff58Mw230jd42ddGP1lpynUgjWvIxdqBOk=; b=MMGdQwnGZbJ2+A
	JOhtkmKM37UgtAY621fPHXp/R5ccS0COmWaoHndwAJPUMw+s2XK/1zFGIzoaoZh2C+nXSiF7zNkbO
	aWkrD7Gr53kGCwfjqVf5WvtbElb23X/zeRjQGsjpDr7BwLNtzFQkT5iSYbWMdYBlPty/kBNty42Kb
	+VwFYqOd5BKUnoBAhoiwnQ2x68Xzr3L0NJC96oomxwYcooeFuhuaIfV76uYsaKLNO7Dy0ciz2Gc+n
	HAOV6sWs4eUNECW+nZObvmzJm7dN7TSN0GzIyPJJee9I4DzJ3Tq+Zr/QCuKINr2tTuxccS+/IoA1/
	c6tg7/tSEzUMTliMlXYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPIlt-002ODD-1W;
	Fri, 28 Jul 2023 08:24:25 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPIlq-002OCX-0P
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 08:24:24 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b9b6e943ebso34845671fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 01:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690532660; x=1691137460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nfg1hAFAFOQRB0/caU2cskMNI6q+Xu+UtevR3ZMivJM=;
        b=Vh9YSeCIoQwXiMdNvouVxbJZmT0mZh2Gc4haKgKJA9lGwQ3+sygkU/zwc2EibPipxv
         BsAzSC5mcVJrgOda1VzsKYsAGxfWclLMaHbvnSpJnNtAeawDY57RzK/h5xpBxhR4qMGa
         TT2nuDK9+2LZD+AX4RH9KGU4mTjEkoeu5FV/cABUqIH4op26G32QtU1tNe33/Vgj/W7J
         LCHToWF/FRxzGzCrC46dgQGamdJI+pr3g+E8VVaZEKaYSRSqpzPreZrgtrR5mQop5jNF
         2hpMy9xdQyz55RLghHhtFpJtPD421ZVHQYkLKceiVplpvPVBGcrzb611v5hslZH8J8/Z
         tGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690532660; x=1691137460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nfg1hAFAFOQRB0/caU2cskMNI6q+Xu+UtevR3ZMivJM=;
        b=cGg/Iy6XjLQS1Spt6/y3zvX/UadCTF0sNn8wMCK5iT0nkKLNq4B64GhcDZ5Cj/IcxZ
         eAo3P5CzrjKRLNWzEWkJTqa8RqS1P+j0oJ5F1k1/JSURIeH3nO5BWaEGMVyhpbIwc/Vn
         SU48d+AUQvOS/CJS/lxe6BToJdIcI68GJVmuYZ4y3BFYfG91Rdv00pUOrvlVnA84wuSY
         oBNWfXwmMIDKpZOEsLQJImJhhLLESBbbjOUNpAW+0o9gwZROO54Xi3iA8uIgJg/krT6w
         q7AXj6MZI8BbYL8im34O1icsl5R8GlK0OS7JjVmKmqnW8bDRqvdtYIOW1+NoKgX+gEVO
         W/mg==
X-Gm-Message-State: ABy/qLbXmMCUslD8bWQRXOJGBB9KttY4AZp54uo8pXidGUnnkNBShzKe
	Gu1I7qGUPDLtmr2lZb0hxASxK+JmwkyIJi9t3zc/kA==
X-Google-Smtp-Source: APBJJlGYU8jwqqvJ9ffCI1R5q4AiQUWDzjeBoyDj90vAwEldx3gDn5udCaGtC9veAeFp5TNq+tXGaZB/BOR4iYCbwq0=
X-Received: by 2002:a2e:9b8b:0:b0:2b9:aac2:710e with SMTP id
 z11-20020a2e9b8b000000b002b9aac2710emr765623lji.7.1690532659661; Fri, 28 Jul
 2023 01:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230720135125.21240-1-eric.lin@sifive.com> <20230720135125.21240-2-eric.lin@sifive.com>
 <20230720-slept-guru-216e2803061e@spud> <20230728-facedown-husked-9813fa79d9a0@wendy>
In-Reply-To: <20230728-facedown-husked-9813fa79d9a0@wendy>
From: Eric Lin <eric.lin@sifive.com>
Date: Fri, 28 Jul 2023 16:24:08 +0800
Message-ID: <CAPqJEFrObCSEXx+qTOp_JY3m5Ano59x=U4fFCBJ32ufLUx+6PA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zong.li@sifive.com, greentime.hu@sifive.com, vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_012422_193911_BEF75540 
X-CRM114-Status: GOOD (  28.44  )
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

SGkgQ29ub3IsCgpPbiBGcmksIEp1bCAyOCwgMjAyMyBhdCAzOjA24oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1bCAyMCwg
MjAyMyBhdCAwNjoxMDo1MVBNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiBIZXkgRXJp
YywKPiA+Cj4gPiBPbiBUaHUsIEp1bCAyMCwgMjAyMyBhdCAwOTo1MToxOVBNICswODAwLCBFcmlj
IExpbiB3cm90ZToKPiA+ID4gVGhpcyBhZGQgWUFNTCBEVCBiaW5kaW5nIGRvY3VtZW50YXRpb24g
Zm9yIFNpRml2ZSBQcml2YXRlIEwyCj4gPiA+IGNhY2hlIGNvbnRyb2xsZXIKPiA+ID4KPiA+ID4g
U2lnbmVkLW9mZi1ieTogRXJpYyBMaW4gPGVyaWMubGluQHNpZml2ZS5jb20+Cj4gPiA+IFJldmll
d2VkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBO
aWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgLi4uL2JpbmRpbmdz
L2NhY2hlL3NpZml2ZSxwbDJjYWNoZS55YW1sICAgICAgIHwgNjIgKysrKysrKysrKysrKysrKysr
Kwo+ID4KPiA+IGJ0dywgeW91ciAkc3ViamVjdCBzaG91bGQgYmUgImR0LWJpbmRpbmdzOiBjYWNo
ZTogLi4uLiIgcmF0aGVyIHRoYW4KPiA+ICJyaXNjdjogc2lmaXZlIi4KPiA+CgpPSywgSSdsbCBm
aXggaXQgaW4gdjMuCgo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKykKPiA+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Y2FjaGUvc2lmaXZlLHBsMmNhY2hlLnlhbWwKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jYWNoZS9zaWZpdmUscGwyY2FjaGUueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jYWNoZS9zaWZpdmUscGwyY2FjaGUu
eWFtbAo+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAu
LmVlODM1NmM1ZWVlZQo+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9jYWNoZS9zaWZpdmUscGwyY2FjaGUueWFtbAo+ID4gPiBA
QCAtMCwwICsxLDYyIEBACj4gPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MCBPUiBCU0QtMi1DbGF1c2UpCj4gPiA+ICsjIENvcHlyaWdodCAoQykgMjAyMyBTaUZpdmUsIElu
Yy4KPiA+ID4gKyVZQU1MIDEuMgo+ID4gPiArLS0tCj4gPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9zY2hlbWFzL2NhY2hlL3NpZml2ZSxwbDJjYWNoZS55YW1sIwo+ID4gPiArJHNjaGVt
YTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiA+ICsK
PiA+ID4gK3RpdGxlOiBTaUZpdmUgUHJpdmF0ZSBMMiBDYWNoZSBDb250cm9sbGVyCj4gPiA+ICsK
PiA+ID4gK21haW50YWluZXJzOgo+ID4gPiArICAtIEdyZWVudGltZSBIdSAgPGdyZWVudGltZS5o
dUBzaWZpdmUuY29tPgo+ID4gPiArICAtIEVyaWMgTGluICA8ZXJpYy5saW5Ac2lmaXZlLmNvbT4K
PiA+Cj4gPiBUaGVyZSdzIGV4dHJhIHNwYWNlcyBpbiB0aGVzZSBsaW5lcyBmb3Igc29tZSByZWFz
b24uCj4gPgoKT0ssIEknbGwgZml4IGl0IGluIHYzLgoKPiA+ID4gKwo+ID4gPiArZGVzY3JpcHRp
b246Cj4gPiA+ICsgIFRoZSBTaUZpdmUgUHJpdmF0ZSBMMiBDYWNoZSBDb250cm9sbGVyIGlzIHBl
ciBjb3JlIGFuZAo+ID4gPiArICBjb21tdW5pY2F0ZXMgd2l0aCBib3RoIHRoZSB1cHN0cmVhbSBM
MSBjYWNoZXMgYW5kCj4gPiA+ICsgIGRvd25zdHJlYW0gTDMgY2FjaGUgb3IgbWVtb3J5LCBlbmFi
bGluZyBhIGhpZ2gtcGVyZm9ybWFuY2UKPiA+ID4gKyAgY2FjaGUgc3Vic3lzdGVtLgo+ID4gPiAr
Cj4gPiA+ICthbGxPZjoKPiA+ID4gKyAgLSAkcmVmOiAvc2NoZW1hcy9jYWNoZS1jb250cm9sbGVy
LnlhbWwjCj4gPiA+ICsKPiA+Cj4gPiBJJ20gcHJldHR5IHN1cmUgdGhhdCBJIHBvaW50ZWQgb3V0
IGxhc3QgdGltZSBhcm91bmQgdGhhdCB5b3UgbmVlZCB0byBhZGQKPiA+IHNvbWV0aGluZyBsaWtl
IGluIHRoZSBjY2FjaGUgZHJpdmVyOgo+ID4KPiA+IHNlbGVjdDoKPiA+ICAgcHJvcGVydGllczoK
PiA+ICAgICBjb21wYXRpYmxlOgo+ID4gICAgICAgY29udGFpbnM6Cj4gPiAgICAgICAgIGVudW06
Cj4gPiAgICAgICAgICAgLSBzaWZpdmUsY2NhY2hlMAo+ID4gICAgICAgICAgIC0gc2lmaXZlLGZ1
NTQwLWMwMDAtY2NhY2hlCj4gPiAgICAgICAgICAgLSBzaWZpdmUsZnU3NDAtYzAwMC1jY2FjaGUK
PiA+Cj4gPiBvdGhlcndpc2UgdGhpcyBiaW5kaW5nIHdpbGwgYmUgdXNlZCBmb3IgYW55dGhpbmcg
Y29udGFpbmluZyAiY2FjaGUiIGluCj4gPiB0aGUgZHQtYmluZGluZy4KPiA+IEZvciB0aGlzIGJp
bmRpbmcsIEkgdGhpbmsgdGhhdCB0aGUgZm9sbG93aW5nIGlzIHN1ZmZpY2llbnQ6Cj4gPgo+ID4g
c2VsZWN0Ogo+ID4gICBwcm9wZXJ0aWVzOgo+ID4gICAgIGNvbXBhdGlibGU6Cj4gPiAgICAgICBj
b250YWluczoKPiA+ICAgICAgICAgICBjb25zdDogc2lmaXZlLHBsMmNhY2hlMQo+ID4KClNvcnJ5
LCBJIG1pc3VuZGVyc3Rvb2QgeW91ciBtZWFuaW5nLgpUbyBiZSBob25lc3QsIEknbSBub3QgcXVp
dGUgZmFtaWxpYXIgd2l0aCB0aGUgdXNhZ2Ugb2YgdGhlIHNlbGVjdCBwcm9wZXJ0eS4KV2hlbiBz
aG91bGQgd2UgdXNlIHRoZSBzZWxlY3QgcHJvcGVydHk/Ck1heSBJIGFzaywgaXMgdGhlcmUgYSBk
b2N1bWVudCB0byBkZXRhaWwgaW50cm9kdWNlIGVhY2ggcHJvcGVydHkgYW5kCml0cyB1c2FnZSBs
aWtlIHRoZSBkZXZpY2UtdHJlZSBzcGVjPwpJIHRoaW5rIGl0IHdvdWxkIGJlIHZlcnkgaGVscGZ1
bCBmb3IgYmVnaW5uZXJzIHdyaXRpbmcgY29ycmVjdApkdC1iaW5kaW5nIGFuZCBpdCBjYW4gc2F2
ZSBtdWNoIHJldmlld2VycyB0aW1lLgpUaGFua3MgZm9yIHlvdXIga2luZCBleHBsYW5hdGlvbiwg
SSdsbCBmaXggaXQgaW4gdjMuCgo+ID4gPiArcHJvcGVydGllczoKPiA+ID4gKyAgY29tcGF0aWJs
ZToKPiA+ID4gKyAgICBpdGVtczoKPiA+ID4gKyAgICAgIC0gY29uc3Q6IHNpZml2ZSxwbDJjYWNo
ZTEKPiA+ID4gKyAgICAgIC0gY29uc3Q6IGNhY2hlCj4gPgo+ID4gWW91IG9taXR0ZWQgdGhlIHBs
MmNhY2hlMCBmcm9tIGhlcmUsIHRoYXQgbmVlZHMgdG8gY29tZSBiYWNrISBZb3UnbGwgZW5kCj4g
PiB1cCB3aXRoIDIgaXRlbXMgZW50cmllcy4KCk9LLCBpdCBzaG91bGQgYmUgYXMgZm9sbG93cywg
cmlnaHQ/CgorcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBvbmVPZjoKKyAgICAgIC0g
aXRlbXM6CisgICAgICAgICAgLSBjb25zdDogc2lmaXZlLHBsMmNhY2hlMAorICAgICAgICAgIC0g
Y29uc3Q6IHNpZml2ZSxwbDJjYWNoZTEKKyAgICAgICAgICAtIGNvbnN0OiBjYWNoZQorICAgICAg
LSBpdGVtczoKKyAgICAgICAgICAtIGNvbnN0OiBzaWZpdmUscGwyY2FjaGUxCisgICAgICAgICAg
LSBjb25zdDogY2FjaGUKCkknbGwgZml4IGl0IGluIHYzLiBUaGFua3MuCgo+ID4gRWl0aGVyIHdh
eSwgSSBjYW4ndCB0YWtlIHRoaXMgYmluZGluZyB3aXRob3V0IGEgc29jLXNwZWNpZmljIGNvbXBh
dGlibGUsCj4gPiBwZXIgc2lmaXZlLWJsb2Nrcy1pcC12ZXJzaW9uaW5nLnR4dC4uCj4KPiBGdXJ0
aGVyLCAic2lmaXZlLHBlcmZtb24tY291bnRlcnMiIGlzIGFuIHVuZG9jdW1lbnRlZCBwcm9wZXJ0
eS4KPgoKT0ssIEknbGwgYWRkICJzaWZpdmUscGVyZm1vbi1jb3VudGVycyIgcHJvcGVydHkgaW4g
djMuClRoYW5rcyBmb3IgeW91ciBraW5kIHJldmlldy4KCkJlc3QgcmVnYXJkcywKRXJpYyBMaW4K
Cj4gVGhhbmtzLAo+IENvbm9yLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
