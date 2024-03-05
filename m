Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAC7C54E49
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 23:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSa1BwAVbSUpwL5V80gUuzXvwOVp+1tlE7Ltfvj9hbw=; b=MBN7ugTzPBkYxb
	QwT5o2MUepwNndkwLlUaRDY8oqF9ZIDVzK7nT8+95t4YKepG+3zevOj1t1SExefxiNifVNYoI8e32
	dH3rAb7Vk9XScy8TtJ+5LlLxE+oco2dRsdH7krg41HOXX+V5B99v5JA0poVufJG4mrpmYNuwEd6as
	rwrlum5cOdDYSOvhqsnWwppkNpV5tdt0ehZLE1tqqk0yEIX7SevUBIxoZlZueJVzKIU0tEhqb69EU
	8CjcX3NyfQTg7Cu+6jWa6weImVaMrF9Q8s3QVthtOaj32nqZgNoVLTkuRuB6PNIxuAF8EMHM/N1sm
	J0t66KHC2/PUJtxTQ7eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rheOG-0000000Fena-3LLp;
	Tue, 05 Mar 2024 23:40:08 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rheOD-0000000FemH-36Gk
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 23:40:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 847D0CE1F97
	for <linux-riscv@lists.infradead.org>; Tue,  5 Mar 2024 23:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C635EC433C7
	for <linux-riscv@lists.infradead.org>; Tue,  5 Mar 2024 23:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709682002;
	bh=ZbT02GckxhHJ4FZEgl68A4FqWhRioB/biC4qC0J0UrY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fmcDqZnAlea4GnAHtBAIvjZhmnNmXrHSREOgIYXhBzoq/asHYQFLxGf8RKrc9K41C
	 xHLaMiIocQJER56hRfhCsSuzAiuWnl3gI6UrCe6F0WxoQA7R7+Qz41+zE+58+ubBFD
	 wayEw3vJ/1jImRsDC9tCDj9MpeVQZPTElU/Uss+heOioyoyN/kDRgHyy4eEp7kxGJP
	 q+85AAfCpt3i7c5PmFPbusoiikhC9hxe7bEox8+XyI3rLYSk7UYZS3D30Js5BjcRcR
	 lqdjKo5C1bIaqqK7gLQMdZOMGoQHPN7sW6L4fi/UGw+axzmEjD7KtsJ6V09pEsP6iL
	 Qyhno6Z24Iv+Q==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5131c0691feso8070807e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Mar 2024 15:40:02 -0800 (PST)
X-Gm-Message-State: AOJu0Yx40LL/NPMNJO4zaAybjxJtY05FZAeGoRNlgGsgm80cjWRHjkWv
	leeteFmzxwExKh4vp1NaK6p/n9aOWQOsup9G1Y3pXV5Yow96zraxCk0k+o2DwrNweucrRFC99mT
	BpTHAOb9aSvM1rHRT2u3olSwLSBE=
X-Google-Smtp-Source: AGHT+IFXKvEn9m7zUfxSLk5YjglzlHNDAXVUlL5T/d0fHbt4kn0FiKvKk7UJ9njR40d7s8pPGu6/Onlqbv6aasIveEI=
X-Received: by 2002:ac2:4e8f:0:b0:513:23be:e924 with SMTP id
 o15-20020ac24e8f000000b0051323bee924mr2045396lfr.59.1709682000980; Tue, 05
 Mar 2024 15:40:00 -0800 (PST)
MIME-Version: 1.0
References: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com> <tencent_29708962B242A61B23F9460425B4951CDF09@qq.com>
In-Reply-To: <tencent_29708962B242A61B23F9460425B4951CDF09@qq.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 6 Mar 2024 07:39:49 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQLppAQpz+-YY-sEKp-XPO2rDQwYLOy0uptgFw3zPXoYg@mail.gmail.com>
Message-ID: <CAJF2gTQLppAQpz+-YY-sEKp-XPO2rDQwYLOy0uptgFw3zPXoYg@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] dt-bindings: riscv: Add T-HEAD C908 compatible
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_154005_986299_03550EFE 
X-CRM114-Status: GOOD (  12.14  )
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

T24gV2VkLCBNYXIgNiwgMjAyNCBhdCA1OjI04oCvQU0gWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxm
Lm5hbWU+IHdyb3RlOgo+Cj4gVGhlIHRoZWFkLGM5MDggaXMgYSBSSVNDLVYgQ1BVIGNvcmUgZnJv
bSBULUhFQUQgU2VtaWNvbmR1Y3RvciB3aGljaCB1c2VkCj4gaW4gQ2FuYWFuIEtlbmRyeXRlIEsy
MzAgU29DLgo+Cj4gU2lnbmVkLW9mZi1ieTogWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxmLm5hbWU+
Cj4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4g
LS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwg
fCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiBpbmRleCA5ZDg2
NzBjMDBlM2IuLmU4NTNhN2ZjZWU4YSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+IEBAIC00Nyw2ICs0Nyw3IEBAIHByb3Bl
cnRpZXM6Cj4gICAgICAgICAgICAgICAgLSBzaWZpdmUsdTc0Cj4gICAgICAgICAgICAgICAgLSBz
aWZpdmUsdTc0LW1jCj4gICAgICAgICAgICAgICAgLSB0aGVhZCxjOTA2Cj4gKyAgICAgICAgICAg
ICAgLSB0aGVhZCxjOTA4Cj4gICAgICAgICAgICAgICAgLSB0aGVhZCxjOTEwCj4gICAgICAgICAg
ICAgICAgLSB0aGVhZCxjOTIwCj4gICAgICAgICAgICAtIGNvbnN0OiByaXNjdgo+IC0tCj4gMi40
My4wCj4KUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKLS0gCkJlc3Qg
UmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
