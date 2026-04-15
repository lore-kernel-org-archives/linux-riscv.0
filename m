Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07760F4199E
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 12:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3aFVTkolFHzVp6mNI5bK7Q0Gzgru8iqYSFtPl9k3Ho=; b=ePOb/9xJPIJHF5
	FYMavGi/LTnHkfixM2Mx2w6DElfR3g4UC+FQESHuuKuzyp4wybc/6PHAufPbrlzp3GuiEJtJ2Aimj
	TAoZHYbU2y0l62BbyDe8Y5eogFfNdZS4ZraA3jvoHJGZ9fS9pgCqB0WCpa0Oc9V1lX9IPJxTvkluP
	g6+cYqBKu9i6Yb43CuRf6+37VRUSfbtQoMI+imZe7od4dz1c6jKwm0OePNlrwPe6vKddv8zU3aTsV
	tw4QChhZ57+WTv+YqLNd7sHC3W4vojduw32+BV774eeFBcu9BPJ3MiJJh3vOrtXPUIUoMV/XDsyQl
	jAuJKjjW/snk8tQlg6WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzUe-0000000189K-03ew;
	Wed, 15 Apr 2026 12:37:20 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzUa-0000000188x-1wrM
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 12:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1776256630; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=CS4BGIXS3JsyYBu2XbbYqlq+oa+QQ3EmP58RqW67j2k=;
	b=qIzKBUtosWqHrNo3MG46+q+xMgqvdxacPvOUTfXdQDr/uBhJyM83QylhAkLUO8D7rUil7AM4FLiG+9uDBb82sIRoHuO3UXyxunMnOFBgvrqdYGDoownamUwVQvTJuiJNYXSeFr2PAEfbUgZBTYrAByNq+N2XSZ3N81drkBEiSe0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R231e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X14khaV_1776256622;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X14khaV_1776256622 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 15 Apr 2026 20:37:06 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: mpe@kernel.org
Cc: pjw@kernel.org,
	anup@brainfault.org,
	andrew.jones@oss.qualcomm.com,
	guoren@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] riscv: smp: Align secondary_start_sbi to 4 bytes
Date: Wed, 15 Apr 2026 20:37:02 +0800
Message-ID: <20260415123702.123309-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d38e585f-554a-4f81-8136-981870fe3383@kernel.org>
References: <d38e585f-554a-4f81-8136-981870fe3383@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_053717_073943_83B5621C 
X-CRM114-Status: GOOD (  11.14  )
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

On Wed, 15 Apr 2026 12:06:28 +1000, mpe@kernel.org wrote:

> > diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> > index 9c99c5ad6fe8..9f33be6260e1 100644
> > --- a/arch/riscv/kernel/head.S
> > +++ b/arch/riscv/kernel/head.S
> > @@ -127,6 +127,7 @@ relocate_enable_mmu:
> >   #endif /* CONFIG_MMU */
> >   #ifdef CONFIG_SMP
> >    .global secondary_start_sbi
> > + .align 2
> >   secondary_start_sbi:
> >    /* Mask all interrupts */
> >    csrw CSR_IE, zero
> 
> 
> Minor nit, but IMHO .balign is preferable in new code. It always byte 
> aligns, whereas .align has different meanings across architectures, and 
> on some arches (including riscv) requires the reader to do the math to 
> convert to a byte alignment.
> 
> These days there's also the SYM_CODE_START etc. macros defined via 
> linkage.h, which use __ALIGN from arch/riscv/include/asm/linkage.h, 
> which is already .balign 4.

Hi Michael,

Thank you for your review and reminder. If this patch is ultimately
approved (because the behavior of OpenSBI still needs clarification
based on the new reviewer's comments), I will update it using .balign.

Thanks,
Pei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
