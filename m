Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0331EC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Dec 2021 10:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/JEsaFyInHzL1Q3YavWQ3zNinr89cpZ3P6bA2iWMrs=; b=j2K33QkqRrNwqD
	xaSpLZT7Q+HehnuN+BOmmwm1QmCZBDjGGbYFeb2lodxobKjtQu4UT20zHRJDAvGCmNkn6JFJIhcr5
	LeyKptE7CzoKwzIn+iLNAomDPxR7hzDVb7N9xTrRRuOl++Z15nzHgjGQADrrhOmhlh9Xxr7TRa0XZ
	NktqN9ZsQYtAB04C8nvvMID56DHb0oTO1qOiLSyH4WqvJ/pBb1OWwnF/5CVJhx16jgKQkwECjmtfy
	fIEBJovM3s8OPGYjmYTSqNokqviyDDWy4IemhFwssBlTeFC1CQ3SjaXdE0zRAPOS76PX+vSRwme5Y
	X26Ei6oqd9kUEFGRjruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2WLa-002dFK-85; Wed, 29 Dec 2021 10:38:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2WLX-002dEK-5Y
 for linux-riscv@lists.infradead.org; Wed, 29 Dec 2021 10:38:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB4A76145C;
 Wed, 29 Dec 2021 10:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DC2C36AE7;
 Wed, 29 Dec 2021 10:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640774292;
 bh=MExT51K+cGJEBXy7Nsv/QpJxU3pTYvrD4E5i8bK9DOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e9QYlMttgSRarsJgqy6RTpuJPTLqpMOm2PuYI3d9KxksJUGpT47Bq9VIOTAc22POh
 BWK6a7geSXy8NtvXs0ch5Beu0/OCyOgYTARgWZ6NDq2ND0lfvc224daBqzAcKD2V7f
 k/ACoPlzyJu83nevIpGgKhTsdTJTseONUAqkts6M=
Date: Wed, 29 Dec 2021 11:38:09 +0100
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
Message-ID: <Ycw6kXhd+NV0GMWc@kroah.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-31-schnelle@linux.ibm.com>
 <YcrIHxTDipVNUuCA@kroah.com>
 <b9d0c0b88ef66f9beb51a880e765177670a76394.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b9d0c0b88ef66f9beb51a880e765177670a76394.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_023815_333465_25063040 
X-CRM114-Status: GOOD (  24.39  )
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

On Wed, Dec 29, 2021 at 11:25:12AM +0100, Niklas Schnelle wrote:
> On Tue, 2021-12-28 at 09:17 +0100, Greg Kroah-Hartman wrote:
> > On Mon, Dec 27, 2021 at 05:43:15PM +0100, Niklas Schnelle wrote:
> > > In the future inb() and friends will not be available when compiling
> > > with CONFIG_HAS_IOPORT=n so we must only try to access them here if
> > > CONFIG_DEVPORT is set which depends on HAS_IOPORT.
> > > 
> > > Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> > > Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> > > Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> > > ---
> > >  drivers/char/mem.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/char/mem.c b/drivers/char/mem.c
> > > index cc296f0823bd..c1373617153f 100644
> > > --- a/drivers/char/mem.c
> > > +++ b/drivers/char/mem.c
> > > @@ -402,6 +402,7 @@ static int mmap_mem(struct file *file, struct vm_area_struct *vma)
> > >  	return 0;
> > >  }
> > >  
> > > +#ifdef CONFIG_DEVPORT
> > >  static ssize_t read_port(struct file *file, char __user *buf,
> > >  			 size_t count, loff_t *ppos)
> > >  {
> > > @@ -443,6 +444,7 @@ static ssize_t write_port(struct file *file, const char __user *buf,
> > >  	*ppos = i;
> > >  	return tmp-buf;
> > >  }
> > > +#endif
> > >  
> > >  static ssize_t read_null(struct file *file, char __user *buf,
> > >  			 size_t count, loff_t *ppos)
> > > @@ -665,12 +667,14 @@ static const struct file_operations null_fops = {
> > >  	.splice_write	= splice_write_null,
> > >  };
> > >  
> > > -static const struct file_operations __maybe_unused port_fops = {
> > > +#ifdef CONFIG_DEVPORT
> > > +static const struct file_operations port_fops = {
> > >  	.llseek		= memory_lseek,
> > >  	.read		= read_port,
> > >  	.write		= write_port,
> > >  	.open		= open_port,
> > >  };
> > > +#endif
> > 
> > Why is this #ifdef needed if it is already __maybe_unused?
> 
> Because read_port() calls inb() and write_port() calls outb() they
> wouldn't compile once these are no longer defined. Then however the
> read_port/write_port symbols in the struct initialization above
> couldn't be resolved.
> 
> > 
> > In looking closer, this change could be taken now as the use of this
> > variable already is behind this same #ifdef statement, right?
> 
> Yes

Great, feel free to send this individually, not as a RFC patch, and I
will be glad to queue it up.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
