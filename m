Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D27C87FC9
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 00:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Date:Subject:Mime-Version:From:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IMKdxX/GtZXnMCLbi7Bu+VpPwDNH99X5C+3Ylghy5Bw=; b=MJqnXONa6hvsHS
	N5NPi1+QaeqbTUULg9wGccjAVMA/n03iXf4J+YsWruop69X3rcILc+FQl//DTuPom7f/NlHiclnIe
	1agItHWgNFVoTFg9b2l3M6rR+fFIQCvqJMCDxcyh3YFlnAi4QifYGQipR30/JX6RQTAJ5MWI6EiYO
	Mr6FIyrI6DlRGV9zDFfkA9iZHndjA3E7t37b5U0ZBsX5rw6t1FZw898ksVBnTnnmhjUDwnm2S8fYU
	H3B2FPSkZl52w0RbhOgh7MlJZwtts4Px8n5GnLiF4mlg67yLhsMxrcXzZ50zdC454uTbToNiFZDeN
	yNdQPNkT/JMUt6o7He8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhHcu-00000002gf9-2zPR;
	Thu, 31 Jul 2025 00:58:32 +0000
Received: from out203-205-221-221.mail.qq.com ([203.205.221.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhHcr-00000002gdp-0yuk
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
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id E94A38B6; Thu, 31 Jul 2025 08:58:20 +0800
X-QQ-mid: xmsmtpt1753923500tbx45rngq
Message-ID: <tencent_4331B2435AFC202B9D529EAA195549C84907@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznYnOKhj64+WWSN6YdP5bk06efsUpO0SCJ5fHeiSHvHr3if1yABY
	 rlFOej4uV8QGH1MMcyNlK2Uvc3gCEm8cbujlHhYR/r/kYv3k4h0jyvmDvQm8ygOz6/QQtYTEDOBx
	 pphEp6gwgVw6egNUTVgfhXHil5whLq42DRbQp7yp5WcFIhatua080bpSpoRUzccUqGvzlGJE+wJJ
	 kMKYd9cglgXSbwOfuiIb6mr2kT+/5fvtcVPwWoTjkWKHGB4Zj5IHsZ8M31XEKk0UazRZ6jtGEEAk
	 cFEjJrDf0nGjQH+UMjRk8ZXfP4DMZ85s0I+W60luHGQGV7D9xkxxBA7bBcB7wDeuUiWxQYEBdr17
	 tQVmxfvrJpmL1QmWoV4wcMtYNkKcse+OcZenUACop+yKGXxmTUtBfapU2dNHaW2AgRW3+RzoX+YW
	 qntadY68UbLdNKLfWX94ivwEBoW8UVRmMKrxmoJpGWAI4OxBiK1fP1/qoApSQqiUi4pYagiwT0q9
	 Q/B7UKfYbGTHURGCv7PkRoGG8+rsYmPj5dZ+GDT2GnImykb1cu5EUnXyu16E9KHfQHtmGh7/cP+P
	 UpnlhPTeMIemQAIp1kkgr+JJBdSJBUkUdNs4ns8mRSQ9e2HFkhQFPdLfdZa2xd1aWF8SmYVDQmRi
	 ujshKFeQ51UFhxysfTwJo4eqgdOi3swapCW2s7K7HUNc30QqtwRpCjncfqFRtJmYQNnyeyVn1icy
	 TK4TdWHSwIMgO5BXtPGwnOqGwFXcq0vppwD/jfNLsnFyCJCWwVnySswoRFPVkUAuiOR9mzSEYdob
	 KzOzV8CaAIbRKuBzBWoSnG+umOc7y8UUYwQYeo1RQXn6edMX4szAX9noCchpr2z1X1tuX+ydkXt7
	 xFGR+x2WkyuKwR+EYTglyl+DiR0gjtaqgbhdUr1fl5FFG+bpn2t1GvAc7uX3dVd12pYBLV978aX9
	 uUjhsYCGGcafhEVoalf7dr+A/7mkgIWkCOBUAsMhtdrgMEeINpEQ0Rvr9rfCdkb//n1jrdQSdJdX
	 B2QcyeAWAe/Kop80fq4sUAOxpowkg=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Juhan Jin <juhan.jin@foxmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Question about earlier dynamic ftrace implementation with interrupt
X-OQ-MSGID: <5B7DDBC9-FFE2-4585-B0E6-9F0095A43148@foxmail.com>
Date: Thu, 31 Jul 2025 08:57:58 +0800
To: linux-riscv@lists.infradead.org
X-Mailer: Apple Mail (2.3776.700.51.11.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_175829_563385_A970809C 
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
