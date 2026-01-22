Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9BCC44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 10:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mw1aCmoUErK5bt/ZTBekvWs6m4iV5XXZvuYXLOkoq74=; b=zbt2AtKqQLPBa5
	OszoP58uKRXJUzebdSiZD+eVziYd8QoBH5SIMqe2gee6X+se7BowsN/deB8TVAEArD7oKUTqkm7Yl
	pLC8H3fFtngntJwS+wu+NZBBvgRjwehc+D4EZZt4+e86Qy6XQYfAKr2pYq88Xnmhkb3pIXMLPJFLf
	hPc0sH2w24M5f9JMQBy/M2nPIt4fXC5Tz0M31FZtGqvnWdmFK4YbfQIPJVfOrrBXiLEnyq7UHvxAw
	P6cFndHuYsY/bm3rsaNHOb8wCnNhZFRwVVwv7b/TiMpfmhBXDbuiiXEtgQhkcfkFM3aLjMzrj8rlL
	k31vjOclgXLxu65NXYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virv3-00000006qBP-2RTn;
	Thu, 22 Jan 2026 10:28:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virv1-00000006qA3-2AJd
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 10:28:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B66B4172B;
	Thu, 22 Jan 2026 10:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82534C116C6;
	Thu, 22 Jan 2026 10:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769077681;
	bh=6ckSUwc/iIKoCmY09RXbCNVzp3fPEqGJSThtHhnQ2zU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=11LfwkKq9xyMb/7AnGfz7QVFZ2bVm87rZ671wyPXqcy3phbUQsO2Z/BX6GTck5qIp
	 xL8PAWwbyn4AkP9CfPjpDp/5yKdvseSTmviy9uZM+U4pNag3ga3YOgRKnZARxteJf0
	 m88bT1JvGyGtcOuIMkSZ2JhPlHoe9hWiNTCxgFko=
Date: Thu, 22 Jan 2026 11:27:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: rafael@kernel.org, lenb@kernel.org, tglx@kernel.org, dakr@kernel.org,
	akpm@linux-foundation.org, apatel@ventanamicro.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	geshijian@picoheart.com, weidong.wd@picoheart.com,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] init: Move console_on_rootfs after
 async_synchronize_full
Message-ID: <2026012217-opium-grit-2295@gregkh>
References: <20260122073446.45628-1-yang.yicong@picoheart.com>
 <20260122073446.45628-3-yang.yicong@picoheart.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122073446.45628-3-yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_022803_594858_BE858367 
X-CRM114-Status: GOOD (  22.68  )
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

On Thu, Jan 22, 2026 at 03:34:46PM +0800, Yicong Yang wrote:
> Currently the console_on_rootfs() is called before
> async_synchronize_full(), the console initialization
> could be still in process in theory due to async
> probe, etc. Make it after the async_synchronize_full()
> to make sure the initialization work is done.

Please wrap at 72 columns.

> 
> Log the error code as well if we failed to open the console.
> 
> Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
> ---
>  init/main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/init/main.c b/init/main.c
> index b84818ad9685..c37ba5f89b96 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1578,6 +1578,7 @@ static int __ref kernel_init(void *unused)
>  	kernel_init_freeable();
>  	/* need to finish all async __init code before freeing the memory */
>  	async_synchronize_full();
> +	console_on_rootfs();

Are you sure this is ok?  Messing around with init levels and order is
_VERY_ tricky.

Your console should NOT be on an async probe path, if you really need
it, then do not do that at all.  Make it sync, and then it should be ok.

>  
>  	system_state = SYSTEM_FREEING_INITMEM;
>  	kprobe_free_init_mem();
> @@ -1647,7 +1648,7 @@ void __init console_on_rootfs(void)
>  	struct file *file = filp_open("/dev/console", O_RDWR, 0);
>  
>  	if (IS_ERR(file)) {
> -		pr_err("Warning: unable to open an initial console.\n");
> +		pr_err("Warning: unable to open an initial console, err = %ld\n", PTR_ERR(file));

Why is this changed?

>  		return;
>  	}
>  	init_dup(file);
> @@ -1690,7 +1691,6 @@ static noinline void __init kernel_init_freeable(void)
>  	kunit_run_all_tests();
>  
>  	wait_for_initramfs();
> -	console_on_rootfs();

You just delayed the console output for many (i.e. most) systems out
there, are you sure that is acceptable to them?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
