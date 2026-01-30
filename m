Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7059E6BF33
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 17:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdbQu/R0WUA+8CgLVbePOPhF2qsXQpFWxZI01fXm4XQ=; b=0+SXx5QFdPqerc
	q1prjq1cQ/OF9d8v2PzM9qu4qnCH8aGTsP9feXU7d56rxaAAQJdIUniJ2+yTJy74jKF4PZOvoYXpj
	J4mIhbHk4mECXWSNr5W3nz1gvP6RAaTnl6XcWVXepAB8XK8DOdPz/1J1zwfFBjtdYefqQKM0j8QOI
	cf3BmhraL2TOM5JsN/o0X5it9MRhSOBMiaGMHGrMxpU6GodNm/sVqmgGDDVjI4HIPLK3ssF0jvq0B
	p3MBYzYhgrvHelq1erTPfy8pPbI9W8g4SI8KijS4X73oltnSWRDGFFSfzNbVhvRWuc8Vg06HzXOsx
	fgO+c99pKXyLToVs0sCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsOM-00000001lt8-0Uky;
	Fri, 30 Jan 2026 17:34:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsOJ-00000001lsn-40SY
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 17:34:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C060544520;
	Fri, 30 Jan 2026 17:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8B6C116D0;
	Fri, 30 Jan 2026 17:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769794482;
	bh=x25+ZfEQbzsm0yMDiYSBy02gtq3nzHW/g57iJTgC8dQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LYNOs0yJD5q1aPU7ES7QDn/iuLkhNQCSK1/POKwci4Tq4PNt29b633/1dLaBtLobj
	 /Vgj/5rfHOnvvbpudhVbzP+D4KgwSjkMA5uPxSRyyyRpiEiKekIRMV9R/XAvrCpVkm
	 VXiGbrGK12ZwrZ1Ikx+WiRKu4FtbvJM0hsXKotqaVzKwMPSiLRgUPw8j6q1272IKYQ
	 xeFpOETN0pfwQuUKhrgI/d+CdcunScydoApRukF8ZHhj8S/2PZjY+NzAPteuRQ7I6F
	 942Zl7R6CjtvSru5HyLkv6HJMMgBTI5K8IfzE2uoRoNwI5UMR8xmxXEJZHNLC/s6nX
	 QhsdBA0pbcLQw==
Date: Fri, 30 Jan 2026 09:34:42 -0800
From: Kees Cook <kees@kernel.org>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	akpm@linux-foundation.org, andy@kernel.org, ebiggers@kernel.org,
	martin.petersen@oracle.com, herbert@gondor.apana.org.au,
	samuel.holland@sifive.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, charlie@rivosinc.com, nathan@kernel.org,
	linusw@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v7 1/8] lib/string_kunit: add correctness test for
 strlen()
Message-ID: <202601300934.62F91F79@keescook>
References: <20260130025018.172925-1-jiangfeng@kylinos.cn>
 <20260130025018.172925-2-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260130025018.172925-2-jiangfeng@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_093444_011511_7E8A5F98 
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

On Fri, Jan 30, 2026 at 10:50:11AM +0800, Feng Jiang wrote:
> Add a KUnit test for strlen() to verify correctness across
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
