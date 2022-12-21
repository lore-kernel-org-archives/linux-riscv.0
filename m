Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13BFC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 15:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Cc:Subject:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oX8phsBca7dvj5yBVPU8sMUFo1OvtM/8uW6K8NAO49o=; b=Si57x/KrBIWZaiOLPuPog7cVrM
	KyHzBZ0sjqvTvcy/a2bNxk7GlJo8UkLYtVapmB5qe6u1Rhvhf/0fU3cj0hr22UVxzPjtNriSINXyF
	BbtFbA2yNBaz9/JpDekhUBBuGH+BJD7jvlzDT9szg1Erv3iuf4U6SdLUnHCzYITNUDa5nn1VJh0Mi
	9vnkx2O1TCEO7KUvSKJLj/dVyL8QzDQh7WH8OdQKYSTksDzGbHsOc7vxJ7cakl2BuYo1NQ3i+xivP
	+jlqdJX/piUyG3rgNAOSdRRZY0xg4VVpx7eDN06bwMbhC2yDxyers1skbcuCLmpynQYOuyhOaCGxR
	/IwBSh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p81Om-00Gig3-8X; Wed, 21 Dec 2022 15:52:52 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p81OL-00GiEq-BY; Wed, 21 Dec 2022 15:52:29 +0000
X-QQ-mid: bizesmtp74t1671637921tlvskkd8
Received: from [192.168.3.2] ( [111.196.135.79])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 Dec 2022 23:52:00 +0800 (CST)
X-QQ-SSF: 01200000002000B0C000B00A0000000
X-QQ-FEAT: I8hG9CuxGDJJpNoVmawLaM6DqS/R7OsXQqE9IbZmAA6LxNl+5/9H8NzhOuTyB
	w+zxihHCZEK4KJd1b1IK2u12+KZIGQPs95OXUv9lMMie5hw+Wbj6KU3zssmEWjy5bKSqANc
	b+N+1jW0oTmqECR+KKqN/PJ55kiws3Um2rxdohXKscDjLUQeoqNZWUHlbhGLAEYnFBrPe/P
	tncbcQgJZ5XXop+uxRXSEy9V3jhR+O2X/tYAhBZbJxqEkmh55dp6/BosTSiWYCEymmGQhF5
	FJ3rK+KwdIvhiT1pukNnfWKHLmKG51QJIeJ4uvPu+EVHW5NtivwCyv2IKMst8i61ICndwox
	DANIkULdQ9il3jSlAIGA+Jh3pdWptcuNHvkO3McpJaY3KahRgU=
X-QQ-GoodBg: 0
From: "Bin Meng" <bmeng@tinylab.org>
To: linux-kernel <linux-kernel@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, linux-serial <linux-serial@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] serial: Add RISC-V support to the earlycon semihost driver
Cc: aou <aou@eecs.berkeley.edu>, "catalin.marinas" <catalin.marinas@arm.com>,
 gregkh <gregkh@linuxfoundation.org>, jirislaby <jirislaby@kernel.org>, palmer
 <palmer@dabbelt.com>, "paul.walmsley" <paul.walmsley@sifive.com>, linux
 <linux@armlinux.org.uk>, will <will@kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 21 Dec 2022 15:51:59 +0000
Message-Id: <em37536add-7867-4e7d-9294-9a8389a661e2@a9022134.com>
In-Reply-To: <20221209150437.795918-1-bmeng@tinylab.org>
References: <20221209150437.795918-1-bmeng@tinylab.org>
User-Agent: eM_Client/9.2.1222.0
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_075225_869137_0C6D4705 
X-CRM114-Status: UNSURE (   6.35  )
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

On 2022/12/9 23:04:34, "Bin Meng" <bmeng@tinylab.org> wrote:

>RISC-V semihosting spec [1] is built on top of the existing Arm one;
>we can add RISC-V earlycon semihost driver easily.
>
>This series refactors the existing driver a little bit, to move smh_putc()
>variants in respective arch's semihost.h, then we can implement RISC-V's
>version in the riscv arch directory.
>
>Link: https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc [1]
>
>Changes in v3:
>- add #ifdef in the header to prevent from multiple inclusion
>- add forward-declare struct uart_port
>- add a Link tag in the commit message
>
Ping?

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
