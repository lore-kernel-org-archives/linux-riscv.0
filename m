Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8107CD5BB3
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 23:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWc6d+zJe9e7nXWrOhIb4Xc1GO3r0ckHCmtHv8k1Zpk=; b=xN+XGDVXzabe1t
	c2iWPXLlF4kDbJ0Z83W1odm4FfwgiskApCIAefKQp7dV0PNzRoFDkqfkcvFOUiYBRGilxRzMlg7cR
	Xjzf5eoNOfntODCpTGPvZlE6HLi97FbecMYoOb4Jig7YJZHniIewEBD3UIFI6FU71DKdKLwjzi22W
	zDTIwWY87V/uMQwlngx2Q4R5tuatbR8CMycNFxh9ylnpLTYEb0cGjDO26XpXiB7l1EMmDevIH+qKr
	YZ0tpAFUzZRuqdxPYPbrrfeGdHmAEtyFScY7U/0ROYQs+vJwf1o1P9kizlvccki3b2Xh+rbcJhXsN
	hdlweZ6KeNvdZs/b7rHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQZOA-0000000CEaZ-1guS;
	Fri, 22 May 2026 23:34:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQZO9-0000000CEaF-0ArD
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 23:34:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1752E60103;
	Fri, 22 May 2026 23:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490F71F000E9;
	Fri, 22 May 2026 23:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779492883;
	bh=VMvgSHoc+/iyV82IwnOE+0098QoliehZNh09YdCaJU4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=ASjnISBRVdytlkUv22NWGncl9MkZpBeA7xDH28klSOewl+lsx+RT++CwsZncnoymM
	 IA4Vj/EXZLQvJtsdDj14vFpeDFtaF2YF2Nd4KZ8zogn/SaHj9D/e7f5NP63lXk0sph
	 nEWKOqWujq4yTYsE+Xp8ODIp6FzCH/uw2V74Rno+CAQ5RsjcgVZLv8cDIaqBLKP8Lu
	 mixAsR4h+0HQoFImZdYqQMYp8MKQkELXVTx5M+zQLlMv4Q9b0BUsgeM/URJtBNBXad
	 Me+BUj2mTfhQP1au1Ui4czGLmPmKo60pzEBJEgujO2U7WKuwF47+v09NOIIaab8ZyW
	 HXV84bfGblnsQ==
Date: Fri, 22 May 2026 17:34:41 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Austin Kim <austindh.kim@gmail.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: check leaf entry alignment in
 pageattr_pxd_entry()
In-Reply-To: <aeWyuC3nXrP9McNy@adminpc-PowerEdge-R7525>
Message-ID: <1d3c3d6a-dbd2-b56e-5a44-e9aded173d33@kernel.org>
References: <aeWyuC3nXrP9McNy@adminpc-PowerEdge-R7525>
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

Hi Austin,

On Mon, 20 Apr 2026, Austin Kim wrote:

> During page table walking, ensure the range being processed matches
> the expected size of a leaf entry (P4D, PUD, or PMD). While pxd_addr_end() 
> functions handle boundary checks, they do not inherently validate whether 
> the entry is a leaf node of the expected size.
> 
> Add WARN_ON_ONCE() to detect misalignments or partial updates of huge 
> pages. If a mismatch is detected, return -EINVAL to prevent potential
> corruption of page table entries.
> 
> Signed-off-by: Austin Kim <austindh.kim@gmail.com>

Is this in response to a failure mode that you've seen?  Or is it simply 
prophylactic?

Seems like a better place for this might be in common code, so other 
architectures could benefit as well?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
