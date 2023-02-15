Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3A2C05027
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 00:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=9tGlkBdE6/lmzPEWWazNFtMfD27MOFfHIHj9119QihA=; b=xduRIJPg57ddK0lX4QrwGOLEIu
	GJFn+5vdb0KVyWW4x3hEqDMKJQl/uMmzBXA0dheL6JhrfJFCfmER1O8GXZ5N01R3VSwdBTIHyBA2r
	BNiO1Ye908cqq1hDUaoko0Fp+QhxenwvapRwHENszFknjGHy6yPUZu4onNOjNNzztHtauyiJW7uv4
	+eH8JUntdtN7PIdvfuOSNpo2vGK7/78p6ZriijWlKNClGvUfb61ARzF7MZCIgdcY8NZC5wXdVzaOn
	ZjMMfeoxSQeEV4jyLVAjlTjXSsjdWlK306WM1pzSvgjh0BLeIdSwRa1huLLa7MzcRjaOx5HdowAvL
	ScD+qNYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS5UY-0042Ni-1v; Wed, 15 Feb 2023 00:17:46 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS5UV-0042ME-IK
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 00:17:44 +0000
Received: by mail-pg1-x530.google.com with SMTP id c29so7289670pgm.5
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 16:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49K1SGeEsD5aesWP7FDsHkUnjeFT5dcvalIp3zIlHsw=;
        b=V75C9Q3Zm3+1G94MWsxwQyX/S8btV8YDkSy1akRXEGYEIgk3KLv7c+Ayz+TUK2uTjj
         4CAViuS2sz7D9Em8sIJN7RHh/zbZ53GwpJCfoQIzy3t1eperCII0C7R+NHQ2Qt/EsVn7
         M3pB5/FqUsdCJFr5L5iNf3ZKIqxHH5Bi9XVTqQAmh4hY+b7+FFcu6fRyl5LCsXsuQHhd
         KNn3IunLqPf4247WiVmqeNmcWVcBXEbu1NRqsCC+FchYUK6GyMslgAFFtvIwvrQBEHF7
         0PFnHupEbDbWR2mfphUcCRicvASoYa60Vw6PF0ebypXP95cGGwj7YRUt4C3WRYbklisc
         DodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49K1SGeEsD5aesWP7FDsHkUnjeFT5dcvalIp3zIlHsw=;
        b=rNBEMyyfVCDXc9z7a+u9SKEEiDwATVTlA1GyVvIrPO11MFTkUScDqbGKq1HxRGccCJ
         a/wLBijS3hw7cvoJWdG2YfQoL3xKYmgmREIWfAdxfeurqvXo8vWLAL14tYYcboiEf1xv
         am6FDgBy5AFuaOCaf8yqBK8m1xMfjgqeXAZq1FFkPOeOpJINck38TGMFisaD1+BCRSha
         mVpmAoQRtux/9w+wTU+RyUTE/JszbLhkrGO/o9fIwyLX64YZBOn7NA6L5ddZmlvVcwCg
         jVsNcdj8rNIXT86rD1htS8789UTCwTaJKW3F756EkHUuJXKpZOrf7xM/4QMWDRcUPjKt
         QaHg==
X-Gm-Message-State: AO0yUKXgw8S48LPIHsMWp6UuRQKv8/6dvP0vd1QOg3+P5xwLfz4C3W0b
	zfMZDOw5YtaQ10nNVZ7DlEBYsw==
X-Google-Smtp-Source: AK7set+FcSEX2KIayzVpc9dxLfpS02jLRApEgFCsNa/U9uiRYyh5Z/vDMFwT1L+IQS6a1lGdYiDcuA==
X-Received: by 2002:aa7:9886:0:b0:5a8:46b0:8269 with SMTP id r6-20020aa79886000000b005a846b08269mr3732865pfl.31.1676420260501;
        Tue, 14 Feb 2023 16:17:40 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id a20-20020aa780d4000000b0058d54960eccsm10293954pfn.151.2023.02.14.16.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 16:17:39 -0800 (PST)
Date: Tue, 14 Feb 2023 16:17:39 -0800 (PST)
X-Google-Original-Date: Tue, 14 Feb 2023 16:17:22 PST (-0800)
Subject: Re: [PATCH 1/3] kernel/reboot: Use the static sys-off handler for any priority
In-Reply-To: <20221228161915.13194-2-samuel@sholland.org>
CC: dmitry.osipenko@collabora.com, rafael.j.wysocki@intel.com, samuel@sholland.org,
  aou@eecs.berkeley.edu, apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>,
  geert@linux-m68k.org, heiko@sntech.de, kai.heng.feng@canonical.com, mcgrof@kernel.org,
  paulmck@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, pmladek@suse.com,
  yuehaibing@huawei.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  tangmeng@uniontech.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel@sholland.org
Message-ID: <mhng-fbf5d10c-239d-4e47-bf52-3e1255cbe5e0@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_161743_623306_D423CBF3 
X-CRM114-Status: GOOD (  28.10  )
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

On Wed, 28 Dec 2022 08:19:13 PST (-0800), samuel@sholland.org wrote:
> commit 587b9bfe0668 ("kernel/reboot: Use static handler for
> register_platform_power_off()") addded a statically-allocated handler
> so register_sys_off_handler() could be called before the slab allocator
> is available.
>
> That behavior was limited to the SYS_OFF_PRIO_PLATFORM priority.
> However, it is also required for handlers such as PSCI on ARM and SBI on
> RISC-V, which should be registered at SYS_OFF_PRIO_FIRMWARE. Currently,
> this call stack crashes:
>
>   start_kernel()
>     setup_arch()
>       psci_dt_init()
>         psci_0_2_init()
>           register_sys_off_handler()
>             kmem_cache_alloc()
>
> Generalize the code to use the statically-allocated handler for the
> first registration, regardless of priority. Check .sys_off_cb for
> conflicts instead of .cb_data; some callbacks (e.g. firmware drivers)
> do not need any per-instance data, so .cb_data could be NULL.
>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
>  kernel/reboot.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/kernel/reboot.c b/kernel/reboot.c
> index 3bba88c7ffc6..38c18d4f0a36 100644
> --- a/kernel/reboot.c
> +++ b/kernel/reboot.c
> @@ -327,7 +327,7 @@ static int sys_off_notify(struct notifier_block *nb,
>  	return handler->sys_off_cb(&data);
>  }
>
> -static struct sys_off_handler platform_sys_off_handler;
> +static struct sys_off_handler early_sys_off_handler;
>
>  static struct sys_off_handler *alloc_sys_off_handler(int priority)
>  {
> @@ -338,10 +338,8 @@ static struct sys_off_handler *alloc_sys_off_handler(int priority)
>  	 * Platforms like m68k can't allocate sys_off handler dynamically
>  	 * at the early boot time because memory allocator isn't available yet.
>  	 */
> -	if (priority == SYS_OFF_PRIO_PLATFORM) {
> -		handler = &platform_sys_off_handler;
> -		if (handler->cb_data)
> -			return ERR_PTR(-EBUSY);
> +	if (!early_sys_off_handler.sys_off_cb) {
> +		handler = &early_sys_off_handler;
>  	} else {
>  		if (system_state > SYSTEM_RUNNING)
>  			flags = GFP_ATOMIC;
> @@ -358,7 +356,7 @@ static struct sys_off_handler *alloc_sys_off_handler(int priority)
>
>  static void free_sys_off_handler(struct sys_off_handler *handler)
>  {
> -	if (handler == &platform_sys_off_handler)
> +	if (handler == &early_sys_off_handler)
>  		memset(handler, 0, sizeof(*handler));
>  	else
>  		kfree(handler);

Sorry for being slow here, I'd been assuming someone would Ack this but 
it looks like maybe there's nobody in the maintainers file for 
kernel/reboot.c?  I'm fine taking this via the RISC-V tree if that's OK 
with people, but the cover letter suggests the patch is necessary for 
multiple patch sets.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
