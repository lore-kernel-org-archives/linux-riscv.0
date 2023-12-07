Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C59C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 14:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kR+TLUG6KrUaa5RpzLhlFm9Tu6L6LOIY5mJeSu17WbI=; b=Fr1SSFHGtRemCZ
	w+MGGt+4nWIKlKr9LvXc2lKWhFWkLEvGBKXeFxbgh8mKyOhepoWEDHiZFeYgOMmrbn3cN/3XWcnMU
	Vzu1RVhUbunVP6RW6/oTJORd/l1qYa5+fFw7q8aoDnuWVx49DbyFgs/lZ/glQhnX7wIT3GqeI0QlY
	lQcudlno8Xp1L8urNE4KnrKHxEtkSzVCzrlsWZFqFEaBZ+T7UD8X+NkTrRPmOL3LHGzvNrNsxL4Fi
	8rgjDEsRZF5M+pDLdrMAAUFstXZcSrPtrbL0Q7tWiyOa4PMWWPpXHU1YYrO1j83ab1+oayS2x8Ln9
	8jfuqeS8SAzDMeaAMEhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFdt-00D3mj-25;
	Thu, 07 Dec 2023 14:46:21 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFdq-00D3lg-2E
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 14:46:19 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40c2d50bfbfso2036965e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 06:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701960377; x=1702565177; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F+SZx05QL8DvnaBiqNo+wDKuA3Gr0caBrn6hcV+55hc=;
        b=Q9Xt2HOeASCTiUO5M+LxUCJhzE6d9SOOVvc1A/9pK50bWP0Yb1VdWj3w3hA5RYoDNI
         2KX9MwpETkrLZJmzvhL4DdOeH9weYGeNuvMizfW3+DsfwAxmP39a6BYad+I4u6kkYeTc
         OBdWGVeoZdhalS9YXnEJF154AoLpdztZ01eyRGpb1VMmsPNFUYUuwH2CkTeKnmXBMts6
         x5UwUyXipJsxTvMezxEYKETM/3cSNP81wrw7aq3DiR5zpER4uWNxgBQNesmbsJ3apym2
         BjKgLStUfcdaGi+RCIRWMgsGamlohiMOmaVdZwSmH6hdClBNTA0AMPb1cEPq/Lfgpj4F
         b4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701960377; x=1702565177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+SZx05QL8DvnaBiqNo+wDKuA3Gr0caBrn6hcV+55hc=;
        b=HHoKcVfsVL0qc5OgzWgWUFelq2EyRBE4lzkdjTuyfWWFJCiu3TJ26x5TO0i2YL28WF
         J1E4r42nVIM0UizK8MvQ4Y/InOea5/RBe/sMBnBK2WZ1ShI99y9uAWF89YgJcEg0gLgO
         6DRENGao4qt9vGv2mh/VkJPYTZdHgxOEQ6dfODvqeVtfE6LjeNU+6+pThzqfjrukFTc8
         xKSeXoNIOlyGyHeSYjfAKigzUKDyPgxQXTYg7TVe6hQd1s8a9PEocHfhJCtOa4AM0lEE
         2qeWsvEpGw1Ue/O5VWVeGO4L+Ltrw/PBDycSYWrWs7fmw7yDv3KmWzSl9a0L0vBuQRQV
         Eg7w==
X-Gm-Message-State: AOJu0Yxu4V4bDWhoi1u5RjFUk48KNdB0ZN43JQ9o0Vb91jla+7VaeEKx
	ol12DG7blPm4MJ9C0pFhfmQyMw==
X-Google-Smtp-Source: AGHT+IHVym4Nz6MBkeoRJw8LxZvSVQ6n6JQRhDlWhvCA++GrRUuK2yBbo0vI0w9nDC38Cf7gzYDwog==
X-Received: by 2002:a05:600c:548a:b0:40b:5e4a:2347 with SMTP id iv10-20020a05600c548a00b0040b5e4a2347mr2748346wmb.73.1701960377359;
        Thu, 07 Dec 2023 06:46:17 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c459400b0040b349c91acsm2182749wmo.16.2023.12.07.06.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 06:46:16 -0800 (PST)
Date: Thu, 7 Dec 2023 15:46:16 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, anup@brainfault.org, atishp@atishpatra.org, pbonzini@redhat.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, jgross@suse.com, 
	srivatsa@csail.mit.edu, guoren@kernel.org
Subject: Re: [PATCH v1 04/14] RISC-V: paravirt: Add kconfigs
Message-ID: <20231207-963f31814d2502cbc058647c@orel>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
 <20231205181119.207204-20-ajones@ventanamicro.com>
 <20231207-unsealed-bunkhouse-bd79271b4896@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231207-unsealed-bunkhouse-bd79271b4896@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_064618_728130_0610253C 
X-CRM114-Status: GOOD (  11.31  )
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

On Thu, Dec 07, 2023 at 02:07:28PM +0000, Conor Dooley wrote:
> On Tue, Dec 05, 2023 at 07:11:24PM +0100, Andrew Jones wrote:
> > Now that we can support steal-time accounting, add the kconfig
> > knobs allowing it to be enabled.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> In hindsight, should this be squashed with the code actually adding the
> support?

Yeah, this can be squashed, particularly because the configs are off by
default anyway. Will do.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
