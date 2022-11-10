Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5195C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 23:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=caRsjGg55Bv5G6rebXXpZqrw02MoHeDbayEabt/a1Ts=; b=elGRu+ZwVsktgi
	XsqVxAAFkg/pfaMVZmackA+b4EKTswxHjw2z6eAxfdMF1imGX9oVYAVH/qVdRYRVjKm9RuwYPFKcp
	f8jlcT2ZCgO/pFLcLBI9HcU7SED6D/MMXU6s2u0PzgfLr2JdjBuBxKrOrMAKtXmIYNzztabXKWw4X
	83Mqpq+6gpTxWz8CNX++NYAAn5Rh5XRGIJLojXUptPTZz64cKyUkWFEOoy+MTb3JWmczdCTVqfm/p
	83uWTKfPVQIPckey5yiiIYLBY61SOc5R5K3Jo1CZS3Klf8nxyl6hvwNAGm2c5SL7bGd9mjJyFhZew
	NI2WK00SxdeJkZgrR37A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otGo9-00B36t-Md; Thu, 10 Nov 2022 23:18:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otGny-00B31m-Ni; Thu, 10 Nov 2022 23:17:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBF8923A;
	Thu, 10 Nov 2022 15:17:58 -0800 (PST)
Received: from [192.168.122.164] (U203867.austin.arm.com [10.118.30.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14CB53F73D;
	Thu, 10 Nov 2022 15:17:50 -0800 (PST)
Message-ID: <285274e0-51bd-3334-1cb2-3af1b1aa1ba2@arm.com>
Date: Thu, 10 Nov 2022 17:17:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/5] ACPI: PPTT: Remove acpi_find_cache_levels()
Content-Language: en-US
To: Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gavin Shan <gshan@redhat.com>, Peter Chen <peter.chen@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org
References: <20221108110424.166896-1-pierre.gondois@arm.com>
 <20221108110424.166896-4-pierre.gondois@arm.com>
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20221108110424.166896-4-pierre.gondois@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_151754_843135_E384F903 
X-CRM114-Status: GOOD (  17.28  )
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

On 11/8/22 05:04, Pierre Gondois wrote:
> acpi_find_cache_levels() is used at a single place and is short
> enough to be merged into the calling function. The removal allows
> an easier renaming of the calling function in the next patch.
> 
> Also reorder the parameters in the 'reversed Christmas tree' order.
> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>

This bit looks fine too:

Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>


> ---
>   drivers/acpi/pptt.c | 21 ++++++---------------
>   1 file changed, 6 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index c91342dcbcd6..97c1d33822d1 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -281,19 +281,6 @@ static struct acpi_pptt_processor *acpi_find_processor_node(struct acpi_table_he
>   	return NULL;
>   }
>   
> -static int acpi_find_cache_levels(struct acpi_table_header *table_hdr,
> -				  u32 acpi_cpu_id)
> -{
> -	int number_of_levels = 0;
> -	struct acpi_pptt_processor *cpu;
> -
> -	cpu = acpi_find_processor_node(table_hdr, acpi_cpu_id);
> -	if (cpu)
> -		number_of_levels = acpi_count_levels(table_hdr, cpu);
> -
> -	return number_of_levels;
> -}
> -
>   static u8 acpi_cache_type(enum cache_type type)
>   {
>   	switch (type) {
> @@ -613,9 +600,10 @@ static int check_acpi_cpu_flag(unsigned int cpu, int rev, u32 flag)
>    */
>   int acpi_find_last_cache_level(unsigned int cpu)
>   {
> -	u32 acpi_cpu_id;
> +	struct acpi_pptt_processor *cpu_node;
>   	struct acpi_table_header *table;
>   	int number_of_levels = 0;
> +	u32 acpi_cpu_id;
>   
>   	table = acpi_get_pptt();
>   	if (!table)
> @@ -624,7 +612,10 @@ int acpi_find_last_cache_level(unsigned int cpu)
>   	pr_debug("Cache Setup find last level CPU=%d\n", cpu);
>   
>   	acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> -	number_of_levels = acpi_find_cache_levels(table, acpi_cpu_id);
> +	cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
> +	if (cpu_node)
> +		number_of_levels = acpi_count_levels(table, cpu_node);
> +
>   	pr_debug("Cache Setup find last level level=%d\n", number_of_levels);
>   
>   	return number_of_levels;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
