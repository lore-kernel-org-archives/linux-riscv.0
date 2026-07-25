Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843C0C531C9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 13:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IfRtEJDLBbcogoAxKPBkpOXzzGMkFU2XrPue1sp4FnM=; b=mmbZ564VqGBi7k99lihxQRtkt1
	HPjUTJNIb4BK/gGE8VfM4ukQDD6O9z1AbVFvwv6veooD682BFOLyTnNAWtYVoj2TttcRUU+do9DHw
	UdQYF7JP96xFvW+Wa0OXqLJa/+VVGE4dAYpQPx33onw8mE39hA5AwtcOsqbIaEuxiGQX9drAdn1xo
	EkIRwjxoArNljWObVKUMob5FB/YGJXNW736Ko74RujophVOjmmPS7gAbbilQuHyZ7Mcswr/6Fr9fH
	E3rwUC4UcKIZD1tYrjcE699zbrdT49uujT2tVM3x+EKpTZb4rV/sDZUqOwGxV2W5DwC2vKx48xkwG
	/9FsxQNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncPr-00000000NVL-1cHe;
	Sat, 25 Jul 2026 13:27:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncPp-00000000NVD-2J2I
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 13:27:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D81E343A24;
	Sat, 25 Jul 2026 13:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3C11F000E9;
	Sat, 25 Jul 2026 13:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784986064;
	bh=DsJhSTaLOqEFyvKvQH1QRB+ENNlkLh84i18wRSEe3Fo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=BGThAtup56cMrZOpHQ3HrO1XCzugN8xYb+nlsrR59wMwLo95nvMiyMj1j1P1U0tMl
	 36B7d663p9g0Mzd8SLpeThazz4+fWhykbjf2aym9VGzslsosVFXnunmLudx5s8PH63
	 0Ix+aKMuSvIdNXr5nZl9yb7XFPn/tZwb/mAjcKQ4ERNnG+H1UMD7h93e40NOwnqINb
	 V0di6zDAkIH9OXVcd3hw7v12RAKQlkOPvyCXtrAKrXXgyTHjjhHEAVBJ0xa/xK5sqj
	 T9vh+GwPX318xX/JuaFlxK5GOQYpT6PvrJqyxjVUj9T8LN4xNNJBuvUX8NcLDL9REr
	 1IqOae2wEI8Aw==
Date: Sat, 25 Jul 2026 08:27:43 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bart Van Assche <bvanassche@acm.org>, Alexandre Ghiti <alex@ghiti.fr>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Aurelien Jarno <aurelien@aurel32.net>, 
 Paul Walmsley <pjw@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Jennifer Berringer <jberring@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 linux-riscv@lists.infradead.org, Avri Altman <avri.altman@sandisk.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-scsi@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Yixun Lan <dlan@kernel.org>
In-Reply-To: <20260725-08-k3-ufs-support-v2-1-45036a2a2418@kernel.org>
References: <20260725-08-k3-ufs-support-v2-0-45036a2a2418@kernel.org>
 <20260725-08-k3-ufs-support-v2-1-45036a2a2418@kernel.org>
Message-Id: <178498606385.3230542.8227126824689788827.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] scsi: ufs: spacemit: dt-bindings: Add UFS
 controller for K3 SoC
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


On Sat, 25 Jul 2026 10:37:44 +0000, Yixun Lan wrote:
> Document the compatible for UFS (Universal Flash Storage) Host Controller
> which found in SpacemiT K3 SoC chip. Its features are listed below:
> 
> - Compliant with MIPI UniPro v1.61 specification.
> - Compliant with M-PHY v3.0 specification.
> - Compliant with UFS HCI v2.1 specification.
> - Supports up to 2 Tx and 2 Rx lanes, up to HS-GEAR3 5.8 Gbps per lane.
> - Supports standard low-power hibernate to reduce power consumption.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.example.dts:31.27-46 Unexpected 'CLK_APMU_UFS_REFCLK'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1669: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260725-08-k3-ufs-support-v2-1-45036a2a2418@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
