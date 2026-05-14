Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79E2CD37AC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 20:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cHdDZfFsSZlBg+ImPbrjoAsUAUfAlMxCSpZhBePqbJ8=; b=378hhMuLMYpc6z
	0ICGiovzPjh5b9pity1vzKAc7Lywm/p1HCONUsFTXrzvx7dAvNuTSBKzfB2Cty4lh6/PSXG8iPFEF
	vR8s385NfZC/oESZ065pMCN31JSdQog3kMC5SasaD+ZxZq8qbw8CSV++bajPW/H5C4kJlJw5oH2ZF
	HPjtc9kq6ce5y2+m2QHQTBbpa+6Jxlq6sejZs7ZuqajYqSFr7NRMy/dEBn++1FjMjFWvg7FQqbTey
	Y2dGYfQkT2CVRPrn3MGECQ02TrGmIfwtdNxlUinmN26TDeWVEW+MfhfPSgNptN31NhyCRhIp/2W/N
	gXB++htKZbhpCCPj6eaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNcIb-00000006UId-3TUv;
	Thu, 14 May 2026 20:04:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNcIZ-00000006UI1-33qM
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 20:04:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AA2F60008;
	Thu, 14 May 2026 20:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940CEC2BCB3;
	Thu, 14 May 2026 20:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778789056;
	bh=jCiX2MfpE/070FhnHR8ANAao31mPgWhBDUoM7Dg3lpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u+OWWymmdyGzXYHAKxvkrmIALZxQ/e9Pl5MY5/LF+VeUqkOJuKict/y8oEXoCFBhF
	 Q9nWdrEc37gdP/GByh11FObyF9ZGpe2FRG8g2YEIljFyjGUqqp9J/7DTK9m39tsQqT
	 HK0kvviVhnFgv18Ona0OxPjwj2DdWKH9oBT2p3wLoo4JrWCbTq1ogGOfMuvaBfCAR7
	 eIxNnPbz3K3oR5zb6VeoyZIcFZ50WwEZzLhy6Eo99Ap0yX2kk+5z+/othYf+UaC2UL
	 2vvjOmqaTjWgf/6XCHkd3Z6Y4R/WA21Mb3p3w5GXWvAVwrjgtoj7a2UFvVsCjfmkyE
	 cyXxX+apPOPaA==
From: Conor Dooley <conor@kernel.org>
To: Daire McNamara <daire.mcnamara@microchip.com>,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Felix Gu <ustc.gu@gmail.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: microchip: mpfs-sys-controller: fix resource leak on probe error
Date: Thu, 14 May 2026 21:04:12 +0100
Message-ID: <20260514-shape-perfume-a98d4e53502e@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506-mpfs-v1-1-a690c45178c6@gmail.com>
References: <20260506-mpfs-v1-1-a690c45178c6@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=451; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=4rR3ZXDEdIkQBOIi3nxKAEEO5eG+dMumbCzZllAfcpw=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlsWnsKHrwy+vT0L+O3tdbutqzvvIuPcFzme6mksMKSV /xjxM7AjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzk2yVGhoVtOlZfL50vaqw5 77637OGUbKFvK2bd0N9pvdrTzyl84lRGhsVz3qRtzNeQF9LgUrFomX5P7W1Ac+/eozcSF90UmHx BjRMA
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

On Wed, 06 May 2026 19:29:02 +0800, Felix Gu wrote:
> In mpfs_sys_controller_probe(), when device_get_match_data() returns
> NULL, it returns -EINVAL directly without freeing the mbox channel
> or the allocated sys_controller memory, causing a resource leak.

Applied to riscv-soc-fixes, thanks!

[1/1] soc: microchip: mpfs-sys-controller: fix resource leak on probe error
      https://git.kernel.org/conor/c/75ef23397558

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
