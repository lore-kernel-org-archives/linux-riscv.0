Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFF2C25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 11:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jGUBs/Ic3OSNPDFsetvm7WYspYgSJNLh0hcsI9yqSa4=; b=CBg5CewaNqUygY
	6nSkCxvmvDNWAVPXLowfaRRvVG6zswKyYTCy0lZBXsCzUCVj1OERBoOFKcYVC4whauy5et0KtGWRe
	dQZJz0mjlQGafNyzMnq5LOjBccvYYrwXig5MVY/f32836XIL7dw1AuZeRMgtzKcAAs/aFH3o/grkR
	qgINZqdU8qe4i36UQo6PdcnO7NdQxBjSslooO97euXLP2/5eNovOh4x3jcGtLFS5sBtS06bBy0u1j
	9lW6GpSe5q1EsGrEkFZdekN5UZbHkqTJNgkcjEMgsYUJinovkOXxHjZ17IcDqjBzxSjeIIBVe6cP8
	0cEl9+wzoCfuTj2/S1Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBvHL-00000000QMo-3bgg;
	Tue, 28 May 2024 11:46:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBvHI-00000000QLf-2umM
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 11:46:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F20A861FAD;
	Tue, 28 May 2024 11:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBC5C3277B;
	Tue, 28 May 2024 11:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716896763;
	bh=8eK4lFuvzROCoqOLZA6LdYRepQBeBPy2QYRR9Nmd0YM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YPHNRnR+D1quPmAPgEqPEV0D5R4/+uh9DdwSowMS7wP+Ni08dTDPkGQpov8fOtgk3
	 EdBDPMyk3HUZ7gSOS5t6ZIX+6/3+sFBIhwjcLQr8+iDTdVBi46BeNy0uCQLWcJTN4A
	 nUjgO46k8jhMSUF0KOMPTOeP/CWb5UfduJBudCmV+joKxaf5fw8uhmOnJObPisz1K+
	 IQgGEdoRjEajOnnhCMovItmG4aBEDFi5QK70dxeWV/n/zyg0Cqu+R6PZlB1ykWQZdm
	 wjlJmlj1TmXszIRNAcIGm2QKsV306rlj5zN68YlP6zUh2iSc48ARV+AVc+dljKRxIO
	 LTK73ul2SjOeQ==
From: Conor Dooley <conor@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	leyfoon.tan@starfivetech.com,
	jeeheng.sia@starfivetech.com,
	Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/2 RESEND] Add StarFive's StarLink Cache Controller
Date: Tue, 28 May 2024 12:44:37 +0100
Message-ID: <20240528-slimy-strum-49808758ecf6@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240515050253.38061-1-joshua.yeong@starfivetech.com>
References: <20240515050253.38061-1-joshua.yeong@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=744; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=uwmj+IvuPNH2MXt62/g3umyKOAR249jIBU85pO/nLLY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmhh5fUVIos+Plm27aMOWEel8Nu8X0W1Tn5X7RlrSW/h eTTXSb9HaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiI2GxGhm3unXHHk3cr26ht yV/IoO62+UCV2o2uN1ObJXtXMFtwlzD8d9DzqP2zejZr32zvf/sZkzb9E4l4skflmdsuc56FnCu 2MAEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_044604_801294_4AC19DE0 
X-CRM114-Status: UNSURE (   7.88  )
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

On Wed, 15 May 2024 13:02:51 +0800, Joshua Yeong wrote:
> StarFive's StarLink Cache Controller flush/invalidates cache using non-
> conventional RISC-V Zicbom extension instructions. This driver provides the
> cache handling on StarFive RISC-V SoC.
> 
> Changes in v4:
> - Move cache controller initialization to arch_initcall()
> - Link to v3: https://lore.kernel.org/all/20240424075856.145850-1-joshua.yeong@starfivetech.com/
> 
> [...]

I've picked these two up and applied to riscv-cache-for-next, with their
order corrected. Emil, shout if there was something left from your
feedback that was unimplemented. The wording etc seems to have been
"fixed" in this version.

[1/2] cache: Add StarFive StarLink cache management
      https://git.kernel.org/conor/c/cabff60ca77d
[2/2] dt-bindings: cache: Add docs for StarFive Starlink cache controller
      https://git.kernel.org/conor/c/c6005d4dd216

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
