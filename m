Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615E5CD5BD1
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 05:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNjpPFGphIosqE/VE1DVnBQOn/g99pLa/D2kUr2baAs=; b=kkmYg95EfES4rJ
	ZXysSp7Ig1F2GT4HkvgOausZTODBLpb2YDzuGqhBuRTusuUs9T36VVFjkFundT0dt1q28m20b3nJt
	CTZodXQqILhKCWD/BqwugxyQ3pOeqlL6Sp9zbqLvJA1anwcU7yUBk94OjEpXo+5Dr0nmm9weX4oFS
	dl+6Z9b7qbuwjG5kfL7XmD+8BjzIhuxJHivZIjvaq4eY0QnzG9QMKhgsp+7FkL6U/QmzYFdP7cwjh
	xrQiBOfGBz1tEWlHooEGJNzjLToYmtsbsc7hcBMD1CJn/5fl182YFLXd4wJsIQdDJHuPBiPQPdwa4
	SB04W5ODIV+L7VNgrpww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTRk-000000059Z2-2d3J;
	Thu, 28 May 2026 05:38:20 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTRh-000000059YT-0Phw
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 05:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779946692; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=g9xXdOEeD6a9QCmlif50MRE5E3DhBPqmO64p4ySl0/c=;
	b=A3MYe2n14ThFPAEaBcafK6fKA/LCv56z1U8an1gE7IkiRmrnlu/cxxgdF+KIZBLxlWuByePm6Qrk4zopQQHAxV8TuEOm3DRW+TkPirrnRGzKgxlV7nlVgt5KGCCbqQKCt+xhUHooJ01YYShLUrCkdt8N9KYa2w6RJ47bRTIhWQc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R271e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=wanghan@linux.alibaba.com;NM=1;PH=DS;RN=30;SR=0;TI=SMTPD_---0X3lY9RP_1779946689;
Received: from wanghan-Workstation..(mailfrom:wanghan@linux.alibaba.com fp:SMTPD_---0X3lY9RP_1779946689 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 28 May 2026 13:38:11 +0800
From: Wang Han <wanghan@linux.alibaba.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Andy Chiu <andybnac@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 1/8] scripts/sorttable: Handle RISC-V patchable ftrace entries
Date: Thu, 28 May 2026 13:38:06 +0800
Message-ID: <20260528053807.1511742-1-wanghan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527113028.4b21a5de@fedora>
References: <20260527123530.2593918-1-wanghan@linux.alibaba.com> <20260527123530.2593918-2-wanghan@linux.alibaba.com> <20260527113028.4b21a5de@fedora>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_223817_841596_AD240BD8 
X-CRM114-Status: GOOD (  10.60  )
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

[Resend: my first reply went out as a private message to Steve only,
due to a local git send-email config quirk that dropped the Cc list.
Re-sending now with the original cc list so the discussion is
on-record. Sorry for the duplicate, Steve.]

On Wed, 27 May 2026 11:30:28 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> So basically RISCV has the same problem as ARM64 with patchable
> entries. As this may happen for other archs in the future, I would like
> to group them together like this:
[...]
> does the above work for you? (Although I didn't even compile test it).

Yes, this is clearly better - a single grouped block makes future
patchable-entry architectures trivial to add. I will fold it into v2
with two small adjustments to keep it compiling cleanly:

  - s/case RISCV/case EM_RISCV/ (two places).
  - Put the shared "before_func = 8" on its own line under
    case EM_RISCV: with a standard /* fallthrough */ comment,
    otherwise GCC -Wimplicit-fallthrough warns between EM_AARCH64
    and EM_RISCV.

Resulting switch:

	switch (elf_map_machine(ehdr)) {
	#ifdef MCOUNT_SORT_ENABLED
	case EM_AARCH64:
		sort_reloc = true;
		rela_type = 0x403;
		/* fallthrough */
	case EM_RISCV:
		/* arm64 and RISC-V place patchable entries before the function */
		before_func = 8;
	#else
	case EM_AARCH64:
	case EM_RISCV:
	#endif
		/* fallthrough */
	case EM_386:
	case EM_LOONGARCH:
	case EM_S390:
	case EM_X86_64:
		custom_sort = sort_relative_table_with_data;
		break;

Built scripts/sorttable with the kernel host build (both with and
without MCOUNT_SORT_ENABLED), no warnings. I'll add your Suggested-by
and send v2 shortly.

Thanks!
Wang Han

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
