Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BCDCC6B2F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 06:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0/y6R7ngUQJwacsJLUQrxR3s2r5FVFEMzS9OyaJFlo=; b=PUx23NGuDAALMH
	6OE6BfMYm0QKjaneW9nEw892Ya61f+GDyeraVxIqihWJdV1ivcWjgBi4yNapxrgjPbjvlZkqUkYxq
	GOBn9N2Te6PxX8xo1pCayNTp61+AsNDKp7KbYQmb+k9EV/JztmKZWd8tQSAiLwVUPwERRz5ei72lQ
	b0bBLb/abM8woGkkbQW9awy9t4+CMILmZb6/XKHvWSDFJLz1jrEAv+A5sLK48fDQk0RhX831fwy5J
	6lkDhFycSuzOG5y3QQKH2WBSpusytRC3K0j3ePWin6j6l3f7OKCmk+0Iy+BOpZjDlvF2UqoPnpLZ7
	1UHnm8MHakiPQc90l5Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFC3-0000000GxKY-0XlA;
	Thu, 15 Oct 2026 06:43:59 +0000
Received: from out-118.mta0.migadu.com ([2001:41d0:1004:224b::76] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFBy-0000000GxK4-28cp
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 06:43:57 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=/FYj6q7Xy2ng34DBUXkiLlonCACAzlEqokQQ19iqyR8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792046630; v=1; x=1792651430;
 b=f3LwMJFHcqTWRCRYFVnAsv20Hi0p7HijH6YmxUbKDctE167ucasVmuKgtC5oQYc3l5Ypms14
 lZtNq5mx6tT2oLXLDrddUUpBmJaBpXgfP2JkwnWld0zJBZ2BCRpqgx/JHFjDOPblzMpyk1ittCT
 qfVvSBrP/ZAHhgoK1YPyXlC4=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 862023fca479452c;
	Thu, 15 Oct 2026 06:43:50 +0000
X-Mizu-Trace-ID: 862023fca479452c
X-Migadu-Flow: FLOW_OUT
Message-ID: <fa4253c7-3b17-4b20-97b9-eb37f218a4c8@linux.dev>
Date: Thu, 15 Oct 2026 14:43:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
To: Inochi Amaoto <inochiama@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-3-inochiama@gmail.com>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20261014074516.240247-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_234354_936091_C3D12F8F 
X-CRM114-Status: GOOD (  14.21  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

On 10/14/2026 3:45 PM, Inochi Amaoto wrote:
> Sophgo SoCs such as SG2044 contain eFuses used to store
> factory-programmed data.
>
> As for SG2044, HW automatically loads the eFuse content
> into shadow registers which are organized as 32bit values
> exposed as MMIO.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   drivers/nvmem/Kconfig        |  12 +++
>   drivers/nvmem/Makefile       |   2 +
>   drivers/nvmem/sophgo-efuse.c | 176 +++++++++++++++++++++++++++++++++++
>   3 files changed, 190 insertions(+)
>   create mode 100644 drivers/nvmem/sophgo-efuse.c
>
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index c36c2a4c2a0b..a7936dd65bdd 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -465,6 +465,18 @@ config NVMEM_SNVS_LPGPR
>   	  This driver can also be built as a module. If so, the module
>   	  will be called nvmem-snvs-lpgpr.
>   
> +config NVMEM_SOPHGO_EFUSE
> +	tristate "Sophgo eFuse support"
> +	depends on ARCH_SOPHGO || COMPILE_TEST
> +	default ARCH_SOPHGO
> +	help
> +	  Say y here to enable support for reading eFuses on Sophgo SoCs
> +	  such as the CV1800B. These are e.g. used to store factory programmed

Why is "CV1800B"?

[...]



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
