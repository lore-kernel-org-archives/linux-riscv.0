Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745EFC3DA7A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 14:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SFTrKhNwRlaioONkBiFjUAo2VtSNFtzsb8RY1WH14Is=; b=v8P89F7ISt/rY5
	p0lhGu7fPPlSMCOSWLi3CD6X+lELbQJyiCs7iKGpM0+EQ0xVzC5Dddl/XG1CEPwzpvO8atyHMj6ty
	dfRPaJSXUKNWFAmdP3ayNB3mEkBKr306GYN4ACQdXzIkdNpVFpgW7lHRARB7lNNy8NjiHX2GdfQkL
	zNnBp2XQ+MXDK9zzW5Vz3MFycpZohZxftpCJg2paWEbYC/j5+j5sA8HQUHWDb4WWPIBwCs5V4kN4z
	ev2ylPF8fS8MqkaFFztmIjdzw2lbB2kWSvKI6qrQwVB4rrYFYg+CtON6Nt6Dp2oURISd90BLSNmQl
	tSmDr9DS6Qbw7mdDtoOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCMEC-00BwCk-7w; Mon, 02 Jan 2023 14:55:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCM8h-00BtL2-Mf
	for linux-riscv@bombadil.infradead.org; Mon, 02 Jan 2023 14:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8SJCKU8fTbFd8vJQ1sfvHwmKeW7oaWpD8QTI8/i2jyU=; b=WELv3uCCjWVG0rom/tDODfiPIJ
	Pluof2INQGBVGajHSDSX4fXwtrjRS6ong4SMJkm1pjtkwkNjWi9JVU3rNmiscVaZld6+CEfV+RJ77
	VwBPA+H6/KnROnbMKXuebTXB8tLzuC78xmQwmXhONek6mYexGHjirzA/CA4eGQ22vp+WxZVLEdJHg
	aQGfTq72lVgLe5ogV37pheoibBL0k/OZgi4K63IVWI8b3PLqGqBk7QzuRfAHbo3I8kB8QCcyVTBcd
	jHzTFbvw5SQQ9zkAUrxprR8LB1Wd3zTM+IGmlcT5OdPQKkZcFzP0pp7aBUd6FhQIj6JUNPMM9LlNl
	tynymW9w==;
Received: from [187.19.237.165] (helo=quaco.ghostprotocols.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pCM8Y-000HcP-2G;
	Mon, 02 Jan 2023 14:50:04 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 8332D40468; Mon,  2 Jan 2023 11:50:05 -0300 (-03)
Date: Mon, 2 Jan 2023 11:50:05 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Eric Lin <eric.lin@sifive.com>
Cc: peterz@infradead.org, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, namhyung@kernel.org, palmer@dabbelt.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	greentime.hu@sifive.com, vincent.chen@sifive.com
Subject: Re: [PATCH] perf tools riscv: Fix perf tool build error on riscv
Message-ID: <Y7LvHY/V6pME33I6@kernel.org>
References: <20221231052731.24908-1-eric.lin@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221231052731.24908-1-eric.lin@sifive.com>
X-Url: http://acmel.wordpress.com
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

Em Sat, Dec 31, 2022 at 05:27:31AM +0000, Eric Lin escreveu:
> Since the definition of 'struct perf_sample' has been moved to sample.h,
> we need to include this header file to fix the build error as follows:
> 
> arch/riscv/util/unwind-libdw.c: In function 'libdw__arch_set_initial_registers':
> arch/riscv/util/unwind-libdw.c:12:50: error: invalid use of undefined type 'struct perf_sample'
>    12 |         struct regs_dump *user_regs = &ui->sample->user_regs;
>       |                                                  ^~

Thanks, applied.

- Arnaldo

 
> Fixes: 9823147da6c8 ("perf tools: Move 'struct perf_sample' to a separate header file to disentangle headers")
> Signed-off-by: Eric Lin <eric.lin@sifive.com>
> ---
>  tools/perf/arch/riscv/util/unwind-libdw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/arch/riscv/util/unwind-libdw.c b/tools/perf/arch/riscv/util/unwind-libdw.c
> index 19536e172850..54a198714eb8 100644
> --- a/tools/perf/arch/riscv/util/unwind-libdw.c
> +++ b/tools/perf/arch/riscv/util/unwind-libdw.c
> @@ -4,7 +4,7 @@
>  #include <elfutils/libdwfl.h>
>  #include "../../util/unwind-libdw.h"
>  #include "../../util/perf_regs.h"
> -#include "../../util/event.h"
> +#include "../../util/sample.h"
>  
>  bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
>  {
> -- 
> 2.17.1

-- 

- Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
