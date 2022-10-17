Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4D2C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 16:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RFX6ucM4FQjvsJdcPOMyTCZXM/Ifb/cH7DjAdEn924g=; b=I+vLLdNXCon5uu
	IIDrv29uhwO8Xq74GNpNV8KfCTK8F7no28tfuVuPi7j8t6off+09/Pjwbom49KS3Rw6RvBsDojaZK
	EZchzOwdVISkJ9JESwX8IemcQd9c4ByaJriErVI31eL1puw5EpOKGBMzWexhzzFBhHYpmEzSpYBnX
	7yKxFBAqGWRgKaQqI0OQHGmdLsO2ROemcr6WsMqlSPWGqUo1P3+IdjtkSrC/Hio/HQ2RVVYpEPcSg
	3XZbaq2xjB+3H+YtDxJR9ikQh4Jp7gHyj4g0AMoae4p5ed3ESs+nOvupQ4ywKUT0ZOitIMZhCQeFo
	gdOV7S5878eSBB+6FQXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okSar-00DeM9-6R; Mon, 17 Oct 2022 16:03:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okSao-00DeLC-QG
	for linux-riscv@lists.infradead.org; Mon, 17 Oct 2022 16:03:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E7129611A3;
	Mon, 17 Oct 2022 16:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2635C433D6;
	Mon, 17 Oct 2022 16:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666022633;
	bh=DLnN0htvivwVhuJQm7cIim+/YRJwPriv2PpoqwyHlSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QiuJUAR/ea4x4NaK2D4yJyt1vA6WE758Mv0xHXmgJ9aNw3zYyfmyCCyey7ihQq02E
	 2RwieJBrEp7hJSUKL/h/IcdWi9VHL0oDunl6+G1czR3ZWGU4//3Z9uY6PadeQKK/zW
	 1MyDEBUM2RJTiV1qzheh2YXAkf92LBGAcM8WjDNqOjfww41HyoYTf6PhG5x8dG55Ya
	 PLSL9qY4Gyx4kVKY/s2AghpR4a/tG7VRxcGh63KoQJ+UmcXgqjwi9WFm3BCdVTwkhW
	 mLdyXZ1lK97qfyWgRU7CPwxo3iGpKiCWlGthjkjbXnL1/O+MXZLHK9E1x3GvSQK/1/
	 Opg8ZlbD22QNA==
Date: Mon, 17 Oct 2022 17:03:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Dao Lu <daolu@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] (attempt to) Fix RISC-V toolchain extension support
 detection
Message-ID: <Y0185O1zjyfv7WjN@spud>
References: <20221006173520.1785507-1-conor@kernel.org>
 <20221017155103.4dt5uzmnlbtibqcn@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221017155103.4dt5uzmnlbtibqcn@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_090354_906009_BC91086D 
X-CRM114-Status: GOOD (  13.84  )
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

On Mon, Oct 17, 2022 at 05:51:03PM +0200, Andrew Jones wrote:
> On Thu, Oct 06, 2022 at 06:35:19PM +0100, Conor Dooley wrote:
> 
> However, we could also drop the compiler and linker checking if we
> converted our use of cbo.* to the insn-def.h framework (I think Heiko once
> mentioned looking at doing that, but I'm not sure.) I'm looking at adding
> Zicboz support right now and for starters I've duplicated and modified
> these checks. But, I think I'll look into defining the instruction type
> needed for cbo.* and using insn-def instead.

What is the ETA of your zicboz support? Do you think these patches
should be applied to v6.1 & backported before being replaced by insn-def
when your zicboz support arrives? Or just wait for your zicboz series?

Trying to decide what status I should set for this in patchwork.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
