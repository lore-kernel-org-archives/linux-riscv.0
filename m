Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9A8FF885A
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Apr 2026 21:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yi7rbe20Vq0WQGs7LgxoXHlyUJvPHgR1+RPaZ619Z4M=; b=kP3CunjJGm09Qg
	S2n3SU9UazrctZferUeYkxiMggArmuWDAqS3SJ7mjJEtV/uyh8gmXmLUyCvlhU8snnbGY8K060LQ8
	r1/rXlYaK4dK7Zq4+jyuRHRctVo3duWPbR4SKF5uqyMknr1/tbz0bHFaaN9IalnKPPPFdvGTPgq1l
	Un/9oXcgy/2G0lKAeL8tKAasfV+oBMwp98G3xmjGKp9OJKjHAZQLlipmzFZJea8UydsZKrDkOHzWK
	0cQWCv8rlg9aUSA4sJ47SzV+kkadHs5MJoKM9dvGsUy7fZZI9xNmXzIo5ptMIjbqyqwp16U0JJu0W
	+UEFls23p6JpxgprtOeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGkg0-0000000Eps5-2jev;
	Sat, 25 Apr 2026 21:36:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGkfx-0000000Eprl-3HDQ
	for linux-riscv@lists.infradead.org;
	Sat, 25 Apr 2026 21:36:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB5CF43E1E;
	Sat, 25 Apr 2026 21:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6338BC2BCB0;
	Sat, 25 Apr 2026 21:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1777152992;
	bh=kgsBJFWQb+PKk72sWtAhyzNQVpjZhJf4GWddDjaXhck=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=t12r9Zmyt1rPc2KtuKh8JCexDbBT+mnJAn/EjuSw8El59PPhEPNqEk58uu5gNkieS
	 EDAfiQTi3Rc7Tgc1RXOyIdKHyPmQU5P4I0EnDT6h4P9Q5UFTBOHrizFnWG5BMTyK0/
	 kcwzygkdF7TsOLKwNGIIR4bBLQvzGi6aE1NtbEvU=
Date: Sat, 25 Apr 2026 14:36:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Charlie Jenkins
 <thecharlesjenkins@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>, Ard
 Biesheuvel <ardb@kernel.org>, linux-riscv@lists.infradead.org,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] riscv32 library enhancements and build fixes
Message-Id: <20260425143631.e20246946f59925c5eb8dc22@linux-foundation.org>
In-Reply-To: <20260425185151.477442-1-dmantipov@yandex.ru>
References: <20260425185151.477442-1-dmantipov@yandex.ru>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_143633_879800_6F972050 
X-CRM114-Status: GOOD (  10.07  )
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

On Sat, 25 Apr 2026 21:51:47 +0300 Dmitry Antipov <dmantipov@yandex.ru> wrote:

> This series should immediately follow v8 of lib and lib/cmdline enhancements,
> see https://patchew.org/linux/20260212164413.889625-1-dmantipov@yandex.ru.
> Started from riscv32 build quirk, now it aims to provide platform-specific
> double-word shifts and corresponding KUnit test (tested on ARM as well).

I didn't upstream "lib and lib/cmdline enhancements v9" this cycle. 

Partly because the followup to the Sashiko review was
unclear/inconclusive.

Partly because I had a note that you'd indicated that a new version was
to be sent.

So can we please sort through these things (and the AI review) before
adding more?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
