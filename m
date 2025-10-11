Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81608CCD183
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 08:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Scb9Pr7uccbv8H1sNJcP0mdz9wzepPaiA3OT8/ulho=; b=sRXGE2i5PxiZq4
	bAbKC2vIGcxgk/cpTWUDqYuTDMm692fr5yX7LND/zuGJ4SDW3rUiyDqgFtM4h2/nUTD5OmyjQZOIA
	EiXW2RF2r7be+b1u9FqHhDDja5HKjeO3UQgjJ+CpZgA4LyH4COBk8JM4f9XfNJ37xMPeO5oaOOzhl
	gstSBPha9VS1jVQAo+qJqRz7L16tvb6Fc/Od0yR09ax13S//NQNwRZ1rN5KhgaYA8y7ZxS8giZnU4
	3JOTaiZDCwCeZKGWxoXG61aaTTFlqrJ0Np2FX7rDg+LUGQsLqytjcz/H+RekeLlrN1qLIgAm76ftv
	0JlJlIOlur7iaUwC1NPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7V7s-00000009xc3-2M3d;
	Sat, 11 Oct 2025 08:38:52 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7V7o-00000009xbZ-24uN
	for linux-riscv@lists.infradead.org;
	Sat, 11 Oct 2025 08:38:50 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1AE7020EF2;
	Sat, 11 Oct 2025 10:38:43 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KfWdQL3U1iZv; Sat, 11 Oct 2025 10:38:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1760171915; bh=Xd8rdUfoPMg6QaScAWlW2FrpZAahiivHRi2Hl750VIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GH8FXvrPy+0BGJjsWRtz+eW5+JgBvE1LO0VkIVxwueYQOj1iT3bX5umkqIWiHMNhg
	 8ae4UZyh81KcaBb88gWGYK3RjrHLmDiohtVEcKnxGV8Xq4QZJRhtPO+PqyiMVsfUsX
	 L1DtIgHC1WNjP54ZCzjFQqGrtD4Bf2KgT3cspnnQzH9p22uZOt+pYSXqAPwxqUFBmX
	 dkPcQIeWe9RgX6z362LS97wRKEKIYblSNjcqsMLKziaYokV7AgWuCZZzIG2MBhASPK
	 81YX1QdfbhxjzQ3azxu8+h6ptnJyRU4MgVyeSQL9AAf8XREHmpKF0sLzNI2Ktiw/Tu
	 kwwWecrBEhb2Q==
Date: Sat, 11 Oct 2025 08:38:22 +0000
From: Yao Zi <ziyao@disroot.org>
To: Paul Walmsley <pjw@kernel.org>, torvalds@linux-foundation.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc1
Message-ID: <aOoXYHaFe-R7ZySY@pie>
References: <2c804359-3d43-0fba-7173-a87f9aec4bd2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c804359-3d43-0fba-7173-a87f9aec4bd2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_013848_948915_059A0632 
X-CRM114-Status: UNSURE (   9.16  )
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

Hi Paul, Palmer,

On Mon, Sep 29, 2025 at 02:00:17AM -0600, Paul Walmsley wrote:
> Linus,
> 
> The following changes since commit a03ee11b8f850bd008226c6d392da24163dfb56e:
> 
>   riscv: Fix sparse warning about different address spaces (2025-09-05 15:33:52 -0600)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.18-mw1
> 
> for you to fetch changes up to 0b0ca959d20689fece038954bbf1d7b14c0b11c3:
> 
>   riscv: errata: Fix the PAUSE Opcode for MIPS P8700 (2025-09-19 10:33:56 -0600)

...

> Guo Ren (Alibaba DAMO Academy) (1):
>       riscv: Move vendor errata definitions to new header

As already noted by Han Gao[1], it seems the second patch of series
"riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup"[2] is included in the
pull request for 6.17-rc1, but not this one for 6.18-rc1. Is this
expected?

Best regards,
Yao Zi

[1]: https://lore.kernel.org/all/CAAT7Ki9_Vm0+v9RHpa2w-Bg3agJy2Tp4d6+tcPJ=M7XX3GV-7Q@mail.gmail.com/
[2]: https://lore.kernel.org/all/20250713155321.2064856-1-guoren@kernel.org/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
