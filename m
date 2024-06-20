Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF33C27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 20:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZtVzRAym8gdrF2nrOehr8KTFlBXsZcNI9MInkzzyZY=; b=hpYL4lYlJi1G8O
	A4GJ9p1+Z6AT+7Ucah7Pe3FEgBbVNKFRF3ChyuqaWkjd7ZWFulJ17LR5ns5nYuwUOpCl7DylKMBke
	GJ1hd0q5d7oKTpRieSVX0iqqymb1rL/vXKmmcKrtutEbyaqHfSWrX/b2RtKKmSiIjFJIx6N9cvI1P
	u7ROWIRKX1WwU6jZndIjzPiyWFpoJHr/i3CHs5hpmWcIAPTZHSwbManZt+poVT6X5cPWuI1kslIQL
	fFMuissdOi25MUqjYJrvkpyTfWSf0FkIyfNfzfqq1QzFO1qTGEi5VxfjUuBhOXrmPqT4jRhO41G46
	lzHgO1UoK+OJKpQLJiJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKOqE-00000006h3D-31F5;
	Thu, 20 Jun 2024 20:57:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKOqB-00000006h0p-25G2
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 20:57:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D49606229A;
	Thu, 20 Jun 2024 20:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27AFC2BD10;
	Thu, 20 Jun 2024 20:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718917024;
	bh=61970RAlg6536yooZm/sut+UKr5m7zVKXgJ3Po2xet8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BIGjPa+gahKHjEVtrjVVPIx16brXZDVHe3bnjxsQghK1aYxo6fHDMlttAu9dD68gg
	 M6fp7pCgSMoWVlwBDM3CfFoYqf6FuOWK3M5hL3fHCznUfCZw/7lwBHiMd/bX4zCa8Y
	 gie2Fvma5OuKm89cgbWqL3lV6pz7q3PCKKIIl3ErfhLVaRwCG1CF0TqoIuBpQUqpRq
	 4DO0qQD/SZpM4TFHOXcCk2Ybc7AGwenIkSkAmv0YWdHYAUp/LQQ3QDi9VkHO38S2gD
	 T0Oy18B+2rKAr/OZ4pS7qkHdY3GcwEgKNyBW2UPpM4wp2P8aTNKz2LMfpzC/6eMzW+
	 tSRcF+ciy6nQg==
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <dfustini@tenstorrent.com>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: thead: update Maintainer
Date: Thu, 20 Jun 2024 21:53:53 +0100
Message-ID: <20240620-lantern-donut-2c125623bec0@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240620162522.386-1-jszhang@kernel.org>
References: <20240620162522.386-1-jszhang@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=493; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=gWK+cfdVE5NjGcH4pttNJSDDLEdRobXFDv/rzY3plrU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGkl0x5EHbi317P7gtDhujWS5VZqkRlh1xh12yxM7radu FXYmbe5o5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABNZ5MXwv+Rvw8z/R9lFQkMc cmP5Oj4U3vwqzevquEJ+QlXRHLFLlYwMG8wuqp9XWVpi4PpIRNbj+Z++pa8XX7KeaW9davDdI1K ZEQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_135707_967360_D9CB8DA4 
X-CRM114-Status: UNSURE (   6.49  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Fri, 21 Jun 2024 00:25:22 +0800, Jisheng Zhang wrote:
> Due to personal reasons, I can't maintain T-Head SoCs any more. At the
> same time, I would nominate Drew Fustini as Maintainer. Drew contributed
> the sdhci support of TH1520 in the past, and is working on the clk
> parts. I believe he will look after T-Head SoCs.

Applied to riscv-dt-fixes, thanks!

[1/1] MAINTAINERS: thead: update Maintainer
      https://git.kernel.org/conor/c/e21de658f8e8

I'll include this in whatever material I send Arnd tomorrow.

As we discussed on IRC Drew, can you send a patch adding whatever tree
you're going to use to the MAINTAINERS entry? You should also mail
Stephen and get it added to linux-next once that is done.

Thanks Jisheng, I hope the new job is going well for you :)

Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
