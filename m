Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6E4E8538C
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 18:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ND0ENzCcF7/LMknOqD5043CRNVn9KGi6jxJgH7MIcoo=; b=tH/Pa5aZHvSa3x
	psiUbzZ3qAMTYA0IWfm6MJWXVwf0vIPB8C9t5hEFphpGmOUQYOFVJSAaFj8DusRRrW6eAM/ECinyN
	4hEon7J6GpZgkXlMW7CfpHO73S3pCe3p2utdicPMoBgFtec1LAgv3iSsUxHBqA5ZHOcc9sUtNgG11
	bq6APYH/F0wBsf2gAMIFJwkOlWG+hNr9K7wRu/I1/SOzMBa7VXLvNYm8ZG6u5YmFxMzYUJPpEWW/Q
	2MR7oSbMqbtWKRMKWdvx6/bQBK39DrN+sV/mT4JC3Uon6ui2rEtselZgqIE0Nmk1+asUxD4onJ6HI
	BgOH4sE5BCr7CyB6uVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8jI4-00000002Qmm-13rH;
	Fri, 03 Apr 2026 18:30:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8jI1-00000002Qkt-0sO5
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 18:30:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E473040A12;
	Fri,  3 Apr 2026 18:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87E6C2BCB0;
	Fri,  3 Apr 2026 18:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775241040;
	bh=seumy+Ex/xkdEGqEG0CGT2kkxLikn6nOTs522DJNckg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=c5Y3EZmAaJfU0qvwu6OtHikdYU9/ckZeC7ffNJeF4CR+o7CPSTAXhIKj618lgIzLb
	 DS905l5kvPGhtzYxSXSKs5pZxrlUfAFO2Nam0nWpsAa35jhhF0oSlpJToajlEt0n/U
	 cqR6fyHzYpaX/j4ELCh1JV6OMLRBBDwOKuBNfgCuDhb+p5wGk6YB05wVFbcoEhNLsX
	 YHTTKaKCgOx2guDFkfZ6rPXMR2x2yfOYfrffjb//RHSeIHXdyKGJBu/Z0U2NoVyLBf
	 oGufvZSFp8St9ACmCknWEgLZJ5Z4F0kMZiwXW+YQ8g3UTGqICNnR62NgsOl9O987pO
	 CW5sjiBwSpmcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F933809A14;
	Fri,  3 Apr 2026 18:30:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] riscv: mm: Define DIRECT_MAP_PHYSMEM_END, fix
 ZONE_DEVICE
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177524102228.1406513.593562525700646994.git-patchwork-notify@kernel.org>
Date: Fri, 03 Apr 2026 18:30:22 +0000
References: <20260309-riscv-sparsemem-vmemmap-limits-v1-0-f40efe18e3cd@iscas.ac.cn>
In-Reply-To: <20260309-riscv-sparsemem-vmemmap-limits-v1-0-f40efe18e3cd@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 alex@ghiti.fr, linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
 stable@vger.kernel.org, gaohan@iscas.ac.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_113041_269561_55681DD8 
X-CRM114-Status: UNSURE (   9.80  )
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

Hello:

This series was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Mon, 09 Mar 2026 19:09:36 +0800 you wrote:
> With HSA_AMD_SVM=y, RISC-V runs into the same problem as arm64 at one
> point did [1], where it tries to use a struct page that is outside of
> vmemmap. See log near the end.
> 
> On RISC-V, the actual mappable range of physical addresses is dependent
> on the current MMU mode i.e. satp_mode. Define DIRECT_MAP_PHYSMEM_END to
> expose this information to get_free_mem_region().
> 
> [...]

Here is the summary with links:
  - [1/2] riscv: mm: WARN_ON() for bad addresses in vmemmap_populate()
    https://git.kernel.org/riscv/c/49a5cb2dc86c
  - [2/2] riscv: mm: Define DIRECT_MAP_PHYSMEM_END
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
