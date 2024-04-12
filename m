Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E4DC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 06:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GQpZjwPjTclv38TQ5qSNaZ36nnZ8iDuQqKdBl6pjLNg=; b=AxPCEOPmCm/kwk
	9onr4YKEbkpssV2sXpuD4eJKHkPdjva8t/UczI3MELLCTsPTBssMH+07KcCARv0ff3NoYTmV0X9hv
	fc9cHawFMac8AzM9pRHzwgJ750pgsNewyZJK1+9aOykv55V5M8wLyptyVX/2KGaPgFdtc1YfJlGXU
	EmsXVfy3BXfhQVTI5fwlKPIntAWvrZleGmLqIbHXDAiilit6OfhGj2qEOoMSAIA9tgAz8Ns8TLwii
	tmkZs12RsWaThRDz0UO1Bg0fmCJ3UMZXHqzYbINNR3En3y/5nmdtIhBw0yuxiZvFgJdVt9A//LMpw
	M40hgvZMIbQQ+mSXeA6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAUH-0000000FaXR-1jqT;
	Fri, 12 Apr 2024 06:34:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAUF-0000000FaX7-3F5N;
	Fri, 12 Apr 2024 06:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=D8d08kdXjrFd28ginRdzdAdRNU2wwkO/zqvD1S6aOGE=; b=eUlYXMErVS1FIKpcBOi0BrGXuz
	Gp0rRCuKF95ooGGpES1jr2vYX3SUWh2QJSdCO/d8aOCg/TUih8gXfw+/rR7noWSLne3+OQGwOa0gc
	+HbwAu8AEpjtz5zEBRFoOV3vRJHaB94xY4uEhoA4+qW31IcIh3uCDJExBfNUC0C1sc4jRYnE7Fl5X
	7pM4/mJiN4mKITdwjPqn/OCa8HSxRPFMdUH6BTOosRHUMPD6Laa6ocFMfZ9Mj4U+bWv0CKAO55QKN
	26Ly17lEwWRfx2U8fmvD2KQrueqxPNDmHNGB5UzmC2Mn9GRBa0BREnzZR84fPewSMjowGM801305w
	VUWqod3Q==;
Received: from out162-62-58-216.mail.qq.com ([162.62.58.216])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAU9-0000000909m-0bkW;
	Fri, 12 Apr 2024 06:34:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712903629; bh=D8d08kdXjrFd28ginRdzdAdRNU2wwkO/zqvD1S6aOGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ICkmt3jGIdBSQq8hsGDEJh8Gj6RGMJmADhgNHL++oO7bRdntCXS5GtmcBIqH4SrHA
	 7TYURgp+r3VGEHaNARz24Ypc5AYkmACkMe3gdWNtnjI7cQ2vmUfv9IPfLARF2tiyMA
	 zedCbsw2gm1iXpMAcrtijEt9+a/Wea1TCXr3FW50=
Received: from Yangyus-MBP-2.lan ([219.141.235.82])
	by newxmesmtplogicsvrszc6-0.qq.com (NewEsmtp) with SMTP
	id 6DDA90ED; Fri, 12 Apr 2024 14:27:29 +0800
X-QQ-mid: xmsmtpt1712903249tchi8hoao
Message-ID: <tencent_49E156C63C84E435E6F16509D6699339520A@qq.com>
X-QQ-XMAILINFO: M6lqjKFHeg8FipVhaxR+kEqYAYB7tJUinzNVL1AmDc5DgmTMqHVxOFMH9MdVvV
	 RjPhvTEMHFHFNzmcs9Aso2kRDaElcQapDDlJwGkBBhWa59KhptInSCzFi03vMg4LzERqRTZQ1sJH
	 CNwnCmgUbBUIIERkAWWI5ZK2gZuvi4zwiiGC+wR497dv+g43C3eN2JS5O7Je9Y6JSbC3b+djrjzT
	 is/rS4G4tjTzsKLPax7qS7oAx7SJLE/XmKBeXrzrz3Qmc4F5hfqJ/3hZN3FsWWH3VcgFyuw8qf+j
	 eiV9+dyW/PuokfeGq0Ko589nTnyFWgZECvR4yt5fKkP9bIgQDqLM6G2g5mly91OlFrL9On6PMTif
	 FJdE9a192NEFtCl+UWCfyxh8ZZ2wbYvMmvE9UOb3GS6xU/Tr7TbPjPINZZ9ecjgnobJ7ocdNqNHi
	 1s7o3Zq+t8JEi9C+16Uwe6O8ssdxqdtAgsbhco7k6BKEiBYkZUu0E2UYmS0rwFsMuIn6f/lAu646
	 wLzCtFhObPbbeMQkiyf1dpvjVC8A/nXkupyawyK4+ldMuF8chHbnuffrn/WczlsV08UGuU/V/If4
	 z2gvOQt8/PBLvTLv9w+dLovbn+7popyN1zfKg1MdqMOwjmGzK1Dj+cMMQjxZpQBC8+D9XbpFTRa3
	 c9Px4pQB2KSD4hUsvPtpQfuNN42fQE5utHLK5kJYr2XOhgGy0Y6j79KVhI26e7m59RHkbRoxyWcc
	 pGVurjjQF0Vgt0CP2K/RhKXKmXGR6Ez24GgnCCEp9v/RCWowSHECv6IIECzBfDlH+98UUR58dsiG
	 DftcNxVBMSIoVMU24t23HUMnay7tCqipq67fxLzF0UsIlkLT/nUqJ/DjJVRXTB54DSsbMM/6SeKD
	 qwUrpMixt0xaelMdd/Ucma3hsRRjqDxmo9LwXdiEYBcOUrjTeY+LpFcaolblLmrzLNU1tEYeaghx
	 VEqmBD/GaU1ukUuKp4//LrQaxRNyClcp71h31IuKwmHJU5f/IiWqKhwnP8NevXBzJFk/yZem4=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Yangyu Chen <cyy@cyyself.name>
To: conor@kernel.org
Cc: ajones@ventanamicro.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atishp@atishpatra.org,
	conor.dooley@microchip.com,
	dqfext@gmail.com,
	guoren@kernel.org,
	heiko@sntech.de,
	inochiama@outlook.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	mark.rutland@arm.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	will@kernel.org
Subject: Re: [PATCH] perf: RISC-V: fix IRQ detection on T-Head C908
Date: Fri, 12 Apr 2024 14:27:28 +0800
X-OQ-MSGID: <20240412062728.71533-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240314-pep-announcer-2d7f10ff8b65@spud>
References: <20240314-pep-announcer-2d7f10ff8b65@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_073406_780772_7B130094 
X-CRM114-Status: GOOD (  11.39  )
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

>> IMHO, it may be better to use a new DT property like "riscv,cpu-errata" or
>> "<vendor>,cpu-errata". It can achieve almost everything like using pseudo
>> isa. And the only cost I think is a small amount code to parse this.
> 
> I suppose we could do that, but accounting for vendor specifics was one
> of the goals for the property I only just added and that I am suggesting
> to use here.

I think there is a simpler way to do that. We use T-Head PMU by default
for All T-Head CPUs (from mvendor id). Then, to test there is sscofpmf in
the ISA string being probed by the kernel. If yes, then use scofpmf.
Otherwise, use T-Head PMU.

I will check if this can also be switched in any vendor CSR like Svpbmt and
T-Head MAE we discussed before.

Thanks,
Yangyu Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
