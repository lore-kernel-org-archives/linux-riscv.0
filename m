Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA49D58E4D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 07:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cPtGeYV3ap+SA4ZZ1ghu3ZQV5nNMCm9i4WhpAWWZC64=; b=ETeTAfwce/IbpT
	Q6joKZtmhywPa/RxdLuLUicRjqqXtANUzwYdEKt8kLfdOhOnRa6OAuAKhmbLFDCGajdijtp0KBfR3
	ZGIaRgzc7bxw/uIyw+EAQeY1DXvHtHyFRQOlO3pKx54CU+BBlvzLMkAAyIc5Q2Obpe7fh+9w5AwUO
	c3lG/pqVrmiAeXe71v8h1LKpsslfFfjnj7/vO/c/ViWlPL4CvUYmUy/f+FzGypLYg1as68O9djvGT
	FFSjMkhi3lA1GUDBzmA9jSpucC+R+oMjZvclKPFFu2wvnLQozS1IeWls/hSKmpDi7sDlzB/lU6TaV
	RdI4H40wTQXVzf4Wlv0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgnF-0000000GcK9-2Vvm;
	Wed, 04 Mar 2026 07:37:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgnD-0000000GcJR-2yfS
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 07:37:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E9ED42DA9;
	Wed,  4 Mar 2026 07:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB8BC19423;
	Wed,  4 Mar 2026 07:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772609834;
	bh=Axm5RT1vXW25EsCzGFah2o7AMlhcdm1PbuzuvzpOPwE=;
	h=From:Subject:Date:To:Cc:From;
	b=tzQ2fLNwjR8mOuf7rsaHCGTiaFUszXB9rZa8mjMLtJ+H4slRL9+vseaP1Xetrb1rP
	 D+Ra/4JVKGUkORm4axoX3JE6uar3b2RLuKa7ZRBPt06r8FhohL4T9ZH3HCNSaLLDkN
	 lHFmQuuGF8RFA/Uw13286c2TEOhauudtH5Rh0Vpx/CE3Yd6GzdZZCP46GU3eMpVeaF
	 LvyOg6mbiLat3jmkW9QJAsX0ISvOJnRiUSKJ5DAO8ioMZl+XqPY2NGlw1l6+fFTL8C
	 wZW2/1vvOxCranpDr9IeOKUnBMxb6cX6GJNa1QABK0cLqXVsrThCEUvgIN9eRR1uMn
	 lYRKUnEpCD5YA==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/4] riscv: spacemit: k3: Add more resource to UART
Date: Wed, 04 Mar 2026 07:36:41 +0000
Message-Id: <20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAArhp2kC/x3MQQqAIBBA0avIrBsYsxK6SrSwmmogLNQiiO6et
 HyL/x+IHIQjtOqBwJdE2X2GLhSMq/MLo0zZUFLZkKEKSeOUIp4uJJzPbcOBa9NYstYMNeTsCDz
 L/S+7/n0/mekYj2IAAAA=
X-Change-ID: 20260304-01-dts-uart-full-be53670773b5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=967; i=dlan@kernel.org;
 h=from:subject:message-id; bh=Axm5RT1vXW25EsCzGFah2o7AMlhcdm1PbuzuvzpOPwE=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpp+EXabe58tmIYcg3+/OAeEMhn8SlnKHAgq0Rd
 a/3F4kfK7iJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaafhFxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0Jfg/9FiKWNn0F4yxDIuaEf0s4fmZHXKJSDAgDkH8GKtOziZIB0r7ZJ+HD+
 Nqf8X45GqmGvCepByZh6UwBZmzuXY9pS37R8jHYhw/39FuGDuLaJ26iU4QxP8Dsr4gGJ4V09lwT
 1JbW5mkzLdVHdWCp/ouElnJIcAkEsQygsOwOf7wtCXwj0DVQ98UeachkR0FkbUcysaFY0DEpAFR
 0kT3Nor1jRrzj0HiFEMIG/P/ssNq755RsSfPfmyQ0NdHhNyun0+lr3Hj6p3RdLsLaW4LqEk7ZtO
 VgJtJf/PzUWl3NZ0kbHXSqa2FUhSZvAHt/SV+3dLpWtE4L/GlMZG/DSw5wVOWzomu6mmjso3LoG
 h2XgIP0S42FPJruiOedOup9ua34i7EADKU/NxtmAiplA22wwbqbh8cm+yBoZhVDyhS3KtW4dXNJ
 FSfM+HZJMahemyT1/emRpJobinMlLKbBwnhg3hAKO0q963IkwVbNnHfihog1fh95rDCIG76p7Eb
 EBnZEvEa+UZFhHTIsPauTupuaZOiJHMYXYxZXXQS3v/jS9YGDT922KPIsf0WYGmcryafzkscIYk
 r+U5JapiFW/ORbs4P1wwnGxlEbIyc1I4j44qRaKAP/x+TaEKUM3c+RmMf0zgrkhlXSstIlXykw9
 FdCUoHCckaA+wCjP4+E1p5GRk214rk=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_233715_776357_60712A85 
X-CRM114-Status: UNSURE (   6.31  )
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

This series try to add more resource (clock, pinctrl, reset) to UART driver,
So it will not reply on external bootloader for initialization. While doing
this, I've tried to break these patchse into more fine pieces, adding clock,
pinctrl+gpio, reset separately, then UART.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (4):
      riscv: dts: spacemit: k3: add clock tree
      riscv: dts: spacemit: k3: add pinctrl support
      riscv: dts: spacemit: k3: add GPIO support
      riscv: dts: spacemit: k3: add full resource to UART

 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |   3 +
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  24 +++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 152 +++++++++++++++++++++++++--
 3 files changed, 169 insertions(+), 10 deletions(-)
---
base-commit: ec1fb4e55df47ed043ab2ccc6787e39b9d67e49b
change-id: 20260304-01-dts-uart-full-be53670773b5

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
