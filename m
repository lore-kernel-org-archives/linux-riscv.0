Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCEBC7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 07:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ziY68Au4B1YPixE89jHTQ9NM1fgwzXobJzWgBSDiDM=; b=aF0wpLSWTl0aIG
	PadhGkdQ0YZa0DGiD4TZh/gyTAAeXcJjzk9X13TOTp9/BY0w5pX+397it7luyob9rQ6NfGUHpEMge
	tsyyS64AwM9kdSLU9Kqrv6XN2zIaeAjhWT9GC/ccGC/jM5gAjaTClVuNjadSOBpLwK8wIwIJPJBbs
	0OuzQ5WjC3ALLuRQonQN+oBAnu894Sw2mH1rX8ts3cpQd+Z1mGKft+MMbVq/qquzg8zTaZqpm4Xyt
	rTqUMvRAobMj9UW9hnFET/Qbx6SabyhrvzU9K5yMcNWud6TL2IijGTa6qj4EcUBrQa8W3zzbFjE6W
	fJFMwXZHfbiLWNp8QfvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2RQn-001LFe-1D;
	Fri, 26 May 2023 07:00:09 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2RQj-001LEU-37
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 07:00:07 +0000
Date: Fri, 26 May 2023 09:00:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1685084403; bh=e/0EPN0JCH/tcPW+VvvkOIq7ybBdSQzI1QOslmxOOag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AWSx7SOU6H4PLSzMqjhNuDM2e3rNCz6zAQcp4W07o1NQ9f3RMvfMr2XGW2uVd82lF
	 YHjkhNLQyiMWH/yVUdLjtoM1EruYqjrTwi2kdt8cPfs5k09Lyvyevyyc4DS5LOyLJq
	 rXjWMOO25mja6MJXnk2zvzyeknaZYAfmI7q0I5Q8=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: w@1wt.eu, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com
Subject: Re: [PATCH 06/13] selftests/nolibc: allow specify a bios for qemu
Message-ID: <2ab94136-d341-4a26-964e-6d6c32e66c9b@t-8ch.de>
References: <cover.1684949267.git.falcon@tinylab.org>
 <63bee74a7b3754a1b0e82bc57de52c18d2de003d.1684949268.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63bee74a7b3754a1b0e82bc57de52c18d2de003d.1684949268.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_000006_169694_67156E8D 
X-CRM114-Status: GOOD (  16.45  )
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

On 2023-05-25 01:52:29+0800, Zhangjin Wu wrote:
> riscv qemu has a builtin bios (opensbi), but it may not match the latest
> kernel and some old versions may hang during boot, let's allow user pass
> a newer version to qemu via the -bios option.

Nitpick:

This seems very specific and hopefully only necessary temporarily.

Instead it could be changed to some generic mechanim like
"QEMU_ARGS_EXTRA"?

> we can use it like this:
> 
>     $ make run BIOS=/path/to/new-bios ...
> 
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  tools/testing/selftests/nolibc/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
> index 9adc8944dd80..9213763ab3b6 100644
> --- a/tools/testing/selftests/nolibc/Makefile
> +++ b/tools/testing/selftests/nolibc/Makefile
> @@ -70,7 +70,8 @@ QEMU_ARGS_mips       = -M malta -append "panic=-1 $(TEST:%=NOLIBC_TEST=%)"
>  QEMU_ARGS_riscv      = -M virt -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
>  QEMU_ARGS_s390       = -M s390-ccw-virtio -m 1G -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
>  QEMU_ARGS_loongarch  = -M virt -append "console=ttyS0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
> -QEMU_ARGS            = $(QEMU_ARGS_$(ARCH))
> +QEMU_ARGS_BIOS       = $(if $(BIOS),-bios $(BIOS))
> +QEMU_ARGS            = $(QEMU_ARGS_$(ARCH)) $(QEMU_ARGS_BIOS)
>  
>  # OUTPUT is only set when run from the main makefile, otherwise
>  # it defaults to this nolibc directory.
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
