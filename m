Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AADCE7AA0
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 21:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qT8OUPk/Hl+nnPkToFqi7WgS/kn2zdsVVWU1JBfrBpQ=; b=bjNXIAUl82wI/1
	M6o+jdT3WYjGL3l4yXGxvdrZ9C0X8t2EBJiL+eNpmQIZH3j5SRs6wh8mSaAsh9PsuCTe2WDmZDGNB
	NSQxan5IXjGLEfOM7P0jBHMf+y+iCOJ9MZrCAzU5qzy0PS/lZXhGLONKquVPZdAyG62KTyT5dRIRJ
	vjMFJsOy7AD4LK+eOFzfS2xeNnjuMilqqP8kkZy/TnrOwipo0sZAnUJaLz/5iZHzoSbIGF8Kiv+Q8
	LvbTqlJavm35NOCEuPIuJhroKFBoamJ/WOdTObzzTJk5nF1Zx8EpqlCTHIx143mm3nqcRwzOqo8Td
	cwB8DeQjQtLTBclHKfKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smKTM-00000009wJw-3MVZ;
	Thu, 05 Sep 2024 21:57:00 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smKSL-00000009wB0-21Xj;
	Thu, 05 Sep 2024 21:56:00 +0000
Date: Thu, 5 Sep 2024 23:55:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1725573355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pEM9gGlpQQWWBHAcLa/gZM6Ih/LFyxbonn9OJ6Yciks=;
	b=srcp3mkFfNQiwhScFEaugg95R8wXB8TiiSHkpQKwQ3kksWfCSQtsp8g9CnX/jDufcrkFKr
	kAFhx8pNkvOD1hqaUGAZekkVPKZ1zzVot9tdQXScni12HyjwyPC8rHX8FyCA71WY2ZBj5u
	rkTr5ZVRabzcSn2/92m0XiXj2D6TwgEVRYVZvwWSb6gV6O5Mm7VlEkFTujh22/hOnsxgpV
	pGqm//FP7MQ4bsXT9YzUypSEeapwj0rjNI8/BsGDADudR83cutagKaAqNgW54jLPNVgCMq
	1Uaf1sSyUC6MteQgALEgJCiYTBfjEtWD8B1gJVc78robSug72qpoRNSxKv1Y7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1725573355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pEM9gGlpQQWWBHAcLa/gZM6Ih/LFyxbonn9OJ6Yciks=;
	b=EMuvnRnB4hX40WSXb2CgBJyDVCOVLLYsx4YOKIqOICX0hejn1lLw5kS3tifCNfHLHv2SG3
	Dmw+e21O3OtNsiAA==
From: Nam Cao <namcao@linutronix.de>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: Re: [PATCH -fixes v2] drivers: perf: Fix smp_processor_id() use in
 preemptible code
Message-ID: <20240905215550.cegYWVFe@linutronix.de>
References: <20240829090034.15777-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829090034.15777-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_145557_681086_9EA9C885 
X-CRM114-Status: UNSURE (   6.62  )
X-CRM114-Notice: Please train this message.
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

On Thu, Aug 29, 2024 at 11:00:34AM +0200, Alexandre Ghiti wrote:
> As reported in [1], the use of smp_processor_id() in
> pmu_sbi_device_probe() must be protected by disabling the preemption, so
> simply use get_cpu()/put_cpu() instead.
> 
> Reported-by: Andrea Parri <parri.andrea@gmail.com>
> Reported-by: Nam Cao <namcao@linutronix.de>
> Closes: https://lore.kernel.org/linux-riscv/20240820074925.ReMKUPP3@linutronix.de/ [1]
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Tested-by: Nam Cao <namcao@linutronix.de>

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
