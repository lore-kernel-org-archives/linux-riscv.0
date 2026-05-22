Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4A3CD5BB1
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 11:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8O/W9gbFy/C+6j2TN1c2Qv2lN+Fjxj5LG+yiRTjeE4=; b=AA8sAr81kCYpuY
	+dvr3SqyPfxPyvlFCkzgCaHmS61OBDOGn/qN29npxvYIgwThQCCzWpeWVDrlUFrbIePVTR69PW9va
	Y1Fd82KLLnOevn7a5MfQ5KSRriYa5CWpFllgGzcTSBbOt2V8UWHk9C3lkyGFo7i9beMPyVQ65LUSa
	uORjyy6T6L1GZT3gSGTiPhkC4NH4djjkRjziWxAVdL7ox0wH27M2RPu8JFeBARZluDE8As8+mDDUc
	YzQXfUIiW10S/ozz75Bxwxz2n3LRXRVfQMNCtFdlay1AwYKrPNLKVmqbsOCJj5csqGxm/cX8Ymkj4
	8LNCBCFw0mX3yW3JKpPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNxO-0000000AcVA-0cvb;
	Fri, 22 May 2026 11:22:22 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNxL-0000000AcU9-1gLh
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 11:22:21 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 677F192009D; Fri, 22 May 2026 13:22:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 6164292009B;
	Fri, 22 May 2026 12:22:14 +0100 (BST)
Date: Fri, 22 May 2026 12:22:14 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
cc: "pjw@kernel.org" <pjw@kernel.org>, "alex@ghiti.fr" <alex@ghiti.fr>, 
    "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
    Djordje Todorovic <Djordje.Todorovic@htecgroup.com>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
    "palmer@dabbelt.com" <palmer@dabbelt.com>
Subject: Re: [PATCH] riscv: Add ERRATA_MIPS_P8700_WFI to replace WFI with
 mips.pause
In-Reply-To: <12486c59-ecb6-4db6-b636-9859a6c41d66@htecgroup.com>
Message-ID: <alpine.DEB.2.21.2605221220540.1450@angie.orcam.me.uk>
References: <53299395-2e6a-a9d2-106b-8b857f64f7ba@kernel.org> <12486c59-ecb6-4db6-b636-9859a6c41d66@htecgroup.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_042219_602150_0D46C836 
X-CRM114-Status: GOOD (  11.97  )
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

On Wed, 20 May 2026, Aleksa Paunovic wrote:

> >> The MIPS P8700 has bugs with the WFI instruction.
> > Has MIPS published an erratum for this?   If so, could you add a link to
> > it in the patch description?  If not, could you please briefly describe
> > the impact of the bug in the patch description, when WFI is used?
> 
> MIPS has not published an erratum for this. Briefly, a WFI instruction
> after a mispredicted branch can result in erroneous address translation.

 Shouldn't this be recorded next to actual code rather just the commit 
description?

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
