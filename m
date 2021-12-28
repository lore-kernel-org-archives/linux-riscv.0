Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F278C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 08:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPEjn1Sbn5F4kMmGOmu+c1qoz42lxO5KJBru/bnJZZk=; b=GL/6oM7nvmRPWM
	H2PjCm7z4RWHSr7d8OICYhKF6NoitTRpvY6oHxr6jvO64vY9UYe1Dgi9wCss2/l6o9I709Tgvh4YY
	CddHdui0ziW1uIFSJfd5CyJQhi052c5RkQ2t/XCKdRCmF7UKs4grcFbBsLlu8IEWaAzE3S/gnumSx
	AKl1Fpnzr0u9XTMHaCk0G41pPbaDETgaXd52NsiOuVpzUuDpeyXHozsRxyOvS4w9GVDhCv4AZvgFD
	t7MHXiCtqWg0FyGX+r16Yp89YNjHyssAjdsJIANJGlvls/i4MBGIo9iqvS3G6fMO+AaumWkITjaNn
	vzInLENtF6xOdn47Ms3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n27g2-000Q2J-Io; Tue, 28 Dec 2021 08:17:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n27fz-000Q1q-UY
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 08:17:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2EFDA6118D;
 Tue, 28 Dec 2021 08:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE5BC36AE8;
 Tue, 28 Dec 2021 08:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640679462;
 bh=6V/mPY6g2RVrJ859O1hhAptFGU7EB3tYhvoaTL7suFc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u8bPcC8Py2UrHh4nuBvcLx3OPPg1JpMwVwq9awnw3OPYUmJCx0u7qkcBRQFJj+rc1
 jHD8XbeKgw7R7dEzQtQPm+75l/HBYcjMc85SJuwX3G1pgFHoGAFW8jIOmdm1z2qRz4
 hWDg69i61kcll+XBLzGES7o+z6qsnD3/qhrMNiw8=
Date: Tue, 28 Dec 2021 09:17:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
Subject: Re: [RFC 30/32] /dev/port: don't compile file operations without
 CONFIG_DEVPORT
Message-ID: <YcrIHxTDipVNUuCA@kroah.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-31-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211227164317.4146918-31-schnelle@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_001744_050212_1AAA861C 
X-CRM114-Status: GOOD (  18.35  )
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

On Mon, Dec 27, 2021 at 05:43:15PM +0100, Niklas Schnelle wrote:
> In the future inb() and friends will not be available when compiling
> with CONFIG_HAS_IOPORT=n so we must only try to access them here if
> CONFIG_DEVPORT is set which depends on HAS_IOPORT.
> 
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
>  drivers/char/mem.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/char/mem.c b/drivers/char/mem.c
> index cc296f0823bd..c1373617153f 100644
> --- a/drivers/char/mem.c
> +++ b/drivers/char/mem.c
> @@ -402,6 +402,7 @@ static int mmap_mem(struct file *file, struct vm_area_struct *vma)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_DEVPORT
>  static ssize_t read_port(struct file *file, char __user *buf,
>  			 size_t count, loff_t *ppos)
>  {
> @@ -443,6 +444,7 @@ static ssize_t write_port(struct file *file, const char __user *buf,
>  	*ppos = i;
>  	return tmp-buf;
>  }
> +#endif
>  
>  static ssize_t read_null(struct file *file, char __user *buf,
>  			 size_t count, loff_t *ppos)
> @@ -665,12 +667,14 @@ static const struct file_operations null_fops = {
>  	.splice_write	= splice_write_null,
>  };
>  
> -static const struct file_operations __maybe_unused port_fops = {
> +#ifdef CONFIG_DEVPORT
> +static const struct file_operations port_fops = {
>  	.llseek		= memory_lseek,
>  	.read		= read_port,
>  	.write		= write_port,
>  	.open		= open_port,
>  };
> +#endif

Why is this #ifdef needed if it is already __maybe_unused?

In looking closer, this change could be taken now as the use of this
variable already is behind this same #ifdef statement, right?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
