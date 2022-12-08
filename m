Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B4FC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Cc:Subject:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUL9zyDLXiwiPiQ5KBpdc+PgpAO6CpL+aqibttgfreU=; b=RNHg7RXWk2Po3Xyg6n7fd+NWs0
	R3YlZqu4U91bvDtWLnmMiNLBr7SMq4biP8ZCX68lRAnLZgU85nZ9goQVv+Ieh+x54a8+A8hHe3HOe
	ap3tGeQBg6dFCe5Kxxm7HFuzVSSh7Ant1CZ8/qmnKKjPRqwwRHZq81vwt6+/uArT3g7BL7OmDZdWF
	tUU7Zmr7MNrdqyhXRfmGikK8vCnCNAemRyTgIgybaNbnHdMJZg1h/f+CH63ZgbtjqP7wIEkaBz9J9
	9HTK/Y+Fez9fBq8K56LFx1GSr7mw9WwzZY/on5CHYIWBLormFglavvNZ1EBe/DoJ5njUjp0J3RUOF
	THp66IBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DRN-00B7ip-2O; Thu, 08 Dec 2022 09:43:41 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DHD-00AwTa-KT; Thu, 08 Dec 2022 09:33:13 +0000
X-QQ-mid: bizesmtp80t1670491970tmadzmjb
Received: from [192.168.3.2] ( [111.196.135.79])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Dec 2022 17:32:48 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: zX46NWeZQGEPkwa09vvX1e9B/NktWgMjOM4wpw+/LIo80yqhwau4SCVAglcsW
	9vsBVIHhCU9XlW9C/ACb/6mMlDXDUOlYQ36EXhCDA5boUGbllxcBEHLmNSXc2s3hXMCbtf0
	RTJXfEdQWQnUzHr/ri13d1YrvY8+oCMmAwqK7DoYT8tcO0NqZQXJnA4B70etX7aItOsQjwY
	M1wXkiYNJ0lqlMmHeQU388p4klUI6z3WLOtdfra37UihjKn0gZIuNhijHRPBp4wCt/SnebH
	A652eiO6RR81OjgRhHYJSzeQ4MVQ9ACl5U2OHqBJTiMJLIc6q80/PBAtBa059m2JzfICZ2j
	jwbaEhlvS3fBLJJ0QY=
X-QQ-GoodBg: 0
From: "Bin Meng" <bmeng@tinylab.org>
To: "Jiri Slaby" <jirislaby@kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 linux-serial <linux-serial@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] serial: earlycon-arm-semihost: Move smh_putc() variants in
 respective arch's semihost.h
Cc: "catalin.marinas" <catalin.marinas@arm.com>, gregkh
 <gregkh@linuxfoundation.org>, linux <linux@armlinux.org.uk>, will
 <will@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Date: Thu, 08 Dec 2022 09:32:48 +0000
Message-Id: <em14380c7e-ee2b-45d5-8879-dde687f03b2b@eea79fc7.com>
In-Reply-To: <0443d5e9-b2ce-7e6b-c69b-708d67a5bf97@kernel.org>
References: <20221207135352.592556-1-bmeng@tinylab.org>
 <0443d5e9-b2ce-7e6b-c69b-708d67a5bf97@kernel.org>
User-Agent: eM_Client/9.2.1222.0
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_013312_021786_84370DF7 
X-CRM114-Status: UNSURE (   5.27  )
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
Reply-To: Bin Meng <bmeng@tinylab.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2022/12/8 14:08:33, "Jiri Slaby" <jirislaby@kernel.org> wrote:

>On 07. 12. 22, 14:53, Bin Meng wrote:
>>Move smh_putc() variants in respective arch/*/include/asm/semihost.h,
>>in preparation to add RISC-V support.
>>
>>Signed-off-by: Bin Meng <bmeng@tinylab.org>
>...
>>--- /dev/null
>>+++ b/arch/arm/include/asm/semihost.h
>>@@ -0,0 +1,23 @@
>>+/* SPDX-License-Identifier: GPL-2.0 */
>>+/*
>>+ * Copyright (C) 2012 ARM Ltd.
>>+ * Author: Marc Zyngier <marc.zyngier@arm.com>
>>+ *
>>+ * Adapted for ARM and earlycon:
>>+ * Copyright (C) 2014 Linaro Ltd.
>>+ * Author: Rob Herring <robh@kernel.org>
>>+ */
>
>Much better. There are three minor issues:
>1) protection against multiple #include-s is missing here.

Oops, will add in v3.

>
>
>>+#ifdef CONFIG_THUMB2_KERNEL
>>+#define SEMIHOST_SWI	"0xab"
>>+#else
>>+#define SEMIHOST_SWI	"0x123456"
>>+#endif
>>+
>>+static inline void smh_putc(struct uart_port *port, unsigned char c)
>
>2) port is unused in all implementations. So it should be dropped.
>3) can you make "c" an explicit u8?

The smh_putc function signature is defined by the uart_console_write 
helper. I don't think we can change it.

>
>>+{
>>+	asm volatile("mov  r1, %0\n"
>>+		     "mov  r0, #3\n"
>>+		     "svc  " SEMIHOST_SWI "\n"
>>+		     : : "r" (&c) : "r0", "r1", "memory");
>>+}

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
