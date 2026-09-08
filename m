Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F32C79FA1
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 21:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMTZITpGtdP+za+ejo6CELh2lKxPcpeh+sECE8ehjm4=; b=PEvWtfCbdEfWsG
	N+SGliJCqZYQAC5y+HbbZ1LLrHr38oNf4HvQ3yUzidCXC5c4QCwNFS/BYdKILELyZ7Yrq0eJbdOrB
	qt5B8L4EC3PjX5o4npnaRinQXuI/0hNMYIvdULjtVErAmCXedFVJ2Yuds8Nh71G4aEHO0kBGGDRCs
	Z9r6ENh1OLG99vLMD1DD+XVXiSvhTbsqnmYxCwZJr6j++bzvdeHXBlXkjM0bsTMQ7E6SOpQ+qSs0O
	BShsDJ5bDVdVh4keNfPGKMEamsZNHYvEffKClNIFHz46rM6qpMUu2j3M+mKGVVZf1E02+dJahs5j3
	z1RQ30vw3rkwX78xoZFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43M7-0000000AJXj-22RR;
	Tue, 08 Sep 2026 21:27:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43M6-0000000AJXc-3SJn
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 21:27:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5558941FCF;
	Tue,  8 Sep 2026 21:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B14D1F00A3A;
	Tue,  8 Sep 2026 21:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788902870;
	bh=857GXWh5Wp+T+/E/9iEX9gx5IzxzoNleNVwqN+hai+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dtiU6qAOIMB++ZEgT7ArQ8A+1eY9m0aeMRbEECD3xRT2B/ws4In3noMgrNS5nR1KS
	 m4VCI6nzngZOd1tbotVNI1/O/0eRPg1j2dE5zyiNCx+NwsK8xh+ezs9451E2l1tvu3
	 6zdVf2sq/Rgwe6BoM7QyTvF5blVU7jnLDHxD3FW1NXB5FFot+lq5USwP0cYgV5TQx8
	 WK8oCBGkvl3yYSPxysiq8ZRZNcqHyx6Ij7PG2u4vke5Yk1TGZX2dcIIanY+n43yhi+
	 IGOTGtg+1m/6Z2O8tdDC1BD3LzlPWNWpW0fCHuToGYxUI2RTlbMu5JuwDebH6ZUE+E
	 ysT9xDAklx7Og==
From: Yixun Lan <dlan@kernel.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	junhui.liu@pigmoral.tech,
	stable@vger.kernel.org,
	Guodong Xu <docular.xu@gmail.com>
Subject: Re: [PATCH V2] riscv: dts: spacemit: k3: fix IMSIC num-guest-ids
Date: Tue,  8 Sep 2026 21:27:45 +0000
Message-ID: <178890281743.280809.6794567458346046104.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817033038.2286436-1-guoren@kernel.org>
References: <20260817033038.2286436-1-guoren@kernel.org>
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


On Mon, 17 Aug 2026 03:30:38 +0000, Guo Ren wrote:
> The initial K3 device tree used generic/placeholder values for the
> IMSIC guest configuration:
> 
>   riscv,num-guest-ids    = <511>;
> 
> According to the SpacemiT K3 User Manual this values is incorrect
> for the X100 cores:
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: k3: fix IMSIC num-guest-ids
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=69f95409f0053f787ad60175944080621a8b7d95

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
