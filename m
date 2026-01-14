Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167D8D39005
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 18:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z5PX2tJo7hGchMRiKfo19oHf9+Ur7y6A7HJfDfWcqYA=; b=bEK0Xl0n7BOqvj
	/9ybwikDF2IUcCIzf/LofYpGndCXo4fYrud2+TlrXCmt4KVf1qF47ZHmNap5K73FELQsyWYZAsfMd
	nW7ZntLAld2eMqyXwJmWr7p6InCP+SlAEbGyx8G6GQuLTqx+oiEojbdssskZVHqNM4clBt2iSvZ6W
	knY6O8FxtATXBI/AP1V87Cf2d6CDNlS1SXp5bsVxqWXKef5RmHeGq61bxv63harNwbwQSQNZuK4js
	Pd9szMoMrZGoJAg4kFW8lVhLzdgP1tH2bTDQnsngd/bFjuofcqBOXRu+zd8lXY6dk1KfLYrSsq9I4
	Z/zRn022EAJGiNxxijZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5QP-0000000AI2Q-12bt;
	Wed, 14 Jan 2026 18:16:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5QN-0000000AI24-3EjB
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 18:16:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EDFC960051;
	Wed, 14 Jan 2026 18:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4D1C19424;
	Wed, 14 Jan 2026 18:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768414614;
	bh=ItC3CUW/lqRPaei9BlHdRw3NjMxWF+PXVxF/ZxVsNfg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=b3AB6yNXvjXB7nQXKAx9Ib1euVhc0kZi9bpSVwfa+2ia1zRYkamUkEnl0pDETEOwr
	 7uoMjvXc9Qv0osKGoRZgbgWgZ5L2z8LY8BhghpMPd/u2mFgXxRIXpG7QEkNQuxcLAm
	 03rZyXb2rnbB7xp4ocv1RgYC+hP54J/0CTz3EUhz/1E66z9EEvT5S9F70q4/7WWEus
	 YA5kh98n/DW8rSPDzoQOSYdR4hgjUCllSzek9z7OfUJHG+zDtSFTaZdJLzKPpW2YVU
	 VAnhfDt+vHSafIXl4vA0u7qQBGt3KBSZ+J7zbJNph9yoT4Yi82Rse7oXT3vRjKYT7b
	 NrSkxlSN0UqGQ==
Date: Wed, 14 Jan 2026 11:16:50 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
    Atish Patra <atish.patra@linux.dev>, 
    Samuel Holland <samuel.holland@sifive.com>, 
    =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, 
    Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
    Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor@kernel.org>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH RFC 00/10] riscv: Add support for rva23
In-Reply-To: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
Message-ID: <9325a1ab-62e7-e61f-ab55-cc06b582a23a@kernel.org>
References: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
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

Hi Charlie,

On Wed, 10 Dec 2025, Charlie Jenkins wrote:

> I will be talking about rva23 at Plumbers this year and have this series
> as a draft of my ideas.
> 
> rva23 is a RVI profile to group together extensions that are expected to
> be found on high-performance systems.
> 
> This series:
> 1. Introduces a framework to add extensions to the kernel cflags
> 2. Adds a rva23 config option 
> 3. Optimizes riscv_has_extension_*
> 
> This is based on 6.18 plus
> https://lore.kernel.org/linux-riscv/20251020-riscv-altn-helper-wip-v4-0-ef941c87669a@iscas.ac.cn/.
> 
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

Thanks for sending these.  A few suggestions, for when you resend these 
patches:

- Please split the cleanup patches into a separate, predecessor series 
  from the patches that are designed to change the way that extensions are 
  handled.  The latter patches will probably take longer to reach 
  consensus around.

- Probably best not to characterize the latter set of patches as "RVA23 
  support" patches, since they won't affect the kernel's ability to 
  support RVA23.  These just enable building an RVA23-specific kernel.  
  It's not entirely clear to me that this is a win -- I assume the 
  argument would be that the performance benefit for some systems would 
  justify the additional complexity and the performance reduction for 
  other systems? -- but that's what we'd need to discuss.

- Continuing that line of thinking, I think we'd want to see some 
  performance measurements after these patches are applied, on 
  hardware, for both RVA23-specific kernels and non-RVA23-specific 
  kernels, and the latter on both non-RVA23 hardware and RVA23 hardware.


thanks,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
