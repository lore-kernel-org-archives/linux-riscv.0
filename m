Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8A5CE79B9
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 10:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=mFnMiMCbRF3nnY9kbJRMd7B/ILUrsjSYstv12Lpeiq4=; b=pVo7Ye6FnbYW5YewHds6Sxnlz9
	b/I63jif2DfxxSPvxpjemEu45l5/m4e57xQIxVwFLzxjwDxE7aE1JRJSM0hTT4yom54pFSNErlTJA
	Pu9rvJnlLGaanbuLVmewEUnsT7OmNMmxpZAWbQz7SbRCygTiR7UW0XnIQnWiDWyMXEZi9PuIag8L2
	E4jEm5ks1nRypsBlq35XIMjOa0oh/5PAEDINCsU60RuSSQw3KuNSeszYOwHOY33bk2BnoS6+gTHtA
	uOMdFiXk7zehLr4Ml66mFS28rn2igtNbw3RMRG8mDYSyNyciKDlasWzlC/MOm+IoZw+DxU3EYYrEA
	a8hio50w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiuHf-002aKz-31;
	Wed, 20 Sep 2023 10:18:15 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiuHc-002aJc-1Y
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 10:18:13 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bf7a6509deso49921525ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 03:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1695205088; x=1695809888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gaiz04gdR9OAn8hUhTxFnO5z/99PYRYgbxmLEMvi0GU=;
        b=VCVqLL2EVTfPKrj5w2uGKZTCt1YX8cbXbaXpaFIPQw4d2l8wmkbM0zWcVvH5ZV6oah
         q5DfONG/sgEioh0Jga/5FDuMJylObDVPL+9f4AKUtIbO8lLjLa4SCo2W7EhamwooZtQn
         WrAvJaJIk34rwlhXBE5H0tdf8+abBVV1RV5wNWK+3LnrmmawDzQohFxdwOGgLR2lanac
         7UB9B2NCWye7vJiNcD+kgPcsVZ5VZLcPlaYNKCOh0E/9DFcTTnYgxryjVECTwS5Z5HdY
         pHC240U9W+DosT5V0UsZWiFWSv4s1pyTYzpkjBmAaYmfvPbSzxb+Sl7wgpTNLcNSm0EX
         2xtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695205088; x=1695809888;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaiz04gdR9OAn8hUhTxFnO5z/99PYRYgbxmLEMvi0GU=;
        b=VO9NzOiTS279ZTCGX0/AuRxH1Wutf1E3KZUdZBDYQpQUPeXFSWVMZfkiPRn85yhMJf
         gOWqQkPgDo40LKXdYwQZ0ABIywXkuckGy9pJIx7+86nnkN9jpFxuofnbVh0OoSNfWMM4
         V/PE6dK55FkFHnVPP/uSfb9NMduySbU9zCe8ixgf1jvcoDBjT66fUXL1tKq2fXygbILd
         beobz2J+gDVn+WJB3cqGHfEx/IAEDgGIdpx9DxbpfdvRGoi+U1l8fFRCD4gicOJWoZtN
         fIaIkttONjG8nN/ZVhFY5MA74eZM/dvYUeiOdWZj/Lo0/uGSrq2OGklJd6vF0rv9XSoo
         hnqw==
X-Gm-Message-State: AOJu0YwsPp3t+/PJvYN3V4RwwTNsl6ICAyCbrdxijBr5U3XJil8g1ajK
	8HIVcBd25RcS6F9XH/cLPrSV3Q==
X-Google-Smtp-Source: AGHT+IEQYtBpZ58/YQnBwJBLpvN8uGqez/p/gojg8PHBbN+rUIEdYg4vTrGGIU7fSfJ7RgF2tGOjzA==
X-Received: by 2002:a17:902:748a:b0:1bb:f82f:fb93 with SMTP id h10-20020a170902748a00b001bbf82ffb93mr1759975pll.2.1695205087644;
        Wed, 20 Sep 2023 03:18:07 -0700 (PDT)
Received: from localhost ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id y4-20020a170902ed4400b001c456b3c012sm7479840plb.298.2023.09.20.03.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 03:18:07 -0700 (PDT)
Date: Wed, 20 Sep 2023 03:18:07 -0700 (PDT)
X-Google-Original-Date: Wed, 20 Sep 2023 03:18:02 PDT (-0700)
Subject: Re: [PATCH] irqchip/sifive-plic: Avoid clearing the per-hart enable bits
In-Reply-To: <86zg3ttvsi.wl-maz@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Marc Zyngier <maz@kernel.org>
Message-ID: <mhng-3622fd7f-23c4-4709-9082-0a62d49762ce@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_031812_525242_8DDF693A 
X-CRM114-Status: GOOD (  23.32  )
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
Cc: samuel@sholland.org, linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 18 Jul 2023 02:26:37 PDT (-0700), Marc Zyngier wrote:
> On Mon, 17 Jul 2023 19:58:40 +0100,
> Samuel Holland <samuel.holland@sifive.com> wrote:
>>
>> Writes to the PLIC completion register are ignored if the enable bit for
>> that (interrupt, hart) combination is cleared. This leaves the interrupt
>> in a claimed state, preventing it from being triggered again.
>>
>> Originally, the enable bit was cleared in the .irq_mask operation, and
>> commit 69ea463021be ("irqchip/sifive-plic: Fixup EOI failed when masked")
>> added a workaround for this issue. Later, commit a1706a1c5062
>> ("irqchip/sifive-plic: Separate the enable and mask operations") moved
>> toggling the enable bit to the .irq_enable/.irq_disable operations and
>> removed the workaround.
>>
>> However, there are still places where .irq_disable can be called from
>> inside the hard IRQ handler, for example in irq_pm_check_wakeup(). As a
>> result, this issue causes an interrupt to get stuck in a claimed state
>> after being used to wake the system from s2idle.
>>
>> There is no real benefit to implementing the .irq_enable/.irq_disable
>> operations using the enable bits. In fact, the existing mask/unmask
>> implementation using the threshold register is already more efficient,
>> as it requires no read/modify/write cycles. So let's leave the enable
>> bits set for the lifetime of the IRQ, using them only to control its
>> affinity.
>
> Side question, which doesn't affect this patch: what happens with
> interrupts that are firing while the interrupt is in a disabled state?
> It's fine for levels, but what of edge interrupts?
>
> My reading of the spec is that it is the role of the "gateway" to hold
> the signal, and that this is upstream of the PLIC itself, so it
> *should* be fine, but I'd like confirmation on that.

Which spec are you reading?  I'm not seeing anything in 
<https://github.com/riscv/riscv-plic-spec>, but I've sort of only 
skimmed it.  I don't remember us ever really figuring out edge triggered 
interrupts, it was sort of just a "vendors should make sure they do 
something reasonable" type plan.

> Thanks,
>
> 	M.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
