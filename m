Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF118CAC59A
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 01:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1UU9rH6sU9ouS752ug1JUacLoKv+mIRvBtWNNUHwBsQ=; b=qj8Nhh/IiKOFm8
	eRtBkDsCCqIzfeNvTuqRa290uOSNELKeynM0iG1UIMwohx9SM7b3KQ+mJUh8MjV4T14mxCDgr+o7L
	hzuoKUkYtGg2PhpPxQmGBLbySne6Jdb+crh+a/oK995bEEjfdCvR2WtkEzv9dg82zgo5J95k8Qor5
	UBs3keqaeZGBNYvJMv2k4YBe+pBg0gsE9HEnlraFE4sxlKNz4CGsbr1eGErKDWv3/ndG7GOQRoif0
	S0AOSmbH6R2Qgq0X1TP3Z0ZJ3NO7PjzQO4N7Hof04kBnbzzl8NgYyimCSWcpsaQxubEHT2skLSSFf
	SJyFDAFmopi9+bIuy22Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzmZq-00000004VMd-36wZ;
	Sat, 20 Sep 2025 01:39:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzmZp-00000004VMV-1ZpE
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 01:39:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 75AC66013A;
	Sat, 20 Sep 2025 01:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D1DC4CEF0;
	Sat, 20 Sep 2025 01:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758332388;
	bh=rh7cwBrAE1IG7NHihASXimQd9HV1rWtmQL+DvATx5iQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DLmvgmYl20zs0XsXJmVoKH7ct1cO0poq4n+qzHjVZyMJOTwzmbLOOYDN0veqfzk8T
	 mLRSKhgy3gsEpA4PGbqUqoJTat8bECCvSKzFItR4zwhXJlPnPK+maNHj9u7MqwsLnE
	 7ze8DAuHMf6D4kQIgUEs+TatOE/yd2fV/m3v6b9/jXcPzo+h3WKTNFbywv6uvSRcjv
	 vpYqfJS9qmklrWSgDgY/bChTR5eP68eCM1gKpDXqe9NDBSNv6hFRdRc1tVdRHNO3Nu
	 crOJ7y4mGp/Nso/AV0+5r0fQuBV2DpsBl/J//2rbYejlQRNeRLlcjiMFDTlK1jEx/E
	 MapIpHyZSiDDw==
Date: Fri, 19 Sep 2025 19:39:43 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
cc: Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: Use an atomic xchg in pudp_huge_get_and_clear()
In-Reply-To: <20250814-dev-alex-thp_pud_xchg-v1-1-b4704dfae206@rivosinc.com>
Message-ID: <c8afb3b4-e5d5-628b-6bce-0b1b3137a667@kernel.org>
References: <20250814-dev-alex-thp_pud_xchg-v1-1-b4704dfae206@rivosinc.com>
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

Hi Alex,

On Thu, 14 Aug 2025, Alexandre Ghiti wrote:

> Make sure we return the right pud value and not a value that could
> have been overwritten in between by a different core.
> 
> Fixes: c3cc2a4a3a23 ("riscv: Add support for PUD THP")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
> Note that this will conflict with
> https://lore.kernel.org/linux-riscv/20250625063753.77511-1-ajd@linux.ibm.com/
> if applied after 6.17.

Two quick questions on this one:

- I see that you're using atomic_long_xchg() here and in some similar 
functions in pgtable.h, rather than xchg().  Was curious about the 
rationale for that?

- x86 avoids the xchg() for !CONFIG_SMP.  Should we do the same?

thanks,

- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
