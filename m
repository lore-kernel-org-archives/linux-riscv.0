Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745A3CD6E7B
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 19:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gp/CK//Jg2Tfg+sVBbzRXKsG/aGzkOMx7OLiPjvVbCY=; b=KLwKqhR8IQE+uz
	W+GJ+vQeV/tiCl/OSZ2FDSVk90LMhCqd6FyHSS6q0E0ZRMTb/WK4RHAwEF4imBVxXTvEyg2aT+NGG
	fXYIdhEjKR1KfQO7MVGZ6uHnk4URCjSRPGDugZNOQtlZuhjq1XYdzxzMfb9aAi6PXFh+I4702RgVZ
	msyKtk4AxAABgTajdPMJRqA2xz9oRDS+bWFA6SJZ8fbtCX/Gv886UCT39m/mNkGdIu2guNc2YTlVU
	FBJM6Q+HXaUnZ//PojqcZENNANVEgrIrS+eHSiWdUM2zCeOIJsBAcanrH6q28IvYWO0HPpD92akBk
	8enHOJQod6r4rlwEGMsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVaeW-000000018aF-3sl5;
	Fri, 05 Jun 2026 19:56:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVaeV-000000018Zr-0fuW
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 19:56:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 98781600AE;
	Fri,  5 Jun 2026 19:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2184C1F00893;
	Fri,  5 Jun 2026 19:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780689382;
	bh=bn6F07Ciq6AxACCcbuYqHAArQPMXV1zSI0N4Am4Hvw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m5ZFf6HLrRq6fzAzyeSMhxuu3mCoVI51YU1oXVurCJwugIMqvKDgol4Ah84qqnd9Z
	 iAs87TTfkGy99/9WyjuyiOVDxOGdBkHPdtStOGsFJUqyR/kISRNUIesWMBON6BLxQb
	 4+gQoRzXZ65sfIxOTMtYqes9bvs3s6AHaB884pOHz8Mhkdy4jGy2P1o2bRdxifVZT2
	 +t+09Lhue4P9dSA4PqLwbZ3b6xZs+JCFJka99oYFOus2sVhCZRLzl5AN/ancjPSSsA
	 S+keJyMIyxLkjONJeOGC8JRP7C19HIxxj0PkuutWNN+WGTJklsVB1BMeUpnUglYpIm
	 WeRouGxTRQCcQ==
Date: Fri, 5 Jun 2026 12:56:20 -0700
From: Drew Fustini <fustini@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
Message-ID: <aiMp5Lcy4Y2m6sJA@x1>
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-4-joel@jms.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260604143957.668047-4-joel@jms.id.au>
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

On Fri, Jun 05, 2026 at 12:09:49AM +0930, Joel Stanley wrote:
> Add Tenstorrent Ascalon microarchitecture and the Tenstorrent Ascalon-XG
> core.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
