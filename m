Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709CACA1009
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Sep 2023 20:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uuIJTqf6+y/N5pqdtqyCwernGxnpmmqEAcTukQfk4qs=; b=tCp7dCOzLyyB2y
	AxvdUAvwKqOsvqIdjqZUuCYIkPbqiFrTiHdWxWlV75Ob0KT2+9u1Zg+nrieROnZrYSEvbEUkEHjLu
	JmwGQQ7Hcn1UEFw8rNUghwX4QmxKTb8GX8qmdq0B7tbrW5A1jU8r8UomZ/7c52QSkvUOBlbI5+mop
	JN0EkMnGW3+gkLqV1iCauEhn7/IhTV49ZLBzS9jv2I7UtkFFz6xQrlX2Tq0AUHg0Qd3hwJozkSbWz
	G5rvMvYQZZ9gYVM+vHyrT/3ssHyzB7HgUw5sOETBmWIyhKWAJD2DipHJPb3ODH4RscKLNxWLCUZGY
	jgGstMyetmHLlUGEn/hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdcVV-006fpu-0d;
	Tue, 05 Sep 2023 20:18:41 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdcVR-006fpU-0c
	for linux-riscv@lists.infradead.org;
	Tue, 05 Sep 2023 20:18:38 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31de47996c8so2588142f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Sep 2023 13:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693945113; x=1694549913; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DXAlB7EBesC8ic5eKgIer5ZOojpmplWM1vNtKCyzMps=;
        b=DxvY5Loi/zKZjKXXRBdp0A4qtOo0VFwu86bRJ+MR8314DIId3LbZsMqeWDfwksacmt
         Iiqh74pY1C1dLsS3ol03Hp6xrle291gjGPbxOSZ6znmsQyEWCqG3ziyEjiE4HfuPo7t2
         QqvSdJ26zwlFhiGapWnKbY+hOlmJsppyp1/OwrzAY5kr2ZHfnSZ6Vg5zyAF2aAz8Ts+N
         1mT+KIF00fb6bbv+Hfuf02HHsiy/dcNZ2hZYV0hnIaPwE5Yz35uM+CHpgAnFvvHfrv69
         dYid8hS/88IyvZDd29sZAgQL4+4Vrfie2Dp7LlgU5GnUyDvNoXXFEFDYce8AgpM2zLWn
         jePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693945113; x=1694549913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXAlB7EBesC8ic5eKgIer5ZOojpmplWM1vNtKCyzMps=;
        b=UhDc9NE4BJAH1f/ovA7JBVed222fqAirpI9Onx2WwtQXrZrydtQAFKAsif9FRD7h/Y
         aWRAjZhtli6QeRTA8ge1wSUbRsNDdb7NPlsOwACCWeaUoCxmnxNbD+qPKrjlAbI517UO
         Y/9Pft1KyqpaNAeqhsLdhZReBRhh2IO2cFmWuOrDarQ/VjAraf9sbohr1HThePY93KVG
         cjpfw7HCYSKYyjjF5BE2JXEa1+uqa0av0BHtjYv5m+T2NYM+z6BEXZf8f3zRfTmibgP0
         ev7fNTvnpebPp5cIHY3zoOZGx1eioSfra2iqGpjUBVwf79W4/7ihlfqsHw7+VgV1mz1S
         RiiQ==
X-Gm-Message-State: AOJu0YxVQ+JDIRFQYW17SRrcjlBlEwASzZ8tAEv58wSha0DNybftoq7+
	gMmjhrkJnrNtQXabGbTdSNbEfA==
X-Google-Smtp-Source: AGHT+IEceGVNMwn8VWkrev+XWDKGFiQ48d2FmqhRYTkWD6wUcSMYalN9g9ouk+MGMrXIGZg6FWfPdw==
X-Received: by 2002:a5d:6b04:0:b0:31a:d4e4:4f63 with SMTP id v4-20020a5d6b04000000b0031ad4e44f63mr751112wrw.18.1693945113452;
        Tue, 05 Sep 2023 13:18:33 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id d9-20020a5d4f89000000b0031c5b380291sm18421408wru.110.2023.09.05.13.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 13:18:32 -0700 (PDT)
Date: Tue, 5 Sep 2023 22:18:31 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: "Wang, Xiao W" <xiao.w.wang@intel.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "evan@rivosinc.com" <evan@rivosinc.com>, 
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>, "apatel@ventanamicro.com" <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 6/6] RISC-V: selftests: Add CBO tests
Message-ID: <20230905-b49ac6791300beb8845ba196@orel>
References: <20230904170220.167816-8-ajones@ventanamicro.com>
 <20230904170220.167816-14-ajones@ventanamicro.com>
 <DM8PR11MB5751158F177162EA71B6164AB8E8A@DM8PR11MB5751.namprd11.prod.outlook.com>
 <20230905-1ca92f76cd928ff3f6e51c71@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230905-1ca92f76cd928ff3f6e51c71@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_131837_232027_6FEAB2B2 
X-CRM114-Status: GOOD (  18.59  )
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

On Tue, Sep 05, 2023 at 06:10:25PM +0200, Andrew Jones wrote:
> On Tue, Sep 05, 2023 at 02:36:44PM +0000, Wang, Xiao W wrote:
> > Hi,
> > 
> > > -----Original Message-----
> > > From: linux-riscv <linux-riscv-bounces@lists.infradead.org> On Behalf Of
> > > Andrew Jones
...
> > > +#define MK_CBO(fn) ((fn) << 20 | 10 << 15 | 2 << 12 | 0 << 7 | 15)
> > > +
> > > +static char mem[4096] __aligned(4096) = { [0 ... 4095] = 0xa5 };
> > > +
> > > +static bool illegal_insn;
> > > +
> > > +static void sigill_handler(int sig, siginfo_t *info, void *context)
> > > +{
> > > +	unsigned long *regs = (unsigned long *)&((ucontext_t *)context)-
> > > >uc_mcontext;
> > > +	uint32_t insn = *(uint32_t *)regs[0];
> > > +
> > > +	assert(insn == MK_CBO(regs[11]));
> > 
> > 
> > The byte order of insn should always be little endian, while the CPU may be a big-endian one, then the check might fail.
> > Maybe we can use __le32_to_cpu(insn) to convert it before the check.
> 
> Sounds good (minus the leading __, since we don't have __le32_to_cpu() in
> tools).
>

Actually, don't I also need to ensure byte order when creating the
instruction in cbo_insn() with ".4byte %2" where %2 is insn which
is MK_CBO(fn)? I presume so, which means the proper fix would be
to add a cpu_to_le32() to MK_CBO(), i.e.

 #define MK_CBO(fn) cpu_to_le32((fn) << 20 | 10 << 15 | 2 << 12 | 0 << 7 | 15)

Unless somebody tells me otherwise, then I'll do that for v4.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
