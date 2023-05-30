Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497A6C7EE2E
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 16:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5kEbS6bWG0oTaaLc76oaLlUHyj/wU38bnDj33jFlyQ=; b=x01F6Iax2DlWhK
	/eC1nrnWhXSAnXDx89fTvNJOga3SwANF3RMFDrzUpPUL8+XQSr4K88D6icreddWG4IM5bIRcsbwpz
	1D2BwGQitGGTJTxERntOHO5ErBgk9R4EcrMuIOSRuM5ZSm7K3+SCp4kBCXxcG14mQqZiEfeW/2uZG
	iUtkgjbXVC3zHty/tDV7bCjZHXSJILDF6r88u2neji/a6ePJq2k03swo66H5MrPKcABhxfJMi//2B
	L/FGtkTRdBH4H3SVp444aZHYmoP9jnWIXfLYc+5HnFAlCg4+8xsDo/tP/2Z8WxqTnaJ/FvgWT9M9R
	5MMc2+6lvYoEmBBVs1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q41zo-00EXJw-2i;
	Tue, 30 May 2023 16:14:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q41zl-00EXIR-1i
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 16:14:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B3C5262709
	for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 16:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC929C433A7
	for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 16:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685463288;
	bh=Nw3U0ieXrITWif7BtfrdVhn0c6Tx1Kfx8ZbO3YPKFgY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b42fnM57U5qOqSowirzmLd6k0hEySGvxG9F3ktqRV/BM7R+KoHSKlFzLQkp16R2He
	 Wf6IgD43FlWxcNemOXs8iJY1A+4MfHvqAF9gBUjg35GLIwid2Lh62D8IxAU/D4IE5U
	 jpdV07zBwNUE6nuwmdmzWMO4F8/5GQOAitgM0RE7duuCcnYWZwq7npMJIMqiuHv4ep
	 liBf/N52SEv4S2BEY/QeE9bj/AfNbLTQTc+CsYMAdjRqKNx4XWdxFRAgWyEepUA0Om
	 xz/QBd4AWlenQzjbnMzvalL6k1wxcRadEDAqO4ZsjOnzbDZtviNyO9UqXzmWMHfR+x
	 YyGTP3/my3GVA==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-51475e981f0so7957221a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 09:14:47 -0700 (PDT)
X-Gm-Message-State: AC+VfDxkINvLF9HM1a6HQGfN+spO5Vhptt2MkM3UZBF4QLliTadPFQPO
	70v3y10NB2PW/5VYx2ZioHPXCp60K2e2WdYyn0g=
X-Google-Smtp-Source: ACHHUZ6OhDUvQebUTZpaJ3DceGZodA10IPc1+6QNRR0Yreq3kn60R67Dyn/3cUSFn3edT8OykgcBKVDphNPmd2aDI38=
X-Received: by 2002:aa7:d58d:0:b0:514:9df0:e3f3 with SMTP id
 r13-20020aa7d58d000000b005149df0e3f3mr2273778edq.0.1685463286138; Tue, 30 May
 2023 09:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230529073845.2859178-1-guoren@kernel.org> <20230529-jasmine-amigo-6d01f6852b35@wendy>
 <CAJF2gTRSoZbexqka=_7nf4+dHZW2FGf++BiTMypfTbeoGAbUiA@mail.gmail.com>
 <CAJF2gTTzUfp7xDr8myA+xMcxGNEQ+XLEYMfoR91NShdBAQMu7Q@mail.gmail.com>
 <CABgGipXu7iq-J5v6GVMPrnHiGVLuMxabB0_hPb+o+04T2MAwpw@mail.gmail.com>
 <CAJF2gTR2fAkk1532VWmsWP5DSYN17ib80wa5QwwT=DC0LY9gGw@mail.gmail.com> <20230530-static-smith-96cf543bfda2@spud>
In-Reply-To: <20230530-static-smith-96cf543bfda2@spud>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 31 May 2023 00:14:34 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTD-Qbp1bJ2EZgpBTzRrWtUEy7k644GzYES2qRWY3D3LQ@mail.gmail.com>
Message-ID: <CAJF2gTTD-Qbp1bJ2EZgpBTzRrWtUEy7k644GzYES2qRWY3D3LQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: Fixup modules compile error
To: Conor Dooley <conor@kernel.org>
Cc: Andy Chiu <andy.chiu@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, paul.walmsley@sifive.com, 
	palmer@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_091449_615466_3E5B702E 
X-CRM114-Status: GOOD (  12.71  )
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

T24gV2VkLCBNYXkgMzEsIDIwMjMgYXQgMTI6MDTigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXkgMzAsIDIwMjMgYXQgMTE6Mzc6MzhQTSAr
MDgwMCwgR3VvIFJlbiB3cm90ZToKPiA+IEkganVzdCBmb3VuZCBMaW51eC1uZXh0IGJ1aWxkIGlz
IGJyb2tlbiwgc28gSSBzZW50IHRoZSBwYXRjaC4gSXQgc2VlbXMKPiA+IHlvdSd2ZSBzb2x2ZWQg
dGhhdC4gVGhhdCdzIG9rYXkuCj4KPiBBcmUgeW91IHN1cmUgdGhhdCBsaW51eC1uZXh0IGlzIGJy
b2tlbiBiZWNhdXNlIG9mIHRoaXM/Cj4gVGhpcyBzZXJpZXMgc2hvdWxkIG5vdCBiZSBpbiBsaW51
eC1uZXh0Li4uCkkgbWVhbjoKCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3BhbG1lci9saW51eC5naXQvbG9nLz9oPWZvci1uZXh0CgoKCi0tIApCZXN0IFJl
Z2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
