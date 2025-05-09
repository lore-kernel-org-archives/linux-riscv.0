Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32343C3ABCC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 17:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xFNQoteyQ1aNSm5FHBe1hGyCwjDhteLm0hJx0vALsNg=; b=nyHe+93htVnAZl
	UJKl1Yg4OwicxecULR6ruI5YtgfM1jPyoNyIIthhHvLIWTV56yk3nI2Ek+uisl7vdgMGuUEIwyTTZ
	ewU9yVx67Foodp78PGyneAGpZG/yHeyQJ4hw9Ecq3dj57XhEpVRUNQzw36h8iGU4tNOwW3sODe9lV
	tpNWUOTD9S6pShAb4uvMFMXmz/MVF8+rXEuOEZjE+qJZsU3n6uarbD5vB1I/soCm4vjNWqzOpuI1x
	cMvQbsawkpLm649GNCOMHapd1i2nb44T5MKReQzbfvKho3MGmJ70XOl1PS2VsSUvAKF0yx+JnF+4v
	94E/wR0l5X/f+DbcLEGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRnO-00000004TjN-1bN3;
	Fri, 09 May 2025 17:46:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPoH-000000047Rv-3yTU
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 15:38:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 73BB64A4F1;
	Fri,  9 May 2025 15:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07464C4CEE4;
	Fri,  9 May 2025 15:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746805129;
	bh=23EEvWYAIVOHl/ewlgckhGrHY84KBN76CzwmIFh/e5k=;
	h=From:To:Cc:Subject:Date:From;
	b=PLj3tSN41WgyTDs+60bn64teAB1L/EXn3XYzZQAxZ58SWvNtFFJJVYM2W5Fhklrpf
	 LboAHYk/Emy+5cXL4CHq61dMOijVLpWs4WsomuPIGPuxHbnHT0UQrpUHz0rOJt/yRN
	 dL6O1Agtd+KEzG9d/2MyAWiawLllfwbRgKTGaoOqAjGLcfMJ0LlEDntrUlw+f9dDEO
	 Ao1wtYvSRXmbsbAHFM0F1OCb6Cdxw0brWb9IhRjBrlPx20BYa1RRR97gLDretn1f8i
	 x9ZWlH353CDqP7CRlsvvRQ0IgcS+/6VRpMLZ6TjT0GNpqEFW/SY/4O/PVYYGWuqPlx
	 mJoh3dnPxfUSg==
From: Conor Dooley <conor@kernel.org>
To: linux-renesas-soc@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/2] Add specific RZ/Five cache compatible
Date: Fri,  9 May 2025 16:37:55 +0100
Message-ID: <20250509-sapling-exhale-72815a023ac1@spud>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=960; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=D7InSwvjCvcxVefdG8CAmpmcWUJm9FNi86WLZlt2VAU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBlyiiEvfm1gSzl2Xf+A7aWtgiL7ly/nWSPcKxD57p33h nVHeC9t6yhlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEvvQxMnx8xNvk4CO2Lo9J /YDaxzjBS+JrW9v7njdZPU4Red/kvIuR4ephk+DOuZlVy1KvqUnntGabHi27UeaZcKWXRfBVadV fFgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_083850_039083_F729FB00 
X-CRM114-Status: UNSURE (   8.70  )
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

I opted not to add fixes tags, but I can create them if you (Prabhakar
or Geert etc) think that I should.

CC: Ben Zong-You Xie <ben717@andestech.com>
CC: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-renesas-soc@vger.kernel.org
CC: linux-riscv@lists.infradead.org

Conor Dooley (2):
  dt-bindings: cache: add specific RZ/Five compatible to ax45mp
  riscv: dts: renesas: add specific RZ/Five cache compatible

 .../devicetree/bindings/cache/andestech,ax45mp-cache.yaml      | 3 ++-
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi                    | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
