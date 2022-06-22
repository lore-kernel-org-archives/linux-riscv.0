Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAF0C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jun 2022 01:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XsTM96B80DRDxeRAJijvhThfawMu3+66gqVhrIFAZ4w=; b=0aKebajBGSIdO6
	t5H8BQlP0X34lbks1Aida1ZYofvx8Ttk4yG7INq2EoFXHgUYeOE85vzJY54TkujsfwuFw4GVrCJf6
	bKAQ1V3no+xGAurKmy35lw5atsEs4OM2frCDmAWU5YrOHgspKc/ApsxCDBtqbJu6bKHtfqr3pNSzI
	rpPYoutqQA7O5/ZB+F/10rxrfYJV26PvmweS75x3GSTxU33S8epOx1qe1WQLn7jydrwrPGKJfxAL+
	12RCSQWkspfvg2OPlLFGhNLQI4Ktokxtb2qCpyqXtKyN20a//GWq/EM0IZgXpsuppx4zaddInfkYJ
	gxKh9Ox1GFCM/gRxBz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3pX5-0084AZ-Vr; Wed, 22 Jun 2022 01:51:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3pX3-00848f-PC
	for linux-riscv@lists.infradead.org; Wed, 22 Jun 2022 01:51:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 82CBC61857
	for <linux-riscv@lists.infradead.org>; Wed, 22 Jun 2022 01:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1994C341C7
	for <linux-riscv@lists.infradead.org>; Wed, 22 Jun 2022 01:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655862707;
	bh=yAoKxvq/RDbFoDjWadpyfGoPvsAe+GvtjboXMAJrB8U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WP2uA5+yhzxAiocs6TllYglw5Ney2lvFwuVS5SuF0ppeNQ7msSMo4PXnlYTThFAZO
	 YRGmSuDuMFw6ndaXYOjX8PNgUMYls9HqiZawFwuYtkWg84/SdwXkTbbefygZCYPHNn
	 hKYS3ttp+RikGG5yPSKGkdB3pjlN8kS/8u1Eu8vdOQ0Zyu9tS0sxlBcfkCdn4DLnoS
	 SiXSN91uqHfjT8NG2YxB3aTVlSozwP5oTltY3J9Y1W8CL8B5jwZaZAZf70QVUqcJFR
	 P4A/qi1fV80eWXT2k9g8VWLiHAr+i/epDObiHViCE1nKzp9oca6ru6y6VRVyv/E2sH
	 j+nifdccyjbzQ==
Received: by mail-vs1-f45.google.com with SMTP id i186so15713872vsc.9
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jun 2022 18:51:47 -0700 (PDT)
X-Gm-Message-State: AJIora9nv4DhfOGJ71opKezMSNkK/iJe1b+IWKLritHDDA8uxHduznP3
	dvTHapuG2bz/2rsNtCrV1fUerMBldadknt3qMac=
X-Google-Smtp-Source: AGRyM1utZR//1y9issFD2tF2ldIncQQvR5Nc0+J0YOMi+6mLMJ2YHmHXaBKMVlzbI2nwm0FGLrq3VBDF3kYog1PA9kU=
X-Received: by 2002:a05:6102:f8b:b0:354:57e8:4c1b with SMTP id
 e11-20020a0561020f8b00b0035457e84c1bmr970617vsv.8.1655862706699; Tue, 21 Jun
 2022 18:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220621144920.2945595-1-guoren@kernel.org> <7adc9e19-7ffc-4b11-3e18-6e3a5225638f@redhat.com>
In-Reply-To: <7adc9e19-7ffc-4b11-3e18-6e3a5225638f@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 22 Jun 2022 09:51:35 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT4Q3HLabXPgACOmd-Z58LsD-77ga74pzgUT2scr+ydRA@mail.gmail.com>
Message-ID: <CAJF2gTT4Q3HLabXPgACOmd-Z58LsD-77ga74pzgUT2scr+ydRA@mail.gmail.com>
Subject: Re: [PATCH V6 0/2] riscv: Support qspinlock with generic headers
To: Waiman Long <longman@redhat.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Conor.Dooley@microchip.com, 
	Huacai Chen <chenhuacai@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, hev <r@hev.cc>, 
	Stafford Horne <shorne@gmail.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_185149_916483_A1A26A36 
X-CRM114-Status: GOOD (  14.82  )
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

On Tue, Jun 21, 2022 at 11:08 PM Waiman Long <longman@redhat.com> wrote:
>
> On 6/21/22 10:49, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Enable qspinlock and meet the requirements mentioned in a8ad07e5240c9
> > ("asm-generic: qspinlock: Indicate the use of mixed-size atomics").
> >
> > RISC-V LR/SC pairs could provide a strong/weak forward guarantee that
> > depends on micro-architecture. And RISC-V ISA spec has given out
> > several limitations to let hardware support strict forward guarantee
> > (RISC-V User ISA - 8.3 Eventual Success of Store-Conditional
> > Instructions):
> > We restricted the length of LR/SC loops to fit within 64 contiguous
> > instruction bytes in the base ISA to avoid undue restrictions on
> > instruction cache and TLB size and associativity. Similarly, we
>
> Does the 64 contiguous bytes need to be cacheline aligned?
No, they are instructions, and the IFU & issue units would guarantee
that. The programmer needn't worry about that.

>
> Regards,
> Longman
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
