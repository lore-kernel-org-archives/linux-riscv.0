Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F18E92710
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Dec 2025 19:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qAM1V583NhJ7zR+B2+DJuM+G9YzmCzvCmwZTsDcR5+A=; b=SFQjuoHefBJrX8
	DGsEIW5DvH/n7VryPskKDlOm5XTRFTCHBdHUY0BHCG8eUVrq1DNIUXKHfDIkK8aj7Koec6ASrtIqw
	dGu2B8EWnpt+6Lch5taSyZzpo91+92Fm1DZKytL5KJ4btbJ2CevbaYFgHejGzhq1F5MrQxW3TM3EB
	KknopisXrKPm1Ue1JjScNU+p2aae42y7GCEh+iAyvOmLoe2XGw53uZJujZdgQlADAVUQ/J6556eGz
	lVwgkVQEWqPJcmGtJFQMW9hWiMJory8aHyItCLmj1Soj1n3klHokHaknQDZcFqsoHxmmKjXmtWiIh
	CuES9jzpx8rGgCmYkE2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZaEb-00000002Amf-0iDu;
	Sat, 27 Dec 2025 19:45:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZaEY-00000002AmK-2UpM
	for linux-riscv@lists.infradead.org;
	Sat, 27 Dec 2025 19:45:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB4AC4421D;
	Sat, 27 Dec 2025 19:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7127AC4CEF1;
	Sat, 27 Dec 2025 19:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766864749;
	bh=Ea8lehg7pSCOva7aGzicefxhTV6jmeEkIieXlVI6U8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hNzJQ0QaaMrVwKbWnvxmwy4KFqO3D+o6/SqnTHQ/EQz2jqXZmuAlBkAcUhhMVvykI
	 mnfVlMYtx/kSgAqTGXoLPn7NvRfjejitJK2KZg1Cx4W7DdWzUE1jA6k8uuAKmbtPgp
	 G2gybjJqw6qp2hFsJV3CErUzALK/y6zfCn3MbE0K0Z1TLaRPYDZ8Kx7tvz2MesBtoc
	 BpOOnsFlfyuzegQBxKmz/n5atxzljqbe0VRxwYhAVWIZSuXPU+e3k7ti3OSq0KKLIY
	 XesljHbPoWoySGv1XMtWBmv29Iy9CXJe8R+i3AXwQ72UEmOmBdg/ByMkNIcAhHquRu
	 AkIR+hBiLOlMQ==
Date: Sat, 27 Dec 2025 20:45:31 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 1/2] i2c: spacemit: replace i2c_xfer_msg()
Message-ID: <fnyar6fvzqr3dw33wv6abg3plmj5p2tr75a45zmyrb765fmrm2@gkw7mupx4wdw>
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <20251226-k1-i2c-atomic-v5-1-023c798c5523@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251226-k1-i2c-atomic-v5-1-023c798c5523@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_114550_764945_E54230C4 
X-CRM114-Status: UNSURE (   8.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Troy,

On Fri, Dec 26, 2025 at 11:31:10AM +0800, Troy Mitchell wrote:
> The upcoming PIO support requires a wait_pio_xfer() helper, which is
> invoked from xfer_msg().
> 
> Since wait_pio_xfer() depends on err_check(), move the definition of
> xfer_msg() after err_check() to avoid a forward declaration of
> err_check().

on the subject, this is clearly an i2c_xfer_msg move, not a
replace, right?

(if no v6 is coming, there is no need to resend for this, it can
be fixed before merging).

Andi

> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
