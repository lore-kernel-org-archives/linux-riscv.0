Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442DACCD184
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 20:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=InN4+ul0Z8lRimANMhdwwBUq/AqUNwTd7hNOaMAV7uk=; b=SaMhYNxFkZq/ZG
	94/sX+vZU/pFZwe3TWx4ugFXsRNXPKQKoAkWefxMJmbSBcV/UTLk5+Z260Ys6A3f7QEWbCcxN2uhd
	uZzYPmaGSkxhawTRyI7DsqNAhzXD0LpM3yX8DLBuV7rZlYqYVpmncn6ATcRDUngHTEOGYMIosMbzr
	ypXomC/Nt7G+FR43FFfo/YNVcaX2hVcrKnyXPCMMI0no5U76L5RL/CHy7BirLLLKfY+JU88ubGWD0
	l73N6fyyeUAv/0YKA5offf67E6WQnuR9AvNPWWoZpka3cJzL2gCMG7q60gQ41yn4O7Kf5HtL8kCZv
	1vLSW5Ya6W1m17Mj2uUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6xgd-000000076fz-2mVm;
	Thu, 09 Oct 2025 20:56:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6xgb-000000076fH-3KQw
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 20:56:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 394EC62409;
	Thu,  9 Oct 2025 20:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85CEC4CEF8;
	Thu,  9 Oct 2025 20:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760043388;
	bh=cBnUBsYPo57fkWDkcBNUjTCl/fKCpH7l/2YNldTFRCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SggzRCqcE8Viy1oBFGH0mgYD2113AnGwJ6vmVXQ3ZpUZqex0nrE3J/Oss91US/1wM
	 9uT4i/BVyo78AYBE25cg/yf6LkO0Nfbs3E6aI1PlI+jOiy9rQCdohNYnc4n3Kwni6v
	 bZ6CVlsBx3NOFi4r2xOoOhcJnKiWsC1cKLO5o2D9rESczOEMJGNVhHqtbHu5AE9yPx
	 FLvprzNbOGCOLKDjOmNYR0mu05Ln53SmDI3ZLdKxbk1ZUji2QJazznY26eEbGe8QGP
	 gXCvwYiZKQehRdtIjAeHhSODFgkM9ZFANMDfB53kvHAOMxcvlRVtBSMF0Hqua2CI1G
	 FLXg5I6pcj8xw==
Date: Thu, 9 Oct 2025 15:56:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Michael Neuling <mikey@neuling.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Andy Gross <agross@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	linux-riscv@lists.infradead.org, Joel Stanley <joel@jms.id.au>,
	Anirudh Srinivasan <asrinivasan@tenstorrent.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2 4/8] dt-bindings: timers: Add Tenstorrent Blackhole
 compatible
Message-ID: <176004338686.3327568.16422814049408420829.robh@kernel.org>
References: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com>
 <20251006-tt-bh-dts-v2-4-ed90dc4b3e22@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251006-tt-bh-dts-v2-4-ed90dc4b3e22@oss.tenstorrent.com>
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


On Mon, 06 Oct 2025 14:21:44 -0700, Drew Fustini wrote:
> From: Drew Fustini <dfustini@oss.tenstorrent.com>
> 
> Document clint compatible for the Tenstorrent Blackhole SoC.
> 
> Signed-off-by: Drew Fustini <dfustini@oss.tenstorrent.com>
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
