Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA84BC55838
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 03:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yFGndrof5/Jyje1HuehWgZMWf6iuOr2AbNpS5EdMBmA=; b=d4sdb2hjvYfAyA
	C/ANMMh8hY44v8MmdbjySMaD3K+RUvfNPVv/42Ge9JvR8peoekGiFeodedQtN5DMWPycmRTXycq37
	4s88QEYSqomfkVeTtwGdck1lpYwA3AjRmbXdJeJJLMNFdFEQqajmzW+yNNBLCASmgsJKr+DT0bY9Z
	ih0kFIEZOLxrhgD2wasoWE3gqZJw8ODuAZKwNdXzz+vFq1yG8NdYnVKQiglflgPAVlqeSA1kJCVE9
	NqJF0kxL2npWS2I5xOpW5081J5pcGqII/k5r8r5m/VF9cpzvh7RDIhCdtT+7Kn1F759Cq4peiDQR3
	Ic7/gUu0GXHm0hyR23sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrowB-00000004shE-0OBP;
	Thu, 06 Aug 2026 03:38:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrowA-00000004sh6-0999
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 03:38:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4410960A64;
	Thu,  6 Aug 2026 03:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA7C1F000E9;
	Thu,  6 Aug 2026 03:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785987509;
	bh=cBoiD3UwaMAXmdjVDF6b0NCkZrKukBc8VfE7Nh4Nz90=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=BILbr089B5EelOBerH9RbPZsF2cxqaqtCd7PtO5dxK1mB+stj0NPBSU5R8X+LPEFd
	 qiGrI27/h1CMYO3U9mzUPUOlv9Wk97yAxSj+9DlUPSuiegBQCWHZUvPooXxZuC+82i
	 wViulUCK8e1r24tNn86mSzZcS14/o15wmTpBuavMeCQQiTOgBlPcmE98/YqESk19HA
	 VZDcnuUEDqvadEsCe+7SH7+nxqzUtEx3tpv1wAp1LCMinM1QEbOxJxyEMWMN9M8HND
	 jyLuWoqxQXLFmuX5MH2pxa40+ErmQgim+aAzQqRJ3YoGlEkBIokXsQnCoT8qEyTNhy
	 17wKT6Fn6E1Dw==
Date: Thu, 6 Aug 2026 03:38:26 +0000
From: Yixun Lan <dlan@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Jennifer Berringer <jberring@redhat.com>,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Add UFS Host driver support for SpacemiT K3 SoC
Message-ID: <20260806033826-GKM76518@kernel.org>
References: <20260725-08-k3-ufs-support-v2-0-45036a2a2418@kernel.org>
 <amdyzkFplQqJvMl1@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <amdyzkFplQqJvMl1@aurel32.net>
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

Hi Aurelien,

On 17:01 Mon 27 Jul     , Aurelien Jarno wrote:
> > change-id: 20260605-08-k3-ufs-support-c8b308e415e2
> 
> Thanks for this new version. Patches 2 and 3 are:
> 
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> 
I forgot to update v3 with your Tested-by tags, but the notable
changes were the error checking added, which should be safe..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
