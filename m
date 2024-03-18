Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B9DC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 15:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pXNhD4PP9brYAAW8LH/u2yQotGOkHCC4Z+3LrNPVixg=; b=zfF73/YZsfuN9F
	iOE5kMWBK9uX1y2h13PGoFSQIFgZn2M+UtGzLpNk6+HG7N+96l79REZFoRGZIIizQwgHYVYeC7aK8
	IhIq8CTvtW6YzwAi/ilzLr+V/ERa/9lhT7Hg05DNHn/Aa0m2R0aN46HAV07XSKAie4yo+kdjRrpL/
	n+53F3zbY+oeItXgZQsD2NsNPHL5GAJBcVtc8ae21m+msgwH1D1w8bajXbh1UiZ9E7GoZoCMQiiTm
	l02K7B+B4oGPwMSiJp6y+vaAGLOki8avd8d1MrVmWY09MkGp42N6Ie75f3yfRV8M+4wq/YagQVD2t
	XXBJv2NPS+1lazE0UYcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmF21-000000093g9-25dJ;
	Mon, 18 Mar 2024 15:36:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmF1x-000000093dU-1sTX;
	Mon, 18 Mar 2024 15:36:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C8D6ECE0ADB;
	Mon, 18 Mar 2024 15:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31CACC433C7;
	Mon, 18 Mar 2024 15:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710776160;
	bh=ncNnzzFLD+EC1GvgwoBIzC/SxHOpyQdJBZwQhlX29Wg=;
	h=From:To:Cc:Subject:Date:From;
	b=BQ2aKkHkv1zDAn9yStDByoWz04vcdYPWvhGzZv+qLja5DUTMe3cBOXsNhkWJdVT4n
	 RZs4V3S073kARMk7iEYeMojLaGVZIKgNVYymGW8jgXvqilVXbWZENDOqHIAjBkumxZ
	 fsKQQavth1WLtG2cjZ5/078fmQc16tT+z9blV13/xquDSfC4XyMUwLoTwTZdsl9XnD
	 0x53/pknATPxfx3V3xgl1jVxbObiUmUxNgAu9EXWOC5SmzFXoQ4JEHcaUhh4gieoK7
	 06wn+Z8Bk0NpEc5UQFDqCb1B5nPhXvcn9awOhEm/Vr7DA+9Okm3oga6/jUWK+sVam2
	 cilITj8QMM9gw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] perf: starfive: fix 64-bit only COMPILE_TEST condition
Date: Mon, 18 Mar 2024 15:35:04 +0000
Message-ID: <20240318-emphatic-rally-f177a4fe1bdc@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=qRhFK3rYTyezrGe8FKEh70/bj4HDt75Auhc2y3YLrUk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKk/4jV2Jhj8lRK/e2l6+fr4o6XnurPS5pmvtrnV8mPNO Y7pPf8fdJSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAi98wZGbZxhey/UqvwaQGj sZ9dYKrpdY841h9yCk8P1we/lFLZb8PwvyJva/D3roz7mzev0TI4fe1FwPG0pyrLuMW+fWM/+fz YYyYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_083605_690493_A1FF1356 
X-CRM114-Status: UNSURE (   9.37  )
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

ARCH_STARFIVE is not restricted to 64-bit platforms, so while Will's
addition of a 64-bit only condition satisfied the build robots doing
COMPILE_TEST builds, Palmer ran into the same problems with writeq()
being undefined during regular rv32 builds.

Promote the dependency on 64-bit to its own `depends on` so that the
driver can never be included in 32-bit builds.

Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
Fixes: c2b24812f7bc ("perf: starfive: Add StarLink PMU support")
Fixes: f0dbc6d0de38 ("perf: starfive: Only allow COMPILE_TEST for 64-bit architectures")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Will Deacon <will@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 drivers/perf/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index 5060e1f1ea10..7526a9e714fa 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -87,7 +87,8 @@ config RISCV_PMU_SBI
 	  filtering, counter configuration.
 
 config STARFIVE_STARLINK_PMU
-	depends on ARCH_STARFIVE || (COMPILE_TEST && 64BIT)
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on 64BIT
 	bool "StarFive StarLink PMU"
 	help
 	   Provide support for StarLink Performance Monitor Unit.
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
