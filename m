Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24473CD6E75
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 20:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k2vN4QR6BI0TZ7Sr3xAA+WiF76lIMPxUhXBMyi0/VN0=; b=AyvKV3V36Ytnxw
	hiSqVpPn+VTSOuT9nCjwttmJE6nw3jCjQBMP2Rsyq8LB/ks6x8zApiPwi94tQlWrpRh5SCJwjGYHC
	/EmjHOkiiyLqeO7QSoybYB95eZJSa8Ic/pqGH1y6zbyqgYwn2d9Z9a66ynqq4xSDptSfHYoUc+jtN
	HzwdzxMou9o7f6QFrzYhJ3qn2cPXC8XD9VjBFgviNXJyVl7qkriC9GknNEDLSK3Uhfh0vD7I1Knnp
	2C7gq4Vg0nqmp247AsRHh5IoPiwYMcYBaIwj+7SVaF2wj1Mi+VN4Vb8WB+2vokPD0WVdur2nApFua
	6H1XpQxZYR8AGKCXvhJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVF73-0000000HIcW-1fMf;
	Thu, 04 Jun 2026 20:56:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVF72-0000000HIcG-09Ox
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 20:56:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BDA9D60210;
	Thu,  4 Jun 2026 20:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066B51F00893;
	Thu,  4 Jun 2026 20:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780606582;
	bh=oAnaD7K58dOSyRTyPYJ08Op1MjTztNi7Y/JPqq7+G6Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Qa8Aq21eT7QiNL4ptW10cV3PerpHQ70C5zBuUkQRw8cLWK1IlRCQEdJB4VDlvLQRg
	 9GLD/tW9TPQZnz6fuMKpKhgxLpQSMEseqgGqDWBLAGUvuq2YfElRlSbCW2VaJG1Bgq
	 eSILeV5V4y1/I5PAtviFXCKFDLLTTEM8weZdxiQxmAgCg3r8eK42UQm5KoxJZDBGRk
	 lt6oZNyWsE/rtfa371yu7KO95UTg6EtDpBq79Bdt1WA07shiks1TwQejE5P+Nrca6b
	 9a7WcqwNPWIHVqHgAsa6oVgl8SVG4wyF7nMAkfFWjWFzk9vTSJ+/xAXdTFU2bZxSUK
	 SlhmdK6PH2HEg==
Date: Thu, 4 Jun 2026 14:56:21 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: defconfig: Enable Eswin SoCs
In-Reply-To: <20260603-eswin_defconfig-v1-1-8471691d3153@oss.tenstorrent.com>
Message-ID: <99cbc9ab-41ae-3b82-779e-bced60181ac5@kernel.org>
References: <20260603-eswin_defconfig-v1-1-8471691d3153@oss.tenstorrent.com>
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

On Wed, 3 Jun 2026, Anirudh Srinivasan wrote:

> Enable support for Eswin SoCs in the default configuration, so that
> defconfig kernel/DTs are bootable on Hifive Premier P550 Board.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

Thanks, queued for v7.2.

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
