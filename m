Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAE7C5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 12:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRRDfuIJiKKRF1VUuYcUvUd2Tu5GDVyBT7l4kYlD1Tc=; b=Mt2z2o2GD6Mk4A
	h+sR0gj9qVqtMCRTuMMPU7KXqJ8FNqCRm+51oQ8pcfQl/jaoFu7rl6/XmBqrpsmrnlHmt6weX5dw3
	JIZXOkr5RqmnMakSwayHZi6AfK4HsKrrF0E8rgzVsINt0E/32OY6tQ6GoUyBjiHDKsgXAgeImjcYy
	53TExyN+8ELhe1HtqLE2Dx6ES6KsSa0gbB9euzfRzjC0PoXYXIiC3KZRfhuuLjZAEsyfflyvbm8Xb
	mGOtvnI6n8+H0Nfjxn6lwQNjT5BeWwOGzNG1Ii1SdhqljvsWocU9QzZtgnceeghdifDhG7ULjnrF6
	64AzspNDUjtoj4mbXkKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaJY-00BHQ5-OM; Wed, 11 Jan 2023 12:34:44 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaJW-00BHNr-6G
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 12:34:43 +0000
Received: by mail-wr1-x42a.google.com with SMTP id z5so13816357wrt.6
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 04:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SpPwt02PKZjbpFRMWUXi1xuK322p4bXGFE/NIqe3xZQ=;
        b=WIaDmaUB8fvz+2pilESc1Tb21FX4QM3+mLm3Ambn7JV9JVM5k9dqfQ+u8g4y0fFzLv
         feo3R6dg9cK0q8tP53CHdUkc0XuuX9soO01zUqDdxRIYA+TECKBA7WFHqa0DW+gifCuv
         ubR7UBgiKJeLych307Tixtpn3GmFfCH/c0w9tCbmXlZDWPNkK9ZMw3VzpM8+gRqASPGp
         8nXlkYZfDOfbaUm5s4bP53/b5otbedsUa35e3YxhGqgInaUTYZCvbJr1vU0E5JFtxA9j
         kYX/3Fg2v/GUIYnwM2oVf47JrLUjRzUOnrvtuG0Kei6to4L4dKLdGts7PrkQmHzAzioZ
         kmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SpPwt02PKZjbpFRMWUXi1xuK322p4bXGFE/NIqe3xZQ=;
        b=vC4WMYN+mqC7J2uFhtll+LCtdSmg65Q0SsjTk9smxlGCBSLC/Ke9iMCsEK2bM8Gdfq
         ZcsPgZ47mqwdX1ctnP6+Hs66GJhW5hYnAxdJBh0RiGk5ezxVyrGB1qOsa64dydeOWwsB
         7oUBccT4b5iIacXkdCykyRKFdBoGCs9IdqowkyIFalyiIAOSFSAzbdYK/ZXPx6WC0668
         k5/EEa9PUZoT6mO9b+NU+mlJA3WNdlvJLhatVAUqP7QOq9HPm3Ok+zjgNyEpRz+wDmND
         jEkrXWC8Ay965CMXR9PIMlUGFCrEC3jZ8i1x3smWZTvgfcGRX660aeyHCHYKQBUZeXaJ
         Y3hg==
X-Gm-Message-State: AFqh2kqbqKd1Ts3cOBitGe6uenvG5f8jk0Ou7oaOltzg2txUnzAoE+hw
	oLBbde1H7te82f7JzfwyAXWpRQ==
X-Google-Smtp-Source: AMrXdXu2oiP/8lchcj0WuYXhm3qpVyOvNlIl9wIigLwy1KEtuKKABMqKVgC8K1mSYSCJjr6Cf8tGsQ==
X-Received: by 2002:a5d:4884:0:b0:242:3812:f948 with SMTP id g4-20020a5d4884000000b002423812f948mr45010903wrq.24.1673440478558;
        Wed, 11 Jan 2023 04:34:38 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d6688000000b0029e1aa67fd2sm13515025wru.115.2023.01.11.04.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 04:34:37 -0800 (PST)
Date: Wed, 11 Jan 2023 13:34:36 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, jszhang@kernel.org
Subject: Re: [PATCH v4 4/5] RISC-V: add infrastructure to allow different
 str* implementations
Message-ID: <20230111123436.6qq3syh24prrs7o7@orel>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-5-heiko@sntech.de>
 <20230110093936.nzc3nkrkqkkzxkaq@orel>
 <1994655.QkHrqEjB74@diego>
 <20230110111647.vg4fdclz4hzcuaj3@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230110111647.vg4fdclz4hzcuaj3@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_043442_249567_B5B15EE0 
X-CRM114-Status: GOOD (  23.41  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 10, 2023 at 12:16:47PM +0100, Andrew Jones wrote:
> On Tue, Jan 10, 2023 at 11:46:40AM +0100, Heiko St=FCbner wrote:
> > Hi Andrew,
> > =

> > Am Dienstag, 10. Januar 2023, 10:39:36 CET schrieb Andrew Jones:
> > > On Mon, Jan 09, 2023 at 07:17:54PM +0100, Heiko Stuebner wrote:
> > > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > > =

> > > > Depending on supported extensions on specific RISC-V cores,
> > > > optimized str* functions might make sense.
> > > > =

> > > > This adds basic infrastructure to allow patching the function calls
> > > > via alternatives later on.
> > > > =

> > > > The Linux kernel provides standard implementations for string funct=
ions
> > > > but when architectures want to extend them, they need to provide th=
eir
> > > > own.
> > > =

> > > And the compiler provides builtins. In the previous series it appeared
> > > to be a bad idea to compile the kernel with the compiler's builtins
> > > disabled. How will the optimized string functions which will be based
> > > on this patch be selected?
> > =

> > yep, the consensus seemingly was that the compiler knows best when
> > to use builtins for some cases (which is probably correct), hence the m=
ove
> > away from the inline bases.
> > =

> > So I guess the first decision is the compiler's wether to use a builtin=
 or
> > the kernel string function (same as for mem*) .

Hi Heiko,

Thinking about this some more, I'd still like to understand how/when the
compiler makes this choice. Are compiler flags involved? Or do some
heuristics dictate the choice?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
