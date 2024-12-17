Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D36E77184
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 13:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ke7cGELMFrwg2VW1xVcNgOga9KCpEj6IS7FEUhW4MWk=; b=3sWDH8mF/folImJlLjC5zxr6TF
	pqjw2xSkviWWITWsibKn3q1E8/iWT9Je5kXZH0av0XXIIkh2NrzMQz0DtBi5UML2Ys4Me1WGDLbO6
	BJaxU+/TlSOPEUJ5nYBM6WhwFtmAOPW45Kp0sfnypyceZZtkVijiP4yUxBGAaw3oUgLfaW5Eakz03
	bf1eJqWe50mLfSDT6zFHZyNTtyK14tOFgm/NNx4CVDCOpcPPKY2h49sj9Sw+mBZoa3MEsQr4ZT4cZ
	Vnr3e81HU3HcTs6qksYFmLddJ++xSuUqWwmKfDtoMdVhj+P1rv81yvj4WEdIbTHRIuH3fLr6o9UI1
	gOFAPZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNY3D-0000000DeVZ-33Db;
	Tue, 17 Dec 2024 13:55:51 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNY2P-0000000DeGS-30Fg
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 13:55:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C26CBE0006;
	Tue, 17 Dec 2024 13:54:56 +0000 (UTC)
Message-ID: <e20d9bfa-9efb-462b-b1fe-bd9a77f9efd5@ghiti.fr>
Date: Tue, 17 Dec 2024 14:54:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fixes for 6.13-rc3
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <ae6b601b-3f6c-4412-b08a-6ccf97ce826a@ghiti.fr>
In-Reply-To: <ae6b601b-3f6c-4412-b08a-6ccf97ce826a@ghiti.fr>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_055502_045388_0A571463 
X-CRM114-Status: GOOD (  13.91  )
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

Hi Palmer,

Please find below the list of fixes that I collected and tested 
(https://github.com/linux-riscv/linux-riscv/pull/126/checks) for 6.13-rc4:

* "riscv: module: remove relocation_head rel_entry member allocation" 
(https://lore.kernel.org/linux-riscv/20241128081636.3620468-1-cleger@rivosinc.com/)
* "riscv: Fix sleeping in invalid context in die()" 
(https://lore.kernel.org/linux-riscv/20241118091333.1185288-1-namcao@linutronix.de/) 

* "riscv: kprobes: Fix incorrect address calculation" 
(https://lore.kernel.org/linux-riscv/20241119111056.2554419-1-namcao@linutronix.de/)
* "cpuidle: riscv-sbi: fix device node release in early exit of 
for_each_possible_cpu" 
(https://lore.kernel.org/linux-riscv/CAK9=C2W3uxt9aO7NbCfzi6zdp14W_MXvOn2MtGqfzwX89J5aUQ@mail.gmail.com/T/#t)
* "riscv/ptrace: add new regset to access original a0 register" 
(https://lore.kernel.org/linux-riscv/20241203-riscv-new-regset-v2-1-d37da8c0cba6@coelacanthus.name/) 
=> patch 1 of the series.
* "riscv: selftests: Fix warnings pointer masking test" 
(https://lore.kernel.org/linux-riscv/20241211-fix_warnings_pointer_masking_tests-v6-1-c7ae708fbd2f@rivosinc.com/)
* "riscv: mm: Fix the out of bound issue of vmemmap address" 
(https://lore.kernel.org/linux-riscv/87r06h3stk.fsf@all.your.base.are.belong.to.us/)
* "SBI PMU event related fixes" 
(https://lore.kernel.org/linux-riscv/20241212-pmu_event_fixes_v2-v2-3-813e8a4f5962@rivosinc.com/)
* "riscv: qspinlock: Fixup _Q_PENDING_LOOPS definition" 
(https://lore.kernel.org/linux-riscv/20241215135252.201983-1-guoren@kernel.org/)

For information, I have the following fixes for the next release 
candidate that need review and testing:

* "riscv: stacktrace: fix backtracing through exceptions" 
(https://lore.kernel.org/linux-riscv/20241209155714.1239665-1-cleger@rivosinc.com/)
* "riscv: signal: fix the size of signal frame" 
(https://lore.kernel.org/linux-riscv/20241210142353.6457-1-yongxuan.wang@sifive.com/)

Thanks,

Alex

On 10/12/2024 11:13, Alexandre Ghiti wrote:
> Hi Palmer,
>
> Please find below the list of fixes that I collected and tested 
> (https://github.com/linux-riscv/linux-riscv/pull/98/checks) for 6.13-rc3:
>
> * "riscv: module: remove relocation_head rel_entry member allocation" 
> (https://lore.kernel.org/linux-riscv/20241128081636.3620468-1-cleger@rivosinc.com/)
> * "riscv: Fix sleeping in invalid context in die()" 
> (https://lore.kernel.org/linux-riscv/20241118091333.1185288-1-namcao@linutronix.de/)
> * "riscv: mm: Do not call pmd dtor on vmemmap page table teardown" 
> (https://lore.kernel.org/linux-riscv/20241120131203.1859787-1-bjorn@kernel.org/) 
>
> * "riscv: kprobes: Fix incorrect address calculation" 
> (https://lore.kernel.org/linux-riscv/20241119111056.2554419-1-namcao@linutronix.de/)
> * "drivers/perf: riscv: Fix Platform firmware event data" 
> (https://lore.kernel.org/linux-riscv/20241119-pmu_event_info-v1-2-a4f9691421f8@rivosinc.com/) 
> => patch 2 of the series.
> * "riscv: Fix IPIs usage in kfence_protect_page()" 
> (https://lore.kernel.org/linux-riscv/20241209074125.52322-1-alexghiti@rivosinc.com/T/#u)
> * "riscv: Fix wrong usage of __pa() on a fixmap address" 
> (https://lore.kernel.org/linux-riscv/20241209074508.53037-1-alexghiti@rivosinc.com/T/#u)
> * "riscv: Fixup boot failure when CONFIG_DEBUG_RT_MUTEXES=y" 
> (https://lore.kernel.org/linux-riscv/20241130153310.3349484-1-guoren@kernel.org/) 
> => This one is very important as it fixes boot failures for platforms 
> that do not support zabha nor ziccrse.
> * "cpuidle: riscv-sbi: fix device node release in early exit of 
> for_each_possible_cpu" 
> (https://lore.kernel.org/linux-riscv/CAK9=C2W3uxt9aO7NbCfzi6zdp14W_MXvOn2MtGqfzwX89J5aUQ@mail.gmail.com/T/#t)
> * "riscv/ptrace: add new regset to access original a0 register" 
> (https://lore.kernel.org/linux-riscv/20241203-riscv-new-regset-v2-1-d37da8c0cba6@coelacanthus.name/) 
> => patch 1 of the series.
>
> For information, I have the 2 untested following fixes for the next 
> release candidate:
>
> * "riscv: selftests: Fix warnings pointer masking test" 
> (https://lore.kernel.org/linux-riscv/20241206-fix_warnings_pointer_masking_tests-v5-1-ed566c2f27e8@rivosinc.com/
> * "riscv: mm: Fix the out of bound issue of vmemmap address" 
> (https://lore.kernel.org/linux-riscv/20241209122617.53341-1-luxu.kernel@bytedance.com/T/#u)
>
> Thanks,
>
> Alex
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
