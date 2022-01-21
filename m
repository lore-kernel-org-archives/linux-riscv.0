Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A09C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jan 2022 06:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iax01u3zxzE3MzkQfw+UGT+ZGS6n6bLjbHRmYvgeDR4=; b=qQ5YbRBCJfLJ62
	GCO2Jdk017AFABhVTHGc+khk/p5JhydZ5LDg9Desac2JVUhjP+0cL8O4iTZMReOkpQlRrGrepjs7W
	kcRzrMPLv4Vq3zTCaIzjczReg9KGyMfY0L5/QhfnKJ28IO9+UsMGGnw3neabflUlmyEYlgFUibWyo
	Kh0qJdY+VXzplxJkwNXioRgvQhVwx0Wr1fWsDfw5zDOWGGWQuDiB+m4D+68r6o60SRIKCWMDqfSVG
	QJElzdPoaJfEcvuv8cK7Y6EXybYnOs4zmZs3jWOSg6HrD5OnknJ8Q1VzhnNOf5pnmBkGQjSRSiFto
	7f15W/DsVcH+wxQIO33g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAnX4-00Dye1-6O; Fri, 21 Jan 2022 06:36:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAnWr-00Dyca-TK; Fri, 21 Jan 2022 06:36:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4936BCE22EE;
 Fri, 21 Jan 2022 06:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33348C340ED;
 Fri, 21 Jan 2022 06:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642746964;
 bh=OapTYucU006/664lVqAyS8BT5iSkNJKlZLbM69QQ02s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GyeoGBec3Mxxwihc80e8LN96Gzd5XeBsuNCOi7xxq0OUlO7wI66J+kph/004N5YlM
 ZphpsSdABXAW0cGfBs8tDJ2kaQt1QFdvMTjCMTyr6Bg8OcqIWKmeOaRmmnBE13F1EM
 AuEdwDMswd2hT0y57hMztgmKAEzQCaUypXzFkzAxSJ0+w8Q/Xs8m4tpDWn+VYnqnnN
 z9Ejp2Exvg1liCnyEAPgNaaENyPLldmhKZgF1KSYkIDtAxyFKfemjvExbxV5m4Xmou
 +f+05ibW2RAfW0HnazvCqTXvAO8o7EkoN+/B2BScAQl+D+PHtXxrtHd+6loQi9uk+g
 TzEikaKl0BY1Q==
Received: by mail-ua1-f46.google.com with SMTP id y4so15219156uad.1;
 Thu, 20 Jan 2022 22:36:04 -0800 (PST)
X-Gm-Message-State: AOAM530zPt/S7Es3Pk/wPmxmI/qFmz5xaLwpIFfmEJvtDlQwxlmZBvEc
 2PB+Wsz4/rHyU9bwOsNJGDC4wcBp6AOHYw2cqI0=
X-Google-Smtp-Source: ABdhPJwE7D6l9CEOckPMqifjprc+HPS6gXhdx42Itd64DW8S7D8rq3j2EK3bHxYHAPm3yMKSrqoSRwZpgjSjhZ4KQwc=
X-Received: by 2002:ab0:728c:: with SMTP id w12mr1223277uao.108.1642746963165; 
 Thu, 20 Jan 2022 22:36:03 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-18-guoren@kernel.org>
 <CAK8P3a1_qwRpfHRyF75WEqfxGxgVnfB15vNS-egQctx7R5-DvA@mail.gmail.com>
In-Reply-To: <CAK8P3a1_qwRpfHRyF75WEqfxGxgVnfB15vNS-egQctx7R5-DvA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Jan 2022 14:35:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTCwOiTPJO1B6Asa2NUNR0D624t26nnA8S4vrSSax8R-Q@mail.gmail.com>
Message-ID: <CAJF2gTTCwOiTPJO1B6Asa2NUNR0D624t26nnA8S4vrSSax8R-Q@mail.gmail.com>
Subject: Re: [PATCH V3 17/17] KVM: compat: riscv: Prevent KVM_COMPAT from
 being selected
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 Christoph Hellwig <hch@infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, inux-parisc@vger.kernel.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_223610_315547_0AB68EB3 
X-CRM114-Status: GOOD (  22.80  )
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

On Thu, Jan 20, 2022 at 6:32 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Current riscv doesn't support the 32bit KVM/arm API. Let's make it
> > clear by not selecting KVM_COMPAT.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > ---
> >  virt/kvm/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> > index f4834c20e4a6..a8c5c9f06b3c 100644
> > --- a/virt/kvm/Kconfig
> > +++ b/virt/kvm/Kconfig
> > @@ -53,7 +53,7 @@ config KVM_GENERIC_DIRTYLOG_READ_PROTECT
> >
> >  config KVM_COMPAT
> >         def_bool y
> > -       depends on KVM && COMPAT && !(S390 || ARM64)
> > +       depends on KVM && COMPAT && !(S390 || ARM64 || RISCV)
>
> Maybe this should be flipped around into a positive list now?
I think it's another patch to do that. Not in this series.

> The remaining architectures would be mips, powerpc and x86, but it's unclear
> if this actually meant to work on all of them, or any potential ones
> added in the
Yes, it's unclear and arch maintainers need to confirm that.

> future.
>
>        Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
