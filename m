Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4EFC43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 16:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oUHHllqAiX5LZVa5etudobIvHEiqLLLZWCuTACGoBEA=; b=s/ypbufYraYFwk
	pScCe/lZPPRMpU2De4eXBksF6uXgzCGfA8cVfOfTKKYANEvsSx95QFfU6eHYoQlJeOFDbsdhyA+GG
	xj0r8jvh/dj+vRi1yi6sjMkC5JgstJt3Xa86LtrKITugsE44wlPKqX/P22zJDT1fz7+T1e4ZO4KmR
	16jGHNSzkIGIM2yuotDieOoasCj328J5MVsiIJcAkNczdaxa0sljg7F6VAmQfS8xUOInyuZKOVg/q
	vaV0M/ai8Of/huwZSXPsnouxPhoZrE8slpwDefh5Tror8/EwfAwFACC9eV79F764mJr2JUuFUMArQ
	vWNzOhFovig4JuN/BZAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o98Jg-00BVjU-6C; Wed, 06 Jul 2022 16:55:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o98Ep-00BTnl-6A; Wed, 06 Jul 2022 16:50:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id ABD70B81E30;
	Wed,  6 Jul 2022 16:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578ABC3411C;
	Wed,  6 Jul 2022 16:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657126252;
	bh=Qhe6YJjjuGaw4SCk5kBt/VmMuXdkkft5r/z+N5hyfZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q77wZHNal7Sx7mIhW3VKzUdCKrVkn+6IEDcbjHiCOXXg1G10yJfuLKUyQrsd9eHNx
	 3oQxoKBIYI6LA5/qGYUkvxPtgcqE+XjXpUTjDCNtYFmzFarRK+ebYYvOwAV9N0/eEh
	 BDU1Y1GykrmT8cewiKaHKnMscaWZ+n0yDJtohINMuy3+HwTcj+iEEcmXnLFOeKcko4
	 wqPe6TlH7a70HLOIyVkwNTkgKjEf9CHcliO2w/C2EQTq3OTBC37evvKo/Vcv3sXjZO
	 Vkl8SlPxNgL0YZhWmYuxpw6yuVrLSDQHe0OhiSOgecreOVyo8hTb3STmrlSFFPH0yP
	 VMNIXLr0QWjqQ==
From: Will Deacon <will@kernel.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	=?UTF-8?q?Jo=C3=A3o=20M=C3=A1rio=20Domingos?= <joao.mario@tecnico.ulisboa.pt>,
	linux@yadro.com,
	Namhyung Kim <namhyung@kernel.org>,
	linux-riscv@lists.infradead.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Genevieve Chan <genevieve.chan@starfivetech.com>,
	Nikita Shubin <n.shubin@yadro.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v5 0/4] RISC-V: Create unique identification for SoC PMU
Date: Wed,  6 Jul 2022 17:50:33 +0100
Message-Id: <165710198557.2545727.12369986485829448520.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220628114625.166665-1-nikita.shubin@maquefel.me>
References: <20220628114625.166665-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_095055_474033_6D3AD779 
X-CRM114-Status: UNSURE (   9.23  )
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

On Tue, 28 Jun 2022 14:45:54 +0300, Nikita Shubin wrote:
> From: Nikita Shubin <n.shubin@yadro.com>
> 
> From: Nikita Shubin <n.shubin@yadro.com>
> 
> This series aims to provide matching vendor SoC with corresponded JSON bindings.
> 
> The ID string is proposed to be in form of MVENDORID-MARCHID-MIMPID, for example
> for Sifive Unmatched the corresponding string will be:
> 
> [...]

Applied first patch only to will (for-next/perf), thanks!

[1/4] drivers/perf: riscv_pmu_sbi: perf format
      https://git.kernel.org/will/c/26fabd6d2ffc

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
