Return-Path: <SRS0=2lO5=O3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48D9C43444
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 00:10:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E055214C6
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 00:10:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UGX4A+Ob";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BN3FWNRR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E055214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UK7xIJm2JqmwNt5vaSKujr9Ojmy7hpwe+pCsLKh70x4=; b=UGX4A+Ob5qVk8T
	xHcOSayt1pMksX+g5/3p2GovBwquRRJD/kNIvYSKiKRs1EP7t/lVfGxqAM2Rz0TV7euFndOmhIFCU
	elqqP/0X8c8CrH00wssHUH/7e/OmxhzU3NHSNcG9rzoJQyQd4+DVsjOcAFF4Kfw5sBSEPq0CR9FI8
	40fJWi2ca7ViwKNqkJiISL+j7AlvDl6p7mwxI03bPX5LxzkpCeq0S5bWsXC9wsnNTrZdfYng5S84e
	ztzYXXfw0S591sMMjKYGEp6yvK7A0/1HAjdd3+5lQhaTWd4itdIG80DVi5nAclKnBKfckT0yYJ9w5
	kDTTC0UjoaSsZubBmxjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZ2xo-0003AZ-2R; Tue, 18 Dec 2018 00:10:20 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZ2xj-0002Cf-Un
 for linux-riscv@lists.infradead.org; Tue, 18 Dec 2018 00:10:17 +0000
Received: by mail-pl1-x643.google.com with SMTP id b5so6913285plr.4
 for <linux-riscv@lists.infradead.org>; Mon, 17 Dec 2018 16:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/CK6plly068rh/+CFs5o4qKr3D96uAMmAUOa6f+NxKw=;
 b=BN3FWNRR5cRsbF5luyviBRgEiJN4D2us9/bAMJRH3ZFnBJXCeAAelpZv6EaY5chTI8
 l77xXjF6MTA7Yd4Aas2ad9FucBo91gQ4paqBzD5eQ+6jfevhIS1HGUcn9JJJ/hMBs8Du
 aKOHF52vcMJFHL2DuJQPY6ThksP14XbmopeQg9wD+gGCcb8WEzKh6/N+1Lclr+TJyzuU
 KP1POjiUbAVMkBW/KgdMNLY3Ldre1Vkq+0SCJNnc4I8ofVlhJHGDnIwr4Oueqm0+MoWO
 wNaSbsoUfs5MvI1151tLi+XgW0q5so6ShFvLCBAj/fGoF/uP6Oe2HGT1FP99ABCP/GmH
 7ZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/CK6plly068rh/+CFs5o4qKr3D96uAMmAUOa6f+NxKw=;
 b=AYCnE3+Y4iqmAAPEjgarOc80VMK2xDxraF7jyoR8cH3GWZ7tlUdpn4oEKvfVkZJvCc
 GHbRDCSq2k17oFu/1L+1/5+PZpABvjFb69ZsSkXm879OchuayYTvduMIL7TsVRRoAHbi
 tgJ2s7bHaP3DCHbkAsIssjV1Ri7/kuJOT9Mxe05tqyyL93I4myv/sxl3bJ8p07EFn6xf
 4PQp/3GA3KeijOTJD/tW53mqSMrZ+tO2TCBWXu8xWOiEle/kIAflWAxBeA+LEkL0wGPl
 UrByGjPKto/r9XCExIRyWp6QmmjFg69+GaZO4/VlW61O6tNx340YcGwYz4blqvbequvF
 uWqg==
X-Gm-Message-State: AA+aEWaOf2Uc2S/xFaKJrYcEiyy6+T3c/JwnaNTW480+3oZEtlg0CsHB
 uQOVMAV2TjvfAC/fRqCFPEZzjg==
X-Google-Smtp-Source: AFSGD/UW5hVdo0uzlWys23bxQWh7GHHbsu1ngguBUQYkQoHfCap0PkrgNyOyuOsQd7jJpWm+MYtHhw==
X-Received: by 2002:a17:902:ac8f:: with SMTP id
 h15mr13978396plr.245.1545091804897; 
 Mon, 17 Dec 2018 16:10:04 -0800 (PST)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id d25sm20878535pfe.40.2018.12.17.16.10.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Dec 2018 16:10:04 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MAINTAINERS: SiFive drivers: change the git tree to a
 SiFive git tree
Date: Mon, 17 Dec 2018 16:09:58 -0800
Message-Id: <20181218000959.31352-2-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20181218000959.31352-1-paul.walmsley@sifive.com>
References: <20181218000959.31352-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181217_161015_999259_915BFD73 
X-CRM114-Status: GOOD (  11.87  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul@pwsan.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Update the git tree URL for drivers for SiFive-related IP blocks to
point to a SiFive-managed URL.

Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3318f30903b2..b48686f02516 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13623,7 +13623,7 @@ F:	drivers/media/mmc/siano/
 SIFIVE DRIVERS
 M:	Palmer Dabbelt <palmer@sifive.com>
 L:	linux-riscv@lists.infradead.org
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git
+T:	git git://github.com/sifive/riscv-linux.git
 S:	Supported
 K:	sifive
 N:	sifive
-- 
2.20.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
