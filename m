Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D687FC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 06:45:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5992861042
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 06:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5992861042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eQp0tcwykcU3q+oP+4tXm8K+beGbGAXVp8FK+2L9FBE=; b=Cs14tXuU1hBsv2gGaXgPH98GH
	iTAx4W9G+IyYBKya+wENQmsaosCWe4ehUYA6QaKf3Cl/E1YVLhrLpMdhDpUvKdKUEH5QbWXyziPR7
	CieDs0DnP1HZEbEnJvE6gUkXHk+ipVeY0VR/380Aya+rO++Pz+SgqDo4pdCofCsD2ZP/nFyeU8/zq
	WgMPJfPmqMPKopafZSlG1IFTfJYMnkUNxZiY8q3p1EdH8XNQ+fsLHNCUu2ws+Q8U9Rv5hzg4BPCqD
	NLvOS0rqQiU4uGXZ827jxDXSwpDSqKsjZwEV/ksYCseTaFIcgZ8q6M5X91HJhB3hHZUqVszG5A4Jt
	/aQd+WwWg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljFx6-00326P-1r; Wed, 19 May 2021 06:45:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljFwg-00322A-Dd
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 06:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=crJApTk0fR8CS3cRDbB3V67gscNvYMiJEHMFrBZfWUo=; b=XNI5r3jvtB1v/BxUxvh8W5ny+X
 1ulUpM6JbjSGt7YKjzauPciUyPFfk9Gk12MqZzuh7odoHZnwxnOGK97ZJgoPZkdQCl0h7Kk8A1dt6
 JtmL0kGVWXucYsCFpUHAAbp+n710Qxq5JDapzyp7F8Pj7kCGoJd6OVzyEh31Mrg2lcM17WyKtU934
 IRRc8mGDBmF18dV5FKBBTFWBcH0e8U9fSZxTRjLLugIiV+vSIm+HoC0qyFEn6gwJb/ccvcDdnGCql
 3FsgK23ruN+FOxf4wKdd9sl10IrTWWOgsolUa3krocblEYzZAy0MvoPZ1QDucQ6ddtAR1rj0oVLhO
 k5PX92QQ==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljFwd-00FBom-F1
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 06:44:41 +0000
Received: by mail-pl1-x635.google.com with SMTP id z4so4262884plg.8
 for <linux-riscv@lists.infradead.org>; Tue, 18 May 2021 23:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=crJApTk0fR8CS3cRDbB3V67gscNvYMiJEHMFrBZfWUo=;
 b=zDGZZs/er8Q9IuA9Imgu2QK64TdNwRQPa6zLFs3OWErIjQOBeBTCV7kAFI8XkEVKBr
 7bimA/liFg+A8v/bCayXSehaSTT0F7V13I/Q44TYvfDL10K/hpHYxVbbzgQSr9Ocp1KW
 OjhyTVZqfbu6yFKgiafgqAFXyy8hw1jzKdN/Qpnb81hAz+pcdvz1+YxUEqVBvhNjLBfp
 uZPrxYwQiNSc0Udlc4+QVfWruZN81uje9iEir53nWlq/lfHmC7bWlKHsBxeRdqXjIVFp
 LnRvKqglalyIDwsrVoT/VOk+EEY/tiruqS+80tcJK3sSdDz0WMgb/5lbceYP6Gsiljpb
 Ycgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=crJApTk0fR8CS3cRDbB3V67gscNvYMiJEHMFrBZfWUo=;
 b=a2UhIs0Aq/iXUMK1EpKl1IwU6HSQaHxTctT6kD+kgG9YKCZb7SMjuF90xY3r7Pb822
 CbatbmjrePvDAe/m8tTPhQrA67DftgpP0wSAsASjb5NQ/7fVBJSr0GjvgjymWUkuw+Aa
 fFeF2AiNgjBGVOkmw728ScbWZ5T99+uYIMgjuaf/bJGJHJNkcoAqIRGwnXnOSXFQ3FXZ
 ByqX+DNQBflf0G0Zz8t5GGdhDd13aOHkRKVTRawv90s55eE+dZS+eMDvx3VT8EOIhuqz
 ZQgHFvTo6lwRFK/hSxvCZW4dfzAVx3rV8CVTwMF1gIkqRc0fTHhTVoQEKCsMA8T9t6RQ
 5BCA==
X-Gm-Message-State: AOAM531jQYRXeM3+WCSLKjbxGdfTmTyJFQfvFwDanJLQw+3V3K4gz92I
 sTtkxyiOddytTqUQVNoY7zNjMw==
X-Google-Smtp-Source: ABdhPJy9tsWxCDo/o3R7ta1owz+e2PxTX//mYRmicr9Nz+qbfH9zpmvYaQDcpfama4JkK8fiYfECwQ==
X-Received: by 2002:a17:902:e8cb:b029:ee:f963:4fd8 with SMTP id
 v11-20020a170902e8cbb02900eef9634fd8mr9185136plg.40.1621406677878; 
 Tue, 18 May 2021 23:44:37 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:9384:8c4b:dc2b:c4d0])
 by smtp.gmail.com with ESMTPSA id v14sm8823848pfi.25.2021.05.18.23.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 23:44:37 -0700 (PDT)
Date: Tue, 18 May 2021 23:44:35 -0700
From: Drew Fustini <drew@beagleboard.org>
To: Guo Ren <guoren@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com,
 lazyparser@gmail.com, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>,
 paul.walmsley@sifive.com, Nick Kossifidis <mick@ics.forth.gr>,
 Benjamin Koch <snowball@c3pb.de>,
 Matteo Croce <mcroce@linux.microsoft.com>, Wei Fu <tekkamanninja@gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Message-ID: <20210519064435.GA3076809@x1>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_234439_672911_90DAB434 
X-CRM114-Status: GOOD (  18.74  )
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

On Wed, May 19, 2021 at 01:48:23PM +0800, Guo Ren wrote:
> On Wed, May 19, 2021 at 1:20 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Wed, May 19, 2021 at 05:04:13AM +0000, guoren@kernel.org wrote:
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > The RISC-V ISA doesn't yet specify how to query or modify PMAs, so let
> > > vendors define the custom properties of memory regions in PTE.
> >
> > Err, hell no.   The ISA needs to gets this fixed first.  Then we can
> > talk about alternatives patching things in or trapping in the SBI.
> > But if the RISC-V ISA can't get these basic done after years we can't
> > support it in Linux at all.
> 
> The patchset just leaves a configuration chance for vendors. Before
> RISC-V ISA fixes it, we should give the chance to let vendor solve
> their real chip issues.

This patch series looks like it might be useful for the StarFive JH7100
[1] [2] too as it has peripherals on a non-coherent interconnect. GMAC,
USB and SDIO require that the L2 cache must be manually flushed after
DMA operations if the data is intended to be shared with U74 cores [2].

There is the RISC-V Cache Management Operation, or CMO, task group [3]
but I am not sure if that can help the SoC's that have already been
fabbed like the the D1 and the JH7100.

thanks,
drew

[1] https://github.com/starfive-tech/beaglev_doc/blob/main/JH7100%20Data%20Sheet%20V01.01.04-EN%20(4-21-2021).pdf
[2] https://github.com/starfive-tech/beaglev_doc/blob/main/JH7100%20Cache%20Coherence%20V1.0.pdf
[3] https://github.com/riscv/riscv-CMOs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
