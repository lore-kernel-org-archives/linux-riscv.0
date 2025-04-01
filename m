Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6052DC36010
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 11:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=feig/vJW2fMvo6YDVr23ol6ZMtPbE4LAEHO996NZVM0=; b=e0uMaYBxM8sNZf
	qj5+DbjGNHRlVQwKaVgCFOHZZkHWDAunOK3nxY4Ko+oIePYU7BJ751cq99Ah6N10Cv9P8amNNhmLe
	vwQr4bE5e3OkRMrFhsbfG9Z2DfF0BUoms4WKMOMT5ZNwJ0+n+aGXqw9JqRg9Q+PJ4A0Tu518qZU/7
	2y/VH15g5J//ErMhQ5yptUl/fKrE62v3Yp1hFLDyVzoVLVehkMxeAOxkYN5Zu9Hk1eYXavr2XiGZ7
	j+XICGL2Exz5/cAbBNConSaDEUVMI1WVrXjkvrreGm8GpLVhrsefEplXV3kGpAGcP8S+xb4jWHagR
	gt32jGSn0+hHoCxYjIsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZl6-00000002m2C-0h80;
	Tue, 01 Apr 2025 11:26:20 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZjb-00000002luZ-0v1g
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 11:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743506687; x=1775042687;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Xbrgp77gFRE50MGCwTQAmoy/8Yi+tgaYrDI08q5Gl0g=;
  b=UbO9ccuIh6oQzWyzUijLy2vxogx4LhyK6y12dqvqKf0AxxxgS0evPoGk
   LQnA3eLz26Vvfqsz1tEkZyL1BukJQvI8m2jM0XJ1tqMnRnMmpzEBsl1+r
   7/W0WiTxzMF3ZJid6/oXU7HWdpOPniOtHW8SDj6uC1K3VRRT3ttKuROE5
   TYo7JINbytJQ+5olgG7u5mRbH7dFTMMg5m+jr7gGS6wcpmFO4YMl4ofFU
   S/m9Yyt+QkAc0M41BcxMmCZScMoE0WG6uwOOM1+TWnIHh6VCTlwq5FmKA
   ysjbypJfLo/bhr2Lh5bhz/OJqqoTJ1haYZGvjDGP9eLf+BA7fh8wrGgKJ
   g==;
X-CSE-ConnectionGUID: ptvNSQAMSheT7X7fVOzYYA==
X-CSE-MsgGUID: F7+G+klUSoSJ/fHy2NGK5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="43972653"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="43972653"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 04:24:43 -0700
X-CSE-ConnectionGUID: O6C+VatiQgyRnu6suKRzNg==
X-CSE-MsgGUID: w9B5k5ZOTEetlRqB4PvBWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="131214921"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.126])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 04:24:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 1 Apr 2025 14:24:36 +0300 (EEST)
To: Kurt Borja <kuurtb@gmail.com>
cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    Hans de Goede <hdegoede@redhat.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, 
    Damian Tometzki <damian@riscv-rocks.de>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix NULL pointer dereferences
 while probing
In-Reply-To: <20250330-thinkpad-fix-v1-1-4906b3fe6b74@gmail.com>
Message-ID: <455d5e7d-6f1e-a0a0-773b-85c26418bf54@linux.intel.com>
References: <20250330-thinkpad-fix-v1-1-4906b3fe6b74@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_042447_276213_8E571AC5 
X-CRM114-Status: GOOD (  27.94  )
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

On Sun, 30 Mar 2025, Kurt Borja wrote:

> Some subdrivers make use of the global reference tpacpi_pdev during
> initialization, which is called from the platform driver's probe.
> However, after
> 
> commit 38b9ab80db31 ("platform/x86: thinkpad_acpi: Move subdriver initialization to tpacpi_pdriver's probe.")
> 

Next time, please include these into the paragraph flow normally obeying 
the normal paragraph formatting. I changed them in this case.

> this variable is only properly initialized *after* probing and this can
> result in a NULL pointer dereference.
> 
> In order to fix this without reverting the commit, register the platform
> bundle in two steps, first create and initialize tpacpi_pdev, then
> register the driver synchronously with platform_driver_probe(). This way
> the benefits of commit 38b9ab80db31 are preserved.
> 
> Additionally,
> 
> commit 43fc63a1e8f6 ("platform/x86: thinkpad_acpi: Move HWMON initialization to tpacpi_hwmon_pdriver's probe")
> 
> introduced a similar problem, however tpacpi_sensors_pdev is only used
> once inside the probe, so replace the global reference with the one
> given by the probe.
> 
> Reported-by: Damian Tometzki <damian@riscv-rocks.de>
> Closes: https://lore.kernel.org/r/CAL=B37kdL1orSQZD2A3skDOevRXBzF__cJJgY_GFh9LZO3FMsw@mail.gmail.com/
> Fixes: 38b9ab80db31 ("platform/x86: thinkpad_acpi: Move subdriver initialization to tpacpi_pdriver's probe.")
> Fixes: 43fc63a1e8f6 ("platform/x86: thinkpad_acpi: Move HWMON initialization to tpacpi_hwmon_pdriver's probe")
> Tested-by: Damian Tometzki <damian@riscv-rocks.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>

Applied to the review-ilpo-fixes branch.

> ---
> Hi all,
> 
> The commit message is pretty self-explanatory. I have one question
> though. As you can see in the crash dump of the original report:
> 
> Mar 29 17:43:16.180758 fedora kernel:  ? asm_exc_page_fault+0x26/0x30
> Mar 29 17:43:16.180769 fedora kernel:  ? __pfx_klist_children_get+0x10/0x10
> Mar 29 17:43:16.180781 fedora kernel:  ? kobject_get+0xd/0x70
> Mar 29 17:43:16.180792 fedora kernel:  device_add+0x8f/0x6e0
> Mar 29 17:43:16.180804 fedora kernel:  rfkill_register+0xbc/0x2c0 [rfkill]
> Mar 29 17:43:16.180813 fedora kernel:  tpacpi_new_rfkill+0x185/0x230 [thinkpad_acpi]
> 
> The NULL dereference happens in device_add(), inside rfkill_register().
> This bothers me because, as you can see here:
> 
>  1198                 atp_rfk->rfkill = rfkill_alloc(name,
>  1199                                                 &tpacpi_pdev->dev,
>  1200                                                 rfktype,
>  1201                                                 &tpacpi_rfk_rfkill_ops,
>  1202                                                 atp_rfk);
> 
> the NULL deference happens in line 1199, inside tpacpi_new_rfkill(). I
> think this disagreement might be due to compile time optimizations?

How did you map it to line numbers? Is it just about difference in the 
compiled binaries that results in different line numbers?

-- 
 i.

> Well, if someone knows better, let me know!
> 
> (This driver is going to give me nightmares, sorry for the bug!)
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 0384cf31187872df90f5ac3def9b1d6617e82ed5..a17efb68664c9c7723daa2aba023ba0cbc6b96dd 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -367,6 +367,7 @@ static struct {
>  	u32 beep_needs_two_args:1;
>  	u32 mixer_no_level_control:1;
>  	u32 battery_force_primary:1;
> +	u32 platform_drv_registered:1;
>  	u32 hotkey_poll_active:1;
>  	u32 has_adaptive_kbd:1;
>  	u32 kbd_lang:1;
> @@ -11820,10 +11821,10 @@ static void thinkpad_acpi_module_exit(void)
>  		platform_device_unregister(tpacpi_sensors_pdev);
>  	}
>  
> -	if (tpacpi_pdev) {
> +	if (tp_features.platform_drv_registered)
>  		platform_driver_unregister(&tpacpi_pdriver);
> +	if (tpacpi_pdev)
>  		platform_device_unregister(tpacpi_pdev);
> -	}
>  
>  	if (proc_dir)
>  		remove_proc_entry(TPACPI_PROC_DIR, acpi_root_dir);
> @@ -11893,9 +11894,8 @@ static int __init tpacpi_pdriver_probe(struct platform_device *pdev)
>  
>  static int __init tpacpi_hwmon_pdriver_probe(struct platform_device *pdev)
>  {
> -	tpacpi_hwmon = devm_hwmon_device_register_with_groups(
> -		&tpacpi_sensors_pdev->dev, TPACPI_NAME, NULL, tpacpi_hwmon_groups);
> -
> +	tpacpi_hwmon = devm_hwmon_device_register_with_groups(&pdev->dev, TPACPI_NAME,
> +							      NULL, tpacpi_hwmon_groups);
>  	if (IS_ERR(tpacpi_hwmon))
>  		pr_err("unable to register hwmon device\n");
>  
> @@ -11965,16 +11965,24 @@ static int __init thinkpad_acpi_module_init(void)
>  		tp_features.quirks = dmi_id->driver_data;
>  
>  	/* Device initialization */
> -	tpacpi_pdev = platform_create_bundle(&tpacpi_pdriver, tpacpi_pdriver_probe,
> -					     NULL, 0, NULL, 0);
> +	tpacpi_pdev = platform_device_register_simple(TPACPI_DRVR_NAME, PLATFORM_DEVID_NONE,
> +						      NULL, 0);
>  	if (IS_ERR(tpacpi_pdev)) {
>  		ret = PTR_ERR(tpacpi_pdev);
>  		tpacpi_pdev = NULL;
> -		pr_err("unable to register platform device/driver bundle\n");
> +		pr_err("unable to register platform device\n");
>  		thinkpad_acpi_module_exit();
>  		return ret;
>  	}
>  
> +	ret = platform_driver_probe(&tpacpi_pdriver, tpacpi_pdriver_probe);
> +	if (ret) {
> +		pr_err("unable to register main platform driver\n");
> +		thinkpad_acpi_module_exit();
> +		return ret;
> +	}
> +	tp_features.platform_drv_registered = 1;
> +
>  	tpacpi_sensors_pdev = platform_create_bundle(&tpacpi_hwmon_pdriver,
>  						     tpacpi_hwmon_pdriver_probe,
>  						     NULL, 0, NULL, 0);
> 
> ---
> base-commit: 1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95
> change-id: 20250330-thinkpad-fix-98db0d8c3be3
> 
> Best regards,
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
