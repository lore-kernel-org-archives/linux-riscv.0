Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401D3CA0EDC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 07:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDoUb+2Ms1LHKXJ8mj9QMY/YoWnLM06xi3xrKl90KKk=; b=izBuuZGDtV7aUx
	jg8WNLhFZnCbjHHxywS6K4ZhCaRY5obMQMBxsy+3mmxkturjuKPIaZO4KdD7T9Gveo+cjjCo2JpKU
	UzSh3pvRLQddd6Ncb4Wv9TC08b2v8j2WQ5TVLGrswSQbWEnwoCsHnVSS3bTyajAaFGp/LeAdQSCRP
	h+i/FY8hd1kDSAhoDWIT8u51okkAIq8gt69bRWluRXnTkkjZq9YUt1UKmsgjp0DrFn/aZXCY1G+RM
	oxRi2/AraCabsP8QT9PYOkunZ0T9kpyWKx3O3ID8ByzZOvgeNhV7zgLnOy2qJIlFPjansSol24EJi
	k8j/yNfSM2aB4YkHe4eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uod3X-0000000CaPU-01Km;
	Wed, 20 Aug 2025 07:16:23 +0000
Received: from relay15.mail.gandi.net ([217.70.178.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uod05-0000000CZkO-2W1r
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 07:12:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E781442EB;
	Wed, 20 Aug 2025 07:12:44 +0000 (UTC)
Message-ID: <b18c4283-388a-4b4a-91cb-ae686d7efc11@ghiti.fr>
Date: Wed, 20 Aug 2025 09:12:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ACPI: RISC-V: Fix FFH_CPPC_CSR error handling
To: Anup Patel <apatel@ventanamicro.com>, Sunil V L
 <sunilvl@ventanamicro.com>, "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Len Brown <lenb@kernel.org>,
 Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-acpi@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Troy Mitchell <troy.mitchell@linux.dev>
References: <20250818143600.894385-1-apatel@ventanamicro.com>
 <20250818143600.894385-2-apatel@ventanamicro.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250818143600.894385-2-apatel@ventanamicro.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheejjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvdgrtdegmegtvggttdemuddvudgumehfvdefvdemjegufhekmegsfhegsgemgeeliegvmeduugegsgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtgeemtggvtgdtmeduvdduugemfhdvfedvmeejughfkeemsghfgegsmeegleeivgemudgugegspdhhvghloheplgfkrfggieemvdgrtdegmegtvggttdemuddvudgumehfvdefvdemjegufhekmegsfhegsgemgeeliegvmeduugegsggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudehpdhrtghpthhtoheprghprghtvghlsehvvghnthgrnhgrmhhitghrohdrtghomhdprhgtphhtthhopehsuhhnihhlvhhlsehvvghnthgrnhgrmhhitghrohdrtghomhdprhgtphhtthhopehrrghfrggvlheskhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheplhgvnhgssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrthhishhhrdhprghtrhgrsehlihhnuhigrdguvghvpdhrtghpthhtoheprghjohhnvghssehvvghnthgrnhgrmhhitghrohdrtghomh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_001249_775095_B48F6EAA 
X-CRM114-Status: GOOD (  13.61  )
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

Hi Anup,

On 8/18/25 16:35, Anup Patel wrote:
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


I picked this up for fixes, cc stable and I'll send this patch for some 
6.17-rcX.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
