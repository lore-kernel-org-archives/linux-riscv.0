Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C87E77182
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 10:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YNsfcs+SL3XiAg+Q5QQv/SEkCe0WNlrHGfehx9EOecw=; b=HfP0dD7Lr87PQW
	UAwhi8v7saz3GcQz0Rl6u0UW1Ypwr0PRo1Hqf5Uumm7cyKWcChfKfOULyA8GBETAKCeSN+WYA/wby
	H7g0XzYzY0oxTTdHdsZCQtF2g5oVAAG0zG7naBZQFlECq3CgfVU1pB0IIDXwvKCYQ3oywfUWRoyeX
	9NKsqtvXFotlWVBZ8Y3JfnohKsUMELS0sfGvKWMe4CmbtKiyQhZ+CnSJMgsaLaxZXtb6N93NCi8uf
	QbUeCEZZEtbH/vJU8YqG96t1voCxaLBt4Fj9CHvlRmhtVTETJ7P7Iewo7nNRxIMYBfNfHMTRLJNe7
	u3Vv3vNdHQiVCGEsUTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxJk-0000000B6ts-1pmY;
	Tue, 10 Dec 2024 10:18:12 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxFK-0000000B5eM-25ul
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 10:13:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96B671C0002;
	Tue, 10 Dec 2024 10:13:32 +0000 (UTC)
Message-ID: <ae6b601b-3f6c-4412-b08a-6ccf97ce826a@ghiti.fr>
Date: Tue, 10 Dec 2024 11:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
From: Alexandre Ghiti <alex@ghiti.fr>
Subject: Fixes for 6.13-rc3
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_021338_686144_6C417C76 
X-CRM114-Status: UNSURE (   5.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

Please find below the list of fixes that I collected and tested 
(https://github.com/linux-riscv/linux-riscv/pull/98/checks) for 6.13-rc3:

* "riscv: module: remove relocation_head rel_entry member allocation" 
(https://lore.kernel.org/linux-riscv/20241128081636.3620468-1-cleger@rivosinc.com/)
* "riscv: Fix sleeping in invalid context in die()" 
(https://lore.kernel.org/linux-riscv/20241118091333.1185288-1-namcao@linutronix.de/)
* "riscv: mm: Do not call pmd dtor on vmemmap page table teardown" 
(https://lore.kernel.org/linux-riscv/20241120131203.1859787-1-bjorn@kernel.org/)
* "riscv: kprobes: Fix incorrect address calculation" 
(https://lore.kernel.org/linux-riscv/20241119111056.2554419-1-namcao@linutronix.de/)
* "drivers/perf: riscv: Fix Platform firmware event data" 
(https://lore.kernel.org/linux-riscv/20241119-pmu_event_info-v1-2-a4f9691421f8@rivosinc.com/) 
=> patch 2 of the series.
* "riscv: Fix IPIs usage in kfence_protect_page()" 
(https://lore.kernel.org/linux-riscv/20241209074125.52322-1-alexghiti@rivosinc.com/T/#u)
* "riscv: Fix wrong usage of __pa() on a fixmap address" 
(https://lore.kernel.org/linux-riscv/20241209074508.53037-1-alexghiti@rivosinc.com/T/#u)
* "riscv: Fixup boot failure when CONFIG_DEBUG_RT_MUTEXES=y" 
(https://lore.kernel.org/linux-riscv/20241130153310.3349484-1-guoren@kernel.org/) 
=> This one is very important as it fixes boot failures for platforms 
that do not support zabha nor ziccrse.
* "cpuidle: riscv-sbi: fix device node release in early exit of 
for_each_possible_cpu" 
(https://lore.kernel.org/linux-riscv/CAK9=C2W3uxt9aO7NbCfzi6zdp14W_MXvOn2MtGqfzwX89J5aUQ@mail.gmail.com/T/#t)
* "riscv/ptrace: add new regset to access original a0 register" 
(https://lore.kernel.org/linux-riscv/20241203-riscv-new-regset-v2-1-d37da8c0cba6@coelacanthus.name/) 
=> patch 1 of the series.

For information, I have the 2 untested following fixes for the next 
release candidate:

* "riscv: selftests: Fix warnings pointer masking test" 
(https://lore.kernel.org/linux-riscv/20241206-fix_warnings_pointer_masking_tests-v5-1-ed566c2f27e8@rivosinc.com/
* "riscv: mm: Fix the out of bound issue of vmemmap address" 
(https://lore.kernel.org/linux-riscv/20241209122617.53341-1-luxu.kernel@bytedance.com/T/#u)

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
