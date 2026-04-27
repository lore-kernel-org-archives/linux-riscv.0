Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADB0FF8860
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sf1I0Si0ztofXZKkazyZa0h9sITl7Ju/MB/WH3URhhc=; b=3cVmd0rbaoZg6G
	EqAAo3pYXzAtQhIEeF2JrFPxqhEbXUwFphK9eTbbJioLr8gy9li/03gD2oaR3J11KzjMyqVw/JGZi
	Sf2dyzxsIcoPJYeDza0sK1muE1xmAlbcjKcPqJC8z7dJP8OXDQ1724C2yPvbdzHh3v6RdjZNj74Al
	7YMmo36ZCI7hNV/H8yJWk8heUKa2gJz+veNotB3pB6uBuA4ZDH/Q1a35mfW8WiAhDb5xwtIu2eTOb
	e2cK1hoESnRrfm1bRzIl5fiJT3csUKlnVaKf+XJ/VdLvgYhbo41Jsv9hkdH9fy43ccXVFcQk9aoWL
	HDQX1VAb05QuGEunflIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKZv-0000000Gpv3-39tb;
	Mon, 27 Apr 2026 11:56:43 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKZt-0000000Gpua-13GL
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 11:56:42 +0000
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8B3902007D2;
	Mon, 27 Apr 2026 13:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1777290996;
	bh=HS/qE5mobVfCUPKiSltjkwD69aPeYCoTkfTUr7sMf6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sxqrjmUPjWrbltZlVk9Ta0RHRrPfv0rqPnWQIE1XQbA4tasjmy6RqcaDeh3vA7NQL
	 fhuZmQqkOofCKrTWwrVZSee/g4rZDR8QKJTT20ADU0znD01MKp0L0KimdeRhWGaaS0
	 TkMF7R4ydUK4eCSwD5z/0aH1gXH90fRsfoRemWxKKuxNM+K0QXiaD05xEm49pyeCDF
	 3YbUDwEaoilYeB2UPgqBD4TksOz+In/MjBWuvIXK2MrRz/bfAnJ7Z3mNQJ7cqpLy9U
	 n4In4sglcuCZ4jh1pOA3xSMMLj7LecjWI0b45UzBitZ8fWBcplZTOEHOsN9gozF9Ub
	 rLo5/ySjDwkTA==
Date: Mon, 27 Apr 2026 13:56:33 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	devicetree@vger.kernel.org, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Michael Ellerman <mpe@oss.tenstorrent.com>
Subject: Re: [RFC PATCH 1/1] dt-bindings: iommu: riscv: Add bindings for
 Tenstorrent RISC-V IOMMU
Message-ID: <hf4ffzfm6xezskq5gakl57pm5bgxuq3hneqfafixvxocojw2u3@qmk7pm7bbtmv>
References: <20260310003850.3837030-1-npiggin@gmail.com>
 <CACPK8Xc=imZXXPp-CYY39=Ww4oVDdXPS5My_R1qODzGhOD2qnw@mail.gmail.com>
 <ac7TByN3oQGSUpyq@x1>
 <5tr5kacx27a4g4udx43vemqvwhr4iaflacdrkz3d5tnd6vcldo@s6l34e2xyg5k>
 <ad6U/PmOawRXCClF@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad6U/PmOawRXCClF@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_045641_551753_FCE09A6B 
X-CRM114-Status: GOOD (  14.74  )
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

On Tue, Apr 14, 2026 at 12:26:52PM -0700, Drew Fustini wrote:
> On Mon, Apr 13, 2026 at 01:37:32PM +0200, Joerg Roedel wrote:
> > On Thu, Apr 02, 2026 at 01:35:19PM -0700, Drew Fustini wrote:
> > > I think it would go through Joerg's iommu tree, but I could if Joerg can
> > > an Ack.
> > 
> > I do not have the original patch in my inbox, but looking at it via lore it
> > lgtm.
> > 
> > Acked-by: Joerg Roedel <joerg.roedel@amd.com>
> 
> Is it okay for me to take it through tenstorrent-dt-for-next or would
> you like to take it through iommu tree?

My Ack means you can take it through your tree :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
