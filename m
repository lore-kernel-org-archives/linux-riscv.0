Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1131EC55ABA
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 04:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lKR5BPZuwweWGQMB5Wt3hEEM7UcIAXWx316J19tIeRU=; b=YEhlI4E4dwyOzAX9+wmJF/9Iks
	VBxe+yMi8RVZjut89y0aGMQN5sJ1nuQmUQy82UYJ4rtPc7fqLbp62jF7+QSpajP/JfESAdpaWwqA+
	UKLydcA1b44vZ1Z/1Qfk4LVacgPJTa4w0Dh6fEuu0ybXMkiDid10bXZ+mRgwxmyRUExXPFGUmt5Be
	+n9fPdxMWveij6mlLrdKQhUYP03Ceq82yJdd+ufZmUO+o3rNymGwOGjOdVVgXE6D0pBZUcOeoSCL+
	WF0SO1grFlzZYPBKm40FIbJXoAgj5LsSQXuTxe9vZwuZTqSXaQ0kmPJWcgAGq7Rh4X/MP9atxQtSd
	oIu5PNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrpsu-00000004uy0-1b8b;
	Thu, 06 Aug 2026 04:39:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrpst-00000004uxm-1udm
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 04:39:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D1E860A64;
	Thu,  6 Aug 2026 04:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E041F000E9;
	Thu,  6 Aug 2026 04:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785991150;
	bh=85i0AXt6sCXn1q2thPdJFckEuCv/5TVwacAUp/k4SQk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=ELIcMt+iX8oyqWp+t39x854MB2hi65pUKoR+arELehyykuMEkum1EfaSUFjYebixB
	 RN8ohC0Bhi2umkm/8xFyXWEZfD707UaguyTpqM7OKfM5FayVRasqI2bevwcYHDS/MM
	 dQ14jur+wDUDlcxYhkSnCeINh+Y1buspDbPQ9Pd040NzH1U0yVeOzgKC2IkT+W3/v8
	 HWMuzO1/Uir63zS6C5qgd6FhA9kzFsG3Jk3M4utXPLouK1wR/yOleXRW+LA7oAmt7L
	 gNB5qf9x2yFbtGTR++WQuYECHYyE+CoBfhuAIU4BCRoAHHiUTUJcdzTvnTsm3ToqhG
	 aPVz2LYdUmTNA==
Date: Wed, 05 Aug 2026 23:39:09 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 linux-scsi@vger.kernel.org, Avri Altman <avri.altman@sandisk.com>, 
 spacemit@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, 
 Albert Ou <aou@eecs.berkeley.edu>, Bart Van Assche <bvanassche@acm.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jennifer Berringer <jberring@redhat.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>
In-Reply-To: <20260806-08-k3-ufs-support-v3-1-037fb322acdb@kernel.org>
References: <20260806-08-k3-ufs-support-v3-0-037fb322acdb@kernel.org>
 <20260806-08-k3-ufs-support-v3-1-037fb322acdb@kernel.org>
Message-Id: <178599114910.179339.15914924366340132471.robh@kernel.org>
Subject: Re: [PATCH v3 1/3] scsi: ufs: spacemit: dt-bindings: Add UFS
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


On Thu, 06 Aug 2026 02:56:18 +0000, Yixun Lan wrote:
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
Lexical error: Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.example.dts:31.36-55 Unexpected 'CLK_APMU_UFS_REFCLK'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1669: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260806-08-k3-ufs-support-v3-1-037fb322acdb@kernel.org

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
