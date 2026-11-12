Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25157606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 10:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u9kmcOTu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JFa1Uo6g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Sw7hb8n+zivhLwuL/Edu+OPg08PYa5239fTZEeJbVQw=; b=u9kmcOTuMApR1p+PeQd0MiLCRx
	coHQKZz2afK7UcYusWwJNpWQ6BEj9ReGV3JIHhaP9/BuIYjak3mEUzmbHLwV5bxe83xAHYxR+qgbL
	27AkvYgiO5yMqumD7DQu5wONSr5M9uqEXP7ELAeEUEj/hEB8mQog1tleEbOxslz0DjhEXtq29g2j1
	ZxL72SrWBMfoVHA7aAzKGs7IBW5/z5uM7JpZggfQMULjE6jiyNKyRWwtwGVb+0d7/C6HmSufqNDJ7
	7xOJxKFwKPURPz5AvuQqro/14D6CIjETrwACYtVA4GqFJwraiy4Rc5SHOOvlc6t68zUzxrks7Z5rv
	8gRyy6iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRvw-00000009VFA-0lQq;
	Thu, 12 Nov 2026 10:21:32 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRvr-00000009VEV-0dFL
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 10:21:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794478887; x=1826014887;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9ryvtv+3D0u7ZmUKVKxFugtxHQCXrLGXh6W32QRNzjY=;
  b=JFa1Uo6ghSC6xIev84cCaylQslA7hOsf+RLg340XAKdjA5XmZKlTjh1/
   iGiMjZl+cXUZM51DWUYjetSU9YKSKAp472mkqYssg1l224iKtLnCI9zoe
   aHUpMJXvveSM59HbhCNDJrvfOr2Mtp7chc3oARQ8paPAYckWb7AhK+tHX
   k7cjjYxZU7NC8+6IwGTQTytLkHe40H1CKte/WDz06NbhYF88qbbkLCnj+
   1QzHfNRUph+ICuCqgcutdH4cbGpCoFWs1olXksY0GUFTVeQA7k6ABhiJ0
   bTjnDAsmu6DAbzZK7LVFQ7rQDU5g1qx8i42PB9pxIYsnuGNd9U4nqxS7h
   g==;
X-CSE-ConnectionGUID: sCjlHlJ1TVmNpSx/McbObQ==
X-CSE-MsgGUID: Zuw7Y3rESgaEN6tmrVtoRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3160360"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3160360"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 02:21:26 -0800
X-CSE-ConnectionGUID: 65ZHtRybSxOdws+e3pTDYg==
X-CSE-MsgGUID: 57Vuhv93R72AniB1yhhDCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="10352280"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 02:21:22 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 12 Nov 2026 12:21:19 +0200 (EET)
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
cc: Armin Wolf <W_Armin@gmx.de>, 
    Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
    Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, 
    platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
    linux-riscv@lists.infradead.org
Subject: Re: [PATCH] platform/wmi: Allow wmi module to load when acpi_disabled
 is set
In-Reply-To: <20261111131613.6290-1-johannes.goede@oss.qualcomm.com>
Message-ID: <8382881b-f2d4-7909-d7d1-3a2c74f3b123@linux.intel.com>
References: <20261111131613.6290-1-johannes.goede@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_022127_237872_CACC2552 
X-CRM114-Status: GOOD (  21.78  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 11 Nov 2026, Hans de Goede wrote:

> The core wmi module provides symbols which may be used by other modules.
> These other modules may still function when acpi_disabled is set, but
> the current behavior of acpi_wmi_init() returning -ENODEV when it is set
> causes loading these modules to fail because the wmi module these depend
> on fails to load with -ENODEV.
> 
> One example of this is booting a kernel with both DT and ACPI/WMI support
> on an arm64 systems with devicetree which will lead to acpi_disabled being
> set. Trying to load the amdgpu module will fail in this case because it
> uses symbols from the drivers/acpi/video module which in turn uses symbols
> from the wmi module. Note the video module itself already contains handling
> to still load when acpi_disables is set for similar reasons.
> 
> Fix this by allowing the wmi module to still load and also register
> the class and bus instances since some exported functions like
> wmi_driver_register() rely on these being valid.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

No Fixes tag?

Doesn't this fix a real issue and we want this go through the fixes 
branch?

-- 
 i.

> ---
>  drivers/platform/wmi/core.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
> index 529825dcfbfe..412f2e23b01d 100644
> --- a/drivers/platform/wmi/core.c
> +++ b/drivers/platform/wmi/core.c
> @@ -1573,9 +1573,6 @@ static int __init acpi_wmi_init(void)
>  {
>  	int error;
>  
> -	if (acpi_disabled)
> -		return -ENODEV;
> -
>  	error = class_register(&wmi_bus_class);
>  	if (error)
>  		return error;
> @@ -1584,6 +1581,9 @@ static int __init acpi_wmi_init(void)
>  	if (error)
>  		goto err_unreg_class;
>  
> +	if (acpi_disabled)
> +		return 0;
> +
>  	error = platform_driver_register(&acpi_wmi_driver);
>  	if (error) {
>  		pr_err("Error loading mapper\n");
> @@ -1603,7 +1603,8 @@ static int __init acpi_wmi_init(void)
>  
>  static void __exit acpi_wmi_exit(void)
>  {
> -	platform_driver_unregister(&acpi_wmi_driver);
> +	if (!acpi_disabled)
> +		platform_driver_unregister(&acpi_wmi_driver);
>  	bus_unregister(&wmi_bus_type);
>  	class_unregister(&wmi_bus_class);
>  }
> 

-- 
 i.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
