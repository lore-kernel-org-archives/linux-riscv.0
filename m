Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE18ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 09:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1SKONe0Dy4r/jVPi+t3F6Tt59qMCugUyqbK2+sH0b8c=; b=ToWKH9ZYWbWYQC
	qB0EX2JHoggIz1XraFD+qq4LGez98jLCvLQHERg/OeY2mbg0dnAIKLiiPJvosbDlTiAiJY2PCIY8d
	cKU9gMzDSLFjBvOiamiBDr7ILQs2p4wqcNekRyBx5gM3Hi8xC3XcJVUweREnnywXD6R8f3EO/zqtL
	3PPLQ7IJm/mfJgAKitJyQmh2vYDt0hlbXf+XRJ8WGxvVM0LGAD9mz96M8gJxvvuIR4GBoGnZhK0HM
	lShL6+ZC+oAvRDNOCUd6+rZceomGW7YyuoNaaz5XceKQ+/66LheLA+xTO+6Zbq4PuRuEZ+b+POhCy
	5sGcM+ZOwW2dmgfPbxgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawQd-00AeTy-85; Wed, 21 Sep 2022 09:54:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawQU-00AePV-Ej
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 09:54:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D4B8F63087
	for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 09:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DC1C43141
	for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 09:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663754033;
	bh=M7t6IiqXpQGB9XaRaXvCXP2eKsC0VvYqKrHAX2BqmOU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HFF9B8PKG4sjnwYn/qRsqkY5pL/Avw/xcwxmQNH3bGXcYw0XgvT/7vdbeMgPt0L+y
	 ZtidYy6WjfWnnASa18lptSACPl9vGw452nq1nd4+wt6EOS/gfIEduAXmd2gZcbc0x8
	 VwqHMXTOE1Tb7RAgR5ghqNuqYbgTli5nEXvmsUw9uXhlIIBcOBdEqRweGeJ9/ETyZD
	 7FT1xJeLiEwsB8KcV0Et3Hy5hN1SAcZE6UJyR1qEghkydOQJoPuapbTnNxM4Wki8YZ
	 rTdejngZAzw7IwT+03z6g0QZWTGISoeTnCYeuDzhEr+V/eiX5hSmycbKwmu5oYt+l4
	 QgZmEJo51EK/g==
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-12803ac8113so8249043fac.8
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 02:53:53 -0700 (PDT)
X-Gm-Message-State: ACrzQf2SCpoMAFsYuoN/4WFOUuY8Jgovzoc15DyJ8t8nyXUXbRumU64k
	5gaAA6lq8CqWWKzKh9erttqo6qrapK4eBAiUU98=
X-Google-Smtp-Source: AMsMyM491vQRywb4wDvkWp07dXKdsU6sntPmf24mps+H/A/7DIMj4uinS1kC9vZIpoBWnuepOdlaOPlfaWKaVAl63Ik=
X-Received: by 2002:a05:6870:a78e:b0:12b:542b:e5b2 with SMTP id
 x14-20020a056870a78e00b0012b542be5b2mr4555356oao.112.1663754032361; Wed, 21
 Sep 2022 02:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220918155246.1203293-1-guoren@kernel.org> <20220918155246.1203293-9-guoren@kernel.org>
 <afa17bdd-2d11-4015-6e2a-7a39db931d09@huawei.com>
In-Reply-To: <afa17bdd-2d11-4015-6e2a-7a39db931d09@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 21 Sep 2022 17:53:39 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRMt4zDQcvBOxge-4+6o1mqhWds_AiFKamdCzKJZfoKPw@mail.gmail.com>
Message-ID: <CAJF2gTRMt4zDQcvBOxge-4+6o1mqhWds_AiFKamdCzKJZfoKPw@mail.gmail.com>
Subject: Re: [PATCH V5 08/11] riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
To: Chen Zhongjin <chenzhongjin@huawei.com>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com, 
	zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_025354_605883_8EED807E 
X-CRM114-Status: GOOD (  18.54  )
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

On Wed, Sep 21, 2022 at 4:34 PM Chen Zhongjin <chenzhongjin@huawei.com> wrote:
>
> Hi,
>
> On 2022/9/18 23:52, guoren@kernel.org wrote:
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 5f49517cd3a2..426529b84db0 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -332,6 +332,33 @@ ENTRY(ret_from_kernel_thread)
> >       tail syscall_exit_to_user_mode
> >   ENDPROC(ret_from_kernel_thread)
> >
> > +#ifdef CONFIG_IRQ_STACKS
> > +ENTRY(call_on_stack)
> > +     /* Create a frame record to save our ra and fp */
> > +     addi    sp, sp, -RISCV_SZPTR
> > +     REG_S   ra, (sp)
> > +     addi    sp, sp, -RISCV_SZPTR
> > +     REG_S   fp, (sp)
> > +
> > +     /* Save sp in fp */
> > +     move    fp, sp
> > +
> > +     /* Move to the new stack and call the function there */
> > +     li      a3, IRQ_STACK_SIZE
> > +     add     sp, a1, a3
> > +     jalr    a2
> > +
> > +     /*
> > +      * Restore sp from prev fp, and fp, ra from the frame
> > +      */
> > +     move    sp, fp
> > +     REG_L   fp, (sp)
> > +     addi    sp, sp, RISCV_SZPTR
> > +     REG_L   ra, (sp)
> > +     addi    sp, sp, RISCV_SZPTR
> > +     ret
> > +ENDPROC(call_on_stack)
> > +#endif
>
> Seems my compiler (riscv64-linux-gnu-gcc 8.4.0, cross compiling from
> x86) cannot recognize the register `fp`.
The whole entry.S uses s0 instead of fp, so I approve of your advice. Thx.

>
> After I changed it to `s0` this can pass compiling.
>
>
> Seems there is nowhere else using `fp`, can this just using `s0` instead?
>
> Best,
>
> Chen
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
