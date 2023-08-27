Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB44FC83F01
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 20:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdVf0yg77BYZzlOjEyj8C9XIJ9LsW/hBM+eON8P6N0Y=; b=DKbFuMa7/X04Vs
	2xrclLMCuZ1ZYge5mWPmHsdRCUInlQ+GIbe76ZoivY8H7+jxXJlVwHuMnnRtERmBPDom95Lh8uY2W
	tp3mjTIVB2Yop+iOHSrdEUi9ZSqgnTCkLVNsxYDn5SP5z44GTMDsgweFoxLtukJ9y+KQl1K+3qp33
	1y+iZ06PxWA0yfSxJPZRqlOxEyZKpTDPELs8kvxquxVa0AI2dx2dIdarjCBYHbsWyeBUhh5dW0ew1
	6twdF6M8ypOaqsiQaJHAQlC+Y23o6RxqIDGGmfLy9Cm7tegAH0HnhJgIKHWegFWLdDBhuBNowmFuq
	gb0nZsFKUTknvsu4EvJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaMAo-008QgX-1U;
	Sun, 27 Aug 2023 20:15:50 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaMAl-008QgB-1I
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 20:15:48 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5009d4a4897so3859822e87.0
        for <linux-riscv@lists.infradead.org>; Sun, 27 Aug 2023 13:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693167338; x=1693772138;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SrKEJGHd7TFgfnwuuBL555hEAHUEGfveeoECEz3v1Ms=;
        b=prJAmeeaHjuu+lnder/uGA+ufTDAYPx6+HBktkYuoJm+bCfJkiRiV66tab0gmZL7JW
         FXheMG8bkfZ/qVB0NFdrSt2xMBvzL/BGnIPpqxPWUyvAuxU3cISvSkjoZn1cugFRZtBy
         t6NLQ4oGsqcJMi+TwHZBQQJ9/KAp33vDzxP/11ath2TRCkIC/nc4U5uwxSnBeC7fMVaA
         bwYTbZ2YZYoRH4bilkguWQ0aMdTySIZDNKBrmd/j3ynLElKwXXnY0W3NYbmfTS6tLI7K
         Qz+obSnQ8si/iZsoUroKDzbq2oiLurTV7LQRZCpkN8B6c98XUq6+0gsPdDsTeJLt+iyB
         fEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693167338; x=1693772138;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SrKEJGHd7TFgfnwuuBL555hEAHUEGfveeoECEz3v1Ms=;
        b=MLb6GVOjjERle6t3IvQBsiSnNdr04kYU/v+6iY9OPKVx2ZBDX36aN0CCfotzdhLl6u
         IwtZBdXeSofroWuzV+tBtHO2BOS9vS6rZ5uHaRrtBdUM9ZL60R9IIjR4BSOLYBPqXaNG
         6OIls6N2ArFNGdxsuaNk9zz1B2aISoeKpFTQlAN1GuCt40Y6c2NN34IiX3VIHPcuap0v
         87bSvmyGQzFxl/ukCnAX4mbNFe94AM7LrXKcUnIxtlaoGpAxbjnv0pzQy0/g1ZdU+zZg
         T/JHVULyjUj369yhojPN/3rd2JX59vAtMGLUmWRbpLrc8Cdse49bW70KsG+2Ro1cpriX
         6F3A==
X-Gm-Message-State: AOJu0Yxf9C8HCqJo0aOpMnhEdo7b5/W8XSb+YkyAUoJtXtgRDL5UICFW
	12W8Xut7GCxXY6TXXwyuKEg=
X-Google-Smtp-Source: AGHT+IGQ7wjtuWvg9Wkb9joTEwQ1eh1wDuqLsIKGCZVMBRyKXURHrDrpqQdFveAyVKtXPfnzQ4cjyw==
X-Received: by 2002:a05:6512:224e:b0:4fd:c84f:30c9 with SMTP id i14-20020a056512224e00b004fdc84f30c9mr20202851lfu.47.1693167338131;
        Sun, 27 Aug 2023 13:15:38 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id v21-20020aa7d655000000b0051e22660835sm3654885edr.46.2023.08.27.13.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 13:15:37 -0700 (PDT)
Date: Sun, 27 Aug 2023 22:15:36 +0200
From: Nam Cao <namcaov@gmail.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>,
	bpf@vger.kernel.org, Hou Tao <houtao@huaweicloud.com>,
	yonghong.song@linux.dev,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Puranjay Mohan <puranjay12@gmail.com>
Subject: Re: RISC-V uprobe bug (Was: Re: WARNING: CPU: 3 PID: 261 at
 kernel/bpf/memalloc.c:342)
Message-ID: <ZOuu6IF2Cf6OaJzg@nam-dell>
References: <87jztjmmy4.fsf@all.your.base.are.belong.to.us>
 <87v8d19aun.fsf@all.your.base.are.belong.to.us>
 <ZOpAjkTtA4jYtuIa@nam-dell>
 <87cyz8sy4y.fsf@all.your.base.are.belong.to.us>
 <ZOsKukBz8i+h4Y8j@nam-dell>
 <87y1hw7t5p.fsf@all.your.base.are.belong.to.us>
 <ZOsZtH+5P0/R6kvd@nam-dell>
 <87jztgwaur.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87jztgwaur.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_131547_482835_9F59B17F 
X-CRM114-Status: GOOD (  36.47  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Aug 27, 2023 at 09:20:44PM +0200, Bj=F6rn T=F6pel wrote:
> Nam Cao <namcaov@gmail.com> writes:
> =

> > On Sun, Aug 27, 2023 at 11:04:34AM +0200, Bj=F6rn T=F6pel wrote:
> >> Nam Cao <namcaov@gmail.com> writes:
> >> =

> >> > On Sun, Aug 27, 2023 at 10:11:25AM +0200, Bj=F6rn T=F6pel wrote:
> >> >> The default implementation of is_trap_insn() which RISC-V is using =
calls
> >> >> is_swbp_insn(), which is doing what your patch does. Your patch doe=
s not
> >> >> address the issue.
> >> >
> >> > is_swbp_insn() does this:
> >> >
> >> >         #ifdef CONFIG_RISCV_ISA_C
> >> >                 return (*insn & 0xffff) =3D=3D UPROBE_SWBP_INSN;
> >> >         #else
> >> >                 return *insn =3D=3D UPROBE_SWBP_INSN;
> >> >         #endif
> >> >
> >> > ...so it doesn't even check for 32-bit ebreak if C extension is on. =
My patch
> >> > is not the same.
> >> =

> >> Ah, was too quick.
> >> =

> >> AFAIU uprobes *always* uses c.ebreak when CONFIG_RISCV_ISA_C is set, a=
nd
> >> ebreak otherwise. That's the reason is_swbp_insn() is implemented like
> >> that.
> >
> > That's what I understand too.
> >
> >> If that's not the case, there's a another bug, that your patches
> >> addresses.
> >
> > I think it's a bug regardless. is_trap_insn() is used by uprobes to fig=
ure out
> > if there is an instruction that generates trap exception, not just inst=
ructions
> > that are "SWBP". The reason is because when there is a trap, but uprobe=
s doesn't
> > see a probe installed here, it needs is_trap_insn() to figure out if th=
e trap
> > is generated by ebreak from something else, or because the probe is jus=
t removed.
> > In the latter case, uprobes will return back, because probe has already=
 been removed,
> > so it should be safe to do so. That's why I think the incorrect is_swbp=
_insn()
> > would cause a hang, because uprobes incorrectly thinks there is no ebre=
ak there,
> > so it should be okay to go back, but there actually is.
> >
> > So, from my understanding, if uprobes encounter a 32-bit ebreak for any=
 reason,
> > the kernel would hang. I think your patch is a great addition nonethele=
ss, but I
> > am guessing that it only masks the problem by preventing uprobes from s=
eeing the
> > 32-bit ebreak in the specific test, not really solve it. So, if there i=
s a 32-bit
> > ebreak in userspace, the bug still causes the kernel to hang.
> >
> > I am still quite confident of my logic, so I would be very suprised if =
my fix
> > doesn't solve the reported hang. Do you mind testing my patch? My potat=
o of a
> > laptop unfortunately cannot run the test :(
> =

> Maybe I wasn't clear, sorry for that! I did take the patch for a spin,
> and it did not solve this particular problem.
> =

> When we're taking a trap from *kernel*mode, we should never deal with
> uprobes at all. Have a look at uprobe_pre_sstep_notifier(), this
> function returns 1, which then means that the trap handler exit
> premature.
> =

> The code you're referring to (called from uprobe_notify_resume()), and
> will never be entered, because we're not exiting the trap to
> userland. Have a look in kernel/entry/common.c (search for
> e.g. TIF_UPROBE).

Ah right, uprobe_notify_resume() is not called if we do not return to user
space. My bad, I thought it is called. Thanks for the discussion, now why I=
 can
see my patch is irrelevant, and your patch is the correct fix for the repor=
ted
problem.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
