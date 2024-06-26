Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F2EC27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 14:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JLja3cBBvw7Te+Z71oSjNWL7qh3BlVUDG+TblC8t62g=; b=4ZVpYLisLkgfeP
	fcCQv55/AHtyTAtao01VWfg2nxEGdOZh+lxBHhuzpAJGQiaTZujOPBDpUcAndX6uECC8Vz3BYKwWo
	lteIAQ48DeEjTocCtjwCdhr6iev42AUQvvNOWEQVsq52IypGikn5pjv+aEXrFCy4gXWXN2HuclkRW
	nQBbrD1mjENXXFz3Owcu0A2aqvEEWqGFQ1PKwbLU4W3ZqUpTNVcgAZyz3/D65SSSdYTYmhJ7jb113
	WtiFyXR0GPIOpYsNaoBYfqinQ8fbPdW6Nmu28P0ckl6G/i0fBh3CNIoNyZX+pYuF0sc6Z1idOUREa
	wMA/pHIpVw2F+96j3xRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMTJp-000000076kt-2zXK;
	Wed, 26 Jun 2024 14:08:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMTJm-000000076je-3ape
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 14:08:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4715619B6;
	Wed, 26 Jun 2024 14:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39E0C116B1;
	Wed, 26 Jun 2024 14:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719410893;
	bh=b+jYDaoyUxMFh/qdWC8py4dZMe3nHVTyCOcKzwiM5zE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SjpLzzPcxejybWPIyzdt1epNmYo6f3DQFwL3z6EC2ZvHYxUY06/SsKyFa2nawyLAp
	 lPrsi58YHewjPtsii1bHg8lSDXkljI28P6Q7ndXssMyVdHX7Nv+L6Mi+dttZvS8Z15
	 zBLx7jbVyRkGpWzbuZZgFq7BC0nWlII9vE5GK/2d1WiBUHxxP+5RWh/uxerKsb0Gtb
	 pYE82HjmAH4rfpt+NolTJG5yUuXv6PPJs1pVAi0lDZFeU8wZ2GjSFasWzP2PoPQAuQ
	 nbqUEMa//lNxCmhzwdgRXOl8qegPTR4PVRz8pZnO+3w+bhfUgCpF6++GyfCcoqbBbI
	 1n/MAnPUKCfDw==
Date: Wed, 26 Jun 2024 21:54:07 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andreas Schwab <schwab@suse.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] riscv: uaccess: use input constraints for ptr of
 __put_user
Message-ID: <Znwdf2c1pYetrsHe@xhacker>
References: <20240625040500.1788-1-jszhang@kernel.org>
 <20240625040500.1788-3-jszhang@kernel.org>
 <acd2e53f-b5c1-49c5-86e2-bc09eb917163@app.fastmail.com>
 <ZnwKXWzRz9B5FbLM@xhacker>
 <ZnwObmA70Bfx9yCn@xhacker>
 <mvma5j7omh1.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvma5j7omh1.fsf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_070814_989383_08F99A8D 
X-CRM114-Status: GOOD (  11.13  )
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

On Wed, Jun 26, 2024 at 03:35:54PM +0200, Andreas Schwab wrote:
> On Jun 26 2024, Jisheng Zhang wrote:
> 
> > no output constraints either. It just uses "r" input constraints to tell
> > gcc to read the store address into one proper GP reg.
> 
> Again, this is backwards.  Being an input operand means the asm is using
> this operand as an input to the instructions.  The compiler needs to
> arrange to put the value in the allocated operand location according to
> the constraint.

Hi Andreas,

Your information is clearly received. What confused me is:

why x86 and arm64 don't put the "addr" of __put_user into output
constraints? Especially the following comments, why this is "read"
from memory?

 * Tell gcc we read from memory instead of writing: this is because
 * we do not write to any memory gcc knows about, so there are no
 * aliasing issues.

can you please kindly help me understand the tricky points here?

thanks
> 
> -- 
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
