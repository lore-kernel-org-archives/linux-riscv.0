Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4173AC2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 15:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=apKfT2sWXFKIpMbHtKdXzw6WXS+pKnhCBTSm2DhLr1A=; b=eseoyH9An6RYXw2cb8qcnsjr/T
	7JIIQs+1sf5X+3oxwyeQl8/879n/J/V5xomAuNlAOAeV9i29CqzOpq1ub/miJwk3eWuP+Z/usJi7u
	psiTfb2cIrHEdHJP8oqnjyhDV5n8NazPoat4ZcPFX1ADZYONvaDfq0ST16FUPihZfj9+WjATT875M
	sDgF+8SjnBYTfuDG9PlhVr11H+O5ttUuMtVMUic4SwhMbvGtm1waTajdMhdn2MS2lnzlGiRhBJ4SV
	fmUHRq1tJG96TKFq53UsCdmJ4YDGHxnADGHJwpk8xvOLGxQTgmiL3d6jOwZ1vlW/VXyLFSZFlBbzq
	vsrV74Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8DV-00000003ZBy-48k7;
	Tue, 25 Jun 2024 15:36:22 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8DR-00000003ZBT-3mxC
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 15:36:19 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1f9c6e59d34so47155555ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 08:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1719329776; x=1719934576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEraVljjtG6yZ3F7hZuYF2rXzKtHxlFX+R3/h/MRFAM=;
        b=SHsyGaoK2blC1zhZWJtoZP8PEMKEGi8X325WpJ6QGeSo2Lr85lH6D8GfaW5YMrMdgp
         Zz1L4TBhAEdZ7jY/4Xr32EABkx+pglH4Q2W5tS7SFd3PlYszs1ntFcAEEZG63XWjRkOt
         pFlCRT25XWD3wg6zWPq0a2qFMCILNaLeqAppwpr/LBd59bZYTY7uB7sgz285TqKoN9Ze
         LFPTkRgoWF96JkoagvfiImLVmyRA/+c72fvTX1sN30NtFI6ISbkACmBTfIpUVQEPECQr
         tf7BR91V8btHNa6jmtXF63H9tRkzAmJ/vJWmnII946yE2Gem1s0Si6mYGjYz1Zw5PUco
         SDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719329776; x=1719934576;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEraVljjtG6yZ3F7hZuYF2rXzKtHxlFX+R3/h/MRFAM=;
        b=gC3at1LE9r0s9U7USaaE4uQGBDvTw9sBKrdo1fVg1sj4pv9oVyAMvFgQlQWg5+7NqC
         LNgi53t4lqQUtu/eHuOeW7JWq3SB56IinbWnG85biVukaXFYDgKpsGWTIkNqm5ItXpQE
         wS0ycFmM/if/LkmLopxzY8e6twJWJiaJNvo+EE/jSc9k0rEVGnJYZHRgrUgkW2iDVa9o
         mH5MjOpcTyQ3o0hh6FcVYDQtXBdyBm65SQGLDoW1dsrmcw+Y8AYuhecrbZ2AZgDeU/gx
         UhFTTmDGODEVcYhHPLMX22TeOz1ycjQtSf76QbxaIy5wZv16wqeWGfyxJZBptCVz13pM
         rRbg==
X-Forwarded-Encrypted: i=1; AJvYcCWXXqn2ReUV5JgNuHLQj/Cq+AGjtk4XFZfzeAJAURKmV34CgVQZFX3HIt8iqm6WntR3s3pd7+eX6JMAXLLg2diiMCbzkC7f5FBPxfQOw1fy
X-Gm-Message-State: AOJu0YydvVmHF+VGyUpApcTi4onkjdK1ovQFP+TI/MdDqyTD9IZoCAGP
	qGCsH197YFrNlFrKNrxarO/p8ELnKy80XbEt5/ShnRNdFdgzBta9hIHuN08Yb2M=
X-Google-Smtp-Source: AGHT+IEVO2RloeRFS7aruFEhKi3Dam9+w8kNJr0NKAJEy2z+RvgfGkDPX/JEBDXkFZBWZxQs9gGhyA==
X-Received: by 2002:a17:902:da81:b0:1fa:2b1f:6762 with SMTP id d9443c01a7336-1fa2b1f68eamr88102695ad.45.1719329775863;
        Tue, 25 Jun 2024 08:36:15 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fa0bf76ca7sm63983305ad.277.2024.06.25.08.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 08:36:15 -0700 (PDT)
Date: Tue, 25 Jun 2024 08:36:15 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Jun 2024 08:36:13 PDT (-0700)
Subject: Re: [-fixes] riscv: kexec: Avoid deadlock in kexec crash path
In-Reply-To: <20240609141802.6976-1-takakura@valinux.co.jp>
CC: alex@ghiti.fr, songshuaishuai@tinylab.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, guoren@kernel.org, xianting.tian@linux.alibaba.com,
  takahiro.akashi@linaro.org, takakura@valinux.co.jp, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: takakura@valinux.co.jp
Message-ID: <mhng-cd9af4c1-3eb8-4053-8d59-e59c12c14166@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_083618_067236_E0681DCE 
X-CRM114-Status: GOOD (  20.57  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 09 Jun 2024 07:18:02 PDT (-0700), takakura@valinux.co.jp wrote:
> Hi Alex, Song,
>
> On Fri, 24 May 2024, Alexandre Ghiti wrote:
>>Hi Song, Ryo,
>>
>>On 06/05/2024 07:10, takakura@valinux.co.jp wrote:
>>> Hi Song and Paul!
>>>
>>>>> To avoid the deadlock, this patch directly EOI the irq regardless of
>>>>> the active status of irqchip.
>>>> Taking a quick look at the other architectures, looks like no one else is
>>>> doing this.  Is this addressing a RISC-V-only problem?
>>>>
>>>>> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
>>>>> index f6c7135b00d7..d7ddf4d2b243 100644
>>>>> --- a/arch/riscv/kernel/machine_kexec.c
>>>>> +++ b/arch/riscv/kernel/machine_kexec.c
>>>>> @@ -149,20 +149,12 @@ static void machine_kexec_mask_interrupts(void)
>>>>>
>>>>>   	for_each_irq_desc(i, desc) {
>>>>>   		struct irq_chip *chip;
>>>>> -		int ret;
>>>>>
>>>>>   		chip = irq_desc_get_chip(desc);
>>>>>   		if (!chip)
>>>>>   			continue;
>>>>>
>>>>> -		/*
>>>>> -		 * First try to remove the active state. If this
>>>>> -		 * fails, try to EOI the interrupt.
>>>>> -		 */
>>>>> -		ret = irq_set_irqchip_state(i, IRQCHIP_STATE_ACTIVE, false);
>>>>> -
>>>>> -		if (ret && irqd_irq_inprogress(&desc->irq_data) &&
>>>>> -		    chip->irq_eoi)
>>>>> +		if (chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
>>>>>   			chip->irq_eoi(&desc->irq_data);
>>> I think this deadlock is relevant to riscv and arm64 as they both
>>> acquire irqdesc spinlock by calling irq_set_irqchip_state() during their
>>> machine_kexec_mask_interrupts().
>>>
>>> However, I think calling irq_set_irqchip_state() during
>>> machine_kexec_mask_interrupts() is arm64 specific way of handling EOI
>>> which is not necessary for riscv.
>>> For arm64, its interrupt controller(gic) seems to have two ways of EOIing
>>> an interrupt depending on the mode which gic is configured. One of them
>>> treats EOI as two step procedure, priority drop and deactivation. I think
>>> irq_set_irqchip_state() is there to handle the deactivation part of
>>> the procedure.
>>> For riscv, EOI only requires irq_eoi handler to complete EOI and I think
>>> keeping irq_set_irqchip_state() will only leave this possible deadlock
>>> without any use.
>>> So I think it's best we simply remove irq_set_irqchip_state() as Song did.
>>
>>
>>I think this ^ is relevant and should be added to the commit log. @Song
>>can you respin another version with the updated commit log? @Ryo can you
>>add your Reviewed-by when it's done?
>
> Sure!

Just checking up on this one, I don't see a v2 on the lists.

>
>>This fix has been lagging behind for quite some time, it would be nice
>>to merge this in 6.10 and backport to stable.
>
> Sincerely,
>
> Ryo Takakura
>
>>Thanks,
>>
>>Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
