Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A5EC77B73
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 00:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1O/1XfeYjj62siiAAanfW353x4JxpS6I9OVGMBFVto=; b=jUCG0GOQGmWLCe
	+qK3OXj2LYJDvk8SHNq8oYCGQrXiyrRnZ2nTZW8x5/L6FMOzMVwQ6Osu1nrl3ubdW/ANSqS0G/pZG
	8p6iSv37+CzgMUiGz66gl+g6qjJ/IHUR/9WmXgXoyxWCt4b+md79NNHDa1yXypQvnXBnzQc3r2uGN
	F+O1G9zvKouJ0dMZO2s8nGOVk/kYyhOFNSPE8N1sJOXvOgLKGylBP/jsFA7bceU9iGwfPvl++w4Dq
	c+oop+CYKxG9s34C/w8GQkFVz2vrKEInymd0cx3n688j7fBOpwt0pcMbxWpI26ppDV6w1xO8LhwOy
	TYdEE8qz5A4sCwx0jntw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pznla-00EXgU-1x;
	Fri, 19 May 2023 00:14:42 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pznlY-00EXfj-1a
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 00:14:41 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-76c791e2d8dso201794939f.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 17:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684455278; x=1687047278;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oPErhkDQ1KrXKdVSH67+TyFJqg0zBYRQSIsMhyp6Xp8=;
        b=GyNWfCWn4Qnut/p6Uxof5m2Hm68molu1vAPWfUBZGoTmgiVHQEQATRVY5iku1wK0//
         IUEl4JQhJ8A4NAVQR4/kYgj3dVdvD+vboyN/fvP67sTlnf4WEgz9Usg96l4bmOWtt1BD
         jIN7dgs6+AKA9m09k5UUHgvZKhKr+EXUc4wIiHiEmzDlgpn/mPtDPBTiVA7bau4p1U6q
         C7jtns0MiIGiInh1U6RbBnUCNtWtkHVQuGEl5DHall6JTIF0tTgoVH7CHDiP/DAUWfmm
         RekhD2B93xCznSkU320tmvwltZDoa3k/CR/uL43GMFSyumUWlD1WnoLtnVbSQwTuG3kF
         HQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684455278; x=1687047278;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oPErhkDQ1KrXKdVSH67+TyFJqg0zBYRQSIsMhyp6Xp8=;
        b=NAstQcV0uLHetqmap5sUUCBAtRC2c6HVvKXi0Pdtyt3/YwKqcqf62qoyq2c4i9liaH
         LxpRgDCUlynvpqo+tg2uyt0YOtksB0Ct2xZnWPhspkuza/JtEaiOsL97eWifHiTVTKyP
         F+Ng4hNyMEZV15pe3xvkhlvmYlix6tvY3VFNLG17aopymRjFm1HfC1iFjRk3nJ9VurlI
         sIxRbwZtH5Z7aeuDwGqEON86tqYA/2b/vAJtdmrJ40PlzGVVYw03/qoJXsxoHK1qlwxO
         Tvbcf3Fw0uNht8rdTFdqkunhvelpMG+gtLJv+S32uwcsqa767AROE3LJqBGKRhkuxL2u
         nwew==
X-Gm-Message-State: AC+VfDzBCXashQICY+o7EdBR122K7LzqWPsC9URQfBxHgYBj4YqHCm5A
	ja0sMTeCTIDy/BjDk82VDTkepQ==
X-Google-Smtp-Source: ACHHUZ65b+K+N7lMkdk80CRK5W5Q/kNy6pdIIJ+ihecbfBJsXSAKnKfg44MotaAJlp9SUoGP3mW66w==
X-Received: by 2002:a05:6602:3311:b0:76c:779c:7ebe with SMTP id b17-20020a056602331100b0076c779c7ebemr75255ioz.14.1684455278089;
        Thu, 18 May 2023 17:14:38 -0700 (PDT)
Received: from localhost (c-98-32-39-159.hsd1.nm.comcast.net. [98.32.39.159])
        by smtp.gmail.com with ESMTPSA id r22-20020a5e9516000000b0076c872823b7sm710613ioj.22.2023.05.18.17.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 17:14:37 -0700 (PDT)
Date: Thu, 18 May 2023 17:14:36 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
cc: guoren@kernel.org, Arnd Bergmann <arnd@arndb.de>, tglx@linutronix.de, 
    peterz@infradead.org, luto@kernel.org, 
    Conor Dooley <conor.dooley@microchip.com>, heiko@sntech.de, 
    jszhang@kernel.org, chenhuacai@kernel.org, apatel@ventanamicro.com, 
    atishp@atishpatra.org, Mark Rutland <mark.rutland@arm.com>, 
    bjorn@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
    Will Deacon <will@kernel.org>, rppt@kernel.org, anup@brainfault.org, 
    shihua@iscas.ac.cn, jiawei@iscas.ac.cn, liweiwei@iscas.ac.cn, 
    luxufan@iscas.ac.cn, chunyu@iscas.ac.cn, tsu.yubo@gmail.com, 
    wefu@redhat.com, wangjunqiang@iscas.ac.cn, kito.cheng@sifive.com, 
    andy.chiu@sifive.com, vincent.chen@sifive.com, greentime.hu@sifive.com, 
    corbet@lwn.net, wuwei2016@iscas.ac.cn, jrtc27@jrtc27.com, 
    linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-riscv@lists.infradead.org, guoren@linux.alibaba.com
Subject: Re: [RFC PATCH 00/22] riscv: s64ilp32: Running 32-bit Linux kernel
 on 64-bit supervisor mode
In-Reply-To: <mhng-24855381-7da8-4c77-bcaf-a3a53c8cb38b@palmer-ri-x1c9>
Message-ID: <668be661-728d-b87f-b827-4345ad07cc61@sifive.com>
References: <mhng-24855381-7da8-4c77-bcaf-a3a53c8cb38b@palmer-ri-x1c9>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_171440_564838_01159429 
X-CRM114-Status: GOOD (  18.81  )
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

On Thu, 18 May 2023, Palmer Dabbelt wrote:

> On Thu, 18 May 2023 06:09:51 PDT (-0700), guoren@kernel.org wrote:
>
> > This patch series adds s64ilp32 support to riscv. The term s64ilp32
> > means smode-xlen=64 and -mabi=ilp32 (ints, longs, and pointers are all
> > 32-bit), i.e., running 32-bit Linux kernel on pure 64-bit supervisor
> > mode. There have been many 64ilp32 abis existing, such as mips-n32 [1],
> > arm-aarch64ilp32 [2], and x86-x32 [3], but they are all about userspace.
> > Thus, this should be the first time running a 32-bit Linux kernel with
> > the 64ilp32 ABI at supervisor mode (If not, correct me).
> 
> Does anyone actually want this?  At a bare minimum we'd need to add it to the
> psABI, which would presumably also be required on the compiler side of things.
> 
> It's not even clear anyone wants rv64/ilp32 in userspace, the kernel seems
> like it'd be even less widely used.

We've certainly talked to folks who are interested in RV64 ILP32 userspace 
with an LP64 kernel.  The motivation is the usual one: to reduce data size 
and therefore (ideally) BOM cost.  I think this work, if it goes forward, 
would need to go hand in hand with the RVIA psABI group.

The RV64 ILP32 kernel and ILP32 userspace approach implemented by this 
patch is intriguing, but I guess for me, the question is whether it's 
worth the extra hassle vs. a pure RV32 kernel & userspace.  


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
