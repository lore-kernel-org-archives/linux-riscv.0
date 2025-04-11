Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675D6C36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 09:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3/X3kU6PVNdKWlLXEDBbOWymBpAXmafyY73FOYGKDg=; b=GhzgA4X7NuSyhb
	zkCrvu3KR87InTngf+ZW0P+N5EcAfPcDGZpDdhCvNk/wXqEHTIFHRkZUoNbBxLu4Yizz8RcbhRd77
	zyQlDH8E4scrQEmA8/mMwtAT+x0qrwHsB9ECahFtoHUtGyI9AGAmd2Zfjd7+DAmGT5fzQMLyYYL6V
	JFe9cxppOwmwF1DDjyGGhC0M4KR5AfG9FOoghLfahAYF9FZE8lfGdpyUdDmOVCiDOSKDB+Ly3e+2S
	AQUkfd1LilvIYplzRc2WDd17u9tRxysy+2QeqYOO4hXlpG5UbiWdxrT+KOkgpH5UaptNbMPy/o1tf
	q6gAOZpkHS40Z7NHg2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ASD-0000000D9e3-3TB6;
	Fri, 11 Apr 2025 09:13:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3AOj-0000000D8ux-3MjO;
	Fri, 11 Apr 2025 09:10:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4F75439A1;
	Fri, 11 Apr 2025 09:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED85FC4CEE2;
	Fri, 11 Apr 2025 09:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744362605;
	bh=8Zf1l8FhhOvmDcUrwydoQzHxR+9Hs6zytjuZjgAOCFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpaUQ7D7fXnA5CFSGpmPhrBob5/1s31V2Xekejj1hAORbvFeQbeIf8k7X2YJa4p4+
	 BiTxwRcHep9f5AZNUoEb0/k1GrbpavmRGU5KhbJgEXGSXTge/P/F3u/kkd4oKPTHFf
	 61EeLOenMgRZdkUnnNjVnao6HH9jNc6eScn7ZrfBcKgNdFi4Aou6YKVLHJ3eJhgm2Y
	 fEXDXXKA5tCoVYbZhtnSv6RWHciOO3GYEduGiKLpBDdznMarlfpaXG3uE79VVJcqFA
	 U6CATX8gDE7XYNOJRzrNfygVtr9kGiU1vi5fZAGt0HzNkMHc4ovCN6KV5Ij2WF+80C
	 Zed1ahSEbtH5w==
Date: Fri, 11 Apr 2025 11:10:00 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
	christophe.leroy@csgroup.eu
Subject: Re: [PATCH v14 00/11] Support page table check on PowerPC
Message-ID: <Z_jcaCdMFENW8KSG@gmail.com>
References: <20250411054354.511145-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250411054354.511145-1-ajd@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_021005_865634_6E4AEC0C 
X-CRM114-Status: UNSURE (   8.52  )
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


* Andrew Donnellan <ajd@linux.ibm.com> wrote:

> Support page table check on all PowerPC platforms. This works by
> serialising assignments, reassignments and clears of page table
> entries at each level in order to ensure that anonymous mappings
> have at most one writable consumer, and likewise that file-backed
> mappings are not simultaneously also anonymous mappings.
> 
> In order to support this infrastructure, a number of stubs must be
> defined for all powerpc platforms. Additionally, separate set_pte_at()
> and set_pte_at_unchecked(), to allow for internal, uninstrumented mappings.

>  arch/x86/include/asm/pgtable.h               | 22 +++----

For all the x86 <asm/pgtable.h> function parameter extensions changes:

  Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
