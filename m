Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F89FF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 02:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=50v1sMrrmggCkdpTKiyfvF3dDS2jvd/0Zduo968qclE=; b=op7VM23bHEoRg6
	KzMEZ9TPwui9klcJg4X9yBiHs1LgP/BtQmg9JpQ8u7wgHa5jcGuLsqcG/EdnHaB7j2eetb/5xpB/Z
	CK3vw6rMyESkVTEFrFoaTU2zGco3aTSiqFrTV1x1xi1uwETQA1/+CsE0pGNekmorkZtcKlmQySHnm
	Qy0wcAikrA6mb64qhJkdICKeDW9NAb6VUNFXWityvAeUitiIPmJltJ9gvNz+2yzN2y1ObvHs2rNw6
	g9QUjZsFKRrqmmjXCZ3siSe1J08qQoe08WId6q/iJWDDya9lVBeGO9l+uuSgn6asa5COJqkNF546I
	tDQnWzgDItBLP1EKRRbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGwG-00000004QYM-1ugt;
	Thu, 30 Apr 2026 02:15:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGwD-00000004QXQ-2kC3
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 02:15:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EDCC4324A;
	Thu, 30 Apr 2026 02:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F879C2BCC6;
	Thu, 30 Apr 2026 02:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777515337;
	bh=jkFbsZv80WhUCN9nNYsE/0yusKIPtiSFJwy+bl0lj08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VWOc8XIoCNPYD65XF4uhGZeI1N+hz3dKnKWjOYSZeBR1r6YqrpKc00WBLmzP4YlS4
	 lG1QxAmye2QDNXhg2RWkZgmYmHihNdobwZxIjthp8sCU3vRswj1od8PfagZOCmmkrf
	 e29RyuvdT5r+6AW34xVoBOn1dS7Jy33HacccTo8XDDzZyCBAnDlnfNAtEA8FwUeN+a
	 wLF7jUwo62sA94D8JrZSLeIDOBN1J5RkysXhv+iqeocuMvDb/D52lx5Oc5MuGgTZm5
	 WVNReLZ9GJKNsXwlSuN1XxR+iLi3tHVOFQCfjRH0npv7D4RnENUZQQ3wbjQryy4yp+
	 XXSQo3jgqH48Q==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Han Gao <gaohan@iscas.ac.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v10 0/3] riscv: dts: spacemit: Add PMIC regulators usb pcie
Date: Thu, 30 Apr 2026 02:15:31 +0000
Message-ID: <177751531219.2920128.7013231454370022274.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1775575436.git.gaohan@iscas.ac.cn>
References: <cover.1775575436.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_191537_713973_B992449D 
X-CRM114-Status: UNSURE (   5.45  )
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


On Tue, 07 Apr 2026 23:28:13 +0800, Han Gao wrote:
> Changes in v10:
>  - patch 3:
>    add vin-supply in pcie_vcc3v3
>    reorder vcc5v0_usb30
>    remove vpcie3v3-supply form pcie1
>  - Link to v9: https://lore.kernel.org/linux-riscv/cover.1775417019.git.gaohan@iscas.ac.cn
> 
> [...]

Applied, thanks!

[1/3] riscv: dts: spacemit: Enable i2c8 adapter for OrangePi RV2
      https://github.com/spacemit-com/linux/commit/ece83d42785e12ab7690c0c13b416baf46a74063
[2/3] riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2
      https://github.com/spacemit-com/linux/commit/c02c047b925c0ed101ec6834e1c07a53a45f98d4
[3/3] riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2
      https://github.com/spacemit-com/linux/commit/e3e433dd9aa04448f8f98d59359cab1340d994a3

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
