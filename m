Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A336F9D0EC
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 19:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDZnfKKXHOD8AY40NviYS0Jkaexv0q84p5NvGvDoXHU=; b=SdtaPJhJvOp53l
	ZUF6TZYYdCAzfw3wheAkV+ZUh8zg+zz43q05x7LR5EjYo+Yi5gjBJl7REZ3NXcyr9PBkV1NXwWPZY
	qhVsDhph4qpcB8MaEzAIJ6P9suEglm+tlTFF4jwXNIl8gxy/sy2sfd6d5/iusTuQUCWGLpFQpm2+u
	TfA61pf0vWEe3H3bTiuDIzMIoS7wBo5tmOW8TQB22t976eixslhrbjsr891wgduIzkrk/HkO9WpYH
	mzrxQ//TfD+uGysiQT6gL0gDOkRlWJS5r0NNxvi0kyrRns8KYu71MKR0nJcSTb49raUP9MW7SgsyA
	Q7y8xq+9CBgQfGUxo8zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjPU-0000000099C-3e3R;
	Tue, 14 Apr 2026 19:26:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjPT-0000000098h-2tcR
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 19:26:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A72F5600AE;
	Tue, 14 Apr 2026 19:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C459C19425;
	Tue, 14 Apr 2026 19:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776194814;
	bh=xDMl6zz9KmZWieoCxAWoy41U48y6ZdafVRM7bPapbgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BtihFz/gTv/tqpMJtHPEew9hHyB0y3ULsOwB9FT8CtkeOfT6FJtk6JC30gDgNf6TG
	 Lo77dI214fXu5wt4ub2s7eNXU9J3XtmW4QCiUjqUICv/I0huK/cs4kRx2AAmZF+9/+
	 LPqyPwa2PVFQYLdIdWaSwnpzVA0XTykAa1qPk+Hd62AJ+VtfqXYgu37AEE9101DM0S
	 awZtYQS3wmauLSgusCaNi69ZBlpu0Ag6yoLLMp6UgHvDxOvrdp9B8x4Tl49B2fUrM3
	 x0mb50JyV6DJTBfhXcKdq7RRo6GKoYgS2xDykO/mMWW9G1GNp2RQNbgIUTo0x0bcLu
	 xG0Fqxjg2pYvQ==
Date: Tue, 14 Apr 2026 12:26:52 -0700
From: Drew Fustini <fustini@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Cc: Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	devicetree@vger.kernel.org, Tomasz Jeznach <tjeznach@rivosinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@oss.tenstorrent.com>
Subject: Re: [RFC PATCH 1/1] dt-bindings: iommu: riscv: Add bindings for
 Tenstorrent RISC-V IOMMU
Message-ID: <ad6U/PmOawRXCClF@x1>
References: <20260310003850.3837030-1-npiggin@gmail.com>
 <CACPK8Xc=imZXXPp-CYY39=Ww4oVDdXPS5My_R1qODzGhOD2qnw@mail.gmail.com>
 <ac7TByN3oQGSUpyq@x1>
 <5tr5kacx27a4g4udx43vemqvwhr4iaflacdrkz3d5tnd6vcldo@s6l34e2xyg5k>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5tr5kacx27a4g4udx43vemqvwhr4iaflacdrkz3d5tnd6vcldo@s6l34e2xyg5k>
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

On Mon, Apr 13, 2026 at 01:37:32PM +0200, Joerg Roedel wrote:
> On Thu, Apr 02, 2026 at 01:35:19PM -0700, Drew Fustini wrote:
> > I think it would go through Joerg's iommu tree, but I could if Joerg can
> > an Ack.
> 
> I do not have the original patch in my inbox, but looking at it via lore it
> lgtm.
> 
> Acked-by: Joerg Roedel <joerg.roedel@amd.com>

Is it okay for me to take it through tenstorrent-dt-for-next or would
you like to take it through iommu tree?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
