Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A1EC25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 09:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YaoPn/PzBlmSMYn+oZDTwknVgwSqCWS3P/65I2NDsW4=; b=p3++81mohPrGd3
	v7npeCxrLS4AfdLgQ59yOpOnKS6gMON9Uw6GjvnkNyaNbDbN56VSASk38HSKtRiiTe7DRDciRdEmA
	fODAUnEFVnc7W7axzacTIZpGY6Ep1jSA/vh58AE5HojTX6p7DCoPrym7NSDwutDgvfaWxZMPXGWuo
	3jJetCZ0TvBEj0KyADx1aY/toqeGOXVWeA8zUVCDgO41N5bBsn06kmdRnL3beht6v9FTi9Xc7YeQt
	Si6MTJ5O6l6C8RfFa5AdFHM0cukqAF2ECAZFb0wnTxbmGY+h8SRt04CKbfGVRTYkx7+FqZFwsGj7z
	6KgWSZipMyJGlIEWX+AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCc1x-00000006oS6-3E0g;
	Thu, 30 May 2024 09:25:05 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCc1u-00000006oPF-36ZK
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 09:25:04 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-52b4fcbf078so832414e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 02:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717061099; x=1717665899; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FGWcoQz6bp5W8A5c5FEsjIeyZdnGRxg5AvvBbn2QbK0=;
        b=jtZ2HGVIAcV1d/+kUC4+n4Cz+9hpEs5p6N0VADyfPPY+45okSXUXaeCNTsJXfMz7j/
         XAGOWHgBCOgcKZugT5aHPGz3b4zMR5bMxGQwXdVW3d2x11EwTQXGOwniBLX1dDI8UZH8
         fTnIjnyA69Iv0lt04jLX6g5vMzkMH21rZq/CyJ7hX8lwEarEYruRjgSS0PVHczOsygfo
         PWhaqdqKeudkMkQr7Xc53VIi7zd4TkcN93u10EBMe9SxcKB3vjVtzqZzXNChzqm2Uiz6
         qYPOcaouAbdZIFVd0APJHkMxVdc3x2Hqq3C4FRy6WNdbMxwZ4LMe2/nJQE8dNtiUHYgh
         5O5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717061099; x=1717665899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGWcoQz6bp5W8A5c5FEsjIeyZdnGRxg5AvvBbn2QbK0=;
        b=wuackCf1aU0H3pHnpgMVFdAR6NMiSdzT2vAP9Lkzxaz1iWnQkMXKP/fxRDBFTPiuoJ
         Z4Kj99dssxymgmAyVRqf3h6ZLaoC3BanF5st/WCiYhCyBNQh8Eqh5cdvVkniTOSExQ3w
         4ie79MaP923HDk21mYK1AEsG6KYDCv17d/dn441su+7H7k7+tkM+gSA+2KeQSm2Xewbs
         BsGY7/jK8VO80Exx1BSaRG80hFhumb4Wxz/CBmX+gv4BBp4djlviBvGYdTjpcvOR7dDM
         RW3C2TGiSKLS9Jp84R395I23Pe6p5+txl/xddDX6h+KHZFKmMCn8ycwNLA5cjlsAvWM+
         ct8A==
X-Forwarded-Encrypted: i=1; AJvYcCU/niYbz1SCMwvvVKK6hLhqXdU7B3AAjlJ7ZCL6rqEJ90G1KinDoFw30BOQObg7PEAxjfhVK7Lo1twWXHYe1FbcHQJSLlsfgNDB7rZC6a6O
X-Gm-Message-State: AOJu0Yw4rxc0bSmiZ1Qwv0cxUPDX7/hS3379Cn9PbS/yGV5LqGdP46pI
	p5RfmSLoeK8dE1K+FsGNtqdFSMwUEVByfpme1IJUQo/mwGXcKIWPqeBwRX+et2A=
X-Google-Smtp-Source: AGHT+IELCUAFliwbdnLlRoUjMofrcBrzQ/gONVqlkzwZRu4BVC/i56ENc2IuIJrAiK/uaL4mr6II2g==
X-Received: by 2002:ac2:522b:0:b0:52a:f4f5:5cfa with SMTP id 2adb3069b0e04-52b7d480912mr782775e87.58.1717061098823;
        Thu, 30 May 2024 02:24:58 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a08ab81sm16840093f8f.39.2024.05.30.02.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 02:24:58 -0700 (PDT)
Date: Thu, 30 May 2024 11:24:57 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, cleger@rivosinc.com, 
	Jinyu Tang <tjytimi@163.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Samuel Ortiz <sameo@rivosinc.com>, Evan Green <evan@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Charlie Jenkins <charlie@rivosinc.com>, 
	Leonardo Bras <leobras@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4 1/5] RISC-V: Detect and Enable Svadu Extension
 Support
Message-ID: <20240530-de1fde9735e6648dc34654f3@orel>
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
 <20240524103307.2684-2-yongxuan.wang@sifive.com>
 <20240527-41b376a2bfedb3b9cf7e9c7b@orel>
 <ec110587-d557-439b-ae50-f3472535ef3a@ghiti.fr>
 <20240530-3e5538b8e4dea932e2d3edc4@orel>
 <3b76c46f-c502-4245-ae58-be3bd3f8a41f@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b76c46f-c502-4245-ae58-be3bd3f8a41f@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_022502_837312_9E290F36 
X-CRM114-Status: GOOD (  40.59  )
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

On Thu, May 30, 2024 at 11:01:20AM GMT, Alexandre Ghiti wrote:
> Hi Andrew,
> 
> On 30/05/2024 10:47, Andrew Jones wrote:
> > On Thu, May 30, 2024 at 10:19:12AM GMT, Alexandre Ghiti wrote:
> > > Hi Yong-Xuan,
> > > 
> > > On 27/05/2024 18:25, Andrew Jones wrote:
> > > > On Fri, May 24, 2024 at 06:33:01PM GMT, Yong-Xuan Wang wrote:
> > > > > Svadu is a RISC-V extension for hardware updating of PTE A/D bits.
> > > > > 
> > > > > In this patch we detect Svadu extension support from DTB and enable it
> > > > > with SBI FWFT extension. Also we add arch_has_hw_pte_young() to enable
> > > > > optimization in MGLRU and __wp_page_copy_user() if Svadu extension is
> > > > > available.
> > > 
> > > So we talked about this yesterday during the linux-riscv patchwork meeting.
> > > We came to the conclusion that we should not wait for the SBI FWFT extension
> > > to enable Svadu but instead, it should be enabled by default by openSBI if
> > > the extension is present in the device tree. This is because we did not find
> > > any backward compatibility issues, meaning that enabling Svadu should not
> > > break any S-mode software.
> > Unfortunately I joined yesterday's patchwork call late and missed this
> > discussion. I'm still not sure how we avoid concerns with S-mode software
> > expecting exceptions by purposely not setting A/D bits, but then not
> > getting those exceptions.
> 
> 
> Most other architectures implement hardware A/D updates, so I don't see
> what's specific in riscv. In addition, if an OS really needs the exceptions,
> it can always play with the page table permissions to achieve such
> behaviour.

Hmm, yeah we're probably pretty safe since sorting this out is just one of
many things an OS will have to learn to manage when getting ported. Also,
handling both svade and svadu at boot is trivial since the OS simply needs
to set the A/D bits when creating the PTEs or have exception handlers
which do nothing but set the bits ready just in case.

> 
> 
> > 
> > > This is what you did in your previous versions of
> > > this patchset so the changes should be easy. This behaviour must be added to
> > > the dtbinding description of the Svadu extension.
> > > 
> > > Another thing that we discussed yesterday. There exist 2 schemes to manage
> > > the A/D bits updates, Svade and Svadu. If a platform supports both
> > > extensions and both are present in the device tree, it is M-mode firmware's
> > > responsibility to provide a "sane" device tree to the S-mode software,
> > > meaning the device tree can not contain both extensions. And because on such
> > > platforms, Svadu is more performant than Svade, Svadu should be enabled by
> > > the M-mode firmware and only Svadu should be present in the device tree.
> > I'm not sure firmware will be able to choose svadu when it's available.
> > For example, platforms which want to conform to the upcoming "Server
> > Platform" specification must also conform to the RVA23 profile, which
> > mandates Svade and lists Svadu as an optional extension. This implies to
> > me that S-mode should be boot with both svade and svadu in the DT and with
> > svade being the active one. Then, S-mode can choose to request switching
> > to svadu with FWFT.
> 
> 
> The problem is that FWFT is not there and won't be there for ~1y (according
> to Anup). So in the meantime, we prevent all uarchs that support Svadu to
> take advantage of this.

I think we should have documented behaviors for all four possibilities

 1. Neither svade nor svadu in DT -- current behavior
 2. Only svade in DT -- current behavior
 3. Only svadu in DT -- expect hardware A/D updating
 4. Both svade and svadu in DT -- current behavior, but, if we have FWFT,
    then use it to switch to svadu. If we don't have FWFT, then, oh well...

Platforms/firmwares that aren't concerned with the profiles can choose (3)
and Linux is fine. Those that do want to conform to the profile will
choose (4) but Linux won't get the benefit of svadu until it also gets
FWFT.

IOW, I think your proposal is fine except for wanting to document in the
DT bindings that only svade or svadu may be provided, since I think we'll
want both to be allowed eventually.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
