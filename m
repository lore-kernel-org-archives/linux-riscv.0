Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D909C6FD1C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 11:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDJ0crUlHztkvEAtopRLxZPVLeNwNdSEC8qwYluV7AE=; b=qc5PTakJiJAA8o
	V6/Ysx7eP2xcb1+BRFDrd75smjnlWDW1YTsgQNKQNW3aBklY7u02oOu8Oww9THp+cSHCIy1Jgmqsq
	nQD1A7nH2leH9XRLb8co/h5Oh1azWHw99M3+rTaeBpZnRvi3ekP1tSQyHrsnlONSqooBlPgtPikJt
	yqg5o1SFqXw0PX67lHFFuy/gdKNVSO/L6aXzFfBAo5Y6AALsK89cd3Fk1J9ZBPeafu/3zIaQaUc4X
	nxmiUvIu6TjniiUTLheOQE0PxuxKrTKJacHs7BalUkVDvvrjWR6TvYFxVHE9WpBNAc9xrejvi2JQi
	rPj56jbPf/KhCTMGp3Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pffpH-004Guq-2P;
	Fri, 24 Mar 2023 11:43:19 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pffpE-004Gtu-39
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 11:43:18 +0000
Received: by mail-wr1-x435.google.com with SMTP id y14so1499395wrq.4
        for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 04:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679658193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cEeRHO/zUWvbMymxotAYrIHIcsBog8Q80jrMbSXh8GA=;
        b=jtZSsoPSziKeFSqWmKe4UJGQbP8HAsz9FRaV1wjqLkOnMX2Bz2PLVjuVjktfcNUGwN
         fwU4JI0qlVBfYSZhRQ4MQ3gPyLkRZGdkbNVjusrWaMjCVF43pIhKWsDehBtXBIwttP/n
         32zHASDiLjykr08A1+lYeoNOTxpAOoJr3o+9BQKPD1bCt+0jvWgFQUYFv6pMFPp4ARkT
         mqsV8739AmY9NbU8op9dpy7xI9/TU02s06hGEd4hAX0YD25XElzFn9AeQiWYyupNXcGH
         H+oz74SEcLjgaKBupVWzFd3TMO+mekIbPTW/YF4ufYRoWsU91uz5vupyKZiZLrhY0D/0
         4fvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679658193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEeRHO/zUWvbMymxotAYrIHIcsBog8Q80jrMbSXh8GA=;
        b=PyqtkPO+uDkvP21c7mx8ZSOZqM5B9XzDYO4sL8v1YLnoWXUxwvz6l0zkQ9fbm5J8pz
         K6u28YN5sotEQOA8saypH0kkOCFdHCanE6HEcKb1Dvh86oKXHWWMPjTpsBxQ0HZasoqO
         Q5zNf2IJfz/hzeoyjOICoX0uSxHPdjOJsjF5fuKfOoVQv6MIIHNu0AYovI5vGZXNRM8M
         Vt2wiBhcqTRc4WJ9D6L7ZWzP+ibMBrV7uAh7ivOI/a/K5g5Y9pb2HYA4N6MgVIQhN6qx
         op1jm7CG4I8f7EdCVZg7h2uHCjI6wXEvpWcagrrWDeAdSbjSypvtj6LpVsISppI+ad8j
         mN0Q==
X-Gm-Message-State: AAQBX9d71O007Q1EmPErCz1Aq0Cgs/gQBR8BlUHB1E0BajyCIMRFyMk2
	rYwpQPElt/2Nw3fUua6I46rQpg==
X-Google-Smtp-Source: AKy350Z/UCo3kmjL9dhSC1YdmHdx2KJPkpn9W8DAu/g/ULXFouz75vnHb+P2zmaIxhPKxzu5o8zeLQ==
X-Received: by 2002:a5d:6986:0:b0:2cf:ef5b:49d4 with SMTP id g6-20020a5d6986000000b002cfef5b49d4mr1766130wru.48.1679658193019;
        Fri, 24 Mar 2023 04:43:13 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a3-20020adffb83000000b002c561805a4csm18190041wrr.45.2023.03.24.04.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 04:43:12 -0700 (PDT)
Date: Fri, 24 Mar 2023 12:43:11 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: palmer@dabbelt.com, conor@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] RISC-V: Fixes for
 riscv_has_extension[un]likely()'s alternative dependency
Message-ID: <20230324114311.qjz62iofsrhgdlnz@orel>
References: <20230324100538.3514663-1-conor.dooley@microchip.com>
 <20230324113107.djp4ejnlpzn3qzrb@orel>
 <e7a93223-54e4-4c97-b121-5d1be3af0d65@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e7a93223-54e4-4c97-b121-5d1be3af0d65@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_044317_014790_EB14D71B 
X-CRM114-Status: GOOD (  31.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 24, 2023 at 11:37:05AM +0000, Conor Dooley wrote:
> On Fri, Mar 24, 2023 at 12:31:07PM +0100, Andrew Jones wrote:
> > On Fri, Mar 24, 2023 at 10:05:37AM +0000, Conor Dooley wrote:
> > > Here's my attempt at fixing both the use of an FPU on XIP kernels and
> > > the issue that Jason ran into where CONFIG_FPU, which needs the
> > > alternatives frame work for has_fpu() checks, could be enabled without
> > > the alternatives actually being present.
> > > 
> > > For the former, a "slow" fallback that does not use alternatives is
> > > added to riscv_has_extension_[un]likely() that can be used with XIP.
> > > Obviously, we want to make use of Jisheng's alternatives based approach
> > > where possible, so any users of riscv_has_extension_[un]likely() will
> > > want to make sure that they select RISCV_ALTERNATIVE.
> > > If they don't however, they'll hit the fallback path which (should,
> > > sparing a silly mistake from me!) behave in the same way, thus
> > > succeeding silently. Sounds like a
> > > 
> > > To prevent "depends on !XIP_KERNEL; select RISCV_ALTERNATIVE" spreading
> > > like the plague through the various places that want to check for the
> > > presence of extensions, and sidestep the potential silent "success"
> > > mentioned above, all users RISCV_ALTERNATIVE are converted from selects
> > > to dependencies, with the option being selected for all !XIP_KERNEL
> > > builds.
> > > 
> > > I know that the VDSO was a key place that Jisheng wanted to use the new
> > > helper rather than static branches, and I think the fallback path
> > > should not cause issues there.
> > > 
> > > See the thread at [1] for the prior discussion.
> > > 
> > > Cheers,
> > > Conor.
> > > 
> > > 1 - https://lore.kernel.org/linux-riscv/20230128172856.3814-1-jszhang@kernel.org/T/#m21390d570997145d31dd8bb95002fd61f99c6573
> > > 
> > > CC: Paul Walmsley <paul.walmsley@sifive.com>
> > > CC: Palmer Dabbelt <palmer@dabbelt.com>
> > > CC: Conor Dooley <conor.dooley@microchip.com>
> > > CC: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > CC: Andrew Jones <ajones@ventanamicro.com>
> > > CC: Anup Patel <apatel@ventanamicro.com>
> > > CC: Jisheng Zhang <jszhang@kernel.org>
> > > CC: Andrew Jones <ajones@ventanamicro.com>
> > > CC: Jason A. Donenfeld <Jason@zx2c4.com>
> > > CC: linux-riscv@lists.infradead.org
> > > CC: linux-kernel@vger.kernel.org
> > > 
> > > Conor Dooley (2):
> > >   RISC-V: add non-alternative fallback for
> > >     riscv_has_extension_[un]likely()
> > >   RISC-V: always select RISCV_ALTERNATIVE for non-xip kernels
> > > 
> > >  arch/riscv/Kconfig             | 12 ++++----
> > >  arch/riscv/Kconfig.erratas     |  6 ++--
> > >  arch/riscv/include/asm/hwcap.h | 50 ++++++++++++++++++++--------------
> > >  3 files changed, 38 insertions(+), 30 deletions(-)
> > > 
> > > -- 
> > > 2.39.2
> > >
> > 
> > LGTM, but if it was based on for-next then it could also immediately be
> > applied to zicboz. For the series,
> 
> Hmm, I did it on top of fixes since this needs to go into v6.3.

Ah, sure.

> Perhaps I can create a standalone patch for Zicboz and Palmer could merge
> these two into both fixes & for-next, with the standalone applied on
> top?

Sounds good.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
