Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F30CD6E7B
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 19:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGxrh+KpOQK/QQczYboUUT5EQAfDJb4HQJaQELflrt0=; b=WQqAr7kTffPG9k
	H7UY2kEBo85udYcuj4rtL+EVuS5MDxQvc6HrEqMgYxr3KdLfxy7s2yHohFEShcvrtnl3Eav2/rJh4
	qWZUBRS6RyUcD4zYGFyeSSMryUZ+s+UhULGsGNACFbQ9rKeodfo3KgXdNiC1ev7a6GdgFR3haVDjh
	dQ/mtXJFpAveqlqssLQ/vTYKiEIhLFLBcFZtp+orj/dkUNePqK5hqc9IR5gpGn2jDKj6AFLp7X5YU
	l9WL42Yjsmf7vZE3uHeG8ryk6GTli88ssqIqfILPTvBb9F4gYknmvaS3KhCOdUAjN7S+QrXcff/qk
	78leuP95NPqJdm/mxbow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVadh-000000018Up-3KWz;
	Fri, 05 Jun 2026 19:55:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVadg-000000018Ug-1OW1
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 19:55:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FBA8600AE;
	Fri,  5 Jun 2026 19:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E371F00893;
	Fri,  5 Jun 2026 19:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780689331;
	bh=XD4+83bQJPE/ztJNw5wmsthcLYcRrVsiS0E1k3/H1XM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iGMjkSAzuN+dvV2bWIV3rju5KH7NUTZSqmLOyIJcCJXh4oK9qyOMFPySl0AQj5isl
	 0nTEZ2E9jmzQIgeVjex+TKMPwYnRaQa4CcAg8KuJj8iihXN7KM6v6puIqCJ9M+6Gq/
	 goTSeALI3GJ5S0aT8JRKJB9Tbsygk6kUHUcJYI+494K0atAIyq5Bdjvpi3GddX8mKs
	 /bosXzg2DL3OQY3ylslOpJMMQUWI2FplogxuslFrQXjDfhmaoKrDZP0AB4uz1q5LO+
	 vIPKEMzrIPEZ52NoBrFO7VZ/8i78qVam0vyT+LtCKgogkp/yyQswBP3U4gxoRiEIuA
	 xs+cecBrXwzGg==
Date: Fri, 5 Jun 2026 12:55:29 -0700
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
Subject: Re: [PATCH v2 6/7] dt-bindings: riscv: Add Tenstorrent Atlantis
 platform
Message-ID: <aiMpsQDN0IGjjwgj@x1>
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-7-joel@jms.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260604143957.668047-7-joel@jms.id.au>
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

On Fri, Jun 05, 2026 at 12:09:52AM +0930, Joel Stanley wrote:
> Add compatible for the Tenstorrent Atlantis platform.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
