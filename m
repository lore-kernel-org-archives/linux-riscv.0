Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0913D1118D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 00:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XxVuKWDWt6twr6L8vGLiNIIJP+yDrXR6YwHHYDIrdwo=; b=USO3yGlsaljZpN
	ttGCjLEtlDkzeMl8DYxthzEK2SVJloz8yNI7haLOq3gRU+Hd9iWzR5veeDhMpJdGl0FZWW6uFjyBI
	5otRLUoDr5hYmSsoLRN/28WuBL17zjuciPzzpH9rNxKEzXpiRRTmn2OXak2l8iD0BQPLeGldmeuuT
	6uSKBuCER3rEe4fOacSqUTonPBWELuqInEjtFuiZP0Pq9UWH8HVivNePL/dmeFAOQ8s/v5E9eGhqf
	KrmgxK1nNWCVUSR6hhkmlbfthsTJnxYujI/1bjGx12Dtq2VOL3rP679PjinVtbl1wVc6SYSa6SqJL
	M3j4DyyTISGPjMiGUELg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQAQ-0000000Foek-3tJF;
	Thu, 27 Nov 2025 00:47:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQAQ-0000000Foed-0wCx
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 00:47:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 636FF60145;
	Thu, 27 Nov 2025 00:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E99C4CEF7;
	Thu, 27 Nov 2025 00:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764204445;
	bh=i06fKk7VETrEAyFbV2Adc4g3CHVZmHovX+6PZqyAAQc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dgX+clQC3PgwvnBxxq0nMaIbQaZwO6D8WdZwHN+EE6hsZMSiwsZZ2JZAMIW+rKob9
	 Q/CVVsqqodpGuH4SoKFPFWauFEOQuKHRAWJit9pKKJI2LBJtEYwh+T8rmX7+0SbbJF
	 0QTMUvWNOtFVl9KX/ZQDW6RsysgPfeBJT1iZyHb5T1ol9ReZaIO+GZFLS3Id8fcjK6
	 rdc9TyhCOrBIxfhwSAYLGChYbg7IufQweb/g3uN0bFyNXZLP/8QxwNurnIIsxPykzt
	 hEXffNkNSIS9RUiMGc+INTHvuL+/5mN3aGCEJMppSO1cf8A8jmQvM+k/c/8ITGCqqz
	 p/d+wbl9kL9DA==
Date: Wed, 26 Nov 2025 17:47:21 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] riscv: Add SBI debug trigger extension and function
 ids
In-Reply-To: <20250710125231.653967-2-hchauhan@ventanamicro.com>
Message-ID: <1a75ab7e-0329-e3d6-d66f-ad20de3f3ae1@kernel.org>
References: <20250710125231.653967-1-hchauhan@ventanamicro.com> <20250710125231.653967-2-hchauhan@ventanamicro.com>
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

On Thu, 10 Jul 2025, Himanshu Chauhan wrote:

> Debug trigger extension is an SBI extension to support native debugging
> in S-mode and VS-mode. This patch adds the extension and the function
> IDs defined by the extension.
> 
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Thanks, queued for v6.19.

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
