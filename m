Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1964BC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 07:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1WWhpopH3ivIwu0L//iWMLoRU8QV2dXUtxe0CtYTRU=; b=fTbnVt8t4xJGHm
	Vr1v0ap2hJ0x+3w9ZfAJhcIv5xIDzHtyFl1mjg2cy0Wuq6zeTzXH7iigpysCjjS/AJUeN8pNGux3M
	eeM56ytDTGYbXA2AQ8tGLfnpFwxb169hOQFXd6UqXZeS+liZE9e8EsWJFVOoaWdOiNF9fYW+/w3JY
	9AUOsS8Y2YRHmXfDuLrcGVp7VUn27CijBqzsZcSjXe+VtT4J8QH7T0147YG6MdPviScKJ2JxA5Muq
	A30ac58AvI9tX5lEWkETnKHjcOyTBwV/iYafifWV2mYchGp+zaE4RiwWlBWxkDBBguzn6zjUSBWev
	hQfpphlpRJlIDm8NwzvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqVWq-009Q7H-Oi; Fri, 26 Nov 2021 07:20:16 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqVWm-009Q6S-Hu
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 07:20:15 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N7Qp3-1mY3xk3q5F-017lb3 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov
 2021 08:20:09 +0100
Received: by mail-wr1-f50.google.com with SMTP id i5so16619467wrb.2
 for <linux-riscv@lists.infradead.org>; Thu, 25 Nov 2021 23:20:09 -0800 (PST)
X-Gm-Message-State: AOAM530euruWEPJbDDhFHpikFQR6AovWhJ8nHSyMV/ozDoYCPjbp7kSV
 bOAIBNVfFrYY3jxKonnFK8r6zuDf6WakhgEtamg=
X-Google-Smtp-Source: ABdhPJzZwWlD2B3L8ZKxMP+6Iw52iLVzMbJFKx/TFmY1gNnt9IEggU9uLBROHoo9pcxPbq1sCUgEFqfcp4SmYx9h+ko=
X-Received: by 2002:adf:d091:: with SMTP id y17mr12829566wrh.418.1637911209569; 
 Thu, 25 Nov 2021 23:20:09 -0800 (PST)
MIME-Version: 1.0
References: <20211126060024.3290177-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211126060024.3290177-1-alistair.francis@opensource.wdc.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 26 Nov 2021 08:19:53 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1WPgrkw5N9acSZ1bRPjBUS0bXSjSBRSW2pYA-m-mc=Qw@mail.gmail.com>
Message-ID: <CAK8P3a1WPgrkw5N9acSZ1bRPjBUS0bXSjSBRSW2pYA-m-mc=Qw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] perf bench futex: Add support for 32-bit systems
 with 64-bit time_t
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Arnd Bergmann <arnd@arndb.de>, Namhyung Kim <namhyung@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Alistair Francis <alistair23@gmail.com>,
 Jiri Olsa <jolsa@redhat.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Ingo Molnar <mingo@redhat.com>, 
 Darren Hart <dvhart@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 linux-perf-users@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Arnaldo Carvalho de Melo <acme@redhat.com>
X-Provags-ID: V03:K1:UdS4yDHDUXv7va4ibuMoqHn/5fW6YW2he14ZtaGDthoOCra9fjs
 9tLZ7iCkyWebwguoDHr2oy1Uh8QM8yvizzGgSSN9ufYA6Dj6bMQJ6QA5vWPcc1K6ZZSzAup
 fd4toroUmFnB3FuL5qRstx1mte6mgpQo9Xj3e63ihnMO24DHfwKU7UTW97vbRRa2pLTlDTm
 SoTXBzslMLKndH2X1UD+A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:F4lFHGhQ0T0=:YrfcoLXCaEfcGgbdL80hMP
 wXpUW88N7UNlFgR+5BgeqY1dJjyA4gcM7QjnCRSNeCCCILZVaybdK4MpezekFixcJgY9rDHpO
 bXikgncBIq3LmGX6aCA9rNGdCOAy++xXahBL7kNQeqPxkdxe9Iw2DiZtfVK1lq4TPiJzjZc4E
 P08ZNT/HJzT/nnLwKJumktjRAjFqTH8y+/a1noDZM4S+qDnL54aSWzWQbUANapVZF4TdQyW8T
 Oi8ClZ/55rrS3h39NCo5UbRuiQB0OsDnoUAaHyyT0EHrvxFMp4deN1aLaNiwjniVvIX7BYS82
 dVK+WjcIoyxSUJsACZIIhmri8HbujHeAjRI36c4RyXG8WCf49dVR3n+eTfbGD76B8Ypz6Ioj9
 hE52ZWM7lwQlGNCmhfMTPfij+C1voG6ugGy/o37Kqs7PX6DVWT2DC32WGPJXV29EHDF5B2G0y
 YTqPswI+AoenBLr77mo3Oa9ps0ErxcT1krsz/gUQs+SWaeR7YuBnX568g39+Nle2BvoOMH+dM
 UIjpHLl55rA6v2F+9oKeaEXZHqr1Z3l6HJFmeNxaZ3wmnyFQUat1WKgIDdoYYvY6p1ZzG9uDz
 40wDnPu5yrt34dar8OW9SzZ67Be93s3nOdB08RlqQ9J1uwWwoDBvTOihhIaoI6jW3SZc6BgfA
 zmCc+FfkSmAiNCf9kCSRF8P+FZXTsB02qMPjxcXT3HaDjC2a0wGEPEx4KpnQAceKTt8c=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_232012_912908_083A997B 
X-CRM114-Status: GOOD (  16.60  )
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

On Fri, Nov 26, 2021 at 7:00 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Some 32-bit architectures (such are 32-bit RISC-V) only have a 64-bit
> time_t and as such don't have the SYS_futex syscall. This patch will
> allow us to use the SYS_futex_time64 syscall on those platforms.
>
> This also converts the futex calls to be y2038 safe (when built for a
> 5.1+ kernel).
>
> This is a revert of commit ba4026b09d83acf56c040b6933eac7916c27e728
> "Revert "perf bench futex: Add support for 32-bit systems with 64-bit time_t"".
>
> The original commit was reverted as including linux/time_types.h would
> fail to compile on older kernels. This commit doesn't include
> linux/time_types.h to avoid this issue.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>


Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
