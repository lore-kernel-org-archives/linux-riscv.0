Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06196C001DE
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 08:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTft7ty3tAQIWYFEapAs+kmS0qvIl+3Cc2AS/N+BApk=; b=hzT12VEXvW/0aF
	lybjvWGGdsgujhkzN/OPheuIAoV314TtynQN5l8mWJOqwUykF+zmS1dQ0Ix4QtRL3tEMspHHbcylZ
	zLnoHU9nz2qcpzYTYguQDFUdcIgwKnBSyufupQvAIgJsMp3/9ecBp/m/HYCR0Li63LPHKhLWUN8Bt
	MJFnFtT+k98Qwo22Cb3k2GZCW8g15MlBm+MFneYGVEeYYEjImdLeQTBUJNcFCNzIsmuXvkVaNroXk
	5ALtEb840eAJvw40AicY0XhGVGvT39BIDACNbhn2yRdUNmjJWe9/82noKHhdfGsU1WM8jGQArGCWV
	FqRCrhxLXgvRcUWhO/Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR7IV-004NVI-1s;
	Wed, 02 Aug 2023 08:33:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR7IT-004NUa-1j
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 08:33:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 165126185F;
	Wed,  2 Aug 2023 08:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF834C433C7;
	Wed,  2 Aug 2023 08:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690965210;
	bh=6L87WFqpRWoyspDs3L6KZduy9PxJ66o4a4lAQyjQVr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYxMnfhfp/hn8Iri+SxArk/uuPg4mGzMWdOpzu5oZn5Pl5CNy8ezbaDd8McBJ203o
	 7uOOUooPxq83PZsOSkVUDxZtrWzX1UDk3HR1+FGCP3YJJKYI8Av65YNjiKhedbM25m
	 jgI2e0TgWX7c+FRdsmJ8yJ6LLy+35xiTC7jd5P4k=
Date: Wed, 2 Aug 2023 10:33:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Dao Lu <daolu@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mason Huo <mason.huo@starfivetech.com>, stable@vger.kernel.org
Subject: Re: [PATCH v1] riscv: Using TOOLCHAIN_HAS_ZIHINTPAUSE marco replace
 zihintpause
Message-ID: <2023080253-headache-moneybags-a833@gregkh>
References: <20230802064215.31111-1-minda.chen@starfivetech.com>
 <20230802-sharpness-spoon-f9b8804fb66f@wendy>
 <d64874cb-8628-a6d2-d2f4-8af4d0ebf8b2@starfivetech.com>
 <20230802-seismic-gallstone-fca0f4b17076@wendy>
 <c42bd997-8795-8bf7-eee1-3ac8b153371a@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c42bd997-8795-8bf7-eee1-3ac8b153371a@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_013333_661701_53531B8A 
X-CRM114-Status: GOOD (  25.71  )
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

On Wed, Aug 02, 2023 at 04:17:51PM +0800, Minda Chen wrote:
> 
> 
> On 2023/8/2 15:48, Conor Dooley wrote:
> > On Wed, Aug 02, 2023 at 03:32:15PM +0800, Minda Chen wrote:
> >> 
> >> 
> >> On 2023/8/2 14:54, Conor Dooley wrote:
> >> > Hey Minda,
> >> > 
> >> > On Wed, Aug 02, 2023 at 02:42:15PM +0800, Minda Chen wrote:
> >> >> Actually it is a part of Conor's
> >> >> commit aae538cd03bc ("riscv: fix detection of toolchain
> >> >> Zihintpause support").
> >> >> It is looks like a merge issue.
> >> > 
> >> > Yup, spot on.
> >> > 
> >> >> Samuel's
> >> >> commit 0b1d60d6dd9e ("riscv: Fix build with
> >> >> CONFIG_CC_OPTIMIZE_FOR_SIZE=y") do not base on Conor's commit and
> >> >> revert to __riscv_zihintpause. So this patch can fix it.
> >> >> 
> >> >> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> >> > 
> >> > Did you actually manage to trigger this, or was this by inspection?
> >> > clang-15 + binutils 2.35 was, IIRC, how we spotted this because that's
> >> > what the clang-built-linux CI uses to test the LTS kernels from before
> >> > LLVM's IAS was supported for RISC-V. Seemingly all that needs to be
> >> > satisfied there is that zihintpause doesn't appear in -march so this has
> >> > gone unnoticed.
> >> > 
> >> > Fixes: 3c349eacc559 ("Merge patch "riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y"")
> >> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >> > 
> >> > Thanks,
> >> > Conor.
> >> > 
> >> Thanks, Conor. I found this just by inspection. I found a issue that vdso.so call cpu_relax
> >> cause application core dump in kernel 6.1.31. I need Samuel'patch to fix this. And I search the log
> >> of processor.h found this issue.
> > 
> > That doesn't look like it is fixed in later stable kernels (we are at
> > 6.1.42-rcN right now I think). It sounds we should ask Greg to backport
> > 0b1d60d6dd9e ("riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y")
> > to 6.1. Does that make sense to you?
> Yes. 6.1 is lts kernel. Starfive will use this kernel for a long time. Thanks.

What is preventing you from moving to a newer kernel version?  All of
your kernel changes are already properly merged into Linus's tree,
right?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
