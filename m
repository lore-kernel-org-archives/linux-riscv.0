Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214A7C61DD6
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 04:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jMbnnML69v8cUX5XbORLNtNPZYvVK8p7Rfkpr2ZPl8c=; b=R0Wmxp2UFuE4qS
	BRbmlAbfAXvtJFERQlS1XnaXxVic39Ip/IzUWirslLXJF3Ys0hKR1HU0AWKOL/66ph6oo6mdXZMlK
	BMTS+HnVu5FRupuDzlAB7JnWBziGxil+7/o5HJbzc7+m+B5TiiEVJcx3+R0/+wNDXgojv+/gY3k3M
	hrnWiROgw3BFmOC9z5guD8gyG0eEhwmG1YRfS/iDqamOAnOo/UPgWiYE15z/g1Y/9kqdPdraUX5+H
	rF0cpDAS0aLfQ872/Yw07dz+gguKf3gL7fzU5XxtvYxBUGkji6s/mIY98wjVD2Wt2uhj8O5mvfBdv
	0itPAWNUDIhd2qDmi6ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1GVS-0000000AzRp-1Ss4;
	Tue, 01 Sep 2026 04:53:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1GVR-0000000AzRj-30Lx
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 04:53:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22C9A40323;
	Tue,  1 Sep 2026 04:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB3C1F000E9;
	Tue,  1 Sep 2026 04:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788238437;
	bh=ytuFL56qJYKx7je5e+O86sWaGDqpI/fCKFZZwoOb6WA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ehZH5OLlDbcCGncg9W6oIgdCvOAFindu9fVC48iyVA96UlMDfjmpguYF0EgQ3yZbf
	 ONXBtz3/8dUy/YCpA8ey7um5WokGJU1q2XF3JOyyU6AlkcBuGIdnFPEuUmnUHE1Uie
	 Jz+9bhQDgZIFVrIuw49MVkfjaoMsn7XSnvG7zK81j2q/pDyxizWXGt1kiEO6FOGWKI
	 PPRwqy/oaqGLL/ViWbbFtoWjxaXJ/MQCLG+o03r789TzQWCFVSHLbs4ROVDUEw2x2C
	 /mVnm/8ytfqjZn8ttVINp3964Qb7csBJ36dthqti6n3LBEvxDfU6YKs8zdpXo2iwzw
	 eGV9aB3FXDoCg==
Date: Tue, 1 Sep 2026 12:34:11 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] riscv: word-at-a-time: improve find_zero() for
 !RISCV_ISA_ZBB
Message-ID: <apZVwzxBD8Ih493W@xhacker>
References: <20260113122457.27507-1-jszhang@kernel.org>
 <20260113122457.27507-2-jszhang@kernel.org>
 <87mruh5h1m.fsf@yellow.woof>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mruh5h1m.fsf@yellow.woof>
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

On Thu, Aug 20, 2026 at 10:31:49AM +0200, Nam Cao wrote:
> Jisheng Zhang <jszhang@kernel.org> writes:
> > +#if !(defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB))
> > +#include <asm-generic/word-at-a-time.h>
> > +#else
> 
> Instead of this #if, would it be better to do
> 
> static inline unsigned long find_zero(unsigned long mask)
> {
>         if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
> 	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
> 		return !mask ? 0 : ((__fls(mask) + 1) >> 3);
> 
> 	return count_masked_bytes(mask);
> }
> 
> and let compiler's dead code elimination does its job?

This is impossible because the generic word-at-a-time.h implements
the generic find_zero() itself, so there will be compile error.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
