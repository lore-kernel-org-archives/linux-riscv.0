Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA1CE6BF30
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 17:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUaKoAdc7Vzydtm9spWqHvHofhwIf9ws2jLOrVKQh4Q=; b=P4SAnMkqGQ3r/K
	sPULwWSy/g67G3GUDdUdysZxSZN1Lnws+q8cLSfY4S1YeGGk9HjxQMSF1utgth5LYfhvUfj4EZ4/E
	TRQsrRhcB2iyNhnar7Qr4ssgG4WwH9fvxstk/j2HM10zN5Lxm9H5wW7MtBCYkuyXCfiP5gZu5ZnTc
	ka8Zn9L8C2tgjxWGSsUFkPhVuTuSBrEPy0NcS/40ttsBTkfV/dzIsV/gjCYV1n3+KFaLBB7FztUyA
	+HrlBPvnzPD3bgjKcQDQt4kwpNEEuN7sNrNB7dyOp4+KpsVc9ROC+9S1tA/1ZjCrCUBowG8nEBuHW
	f6GQlABEKGKqgtmtkWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsRA-00000001mRz-2jYo;
	Fri, 30 Jan 2026 17:37:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsR7-00000001mR8-4C1a
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 17:37:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DCCD44173;
	Fri, 30 Jan 2026 17:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652EEC4CEF7;
	Fri, 30 Jan 2026 17:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769794657;
	bh=EURabUMH4lsCb1dCSFQMp+VQOndKCUfb9vC/+CetiwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YKhWxTebYFBkWgr87V7M7d4jVbTl1IAC6z1KCKRbehsB8H2Cu6GdKiye5y2Nsf0QY
	 0AvuBrImpkjujpGczBynZQCGYIX2amIpiR3ZwYlyUwyd49v/jU6THnPDGaJYWF2Eud
	 Y7IOjEhhBXYYMJh1n7clB59Tz4g4tOnqhnBSPyuYm+FgHQpcu1NJZgPAMG9UJ/tREg
	 dQI4bF8rjtBu/xkicrEwvUFSXn2fYHRWsoWPkPvvVKpj8zIz/RhWwTuKi1+HhCraxZ
	 OFXwEh1EkhK/5DbA4csUmtu26oXBNwqICJi2Qinz/+xqjpFirVY2jUIcHV28tyRfDq
	 eTVQQkifEXX6A==
Date: Fri, 30 Jan 2026 09:37:36 -0800
From: Kees Cook <kees@kernel.org>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	akpm@linux-foundation.org, andy@kernel.org, ebiggers@kernel.org,
	martin.petersen@oracle.com, herbert@gondor.apana.org.au,
	samuel.holland@sifive.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, charlie@rivosinc.com, nathan@kernel.org,
	linusw@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v7 0/8] riscv: optimize string functions and add kunit
 tests
Message-ID: <202601300936.6EDA32E96@keescook>
References: <20260130025018.172925-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260130025018.172925-1-jiangfeng@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_093738_058005_632356D5 
X-CRM114-Status: UNSURE (   8.96  )
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

On Fri, Jan 30, 2026 at 10:50:10AM +0800, Feng Jiang wrote:
> This series provides optimized implementations of strnlen(), strchr(),
> and strrchr() for the RISC-V architecture. The strnlen() implementation
> is derived from the existing optimized strlen(). For strchr() and
> strrchr(), the current versions use simple byte-by-byte assembly logic,
> which will serve as a baseline for future Zbb-based optimizations.

I'm happy with the Kunit elements here, so unless Andy has other
feedback, please feel free to take this via the riscv tree. (Or if riscv
maintainers would prefer, I can take it via string.)

Thanks for working on this!

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
