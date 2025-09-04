Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF3BCA1014
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 04:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPKzR2rlOEhYKZ0tCo1BvjhdYzAPj6jFkX1mdfrrG4U=; b=HQ86tGJNd9Llct
	9BTbYuisBqpw+9ooLJAgZ1nZddq70SW2relH8p6Ky/77FYpB2XYHid+RHsRyEuLjcNwgj45ppaDsM
	C3u5c+eLA1RoiJF1H4/iRU7I5+uJt3dCjZrOP8kEOTS8iudZTE2Ti+ZJqdb1k+O08ng4YrgUZEDwO
	RFjf4v3KhGWxXbKtg4xydhZxgMoSjCPlqkhBr06sFpKY4W1pqUpK8th7rUv/E/iFp/KnnSOO4cSv6
	LowCADI+WNMMbyKcwQDQMPBPQ15V38QjXjav7hkQgpwg1nXrjRpWxwEhM9OiMRYtYgat5ntpxXhq0
	akJuUteONj6vzrLgQ/Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu1N9-00000008u76-2tDc;
	Thu, 04 Sep 2025 04:14:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu11g-00000008nKk-3lwR
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 03:52:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B6A044483;
	Thu,  4 Sep 2025 03:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7225AC4CEF0;
	Thu,  4 Sep 2025 03:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756957964;
	bh=dW3DY0tGbJhPve03HuDNPrD6QxC9sjo3oWoZbh4z3oI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k4SggvOd4BbUbbGwaWFPdPRseaOkhRGGpexIV08g70d9iEWifpyMcHKg1LDKhagxb
	 X73aX3cyNra2YQJQYXiUrPpRXEjmEImKKuMFsLhD62OU6yN1wmci+wvDeF3PkMUota
	 NnzUIVAAyJ5GmDDpNPiAQvA2UKguSTveJwuqMti483XoZH4JtePjPcbk0fG8QozNWM
	 rfYDgshAh+BKzbWevQChmBmw8nuwjdklhR0lGWT53q7FGw3IjDG/pKVPiIzKATwmxI
	 WtyuT5A0cPe2iwRRD+02ucfirVq48nuR2WihTkaDccXlV3ixklm/IyUa94iEQo6mur
	 NMLqBhZPXxLMA==
From: Kees Cook <kees@kernel.org>
To: linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Svetlana Parfenova <svetlana.parfenova@syntacore.com>
Cc: Kees Cook <kees@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.f,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	akpm@linux-foundation.org,
	david@redhat.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com
Subject: Re: [RFC RESEND v3] binfmt_elf: preserve original ELF e_flags for core dumps
Date: Wed,  3 Sep 2025 20:52:40 -0700
Message-Id: <175695795639.3712216.15743949549231818751.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901135350.619485-1-svetlana.parfenova@syntacore.com>
References: <20250806161814.607668-1-svetlana.parfenova@syntacore.com> <20250901135350.619485-1-svetlana.parfenova@syntacore.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_205244_961738_DA959D2A 
X-CRM114-Status: UNSURE (   6.68  )
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

On Mon, 01 Sep 2025 20:53:50 +0700, Svetlana Parfenova wrote:
> Some architectures, such as RISC-V, use the ELF e_flags field to encode
> ABI-specific information (e.g., ISA extensions, fpu support). Debuggers
> like GDB rely on these flags in core dumps to correctly interpret
> optional register sets. If the flags are missing or incorrect, GDB may
> warn and ignore valid data, for example:
> 
>     warning: Unexpected size of section '.reg2/213' in core file.
> 
> [...]

Applied to for-next/execve, thanks!

[1/1] binfmt_elf: preserve original ELF e_flags for core dumps
      https://git.kernel.org/kees/c/8c94db0ae97c

Take care,

-- 
Kees Cook


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
