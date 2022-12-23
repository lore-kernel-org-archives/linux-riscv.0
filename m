Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4FDC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 09:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Cc:Subject:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F58BhH1Z7Mj9tzB6tqQlrTiUajjOoT+dDWyU2DH/hVQ=; b=J1rY7r5VAJKmY4DJrtcog0yGUK
	jwY20Zs6EFe5F84ek59MW9MoXC2endujWB7L0Zm5GVp3bO1hr+ZKhj9jHi/kh0/H0eYBhc20kXRuw
	sj7yS6czaa4Qu4SFOgCLNkoZDzrUbHmpO0x0IrdXjFgMbBg93eK7Qdkcdfnyj3O68IPjCc1m3iPNZ
	gyqAJvRAHpHf6Rp9LvNNaMzmuRf1STBmWHtwwFSSexCUjBl7VbqRxjUoUt+Qa1A0dQhdOiJNsM4hF
	yhqs/wdRPROj8EWRC/6UhpWyPC/dV97sQZfrmEJ9DxuJCiwXn75tiKB2fclqNEnNxIg5VXzLX9GZR
	PgDItprA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8e7w-005aTw-6S; Fri, 23 Dec 2022 09:14:04 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8e6G-005ZdT-I7; Fri, 23 Dec 2022 09:12:23 +0000
X-QQ-mid: bizesmtp81t1671786703twus74c8
Received: from [192.168.3.2] ( [111.196.135.79])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Dec 2022 17:11:41 +0800 (CST)
X-QQ-SSF: 01200000002000C0C000B00A0000000
X-QQ-FEAT: Qawnk02X7V/3XgZ2fM/jaE0BV64IhsybXxGbCgGgdSjq/pQgCE9fY4YxKS69I
	lDjwVxohnmpJtxN9bWL0Y5nR8nj2NtA0rw4Hxb2AjPqO+R1Ck65jLpoRASyyBBuqOjhXI0o
	bTNSgmMn0vS6HN5AfKKREc1jChYjO1pBJLE+Z+29XjVr6DbqivZoWNsZ3UnLf5XQmr+G/ft
	w3snpVgKBYGtqmYA7Lcs59ndbseq90J9dRVcaemaRNSJpOS1ZsP0pNwvMTtinmQwH+D4iPu
	DImOuCqmvDV8VsLzo0SNgk2vHCJ+rWdoJ0rWrZxXQjIBDZj9nk9VxKe9JxFz33/o/8KDYiV
	MsY1vptl+ym8KpBypAMM+t6v7Jf46ypq+O+WNkK
X-QQ-GoodBg: 0
From: "Bin Meng" <bmeng@tinylab.org>
To: "Sergey Matyukevich" <geomatsi@gmail.com>
Subject: Re: [PATCH v3 0/3] serial: Add RISC-V support to the earlycon semihost driver
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, linux-serial
 <linux-serial@vger.kernel.org>, aou <aou@eecs.berkeley.edu>, "catalin.marinas"
 <catalin.marinas@arm.com>, gregkh <gregkh@linuxfoundation.org>, jirislaby
 <jirislaby@kernel.org>, palmer <palmer@dabbelt.com>, "paul.walmsley"
 <paul.walmsley@sifive.com>, linux <linux@armlinux.org.uk>, will
 <will@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Date: Fri, 23 Dec 2022 09:11:42 +0000
Message-Id: <em1edb1bed-77fc-4deb-9de1-7f35bc962d0e@a9022134.com>
In-Reply-To: <Y6S4v7t0n0BI1P7d@curiosity>
References: <20221209150437.795918-1-bmeng@tinylab.org> <Y6S4v7t0n0BI1P7d@curiosity>
User-Agent: eM_Client/9.2.1222.0
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_011220_973498_82198531 
X-CRM114-Status: GOOD (  11.63  )
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

Hi Sergey,

On 2022/12/23 4:06:23, "Sergey Matyukevich" <geomatsi@gmail.com> wrote:

>Hi Bin,
>
>>  RISC-V semihosting spec [1] is built on top of the existing Arm one;
>>  we can add RISC-V earlycon semihost driver easily.
>>
>>  This series refactors the existing driver a little bit, to move smh_putc()
>>  variants in respective arch's semihost.h, then we can implement RISC-V's
>>  version in the riscv arch directory.
>>
>>  Link: https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc [1]
>>
>>  Changes in v3:
>>  - add #ifdef in the header to prevent from multiple inclusion
>>  - add forward-declare struct uart_port
>>  - add a Link tag in the commit message
>>
>>  Changes in v2:
>>  - new patch: "serial: earlycon-arm-semihost: Move smh_putc() variants in respective arch's semihost.h"
>>  - Move the RISC-V implementation to semihost.h
>>
>>  Bin Meng (3):
>>    serial: earlycon-arm-semihost: Move smh_putc() variants in respective
>>      arch's semihost.h
>>    riscv: Implement semihost.h for earlycon semihost driver
>>    serial: Rename earlycon semihost driver
>>
>>   arch/arm/include/asm/semihost.h               | 30 +++++++++++++++++++
>>   arch/arm64/include/asm/semihost.h             | 24 +++++++++++++++
>>   arch/riscv/include/asm/semihost.h             | 26 ++++++++++++++++
>>   drivers/tty/serial/Kconfig                    | 14 ++++-----
>>   drivers/tty/serial/Makefile                   |  2 +-
>>   ...con-arm-semihost.c => earlycon-semihost.c} | 25 +---------------
>>   6 files changed, 89 insertions(+), 32 deletions(-)
>>   create mode 100644 arch/arm/include/asm/semihost.h
>>   create mode 100644 arch/arm64/include/asm/semihost.h
>>   create mode 100644 arch/riscv/include/asm/semihost.h
>>   rename drivers/tty/serial/{earlycon-arm-semihost.c => earlycon-semihost.c} (57%)
>
>Tested-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
>
>Applied the patches on top of Linux 6.1 and tested earlycon logs from
>RISC-V target in OpenOCD.
>

Thanks for your testing!

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
