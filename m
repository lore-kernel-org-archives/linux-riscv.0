Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D32CAC592
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 13:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y7hqVHPT2R9Qc+QBcA6sdGqS1iNLqg+ATaVjCtGvYDw=; b=qa+5pBB0uaUF94
	tuinVxA0corrPkWOXhi+6hMmVdgDfw/ES7yxoBsw8hTnJBS/n9prxvvkQCkHOhrYTYfIr1tjQSx2+
	qGrZ5KUGX2fUc/+Jq3JbjVPJPGOneCIL1lOx7cj1zA2n6zSPShWVNH8Z8KfQpttw2LuaUeLMZVGdS
	/zEAtdF5hQK0xHVbISsOWxrtSBug1DhFVAsGjZgwetaMB8E2SGPKoZ6MU+saodik5MfKbW+usy8iu
	QBWu1O4iYMqVupW9c+wv8zAWkdZkWr22xnO7rkLR5QFNPL/RRIw50TR4xn1zgifR0gyoDEQUKwcGP
	Ly8evcTnAmc6LG1OeGlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbBA-00000002zQ7-2CJk;
	Fri, 19 Sep 2025 13:29:36 +0000
Received: from forward100a.mail.yandex.net ([2a02:6b8:c0e:500:1:45:d181:d100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbB6-00000002zNL-3N8X
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 13:29:35 +0000
Received: from mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:582e:0:640:200:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id 8DEC8C007F;
	Fri, 19 Sep 2025 16:29:20 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id CTT506cM0Gk0-s8TLlgil;
	Fri, 19 Sep 2025 16:29:19 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cloudbear.ru;
	s=mail; t=1758288559;
	bh=EFeeSu4GhJq3UlGQ+sl0zXkSLxrNHkuxsapv8WRHun0=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=TAjFB0lhwSVxAj0O+dePRDq+r6l/8hnOOv7Wt3WPW8G7R+6y3lFzG9kIbpglnWdoq
	 jhO7041CyANsjPXg/p2YlBBtwAJF664zYfflN8u0bVd+8u28weu+1a+7M8t2sV4Fy1
	 sa/6/Zg8WUmFF3RMYJbUsfM+A7OUcYI1T7iuBPTM=
Authentication-Results: mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net; dkim=pass header.i=@cloudbear.ru
From: Danil Skrebenkov <danil.skrebenkov@cloudbear.ru>
To: 
Cc: pjw@kernel.org,
	Danil Skrebenkov <danil.skrebenkov@cloudbear.ru>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	WangYuli <wangyuli@uniontech.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: cpu-hotplug fix
Date: Fri, 19 Sep 2025 16:28:46 +0300
Message-ID: <20250919132849.31676-1-danil.skrebenkov@cloudbear.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_062933_396404_CAD842E8 
X-CRM114-Status: GOOD (  10.38  )
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

openSBI v1.7 adds harts checks for ipi operations. Especially it
adds comparison between hmask passed as an argument from linux
and mask of online harts (from openSBI side). If they don't
fit each other the error occurs.

When cpu is offline, cpu_online_mask is explicitly cleared in
__cpu_disable. However, there is no explicit clearing of
mm_cpumask. mm_cpumask is used for rfence operations that
call openSBI RFENCE extension which uses ipi to remote harts.
If hart is offline there may be error if mask of linux is not
as mask of online harts in openSBI.

this patch adds explicit clearing of mm_cpumask for offline hart.

Signed-off-by: Danil Skrebenkov <danil.skrebenkov@cloudbear.ru>
---
 arch/riscv/kernel/cpu-hotplug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
index a1e38ecfc8be..3f50d3dd76c6 100644
--- a/arch/riscv/kernel/cpu-hotplug.c
+++ b/arch/riscv/kernel/cpu-hotplug.c
@@ -54,6 +54,7 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 
 	pr_notice("CPU%u: off\n", cpu);
 
+	clear_tasks_mm_cpumask(cpu);
 	/* Verify from the firmware if the cpu is really stopped*/
 	if (cpu_ops->cpu_is_stopped)
 		ret = cpu_ops->cpu_is_stopped(cpu);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
