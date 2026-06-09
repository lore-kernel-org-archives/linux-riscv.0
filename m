Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0828CD8CA8
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 11:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CfAEFanSse7yDxDW+dcdPPHG7LTJd6Aln/oByGRfFpc=; b=zhSx9mjiZHAJse
	r5Rh8QytmkSLtskaTzETVirk1QNB2Km2AT1KYkUc1cm9oK8VsJLgszsLjVY9LX6v4T4VzA2VYo4BF
	+ZMgQyUqzUMsgJvs0CDllyYDDauqdpqWSXzdkFdyJH4RCkBuNZOmGlIhbLAtECigd+JK5DmtM2qeX
	EBpRmcc14yxO3++x0wYoMr5HCvkhL4TTVZ/NKQqmJsJ+8NqFf9tLxYIbxNe2osTjRq2nPla6sqIZj
	xhTAvs/qWw8fIzndAtGVrFhrTm6yOPrZy5tUaOq0X6lVQkZaCjX5uO4V427TBn4xk8HLCIDizvTWk
	fe+GQqRIEbVdMh11lMLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWv2h-00000005TcG-0voX;
	Tue, 09 Jun 2026 11:54:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWv2f-00000005Tbt-3WPS
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 11:54:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 47C00601D6;
	Tue,  9 Jun 2026 11:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EE71F00893;
	Tue,  9 Jun 2026 11:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781006089;
	bh=PMbkNq4forlPN2WLVH3jEvvF5QOaHxUbNdvdwiYst6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cD3eMsp/H1Yx6/Ub6PFAjd1MNIhYbfVILicMCU9oOLoU0tRjVQ6M5gMeZZFkLbXl9
	 JeDEsTygss44gc6ySTDoZqXPr1ZsKC51zpg1SsLlHzUkLDUj2rJv0vNAIPLKLCp+pt
	 1XAzlI4uyke/9xXF50qvJxA6rqS6PR5RKlJ6oCJmJPSA9O/3XE4gX7Ve0bCJRDkiK/
	 BTw1kq5Q/xpv/G3U+GHzULq9+2TMjQgrwc54ECo87lubtr8uPOuaNEBdxm8xIGEoAU
	 MGZo76wQv6whgbmm/sWtK3zgIwzfi7vQtWaA2uKn74Zfrqef/G0FXBLuCxcRzvgK8q
	 r5Al2hAZFuPSQ==
Date: Tue, 9 Jun 2026 13:54:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: soc@kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, MoeLeak <i@leak.moe>, 
	Thomas Gerner <thomas.gerner@muenchen-mail.de>
Subject: Re: [GIT PULL] RISC-V T-HEAD devicetree changes for v7.2
Message-ID: <20260609-shaggy-careful-rabbit-e0fc2a@quoll>
References: <ah4lkWh2eD6l7W7n@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ah4lkWh2eD6l7W7n@x1>
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

On Mon, Jun 01, 2026 at 05:36:33PM -0700, Drew Fustini wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v7.2
> 
> for you to fetch changes up to 3a5791956edbfa84d7256224167941931cbc46e7:
> 
>   riscv: dts: thead: Enable wifi on the BeagleV-Ahead (2026-05-25 01:36:56 -0700)
> 

Thanks, applied

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
