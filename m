Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCE2CD042D
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 02:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSmQNZ+SxURa2TVRHjTPRQF+yL+GGGhFsESBZXWdKGw=; b=FvmAvPXYrF3PjM
	DiU8ZHNQh5dR+6qiPc93y+/iTw4TeqHuBDYi9anf0eaenPicSLmjbeqZwN1VWG237CWUdJ6p0OyWk
	z4PXJYmKykoApbEs+iufTqkv+hco9zWBT5pRPG08mh3MoG9J7SvczNjy71s3l2P2YVP59sonwno6o
	VlONMtlfpkb5Azcv9x8GnsbyLrWoGeLBSnREBvvl/aI8eCL+BSqElyiZBpuROlKypduUcwz6nRgNd
	jh9viKR9qR9NJ1vpWgOzDf18l627TC+cvMd6e0CEjg/daIKyDXIJ+Ra0jtVpUSrgaHssycj1Sis6F
	6JyuAN0jUoWCtvayfbqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcwS3-0000000CKqq-1wpd;
	Tue, 06 Jan 2026 02:05:39 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcwS0-0000000CKmT-0OIi
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 02:05:37 +0000
Date: Tue, 6 Jan 2026 10:03:22 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767665009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y5DxGXKwZLC7iNs7lrVUjR6LdQkjf/YFON8xRxVUjwU=;
	b=nmhZf4oFZ28U5LJ2uGUafdAuXsg+XobdQc/SB1hSDNClzsxJ9xyfJjcynmfOiQjuNvmQ4i
	+hONBNNnduVSQOm+4C6SodY3QQ7gW6lrHCvcV1O3V9dIWdIRGGR8RsvISCClu5EG6iaqli
	9Y4Jc4LIvsmTVrMecdQ3rezW9A/1T4Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ze Huang <huang.ze@linux.dev>
To: Ze Huang <huang.ze@linux.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: Add USB 3.0 support for K1
Message-ID: <aVxtG4eHkseIHov0@monica.localdomain>
References: <20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev>
 <aVLhQQrYQ0T2rBeq@aurel32.net>
 <aVwj6xm28wG7IYtG@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aVwj6xm28wG7IYtG@aurel32.net>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_180536_277852_44E75F63 
X-CRM114-Status: GOOD (  15.34  )
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

On Mon, Jan 05, 2026 at 09:49:47PM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2025-12-29 21:14, Aurelien Jarno wrote:
> > Hi,
> > 
> > On 2025-11-01 17:03, Ze Huang wrote:
> > > This patch series enables the DWC3 USB 3.0 host controller on the
> > > Spacemit K1 SoC, and enables it for the Banana Pi F3 board.
> > > 
> > > To make USB 3.0 work on the K1, we need patches for the USB2 PHY [1],
> > > ComboPHY [2], and DWC3 [3] driver, also, ensure enabling the following
> > 
> > Note that the ComboPHY part got merged in the meantime.
> 
> The USB2 PHY part also got merged, so you might want to send a rebased 
> version against https://github.com/spacemit-com/linux k1/for-next
> 
> Regards
> Aurelien

Hi Aurelien,

Thanks for the heads-up and for testing the series.
I'll rebase the patches on top of the k1/for-next branch and send out a new
version shortly.

Thanks,
Ze Huang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
