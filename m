Return-Path: <SRS0=S+R5=LD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB231C48BCF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 11:38:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97A2160FD8
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 11:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97A2160FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A4LY+6yD2cECWIc+fgCKRRMuXd2lnriiGYW/T7LSdzE=; b=MP+OkJTSbn5jHW
	ET9Tbd500ybU6WOzc0zBjz4E+HoiFTC1ShIpPXdhCcMn5mNo7GtklQywerMXn6GyIhBlhpm3dEG2f
	k5RoF/6+lduoGz3PUEqbjAWgU8EVnEWwKCIOSjNb4EQWCknPMOqG91ZWK6AsQZDDCBorPtVB6PTrT
	yFWeYI2yQMRjZKGe8d9y3R/8A6jiWs4amzArzzryasG76p06hf8cb0Z2r7bplxu3B+6NY5ksCDcx+
	4NFSWxMBVU5a+KsTX66myWbIYz3AjIr4snb1qYjDE87jp8NbVG3BeD1WE/GPOGMFMk7XOttAQ/wpH
	HyBKky/7lKkgFFaCY0Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqwXQ-00DNWr-J0; Wed, 09 Jun 2021 11:38:24 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqwRm-00DLax-No; Wed, 09 Jun 2021 11:32:36 +0000
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MfHQp-1lP3Tn0PLX-00gqrk; Wed, 09 Jun 2021 13:32:32 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so3951768wmq.5; 
 Wed, 09 Jun 2021 04:32:31 -0700 (PDT)
X-Gm-Message-State: AOAM530nmhcbkpwBWCNm9iLrncbU/89Roqof/3FJkEGFhyz+BrbzhEZ5
 HZ/i6tdmUf3RfGY05687CkvgJ7M64J14nSR9QRs=
X-Google-Smtp-Source: ABdhPJzoAPnjJWGlDyxsxVrxhheEMZ1P753dKM++est77A1JSiUJC5TRRvOf+sTRALv47GHRkLWv+YzLbHb9Ukp7IwY=
X-Received: by 2002:a1c:7d15:: with SMTP id y21mr9135927wmc.120.1623238351528; 
 Wed, 09 Jun 2021 04:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210604064916.26580-1-rppt@kernel.org>
In-Reply-To: <20210604064916.26580-1-rppt@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 9 Jun 2021 13:30:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2tZDJDqgr9-1vJrnbDhd_36eKq8LMEznDkU7rvuAnAag@mail.gmail.com>
Message-ID: <CAK8P3a2tZDJDqgr9-1vJrnbDhd_36eKq8LMEznDkU7rvuAnAag@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Remove DISCINTIGMEM memory model
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jonathan Corbet <corbet@lwn.net>, 
 Matt Turner <mattst88@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>, 
 Richard Henderson <rth@twiddle.net>, Vineet Gupta <vgupta@synopsys.com>,
 kexec@lists.infradead.org, 
 alpha <linux-alpha@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-ia64@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 sparclinux <sparclinux@vger.kernel.org>
X-Provags-ID: V03:K1:BiXdXsaXoI2H8EksB/FOqnTT0VgWh9JtB8Qo9vQNfmLTDlgceCe
 uqI4JIb6cvO3MzSqrW3nw4fR3DrzboX44GnQEk64/zfFUv0YC/Ty5erHu22+0rKG15iTqGe
 bzYGtGsLesfv0tIiTgJO3M9fy/TlG9fBNmaVgn1dMquu5K80DSOZ71RAyEoX0/4aqREQdcn
 STMOD+f50fyBGhJgobN9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EnhFSXpwAq0=:f88BY0qROfTHG+qomtoo77
 c6CpcSbZju6Bu/hf1mh2sVHyb7iegKt2ELMfljl1+Y9que7uJXUpRcF4dgLXThfK3KC3+FCPI
 +Js6zlcgye95h3OHaptMrdFpUd5OO73XRTDtdsIich7LN8m088LFK0SyMea2b9HB8qVUTPYvu
 X8DhHomt6QJqDl8xuFeMKPYkRbf95WBNC1uJ10Z+Le+LHyFGy0ajTjNTtjWKajiMpg122CCo5
 NdSDUk2jfFSbN5axcrB2nwJmN6BkbhkB/29zSb/vyw/NL4+2pyFtLSAPLvbd2LrMv9kQHD4qE
 HXrn0kawOWrwy8ahix9pRFr0iscT3MDfW6dyBR7jlscmMcGHEyX357IO6sZ23w00tX/ffkfJQ
 stuPAWcyaFxcMsOcl/7NTYsH1Oppg8Y/pnHfID99K16S1yPRsnZ+7qOrrtcGoRnSkw0N3pr9P
 2HDA+DIl+MGEojHGkYdGBvst11Q3GcoIrtOBS2tmklsZV5ctAuSLrddidq6qzKGZ9dD6KK1M2
 is2O9TZtHx+JTaHDZZjlFNhf8D4JKjZuG2r0a0oVfObtDVdOLdKlguT0hGz4yjcP0Oq42HivV
 fL2MVDGjQmfBPRnqkmitG22O3n/ugGxnchCt/OfzmV2DuN96oKcKgIXHdYRehGmQPI60G5JXD
 XUpE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_043235_110691_538780B2 
X-CRM114-Status: GOOD (  18.45  )
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

On Fri, Jun 4, 2021 at 8:49 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> Hi,
>
> SPARSEMEM memory model was supposed to entirely replace DISCONTIGMEM a
> (long) while ago. The last architectures that used DISCONTIGMEM were
> updated to use other memory models in v5.11 and it is about the time to
> entirely remove DISCONTIGMEM from the kernel.
>
> This set removes DISCONTIGMEM from alpha, arc and m68k, simplifies memory
> model selection in mm/Kconfig and replaces usage of redundant
> CONFIG_NEED_MULTIPLE_NODES and CONFIG_FLAT_NODE_MEM_MAP with CONFIG_NUMA
> and CONFIG_FLATMEM respectively.
>
> I've also removed NUMA support on alpha that was BROKEN for more than 15
> years.
>
> There were also minor updates all over arch/ to remove mentions of
> DISCONTIGMEM in comments and #ifdefs.

Hi Mike and Andrew,

It looks like everyone is happy with this version so far. How should we merge it
for linux-next? I'm happy to take it through the asm-generic tree, but linux-mm
would fit at least as well. In case we go for linux-mm, feel free to add

Acked-by: Arnd Bergmann <arnd@arndb.de>

for the whole series.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
