Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01314C55838
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 07:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5fWr8iP+lDNW7esu09C9/84kyjBRj38RkdrVuV9Hgs=; b=oC1j42ZVMr84ai
	WlRXFRjlMjljGHjwjjUKaXlPJxpoN/I2IibnakTBrQQpU5uEYTPFIfCfOz8vcDh5xoo/zbPR/JY0L
	2SE6n5RUiujP+DiLZBcZdGpZo3PpEy8j5eI76WnWWhd4v092rRbSJaiEdPleNGD6o8VvttSmGeLK3
	M1I30Q6CbgojgsQeUi2h4HdPCxxUQpVzEhj2D0I7Zzu9A8UP+oOUqUP7m5Kjr9dDzJW0axO36lvvW
	pmCtq9JUy07x3P4cnSTC3KBkxyo2Fh/+LJ9vaCvQ6rneSAviu7qx+5z/fAEzGbexAs03iEPkv5Y6U
	mrcEq6KK9rVjfaxoKAww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsAG-000000056kp-1sYu;
	Thu, 06 Aug 2026 07:05:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsAF-000000056kh-2tJv
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 07:05:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 587DC40141;
	Thu,  6 Aug 2026 07:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB13E1F000E9;
	Thu,  6 Aug 2026 07:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785999915;
	bh=StZpRC4UdL40+r01FvxYkBdHfrGKIGU+ZlSJfqgqV44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XQ0SIge7vmOKhfMTQ96S4l4/xyFk1qsdoMOXSAYiBjGbADyJjhz/K/ZPF3JJYVKQy
	 6q0ZEcavV2qg1wQMF5DSYV4wjqg2wPPk+CuSRy5bC3ySdrY5XYxLddtw7vvDtjU4ht
	 7d5VXADLioMlWkrxw+clOsGJvZz0RNxBI7Ls/fGhluA/QGvu5Y1wWKyuZS8EYhM4IM
	 8TVno8yEs0qaGhPEODm/ycDVEKbV0v5ciaD05FQyveIoZhLjYRvErgW2WOUk3RPxBC
	 a+Brh2v6FFzMG8Lp9v1zpJAs6MofEhon1+tuxI4gjtBcOcHdi+mHbIrxpo1t4RFb3S
	 y5OJOEQFFh7+A==
Date: Thu, 6 Aug 2026 09:05:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Jennifer Berringer <jberring@redhat.com>, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] scsi: ufs: spacemit: dt-bindings: Add UFS
 controller for K3 SoC
Message-ID: <20260806-prudent-vole-from-valhalla-3eae39@quoll>
References: <20260806-08-k3-ufs-support-v3-0-037fb322acdb@kernel.org>
 <20260806-08-k3-ufs-support-v3-1-037fb322acdb@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260806-08-k3-ufs-support-v3-1-037fb322acdb@kernel.org>
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

On Thu, Aug 06, 2026 at 02:56:18AM +0000, Yixun Lan wrote:
> Document the compatible for UFS (Universal Flash Storage) Host Controller
> which found in SpacemiT K3 SoC chip. Its features are listed below:
> 
> - Compliant with MIPI UniPro v1.61 specification.
> - Compliant with M-PHY v3.0 specification.
> - Compliant with UFS HCI v2.1 specification.
> - Supports up to 2 Tx and 2 Rx lanes, up to HS-GEAR3 5.8 Gbps per lane.
> - Supports standard low-power hibernate to reduce power consumption.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---

You keep having the same failure for every version, no? Never responded to it...

I'll drop from Patchwork.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
