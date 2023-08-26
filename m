Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FE9C83F15
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Aug 2023 18:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+A2ZphzxZxtijSNSRdA49YV259q/1JKtZga6sDMLVk=; b=YBNWnCZKz901kg
	a21NdaY7fpTpJEqVKcLk5Q/Z/hvF9ksR+cunD2EPt/MZQWT7flHL73KDqtcgYfO5At4FdSREB2kij
	8PefMPsVov9iZ4Z6qK9SleYy7bOlmj3mScLRLtsIRn6detVbfnVaFqPxGw/7C8XW5f6pc+oBJjPd5
	t0YxTnqpYkqELEM+ESYFUL8yZcKD9/c/pr/UViF7XQHwDyeMdV2Nk90f+PUJzt7ZL76NG7Ya8mj9h
	gen0aUj+8PnrvPqm7cv7tQ2elGFmHrc5OxIQyF9GTDYHgbG8kSu8sQUMvek3mFsyAeIo+jrDoBKkl
	zUDuxDlALP91tg3KrJOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZxm7-0077Pe-05;
	Sat, 26 Aug 2023 18:12:43 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZxm3-0077Ot-12
	for linux-riscv@lists.infradead.org;
	Sat, 26 Aug 2023 18:12:41 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-52a1ce529fdso2753087a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 26 Aug 2023 11:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693073552; x=1693678352;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Gyzqi9og5VHGej7RqMB/sGNKltacYE0aaQTeJM5H9c=;
        b=GMVg/1oQvsYhhEmYirAtP41Lx/vkOjnyG01n6KTTeUzkspdjzji4xqorSKtk7Uvp1c
         dNDpUXWsvHEv7QTmUv1CzD0MSOwKfLTQmO6bYwPAVuVPJt+DXwtyRHyRiznbaU06cqfT
         vD5reBkDVHjMr1a1Ni8/u1s1+9B0HVAP1SxRVhNn3Z7nbdSNlmwSTi/ltm8Ctg/erFPk
         3arJR/fF1+aLVQmG/UPcU7dRRPtxBBvsvJHzDnCpjCmxK28f6nbp5lOHGixoFN1seDJ/
         U2bJcQMZyZFTuxf13gohWH0p5+2YnVjl0MIPb2kxEd1gwP/WMiOcRqyLoQAgem7YCxRD
         j1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693073552; x=1693678352;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Gyzqi9og5VHGej7RqMB/sGNKltacYE0aaQTeJM5H9c=;
        b=k4bKuRIJFe7qQL9zp/6R9uXmwP7Y+cHyPU6QDrV/NB0UgGN7D8Oyqy2mBgYpHRiSYG
         vQ+e/hTG7s3Mo/qasRecsKfL3Bad100Nb7TaHkcA/N9bi8B2gA7RN3N95cH3zlHz1R57
         RjETizvXeAdel9wZqEuivi1z1ss5dRNYYWDLHq2bJkMGyTJky6nMWxictxD190FGCIE/
         PLeeohXfUlAlyKcIEFCwhF4TjurwYTdkpHpS/Hvia4rIxKuQVLEp7JDBKS/Qzn4dk8bJ
         sgs67r0QcbAH4dv7ugEBW4HlGkqdVeb3BOJ4IOdVUaCL9cpvj2qcrD1be3q74PzgMTOr
         TO/Q==
X-Gm-Message-State: AOJu0YxD6COs7YI8AVOvey+ceqaUifYG1B3t+dRFKn6Fa3q1CBX9+aK4
	ZpM+b6gQvcq0ICWK1YAOKpRtGbNFrA4=
X-Google-Smtp-Source: AGHT+IEkSnUDy4cH+EJxekXscvslKpfZGHS61kq8bBp8TxIYmOpTFGcesNwwLFtzVpMz/YdEFIjesQ==
X-Received: by 2002:a17:906:8468:b0:9a1:f928:dddc with SMTP id hx8-20020a170906846800b009a1f928dddcmr7338705ejc.41.1693073552146;
        Sat, 26 Aug 2023 11:12:32 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id cf20-20020a170906b2d400b0098e78ff1a87sm2461305ejb.120.2023.08.26.11.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 11:12:31 -0700 (PDT)
Date: Sat, 26 Aug 2023 20:12:30 +0200
From: Nam Cao <namcaov@gmail.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>,
	bpf@vger.kernel.org, Hou Tao <houtao@huaweicloud.com>,
	yonghong.song@linux.dev,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Puranjay Mohan <puranjay12@gmail.com>
Subject: Re: RISC-V uprobe bug (Was: Re: WARNING: CPU: 3 PID: 261 at
 kernel/bpf/memalloc.c:342)
Message-ID: <ZOpAjkTtA4jYtuIa@nam-dell>
References: <87jztjmmy4.fsf@all.your.base.are.belong.to.us>
 <87v8d19aun.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87v8d19aun.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_111239_362032_6BB85EE6 
X-CRM114-Status: GOOD (  23.69  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Aug 26, 2023 at 03:44:48PM +0200, Bj=F6rn T=F6pel wrote:
> Bj=F6rn T=F6pel <bjorn@kernel.org> writes:
> =

> > I'm chasing a workqueue hang on RISC-V/qemu (TCG), using the bpf
> > selftests on bpf-next 9e3b47abeb8f.
> >
> > I'm able to reproduce the hang by multiple runs of:
> >  | ./test_progs -a link_api -a linked_list
> > I'm currently investigating that.
> =

> +Guo for uprobe
> =

> This was an interesting bug. The hang is an ebreak (RISC-V breakpoint),
> that puts the kernel into an infinite loop.
> =

> To reproduce, simply run the BPF selftest:
> ./test_progs -v -a link_api -a linked_list
> =

> First the link_api test is being run, which exercises the uprobe
> functionality. The link_api test completes, and test_progs will still
> have the uprobe active/enabled. Next the linked_list test triggered a
> WARN_ON (which is implemented via ebreak as well).
> =

> Now, handle_break() is entered, and the uprobe_breakpoint_handler()
> returns true exiting the handle_break(), which returns to the WARN
> ebreak, and we have merry-go-round.
> =

> Lucky for the RISC-V folks, the BPF memory handler had a WARN that
> surfaced the bug! ;-)

Thanks for the analysis.

I couldn't reproduce the problem, so I am just taking a guess here. The pro=
blem
is bebcause uprobes didn't find a probe point at that ebreak instruction. H=
owever,
it also doesn't think a ebreak instruction is there, then it got confused a=
nd just
return back to the ebreak instruction, then everything repeats.

The reason why uprobes didn't think there is a ebreak instruction is because
is_trap_insn() only returns true if it is a 32-bit ebreak, or 16-bit c.ebre=
ak if
C extension is available, not both. So a 32-bit ebreak is not correctly rec=
ognized
as a trap instruction.

If my guess is correct, the following should fix it. Can you please try if =
it works?

(this is the first time I send a patch this way, so please let me know if y=
ou can't apply)

Best regards,
Nam

---
 arch/riscv/kernel/probes/uprobes.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/=
uprobes.c
index 194f166b2cc4..91f4ce101cd1 100644
--- a/arch/riscv/kernel/probes/uprobes.c
+++ b/arch/riscv/kernel/probes/uprobes.c
@@ -3,6 +3,7 @@
 #include <linux/highmem.h>
 #include <linux/ptrace.h>
 #include <linux/uprobes.h>
+#include <asm/insn.h>
 =

 #include "decode-insn.h"
 =

@@ -17,6 +18,15 @@ bool is_swbp_insn(uprobe_opcode_t *insn)
 #endif
 }
 =

+bool is_trap_insn(uprobe_opcode_t *insn)
+{
+#ifdef CONFIG_RISCV_ISA_C
+	if (riscv_insn_is_c_ebreak(*insn))
+		return true;
+#endif
+	return riscv_insn_is_ebreak(*insn);
+}
+
 unsigned long uprobe_get_swbp_addr(struct pt_regs *regs)
 {
 	return instruction_pointer(regs);
-- =

2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
