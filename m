Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC976E6BF31
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 17:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4EoAcrEE0JFwrxSaZaj9xDm65nLzkc77IxlVeQaJks=; b=NnRAezGswquHMd
	1e+OxBC8ecgIMR22ZMCywixn4WWTYEkLh83eBac+6VEM4h37nautTO7+4iZ1QhqNn0SNjBWyWONYL
	ANpBo+JO2cjOhEIMOAzT+V+1e7jH8bTdu02aoVk4oZygM4IXt8lgD7SpiYhFOz7fdDzVOY4WPQeoB
	aWfDKHgdj3arEbEtb0MapES8DhwrunDaGVxMN1Uf6ewAs1KOrfpMOU+/iU0xvOWHtcQ307mWtxxEN
	+ddNYwgRTeSI0Npyi88a+2Hxi1gN1wzxkssGHXnhoZ02huGN4WsIPiWjwQa3riGcKt/2gUBbxnuwv
	qj9qVi6Bs/Js2W9LbqKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsOb-00000001lw2-34uL;
	Fri, 30 Jan 2026 17:35:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsOa-00000001lvQ-0Guj
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 17:35:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 30C9042B1C;
	Fri, 30 Jan 2026 17:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F0DC4CEF7;
	Fri, 30 Jan 2026 17:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769794499;
	bh=8v38Q7y1AW8X9FCs70T/p5dLlx+upDIcVQGemOeQ3n0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PTToV4h2Z4IwrBeV+5CDYrZWTkQdsuiBKmx2qD04KZUx6VAOJCnaJ5vUXwz8sgxJ9
	 GZFfT7t8sYnK2X6yByfMCysNGQvP1epPPjy09umI/HiQiLD0O4APeadOvNXk0NGPEp
	 Z9K4UG0vlTb5/UftewnhGcrNBI4ypyeFxqpPI6776t2lD8uTlOQKmS3Y4RXtpu3wPA
	 AOEPVlgo/f7ZCh2KuQauiqXy81Fs1umG6cu18yHJI1MaExFyHJTQhF4E0C/8hzmMIY
	 333jRxNhsutH1gaJIxWGo7Gc1bUnizmCxtelGeQ++EP6LaxBoApSgQJALKgvvzUZ5j
	 aD6Udh8Lo9XMg==
Date: Fri, 30 Jan 2026 09:34:58 -0800
From: Kees Cook <kees@kernel.org>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	akpm@linux-foundation.org, andy@kernel.org, ebiggers@kernel.org,
	martin.petersen@oracle.com, herbert@gondor.apana.org.au,
	samuel.holland@sifive.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, charlie@rivosinc.com, nathan@kernel.org,
	linusw@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v7 3/8] lib/string_kunit: add correctness test for
 strrchr()
Message-ID: <202601300934.B3376DB2@keescook>
References: <20260130025018.172925-1-jiangfeng@kylinos.cn>
 <20260130025018.172925-4-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260130025018.172925-4-jiangfeng@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_093500_119873_F17B655A 
X-CRM114-Status: UNSURE (   7.45  )
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

On Fri, Jan 30, 2026 at 10:50:13AM +0800, Feng Jiang wrote:
> Add a KUnit test for strrchr() to verify correctness across
> different string lengths and memory alignments. Use vmalloc()
> to place the NUL character at the page boundary to ensure
> over-reads are detected.
> 
> Suggested-by: Kees Cook <kees@kernel.org>
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
