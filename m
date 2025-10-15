Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17FECCD194
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 16:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1eq/Rr1Tesem6VPnCfDnk9qk+BjWQ5zfXpFQ0ZdW78=; b=yHR7j0XKV+B7Lg
	bVXBYZ9KiFvWsd/0r7cfxLsRAKDR1S1ZMj0tdgcfc+uKy+dJyJ6RspWobsuNowbSwzvQDAVgjUywA
	NZbqQ+ipZHHO0jKlxH8IXVrbdSeeLfbdW/7xScX2z2sDFUgTMFmu1uurjdYWYfvpiSIhkrsuYn6NU
	Qm07ebLi3gZcODS93DR8sxSN+UG0B3lC/d/0hnd+fjMpTW1OorpZ+mnJIZ7QljbcidtzG8pgqvL6D
	tfm76cwMfLJUjkGY5p5uAUiG8EIG3VOBsTwXh2Gyo7Y2y+dHywvZaHtS19pFUAVp55FCXUPfTeeX3
	bkDHq1mxuCcb44Io2CkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v94Zc-00000002Jx3-1E7O;
	Wed, 15 Oct 2025 16:42:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v94Za-00000002JwZ-1mrK;
	Wed, 15 Oct 2025 16:41:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98BB76297A;
	Wed, 15 Oct 2025 16:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139FDC4CEF8;
	Wed, 15 Oct 2025 16:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760546517;
	bh=9K61xwRqqf8ENXqYLk5+Ql/HCKvMYhIsjWS3UR1LAJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AjBFrI6F5Vkk+AEmnLeRu9FXSyTmTlJ4lmgOUVAziqVPGaJn60saM3QaDV8VSGgJb
	 DUcJIYdpCj+RAEQgV/qsyUWH/HmwHpBfeYlrZW5fJ0ZfrpIu/SG1rcxxeN9Q8+yS+g
	 ygfrzqS5lt4XPm4jlXExzO2pQ6VIKlym6Gmd+RoViEevqE43vQuqyJ5tt8vjhZYhoe
	 nKZoxUeiB4y0BKn2AJLqWsLi5vGv/b2LTog/BbKVYFi2yhP+/2QNXOnfZ+fGBis4Zl
	 fl2QZMvo/3kwhBxHhlfhcqPqbSTeJi3CJrc3cDd14ZcKFs6HotuiW3PNfL3cQTlMmX
	 frC4tr4OJrw9g==
Date: Wed, 15 Oct 2025 11:41:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: guodong@riscstar.com, bhelgaas@google.com, christian.bruel@foss.st.com,
	krzk+dt@kernel.org, namcao@linutronix.de, aou@eecs.berkeley.edu,
	shradha.t@samsung.com, vkoul@kernel.org, linux-pci@vger.kernel.org,
	dlan@gentoo.org, pjw@kernel.org, linux-phy@lists.infradead.org,
	qiang.yu@oss.qualcomm.com, p.zabel@pengutronix.de,
	linux-riscv@lists.infradead.org, mani@kernel.org,
	palmer@dabbelt.com, kishon@kernel.org, kwilczynski@kernel.org,
	linux-kernel@vger.kernel.org, inochiama@gmail.com,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev, alex@ghiti.fr,
	krishna.chundru@oss.qualcomm.com, lpieralisi@kernel.org,
	conor+dt@kernel.org, thippeswamy.havalige@amd.com
Subject: Re: [PATCH v2 2/7] dt-bindings: phy: spacemit: introduce PCIe PHY
Message-ID: <176054651498.4032617.11231316454316691309.robh@kernel.org>
References: <20251013153526.2276556-1-elder@riscstar.com>
 <20251013153526.2276556-3-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251013153526.2276556-3-elder@riscstar.com>
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


On Mon, 13 Oct 2025 10:35:19 -0500, Alex Elder wrote:
> Add the Device Tree binding for two PCIe PHYs present on the SpacemiT
> K1 SoC.  These PHYs are dependent on a separate combo PHY, which
> determines at probe time the calibration values used by the PCIe-only
> PHYs.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v2: - Added '>' to the description, and reworded it a bit
>     - Added clocks and clock-names properties
>     - Dropped the label and status property from the example
> 
>  .../bindings/phy/spacemit,k1-pcie-phy.yaml    | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
