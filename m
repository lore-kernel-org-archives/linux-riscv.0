Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A608C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 17:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYT6+AHvCkgnFcsrT9kedsrnilmg1RTm8HiMA20gVKU=; b=LpJHXZX94ataJO
	DZgSsFLZP71duBag/L1zatOB9QdS4ZtSfbOTH9UnNsLdrnWnQx+pZbF10kgl9NPqKVdme6/6tZC0L
	CW6K3MW8JDgbQPL++ZypViNJDzUeMRAEmP0q1BLRXKHcH3nOSmW8sBT5IwW/0cPZbWwzlAhsP6clb
	ebp0qLEvZsW0QXkgdL16r9Xv0uwoAbliG8q3DPWKf1B/cI5G8rgA+HStJnUSF/Xo7PowyCaC4AhUp
	15wxqZ5bAfEeoSYkUOr4y7KD4fqNlUMX8a4Mvr41uSbipnukqbVsrT64U4HPUJ4EcKaVU24oxiA99
	v93TsRG/HH9LfLDOaltQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEBjs-0040Fm-1y;
	Fri, 15 Dec 2023 17:12:40 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEBjo-0040E4-39;
	Fri, 15 Dec 2023 17:12:39 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4SsG1y3GNgz6K8qY;
	Sat, 16 Dec 2023 01:10:30 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 5989E140447;
	Sat, 16 Dec 2023 01:12:29 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 15 Dec
 2023 17:12:28 +0000
Date: Fri, 15 Dec 2023 17:12:27 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, <acpica-devel@lists.linuxfoundation.org>,
	<linux-csky@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-ia64@vger.kernel.org>, <linux-parisc@vger.kernel.org>, Salil Mehta
	<salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>, James Morse
	<james.morse@arm.com>, Jose Marinho <jose.marinho@arm.com>, Samer
 El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>
Subject: Re: [PATCH RFC v3 20/21] ACPI: Add _OSC bits to advertise OS
 support for toggling CPU present/enabled
Message-ID: <20231215171227.00006550@Huawei.com>
In-Reply-To: <E1rDOhS-00Dvla-7i@rmk-PC.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
	<E1rDOhS-00Dvla-7i@rmk-PC.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_091237_301350_B14298B7 
X-CRM114-Status: GOOD (  29.90  )
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

On Wed, 13 Dec 2023 12:50:54 +0000
Russell King (Oracle) <rmk+kernel@armlinux.org.uk> wrote:

> From: James Morse <james.morse@arm.com>
> 
> Platform firmware can disabled a CPU, or make it not-present by making
> an eject-request notification, then waiting for the os to make it offline
OS

> and call _EJx. After the firmware updates _STA with the new status.
> 
> Not all operating systems support this. For arm64 making CPUs not-present
> has never been supported. For all ACPI architectures, making CPUs disabled
> has recently been added. Firmware can't know what the OS has support for.
> 
> Add two new _OSC bits to advertise whether the OS supports the _STA enabled
> or present bits being toggled for CPUs. This will be important for arm64
> if systems that support physical CPU hotplug ever appear as arm64 linux
> doesn't currently support this, so firmware shouldn't try.
> 
> Advertising this support to firmware is useful for cloud orchestrators
> to know whether they can scale a particular VM by adding CPUs.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Jianyong Wu <jianyong.wu@arm.com>

I'm very much in favor of this _OSC but it hasn't been accepted yet I think...
https://bugzilla.tianocore.org/show_bug.cgi?id=4481

Jose? Github suggests you are the proposer on this.

btw v4 looks ok but v5 in the tianocore github seems to have lost the actual OSC part.

Jonathan

> ---
> I'm assuming Loongarch machines do not support physical CPU hotplug.
> 
> Changes since RFC v3:
>  * Drop ia64 changes
>  * Update James' comment below "---" to remove reference to ia64
> 
> Outstanding comment:
>  https://lore.kernel.org/r/20230914175021.000018fd@Huawei.com



> ---
>  arch/x86/Kconfig              |  1 +
>  drivers/acpi/Kconfig          |  9 +++++++++
>  drivers/acpi/acpi_processor.c | 14 +++++++++++++-
>  drivers/acpi/bus.c            | 16 ++++++++++++++++
>  include/linux/acpi.h          |  4 ++++
>  5 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 64fc7c475ab0..33fc4dcd950c 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -60,6 +60,7 @@ config X86
>  	select ACPI_LEGACY_TABLES_LOOKUP	if ACPI
>  	select ACPI_SYSTEM_POWER_STATES_SUPPORT	if ACPI
>  	select ACPI_HOTPLUG_PRESENT_CPU		if ACPI_PROCESSOR && HOTPLUG_CPU
> +	select ACPI_HOTPLUG_IGNORE_OSC		if ACPI && HOTPLUG_CPU
>  	select ARCH_32BIT_OFF_T			if X86_32
>  	select ARCH_CLOCKSOURCE_INIT
>  	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index 9c5a43d0aff4..020e7c0ab985 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -311,6 +311,15 @@ config ACPI_HOTPLUG_PRESENT_CPU
>  	depends on ACPI_PROCESSOR && HOTPLUG_CPU
>  	select ACPI_CONTAINER
>  
> +config ACPI_HOTPLUG_IGNORE_OSC
> +	bool
> +	depends on ACPI_HOTPLUG_PRESENT_CPU
> +	help
> +	  Ignore whether firmware acknowledged support for toggling the CPU
> +	  present bit in _STA. Some architectures predate the _OSC bits, so
> +	  firmware doesn't know to do this.
> +
> +
>  config ACPI_PROCESSOR_AGGREGATOR
>  	tristate "Processor Aggregator"
>  	depends on ACPI_PROCESSOR
> diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
> index ea12e70dfd39..5bb207a7a1dd 100644
> --- a/drivers/acpi/acpi_processor.c
> +++ b/drivers/acpi/acpi_processor.c
> @@ -182,6 +182,18 @@ static void __init acpi_pcc_cpufreq_init(void)
>  static void __init acpi_pcc_cpufreq_init(void) {}
>  #endif /* CONFIG_X86 */
>  
> +static bool acpi_processor_hotplug_present_supported(void)
> +{
> +	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU))
> +		return false;
> +
> +	/* x86 systems pre-date the _OSC bit */
> +	if (IS_ENABLED(CONFIG_ACPI_HOTPLUG_IGNORE_OSC))
> +		return true;
> +
> +	return osc_sb_hotplug_present_support_acked;
> +}
> +
>  /* Initialization */
>  static int acpi_processor_make_present(struct acpi_processor *pr)
>  {
> @@ -189,7 +201,7 @@ static int acpi_processor_make_present(struct acpi_processor *pr)
>  	acpi_status status;
>  	int ret;
>  
> -	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU)) {
> +	if (!acpi_processor_hotplug_present_supported()) {
>  		pr_err_once("Changing CPU present bit is not supported\n");
>  		return -ENODEV;
>  	}
> diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> index 72e64c0718c9..7122450739d6 100644
> --- a/drivers/acpi/bus.c
> +++ b/drivers/acpi/bus.c
> @@ -298,6 +298,13 @@ EXPORT_SYMBOL_GPL(osc_sb_native_usb4_support_confirmed);
>  
>  bool osc_sb_cppc2_support_acked;
>  
> +/*
> + * ACPI 6.? Proposed Operating System Capabilities for modifying CPU
> + * present/enable.
> + */
> +bool osc_sb_hotplug_enabled_support_acked;
> +bool osc_sb_hotplug_present_support_acked;
> +
>  static u8 sb_uuid_str[] = "0811B06E-4A27-44F9-8D60-3CBBC22E7B48";
>  static void acpi_bus_osc_negotiate_platform_control(void)
>  {
> @@ -346,6 +353,11 @@ static void acpi_bus_osc_negotiate_platform_control(void)
>  
>  	if (!ghes_disable)
>  		capbuf[OSC_SUPPORT_DWORD] |= OSC_SB_APEI_SUPPORT;
> +
> +	capbuf[OSC_SUPPORT_DWORD] |= OSC_SB_HOTPLUG_ENABLED_SUPPORT;
> +	if (IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU))
> +		capbuf[OSC_SUPPORT_DWORD] |= OSC_SB_HOTPLUG_PRESENT_SUPPORT;
> +
>  	if (ACPI_FAILURE(acpi_get_handle(NULL, "\\_SB", &handle)))
>  		return;
>  
> @@ -383,6 +395,10 @@ static void acpi_bus_osc_negotiate_platform_control(void)
>  			capbuf_ret[OSC_SUPPORT_DWORD] & OSC_SB_NATIVE_USB4_SUPPORT;
>  		osc_cpc_flexible_adr_space_confirmed =
>  			capbuf_ret[OSC_SUPPORT_DWORD] & OSC_SB_CPC_FLEXIBLE_ADR_SPACE;
> +		osc_sb_hotplug_enabled_support_acked =
> +			capbuf_ret[OSC_SUPPORT_DWORD] & OSC_SB_HOTPLUG_ENABLED_SUPPORT;
> +		osc_sb_hotplug_present_support_acked =
> +			capbuf_ret[OSC_SUPPORT_DWORD] & OSC_SB_HOTPLUG_PRESENT_SUPPORT;
>  	}
>  
>  	kfree(context.ret.pointer);
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 00be66683505..c572abac803c 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -559,12 +559,16 @@ acpi_status acpi_run_osc(acpi_handle handle, struct acpi_osc_context *context);
>  #define OSC_SB_NATIVE_USB4_SUPPORT		0x00040000
>  #define OSC_SB_PRM_SUPPORT			0x00200000
>  #define OSC_SB_FFH_OPR_SUPPORT			0x00400000
> +#define OSC_SB_HOTPLUG_ENABLED_SUPPORT		0x00800000
> +#define OSC_SB_HOTPLUG_PRESENT_SUPPORT		0x01000000
>  
>  extern bool osc_sb_apei_support_acked;
>  extern bool osc_pc_lpi_support_confirmed;
>  extern bool osc_sb_native_usb4_support_confirmed;
>  extern bool osc_sb_cppc2_support_acked;
>  extern bool osc_cpc_flexible_adr_space_confirmed;
> +extern bool osc_sb_hotplug_enabled_support_acked;
> +extern bool osc_sb_hotplug_present_support_acked;
>  
>  /* USB4 Capabilities */
>  #define OSC_USB_USB3_TUNNELING			0x00000001


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
