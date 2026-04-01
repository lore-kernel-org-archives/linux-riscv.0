Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D288D3517B
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 12:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l61ddCiNI2ugwKf1/oq2JVmSFo8UeN0Sqo3Ii3FvoiE=; b=rRcoafEwHPYr+b
	aWE3ED4033R3tw/75Ager7lqOUt802UMz97q/Po3BGWRKpU1b5zAsRd+sw3P/QJsMwea2W29Hrqza
	sqwh7zMkpNzl+7EOtksrC2FWFVjKtKM/HTWSzSs0PMXX7kTaW444UXAYBYGb27WMXRHyjv/Fc6P39
	bgPtY9wvlqU30+HWtH1pmptPwSvgvUJFOBuCZySuEwmttOFeLSc5m1yc+79rAU8JBOf+9eLS+rsEl
	JiHRHbzH08BLsvFs1KlCRT9NWnOeO9673RCl9gvVIx+m42Z/Z9k29f0QMiHUSQLbO9iFj0RlStqGE
	OTLDa9dI0LK78h6IQUvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7v6L-0000000FGEG-3RDg;
	Wed, 01 Apr 2026 12:55:19 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7v6I-0000000FGDw-26pY
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 12:55:16 +0000
Received: from localhost.localdomain (unknown [116.25.95.185])
	by smtp.qiye.163.com (Hmail) with ESMTP id 392921f84;
	Wed, 1 Apr 2026 20:40:05 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: gaohan@iscas.ac.cn
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rabenda.cn@gmail.com,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v4 0/3] riscv: dts: spacemit: Add PMIC regulators usb pcie
Date: Wed,  1 Apr 2026 20:40:01 +0800
Message-Id: <20260401124001.3129497-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1774974017.git.gaohan@iscas.ac.cn>
References: <cover.1774974017.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
X-HM-Tid: 0a9d490ee1dd03a2kunmd08eb7e351e142
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSklPVkwYTBlISx9LT09CS1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNOWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_055514_744307_EFF5FC37 
X-CRM114-Status: UNSURE (   4.57  )
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

Hi,

> Changes in v4:
>  - Drop reg_dc_in
>  - Drop vin-supply from reg_vcc_4v
>  - Drop usb3_hub_5v, no device consumer
>  - Drop vdd-supply from USB hub nodes, hub is powered by always-on VCC_5V0

Perhaps it can be declared that the hub is powered by vcc_5v0:

	hub_3_0: hub@2 {
		compatible = "usb5e3,620";
		reg = <0x2>;
		peer-hub = <&hub_2_0>;
        vdd-supply = <&vcc_5v0>;
	};

The vcc5v0_usb30 regulator is required to enable USB VBUS.

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
