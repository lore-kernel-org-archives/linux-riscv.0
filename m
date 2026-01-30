Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC3AE6BF31
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 17:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQU8BY9AsfecksxySt/WM0an+J1Z9KWyFPQjqQQx/PM=; b=xmsStsESzdWsNX
	ikRQiFSMWqRJ5/N7KSdWVH1k2GFhpntcrttlMnBu6IMlHWteR0mq8NNxe5f9ZVB01Y+hfcrLTpCvF
	mRDEg08bxdPvYU6XlONZ5tZKG95koDhaVXed5sv2oB06ew9qobRqZHYm+gotFCnaM5QMwEwNEvV5e
	OewZRqvVQJEYSNC4jMXHwYgK78JWK/N4cPcOvC8YWZP3TQ+ce5muKN+sip1YEFtV6HPSD/lydcG68
	F9THKd2KbxNCC9GqEp74RJnkcTXJedV5QhYfqybVfxPyyJ98YBKXjSXN0w8eEzVhIJqzQo4vj0CMr
	iReVVigJfhQC6z9FliRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsOT-00000001luZ-1jGV;
	Fri, 30 Jan 2026 17:34:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsOR-00000001luF-0LdG
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 17:34:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C66B544361;
	Fri, 30 Jan 2026 17:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C5BC16AAE;
	Fri, 30 Jan 2026 17:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769794490;
	bh=1TKfjAm12XOvM0K5C6eA86Bn9vgJw3DhIQ7HuUKNHo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SS/G2kgWqt4OEfQ2Wi9NTQkrSFfXvXT9o/ZRT9grSwMLe01WfLW+aK7UJTCRcc84t
	 2FekKoQgLwAC6x69Zv5d/4qvQRCO0Yrv5Dk45i4jVNLjDDQjMnLAdaT9yFWsHkuO3Y
	 taFJ0t2aWBsz+BWYy3aRaX0SYR56xx95EFZ8vqkhv9PvVXMH5fx4JVelgyj++vBDo9
	 lyrUNFjMeourtGFfaWTgzrQy6jAnDAgDvW7SbddBEZ0OJGM3cpzKkoajGxHVWsRntR
	 3gykFSbFcmummwoPqGER3bH0bLZGe6QoriQ3irijXyPEkOWadiEvPLOZa27Gky1xm0
	 pHR0vt611eNnA==
Date: Fri, 30 Jan 2026 09:34:50 -0800
From: Kees Cook <kees@kernel.org>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	akpm@linux-foundation.org, andy@kernel.org, ebiggers@kernel.org,
	martin.petersen@oracle.com, herbert@gondor.apana.org.au,
	samuel.holland@sifive.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, charlie@rivosinc.com, nathan@kernel.org,
	linusw@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v7 2/8] lib/string_kunit: add correctness test for
 strnlen()
Message-ID: <202601300934.A203EB29F1@keescook>
References: <20260130025018.172925-1-jiangfeng@kylinos.cn>
 <20260130025018.172925-3-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260130025018.172925-3-jiangfeng@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_093451_140540_C11AF487 
X-CRM114-Status: UNSURE (   7.65  )
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

On Fri, Jan 30, 2026 at 10:50:12AM +0800, Feng Jiang wrote:
> Add a KUnit test for strnlen() to verify correctness across
> different string lengths and memory alignments. Use vmalloc()
> to place the NUL character at the page boundary to ensure
> over-reads are detected.
> 
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Suggested-by: Kees Cook <kees@kernel.org>
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
