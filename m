Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBB9C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 19:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pL2vudLiDn4zVI49tAAmxbnFurSaeoFH+0rC0FvZ3Lc=; b=FpT+yzbym9Yriz6yIEsItAkxPk
	v32fBjKbBq3o1GGcsKdoePXnEel8bbvVHL0kwZdOr0i1RYwnTbo+kp06zgnK3dR6gcMSFE70eHqv+
	vVXYQRz03O5hv5ex5cdlchXnEsHw6HG9dRYBH2rqW9mTDTax1nIPwqswCno8GusTgTyiOUtFkMUmk
	nOgenQ54w3OOZsC0RFmd5A7G2e24anU+/6J6TNXu7YVN1L5s3aJ33ydRG0X6AsCyby0deFy671bLu
	qZiZL2WUgdGpNdR8wTnwgGhMkyE/v6fUQKIP/vj0hwlhJV8iOWDsbjjyeIY7ZP/TNRc0pY5w/iG/t
	3ZqHTK6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6GeF-000K56-8O; Fri, 16 Dec 2022 19:45:35 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6GeD-000K1Q-0D
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 19:45:34 +0000
Received: from [78.40.148.178] (helo=webmail.codethink.co.uk)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1p6Ge1-00BQ4s-8w; Fri, 16 Dec 2022 19:45:21 +0000
MIME-Version: 1.0
Date: Fri, 16 Dec 2022 19:45:21 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Saleem Abdulrasool <abdulras@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: avoid enabling vectorized code generation
In-Reply-To: <20221216185012.2342675-1-abdulras@google.com>
References: <20221216185012.2342675-1-abdulras@google.com>
Message-ID: <39636675da60fc6c54cc8bbab64ddbac@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_114533_072577_494077A3 
X-CRM114-Status: UNSURE (   7.77  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 2022-12-16 18:50, Saleem Abdulrasool wrote:
> The compiler is free to generate vectorized operations for zero'ing
> memory.  The kernel does not use the vector unit on RISCV, similar to
> architectures such as x86 where we use `-mno-mmx` et al to prevent the
> implicit vectorization.  Perform a similar check for
> `-mno-implicit-float` to avoid this on RISC-V targets.

I'm not sure if we should be emitting either of the vector or floating
point instrucitons in the kernel without explicitly marking the section
of code which is using them such as specific accelerator blocks.

-- 
Ben

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
