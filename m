Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F05C44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 10:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/8Ar8DXQEx6+BoyOSeD8iumK176vidF+RzP2sHq8pg=; b=CnrdXxYdoZm2B/
	h55vUDpbniNIIJnBRNqAA1yIivVrhWEUn602JWCfMXva9SWQPnkP4z2oO6fe/8IruFb9pJgv7ElUr
	pTlWFEBGutMz9CSLv9rdVsgAAJk8SsO7y0IptYCb+xAuVWftj3hyGBosX30obays04JPRzKgogzoZ
	F31t5iG/LcAHGwwdruNvsYNdttHd9Lt1A9FVunOBHTcmA1FIF9pmxT4MeBaNQdnAT6tES2ZAEfTm6
	Nr4suE/pkbzVL3o8FFr/164H7LJQbXTtKLvwhXDBC4eL6vrLTir6LKF+7iCfNkq+tR898EusspGks
	kJTXh+NhFvyHRAvCbzxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virwK-00000006qQ9-3sP5;
	Thu, 22 Jan 2026 10:29:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virwJ-00000006qPp-2ncV
	for linux-riscv@bombadil.infradead.org;
	Thu, 22 Jan 2026 10:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=i/IM1UBePwfyfu0FVWvj2KzpIR5W4AOMRVUbtEg+z2E=; b=YZLeuiwycH06649SJpuqJiudSB
	hmm6BkBxVflJFnNmXeOgMQAcI54B6QeAZc0d9sAv2cLfyf5CUJwRs2blihHf9zujFCFrrIPr5vnwe
	3ASUb5YuaEumcH8lO0GxUMIKalsqvLBWM01ePbaPVjOhkP5VxJyqNcyx614Ny6cYiLSAJB7HKBH8e
	TPaj9OINdPWbWdARZVHTkacDPS6S6Ycn7vXfMIytsre6+z5sn9KPeQyG6GFx3u8gP5llo+zn1l6Z4
	MSAMPCUiWg3UTHv7+EubtjeCEEBJnL9109ALUONiRLSdwbPO9OBueYbANV8tRFVguP8BDxpucvJwt
	Qy4NKnNA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virwG-0000000098X-2JOQ
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 10:29:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 932F543710;
	Thu, 22 Jan 2026 10:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3EFAC116C6;
	Thu, 22 Jan 2026 10:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769077758;
	bh=uKRKux9iS3ROkkfKKUwwUwqJYfhukxH9PcpBbqJv6xE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rrkUvSIT8cVE/uNuxROhUecxxNK5GNNXVdlRCj+0HgYBSC/RlvJnWqCR+Cktq/E0I
	 2I2RLjPeaSlZZJYAcZGNfkzfxJuax/H2abVtyEty5V8W9woU7p3rhneP/DxRPboOg+
	 6fruH1rQcqoALVaMrBKR8nzJ7J6UOwdlqXagbZw4=
Date: Thu, 22 Jan 2026 11:29:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: rafael@kernel.org, lenb@kernel.org, tglx@kernel.org, dakr@kernel.org,
	akpm@linux-foundation.org, apatel@ventanamicro.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	geshijian@picoheart.com, weidong.wd@picoheart.com,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] ACPI: scan: Use async schedule function for
 acpi_scan_clear_dep_fn
Message-ID: <2026012214-dinginess-improper-9bc1@gregkh>
References: <20260122073446.45628-1-yang.yicong@picoheart.com>
 <20260122073446.45628-2-yang.yicong@picoheart.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122073446.45628-2-yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_102920_979506_0A1C7097 
X-CRM114-Status: GOOD (  27.07  )
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

On Thu, Jan 22, 2026 at 03:34:45PM +0800, Yicong Yang wrote:
> The device object rescan in acpi_scan_clear_dep_fn is scheduled
> in the system workqueue which is not guaranteed to be finished
> before entering userspace. This will cause the problem that
> some key devices are missed when the init task try to find them,
> e.g. console devices and root devices (PCIe nvme, etc).
> This issues is more possbile to happen on RISCV since these
> devices using GSI interrupt may depend on APLIC and will be
> scanned in acpi_scan_clear_dep_queue() after APLIC initialized.
> 
> Fix this by scheduling the acpi_scan_clear_dep_queue() using async
> schedule function rather than the system workqueue. The deferred
> works will be synchronized by async_synchronize_full() before
> entering init task.
> 
> Update the comment as well.
> 
> Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
> ---
>  drivers/acpi/scan.c | 35 ++++++++++++++++-------------------
>  1 file changed, 16 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 416d87f9bd10..bf0d8ba9ba19 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -5,6 +5,7 @@
>  
>  #define pr_fmt(fmt) "ACPI: " fmt
>  
> +#include <linux/async.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/slab.h>
> @@ -2365,39 +2366,35 @@ struct acpi_scan_clear_dep_work {
>  	struct acpi_device *adev;
>  };
>  
> -static void acpi_scan_clear_dep_fn(struct work_struct *work)
> +static void acpi_scan_clear_dep_fn(void *dev, async_cookie_t cookie)
>  {
> -	struct acpi_scan_clear_dep_work *cdw;
> -
> -	cdw = container_of(work, struct acpi_scan_clear_dep_work, work);
> +	struct acpi_device *adev = to_acpi_device(dev);
>  
>  	acpi_scan_lock_acquire();
> -	acpi_bus_attach(cdw->adev, (void *)true);
> +	acpi_bus_attach(adev, (void *)true);
>  	acpi_scan_lock_release();
>  
> -	acpi_dev_put(cdw->adev);
> -	kfree(cdw);
> +	acpi_dev_put(adev);
>  }
>  
>  static bool acpi_scan_clear_dep_queue(struct acpi_device *adev)
>  {
> -	struct acpi_scan_clear_dep_work *cdw;
> -
>  	if (adev->dep_unmet)
>  		return false;
>  
> -	cdw = kmalloc(sizeof(*cdw), GFP_KERNEL);
> -	if (!cdw)
> -		return false;
> -
> -	cdw->adev = adev;
> -	INIT_WORK(&cdw->work, acpi_scan_clear_dep_fn);
>  	/*
> -	 * Since the work function may block on the lock until the entire
> -	 * initial enumeration of devices is complete, put it into the unbound
> -	 * workqueue.
> +	 * Async schedule the deferred acpi_scan_clear_dep_fn() since:
> +	 * - acpi_bus_attach() needs to hold acpi_scan_lock which cannot
> +	 *   be acquired under acpi_dep_list_lock (held here)
> +	 * - the deferred work at boot stage is ensured to be finished
> +	 *   before entering init task by the async_synchronize_full()
> +	 *   barrier
> +	 *
> +	 * Use _nocall variant since it'll return on failure instead of
> +	 * run the function synchronously.
>  	 */
> -	queue_work(system_dfl_wq, &cdw->work);
> +	if (!async_schedule_dev_nocall(acpi_scan_clear_dep_fn, &adev->dev))
> +		return false;

This really feels wrong to me, you are taking a code path that has been
working for quite a while and changing it.  Perhaps your system ACPI
tables are the thing that is incorrect here?

What exactly is the problem that you are seeing?  Why not start with
that and then we can work out how to solve that issue?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
