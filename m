Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7300C636D7
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 04:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nfnt9yDEzCkzDXqqIuRx1oxLTjC2WM4i7XMpcJaY8+Y=; b=tj/p+oxGc3Dl1m
	Yiz3kFrlHSv/lNtnUQaZpVFslIegTX2eqfxeEwopuHd9RPaTIo6aDWroe67j4l1mhLgFzA/JArZ1J
	A0MzIasTJIck5ZklLUAEGPFNhGK/s5VESnVnCgjnpPbFBxx2pJZ9lH21u6nEBWei1UMAFY7hYSUrc
	ksQ7nRnR6lxb6q6KIIdx56egfTXq+YANi62ECcdTE/jGU9pdpbWk3sW0QyDasyi6ZtEOHxaU2IdjX
	AHGZP8mNdO5gLGLVqCQZH9X8q8xfpd26CBLYjC3z5WmMJULpgWW2GdvTKxVU+MbqspqeMz6BkPVmS
	L8yJXIGMtsxIUWxEF1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQos-00D91f-88; Mon, 13 Feb 2023 04:52:02 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQoo-00D90p-Hv
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 04:52:00 +0000
Received: by mail-pf1-x42d.google.com with SMTP id n2so7133014pfo.3
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oq7C8udiwiuM1QeRLy8ZEJLvZIfEEYFRjz7GBfZu0bQ=;
        b=QMhVRjdrCPbJnYtCrdcYMXoB0eRpPbQcgUIRRLpkGARxwTLhnovFayqBODSFq6QhUA
         Jkz7ZRs0x3eipK65IVp6/kBUPjp+7pXJWnZn4PflTzRFovnigq/WqNpqcYbAnH0OTKKl
         Y1cCxSkVL38c+ZDaqpecNKpk4Ja52YgjWWLmccGomLF+oT8myAq7072SlGdKdEv7MA2x
         Sm3mvT0SZywdO5e3p+xceR9qKnj/MfC4pHOQYWbaSN0Hwx4or67TVQP8z90XjKLYLcMf
         xwTeNR0225m+muWQzC8/i16LrtQiomihHCzxi6uYtW78dWZVdnJEuEMeflr90h4h0mii
         R8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oq7C8udiwiuM1QeRLy8ZEJLvZIfEEYFRjz7GBfZu0bQ=;
        b=OYQqJV/FjRwmEGJnzSyQw7xPOKCm+AhN5OlyAq2yfnQWqz9atE5EAuAf/F5vam1jfQ
         +cFpv+bgIcAaGmV7uf2Ev2X3UNHHby9SL65oKKTVcryydZ9nSoDmsoNbzYGJJ1RAB+VZ
         n9rJjU3tcgMrkEnq8Y1ZHd4TkqrLQeUMDJecatzd0G8ZljudZ8zy0Ei4a8vTmi3vYwCB
         6FzCYMAH2bTHhluCKPm6c7Mli1WyF57oyoKHbuqtlwYICY0fCBSERbiUYUf+LSaiLuJC
         Jy/4z9cs+XdAmjKXTqkNmacv68k3sT6ck2jM+EEA6jychCfuwpJyBkdILTQQaFjWlvzc
         wHhQ==
X-Gm-Message-State: AO0yUKVlKCs0FWXtXP9RMCoKjn6gXe2KNYMqYoRDNuYtNksC92cmA7N1
	M3Gyzzny4ud7N9myb+eHf5BirEZjTyVfqCEb
X-Google-Smtp-Source: AK7set9UVe9XBXtZnMsy5uh08YlZ09431p6siV39bLauOyCIvPcH6XKGZV41Wibdh5kV9aFz2s7djw==
X-Received: by 2002:a62:1a8a:0:b0:593:d2ab:fdfb with SMTP id a132-20020a621a8a000000b00593d2abfdfbmr17944729pfa.13.1676263916591;
        Sun, 12 Feb 2023 20:51:56 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id y16-20020aa78050000000b0056283e2bdbdsm6865417pfm.138.2023.02.12.20.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:51:56 -0800 (PST)
Date: Mon, 13 Feb 2023 10:21:47 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 00/24] Add basic ACPI support for RISC-V
Message-ID: <Y+nB43zhZyTevQuH@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <Y+Ppv6kB1iksf+TF@spud>
 <Y+Pu/z7dN87v3udc@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+Pu/z7dN87v3udc@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_205158_642277_8B947342 
X-CRM114-Status: GOOD (  25.46  )
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

Hi Conor,

On Wed, Feb 08, 2023 at 06:50:39PM +0000, Conor Dooley wrote:
> On Wed, Feb 08, 2023 at 06:28:15PM +0000, Conor Dooley wrote:
> > Hey Sunil,
> > 
> > On Mon, Jan 30, 2023 at 11:52:01PM +0530, Sunil V L wrote:
> > > This patch series enables the basic ACPI infrastructure for RISC-V.
> > > Supporting external interrupt controllers is in progress and hence it is
> > > tested using polling based HVC SBI console and RAM disk.
> > > 
> > > The series depends on Anup's IPI improvement series.
> > > https://github.com/avpatel/linux/commits/riscv_ipi_imp_v17
> > 
> > In the future, please provide links to patchsets rather than "random"
> > git trees.
> > 
> > > Jisheng Zhang (1):
> > >   riscv: move sbi_init() earlier before jump_label_init()
> >     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > 
> > What has this patch got to do with your series? Just something that was
> > sitting in your tree?
> > 
> > If you need this, it'd be ideal if you would submit *with* the R-b tags
> > it appears to have had by v6 [1] & add the reason that you need to move
> > it to the commit message.
> > In Jisheng's series that was obvious, but this is a significantly larger
> > series and it is hard to spot your reasoning for it.
> 
> Apologies, I forgot to provide the link!
> https://lore.kernel.org/all/20220821140918.3613-1-jszhang@kernel.org/
> 

First of all, thank you very much for your detailed review!!. Will address
your comments in the next revision of the series I am preparing to send this
week.

This patch from Jisheng is required to enable ACPI for the same reason.
sbi_init() should be called before jump_label_init(). Otherwise, I hit a
panic like below.

[   0.000000] efi: seeding entropy pool
 [   0.000000] sbi_remote_fence_i: Enter for cpu_mask = 0000000000000000
 [   0.000000] Kernel panic - not syncing: __sbi_rfence is called before sbi_init!!!
 [   0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.19.0-rc3-00079-gd3ee951eeea1-dirty #3
 [   0.000000] Call Trace:
 [   0.000000] [<ffffffff80005900>] dump_backtrace+0x1c/0x24
 [   0.000000] [<ffffffff8072a83e>] show_stack+0x2c/0x38
 [   0.000000] [<ffffffff8072fe7c>] dump_stack_lvl+0x40/0x58
 [   0.000000] [<ffffffff8072fea8>] dump_stack+0x14/0x1c
 [   0.000000] [<ffffffff8072ae4a>] panic+0x106/0x2c6
 [   0.000000] [<ffffffff8072a964>] sbi_remote_fence_i+0x32/0x4a
 [   0.000000] [<ffffffff80009c22>] flush_icache_all+0x1a/0x44
 [   0.000000] [<ffffffff8000622a>] patch_text_nosync+0x1e/0x2a
 [   0.000000] [<ffffffff800084da>] arch_jump_label_transform+0x48/0xd0
 [   0.000000] [<ffffffff801013ee>] __jump_label_update+0x82/0xd4
 [   0.000000] [<ffffffff801014bc>] jump_label_update+0x7c/0xca
 [   0.000000] [<ffffffff80101b5c>] static_key_enable_cpuslocked+0x70/0x9c
 [   0.000000] [<ffffffff80101b9e>] static_key_enable+0x16/0x24
 [   0.000000] [<ffffffff80730c16>] crng_set_ready+0x18/0x20
 [   0.000000] [<ffffffff80022f06>] execute_in_process_context+0x3e/0x92
 [   0.000000] [<ffffffff80730dc8>] _credit_init_bits+0x9c/0x140
 [   0.000000] [<ffffffff80827024>] add_bootloader_randomness+0x3e/0x48
 [   0.000000] [<ffffffff8082c434>] efi_config_parse_tables+0x114/0x21c
 [   0.000000] [<ffffffff8082dd18>] efi_init+0x11e/0x22a
 [   0.000000] [<ffffffff80803256>] setup_arch+0xc8/0x5fa
 [   0.000000] [<ffffffff80800716>] start_kernel+0x88/0x74e
 [   0.000000] ---[ end Kernel panic - not syncing: __sbi_rfence is called before sbi_init!!! ]---


Yes, I missed V6 of Jishang. Will update it. I will also use public
patchset linkgs.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
