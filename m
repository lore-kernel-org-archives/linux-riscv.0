Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5EACD4846
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 04:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjb8Cozq1mDGfRWhGFOzKrYzxJeFQkWIRWyp1TIwImQ=; b=lFOqR7dauG3rvr
	+Q9aeTELyXHGBeI3nfQf4hn4J4bH5xbtW61p8DrbUHFpyMKQq12qlA+pbnrj6xKg7zH0/J/E2ZfKE
	IaN/Y00lE32WA4sprBPEzPGj5K+MFxzST0o1+6i7gFcgo4UD6O8li2BugkxEMET0XD3hxlEz5dN1k
	SMXCmaUj9KdbIqq6m+ubPIVPtzcejXuhb0Yyo28FAfRD+jD57Eb+vwe/QIVoi93MBvFZuSCWndmiV
	/q+M+NkmKRv7+ofyVWOr0Je34vpWhye0pUz0oXYcOrq3lQfoRUhSSbLuBNIEeXnkiWtbQKv9C1eAV
	BGDzosWMHUAhYicETMrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNNVK-00000004WNx-2HnK;
	Thu, 14 May 2026 04:16:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNNVI-00000004WNW-2JmT
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 04:16:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D7C83600AE;
	Thu, 14 May 2026 04:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21CCC2BCB7;
	Thu, 14 May 2026 04:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778732214;
	bh=BQSZ9ee/VgHstNC8tJm0ej+5RQbrx3NRClPwFKpSEWQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q5VZAaFlwLXXpqqzimWpLMDbbAvVO0PBwYRla5alMQ8B7Qh1yJRvBb0GT4wPTj1wI
	 hbJfDhqfp+7ggqH5AFoaq60IrqhqsbekJyEAaWMpJogGcpfMtUcKbqspJwn/QCfcxS
	 0197NRkY5U8Z3F/L3zFaTAHwDzFyOW9+nt8eKptTNhouAzLijKyVduk0YptUWzD6hk
	 5P1PD224YEuruHYIvIk42jfNx6FifBvwr+ZGkj+x9Nxpgt8V9/fV7aCVQyaeiMG3pA
	 AP/9nJVx4SgjAjQE2Re88frycf8nsHkQasSWqdpk+Jy8v5iNqIr2RAXEFsZRCMfmb2
	 o79myiZ8PutSw==
Date: Wed, 13 May 2026 22:16:49 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
cc: linux-kernel@vger.kernel.org, Deepak Gupta <debug@rivosinc.com>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, 
    Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] riscv: Docs: fix unmatched quote warning
In-Reply-To: <4827939a-2e8e-4ac7-981c-deb3b7296a66@infradead.org>
Message-ID: <590cf7aa-1e0c-6cc2-ab69-53d2680f9d36@kernel.org>
References: <20260406232304.1892528-1-rdunlap@infradead.org> <4914fc7a-607f-41bb-891e-89df83a0b292@infradead.org> <4827939a-2e8e-4ac7-981c-deb3b7296a66@infradead.org>
MIME-Version: 1.0
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

Hi Randy,

On Wed, 13 May 2026, Randy Dunlap wrote:

> This docs build warning is now in mainline.
> Should I ask Jon to merge the patch, given no activity on it?

Sorry about the delay; I'll pick it up as a fix.


thanks,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
