Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B72CA9ED0
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 08:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12G7EEw/bnT+VzJZOC1dQVHoCCmnUd6wWdqgdfKLuI8=; b=WUQ2Cos0HK4ptG
	hmWCBPc0xH1zNa+FRQ0CrQx71nkvn8+r9VnoshTpG05GkROyVTD31WMZPJZg7y/ASWTtId9lRuLEn
	Y0VDpsNZSAY1KUKKQcCLl9BqC4qd/MG0VL48RGOWO/H9HGU5b7WH7OqP4OF11nLwrxdtTtJocjmBR
	jGltpL5QyILp2Nuh7wiEsHa+/kEfTWPug0mnBgtY7WjfXggtYpemg4qAa/vU0vlClncCaEKgB1M2c
	XrSEJvVhKa6XZcEkaM5RmWizO7JjErb6PcnXCpRJ5IDg+McFuh4PZSXGfVKMCKsmYeBQxlN3FQqoB
	VW3c6DMsAizgcqZW96Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBej-00000009yi3-0mrT;
	Mon, 12 Oct 2026 08:45:13 +0000
Received: from akranes.kaiser.cx ([2a0a:4cc0:1:11ef:4484:ccff:febf:ddfa])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBef-00000009ygW-3woC
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 08:45:11 +0000
Received: from martin by akranes.kaiser.cx with local (Exim 4.98.2)
	(envelope-from <martin@akranes.kaiser.cx>)
	id 1xGBeS-00000001fgc-3r88;
	Mon, 12 Oct 2026 10:44:56 +0200
Date: Mon, 12 Oct 2026 10:44:56 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, oleg@redhat.com,
	rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com,
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
	namhyung@kernel.org, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	james.clark@linaro.org, jpoimboe@kernel.org, jikos@kernel.org,
	mbenes@suse.cz, pmladek@suse.com, joe.lawrence@redhat.com,
	shuah@kernel.org, mpdesouza@suse.com, oliver.yang@linux.alibaba.com,
	zhuo.song@linux.alibaba.com, jkchen@linux.alibaba.com,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 0/7] riscv: Add reliable stack unwinding for livepatch
Message-ID: <asyeCD1xaIuKv3nl@akranes.kaiser.cx>
References: <20260914092648.51254-1-xueshuai@linux.alibaba.com>
 <artojcJftbMIgPrj@akranes.kaiser.cx>
 <fbdb7b4c-0f80-41b0-b6d8-a4501ff3e820@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fbdb7b4c-0f80-41b0-b6d8-a4501ff3e820@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_014509_987524_E13EE8BD 
X-CRM114-Status: GOOD (  15.85  )
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

Hi Shuai,

Thus wrote Shuai Xue (xueshuai@linux.alibaba.com):

> It is great to hear that livepatch works both on a standard rv64 QEMU
> and on the rv64 CHERI system. Could you share what the minor tweaks
> for CHERI were? If any of them are generic -- for example frame-record
> size/alignment or pointer-width assumptions in the unwinder -- it may
> be worth folding them into this series, so the cheri-linux tree has
> less to carry downstream. If they are purely CHERI-specific, a pointer
> to your tree would still be a useful reference.

the cheri changes are simple fixups of data types and assembly instructions.
This isn't something that can be upstreamed at this point.

Eventually, it'll end up in the cheri linux tree at
https://github.com/CHERI-Alliance/linux
but there's more cleanup to do first.

I just wanted to show my interest in getting your patches merged.

Thanks,
Martin

> +Palmer, Paul, gentle ping on this series.

> It has been under review since late May (v1 on May 27, now in its sixth
> revision) and the tags collected so far are:

>   * Acked-by: Miroslav Benes <mbenes@suse.cz>             (7/7, livepatch)
>   * Reviewed-by: Marcos Paulo de Souza <mpdesouza@suse.com> (7/7)
>   * Reviewed-by: Martin Kaiser <martin@kaiser.cx>         (whole series)
>   * Tested-by: Martin Kaiser <martin@kaiser.cx>           (whole series,
>     rv64 QEMU and rv64 CHERI, livepatch working on both)
>   * Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>   (2/7, 3/7, 4/7, 6/7)

> v6 still applies cleanly onto the current riscv/for-next
> (52318cf0fa6e). If it helps, I can send a v7 that folds in Martin's
> Reviewed-by/Tested-by tags.

> Could the series be considered for the upcoming 7.4 merge window?

> Thanks,
> Shuai Xue



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
