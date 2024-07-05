Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DB3C41513
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 18:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3O263zjR58BWKe8SLSgPwqSyRo+OBPVz3UiILTj7epY=; b=Xy7w+x7Z/RalQa
	ICZ15vzIISwPIxa9ZVzQfHLr70OsYOn0I96/FUgJg332rbYh+E1iwzcwifOLAQVpIOURHzxQ1yB0b
	SCrizkXlIbK/nhiB+L6CD6LJi81WBO4hLs5wN3uLW+fiyt+/C1BPcfgHGupgMIjSVJRLmKZNlCbO8
	kMwOWlHsUzfvxIi7wPrPMoiRUGZlM03QARPDSzJiEfYB7WlEMgEy2AT6k+yzzwFprAE88fQMc5BXH
	jZBCki6SPgeSDW01cucCCD5P3OUbuUkY1ikEaK+ET0nMxqz0LJ/Ad5rIpzhboAMhfKp9Je4LInQpl
	cQnjbrdNmjqQ+/FhqvXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPniB-0000000GdlU-0XD3;
	Fri, 05 Jul 2024 18:31:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPmYf-0000000GWkz-1LBX
	for linux-riscv@bombadil.infradead.org;
	Fri, 05 Jul 2024 17:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:To:From:CC:Subject:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=in/LzK8J9JA83I2h0HE4VR8w3YECSYGz8kwTmF46sLA=; b=oQX3MWgacRh+ly8+EiqnLYeDz0
	GEnCi1vIJCPukTHm2tUgPuAUgkOIcS8YmonmgQcCIIugr/Hers5rhcr9HxRLzdCSX9Ag8BqYALXHO
	ZrOgr/peVAvemvKaXUQ7bq5j0gllPEo4R/Zg5NUIFmqHPqzWid/rHo3pzSezZJaayevHkJ9D+Nz8t
	p3LXP0JyH/M1CZpYgR+NV7KBZu2kWTIE29AGlO6DyOiY0bQi0ufjNUifvtccVeHgfSOL1Ir+n+A4j
	5ehYdwAujOEZJ2IV7riVKda0Ys1n/W5qnvN0pqjQYpOGZHI9Zw+kDbHgPILbSDQkDrgrUwqiC31me
	dMlW6Klg==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPmY1-0000000ALan-3mbJ
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 17:17:15 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1fab03d2f23so13150735ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jul 2024 10:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720199793; x=1720804593; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=in/LzK8J9JA83I2h0HE4VR8w3YECSYGz8kwTmF46sLA=;
        b=LSUSumbF3tVCi7NlpSQv4+cEuZSj9w7jYQKJ0QcQ7Abw2vvhHIRJ2bIOxCWukK8BQZ
         Dm3C+qCQ78GwPVF3WZMiTZ9eglVH0qpZlNfGeCJLDuxhIw8ISHnfPI7pEGW0hzAzUrYZ
         GwkLeEM2W1CgoiCaNZZiiXY9eis2ZI+3wB18dNjLvYBOdulixPMbEuedogngYtVh6Brn
         vy7hAPdmmW/rXRwixDs4YBnDULZrGqY/bRbzOUv+TmuxbjoUiU4ybrvnoIg0D/vo5IrU
         MkMYWmsrW4lKphLjq/130S2ZWZJLLVxqGc9V5NmrzWe+niKMP51lXDcEKnALMSyk7Uod
         18PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720199793; x=1720804593;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=in/LzK8J9JA83I2h0HE4VR8w3YECSYGz8kwTmF46sLA=;
        b=unZ3PaAe14XXWp62J4C/hr7m5giIxQ+EUjTxmwhsTyoBJ9yOx9Egg0lwRpA70xWi7r
         tcUwdTTt39kb/Pv6XwqrnW4yAhd6rd1TWcyAtzWswfKvvc1VxJjvfHbVwpljsOi61mh8
         fiO2mU80lX2kbgDRqwaSQ/MKqybClk4AROTdsqxCzfWaRNw4oXKFsRrleiOf+VQ6Haf1
         TVkdDKOsiLD4i7dJxZVeoZV3v34hTsEqDVjXIWhowu8m+gWSYENlLmBZhKxhmIXf9HxR
         eZX/aj24ZR4xZ/CVDGkkZpmlzy0ERDNOvqYbFB80dkuUmqFVrgG+O5wjjR5ZJDcAuDeU
         n//w==
X-Gm-Message-State: AOJu0YyN1g27t4ZeDPYY8Af+TQuP0glNzj5Nu0mpKVBO/qVQfwfFA1V6
	SzDpXknseAccpNkqOMMDFiZYiKxgHq18g2e3PQpEpXvSvKg7N6S+eZuuXHA1OFbXpSjXsEfTsUM
	a
X-Google-Smtp-Source: AGHT+IFNDYa52WmZ4834HkFwpR9ug9L4dA+Zn5lnn4mA6g/te+8GNddBhZT6WVVzJ8roKd9SC1D8Rg==
X-Received: by 2002:a17:902:c951:b0:1fb:29f3:c7d4 with SMTP id d9443c01a7336-1fb33ee5d27mr36230245ad.51.1720199792856;
        Fri, 05 Jul 2024 10:16:32 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb5962888csm6993355ad.61.2024.07.05.10.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 10:16:32 -0700 (PDT)
Date: Fri, 05 Jul 2024 10:16:32 -0700 (PDT)
X-Google-Original-Date: Fri, 05 Jul 2024 10:16:16 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.10-rc7
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-c0537cb4-d700-4259-889e-c87f011e931b@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_181638_235325_C90C0BC3 
X-CRM114-Status: UNSURE (   8.98  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 22a40d14b572deb80c0648557f4bd502d7e83826:

  Linux 6.10-rc6 (2024-06-30 14:40:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-rc7

for you to fetch changes up to c562ba719df570c986caf0941fea2449150bcbc4:

  riscv: kexec: Avoid deadlock in kexec crash path (2024-07-03 13:11:30 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.10-rc7

* A fix for the CMODX example in therecently added icache flushing
  prctl().
* A fix to the perf driver to avoid corrupting event data on counter
  overflows when external overflow handlers are in use.
* A fix to clear all hardware performance monitor events on boot, to
  avoid dangling events firmware or previously booted kernels from
  triggering spuriously.
* A fix to the perf event probing logic to avoid erroneously reporting
  the presence of unimplemented counters.  This also prevents some
  implemented counters from being reported.
* A build fix for the vector sigreturn selftest on clang.
* A fix to ftrace, which now requires the previously optional index
  argument to ftrace_graph_ret_addr().
* A fix to avoid deadlocking if kexec crash handling triggers in an
  interrupt context.

----------------------------------------------------------------
Atish Patra (1):
      drivers/perf: riscv: Do not update the event data if uptodate

Charlie Jenkins (2):
      documentation: Fix riscv cmodx example
      riscv: selftests: Fix vsetivli args for clang

Palmer Dabbelt (1):
      Merge patch series "Assorted fixes in RISC-V PMU driver"

Puranjay Mohan (1):
      riscv: stacktrace: fix usage of ftrace_graph_ret_addr()

Samuel Holland (2):
      drivers/perf: riscv: Reset the counter to hpmevent mapping while starting cpus
      perf: RISC-V: Check standard event availability

Song Shuai (1):
      riscv: kexec: Avoid deadlock in kexec crash path

 Documentation/arch/riscv/cmodx.rst                 |  4 +-
 arch/riscv/kernel/machine_kexec.c                  | 10 +----
 arch/riscv/kernel/stacktrace.c                     |  3 +-
 arch/riscv/kvm/vcpu_pmu.c                          |  2 +-
 drivers/perf/riscv_pmu.c                           |  2 +-
 drivers/perf/riscv_pmu_sbi.c                       | 44 ++++++++++++++++++++--
 .../testing/selftests/riscv/sigreturn/sigreturn.c  |  2 +-
 7 files changed, 49 insertions(+), 18 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
