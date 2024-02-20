Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D0EC48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 01:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9YOpeiknkAZO6KvC5YBXNdpftXRsRZi11UFhBi90jTQ=; b=glQ8og41lqbzvc
	1C7RPmHKVeSBvwZA3LnHZXcHdZ+Y5K3+u8aAcxo3CL2KQKo8Ta/F8aZR/INBtQHcOkQF8+bXcN0Y8
	pQB2hT0b4gDn/vCpyeDUxa54zScnaP9amgDhIWEJMuD2C2TQUaQu596U5wR1i/he2poSjeEKJK2Rh
	MMdGwJjC0xW3Wix8xeEFjo5gG++HOc7PRlwAi5BfCBumbz0VjQrG8GmaCEqPXzzCib8TYrBBxG6q7
	7EWUBjIm9Sohb/1JCXZssTlfc487nlhBaei8g2oMofvXqCAZL83rFx/Qm17DIi+j0O/whZJ0oFPaV
	+T4ZB3u8ZtRCMKhVRGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcEgF-0000000ChzX-23dA;
	Tue, 20 Feb 2024 01:12:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcEgC-0000000Chz7-3IM5
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 01:12:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7B22BCE17A9
	for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 01:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8EBCC43399
	for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 01:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708391532;
	bh=WSFWszHnqQ0WnZCFOLYWkT6gnqW8Ii4nog/ORGkVIAI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GsLLgewJcX7xmC9iwtGWItU2wDmFuh8Qx4XbdQCp6K0ZQ/ylwFGanLVOtN4XOu/cp
	 2+TTjLwcRRwl+Y8n6WMB5SgIuqj3J3mqmMzvIE9GsSzQyh3R3jKv0XUsGuNJKywPRY
	 4SKtNynsq5XtNl28yQ3ty6AXtnfJRcndn1qzcDeuqGpsDwZ6HZLCdhweeJj3z6RTtc
	 knXXFcB706KQq8TwLwOimODMeoqf8rP9HVwugb3wVFynB+UNiTy30txUtWUfoWCxwx
	 Iv9LXf2DSp5UCrvaXpO6oGb2ARguHliFGJDqr0CeVEWwNDlljh6kvb8LlnBWIrWfMS
	 RGLwoL8+LCJ7Q==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3e550ef31cso202850066b.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 17:12:12 -0800 (PST)
X-Gm-Message-State: AOJu0YxAK21PekcTAkc6//R188zRU3/w9XHwPYBvpvcr34Hl6yrS30as
	vD3QD/tXiBg421M7LYOZy2TZlxZTUFYsJRnnA2phWeBO5sEQ2BgOxZsCo9EWDn15HFC3wrRRQ7F
	ePEn+36xbE70TBq+AX5hgoh1Gqsg=
X-Google-Smtp-Source: AGHT+IHUVyM4dMnO6EVihhkRqtv5mZv1aY4mDLTlUemHh2d6Bgwy6CKPkDxzE3dFHXm8lgQhM9IEEFFFkPU6EacOuYI=
X-Received: by 2002:a17:906:c41:b0:a3e:96f4:492e with SMTP id
 t1-20020a1709060c4100b00a3e96f4492emr2529778ejf.31.1708391531067; Mon, 19 Feb
 2024 17:12:11 -0800 (PST)
MIME-Version: 1.0
References: <tencent_594131AD216D8DE97CCC8265DA5D8E45B808@qq.com>
In-Reply-To: <tencent_594131AD216D8DE97CCC8265DA5D8E45B808@qq.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 20 Feb 2024 09:11:59 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTW_bBwWAfNhiUNXpseg44fd_+=3j4NjCaqryzWN_194A@mail.gmail.com>
Message-ID: <CAJF2gTTW_bBwWAfNhiUNXpseg44fd_+=3j4NjCaqryzWN_194A@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: fix NOCACHE_THEAD does not set bit[61] correctly
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Jisheng Zhang <jszhang@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_171217_024416_61F15687 
X-CRM114-Status: GOOD (  15.81  )
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

T24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgMTI6MzPigK9BTSBZYW5neXUgQ2hlbiA8Y3l5QGN5eXNl
bGYubmFtZT4gd3JvdGU6Cj4KPiBQcmV2aW91cyBjb21taXQgZGJmYmRhM2JkNmJmKCJyaXNjdjog
bW06IHVwZGF0ZSBULUhlYWQgbWVtb3J5IHR5cGUKPiBkZWZpbml0aW9ucyIpIG1pc3NlZCBhIGA8
YCBmb3IgYml0IHNoaWZ0aW5nLCByZXN1bHQgaW4gYml0WzYxXSBkb2VzIG5vdCBzZXQKPiBpbiBf
UEFHRV9OT0NBQ0hFX1RIRUFEIGFuZCBsZWF2ZXMgYml0WzBdIHNldCBpbnN0ZWFkLiBUaGlzIHBh
dGNoIGdldCB0aGlzCj4gZml4ZWQuCj4KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi8yMDIzMDkxMjA3MjUxMC4yNTEwLTEtanN6aGFuZ0BrZXJuZWwub3JnLyBbMV0K
Pgo+IFNpZ25lZC1vZmYtYnk6IFlhbmd5dSBDaGVuIDxjeXlAY3l5c2VsZi5uYW1lPgo+IC0tLQo+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtNjQuaCB8IDIgKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3BndGFibGUtNjQuaAo+IGluZGV4IGI0MjAxN2Q3NjkyNC4uYjk5YmQ2NjEwN2E2IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS02NC5oCj4gKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmgKPiBAQCAtMTM2LDcgKzEzNiw3IEBAIGVudW0g
bmFwb3RfY29udF9vcmRlciB7Cj4gICAqIDEwMDEwIC0gSU8gICBTdHJvbmdseS1vcmRlcmVkLCBO
b24tY2FjaGVhYmxlLCBOb24tYnVmZmVyYWJsZSwgU2hhcmVhYmxlLCBOb24tdHJ1c3RhYmxlCj4g
ICAqLwo+ICAjZGVmaW5lIF9QQUdFX1BNQV9USEVBRCAgICAgICAgICAgICAgICAoKDFVTCA8PCA2
MikgfCAoMVVMIDw8IDYxKSB8ICgxVUwgPDwgNjApKQo+IC0jZGVmaW5lIF9QQUdFX05PQ0FDSEVf
VEhFQUQgICAgKCgxVUwgPCA2MSkgfCAoMVVMIDw8IDYwKSkKPiArI2RlZmluZSBfUEFHRV9OT0NB
Q0hFX1RIRUFEICAgICgoMVVMIDw8IDYxKSB8ICgxVUwgPDwgNjApKQo+ICAjZGVmaW5lIF9QQUdF
X0lPX1RIRUFEICAgICAgICAgKCgxVUwgPDwgNjMpIHwgKDFVTCA8PCA2MCkpCj4gICNkZWZpbmUg
X1BBR0VfTVRNQVNLX1RIRUFEICAgICAoX1BBR0VfUE1BX1RIRUFEIHwgX1BBR0VfSU9fVEhFQUQg
fCAoMVVMIDw8IDU5KSkKPgo+IC0tCj4gMi40My4wCj4KCk9oLCBteSBnZW5pdXMuIFRoYW5rIHlv
dSB2ZXJ5IG11Y2guCgpSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+CgpJ
dCdzIGZvciBidWZmZXJhYmxlIHNpZ25hbCwgc28gdGhhdCBpcyB3aHkgaXQgZG9lcyBub3QgYWZm
ZWN0IHRoZSBoYXJkd2FyZSA6UAoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
