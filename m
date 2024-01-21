Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76026C47DD9
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Jan 2024 01:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66yNqXtsmK1/Wn3dOzWxSoAYmu9qpWOXtSSSi1VpLmQ=; b=Ck+ehvWUPHtK4U
	iXUiqo2YbB2tkTgbsj/Z6pj6P4HZDMq1qrCumEHk8MurH/PPMJu4dsTjiYVzp8c2rm0M+Ab/nf1lt
	qMctmL1YK1VKqmSFKY8KbN9Y6Bygv2QNM5tBKKmLePBGOF5NKD+4oB3de8kYFmHij8m44/fqsaePl
	1a0P3e50L/bTZvg6j/KsIoRIEgbugK9yOV+nIlk6ntIlDVa8g/1L752noTrP+RQ9eT/2Gc8dtDs/t
	hd6THsWHqNdCNoyShGAf5JVruRM9a3QGPGZH7RHBDVFzaRFxZT56We8nQyaqGsIvw2WDFEfS9auW8
	j1BI//zrHqCHZ47NkNbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRMPK-008il4-1T;
	Sun, 21 Jan 2024 01:13:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRMPC-008ijT-35;
	Sun, 21 Jan 2024 01:13:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B2EFCB80A1F;
	Sun, 21 Jan 2024 01:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8646CC43390;
	Sun, 21 Jan 2024 01:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705799624;
	bh=BxWcz+0bN+GA9nXwcpJAF3xX62AbrnrZ8mAw5Ld/0lI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RXsNvtAZRtYNGIab1LSdVVsXOIOnE9ovOgZTAP/4kQdpKRBb4dPt8tayNSU5niiec
	 Oeru4K31pWnAhKC/r0NqfrN/w6ciKLUzFyOdhTGukZO6eLdLcWzUaOND0r5SqlXFv0
	 x55faG5DgFXd14Asw5gx5jL1ovcuc2Gd/ea3n+zbMifJzC1unGTaO/zL+gLgUCIBGQ
	 DxfSRvoY5K6ar/7W3DukZmxWONTgBVDpUs7s+b6lWvAXOadzqAj4AYJVSJGXGyyMRh
	 Kxp1z/YK7GIR/g4ccyvPcm5/foc1HJmSiTrSjlLMZNiWdg4cDdwwdPJGFmMCDS2aK4
	 VyWbs/pBEhmMg==
Date: Sat, 20 Jan 2024 17:13:41 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: Re: [PATCH -next v21 23/27] riscv: detect assembler support for
 .option arch
Message-ID: <20240121011341.GA97368@sol.localdomain>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
 <20230605110724.21391-24-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230605110724.21391-24-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_171347_145967_CD426192 
X-CRM114-Status: UNSURE (   7.75  )
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

Hi Andy,

On Mon, Jun 05, 2023 at 11:07:20AM +0000, Andy Chiu wrote:
> +config AS_HAS_OPTION_ARCH
> +	# https://reviews.llvm.org/D123515
> +	def_bool y
> +	depends on $(as-instr, .option arch$(comma) +m)
> +	depends on !$(as-instr, .option arch$(comma) -i)

With tip-of-tree clang (llvm-project commit 85a8e5c3e0586e85), I'm seeing
AS_HAS_OPTION_ARCH be set to n.  It's the second "depends on" that makes it be
set to n, so apparently clang started accepting ".option arch -i".  What was
your intent here for checking that ".option arch -i" is not supported?  I'd
think that just the first "depends on" would be sufficient.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
