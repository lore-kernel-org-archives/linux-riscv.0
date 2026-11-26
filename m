Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC595606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 02:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P/6TcsHD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SHAjJd0F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i+Vpi6HtkZRQRMDonu0t0a84MckzcVq+UWO6ntXyXFQ=; b=P/6TcsHDv5EArvZTzJ91vKWHrs
	UUixDI8p5Eyy2uZshHFxiS9pYaQBzdTzUE83E2F3oemMlvhvhrF9XUtw2UXuK9HBizQiscN9thOfC
	Orwe0pmC9QtOJpqqVt3LIzPBOfe1yOE/WuX7yaQJzrP1UaXi3fdLNRViWF4Ojjp1uiaxyPYmg1NtV
	HHAaDiyDt+cqV5VQJ/YADa6QMvaYqwcaqYAUEma+zWjnE4afepuM4zwu8zyEUp+0B8hMu7bWdk2AZ
	8cEbJ6zh1qOpNeomKZTZen69ejE6gcsQ4eUY0SiqAx8XKN1gtjSuvl6UWBerdjkpuaYeRAbnYqjaw
	IA0J7vdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWP8l-0000000Bsug-3dfi;
	Thu, 26 Nov 2026 02:23:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWP8k-0000000Bstz-35tM
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 02:23:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D357C61F76;
	Thu, 26 Nov 2026 02:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34881F000C6;
	Thu, 26 Nov 2026 02:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795659793;
	bh=tBAer5mbEI2P84gV03vcEYGxCO1YYBq7hUZEwgArDEU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=SHAjJd0FqI1B2nYoUVany1KMvpDFyxjz0i964j5EBRmxNcAHQvq7X4oePGZqxKP6G
	 72WES/LzM0hnxXM/eUCSHsuslAqXNG+9si8irb9Z+tWUTWTIbU3IaFL4Kh4ektg5Dt
	 7SJ70/E0fp16HdBFSA1w1JjKs1sSZ4zXGQ6j8+MfC+3nAuAw7N0qLHZRze4GXreCTO
	 gpHdqyoH6Uw33/Mq+ctfNcIlZEefRuZqetKGTc4IcRPFBaD5kDksfZy+8sWAcXR2IC
	 hQigZMWMIN9b/9O/a+QS85e1Ey5sPHpGkXBqrC0oy95hNwFrAdBnu2EL0T+EHTGzrk
	 1HkJ+Z+dDX7fA==
Date: Wed, 25 Nov 2026 19:23:06 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Zishun Yi <vulab@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Kees Cook <kees@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: Fix memory leak in apply_relocate_add
In-Reply-To: <20260509115100.1879716-1-vulab@iscas.ac.cn>
Message-ID: <a71f71b0-cdaa-4a14-55e2-6751881d3174@kernel.org>
References: <20260509115100.1879716-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 9 May 2026, Zishun Yi wrote:

> The error path in apply_relocate_add() forgets to clean up the hashtable
> allocated at the beginning. But we should not use
> process_accumulated_relocations() as a cleanup function because some
> entries may be half-finished, and we cannot write incorrect values back
> to memory.
> 
> So, add cleanup_accumulated_relocations() for freeing all memory
> allocated in the error paths.

Thanks, queued for v7.5.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
