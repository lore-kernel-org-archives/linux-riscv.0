Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66043C636CD
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 06:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XO9vDr/zMgI+SagQct8Pku9+ja/pHbwDFmjNvYpaHV8=; b=xYGV/ZoyvTixwP
	PpkMfv4bfx+PKKwcg4MbTv1ZvEewpBRzzv89O/JomSC3fErEuJU41eqy+7eQGrZYUIA7G0GzGdWe9
	ymMJzeRQhIGvk6eO8cNQvnIHbdnKm5ygfdR7Jdt4ydDdpYhtmXZCmqDLlrgt4rDGXWK9BEKMgYyyJ
	8pBWl5rshBB27a3oOttr6HgFiEJzwhCBk4t+HaeGTK3aapMzAky/rcvbzkg/KclggvQXrqAVmMmgq
	56d8sN1+DlTdJM+bez5Ak6WkldiJrzfjZU/DthHkXJS4K6S39W8V5Eeu9vgt3U2evNJGmwLV5I7vV
	nDf20CHJ5fbi2y7u9k2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHEi-00Awq3-9E; Tue, 07 Feb 2023 06:13:48 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHEf-00Awoi-Ut
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 06:13:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C0B1DB816D9;
	Tue,  7 Feb 2023 06:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC92C433D2;
	Tue,  7 Feb 2023 06:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675750422;
	bh=A8ruLAiuCpN7LMl+nJ9yC0o7pNkD8QVVbmSEd6pFxdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=szUpQl4DnlNs6jGTa105n7oPvde4TCvfylsRNLjrXMAZzbQGsixOK7SpVLSjGgV/x
	 5Rsa5KnQjNVZBdIS4/D1k4q8I1Qtb+Ec58YlPBbGBw16G6/IGzI7YGiJVkFEW8UYhN
	 ibp7GJJnIuZqDACYQuHR7X9GPnqkNiQIFVhZjek4=
Date: Tue, 7 Feb 2023 07:13:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
Message-ID: <Y+HsE397cY4HF+5K@kroah.com>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-3-evan@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230206201455.1790329-3-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_221346_149715_409EE7E7 
X-CRM114-Status: GOOD (  13.63  )
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
Cc: heiko@sntech.de, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, slewis@rivosinc.com, Bagas Sanjaya <bagasdotme@gmail.com>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Tobias Klauser <tklauser@distanz.ch>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, vineetg@rivosinc.com, Dao Lu <daolu@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ruizhe Pan <c141028@gmail.com>, Anup Patel <apatel@ventanamicro.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 06, 2023 at 12:14:51PM -0800, Evan Green wrote:
> We don't have enough space for these all in ELF_HWCAP{,2} and there's no
> system call that quite does this, so let's just provide an arch-specific
> one to probe for hardware capabilities.  This currently just provides
> m{arch,imp,vendor}id, but with the key-value pairs we can pass more in
> the future.

Ick, this is exactly what sysfs is designed to export in a sane way.
Why not just use that instead?  The "key" would be the filename, and the
value the value read from the filename.  If the key is not present, the
file is not present and it's obvious what is happening, no fancy parsing
and ABI issues at all.

Bonus is that you will also properly document all valid key/value pairs
in Documentation/ABI/ when you do this, so it reinforces what the code
should be doing correctly.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
