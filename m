Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38160EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 15:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4yaV/1d2Gas36PB9e67o5E2LrewW5/Vegb4VZFXGR1s=; b=xefk+aKduQQTph
	M+sez54mPG0XiMyHw5RaLIGQj14zQZndo5spT8hCKns5lMDTEO1NUXHu/F/BG3utQvk4YDXTU0Goq
	4liqAtDHq5Ex0d4WCF9SNVJpssFPuvegsa+yMBpF67+DOjegzjnaWP3PmqJKFOUnO5EVDfis+KI9N
	M29n5OFdtIqaIbU5r9no5fofWV/5E8oUZ4el77Tvnj+/qMzvf806dLDuq3oxtpMgM3EyB8vzwZY+P
	IS6M6HvqZ9ItxTOS8UcB+bUxSU3lFn6P3iw7spSlI1J+eslZwxMeQJHtf8YUnfZNqIvVwecaY9lMg
	N/e80qZ+2SCgW3Z7Izyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoO9-00AXaN-2s;
	Mon, 26 Jun 2023 15:44:25 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoO7-00AXYu-00
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 15:44:24 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-991ef0b464cso94048966b.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 08:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687794260; x=1690386260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YnGKBUnRl+54y+0sQxUUlidbsYRaM5LpOGTqtDz4nVQ=;
        b=M9Tsn1Tzu+mNEA7nnAsQvg1Z5/LByzdzlMl+RHI7ziSvtJYcASi+ZIUPA7nvKXKkGH
         FIjN2xZvgNpkBU+0ZO8LO7y8pkIx3Yw8fGBt5WsNZUdHaA8HcLZb5n5z75C6LpwLfFjE
         B2vM7feLwgFywkB8bkAdJ0gkOmTj2340k4jZbwzaECx4KVPOK+ZgAJpCcc7BHFVlgLk6
         WsZjFwFrLAN5YkAFYOwn/1A65rRXLkfNBubWeBrO/zqtbkd8tYAbwpqs7Ix4VOE9kyg+
         wjWzCNfopV0iZKN2ERVAp/aAr7pyDUr210MlLfHTPqtIylLYimoOOVyMjNDrXe1rLwY6
         KHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687794260; x=1690386260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnGKBUnRl+54y+0sQxUUlidbsYRaM5LpOGTqtDz4nVQ=;
        b=JYsPMkU7exU6ILWflgxi7PAwyg1TgVPxyRTEP/tqH1JiYgY91XKyYXJwvX56lt+t2F
         aAKFSOgspUzd1hAn2G9I1ddIMGoZjFZACeRUAof7idxeLax37WSGnvHzDdhexollgmKi
         WDnzsr3VEahqyQ1VgWXCHmYOts3Qcds7unCXLezAlkvuQY4GdtHdTSVVQRNkUZtt+tl4
         PjjTdQ1/cfc6YMij8bU+zGHUvIVhBOEXBC1IztL7j+MBvyrQyQ6Me5Abj2SKM2k97o9T
         /NwjCp4/Ren3iWYEGrSFde/8yZE98yXgnziZMcmZZ71fULwlaoKbTRkW7OxMe97IKQFg
         LPPQ==
X-Gm-Message-State: AC+VfDzFHv/NIztGip3KBFHn5vF+l5FADTkCW1LRBPIj7NUOxApzBBXM
	gvMAYNw9qYe5PGf8rVteTN+KBT3rK0Fbgfx/Ulc=
X-Google-Smtp-Source: ACHHUZ7m80psrFn/+MZPNhekKTjOon7CjlWS/Mw7tUoEfScBbDLcEaFAESaC9Xf5szD4tRWaGLfGjw==
X-Received: by 2002:a17:906:ee8c:b0:988:8efc:54fa with SMTP id wt12-20020a170906ee8c00b009888efc54famr17250712ejb.37.1687794260001;
        Mon, 26 Jun 2023 08:44:20 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id pj4-20020a170906d78400b009885a03467csm3388573ejb.31.2023.06.26.08.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 08:44:19 -0700 (PDT)
Date: Mon, 26 Jun 2023 17:44:18 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v1 3/9] RISC-V: shunt isa_ext_arr to cpufeature.c
Message-ID: <20230626-2b8f42ace039368c8e917393@orel>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-endowment-crave-d72f9423c5b3@wendy>
 <20230626-79b06f642aa2996098c9353d@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626-79b06f642aa2996098c9353d@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_084423_044197_552CD2BD 
X-CRM114-Status: GOOD (  11.71  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 26, 2023 at 05:29:04PM +0200, Andrew Jones wrote:
> On Mon, Jun 26, 2023 at 12:19:41PM +0100, Conor Dooley wrote:
...
> > +const struct riscv_isa_ext_data riscv_isa_ext[] = {
> > +	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> > +	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
> > +	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
> > +	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> > +	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
> > +	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> > +	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
> > +	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
> > +	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> > +	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
> > +	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> > +	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> > +	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> > +	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> > +	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> > +	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> > +	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> > +	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> 
> I think we can either drop this null entry or drop the count variable
> below. My preference would be to drop the count variable, and always
> loop to the null.

Eh, never mind, the entry isn't null, it's "". Why do we have that entry
though? I guess it can be dropped?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
