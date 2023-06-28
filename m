Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731B4EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 12:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rleaUWSzygI4B0ESOAULhfOvCsPV8z+3105ZIth4IFw=; b=JKyPGbP/lq7UsN
	z9iw40dPymaMCgxzGxBKZsUw4ZzE5ouOCIew47YGbaAKtwvyOJtFRAdpjFwUCMxqGx7stlSmgA2VN
	DOUKIdDfOLIYxtAK84T+BLHLFbwJhDyLUmsWs1asdUNByiFKaZOAeMNULXxEBMR/Sxz9f1BcpOjKY
	Uk3dy5e2wlBEeaD8tdnPPpVbyblMMytXoHsZ1vCv3Ul0ZDN9X5ux8n1yLq4xhGZiVikoauCGA9/o7
	lj6ZOk2LgG/O1DWxiU8/r7na1l/fOqOhgVJegZlbhT0+bm9WyIvNZFUQWp82F8avEKtZSolAWMCzX
	qNLhwq50Px/8qPYnOYhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEUkP-00Fhtx-0u;
	Wed, 28 Jun 2023 12:58:13 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEUkM-00Fht6-0u
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 12:58:11 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7835971026fso143509139f.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 05:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687957087; x=1690549087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmAJ4kybVwJdt2vlA7P+ww38r+1sb7umIggV1gZPfIc=;
        b=TH62gIf3kGj2Mt+ts7Y630wN71DXW47CEhU3g2Pwmabuz3PXytPQ+L5Z5vUmfzd6tq
         XX0K8zmrpoR4BlYFswV/u0sf4deJ+qP51K5HmjwsQUKQbe8NWmP8rAMTv/y1qvlfhswi
         7CW3NrPDN3CvIDMFcbjXS0c4nN1j+Cca6liM/YmFCe/6hiOwC9Uid2twZQmsbo66y65p
         tjEXGKewk/oH/q31S0lN7KDx2E9WT4nFBWDXkAIK4wAt9D4gmsPinno/+w3jHdTsWKvF
         sEToXu2u7v6U1qdh32oUFrXkeMs0SW64cwg0f8r8L+RH6/dqj9BC6o4rrMLkjw8XfNzl
         7dLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687957087; x=1690549087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmAJ4kybVwJdt2vlA7P+ww38r+1sb7umIggV1gZPfIc=;
        b=QZsDYfgSXW0iz/7Nqtucz34sE5Je1+K3rl3yH7ZliSwktScuL1S2ziIhhEz8dYJHea
         5RIkwRhNmfTv5u0GxjofzerJGbfYjEMGe9Tmx7A7HdwWOIF7c0YVN8Fui3eQmb/Fj9fO
         wVR8ZI4AR852hze+zDaEaC3BFp28DEBviBOVMkoUi1RjZgAUt4i0pg7+8Ok9SfKNDZiK
         h/fNM8+MK16rIvZH16CFOyF9NlsaMbAc86AghSbaI4CgPzAdTzuvUhxP8PaDaAT3bXam
         IzmoHx1X+nxVPTCC6y2p+QaZs6PdCSpCkQY1Tl+/YfJNC8MyVB5SDcURotsxwHZSifyu
         MnQQ==
X-Gm-Message-State: AC+VfDzpWYVq3zzU+o8jLDbVylqJ4DRkB8Xq5z8vWphmCFckVNid58E0
	AfB/eL7JFcLHYWRw9Joc/2DuAbwdwxZzdlSFlg4=
X-Google-Smtp-Source: ACHHUZ6wS3W3zO8LM9C9sDqMZ4ikRUkeGGgbR0c2UtDxGwWsiO7g3opU34oKoYpfnXFkZ40VN/fauhQQUj3llWYZ3Z8=
X-Received: by 2002:a6b:f203:0:b0:783:7298:55ef with SMTP id
 q3-20020a6bf203000000b00783729855efmr5556608ioh.11.1687957087169; Wed, 28 Jun
 2023 05:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230614104759.228372-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230614104759.228372-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <20d4d296-14d7-467d-826c-b5c9cdf4599a@app.fastmail.com>
In-Reply-To: <20d4d296-14d7-467d-826c-b5c9cdf4599a@app.fastmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 28 Jun 2023 13:57:40 +0100
Message-ID: <CA+V-a8tMcNnx3AK69KeFaNLvgt4yhy0wKdKdjR=AvuUwZNM-RA@mail.gmail.com>
Subject: Re: [PATCH v9 5/6] cache: Add L2 cache management for Andes AX45MP
 RISC-V core
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Conor.Dooley" <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, guoren <guoren@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel@sholland.org>, linux-riscv@lists.infradead.org, 
	Christoph Hellwig <hch@infradead.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_055810_339966_14D3C012 
X-CRM114-Status: GOOD (  19.72  )
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

SGkgQXJuZCwKClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4KCgpPbiBXZWQsIEp1biAxNCwgMjAy
MyBhdCAyOjEx4oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4KPiBP
biBXZWQsIEp1biAxNCwgMjAyMywgYXQgMTI6NDcsIFByYWJoYWthciB3cm90ZToKPgo+ID4gK3N0
YXRpYyB2b2lkIGF4NDVtcF9kbWFfY2FjaGVfaW52KHBoeXNfYWRkcl90IHBhZGRyLCB1bnNpZ25l
ZCBsb25nIHNpemUpCj4gPiArewo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBzdGFydCA9ICh1bnNp
Z25lZCBsb25nKXBoeXNfdG9fdmlydChwYWRkcik7Cj4gPiArICAgICBjaGFyIGNhY2hlX2J1Zlsy
XVtBWDQ1TVBfQ0FDSEVfTElORV9TSVpFXTsKPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgZW5kID0g
c3RhcnQgKyBzaXplOwo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBvbGRfc3RhcnQgPSBzdGFydDsK
PiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgb2xkX2VuZCA9IGVuZDsKPiA+ICsgICAgIHVuc2lnbmVk
IGxvbmcgbGluZV9zaXplOwo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiA+ICsKPiA+
ICsgICAgIGlmICh1bmxpa2VseShzdGFydCA9PSBlbmQpKQo+ID4gKyAgICAgICAgICAgICByZXR1
cm47Cj4gPiArCj4gPiArICAgICBsaW5lX3NpemUgPSBheDQ1bXBfcHJpdi5heDQ1bXBfY2FjaGVf
bGluZV9zaXplOwo+ID4gKwo+ID4gKyAgICAgbWVtc2V0KCZjYWNoZV9idWYsIDB4MCwgc2l6ZW9m
KGNhY2hlX2J1ZikpOwo+ID4gKyAgICAgc3RhcnQgPSBzdGFydCAmICh+KGxpbmVfc2l6ZSAtIDEp
KTsKPiA+ICsgICAgIGVuZCA9ICgoZW5kICsgbGluZV9zaXplIC0gMSkgJiAofihsaW5lX3NpemUg
LSAxKSkpOwo+ID4gKwo+ID4gKyAgICAgbG9jYWxfaXJxX3NhdmUoZmxhZ3MpOwo+ID4gKyAgICAg
aWYgKHVubGlrZWx5KHN0YXJ0ICE9IG9sZF9zdGFydCkpCj4gPiArICAgICAgICAgICAgIG1lbWNw
eSgmY2FjaGVfYnVmWzBdWzBdLCAodm9pZCAqKXN0YXJ0LCBsaW5lX3NpemUpOwo+ID4gKwo+ID4g
KyAgICAgaWYgKHVubGlrZWx5KGVuZCAhPSBvbGRfZW5kKSkKPiA+ICsgICAgICAgICAgICAgbWVt
Y3B5KCZjYWNoZV9idWZbMV1bMF0sICh2b2lkICopKG9sZF9lbmQgJiAofihsaW5lX3NpemUgLSAx
KSkpLAo+ID4gbGluZV9zaXplKTsKPiA+ICsKPiA+ICsgICAgIGF4NDVtcF9jcHVfZGNhY2hlX2lu
dmFsX3JhbmdlKHN0YXJ0LCBlbmQsIGxpbmVfc2l6ZSk7Cj4gPiArCj4gPiArICAgICBpZiAodW5s
aWtlbHkoc3RhcnQgIT0gb2xkX3N0YXJ0KSkKPiA+ICsgICAgICAgICAgICAgbWVtY3B5KCh2b2lk
ICopc3RhcnQsICZjYWNoZV9idWZbMF1bMF0sIChvbGRfc3RhcnQgJiAobGluZV9zaXplIC0KPiA+
IDEpKSk7Cj4gPiArCj4gPiArICAgICBsb2NhbF9pcnFfcmVzdG9yZShmbGFncyk7Cj4gPiArfQo+
Cj4gSSdtIG5vdCBxdWl0ZSBzdXJlIHdoYXQgdGhpcyBkb2VzLCBtYXliZSBzb21lIGNvbW1lbnRz
IHdvdWxkIGhlbHAuCj4KPiBUaGlzIGxvb2tzIGxpa2UgYSBub3ZlbCBtZXRob2Qgb2YgcHJlc2Vy
dmluZyBwYXJ0aWFsIGNhY2hlIGxpbmVzCj4gYXQgdGhlIGJlZ2lubmluZyAoYnV0IG5vdCB0aGUg
ZW5kPykgb2YgYW4gdW5hbGlnbmVkIGFyZWEuCj4KSSBtaXNzZWQgdGhpcyBlYXJsaWVyLCAoSSBy
ZW1vdmVkIHRoZSBwcmVzZXJ2aW5nIG9mIGNhY2hlIGxpbmUgZnJvbQp0aGVuIGVuZCBhbmQgbGVm
dCB0aGUgYmVnaW5uaW5nIHBhcnQuIFNhbXVlbCBwb2ludGVkIHRvIGVhcmxpZXIgb24KdGhlc2Ug
cGF0Y2hlcyBpZiB0aGUgY2FjaGUtbGluZS1zaXplIGlzIDY0IHdlIGRvbnQgbmVlZCB0byBkbyB0
aGlzKS4KUHJlc2VydmluZyBjYWNoZSBsaW5lcyBpcyBub3QgbmVlZGVkIGF0IGFsbCwgIEl2ZSB2
ZXJpZmllZCB0aGlzIGFuZApqdXN0IGRvaW5nIGEgX2ludmFsKCkgaXMgc3VmZmljaWVudC4gSSds
bCB1cGRhdGUgdGhpcyBhbmQgc2VuZCBhIG5ldwp2ZXJzaW9uLgoKQ2hlZXJzLApQcmFiaGFrYXIK
Cj4gQXMgZmFyIGFzIEkgY2FuIHRlbGwsIG1vc3QgZG1hX21hcHBpbmcgaW1wbGVtZW50YXRpb25z
IGRvbid0Cj4gZXZlbiB0cnkgdG8gZG8gdGhhdCBhdCBhbGwsIGJ1dCB0aGUgb25lcyB0aGF0IGRv
IHRha2UgYSBkaWZmZXJlbnQKPiBhcHByb2FjaCBieSBjYWxsaW5nIF93YmFja19pbnYoKSBvbiBw
YXJ0aWFsIGNhY2hlIGxpbmVzIGluc3RlYWQKPiBvZiBjYWxsaW5nIF9pbnYoKS4KPgo+IEknZCBz
YXkgdGhpcyBkb2VzIG5vdCBiZWxvbmcgaW50byB0aGUgbG93LWxldmVsIG9wZXJhdGlvbnMKPiBo
ZXJlLCBlc3BlY2lhbGx5IHNpbmNlIHRoZSBaSUNCT00gdmFyaWFudCBkb2Vzbid0IGRvIHRoaXMg
ZWl0aGVyLgo+Cgo+ICAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
