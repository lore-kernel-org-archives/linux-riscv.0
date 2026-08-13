Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A68C5B572
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 13:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Cc:To:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YQ++LCgnCUd+c3Y5jRejnUPIhCIkeUKgiG9Y7Z5sAvk=; b=FsuFrWn9PSrNuU
	fzOsZMbwO36/DNn+FTZVW5Qb7vG0Mfn4hAH0oapNgfoEJa8M3yRCAM48jDukIxJj8ULoYbxEC6/4O
	GhV613asQDMe7lanupuOD2LEtYXJERGImEnoYCKAophRKjwAGk3VUNmIlIfL3WN0sQkc78LNytuXo
	gtPLTdT3AcuYNQ8MqftD9W6vX3RbTTowK1UOtZIddWl6MpMoYe+F46v8+NFkara3tRU2MsiN9GsO1
	fO7ExNucx3U1j5TKvHlqkS6PM8Q5IIOFAnO4+JmjG7PS3C+lZror1Vm6LB53RlQOlMgnTuqWK5raS
	1Qr2d6Ut8RHLSy1Sh0mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuV6f-00000000hT4-0vLi;
	Thu, 13 Aug 2026 13:04:25 +0000
Received: from va-1-111.ptr.blmpb.com ([209.127.230.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuV6c-00000000hRW-08mV
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 13:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1786626252; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=txWPfwp/yXcKXVgDypRHr7kZQ5w0h6AeQhf9mro3TrQ=;
 b=IaE4F1+veb2baK0gq5RkXAXZH6fXz7bLXafDVhOH/WsTob2e3XfIrBGoG1sC4DnErG3Zhj
 mJ7FV2rbL7ECKIqM7e0ThB/cMOKBBlV5iWnTvIvDmNp219YIVmRTKqaEovCgq7LEC8AGl/
 F5d2TkwXAsamfwI4FwnxSkAyUTeU0TSdR/AaxS7m3eeIBy9dm2XBmP0b60T+sT9GDn7ZRI
 eFWEz/LHzSp6uL01cRD9z5K1kjmLFJYzqVNBlu+7U5M0N8pHjRSpecFEyxo5VVC7UbDviI
 Tmerv7JNZvai2psxAkMAczg1JxBYy0WrDsmi2eqq7IEZnkBMpazfmQaYYqHUQA==
From: "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH 0/2] riscv: Fix cpu hotplug warnings
Date: Thu, 13 Aug 2026 21:03:55 +0800
Message-Id: <20260813130357.1144775-1-qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a7dc0ca+e81244+lists.infradead.org+qirui.001@bytedance.com>
To: <palmer@dabbelt.com>
Cc: <pjw@kernel.org>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	"Rui Qi" <qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.20.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_060422_150742_A25D0D09 
X-CRM114-Status: UNSURE (   5.95  )
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

This series fixes two issues with CPU hotplug on RISC-V that cause
spurious warnings when offlining CPUs.

Patch 1 fixes the immediate regression from commit 2b2b207e1162
("riscv: cpu_ops: Change return value type of cpu_is_stopped() to bool")
where the inverted warning condition triggers even when the
cpu_is_stopped callback is absent.

Patch 2 addresses the underlying race between the dying CPU and the
controlling CPU: the AP reports itself dead before it actually invokes
cpu_stop(), so the BP can observe the SBI HSM state as STARTED rather
than STOPPED. This was previously masked by the old semantics where
SBI_HSM_STATE_STARTED (0) was treated as success. The fix adds polling
with read_poll_timeout(), following the same approach as arm64's
cpu_psci_cpu_kill().

Rui Qi (2):
  riscv: Fix spurious warning when cpu_is_stopped callback is absent
  riscv: Poll for SBI_HSM_STATE_STOPPED in sbi_cpu_is_stopped()

 arch/riscv/kernel/cpu-hotplug.c |  6 +-----
 arch/riscv/kernel/cpu_ops_sbi.c | 13 ++++++++++---
 2 files changed, 11 insertions(+), 8 deletions(-)

--
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
