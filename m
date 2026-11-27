Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF9C606A31E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 11:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uei/cB6L;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eRpJ3oiJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=klFAlxFuO93Wgf6peE6DJhIQsBZ8xXj4P9xJQX/xYUQ=; b=uei/cB6LATsQ7WiRvHadyokgTB
	E1B0TLycNi0At7z7UjcBzglJG+KXRN2CFYN6IQ2lVh4W2mZ9db6dQD9CVuRZi0iojUwtsCXJx7x3D
	Bvh/YJWoLQSOoUPrcQUEgHgA2NTLqXbu2ac5BrjlMdB7UO05SJ2sgpkvsgVJ5WgZEeJElsoM1qg1U
	8jzpS6Mglw4kKGXvjuypmjmxCeNvO/mYZkgDnx21H8Dd/p9OhFx/sH6tOPuhr6Q+r2BZaMqxQSFel
	EllOXmPd0tZskCqxyBI/btjHQmO/t4qxWLNjd7wmJy4/73XudgGl4LASjbgimPs7z14JdFsDMixPp
	xaT70nvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWu9l-0000000FoO3-11yA;
	Fri, 27 Nov 2026 11:30:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWu9k-0000000FoNe-1PfZ;
	Fri, 27 Nov 2026 11:30:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D437F453A5;
	Fri, 27 Nov 2026 11:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E1B91F000C1;
	Fri, 27 Nov 2026 11:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795779019;
	bh=15lHObMmyGPpj6YoAIfUZKJfHfZrP3j6tm+aE9QITgc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=eRpJ3oiJWlSUirmaD+LmxhuRi1qhGdFgQgOJ16JgA7cDHI6z8NvWcNJjrCMheJKYB
	 8idaGg+O5UwqD9w2E7Ctps4fkioj/O+VAUrWDx/FM51PbVFI/1FO88txl0AaIdu8Ub
	 CFiSeSjIVR3SFkT2BeFCV/RRj/nUNkzxPGC08cRFZXoco0Ld9g4DfPnbUR4QNeWd6m
	 uU+ybC4a7Pu530Z2z7h2A6pioyF+wpnTkuR8PC5it6Ftrag2l/snSfFLGxF/KM74K6
	 jTVhaImUjQTSJQb+DLbqhaWqUqnGdsyUPO5SvDBB+YNnQFyDGwu/ZDlPlhGMrlM6Qm
	 t8OCaNmNBHFNQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/2] phy: add a driver for T-Head TH1520 USB PHY
From: Manivannan Sadhasivam <mani@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
In-Reply-To: <20261103081444.1983071-3-zhengxingda@iscas.ac.cn>
References: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
 <20261103081444.1983071-3-zhengxingda@iscas.ac.cn>
Date: Fri, 27 Nov 2026 17:00:10 +0530
Message-Id: <179577901023.3421.16085123878298234680.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=524; i=mani@kernel.org;
 h=from:subject:message-id; bh=YyFV7s9af4kC0Pv/cS0wCU3OEWYq0SK2owkuNnqdByk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCWnFEFB/4u8peT3P9un5fE8fPPjIzxZqIShYF
 I4eaeQlYgOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawlpxQAKCRBVnxHm/pHO
 9anGB/9aTf3MYaPlIVjysYpZxYxQ5CPAVDm2b4edKul/qVV3rgG86keiI9l31FOXdhjTwatY5uM
 xrC1jCFsbIXOtoCqPe3I1HAaZHVY/HwMeMEQL/e4gm2WU45ECc+ivWDqr6BDuMZB72kN86ZDuix
 4zCwxiUAWNaEmA6Qw0ct45dJ+e4UnnWfimEn3qz+YoApLyfe24Ln6RrsyRID113YOiKheLtWesY
 nCq6mYfWH42PWHJs7Vg4aCMq/CmFb+yn2joXP+43kz+Km7iFMvulvYL/+eFEw1o3HB0ihb0vHdJ
 G01z4bsKP4J6DtRE17MMqKtu69l3qmp5rhrYsJPl8XICrerr
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Han Gao <rabenda.cn@gmail.com>, linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-03 16:14 +0800, Icenowy Zheng wrote:
> The USB PHY on T-Head TH1520 SoC is a Synopsys USB 3.0 FemtoPHY, with
> some PHY parameters exported as another system controller along with it.
> 
> A few PHY parameters have unusable defaults. Add a driver that programs
> them before releasing the PHY from reset in addition to
> clock/reset/regulator management.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
