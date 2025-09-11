Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EDBCAC58E
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 18:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUH3OV/q+U/6h1u5rN/T82vMOzhyBf8IeAtvpxgffJo=; b=0SqrQ2ZgiMr8MN
	7da8EFLu+U1w8ZBLPdmSdVi+VRiAmiSgAa0mbENR3+4BHqm2loZ4z6kwY/HZ8BEsmAH90/4H+OOYo
	qvlJc7J1OdpRbEANKKefaJE9HUJ1a9ZuNySIMODU8pSSKXw0BGxII3sgPCXeN8mqPagmqyY7xktzC
	8UcfVYXM1UTquCo4LQSkpXd0acyHnrEA4uYvtLm71vpq/stfY2M/1G0Dota7+9UVZvWW0QT7phkkn
	yc9tV8a3N0P9Akf8ZIh/eJNUn8tKLSgK8tO6EqHZNM/5RyrJ6NS5zFVtOEmLDkO1VeeANMvs6VhxG
	ivKBjRm5YTNocOx4x4Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlxz-00000004iZL-1Iov;
	Thu, 11 Sep 2025 18:24:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlxx-00000004iYK-3OJV
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 18:24:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D5F806022C;
	Thu, 11 Sep 2025 18:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93FBC4CEF0;
	Thu, 11 Sep 2025 18:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757615056;
	bh=KGKsZ6Jdy+3V7bqBCI1fO91V9AiE67DdDKtogHTKR10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dMD01O5643228nVTISLl6oNk0ig/HqJ9ueeGKeMHtjtToRo1d8/+4ioBx35VX0CSM
	 Vi4BgSkQ/VLfruag81haTEQIiJARsq5UAVANd7+YBz86QDcOc0fidiyuWMzCdumkHL
	 WPyHJA6/WM0mzJJQKM5VSKhEd8Fco39Vo6sgdk8OdfWTyziUexxapRFeW+gFwAPjju
	 sn+GAGdveKWfEKTtFoCMjmgRaHo9LczpsyUnbS7TJzou/JZ+RiFozywAfXBk4TZyCt
	 Ug5Dv/erhfFcNi897erR6IF9V4nDPzk7p+ptUFm0hzDfxuxhxhCQ1/fhVcpjXM2FZO
	 X/cpKAwdOkQBQ==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linmin@eswincomputing.com,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cache: sifive_ccache: Optimize cache flushes
Date: Thu, 11 Sep 2025 19:24:06 +0100
Message-ID: <20250911-moonscape-bulk-cd1312329fa1@spud>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250909224131.276800-1-samuel.holland@sifive.com>
References: <20250909224131.276800-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=448; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=A9m2rI5/mArBo7YmC6ZAr5oLZmcnI7j3BQisSPiKdxE=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBmHhY8bXAg18jw3qTzx6M1uNaP9WmyiKzaYKb47tm3Sp Qm7VUMMOkpZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRvLeMDO89Vf9GqjDOfbj5 68sm2x+73C+W5RRvDL7mYcSxo74trIaR4dq8GRk7JC+0Tjpyawm3gMGW4Beis5foPpj1cmNYEXN 3Mx8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

On Tue, 09 Sep 2025 15:41:27 -0700, Samuel Holland wrote:
> Fence instructions are required only at the beginning and the end of
> a flush operation, not separately for each cache line being flushed.
> Speed up cache flushes by about 15% by removing the extra fences.
> 
> 

Applied to riscv-cache-for-next, thanks!

[1/1] cache: sifive_ccache: Optimize cache flushes
      https://git.kernel.org/conor/c/941327ca5ddd

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
