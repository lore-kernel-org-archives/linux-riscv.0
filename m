Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0D6606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NtmEvc8E;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ngAn6gaO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TkOA4bTpal2Hicv5aDmZaUWbn3bOK09/9K6pcXc5TQ8=; b=NtmEvc8EyzJ4zVYrcBgEgQss0F
	Gr4wAdjLAaCEQq97q5DKaJxqp/x9efQG6H8unTeZBuelDc0+ZLtWXaw1VChwq7UFUT7ooPJ459gU1
	2xTaiFNrLx6UMIcLG+M4qfheWT1aARPWVDIHlNyeeZjEpRseyGKw3LLWjlq61QvSfc805D+8FREqX
	3hlOvaQmVfzPrn1KeFykS8moR1G0aalS932JwUZ2DWNu+Z8iin3Pn6TtJGPbJhC9/7FRdBTGklabp
	XEPGaY1gOJ3D7Tq8DA4rsfPufK+VjZIxQVczqaRD/mg9XDEqwDvJVPHTvN9eNPsKiJ6hCH0fsr3Xr
	YGtKa84w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK3R-000000065pL-2Bzk;
	Tue, 17 Nov 2026 14:21:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK3P-000000065on-1kTG
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 14:20:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 926E663533;
	Tue, 17 Nov 2026 14:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DFB81F000C5;
	Tue, 17 Nov 2026 14:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794925258;
	bh=viu1yje4As6OjByhd+biKMvb1JY5yU9tAC8Wwkiiqko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ngAn6gaOxuvKFm4o5ca0TX7e7f1Ly2G5dtLvAyv4P9a++xAkPCDa+Wuw3cJoXtRJQ
	 KPuox3JrZXg/M1hFCBWqSwkRK7GMNR8UdPmyUePP1j2WIHAHotnl/FgFN4xGeXa/mQ
	 Q1+aXz4c2pK2RhSJYALWw1a4DAGDcTugpdniJMKqTsFKziUniavOiOjj/t6E4ryT/v
	 JaCF0g/UXw7nxy1NysxUlzikBUwJJH/u1JbvSX3G/YGUuw3WpuGk+a7NVJK+1lUzgT
	 yjWXYyQ+vnmjf8xSssVUxaNfT4HxSULVJuCh6b91K+nKP1uD4bhatBA9p8P42FsJxH
	 DY0UlueYbDlkg==
Date: Tue, 17 Nov 2026 22:00:43 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/2] riscv: mm: fix set_memory_x() and
 kernel_page_present()
Message-ID: <avxeCy_ovH1BSyOo@xhacker>
References: <20261117-fixes-riscv-v2-0-5edc9bdc54fd@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261117-fixes-riscv-v2-0-5edc9bdc54fd@kernel.org>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 04:00:19PM +0200, Mike Rapoport (Microsoft) wrote:
> These are two riscv fixes I found while working on a generic
> implementation of the set_memory APIs.
> 
> The first one stops set_memory_x() from making the linear map alias of
> module and BPF text executable.
> 
> The second one makes kernel_page_present() report the pages removed from
> the linear map as not present. Today it says they are mapped, and
> hibernation could copy them without mapping them first.
> 
> ---
> Changes in v2:
> - read the PMD entry once in kernel_page_present() (Jisheng)
> - Link to v1: https://patch.msgid.link/20261112-fixes-riscv-v1-0-1caac19897b5@kernel.org

for the series:

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>


> 
> ---
> Mike Rapoport (Microsoft) (2):
>       riscv: mm: do not make the linear map alias executable in set_memory_*()
>       riscv: mm: check the valid bit in kernel_page_present()
> 
>  arch/riscv/mm/pageattr.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261112-fixes-riscv-3e48788f58fe
> 
> --
> Sincerely yours,
> Mike.
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
