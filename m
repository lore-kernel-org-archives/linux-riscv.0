Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87060C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 04:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PnyWIcH/MI6eFbAFVt6gUHtDQ9r+zJ+yiRhEThhe8oM=; b=k33cqt50z5+2bo
	5uoYqEq1573jQFCmR1WCLqcrdiGj3gRbgG8bg4SFC93NO73PxtvTAHo1hiRnScCbU3FaXrDspmzlK
	4hGSxK04n97ezlCqtzvGlRI77EBci5zC0qVpyGNJGj9SlI4mPSu7CO9/irCS15h0KKFhAUmJhTQZm
	zTbs4/77t3ZMIqS0SRt7/iUdWWJai7QeQkUU+dg6a9qRdSKN/0E5kp5NjGKtdYXZu47UIjNX6Lb4C
	H7Gd19ZXMUCsAmcZJXWuehJPWbZ8vEk4sH4zx5Ji9n6lTGpvKMOUoY8nBM7WMQSLQfvQusTjvQ/he
	DBbBIWvcLx265OdQoIbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1JEX-007rWt-2H;
	Fri, 10 Nov 2023 04:35:05 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1JET-007rVi-2z
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 04:35:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 17AE9CE1196;
	Fri, 10 Nov 2023 04:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF575C433C8;
	Fri, 10 Nov 2023 04:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699590899;
	bh=luMWNgUgOzDCukfqCzpzbeoC/xYIuvR4tlh8y8BriOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kkmb1yV3cX8ZqC2Ugs56PrhNzF27vOjUHj7Zi9Am2rWheYaIW6PoIBxdQXrExYQ6d
	 /M+jhxGhYDtOneLSN0nlDZyHowUbNauRO+fyhNafAl1Y0X7jzGFlyJ+klNa7Lnat+y
	 49Yxbwrr+8p5wcA6XhOK34zy5ZlTMKxY4d7CSJYRNS14I1K2tao9RwYjCPJilMg4Fl
	 TMDeMHKmxFrCqUeQbLDaIJMxJecWs33mXwwUJ6mX2FdYgr8bPk0PBecmLBjtz8C+Pt
	 CUpVSOZvKNwscrCaq03QH8fQk86sPy/9dHwK9zdoOj2sp1EaZiVN3g3RVC/Z5zqJZe
	 TM6yuwOERH10w==
Date: Thu, 9 Nov 2023 20:34:57 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, palmer@dabbelt.com,
	Albert Ou <aou@eecs.berkeley.edu>, herbert@gondor.apana.org.au,
	davem@davemloft.net, andy.chiu@sifive.com, greentime.hu@sifive.com,
	conor.dooley@microchip.com, guoren@kernel.org, bjorn@rivosinc.com,
	heiko@sntech.de, ardb@kernel.org, phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 06/12] RISC-V: crypto: add accelerated
 AES-CBC/CTR/ECB/XTS implementations
Message-ID: <20231110043457.GA6572@sol.localdomain>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-7-jerry.shih@sifive.com>
 <20231102051639.GF1498@sol.localdomain>
 <39126F19-8FEB-4E18-B61D-4494B59C43A1@sifive.com>
 <20231109071623.GB1245@sol.localdomain>
 <659DE1CF-4F42-4935-9DFD-E127269CEC54@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <659DE1CF-4F42-4935-9DFD-E127269CEC54@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_203502_312220_ACFF1068 
X-CRM114-Status: GOOD (  23.83  )
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

On Fri, Nov 10, 2023 at 11:58:02AM +0800, Jerry Shih wrote:
> On Nov 9, 2023, at 15:16, Eric Biggers <ebiggers@kernel.org> wrote:
> > On Tue, Nov 07, 2023 at 04:53:13PM +0800, Jerry Shih wrote:
> >> On Nov 2, 2023, at 13:16, Eric Biggers <ebiggers@kernel.org> wrote:
> >>> On Thu, Oct 26, 2023 at 02:36:38AM +0800, Jerry Shih wrote:
> >>>> +static int ecb_encrypt(struct skcipher_request *req)
> >>>> +{
> >>> 
> >>> There's no fallback for !crypto_simd_usable() here.  I really like it this way.
> >>> However, for it to work (for skciphers and aeads), RISC-V needs to allow the
> >>> vector registers to be used in softirq context.  Is that already the case?
> >> 
> >> The kernel-mode-vector could be enabled in softirq, but we don't have nesting
> >> vector contexts. Will we have the case that kernel needs to jump to softirq for
> >> encryptions during the regular crypto function? If yes, we need to have fallbacks
> >> for all algorithms.
> > 
> > Are you asking what happens if a softirq is taken while the CPU is between
> > kernel_vector_begin() and kernel_vector_end()?  I think that needs to be
> > prevented by making kernel_vector_begin() and kernel_vector_end() disable and
> > re-enable softirqs, like what kernel_neon_begin() and kernel_neon_end() do on
> > arm64.  Refer to commit 13150149aa6ded which implemented that behavior on arm64.
> > 
> > - Eric
> 
> The current kernel-mode-vector implementation, it only calls `preempt_disable()` during
> vector context. So, we will hit nesting vector context issue from softirq which also use
> kernel-vector.
> https://lore.kernel.org/all/20230721112855.1006-1-andy.chiu@sifive.com/
> 
> Maybe we could use the `simd_register_aeads_compat()` wrapping as x86 platform
> first in a simpler way first.

The "crypto SIMD helpers" (simd_register_*() in crypto/simd.c) are quite complex
and have some disadvantages such as marking the resulting algorithms as
"asynchronous".  I expect that a much better approach would be to align RISC-V
with arm64 by disabling softirqs while the kernel vector unit is in use.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
