Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB14C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 21:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H3YDammYBdCDISmeKKCHyeMmMOUT0r69R/AsMks8PDw=; b=yhKq87rUW4QIcB
	NDY+kR2cHdbY2niD2r8+oHG+H2k/QjjjTPfPhhtHUHc6KdP9EwjieN4K+I3yhIbouhigMDSWs8r2Z
	l49xdcsI1JGWM/sKF+Za83rriDjIMQbrrcQi4Zg+WrV5mxRM/Ad75ZIKN4pcH88hDwlkxBwtHQUUs
	YPSRy5cdun4sQbJoSsOS0d5+MNgA5FJW+TDzJfnqAONAkeml+XW5qUJIY3CYdZubQvznxNYXNblT5
	owAUoSS0FgAI6TbAZ8lSYELKaLHCHRVjHTjme5IEi3ZiPKOGOnARSZ9gmGyuqbmHKXRPxEaisNiPL
	L2ueQ1UpLJB4xEowO6ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj64t-00D0Z9-Oa; Thu, 13 Oct 2022 21:49:19 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj64n-00D0X8-Mr
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 21:49:15 +0000
Received: by mail-pl1-x635.google.com with SMTP id b2so3012805plc.7
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 14:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=5x+e0kGznGYIc1lBTxzEAmXIbJeWo1iHQIPY8fnLHag=;
        b=0mBWLYAlyeQZAzYd9aLsjmDwL6zq0liKCzyVZwNRMKGuBMrLp/Ck9erOLWmXKdbhYD
         ols/nGEA7H58zzk9c5eV8TzNlsz8P4n1E5/Rbz/uSgeTlOmNkaFd3k7xh7bLaPaloSLS
         o57Msr1XadL9E8Fd/kzSCKiHWG1SB/57HlfCZ8I+I5j/5Mh6aeCfiiZ3g7Nlrb5qDjyM
         w0+IJ3F2HQt9Mx1tjrn0JBRjg6R63oSnpI3Fc/+CIzsvHuFF1oJm8EgyTQFeL24D8CPh
         iFM4VguN15D6bW+2Pl0xsQpIMd+Sp9sRh1lvMPIGmMlvP3Lm1R1EscAYsgcIh3Qey18c
         snwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5x+e0kGznGYIc1lBTxzEAmXIbJeWo1iHQIPY8fnLHag=;
        b=L/SI1JeO3OeNbxj3HLuvkLV4xNHIfOFb9vM8WHesF1gD1EntKWin8RptX8J4xwVrXC
         1KReOlAYdMEFX1YZi6hnZrKEV0jHj2UnqhEK1YIOx/oqiUshzJFV1Z8zIQCqkkvHpaOW
         k4kRku+yQeQneRKDxO0EGiNvkvkyAAv8M8pWdDar/6HskuY8jZBSI6cSdTq2X+XyVeYw
         G02FVunP6/VRmvxlhVEZW0H3D5i2xVVise1VA9IJ3NxH5c9Hcphufhp43d6NmzJ10CnN
         37nZr6iu6K4f0kxRku2B94TRsWO5EQ0BlCrffgRKSQ6j3ary9CCM8Oz1tD0SURWcGUy+
         5IvQ==
X-Gm-Message-State: ACrzQf3DOAijP2r07G+XVf36G1HZHG6whtONr/mJqAitvxmjS/IFVCgM
	D8GJd5SHLdnnrn65gPsUfRVSjA==
X-Google-Smtp-Source: AMsMyM4zLbXgFjIuDY268Sco/RrtUbMjJZOAo4Ghadn1zxYD4ESurYvRL+wj010yF8IvrczajpTF4g==
X-Received: by 2002:a17:902:820b:b0:185:b9a:8ac1 with SMTP id x11-20020a170902820b00b001850b9a8ac1mr1948346pln.111.1665697751971;
        Thu, 13 Oct 2022 14:49:11 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l4-20020a170902d04400b00176a6ba5969sm314528pll.98.2022.10.13.14.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 14:49:11 -0700 (PDT)
Subject: [PATCH] MAINTAINERS: git://github -> https://github.com for kvm-riscv
Date: Thu, 13 Oct 2022 14:46:38 -0700
Message-Id: <20221013214638.30974-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
  Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: anup@brainfault.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
  linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_144913_754375_CE1B6CF0 
X-CRM114-Status: GOOD (  11.37  )
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

Github deprecated the git:// links about a year ago, so let's move to
the https:// URLs instead.

Reported-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://github.blog/2021-09-01-improving-git-protocol-security-github/
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
I've split these up by github username so folks can take them
independently, as some of these repos have been renamed at github and
thus need more than just a sed to fix them.
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9a47bd58a330..d103b44fb40c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11156,7 +11156,7 @@ L:	kvm@vger.kernel.org
 L:	kvm-riscv@lists.infradead.org
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
-T:	git git://github.com/kvm-riscv/linux.git
+T:	git https://github.com/kvm-riscv/linux.git
 F:	arch/riscv/include/asm/kvm*
 F:	arch/riscv/include/uapi/asm/kvm*
 F:	arch/riscv/kvm/
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
