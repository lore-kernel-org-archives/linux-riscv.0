Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4908C87FCB
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 00:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Date:Subject:Mime-Version:From:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IMKdxX/GtZXnMCLbi7Bu+VpPwDNH99X5C+3Ylghy5Bw=; b=wzdbbuQ6bwswXZ
	cuNDVEKKoquqB0J+SxfIP/qb3f3jsSfsHBFglbXeJN9sQTV/bk/skm3imS8+k/fEz9C4pyLihqgWP
	YgAJNyz9I3/X2DrtW9u7eNjJqGhdu8RDHg9/ygJ5Lpb+pHWzSr8v/AS6NRqzCRt+WXxSyFRZB9ZaE
	1qfrv76Npusch17os8stQWz3jBYdsn0x2LMEHzXr16OXuWPbPxWmQ7vMF7d/Mqx5XYwhvdMZvsQbW
	3Vyg7AgvcYJLchQcuYVrjTIsOJYXFtQSXmW6edlz0E9O89iRa3wqMY8jebG00NCEv9HNu7amBRp8O
	h5ZqgXvv6TUJI2jV2nRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhHcu-00000002gf4-0ayI;
	Thu, 31 Jul 2025 00:58:32 +0000
Received: from out203-205-221-242.mail.qq.com ([203.205.221.242])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhHcq-00000002gdq-200e
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 00:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1753923502;
	bh=DMkrkZNybAxatMv594jb4WuOXe63BMEY20gofUflfqQ=;
	h=From:Subject:Date:To;
	b=aNxJWi87Fu/w0+sVKGbg5pL9gG+0CFLmz/82j5PPJ06CDCbLwcFjmUpQIfOqGNmeO
	 awx5xaQhru4kOjnLkTM08yhTTSRb3rgdfAp7/0+e4dBhomRrq1FIpMBa1zvb2N3Y5h
	 W+I9JeYttKCKXBwqz/PltaONS1KhDIjIeAx4R3ZM=
Received: from smtpclient.apple ([115.223.173.142])
	by newxmesmtplogicsvrszc13-1.qq.com (NewEsmtp) with SMTP
	id E95296C9; Thu, 31 Jul 2025 08:58:21 +0800
X-QQ-mid: xmsmtpt1753923501t3f25iywz
Message-ID: <tencent_73BC0FE5F091AC2E4AFDAB8055DB2007C409@qq.com>
X-QQ-XMAILINFO: NT7dO8ok7FP2mzS7pZRqUOT/PzZnd6OMsngefRs1RqEbDUh0+FbmCLqX63Lhl6
	 LHXdK6DaeGkmkrnEMe4t2CT7NiIw5WUkjGYrfAbl0osPAmc0TNUI4QZClO7iUb2saJE/LR4QraOV
	 GZ1P2hZrn4fPoESog2AhWhj4L4lZh4zUgT3OuXewngiY7YUPoCivkmucjbarzR0zsZAdX/sqTV4O
	 RsG19xWUNGiiDezrYJbcJCSF/LBdhLmzJv0E/yqNWHiKbQxfwM7bIS9QWVQyjPvcA2alyTW7d6fS
	 Ph6iNTbN523kM7Nu1ZKzdzu4uL2KGQVnCblYzsIGCpRnTm69QRXfzrCPxFhNBKAJyBSpIGcZlnZf
	 M75NQjpQb2/7P8U0QE0LW4ObMejzwkagdmSCb17GPNzn13Nnm71tT/k91V0gUht5sTwFx8l/S9+R
	 lq5M8rN18GxFIg2Fm0+IYJVM+tHgkufHYoL0bQTC8CET3XeBkbVS6ntV+MFaUQv2JNEXZ+E7xGhx
	 L4WBaxWwG6lnsrVYL4+GjSkDCd1GxpBtNMRmyqTgZeYwJ/4jREdIMajOeRmIjMBoQLrh/Fd1tiKJ
	 uU0CjM901QnReDIRibtL2hzA+1evPQz/sE2MkQCTewNAb3LHTgpbm576YIEHoHf02rnfxBDu3BxQ
	 +V9vy46a2rVMjrqDjGuQLUzo3OmJeh7helqmU0YjAaKOYV3exe732izWu2tKGKSlt6hJAvZfmt/H
	 nsOlmixLAB9TYbTRYeVA0y9j0JmkQH253+Y4xyJwbtIN13S/+kuryK5qQUWj3GFuBj5EgbUwBCJO
	 79xzPtf1i32zDqk1kvm5Xx2qkevrFFlnpagMnSgSoa+g/sCiWnaJrNac8qIFZAeB77v94LsSzJq5
	 9wfMy4O5bUzVDUxvz8RGt0780qvK103Ck5FoKScOc5jUUd+RwjkR/4pDZeeAhWF4eWCPPC+R1Pg2
	 T89fNAJn5RUjUHxxpTmNqIAMRFDcCAW7dZIVsqQgO+XRxGHAJLwholCHGWs0jkhfh/CY+2JzFG1C
	 BNGoM+k76u+Iww0A/HP0bmBdzO8KAidMH1QPwqt+tvuT5lC7DM0pOVqRa9HSsRQdI74qW//A==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Juhan Jin <juhan.jin@foxmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Question about earlier dynamic ftrace implementation with interrupt
X-OQ-MSGID: <5B7DDBC9-FFE2-4585-B0E6-9F0095A43148@foxmail.com>
Date: Thu, 31 Jul 2025 08:57:58 +0800
To: linux-riscv@lists.infradead.org
X-Mailer: Apple Mail (2.3776.700.51.11.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_175828_883931_7CE3B0A9 
X-CRM114-Status: UNSURE (   8.73  )
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

I was looking at earlier dynamic ftrace implementation which used 
stop_machine for text patching, and I have a question about interrupt
occurred between patched instructions.

Let's use commit 6724a76cff85 (riscv: ftrace: Reduce the detour code 
size to half, 2023-01-12) as code base. This commit places 2 4-byte
NOPs at the start of each function. These NOPs can be patched to 
AUIPC t0, imm and JALR t0, t0(imm) to enable function tracer.

Say we want to enable function tracer for kernel function `func`.
Consider the following scenario: 

- Before enabling `func` for function tracer, its first 2 instructions
  are NOP and NOP. 

- After hart A executes the first NOP at the start of `func`, an 
  interrupt occurs and hart A handles it.

- While hart A is handling this interrupt, hart B enables function 
  tracer for `func` and stop_machine is called. IPI to hart A is 
  pending.

- After hart A handles this interrupt and sret, the pending IPI is 
  serviced. So instead of executing the second NOP, hart A executes
  IPI handler for stop_machine and enter quiescent state.

- Hart B patches the 2 NOPs at the start of `func` to AUIPC and JALR

- Hart A is released from quiescent state and resumes execution.
  However, hart A will now execute JALR instead of NOP.

- NOP plus JALR leads to illegal jump target

Is this scenario possible or did I just overlook something?




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
