Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EA4D715EF
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jan 2026 17:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9TBx7MAsPp10BcZp1ZFKW4+6/sPmzqiuLycj+WUZJ8=; b=AuQbaChVyOJDPe
	dhxhnrgqon7l8i9zO+IR4dsLslyOj1a3hXlHAvoO+WQ3Ipkw7pAkbuNbUuclD0OpdtCRVKLZZ0oxa
	5VfykrDF/mJ+NDdyA1DhFt5LS91gNqACBCHPEOp+4UlO/jMVwH19+5spXBRSzgJsBNjsI+VbeiuXk
	jxpUYvmD3EqhEUCKGDGA9b4w7UTkVwWSOJZpEH4sJMj622N7mYxykxv4kGTBrR7iCuC81BBul4oBL
	YdoxrkHgtScPDFROYAXMq5oG/8zDHKqFOiVm9TS/0qmfSJ9qEMmD2NSGBaDNTRQ6BVv3SXCK0HQDY
	Wktp0wGzvm7XUALyl7vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjhYW-0000000APf3-2IlE;
	Sat, 24 Jan 2026 17:36:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjhYT-0000000APei-49Kw
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jan 2026 17:36:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A4D1435CF;
	Sat, 24 Jan 2026 17:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B12DC116D0;
	Sat, 24 Jan 2026 17:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769276169;
	bh=o5yjgO4zWgp3a2Tq1EIDiWeiDjKLYiy1AQcpHao5Pw4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JiCRFFMS3cXmXkLl1+eFI/KX4pzapQG0Wgu4OFpFf2+1EAx0Aq9Clk83+L6j76K5Y
	 wKg1ovP8I/8fKGq432w1ckjIj2g1mKoWUCGV4wicZjb6ld+aDXVeLg7+KtUoDqebCB
	 NWjimzZ2Cg29eSaMQhZhL5OwH1cceR8Zh9LXQ4IbAw+OwwZKBQjMnEPp15FqfeioEz
	 vZexLqHlRFMcEp/u7Za/ByNLqrLqJ4hj/+iicPRfz3I8GHnLdPJUuiebOCo/Gq4jFm
	 BlIS64kDq8YOaY60aZ1Gachst3GUh+B7UqoUZRzaur8hTqjfz0xX6QC5CJTvZhpaUm
	 6bIqEjk+l5osQ==
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: defconfig: spacemit: k3: enable clock support
Date: Sat, 24 Jan 2026 17:35:56 +0000
Message-ID: <20260124-doorbell-configure-1cabad91b176@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260124-06-k3-clk-defconfig-v1-1-802674ef2762@kernel.org>
References: <20260124-06-k3-clk-defconfig-v1-1-802674ef2762@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=404; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=RC1Lsv/701n1KFS/c9HlBZQi7uS9JT7LR+huqDel6F0=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJmlTH+8pra1PfT/wll3+9dcD937ce0589+vnHV/4ZfSe ddvxxae6ihlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEdtcwMlwQWRnx7YpLrLaf qljOnFWRN9wYDjU6+c4yuvc2XuZctRgjw7o/NSkmS9qPPL0v4D/915X5Rt2Jnl9nGu3YdcXhrVX VCxYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_093614_049422_E804A1DD 
X-CRM114-Status: UNSURE (   6.95  )
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

On Sat, 24 Jan 2026 06:31:28 +0800, Yixun Lan wrote:
> Enable the clock driver support for SpacemiT K3 SoC, configure it as
> built-in by default, but users should be able to change it as kernel
> module if needed.
> 
> 

Applied to riscv-config-for-next, thanks!

[1/1] riscv: defconfig: spacemit: k3: enable clock support
      https://git.kernel.org/conor/c/28edadaa03df

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
