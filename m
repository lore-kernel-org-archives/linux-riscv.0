Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C89CCDE008
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 11:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4UP9ral+n9yTTXWAEKO8ix7MNeCb+AH8BY8MVLYhVe0=; b=K3Py8N3TzChzxE
	5cWDerdFdmA0sbcdu4p9bVE4ajzV+GT7SZWJnqDvzAVQljfncPXWhN4Rx7PB+f8pR/kYefpGuGSPR
	k9zk0hqjjyL3/B1gJvuhhyLuE6EJA6/dDfKyE/1PqVQCN0eR/NcLKlHyNE/ogjkQRy1VAsHOmW4zZ
	RQDZ8lT/8TTzggwlbrwDuBO39Ub0TbKesc9cAsUFa8wfMOzg5n1+MtkhFt9RFI3d5bjBvEa+bjP+o
	UZ1Dx8YKs9oRjlW3QQyYaScOwFXTtTKO/qAPzz0N9JgU7H+UEXlxfjegB8YQxBP2q8rzzwtuh/8Um
	bsUwa1l3foGcjMOaGP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4YB-0000000BByz-1hD4;
	Fri, 26 Jun 2026 11:16:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4YA-0000000BByN-14Sn;
	Fri, 26 Jun 2026 11:16:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C801643FB0;
	Fri, 26 Jun 2026 11:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97CA1F000E9;
	Fri, 26 Jun 2026 11:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782472605;
	bh=7dXhxtAlDokcF9pKghUWMyq1InGndCuu3bVRMCLzLqI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=MpLSaVIHlc/UHVTV2d/ri77mCl2Kg7m+1iuMibstcEmSom97yEsJVVahr92hLkku6
	 wplJpWldvRMeurbvoIfXqLKpThnKq4j/RcHvV8RX7l0sfMkIEQuiZFPpZiaiNMp/f8
	 O9O43J9vD6RQAYcmtG4/8MIfCHJt9bmkFyMmgcSuT0FHG6fMpArlKTOvHa0rJ3kE7d
	 gLe1vQ88k6YeXf02W0e737C0VqtFKj4dWrqjLXkKSgKP8+T4Ug1gMa/lo4u4+rb7Dc
	 e9wUmg/zUD/MdUoKRwEwgkcriKutiabksBIjvorRjbh9gKcgslGUXXUOh16VNT+Rk1
	 SS9rd7qaam6jA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0BC639389EE;
	Fri, 26 Jun 2026 11:16:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] KVM/riscv changes for 7.2
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178247259228.3816447.10031168625434105729.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 11:16:32 +0000
References: <CAAhSdy0WTa-jDxg0cQxwqfGM+Det+WxM-ELV3F2ktrcbw8g7Bw@mail.gmail.com>
In-Reply-To: <CAAhSdy0WTa-jDxg0cQxwqfGM+Det+WxM-ELV3F2ktrcbw8g7Bw@mail.gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, pbonzini@redhat.com, palmer@dabbelt.com,
 pjw@kernel.org, andrew.jones@oss.qualcomm.com, atish.patra@linux.dev,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
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

Hello:

This pull request was applied to riscv/linux.git (for-next)
by Paolo Bonzini <pbonzini@redhat.com>:

On Sun, 14 Jun 2026 15:19:53 +0530 you wrote:
> Hi Paolo,
> 
> We have the following KVM RISC-V changes for 7.2:
> 1) Batch G-stage TLB flushes for GPA range based page table updates
> 2) Convert HGEI line management to fully per-HART
> 3) Speed up dirty logging write faults using MMU rwlock and atomic
>     PTE updates for permission-only changes
> 4) Use flexible array for APLIC IRQ state
> 5) FWFT fixes for missing CSR dirty marking and stale feature
>     exposure to Guest/VM
> 6) Fix logging enable check on a memslot by using
>     kvm_slot_dirty_track_enabled()
> 7) Fixes to avoid skipping valid pages in kvm_riscv_gstage_wp_range()
>     and kvm_riscv_gstage_unmap_range()
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] KVM/riscv changes for 7.2
    https://git.kernel.org/riscv/c/c6f1b611c66f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
