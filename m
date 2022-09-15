Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181DEECAAD3
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 13:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yEp3W5yJOi7zdhkVgvVAjGIjJVCmsjnbta1ITC7OwN4=; b=PR8wcRQ/sC+MPI
	rRFKjODumJQFiwjNr6M8l56zgtZebd9OtBK7oC57bj0EjFLu2Ht1tNHtw8FH4kdmPyOfECm66XFym
	0RmVx8v77PHKwt5ldUHPPBfRBqL0OGMTCZUYrRTUJMR+0f4WRukxlQcH8QRmlhQ3sQ/7cJPvBKnfG
	oDU4/MbCnRQUnpOM2nvwlzPg7keIYOby2THj3q+/WvVjFD9HW/9CMmn6hHrvRNTYPVunxyD3iEi2i
	My0wr1EWgMl+MaIj4DjMZFDv/zYha9/RgBiY/obmzf6aAGhytjythNVFVkYt6dwwH5/KdPikX8Piw
	djf5cRMwP7UfwXWRImYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYpJi-009pNw-8S; Thu, 15 Sep 2022 13:54:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYpJe-009pCg-SH
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 13:54:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8DA3B62415
	for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 13:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38C0C433D7
	for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 13:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663250045;
	bh=Z8j/kUIQU23xAq3shGYJcami05xLAFPFNWFs+B/V/Yk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nQtwfusl9PKLnL1fGrR+1M95X0ps0Cru5G2plQKluCuuqNNzspA834vZhKSQqxYXN
	 osiHzEJokbtcGoDOXkZ3US7CjmBc/q1GqvddVWauIgdDbbvwvbtRI+ILnh9JDijdT7
	 bImm9c7WrqwapKdzyhEMfDRvyKjYT42zSs+89Sv7X4Fxee0LBBhx+zf1T8psxWkYU5
	 4UZKdaoE/ZHeIqaVVBQo5/3wCrOFGfBXDCykud5LBSLnwOEMKfLOxbcJxeHbxwO04V
	 EcpWJQH+lTfLAtP31S6Oeo8UQE9pO/hQy2pUjonMfnFwGHnFbWVLjvdkhGpFIKNKoT
	 X5N6tRYFk3l3w==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1280590722dso47640087fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 06:54:04 -0700 (PDT)
X-Gm-Message-State: ACgBeo31pn4X5+Q1v1nIT9NPV0ow1DkBXB7ar/mosfVYJNquKwuSZdm9
	wGXBfs/f38+PkNYJ4libvmQZwrCJIaRfKy6RYcw=
X-Google-Smtp-Source: AA6agR7lMc3IsJfZ0FyugD8jZ6Dy8YK7WHQCXdDYkTFQfUYXXOuUxEoF8umRwW7er1k2B91fiGP6CUDg1Ui9F4zki5U=
X-Received: by 2002:a05:6870:a78e:b0:12b:542b:e5b2 with SMTP id
 x14-20020a056870a78e00b0012b542be5b2mr5314178oao.112.1663250044072; Thu, 15
 Sep 2022 06:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220913094252.3555240-1-andy.chiu@sifive.com> <20220913094252.3555240-2-andy.chiu@sifive.com>
In-Reply-To: <20220913094252.3555240-2-andy.chiu@sifive.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 15 Sep 2022 21:53:51 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT8+TWFoP6pUPOHOLWFXg-5N0U3jDYvqAp_sO+qgqS5Ow@mail.gmail.com>
Message-ID: <CAJF2gTT8+TWFoP6pUPOHOLWFXg-5N0U3jDYvqAp_sO+qgqS5Ow@mail.gmail.com>
Subject: Re: [PATCH RFC v2 riscv/for-next 1/5] riscv: align ftrace to 4 Byte
 boundary and increase ftrace prologue size
To: Andy Chiu <andy.chiu@sifive.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	rostedt@goodmis.org, mingo@redhat.com, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, ardb@kernel.org, 
	greentime.hu@sifive.com, zong.li@sifive.com, kernel@esmil.dk, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_065407_047988_6436647D 
X-CRM114-Status: GOOD (  24.27  )
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

On Tue, Sep 13, 2022 at 5:44 PM Andy Chiu <andy.chiu@sifive.com> wrote:
>
> We are introducing a new ftrace mechanism in order to phase out
> stop_machine() and enable kernel preemption. The new mechanism requires
> ftrace patchable function entries to be 24 bytes and aligned to 4 Byte
> boundaries.
>
> Before applying this patch, the size of the kernel code, with 122465 of
> ftrace entries, was at 12.46 MB. Under the same configuration, the size
> has increased to 12.99 MB after applying this patch set.
>
> However, we found the -falign-functions alone was not strong enoungh to
> make all functions align as required. In fact, cold functions are not
> aligned after turning on optimizations. We consider this is a bug in GCC
> and turn off guess-branch-probility as a workaround to align all
> functions.
Disable pgo static optimization would reduce the code performance. I
think we need to fix that problem in GCC, and pgo is a default-enabled
optimization.

>
> GCC bug id: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88345
>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 3fa8ef336822..fd8069f59a59 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -11,7 +11,7 @@ LDFLAGS_vmlinux :=
>  ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
>         LDFLAGS_vmlinux := --no-relax
>         KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
> -       CC_FLAGS_FTRACE := -fpatchable-function-entry=8
> +       CC_FLAGS_FTRACE := -fpatchable-function-entry=12  -falign-functions=4 -fno-guess-branch-probability
Another fixup should be covered, eg:

+ifeq ($(CONFIG_RISCV_ISA_C),y)
+       CC_FLAGS_FTRACE := -fpatchable-function-entry=12
+else
+       CC_FLAGS_FTRACE := -fpatchable-function-entry=6
+endif

>  endif
>
>  ifeq ($(CONFIG_CMODEL_MEDLOW),y)
> --
> 2.36.0
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
