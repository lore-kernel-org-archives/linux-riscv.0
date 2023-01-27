Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEFAC54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 09:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WLYmVVLMgdkniBG6brZr4LWfGH/QWiy79Mc4rU3ar2w=; b=wv45yACQqNcvMF
	4lUB7XHf7bnasx+5VYAKFe44Eu8idIbjKo3YH5sT2S4vB1F7QSGZiPbbROQK9q3kS2SzSEAX6mXZa
	qTE1EkxBeg+XfW/edwHsxrqQ9hG6zXABlyPs3jb+wSP/62qzEIDRY571LmAL+RDCWXYgCJTRhb96D
	hZDQTXUGzhPjPbWbp4SBCOZSkvLamMb+HJ0/TcYtCq9EwzK555XTywk1p2PWTJfxpwZXw+DdHFWx7
	iA1NSUP5l2D8MARnhSVBCVmz3dkRWObg+a/Lhe7AjJY4VLllourWy9OPkD5EONpQSpmfhgeoHB9nO
	Ecr9J4jppJ6iGZiLqVdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLKpf-00DbfG-P8; Fri, 27 Jan 2023 09:15:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLKpc-00Dbec-KW
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 09:15:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8CA0FB81FAF;
	Fri, 27 Jan 2023 09:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDBF1C433D2;
	Fri, 27 Jan 2023 09:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674810933;
	bh=U3OAJ8SCEj6VXff108R0INPEUssjs/AFzTgJg9iab6Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=vP3VVRSXvS7HLtcqC5+GKhYGu2F3mwJqC3vC3ItyQrmiJnrZcYz/14gF7MTveAbXv
	 tWoujlrs0tx62q9+hivVpHkWvw8RIAXtMLLQhWga08TwQ0I5TvBAJTOLB1pScwD5Hb
	 CCEbrhEgVrIPGKuLYphfQ0MUpFLxx/69CG3NA7wVnFdD/S3rWm/muKM4toMtiFEHLp
	 tEwIhB/g4E6vNJnOnVn/Qnc2qiZgaL72PFtPzhcG0qVJWHn5Gsz+BFkKjBVUvnjhs/
	 iNXcmXHu09jHsNwYH+qkOZDdEO+6/Lu+tyRmXrXk4MWKkYSusGL/kvXHQRa3VFx3XR
	 +c3+/af7PB+7g==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor@kernel.org>, guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de,
 peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com,
 heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
 falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
 atishp@atishpatra.org, mark.rutland@arm.com, ben@decadent.org.uk,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH -next V15 0/7] riscv: Add GENERIC_ENTRY support
In-Reply-To: <Y9LTmmYuEWKNmyl2@spud>
References: <20230126172516.1580058-1-guoren@kernel.org>
 <Y9LTmmYuEWKNmyl2@spud>
Date: Fri, 27 Jan 2023 10:15:30 +0100
Message-ID: <877cx8tk25.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_011536_855252_B3BBAAC1 
X-CRM114-Status: UNSURE (   6.48  )
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

Conor Dooley <conor@kernel.org> writes:

>> v15:
>>  - Fixup compile error for !MMU (Thx Conor)
>>  - Rebase on riscv for-next (20230127)
>
> nommu build looks fine now, thanks for fixing it up. Hopefully you're
> good to now now after 15 versions!

Yay! Would be great to see it end up in 6.3!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
