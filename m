Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78ADC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 09:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJjTfHynhn+ASGsNOyQV+kHTpGLqB7nLUJgGC4pzY3A=; b=BAdUWh/LAhcHo6
	5fU7yYqjRGNU9xE1Uh76t/c32eUy9KclB6qoBusLpzyfeC2Djjn/7sUWwuRqqmjkrVEd4OesJt3Yx
	01ELXcvA3kTziYsAdwoBN9S4GE4SaA8wIsELWhitNlj6TQoDVafNxz4gI8NiZT6x9dfHe/e2W/s1D
	LrmfKDtJbNZoLxRfWDwZ1vTPY+cmgz0MYnFb8NwPfzn19kFynAjMfegLnMn42/AKlc4DXtEkQi+uX
	b9Mm1H16QbVlwat16/tvFtAc5+jvhGHo8+/HjjrF/zRika+WHC1r9svR+1tu1pW4bzSw2lOplUU7n
	Hx+cvWjAxRK241f//e+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJc5-008TYq-0X;
	Mon, 15 Jan 2024 09:50:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJc2-008TYU-0S
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 09:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 67D7CB80AB3;
	Mon, 15 Jan 2024 09:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998F1C43390;
	Mon, 15 Jan 2024 09:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705312231;
	bh=eGRxQIF7PrJgEuijlpw7aixZyzO2hkfFM4iXxKd+Nz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IZ2lc/uZT2SrNri4LKCvfWvQo3KwcuvbO89HWpQviq7Jga8wMoMuDOXFAfSJig4EV
	 TlSDRh98XRmAsRzDFkJ5QwvzIkD6vQp/lcE3zhxoProqQiqHmYGSLMKRTl8C2Iecep
	 6IaGSwbWhSxZasXJDHf4BZCpwZTuaY8qmoy4Ln7WjAo4RUxdjvOYp4TN2eZnLMY0Ta
	 XNkrf2qLOBQ2WabzA8k1FoLgQEav9Kh4S5gTGosNg3HArywfCL6T9LLXut57bzMVEH
	 woUeNFUpU0Ae8+MVTL8+h0Bbbeouu+HHXOFPkaBJegrvSzn4VMddlyBTo1w4AEhMe2
	 WFJU7LCes9V2A==
Date: Mon, 15 Jan 2024 17:37:41 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] riscv: enable lockless lockref implementation
Message-ID: <ZaT85b/FUDe9frUz@xhacker>
References: <20231202140323.315-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231202140323.315-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_015034_375505_B5B569F5 
X-CRM114-Status: GOOD (  14.51  )
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

On Sat, Dec 02, 2023 at 10:03:21PM +0800, Jisheng Zhang wrote:
> This series selects ARCH_USE_CMPXCHG_LOCKREF to enable the
> cmpxchg-based lockless lockref implementation for riscv. Then,
> implement arch_cmpxchg64_{relaxed|acquire|release}.
> 
> After patch1:
> Using Linus' test case[1] on TH1520 platform, I see a 11.2% improvement.
> On JH7110 platform, I see 12.0% improvement.
> 
> After patch2:
> on both TH1520 and JH7110 platforms, I didn't see obvious
> performance improvement with Linus' test case [1]. IMHO, this may
> be related with the fence and lr.d/sc.d hw implementations. In theory,
> lr/sc without fence could give performance improvement over lr/sc plus
> fence, so add the code here to leave performance improvement room on
> newer HW platforms.
> 
> Link: http://marc.info/?l=linux-fsdevel&m=137782380714721&w=4 [1]

Hi Palmer,

this series is also missed, let me know if there's something need to be
done.

Thanks
> 
> Since v1:
>   - only select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
> 
> Jisheng Zhang (2):
>   riscv: select ARCH_USE_CMPXCHG_LOCKREF
>   riscv: cmpxchg: implement arch_cmpxchg64_{relaxed|acquire|release}
> 
>  arch/riscv/Kconfig               |  1 +
>  arch/riscv/include/asm/cmpxchg.h | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
> 
> -- 
> 2.42.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
