Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B98C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 12:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yY4lfs4kjiFWTUNhEuHJi24R7hUxwP0wkV1ELD51lEY=; b=fwJqhnaVrkeAPe
	jQNKzspXJ9EDNck3esaXW0b9U4fQWXf/dJZqouCJggGkD3j4CCaGki21v+1DmchkRkD+IpM37h3rl
	rcYRMMdoa5Og7I2g70sJb/+GvilRy+VrpdKbar9fnBNlzsbNPR8uAH7BS7KKssJLyLMWeRPomG1Kg
	FN5ZEVy65BJdJc2L5KzAQ4c0EwXKoIoGT3BdGBG3/u/FG81D0RWfaGt5BBW9YBWrbNGmUFGfi2aB1
	R2FioQ7tufDi6pEXH2PueoWViTM0kNTXY9W6bKdcxg4KY4q7k5CfVo0OGxrah2QGuMNjZArDCZjNq
	742ZvTFDlNWzEUxF9Lbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns1LF-00CDzk-De; Fri, 20 May 2022 12:02:49 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns1LA-00CDwr-V5
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 12:02:46 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8F8273F1F7
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 12:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1653048161;
 bh=oneXHGbxDyPUqhu0E+ANdS66+PnEgAp2RBrt57urwwg=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=TGgKAwCLHOpdmVkoI6EQdrf5obMRnBja+loSSRvdNi6ZKWkho4Ljx8jX2dteK9b3/
 XCW949/+CJGgpRtbznF+omdhTHXQfnJqhz14uo80NGV/1TOPJ+JH0dX2PbaR6If1yl
 ewJW9TBCQP+3xsp+AdTc/LVVL4pda+vJVVEMcnX8eFQFgJPay9CAKrwAotmnWVCXAZ
 piJy1vpfx2bqUlw3XZRAKjxaMM/cyB/oy/hpx+Oe6WGURQSf5gc5nBh7Bs55vqg4WE
 iX3O28eqDctDb0jxK4w5O/Fz8wcvUV7q2ifr5XeR33khNCd3qx2/0I7dfI7vXhSAQJ
 13bStg1wemssg==
Received: by mail-ed1-f72.google.com with SMTP id
 w23-20020aa7da57000000b0042acd76347bso5529290eds.2
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 05:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oneXHGbxDyPUqhu0E+ANdS66+PnEgAp2RBrt57urwwg=;
 b=K8JL51joPNg2NxUp5rfqpNdt5RqbacRflwTkt/0rjbQz7MhajhZUt8o2YuFVohZmfA
 xhDzF9HMYlv0CxtUAgkupLqyl/OWn8piDeuNMFjVPGXASHCgv6MptdqmGUW1TyGZ+oWN
 9eSkNw8qICD99RSa9jQfrJOpiUdjckA+aMIShJF33p/iyjzebi0X1nwyh6mCWTAzpx7E
 IZ8TgRN5wZSAm2oCRV38fgWMo8i0peCD2M0mwRQ4RHK7DOQonUFE+n9Gt61T5MmUuF97
 z+EB56/ZlC7LikjillB+fFwQT/u1yix6a96XBRCWTuiCICN39KguJWZNfEfpHbDVDM/Z
 Vrqw==
X-Gm-Message-State: AOAM5307D9S75IC27oM3G0Ptk64FKHFrLD5lVT5v0LIlNUoVLpLvf8An
 14ZtuOgywGrfwqHtvYMKYTqzKsO/m4Mewbzo7Qg5NYEr+5SqxfxgmIhcxNbMzI2B7AOarFohPjf
 1CbbAEvQHw2WYQnXJu5ZKGop1zx0I8FERF8tkW6g3FNhrGg==
X-Received: by 2002:a17:907:8a0e:b0:6f5:a48:e04e with SMTP id
 sc14-20020a1709078a0e00b006f50a48e04emr8604189ejc.228.1653048158769; 
 Fri, 20 May 2022 05:02:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwl4iQHy4x3hKJIbjY6/BiMHJQQQ0n8VKaGxNo2KDCi0CpPKeZC0/C4aiAAVCxc047mxQGVA==
X-Received: by 2002:a17:907:8a0e:b0:6f5:a48:e04e with SMTP id
 sc14-20020a1709078a0e00b006f50a48e04emr8604167ejc.228.1653048158620; 
 Fri, 20 May 2022 05:02:38 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
 by smtp.gmail.com with ESMTPSA id
 fg22-20020a1709069c5600b006feb002a620sm560042ejc.1.2022.05.20.05.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 05:02:38 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH 2/3] riscv: Kconfig.erratas: Add comments
Date: Fri, 20 May 2022 14:02:31 +0200
Message-Id: <20220520120232.148310-3-juergh@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520120232.148310-1-juergh@canonical.com>
References: <20220520120232.148310-1-juergh@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_050245_246537_881AF507 
X-CRM114-Status: GOOD (  10.86  )
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

Add trailing comments to endmenu statements for better readability.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 arch/riscv/Kconfig.erratas | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
index 0aacd7052585..076005c5dad5 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -42,4 +42,4 @@ config ERRATA_SIFIVE_CIP_1200
 
 	  If you don't know what to do here, say "Y".
 
-endmenu
+endmenu # "CPU errata selection"
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
