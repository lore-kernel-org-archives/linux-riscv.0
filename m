Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F219CA0EE9
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mfrNHXthOC0u4eKQDvo7cys8JsyTCHzwPlAkFYPOMO4=; b=V8prGWLbBcVq17
	eoOTpom3N74DJv0QvzcREI/U/u+btiQBPEAG1kIChvjsWUuR5pmVyPwNQyGk7Xdyvr7eAm4LB6UY3
	aaEFqPpHrRptHxLXoKpMG/M4cBHw6UPUm8wAy2UhAutqJaTIkFveJYklImmWZvM5ZpeWgGYF2I+Oq
	7GdPFkigkgny10XzU2bmmkFqJ3B8kisiJHSyuJ1sUtU17WfrT30FsRBMTXncF+FCz0oEwREIyjpyP
	ePwdQQbFYBgu0zsEFdwpOOaaNZ/LNn5TGi2xkNx9Pr+6uwumojskveE2e6QLOmHkEn+kXennIE8MY
	tXgXhkmsnPUOi3p/QY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7Nu-00000008i4M-37ij;
	Mon, 18 Aug 2025 21:27:18 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5Uu-00000008Vg8-2dOH
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 19:26:26 +0000
Message-ID: <2a7e2450-5e31-40d6-bca4-ccc2c1d60b72@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755545179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q3UWG4FunCCbQLj+biR4a06QSU33PixM4sYuMp155u4=;
	b=mH+VmKVX5OvdeT8AcQ2d9iNMPDRxQosoUJQ+Ob0OavqixnlEqb9GHwVlnTZnHxlnGMpvQU
	OjkW/hosFEVjhKBL5FeQZXzERh9v0nZkwj9jqgbhKaFqNQpWUHm1XliM1mdeQ4VKL4/98u
	OJWUdliYOG5PWDHcW4mIwyiL/5PnkNc=
Date: Mon, 18 Aug 2025 12:26:13 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] ACPI: RISC-V: Fix FFH_CPPC_CSR error handling
To: Anup Patel <apatel@ventanamicro.com>, Sunil V L
 <sunilvl@ventanamicro.com>, "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Len Brown <lenb@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-acpi@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Troy Mitchell <troy.mitchell@linux.dev>
References: <20250818143600.894385-1-apatel@ventanamicro.com>
 <20250818143600.894385-2-apatel@ventanamicro.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
Content-Language: en-US
In-Reply-To: <20250818143600.894385-2-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_122625_445840_1A284229 
X-CRM114-Status: GOOD (  12.77  )
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


On 8/18/25 7:35 AM, Anup Patel wrote:
> The cppc_ffh_csr_read() and cppc_ffh_csr_write() returns Linux error
> code in "data->ret.error" so cpc_read_ffh() and cpc_write_ffh() must
> not use sbi_err_map_linux_errno() for FFH_CPPC_CSR.
>
> Fixes: 30f3ffbee86b ("ACPI: RISC-V: Add CPPC driver")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>   drivers/acpi/riscv/cppc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/acpi/riscv/cppc.c b/drivers/acpi/riscv/cppc.c
> index 440cf9fb91aa..42c1a9052470 100644
> --- a/drivers/acpi/riscv/cppc.c
> +++ b/drivers/acpi/riscv/cppc.c
> @@ -119,7 +119,7 @@ int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
>   
>   		*val = data.ret.value;
>   
> -		return (data.ret.error) ? sbi_err_map_linux_errno(data.ret.error) : 0;
> +		return data.ret.error;
>   	}
>   
>   	return -EINVAL;
> @@ -148,7 +148,7 @@ int cpc_write_ffh(int cpu, struct cpc_reg *reg, u64 val)
>   
>   		smp_call_function_single(cpu, cppc_ffh_csr_write, &data, 1);
>   
> -		return (data.ret.error) ? sbi_err_map_linux_errno(data.ret.error) : 0;
> +		return data.ret.error;
>   	}
>   
>   	return -EINVAL;

Reviewed-by: Atish Patra <atishp@rivosinc.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
