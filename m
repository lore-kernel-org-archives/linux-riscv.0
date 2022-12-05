Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469CCC4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 09:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcyLLSi7/csBQZErmjo3PU56oWRIoJOlZDloWbXvuHI=; b=eBcpSdmwEHGzWW
	1DRO8ElIyzSIYWZeQmwHYojv4+c+bcSpzx2bEuxYZKrZi4kKBS4LOBes2kws2uB7XqwSFB0DQUNu6
	cvDukIWfWChXEpS8qChRjF6FVxnixpx8171CbrhyHgeWc4Tn/rcmCdb5mtVJWf6UjLTW4ikuUrJIp
	8M+goifDws5EOdQmyol0evmHfiEiQRWdJ3WIqpKGGYtp1oOJvel0OOOO921S4afxZVmFl9ZP0b5p9
	tk7W+kctmTBig7ZSvNDTno1PKiK/5Nj4K6oiIw9GyKnoQ0Z4SC5HCGcs6VFoa3I7kh28nbZ/s3MON
	0cQWqpkgakkrGPEXJ/6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27X2-00GtXV-C3; Mon, 05 Dec 2022 09:13:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27Wz-00GtVu-DW
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 09:12:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0EEB9B80D9A;
	Mon,  5 Dec 2022 09:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34990C433C1;
	Mon,  5 Dec 2022 09:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670231573;
	bh=/dqeLVcmlRPq/zRmA5RKSVgbtdODDXrUTMM6jDvLQ0M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nKWex4r9l4zCzHTI8CLnK+YtYeLCWTtiuZzvCjpFSRWopb0mGcZbLQO6ZWu3TB61r
	 qC1zzuPShWT9jWeVYbXnMqmEbxWSlJz6ekK4zi/vKZrm/+/ODqD0t9CIQPu3ufo3Bh
	 AQkfPgKJd1JWZIxicqiB9LpiVGoe8LGHf1xOtkXHt/lItZ9PSLBh66GDRkdx63UPXa
	 DtEdBn1hhEDqfHAomNieBHYVX2eWACky/3Te5PQNwyWeovsLCWTnnfzG7Mk3CGszn1
	 86il5CtxmCMF0J1dRWOvnh28tTQnqp/UvTYqgdFWvpYjPUhVuIA4Ko3oMEh6GbmMy9
	 9iYe1qWm+OQwA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: guoren@kernel.org, arnd@arndb.de, guoren@kernel.org,
 palmer@rivosinc.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, conor.dooley@microchip.com, heiko@sntech.de,
 jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org,
 chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com,
 zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com,
 chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Lai Jiangshan <laijs@linux.alibaba.com>,
 Borislav Petkov <bp@alien8.de>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook
 <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH -next V8 01/14] compiler_types.h: Add
 __noinstr_section() for noinstr
In-Reply-To: <20221103075047.1634923-2-guoren@kernel.org>
References: <20221103075047.1634923-1-guoren@kernel.org>
 <20221103075047.1634923-2-guoren@kernel.org>
Date: Mon, 05 Dec 2022 10:12:51 +0100
Message-ID: <87k0369pt8.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_011257_642922_86ECB28E 
X-CRM114-Status: UNSURE (   5.95  )
X-CRM114-Notice: Please train this message.
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

guoren@kernel.org writes:

> From: Lai Jiangshan <laijs@linux.alibaba.com>
>
> And it will be extended for C entry code.

It would be nice with a more elaborative commit message.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
