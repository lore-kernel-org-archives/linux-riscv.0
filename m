Return-Path: <SRS0=yHzA=EA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8BAC388F7
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Oct 2020 12:38:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28F0720853
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Oct 2020 12:38:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m7uaUbTk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Io5OkQe1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28F0720853
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ry/uRTJfNeVYmFgirhE794YdndFlHxDliYoFDDjTep0=; b=m7uaUbTkG69K8DaNMSyU0zL2Go
	dWNhGeWhTv4eK2rDi4qlZBn8NjAD72E0UUzGyDyQIYqiUHpZ+zLDkyd+K+zXXBulNfcWU/s9niVBm
	AKHcsFSnUrhIp1WLxsqjB/kBUouJ6jIptXmKeh3Hnm+WLObGiwxyplUpNGnkxZOJCxs8Y21R6bjsj
	VtX+NFu10CzJX5iTBmZvwn6tGz4ME8q543pxFAnNva2D9ePypG9a67zXNJdtjmL0Yi3gSGI37KEnW
	dUE/x9CwnUGyrNnVnReeEzgDVB0vSLRqEi9uLujjEpUeA2f9MTEGKCT96ZktsB37xlCiT7Cvzuaxo
	Xnsfas1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWfHj-0005lW-6R; Sun, 25 Oct 2020 12:38:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWfHg-0005l0-I7
 for linux-riscv@lists.infradead.org; Sun, 25 Oct 2020 12:38:05 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE4D320853;
 Sun, 25 Oct 2020 12:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603629481;
 bh=u9aO31NgT1SvFDW2GvB0R9LiOmuKo0V5PSlXi+W2nu8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Io5OkQe1OQQZAHZzvWPDWH8vgW/Y9GQ3GwZazyVF8EcOU4YMcRUllVwjGaE479BVe
 m5cJrsHu1wrrbTXTC0J7KYcGYEXvKSnWtbaeWhhnhMNmMJYMMoO8tMiFkjdAXV42m5
 Ap4xVLNHHMK1yLlQN4sA3EO6CFWsOAE38dRf+wn4=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kWfHb-0043br-GQ; Sun, 25 Oct 2020 12:37:59 +0000
From: Marc Zyngier <maz@kernel.org>
To: jason@lakedaemon.net, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 Greentime Hu <greentime.hu@sifive.com>, linux-kernel@vger.kernel.org,
 tglx@linutronix.de
Subject: Re: [PATCH] irqchip/sifive-plic: Fix broken irq_set_affinity()
 callback
Date: Sun, 25 Oct 2020 12:37:51 +0000
Message-Id: <160362942369.263990.3256848447079854839.b4-ty@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020081532.2377-1-greentime.hu@sifive.com>
References: <20201020081532.2377-1-greentime.hu@sifive.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jason@lakedaemon.net, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com, greentime.hu@sifive.com,
 linux-kernel@vger.kernel.org, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201025_083804_722353_4AD3D3E6 
X-CRM114-Status: GOOD (  11.68  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

On Tue, 20 Oct 2020 16:15:32 +0800, Greentime Hu wrote:
> It will always enable the interrupt after calling plic_set_affinity()
> however it should set to it previous setting. Staying disabled or enabled.
> 
> This patch can also fix this pwm hang issue in Unleashed board.
> 
> [  919.015783] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [  919.020922] rcu:     0-...0: (0 ticks this GP)
> idle=7d2/1/0x4000000000000002 softirq=1424/1424 fqs=105807
> [  919.030295]  (detected by 1, t=225825 jiffies, g=1561, q=3496)
> [  919.036109] Task dump for CPU 0:
> [  919.039321] kworker/0:1     R  running task        0    30      2 0x00000008
> [  919.046359] Workqueue: events set_brightness_delayed
> [  919.051302] Call Trace:
> [  919.053738] [<ffffffe000930d92>] __schedule+0x194/0x4de
> [  982.035783] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [  982.040923] rcu:     0-...0: (0 ticks this GP)
> idle=7d2/1/0x4000000000000002 softirq=1424/1424 fqs=113325
> [  982.050294]  (detected by 1, t=241580 jiffies, g=1561, q=3509)
> [  982.056108] Task dump for CPU 0:
> [  982.059321] kworker/0:1     R  running task        0    30      2 0x00000008
> [  982.066359] Workqueue: events set_brightness_delayed
> [  982.071302] Call Trace:
> [  982.073739] [<ffffffe000930d92>] __schedule+0x194/0x4de
> [..]

Applied to irq/irqchip-next, with some commit message adjustments.

[1/1] irqchip/sifive-plic: Fix broken irq_set_affinity() callback
      commit: a7480c5d725c4ecfc627e70960f249c34f5d13e8

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
