Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE834C25B71
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 15:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKxvz3mEcNFkaTgXesvsIUzTPZIdwDKGj1NzuFJlaas=; b=U2D8VOeL5znd8a
	C0U5A9tEWwOSsT/gxdDVlUAatKlmxJiiJiATCfCbrMLc3AepLUMv6/J7JewJzQZtD4Dgvi41THeYn
	CtGajz4Fu7xMTQe2cZRAOsggddUtZwYo6bB8S3wXZhZlOKaYOFO5T55bBALVOo7vaA5+rIYEnFASK
	WQ5CyUSlRwr52OcUVZ/zR7UF0ZVPu0E2kSczUCEf+qtkG9dT/VPWdJC/sFlxvaG94qZUujdQ8ZgiQ
	kOc5xTvoWlzb1VkIqxRiPI6z/oKKJNvncs1D63hqaWMVIlaPFq9T6KpUTgsUIWmyM3Tv5KYfNBoPf
	jHVzV2EDxESMiKInfinQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJYb-00AMtl-2o;
	Tue, 24 Oct 2023 15:43:01 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJYY-00AMsq-2v;
	Tue, 24 Oct 2023 15:43:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698162178; x=1729698178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TR0MsODDCDld/9hD7QPnERhiZ/gxH5leUiM0oaDfwbI=;
  b=hJ+3iO4crjq3S11tzx3SMZttiJTl2uZkOF8apQY0S8qba8Qk6pqzw7to
   br69v2YMIKGTeymIV6Z2uA/0OJN/sJr7pRRTqbjCfjZzvGhvJ4Fw36VQw
   NXekZIuPBNu41ZxznyVL8r25LZyd7fLEYV9Iy7Js3vg8vr4f7jwg0Wl77
   Cf9zpHxYsTg7qWzFJGRjGbjYSy+rBl/Rgb/X/xnO/F1Bl7NX9ZtT18Lvw
   D71+CpRO4TzuCS1snVpodI1zYhn1PrpgH4ahhv9UfsDqZk1MmbiJIfX5l
   OswzeXeJnrXJwUyQDesDeXFL4YZ58VzCVu0Gfi0oJaeywVBPAr2qXsnGl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="389946489"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="389946489"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:36:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="1089891583"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="1089891583"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:32:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qvJOa-00000008Jsh-3eUI;
	Tue, 24 Oct 2023 18:32:40 +0300
Date: Tue, 24 Oct 2023 18:32:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 38/39] cpumask: Add enabled cpumask for present CPUs that
 can be brought online
Message-ID: <ZTfjmM3nmeh+D5w/@smile.fi.intel.com>
References: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
 <E1qvJBk-00AqSW-R8@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1qvJBk-00AqSW-R8@rmk-PC.armlinux.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_084259_069917_169C16F8 
X-CRM114-Status: GOOD (  14.95  )
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

On Tue, Oct 24, 2023 at 04:19:24PM +0100, Russell King wrote:
> From: James Morse <james.morse@arm.com>
> 
> The 'offline' file in sysfs shows all offline CPUs, including those
> that aren't present. User-space is expected to remove not-present CPUs
> from this list to learn which CPUs could be brought online.
> 
> CPUs can be present but not-enabled. These CPUs can't be brought online
> until the firmware policy changes, which comes with an ACPI notification
> that will register the CPUs.
> 
> With only the offline and present files, user-space is unable to
> determine which CPUs it can try to bring online. Add a new CPU mask
> that shows this based on all the registered CPUs.

...

> +static ssize_t print_cpus_enabled(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpu_enabled_mask));
> +}
> +static DEVICE_ATTR(enabled, 0444, print_cpus_enabled, NULL);

Hmm... DEVICE_ATTR_RO() ?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
