Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1DCC77B7C
	for <linux-riscv@archiver.kernel.org>; Sat, 13 May 2023 02:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lW5EGGWMEsHWW5KZ1j4xHB//6e0Y7RybPbbhKzDRWOc=; b=b4QRy9JhhK645H
	GiT9PiV4Q+CnsaaEjZcsQNGGvkgYhcHEZwCHPyRKCRqfR3xSvwIlX2pH6oOp/V2wdVrTI2GbQhxfy
	Apm9q5TfMqJK4+VAx6qHtkG+FJY/PaT53YFuSCZzembaDDlnwrt2oyiclXN5ltkQr/HfAdFbjQgj7
	DJ1JO+sBo+APtmSKYMKCtvSsmFdvOSKxEhTtrO+OnXMX3LRvJt4EeTX8XDi39YH0jEgq7i/9E7C5V
	+j+G3WkVUj+VHYEFaXsEJ9tSfMa568BZW3F9GX3y6+WHFkJ9pE7gAxXX5oqkOxslEkJaRQ+FMLKdg
	rsVkdcoiavq3qcxcQMxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxfRv-00DZ6c-2W;
	Sat, 13 May 2023 02:57:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxfRs-00DZ69-01
	for linux-riscv@lists.infradead.org;
	Sat, 13 May 2023 02:57:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AD7E760EBB;
	Sat, 13 May 2023 02:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D739EC433D2;
	Sat, 13 May 2023 02:57:29 +0000 (UTC)
Date: Fri, 12 May 2023 22:57:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Song Shuai <suagrfillet@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mhiramat@kernel.org, mark.rutland@arm.com, guoren@kernel.org,
 e.shatokhin@yadro.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH V8 4/4] samples: ftrace: Add riscv support for
 SAMPLE_FTRACE_DIRECT[_MULTI]
Message-ID: <20230512225728.7b26caa1@rorschach.local.home>
In-Reply-To: <20230324033342.3177979-5-suagrfillet@gmail.com>
References: <20230324033342.3177979-1-suagrfillet@gmail.com>
	<20230324033342.3177979-5-suagrfillet@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_195732_108409_84F62CE3 
X-CRM114-Status: GOOD (  10.78  )
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

On Fri, 24 Mar 2023 11:33:42 +0800
Song Shuai <suagrfillet@gmail.com> wrote:

> select HAVE_SAMPLE_FTRACE_DIRECT and HAVE_SAMPLE_FTRACE_DIRECT_MULTI
> for ARCH_RV64I in arch/riscv/Kconfig. And add riscv asm code for
> the ftrace-direct*.c files in samples/ftrace/.
> 
> Link: https://lore.kernel.org/linux-riscv/c68bac83-5c88-80b1-bac9-e1fd4ea8f07e@yadro.com/T/#ma13012560331c66b051b580b3ab4a04ba44455ec
> Tested-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> Tested-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/Kconfig                          |  2 ++
>  samples/ftrace/ftrace-direct-modify.c       | 33 +++++++++++++++++
>  samples/ftrace/ftrace-direct-multi-modify.c | 39 +++++++++++++++++++++
>  samples/ftrace/ftrace-direct-multi.c        | 23 ++++++++++++
>  samples/ftrace/ftrace-direct-too.c          | 26 ++++++++++++++
>  samples/ftrace/ftrace-direct.c              | 22 ++++++++++++

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

I'm assuming this will go through the RISCV tree.

-- Steve

>  6 files changed, 145 insertions(+)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
