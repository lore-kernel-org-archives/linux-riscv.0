Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35A6CD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 21:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8i8FwU6KV27qv6niAkt26GgT4Ni5IG/IBCT1552wvgs=; b=ifWSoneK5G7fYa
	gpf2E4DAvMGmopVFPTo+fG2y6/i35ei+75fm0O/kWD+M4dQMTlNbquWRW0zCdJ6xpoJroMTeuX2su
	6iJ/8nMxLpSoXmJNKS0m6YJ6aPlykt7Z2Akb0QJULJUx1fG67CEZ3l71JAlfUgRoUWfFiO0qR8kg4
	stBRZm5IQlein+YUsKw/jjB64ZzfNFXDNZigPjPPVptP0wt1vA4SxMaZw614O3w6GdMzTZLQAuSqg
	Jw37JCs0uxUvwXGGLT0SdrrAOQ4jzHmQGz/xI54hWFuRvY2IeguTuqAon8WKVuMSa6OpCC2vC6wxS
	fGZe1ylVz9YhhaasWXTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsUYM-00000004Ixf-3GcS;
	Thu, 04 Apr 2024 21:23:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsUYK-00000004IwV-2ib2
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 21:23:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A30E461777;
	Thu,  4 Apr 2024 21:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D281CC43390;
	Thu,  4 Apr 2024 21:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712265799;
	bh=PVLmlIvJKfob7xOlZGZcbXNRUxQbQRqb5Fmg9ZDcBJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rdw+rZefr1qzpCl9/JoPb60vhe8qEUu+7GJYXNCJsTvqNbrbjXw7aoyWgN5jWsSzH
	 G+2E8+4I2DMBobN6ei8IxWGodIua896TKe1vBCfvPVDqMGBYNBZx7y4S6SIi2RtcTM
	 PjXMV3GKl4nCU3v+K5a3B0lpMoSuh8RqEhG8sNTk1NbQnCqQEGjg+GCCT95ERfX+2c
	 kuL3xNEHCjZS/SfFqACNmoUOKkR+nBFlxbgSkACcfmun5+9jUNlrfoQHonQGfaY0Dj
	 fp81GQHmRkdUv9u4/vyGISfzil7Fe0om9LhGa4c+3Q0HvmNBtTPUUu8DXg5xmQbCYl
	 LtZFBuB1XaGUA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	David Heidelberg <david@ixit.cz>
Cc: Luca Weiss <luca@z3ntu.xyz>,
	Rob Herring <robh@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v4 1/3] dt-bindings: arm: merge qcom,idle-state with idle-state
Date: Thu,  4 Apr 2024 16:22:48 -0500
Message-ID: <171226578669.615813.12438355474081050798.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231202234832.155306-1-david@ixit.cz>
References: <20231202234832.155306-1-david@ixit.cz>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_142320_743441_599B053E 
X-CRM114-Status: UNSURE (   6.48  )
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


On Sun, 03 Dec 2023 00:47:17 +0100, David Heidelberg wrote:
> Merge Qualcomm-specific idle-state binding with generic one.
> 
> 

Applied, thanks!

[2/3] ARM: dts: qcom: include cpu in idle-state node names
      commit: e48919dc1ed568f895eca090dc6c5dc56b12480c
[3/3] ARM: dts: qcom: msm8916: idle-state compatible require the generic idle-state
      commit: 8f2cc88cd4a35e33931ca1375ea508c8c9267b57

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
