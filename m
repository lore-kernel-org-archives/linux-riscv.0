Return-Path: <SRS0=YRhX=PZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C023BC433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Nov 2021 16:51:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D38C361056
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Nov 2021 16:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D38C361056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aurel32.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hc6fkaBQpxFsBdRIRnLjurbjWS8Kbf7Uv8VbmxYOHQ=; b=ucNYlHbt+wLVzw
	IQO8Auj7T8lcx5AOjXePD/peFC6SmhNrW3pRGZZk9lnvINf4yXDlg2GFfA13/XCdddwtsmR+oXbOS
	VHauBI0svIr/vNpsiP4bXFpoliolDb/gh/b1yBXpAhFcS6a1lYmfLO7ye/Yrxk1YcAqssQPWU9cL2
	A35DvGRO954RfjzNZNXp/l5XeyTNEbYCP3MfDYek/X+YjnrlIWea2oNkFy+mDRHBt/Za9FkrTyGc2
	vnAKR9QOLhsyJqWAbVeZchBguUbFjhZX/EcYEwU43XdpL4UEhvQGm74NNW8kYcDQ36UVgS55lbc+o
	SgU1Qf9rptzjk8LqRyDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjOtp-00D9Ei-9C; Sat, 06 Nov 2021 16:50:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjKzb-00CzUC-4X
 for linux-riscv@bombadil.infradead.org; Sat, 06 Nov 2021 12:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=V6NxyZAsmQ9Ecs/pOfHmHEdOE4Q/uPjz2C6NqFY+UYY=; b=OZWRatPdjFifdK6rdcyJcJkgMh
 E+flQOFP1ExweVnlK/urDUBpmytnKwvOrvArSptgv0mLshRVeKjJpy4XDXkaRkxq57OUzN4JplTWw
 V3I4bz4BvEloPnOzAMbSzj+xwgR3axLGAdDo2YQ0QnVnW+1C4wvFpd/l5Nrc1BI1upxu0tO1tvEqZ
 IJQHErXTc+AfmobS7ajlUOmF5t/mu5DdAuHJWyJM5c4OOhtruPpxyLuDJS2dOxeS/Ez+jgpRCTSsk
 Nvm02o0b5SpRL4zhbbYyONeJ5OQ1A0iYbfxxifpjA3v2luWOAWnWghZb+Q+2ruvLBuZZN1Ji3/1dF
 t/rUryXQ==;
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjKZM-00EVVd-Li
 for linux-riscv@lists.infradead.org; Sat, 06 Nov 2021 12:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
 ; s=202004.hall;
 h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
 Subject:Content-ID:Content-Description:X-Debbugs-Cc;
 bh=V6NxyZAsmQ9Ecs/pOfHmHEdOE4Q/uPjz2C6NqFY+UYY=; b=VAc4uB9l3Z99oV+SRhcohK8WCK
 yLU7ifHOhQVtJyqpC//LwUfa2TSPwZOnwK8ZB00QmFxeD+ZdAE98LFjWZ5iVu2BquNEM6cL7qL3iN
 P+TduN1admJROGoTrwl9qcNe6Mx4GMxVOKruH14oK4T81bzEu1bGjibYUgDcBST4rV3/ryFb9o0iC
 cLa2Bd9x0SK1aJoAwErz40I+JPxmzJF2Vb5YLOyR12pf3piHIbRqwA8tfv1wAAG3n840ao3li3KUT
 iwYYPEPUVcF12WBMgn5jso9zQGlWiiGjFtleCDzWnNtzHylBadXyCas3dHPW3GRcqUIsKHSycYoH7
 WKW3xbeA==;
Received: from [2a01:e34:ec5d:a741:8a4c:7c4e:dc4c:1787] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <aurelien@aurel32.net>)
 id 1mjKY4-0006fC-7b; Sat, 06 Nov 2021 13:11:52 +0100
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.94.2)
 (envelope-from <aurelien@aurel32.net>)
 id 1mjKY3-005ytP-FV; Sat, 06 Nov 2021 13:11:51 +0100
Date: Sat, 6 Nov 2021 13:11:51 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: guoren@kernel.org
Cc: anup@brainfault.org, atish.patra@wdc.com, maz@kernel.org,
 tglx@linutronix.de, palmer@dabbelt.com,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>,
 Vincent Pelletier <plr.vincent@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>, stable@vger.kernel.org
Subject: Re: [PATCH V7] irqchip/sifive-plic: Fixup EOI failed when masked
Message-ID: <YYZxB0LN2iYhj+nz@aurel32.net>
Mail-Followup-To: guoren@kernel.org, anup@brainfault.org,
 atish.patra@wdc.com, maz@kernel.org, tglx@linutronix.de,
 palmer@dabbelt.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 Vincent Pelletier <plr.vincent@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>, stable@vger.kernel.org
References: <20211105094748.3894453-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211105094748.3894453-1-guoren@kernel.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_121312_798769_53F1903D 
X-CRM114-Status: GOOD (  19.38  )
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

On 2021-11-05 17:47, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> When using "devm_request_threaded_irq(,,,,IRQF_ONESHOT,,)" in the driver,
> only the first interrupt could be handled, and continue irq is blocked by
> hw. Because the riscv plic couldn't complete masked irq source which has
> been disabled in enable register. The bug was firstly reported in [1].
> 
> Here is the description of Interrupt Completion in PLIC spec [2]:
> 
> The PLIC signals it has completed executing an interrupt handler by
> writing the interrupt ID it received from the claim to the claim/complete
> register. The PLIC does not check whether the completion ID is the same
> as the last claim ID for that target. If the completion ID does not match
> an interrupt source that is currently enabled for the target, the
>                          ^^ ^^^^^^^^^ ^^^^^^^
> completion is silently ignored.
> 
> [1] http://lists.infradead.org/pipermail/linux-riscv/2021-July/007441.html
> [2] https://github.com/riscv/riscv-plic-spec/blob/8bc15a35d07c9edf7b5d23fec9728302595ffc4d/riscv-plic.adoc
> 
> Fixes: bb0fed1c60cc ("irqchip/sifive-plic: Switch to fasteoi flow")
> Reported-by: Vincent Pelletier <plr.vincent@gmail.com>
> Tested-by: Nikita Shubin <nikita.shubin@maquefel.me>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: stable@vger.kernel.org
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Nikita Shubin <nikita.shubin@maquefel.me>
> Cc: incent Pelletier <plr.vincent@gmail.com>

Thanks for this patch. From what I understand, it fixes among other
things the possibility to read the DA9063 RTC more than once.

Does it means that we could now enable it in the device tree? I mean
something like the following patch that unfortunately I can't test now:

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 2e4ea84f27e7..c357b48582f7 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -70,6 +70,10 @@ pmic@58 {
 		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
 
+		onkey {
+			compatible = "dlg,da9063-onkey";
+		};
+
 		regulators {
 			vdd_bcore1: bcore1 {
 				regulator-min-microvolt = <900000>;
@@ -205,6 +209,14 @@ vdd_ldo11: ldo11 {
 				regulator-always-on;
 			};
 		};
+
+		rtc {
+			compatible = "dlg,da9063-rtc";
+		};
+
+		wdt {
+			compatible = "dlg,da9063-watchdog";
+		};
 	};
 };

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
