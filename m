Return-Path: <SRS0=M4pA=O5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEC0C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 20:40:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0B87218F0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 20:40:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PazgqtVC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="L3AgAu9o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0B87218F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=9Pfa8DzPfLhUi763ZgRoCj7WLkdBpT594OfX0pOk4O8=; b=PazgqtVCtVAZcp8WMZDl/s3UV
	Psq5vDr6AFi20T7+1HKZe+MKTrVgvT920hycWQEfRkmFAW41oz+UhMdigJn8Q5+3ORKLNmec9uu5J
	6myLGjGP9foo5No/SUh2dLxVD22p5+NQDE81unQ7Iq/dLQCJ1B9io3GP9pQpbtErzPD7yq+gCMvGm
	5dJ+GY42/9DnjJ0gtAuV0CaCM5wfiaSaU2HWItO6XZ5ouaYOg+JYpSwyL1UrzDG1NOuZzKqHL91ha
	Zp5lv7KSXEUc6C+gq0FsBcWhNHbfXY6ak99jekF2TnWiX1b+n5edSS1paoT0zojaHGEcpdAoOfaA5
	lZQ76RmTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ga57j-0003Xk-MU; Thu, 20 Dec 2018 20:40:51 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga57g-0003UY-Cr
 for linux-riscv@lists.infradead.org; Thu, 20 Dec 2018 20:40:49 +0000
Received: by mail-qt1-x844.google.com with SMTP id k12so3346297qtf.7
 for <linux-riscv@lists.infradead.org>; Thu, 20 Dec 2018 12:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=oTBSe3eBPo/GCYBpxqqW/LZuTvviXbX7laF7qYlMa2Y=;
 b=L3AgAu9oyxmnRfSqnvcnaycoziTA+Mzlq5bOXYSqRifR1isBO8hg0r1C09S00TMCsr
 OpZwSIV4b/eAhc4TE22IW90V3PJG+RyEl0eRd9z2ZVNY1yw/RZ093iAY1nF6bDbKA0x7
 sWZQJZJ38i2G+dQQiSqiyKtvSnIrLh4Z6et+w+cixrp0xuRLzUD4aaw6c02F71244LSF
 +Jgc8wsKsaoD6hs9wFKxvYT8ZfhTLFRNpOB+T58Oe6uRf9MwOSJFN4XlTgGm3CGy2IhR
 0XvPEFHS/F1pALmAjJHAlBE8Sz8F4mcfvT+MGhTh2NfYx4mBvfo/2g73YCwxGKBTAA+5
 z9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=oTBSe3eBPo/GCYBpxqqW/LZuTvviXbX7laF7qYlMa2Y=;
 b=lN0g6xNC5pXOZDtMd9JrLgkomGj+tZt5MZF2SKbgvtNlBgBolFCmUOLZL+5g91PHis
 raHwkIXzbo1d4Zb7rubAVF2HNni03cULPdMNtJFyGVXn1/DNFh6wuDrLTazdhWMtsaYh
 eA40liugKp+FuUw3SQkNuKB6BMHZWTMi8xssFE7I82ssZETNU/kVg1oAgHq/bs2nSYdy
 yYFOqV1tp2DvVTM5DnRcjJK9GjrcHH+DNZRk5nriAQ4HmgaDJBxJ5e5RKaYaqdR/E8/m
 YrUfbGfOQarRKmMRnDERK1WqWzPHAGegpP9y3doAWwZTlGFWjuTiXNAQsJJL0rBZKxpi
 j2OA==
X-Gm-Message-State: AA+aEWbPhoWMmdhsVs75O4u4cAVwYQmnwGapiwyvfEyhldzJotmblguc
 ETuH4YFuEtrhB9LSdO6Plt8vng==
X-Google-Smtp-Source: AFSGD/Vuhahggmh3ECufo5R1afRLgw8Qs2N/vyETT0Vz7sTXva+w2ukUMCL1tlMxiOK7aOIA3yEAlA==
X-Received: by 2002:aed:3482:: with SMTP id x2mr26720808qtd.72.1545338436434; 
 Thu, 20 Dec 2018 12:40:36 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
 by smtp.gmail.com with ESMTPSA id 7sm7304915qka.38.2018.12.20.12.40.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Dec 2018 12:40:35 -0800 (PST)
Date: Thu, 20 Dec 2018 12:40:35 -0800 (PST)
X-Google-Original-Date: Thu, 20 Dec 2018 12:39:32 PST (-0800)
Subject: Re: [PATCH v3 0/6] IRQ affinity support in PLIC driver
In-Reply-To: <CAAhSdy0t9H4VMSpoZy1Xt2caW_BxOfEA-x-QhnMsbzXned6AUA@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-b072b061-91a6-40d3-a8a0-baf39cb7c33c@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181220_124048_436973_28DE1E6B 
X-CRM114-Status: GOOD (  14.79  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, jason@lakedaemon.net, marc.zyngier@arm.com,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com, tglx@linutronix.de,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 17 Dec 2018 01:37:58 PST (-0800), anup@brainfault.org wrote:
> On Fri, Nov 30, 2018 at 1:32 PM Anup Patel <anup@brainfault.org> wrote:
>>
>> This patchset primarily adds IRQ affinity support in PLIC driver and
>> other improvements.
>>
>> The patchset gives mechanism for explicitly routing external interrupts to
>> particular CPUs using smp_affinity attribute of each Linux IRQs. Also, we
>> can now use IRQ balancer from kernel-space or user-space.
>>
>> The patchset is tested on QEMU virt machine. It is based on Linux-4.20-rc4
>> and can be found at riscv_plic_irq_affinity_v3 branch of:
>> https://github.com/avpatel/linux.git
>>
>> Changes since v2:
>>  - Fixed incorrect address of enable registers using sizeof(u32) in PATCH1
>>  - Retained comment about need for locking in PATCH1
>>  - Split PATCH2 into two patches
>>  - Split PATCH3 into two patches
>>  - Minor fix in commit description of PATCH4
>>
>> Changes since v1:
>>  - Removed few whitspace changes from PATCH1
>>  - Keep use of DEFINE_PER_CPU() as it is
>>
>> Anup Patel (6):
>>   irqchip: sifive-plic: Pre-compute context hart base and enable base
>>   irqchip: sifive-plic: Add struct plic_hw for global PLIC HW details
>>   irqchip: sifive-plic: More flexible plic_irq_toggle()
>>   irqchip: sifive-plic: Add warning in plic_init() if handler already
>>     present
>>   irqchip: sifive-plic: Differentiate between PLIC handler and context
>>   irqchip: sifive-plic: Implement irq_set_affinity() for SMP host
>>
>>  drivers/irqchip/irq-sifive-plic.c | 143 +++++++++++++++++++-----------
>>  1 file changed, 90 insertions(+), 53 deletions(-)
>>
>> --
>> 2.17.1
>>
>
> Any comments on this series?

I also haven't had a chance to look at these yet.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
