Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AC3C02199
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 20:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZPI9HVIND3jvMAt39VECromfCWEAFXen8BhmgjX6XQ=; b=uEjRgmnqdT4yB3
	cx7yaltuGVf8hLc2IZ1lZLIQneMIoi3yCqH1jzeuY0j7kjovDURnuvMrmkwyKWKnr4XIr33aCNaxl
	rhmdb0PL/dFzR+hhOjrFg7f0K2L2wCnlKE2kX/SxsxJU8NVGibToeTgCSbNixAsxKQ2SzAz4mCI1d
	Ny7xtu4GxVIRlcsQ7UUNYcZSUXtMx7LmxdXRW9/KVE1tYVCNUTKttQi2Q6IAspQSt7CVTwID4VyBU
	hToGiGB5o2IdzJgqQAk3pTvRAsMFW5vWllU7rnmzQM/t8VrcGYRAvggEjc70F1yxHUt3AUTgkePAz
	E9vyS+UWrTcL70UImQPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg8Lr-00000007TAq-2BBa;
	Thu, 06 Feb 2025 20:19:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg8Lp-00000007TAC-1quG
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 20:19:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C570EA447D6;
	Thu,  6 Feb 2025 20:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42548C4CEDF;
	Thu,  6 Feb 2025 20:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738873192;
	bh=TGiyvQ51HFtyJBq0YnBFDewmoBrpiEOd9OQdDKub0WE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cVdcUcpUobxy6SfDVGH4G4PrZf5gYd101Gee2hXInzg8n2QNMCGhGCCZCfuEp1kyZ
	 +k7mr0e/Ds6JDFRXvN8UrnftlB8tgX6sciecmFLyccGOMZ0Ry7CfAqSky5Pz0qmnjI
	 u59mhtxLhESJfrESolO0CGmw5U/npV6jpWpr0Qp/1530qY/MZYZ9cTecOAiYbjhYie
	 yAx7B6stHzx2b/FNXRay2tcYLeiAOXYT2sHLmt5UnN6C6hORQXOiyBO2Pw4fytnu1F
	 /7cLUmT7IjsTeQQPZLp8AOT84kfaDDz2I4ZF94AHP8HCtoNCZ7KgPH33SW/Xe8Owfw
	 W182OAF05gCfA==
Date: Thu, 6 Feb 2025 12:19:50 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Zhihang Shao <zhihang.shao.iscas@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, ardb@kernel.org
Subject: Re: [PATCH v3] riscv: Optimize crct10dif with zbc extension
Message-ID: <20250206201950.GB1237@sol.localdomain>
References: <20250205065815.91132-1-zhihang.shao.iscas@gmail.com>
 <20250205163012.GB1474@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250205163012.GB1474@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_121953_545716_E57872A7 
X-CRM114-Status: GOOD (  18.73  )
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

On Wed, Feb 05, 2025 at 08:30:12AM -0800, Eric Biggers wrote:
> On Wed, Feb 05, 2025 at 02:58:15PM +0800, Zhihang Shao wrote:
> > The current CRC-T10DIF algorithm on RISC-V platform is based on
> > table-lookup optimization.
> > Given the previous work on optimizing crc32 calculations with zbc
> > extension, it is believed that this will be equally effective for
> > accelerating crc-t10dif.
> > 
> > Therefore this patch offers an implementation of crc-t10dif using zbc
> > extension. This can detect whether the current runtime environment
> > supports zbc feature and, if so, uses it to accelerate crc-t10dif
> > calculations.
> > 
> > This patch is updated due to the patchset of updating kernel's
> > CRC-T10DIF library in 6.14, which is finished by Eric Biggers.
> > Also, I used crc_kunit.c to test the performance of crc-t10dif optimized
> > by crc extension.
> > 
> > Signed-off-by: Zhihang Shao <zhihang.shao.iscas@gmail.com>
> > ---
> >  arch/riscv/Kconfig                |   1 +
> >  arch/riscv/lib/Makefile           |   1 +
> >  arch/riscv/lib/crc-t10dif-riscv.c | 132 ++++++++++++++++++++++++++++++
> >  3 files changed, 134 insertions(+)
> >  create mode 100644 arch/riscv/lib/crc-t10dif-riscv.c
> 
> Acked-by: Eric Biggers <ebiggers@kernel.org>
> Tested-by: Eric Biggers <ebiggers@kernel.org>
> 
> This can go through the riscv tree.
> 

Actually, if people don't mind I'd like to take this through the crc tree.  Due
to https://lore.kernel.org/r/20250206173857.39794-1-ebiggers@kernel.org the
function crc_t10dif_is_optimized() becomes unused and we should remove it, which
would conflict with this patch which adds another implementation of it.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
