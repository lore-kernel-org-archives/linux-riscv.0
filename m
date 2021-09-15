Return-Path: <SRS0=puBH=OF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A178C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Sep 2021 23:52:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0B9E610FF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Sep 2021 23:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0B9E610FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYQmP7gHAU1JARhFgINQ5zVpx97dle6CaktWuKRqv24=; b=ellEgiwFLChvks
	GA4xG9FqaSPqsJZbBDALr6oW9qduHli/YX021YG92MqdSG5ACjKPx12YCnzkvwyZVdKafDn6ZRhpz
	nDWGT78/W6sVjkBerkgYYhTiKP1MOXD+vQkeQCiQh4jgNQ1o7I5/EV7LIw1yfuwVn+nFXaD/rseNX
	jbJIVdRqZDM207JNmfMqDu8mtOyAZawEZ6nYYEUgvV3j59TY3ZQYKjBVu2hvaJNmKnB72dS4YZL6Z
	QWg/eMqIHtlu4ppBIGdNWNoqbybXYmGaXpfjTaFwZ6vVcslSf6KfxSZSV5I3PqpspYBjToKYbSQQc
	VtC/hctI9RnCNPGNh10A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQehW-00A6Lq-5Z; Wed, 15 Sep 2021 23:52:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQehS-00A6LE-Rr
 for linux-riscv@lists.infradead.org; Wed, 15 Sep 2021 23:52:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 04FB06113E
 for <linux-riscv@lists.infradead.org>; Wed, 15 Sep 2021 23:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631749942;
 bh=dC9oi9O5eCY0bQWAwOWHLh1Y1B3AGrOrpCQG49W3ukU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OHLOiLM/iQEz8VJTlS2ULSJb8g7rgk9yIjXWdyPfe4BNbNIZM445DMtQTGV4KmwGq
 UhVuRKK6OJnFAYvGBnvH87k7NwGEUn22H7BL0fN7l+fMSF1locLcVNa1rcX1aNZo02
 3WdO444J6rJnNgE8xe6wXaijoT8iDogMclJT1j7wkr+8uQVB56zROtFVp0yaCEr5oW
 Hd8hWqmiGzx4+2tPZGjPNsZpNMF8iL2yBELV/tF6R7QYuelFF7hzSZywp2aHrkLa+Y
 km79Na63OLMWpuqpSJLl9tFs14ZrUv0c0yLPhqHAY4yVGS3ALzdubkDEkLA8uYK89i
 xCPVMl+QAmKNQ==
Received: by mail-lf1-f48.google.com with SMTP id i4so11124123lfv.4
 for <linux-riscv@lists.infradead.org>; Wed, 15 Sep 2021 16:52:21 -0700 (PDT)
X-Gm-Message-State: AOAM533dZcl6bzARyES5n/jPJlR9+9WFRYP1lPSjlqpAGLAJu8r1wqYL
 KLjYUO5gON8efgz6AIf4gU8+dfwZ1DIZzEXkITM=
X-Google-Smtp-Source: ABdhPJwqbxx7gFmmGHl/IX/YB8dTX9bdPtDP6/AFDZzBMsrgGF2Huh0g2FQZ6addhbdNk8e4w/HLPxohJrdDcO9oOSs=
X-Received: by 2002:a05:6512:304f:: with SMTP id
 b15mr1897345lfb.462.1631749940374; 
 Wed, 15 Sep 2021 16:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-2-guoren@kernel.org>
 <20210915074557.GA20024@lst.de>
In-Reply-To: <20210915074557.GA20024@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 16 Sep 2021 07:52:09 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ0Nbb7QCFjKdY223eHQjeV3_05Ub3N3LM7hvY38gizsg@mail.gmail.com>
Message-ID: <CAJF2gTQ0Nbb7QCFjKdY223eHQjeV3_05Ub3N3LM7hvY38gizsg@mail.gmail.com>
Subject: Re: [RFC PATCH V4 1/6] riscv: pgtable: Add custom protection_map init
To: Christoph Hellwig <hch@lst.de>
Cc: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, 
 aniket.ponkshe@canonical.com, heinrich.schuchardt@canonical.com, 
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_165222_967096_FA0BBA97 
X-CRM114-Status: GOOD (  18.12  )
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

Hi Christoph,

On Wed, Sep 15, 2021 at 3:46 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Sat, Sep 11, 2021 at 05:21:34PM +0800, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Some RISC-V CPU vendors have defined their own PTE attributes to
> > solve non-coherent DMA bus problems. That makes _P/SXXX definitions
> > contain global variables which could be initialized at the early
> > boot stage before setup_vm. The patch prevents compile errors.
>
> That sounds way to nice for someone who deliberatly ignores the
> specification and should definitively not go into the kernel
> commit log like this.
Okay. In the next version, I will optimize the wording.

>
> > This patch is similar to 316d097c4cd4  (x86/pti: Filter at
> > vma->vm_page_prot population) which give a choice for arch custom
> > implementation.
>
> How?  To me it looks like a bad duplication of such functionality in
> a way that totally breaks abstractions.  architectures really do not
> have any business changing protection_map.
D1's _P/SXXX definintion is different from riscv standard spec to get
non-coherency supported. It sets the highest bits and current spec
must keep zero. So we using a global variable struct in the _P/SXXX
definition to let vendors init their own _P/SXXX values during
bootstrap that is very early stage before setup_vm().


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
