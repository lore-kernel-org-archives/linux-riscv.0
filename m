Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA53C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 19:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mrb4VbDjXeVSMk/82t65CCV0ghOYL7YJAVGwlZrrFHo=; b=NhCW3kBcntcw8W
	z6N9D0GmFGluVBtApwmauz79viFmvT6WyK1LimvV1FMErqLnZSKUy7DFI6ovgWZXrxRWCuGi9wjxc
	QTDxLZqPKqhGemv7xQhzFAvDieO5SjsGBjiPLa3tRNrF/T4+y5ae7EyDKdsog2tpA3KwAhH4dnLkk
	AP2S7H6inYaezk5ZgrbFAGDTEY37IIOXePZNR0T6lIM+aGjbF3WamUwitwUmlJWKfmtETmCF/kGl+
	sQr4e62pVxuttr9o2J/HjW5CH37eNXNkt01Djuq+qYmFWcoUJU0x7xGZMw4Skv1KPao9KNhv1nBea
	kuaM5Kl9M665uIcwkBIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r83ee-0069Ip-1m;
	Tue, 28 Nov 2023 19:21:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r83eb-0069I3-1D
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 19:21:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 77616CE0FB9;
	Tue, 28 Nov 2023 19:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC03C433C7;
	Tue, 28 Nov 2023 19:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701199309;
	bh=8htSTgHJFHOtKB9pxw5uowuakEUSv1IwnvcjP3ifGKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OpkOieHlB8xbewmhWyPCtoFHzKuqW1Z9eevrRCNwsIhVdeI7vxe4Uq53LQmhNqrhg
	 UdcYfFCNXq/ryRaie1RLR3iqwKvvlIWo/zdGy71i30oTgoMPnAzkiAW0D2+rHjP0dE
	 xZ1q668XuZmNW0kEG6rzSgWQm0Rrr2Ai8RIpJpQg=
Date: Tue, 28 Nov 2023 19:21:47 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] tty/serial: Add RISC-V SBI debug console based
 earlycon
Message-ID: <2023112839-antitrust-coherence-98d8@gregkh>
References: <20231124070905.1043092-1-apatel@ventanamicro.com>
 <20231124070905.1043092-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231124070905.1043092-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_112153_670646_91F697FE 
X-CRM114-Status: UNSURE (   8.47  )
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

On Fri, Nov 24, 2023 at 12:39:03PM +0530, Anup Patel wrote:
> We extend the existing RISC-V SBI earlycon support to use the new
> RISC-V SBI debug console extension.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  drivers/tty/serial/Kconfig              |  2 +-
>  drivers/tty/serial/earlycon-riscv-sbi.c | 27 ++++++++++++++++++++++---
>  2 files changed, 25 insertions(+), 4 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
