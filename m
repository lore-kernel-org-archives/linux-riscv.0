Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E71CC71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 10:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbkGD/9RAPtsyzdEPpV3ldg9EOx7R3blFJmSlY6v3Yk=; b=fy7b3G/GaOfUSx
	lpIwThhL1nWHI852e5Fd2JdTd/50wj5lYLEeZibUVb8e0Zv8+v4tuYimHI0eIW92vtVLPs13QJzmf
	+vNMvSirvfXTnojrI16DEIFVqSAGnH5TNZihA2TaOMmodwQFyMDscwfmopFX0gj1CUHuiEdIMo4fT
	T+Ad6R9aw/UStWLs5iM0uydBryKNfsxW3OzA5WTn0/a0bk0sVRhUEMv8eCY0Ftgy49lZ2MHMgx2m+
	0MoXRpIociWgL1VW87/hYttZHvI4u4kSdOYDRbsTEwQ+KCyRHWSGCMnsEBOj0yXiRD2nr26Hl/hIM
	4nkBslH2Uv4cMvEzp/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPfK0-0000000D0xH-2ctq;
	Thu, 12 Jun 2025 10:38:12 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPeIS-0000000Cp20-4C41
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 09:32:34 +0000
Received: from localhost (unknown [116.232.147.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 9C6FF341E6A;
	Thu, 12 Jun 2025 09:32:31 +0000 (UTC)
Date: Thu, 12 Jun 2025 09:32:27 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guodong Xu <guodong@riscstar.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: defconfig: run savedefconfig to reorder it
Message-ID: <20250612093227-GYA130879@gentoo>
References: <20250611-01-riscv-defconfig-v1-1-b48fc3517498@gentoo.org>
 <92faa45d-0f3a-4bb6-afae-180c2b28fb65@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <92faa45d-0f3a-4bb6-afae-180c2b28fb65@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_023233_058172_6ED1DE59 
X-CRM114-Status: GOOD (  17.82  )
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

Hi Alexandre,

On 10:37 Thu 12 Jun     , Alexandre Ghiti wrote:
> Hi Yixun,
> 
> On 6/11/25 16:56, Yixun Lan wrote:
> > Changes to defconfig should be always updated via 'make
> > savedefconfig', run this command to make it aligned again.
> >
> > This will ease the effort of reviewing changes of defconfig
> > in the future.
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > Update PDMA config bring in unnecessary changes[1], let's fix
> > it by run savedefconfig first.
> 
> 
> It would be easier if this patch was part of the PDMA series since the 
> last patch will depend on it: @Guodong can you integrate this patch to 
> your next revision of your patchset?
> 
I'd rather make this patch independent, as nothing strongly ralated with PDMA,
and it probably would take several rounds for PDMA patch to be settled down..

Besides, there is no problem for PDMA patch to depend on this patch if
needed (easy to use b4 to handle this..)

The idea here is to get this patch merged as early as possible, as it's
quite straightforward, and other people may have similar problem instead
of PDMA here

> Thanks,
> 
> Alex
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
