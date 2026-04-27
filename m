Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD151FF8860
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 19:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n7GuHYOpZuJwxqbuo0/0DFJ1ygOGEkE/iXSFm3vBDtA=; b=sonBJou1y0AM4L
	r/ICnDg0SnyWWSrkOSw32mMC4K/aUmFDP9zKS3NE8CyuaxUJf3xYbs9vTmfCh4VHZTl++D9KwoTB+
	jntPYWGpkUM8JtxTA7CD1TEcBsOVEzt+a35y9E7du7jOIMj9x/GLT1zBefAMKTOubSsjkZz9sPd0T
	fW96nNqYU6QEQvX+mdHbGMW8Arhp5ANGJvr81Stxmt8zyh/iNffJOR517w8VzHpluF2sg6tFU1O8z
	8sg2gcriUN6qKKs4lIzGrzeSLApZTQ7fUql+JHcO4qW1v9BdhL0g2b+ye6b7RCx7eLVpHE1anL5pp
	ljD2IOQrJyCObf7FUNQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRQ5-000000002so-2ivl;
	Mon, 27 Apr 2026 19:15:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRQ2-000000002rh-28br
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 19:14:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C70ED40E29;
	Mon, 27 Apr 2026 19:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616D0C19425;
	Mon, 27 Apr 2026 19:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777317297;
	bh=PdnuyTvuhoQMGMeBVnQLbG5IqfTvFPutVB/bI+WpAOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B8ZAI2pMW/5vuMO0eg2as3bzLndbw80bRRuTBzEWC+xrIPfSh7bSGwyYZ3Mr755oV
	 4Hw7xQYBsQI38cnWWDMjX82epPl1HajS9Vr4fCigkrSS7GBs/DENYlMNZEuK1ZeeKI
	 fR3BuEH6GRZAbUUqQ7toEfn5kd5G/52nIATFlJbEyZgWM+w2kK9kdcwbaCaxXaSJIY
	 iyq4MU7ynSq7KJcZI9VX+BONqCBFXWK3cuA6SkKXUhHJbnU//Sf5ByL5F5Pz50Iz2s
	 SPI/aodPsGbfVwcmgBslMDYsTYeT+JS//wdtJChEZ3IQQjS/5du+ahPU5vAzmtn3dQ
	 YJHM2vNdtl1Cw==
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110: Drop CAMSS node
Date: Mon, 27 Apr 2026 20:14:22 +0100
Message-ID: <20260427-coherent-slimness-133d28f2cba0@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420-starfive_camss_use-v1-1-ec326af71ca7@ideasonboard.com>
References: <20260420-starfive_camss_use-v1-1-ec326af71ca7@ideasonboard.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=501; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=09O818Y59SMVVItRNPa3fOedSa/QBLcndxc5e/T2S+8=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnvt/aKbir1fVW7RsAivnfOsR0HWhpeS56w8d1Ze+Fqb TRP2h3hjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkfAQjw4FzJx56ugSEbZp1 Sbz2srxM0OmksglsC/n2t7rEfsrarcDwT5V7k+eX8nX72Qu3XJshwzz5cs65P7+qdk7c0SSsYPv rNysA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_121458_565086_F0D16AC5 
X-CRM114-Status: UNSURE (   8.97  )
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

On Mon, 20 Apr 2026 18:48:07 +0530, Jai Luthra wrote:
> The starfive-camss driver and bindings were dropped, as they were no
> longer being worked upon for destaging.
> 
> Drop the relevant node as well to avoid the following build warning:
> "failed to match any schema with compatible: ['starfive,jh7110-camss']"
> 
> 
> [...]

Applied to riscv-dt-fixes, thanks! I did drop the Fixes tag in the end, but
since this is going on -fixes, your goal with it has been achieved regardless.

[1/1] riscv: dts: starfive: jh7110: Drop CAMSS node
      https://git.kernel.org/conor/c/3e256d4c4074

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
