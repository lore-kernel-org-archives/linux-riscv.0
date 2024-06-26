Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598A0C30653
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ySGw0toqN0WhLVbEB0BQ44xwhbP7xV2e56C+JYt3R+A=; b=3f8GisO/cKVcGU
	4CKUxCpnxRwpx8TSg6CctIELHAHDo/19sL6MsrvlcPu7AKkWDNFk8tYbXqsOwPr/upvVpEJmQ4mlv
	GNA5Wh8JseEnYM4BtJeHJ6e9bppEYkcaWEkLv/stILpyerJlrn3Bcs17SUTvzX7v1bnrOBsT6Smnw
	eoRoIRAUiWmcH60tqwKkyVb65dCEJXQShPiXtA/m62njmoXbYNHHXbStf4w4FXPFjASaDSVnmVyau
	PhL3I7khDr4VxH/Of7HgyRrLa024e1qHQhx0KoiX65QeFKbIDzvIF5p4h15Lr7ErtkGn+X2zmDSZq
	NfmAyodAMuGv8qyYMvcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSfd-00000006xN4-16hQ;
	Wed, 26 Jun 2024 13:26:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSfa-00000006xMJ-1HF5
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 13:26:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A061ECE21BC;
	Wed, 26 Jun 2024 13:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CEF2C2BD10;
	Wed, 26 Jun 2024 13:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719408399;
	bh=EKEukY2Atk2e+DpV4wGfieBESQlkebWAUM/m4x4vr1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AwNOYK2vPy5I+hqLF4ZE535mms2YuZ2Qa9GYhitSARJ6bRBkLJO+pFN76bUOWcXZL
	 rQwTpClSKJZdJjylUZwh5JfhgIPwsetcAxo/CCvGv8eUX4NLD9wkeUT2Ocwqx5flgu
	 TH4WcdTeg1b9t0AW93B0qs40o3SBIGxV4FQg0b6SyO5VH9SoVk2yZZ6ObBE7h+ryjf
	 UyxMpxQ7gkFyy+XOUR0BAz7HS1y3bOY/75S1Ji54ZLvr6uu6Wp0UYkO9fnjL1Bf4ZR
	 MS/OobgU7/1MUC40mp5T4iht5IDJaaMNAVrCZLzO3GQUyF3V5Orsbfllh7XbbM7ZGQ
	 BDT6a6HyfWIQA==
Date: Wed, 26 Jun 2024 21:12:34 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andreas Schwab <schwab@suse.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] riscv: uaccess: use input constraints for ptr of
 __put_user
Message-ID: <ZnwTwnSsnZ8Td9GZ@xhacker>
References: <20240625040500.1788-1-jszhang@kernel.org>
 <20240625040500.1788-3-jszhang@kernel.org>
 <mvmikxvonjh.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvmikxvonjh.fsf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_062642_544956_672CA65E 
X-CRM114-Status: GOOD (  11.95  )
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

On Wed, Jun 26, 2024 at 03:12:50PM +0200, Andreas Schwab wrote:
> On Jun 25 2024, Jisheng Zhang wrote:
> 
> > I believe the output constraints "=m" is not necessary, because
> > the instruction itself is "write", we don't need the compiler
> > to "write" for us.
> 
> No, this is backwards.  Being an output operand means that the *asm* is
> writing to it, and the compiler can read the value from there afterwards
> (and the previous value is dead before the asm).

Hi Andreas,

I compared tens of __put_user() caller's generated code between orig
version and patched version, they are the same. Sure maybe this is
not enough. 

But your explanation can be applied to x86 and arm64 __put_user()
implementations, asm is also writing, then why there's no output
constraints there?(see the other two emails)? Could you please help
me to understand the tricky points?

Thanks in advance

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
