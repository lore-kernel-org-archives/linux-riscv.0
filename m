Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BC2FF8875
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 11:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M9WklwjUm+3S/KCnHVlSZzFAWvQYj6RchA4pY19m/eg=; b=gRn0Iv+hVjrL29
	2MbjCVIYBM+unvFttUGxIMeB8hyfFIR+hHgEKXLObXOyPANWzStG7qlFilVw1xk7NqvRphXnbndei
	9uW3cdr1u3gQviJUoqZTpM1IEzzxoSjc03Ibjpw9vn0gWe2Y2ptjzKQaEovv2cZjU3DkvlPLpSOLH
	6B/h/2ZkDQ3Sw60Xe3Ej6emBStLTJmu0GuGChsG6875ZimZ6w+zbEl6UhppMScPThJTLVnJiJqiss
	kzC8sOK2KKnTpNiEr+Y3axE0p0zj33L/yNoUxJ+MgEX03Tu3p4SJUyfp27E+5wa/FnxiTw1G1m8mG
	B5XOeHhTnBRRbQN12dPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3MO-00000003XO3-07Ny;
	Wed, 29 Apr 2026 11:45:44 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3MK-00000003XMf-3m9P
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 11:45:42 +0000
X-QQ-mid: zesmtpgz7t1777463047t1a87f9a7
X-QQ-Originating-IP: 5HsW6SeMFE8TZ44kfqVi/P/ReHORJ1BN4dByUTdCtXw=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 19:44:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10582357409210983648
EX-QQ-RecipientCnt: 10
X-QQ-CSender: troy.mitchell@linux.spacemit.com
Mime-Version: 1.0
Date: Wed, 29 Apr 2026 19:44:13 +0800
Message-Id: <DI5M2DY419FY.7DUCXZDHR22V@linux.dev>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <spacemit@lists.linux.dev>, "Troy Mitchell" <troy.mitchell@linux.dev>,
 "Aurelien Jarno" <aurelien@aurel32.net>
Subject: Re: [PATCH v3] riscv: disable local interrupts and stop other CPUs
 before reboot/shutdown
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260330-v7-0-rc1-rv-dis-int-before-restart-v3-1-5a0577fcd136@linux.spacemit.com>
In-Reply-To: <20260330-v7-0-rc1-rv-dis-int-before-restart-v3-1-5a0577fcd136@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NzOHSugmTg7XZp9EJRpsafMnEkQmDM3bzk/B9XMtnl3I/W2rl25S6UK1
	91EbtlhgHpMspx5la4fO2tkz5eSlPMgC4rUhbXFztSAasibp13GnM1iDqxo8NSKD/qmkaVH
	mg1t3ZJb3fe1OIDXcih9GTd943HVS4hRdifkHXVPdTyV42FDsWi/d2l/Ml1jzDdo9pkmT6O
	pvCOIdiphUGTtvbiZbaSAf6Bv149qqK+OQxO6fBJ0QRbb1lcbRHLp0pY/frT3ZEwtclXHg5
	pO685gwjVSIqBqI+sC5PZxHALK9tNutsy5l/xCxQ2cCHZrbAW/EVpjk6KHbss2TPP6d4/a5
	LkejbHmKmXkOQJ5/ejEfV2ERTPMkgJ7Tmz8tB5GuubkvE4t87fxGmGrcG5aTHTpO/FQI18x
	Yc9GmBogXLUFe4yfNm/dTsjrk0oX7WzJX8mtsjSy1c7T/3J8TnqJQJ5hYUMuCVzu3OJcx0m
	fkHpsx0zVQluVZ0xOHADeT7TBCzrlhMofoxHwlvoo7qx+s78/QG6PRv/TOxHsjFQ8rbQoP4
	MiGatBjaymIbu2sOyofbyLuYhKzz3Vv218l5jaCuXmT7uXP+O/hPoHbnFlelQNfcOZakZe1
	n4sGZwfj+2InTPArjlCFiJXdtuqCicafnx6C1eP6ssuFPjbYjLz5Q87kEhALyPAQnbruoPA
	TYTX7GIFfyNOAGRfoeDX3RR/+j+Qnftiwl8P854q2KTGNSuBX0SNkM2gu+8jAVN5sZ0LTOi
	Ii1Vxd/UqimxOLO3jU0ykIVIxJbec7VVQ+y6LbRDiYzuxg7rGe2GjOK3NGdiNSBPwOZeib8
	/e/SM0QMBposglB6Bxdd00+/xv0rKhE/y3f+byjkOxpfIIc6rG+fQ0mQaSY8HWYuaQ5vXbO
	JP9RzveJbtqR/sFdBqiN4nDDiFln2xjns+eVqAsnuDy2ip4HMDjiZTrqdg41aYp/k/udDYE
	1X7zi2wuthXJ+b6A5VTKpeYxZ3seQQAFbhYLBoxPTDG98BBOybEXn0Iv3MG8BSFSA7exJPD
	Ws+7h41dM6hFpWoT1vtOEPqPCOw5Mg/RATGvprmw==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_044541_494856_401BAFC1 
X-CRM114-Status: GOOD (  12.98  )
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

Hi all,

On Mon Mar 30, 2026 at 5:58 PM CST, Troy Mitchell wrote:
> From: Troy Mitchell <troy.mitchell@linux.dev>
>
> Currently, the RISC-V implementation of machine_restart(), machine_halt(),
> and machine_power_off() invokes the kernel teardown chains (e.g.,
> do_kernel_restart()) with local interrupts enabled and other CPUs still
> running.
>
> This implementation fails to provide a deterministic execution environment
> for registered handlers in the restart or power-off notifier chains. These
> chains are intended to be executed in a strict atomic and single-threaded
> context.
>
> Specifically, under CONFIG_PREEMPT_RCU, rcu_read_lock() does not increment
> the preempt_count. If local interrupts remain enabled, the environment
> is not guaranteed to be atomic. This can lead to a context misidentification
> within generic kernel teardown code, causing it to incorrectly enter
> non-atomic paths (such as attempting to acquire sleeping locks), which
> results in fatal "scheduling while atomic" splats or system hangs.
>
> Additionally, stopping other CPUs ensures the primary CPU has exclusive
> access to the hardware state during the final teardown phase, preventing
> unpredictable interference from other active cores.
>
> Align RISC-V with other major architectures by disabling local interrupts
> and stopping other CPUs at the beginning of the shutdown sequences. This
> guarantees the architectural expectations of the kernel's restart and
> power-off handlers are met.
>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Gentle ping on this patch. Is there anything I should change or any
concerns with the approach?

                          - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
