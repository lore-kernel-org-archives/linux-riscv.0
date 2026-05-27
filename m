Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B46DCD5BD0
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 15:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7UEn9xlGrR+pMmHBuVz+NPZ+SBGEOf4Jp78e+3Rwhzo=; b=F3kUlN7Iv6ZkAn
	FgXzgmWy9tOaY1GntoUDNZVvhD5NyUddTt2VOG3Z5dzeZSACyo1+0KaQdBE1f+zWYAmh8iYvOMxJZ
	zlcqO4aIWQNPQo53Wef4sreOByLHOQ2zshjDlBt9aKZOFPN1z68W9z7dMcvFtnRbvnf2cKOj57oBP
	fV1UNQ/7DWm3G5/zWjzudop+B0eoCt1/Uodvg2XAy0RCI72e+QOLjA4x7FDV9V08HnzHT2TUd0f/F
	P4uLF0Z3NG88Ab0hMqXCeoapCgzvTK5HnblzJqD/zwEDS1XYkUJx3pqJtwC24ak2ascrPFZBT9Ofm
	r1lC4I91L03p5DtR4u3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGDX-00000004PRI-0HZG;
	Wed, 27 May 2026 15:30:47 +0000
Received: from smtprelay0016.hostedemail.com ([216.40.44.16] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGDU-00000004PQT-00Sc
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 15:30:45 +0000
Received: from omf02.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 3C476A0651;
	Wed, 27 May 2026 15:30:37 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf02.hostedemail.com (Postfix) with ESMTPA id B12158000E;
	Wed, 27 May 2026 15:30:29 +0000 (UTC)
Date: Wed, 27 May 2026 11:30:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Wang Han <wanghan@linux.alibaba.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Chen Pei
 <cp0613@linux.alibaba.com>, Andy Chiu <andybnac@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Deepak Gupta
 <debug@rivosinc.com>, Puranjay Mohan <puranjay@kernel.org>, Conor Dooley
 <conor.dooley@microchip.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri
 Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek
 <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung
 Kim <namhyung@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 1/8] scripts/sorttable: Handle RISC-V patchable ftrace
 entries
Message-ID: <20260527113028.4b21a5de@fedora>
In-Reply-To: <20260527123530.2593918-2-wanghan@linux.alibaba.com>
References: <20260527123530.2593918-1-wanghan@linux.alibaba.com>
	<20260527123530.2593918-2-wanghan@linux.alibaba.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: B12158000E
X-Stat-Signature: nnbmrnfbfe1wryzsbgekpraefim6x8ui
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+K9+QhA9jGvAkANPOLEFyENvfDDvbRRfc=
X-HE-Tag: 1779895829-775147
X-HE-Meta: U2FsdGVkX19wPgPqZNdREAfoBR1Mb1SYjw1Qr1fZaDsU2ZIANjz8nzdue+HVeK2Zhwus4Rq5inE4ARZBKtoCeWe0ubFDOoBMTV3DKQduvwyTdxCeh07J7RG5bppBc+QRHCVi7uGFASdNJj+Oti7v6B7UoYG7kOcUTzoJfTcYLn6i1oNAkLtatX5dFGJ42OfJuyqGbtFf4isoqhy6vAe2t5vof90x/DNH1LA33QEhaSjdAyLuvTQJJ5fUBWe1UcfAmfqIoC+fFFXc4qnBunytWGTMyWgTrUEAGXAkcg4nDSzBsQsE2ojHfd921ji7ceBLhwTIJqKgDUiQes6K8DANThowqvNnaXHa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_083044_096571_5AD056A0 
X-CRM114-Status: GOOD (  17.93  )
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

On Wed, 27 May 2026 20:35:23 +0800
Wang Han <wanghan@linux.alibaba.com> wrote:

> Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
> ---
>  scripts/sorttable.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/sorttable.c b/scripts/sorttable.c
> index e8ed11c680c6..b4061c2c03e1 100644
> --- a/scripts/sorttable.c
> +++ b/scripts/sorttable.c
> @@ -901,11 +901,17 @@ static int do_file(char const *const fname, void *addr)
>  		/* fallthrough */
>  	case EM_386:
>  	case EM_LOONGARCH:
> -	case EM_RISCV:
>  	case EM_S390:
>  	case EM_X86_64:
>  		custom_sort = sort_relative_table_with_data;
>  		break;
> +	case EM_RISCV:
> +#ifdef MCOUNT_SORT_ENABLED
> +		/* RISC-V uses patchable function entries before function entry. */
> +		before_func = 8;
> +#endif
> +		custom_sort = sort_relative_table_with_data;
> +		break;
>  	case EM_PARISC:
>  	case EM_PPC:
>  	case EM_PPC64:

So basically RISCV has the same problem as ARM64 with patchable
entries. As this may happen for other archs in the future, I would like
to group them together like this:

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index e8ed11c680c6..b3d9073d9fbc 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -891,17 +891,23 @@ static int do_file(char const *const fname, void *addr)
 	table_sort_t custom_sort = NULL;
 
 	switch (elf_map_machine(ehdr)) {
-	case EM_AARCH64:
 #ifdef MCOUNT_SORT_ENABLED
+	case EM_AARCH64:
 		sort_reloc = true;
 		rela_type = 0x403;
-		/* arm64 uses patchable function entry placing before function */
+		/*
+		 * arm64 and RISCV use patchable function entry placing
+		 * before function
+		 */
+	case RISCV:
 		before_func = 8;
+#else
+	case EM_AARCH64:
+	case RISCV:
 #endif
 		/* fallthrough */
 	case EM_386:
 	case EM_LOONGARCH:
-	case EM_RISCV:
 	case EM_S390:
 	case EM_X86_64:
 		custom_sort = sort_relative_table_with_data;

does the above work for you? (Although I didn't even compile test it).

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
