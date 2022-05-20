Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040D4C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 12:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyYx4gI9w/aZlqrTXq5llOo/IROSp2Gstqo6PLyjNWY=; b=EAWRNfOeTatVh8
	faZvdCJSOvVzJHqMLc73vau9ZKjf5BEZhdRc5AKTJS/3ipFPkIaHV8DKm0W48YuxmUkVhwrHAH7F5
	qMAPxsbSdYUY6Yw8zOQ/h+mg1Z9iZMbFa2aob+8tdC78wHTxQxlPO/iupYOUV9FDn1IhRXqqzEDzO
	CF0IYFyQ82wu0FtbzK9HQkFzzYfsU8Tn/YSDlcEettehbCw7VLMFtAaEGmwo1mYGfoDjWdfbbn5vx
	CU7ONnckkQ/xcaqlW+nfDhvgvUQXKtb6C7kpNY46FgwBy3qhyD0Bv4+zT2knhLwdpBvn/6IS6ljqJ
	GaPXBFXLEJK/BvhNFgAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns1LD-00CDz1-Md; Fri, 20 May 2022 12:02:47 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns1LA-00CDxD-V6
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 12:02:46 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 046433F1CB
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 12:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1653048162;
 bh=inh+fWbIr/Bd67tkllRc1lC2WFfhluEbQ0iFzzDcLrU=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=s9DCpMa7+W0aG582djOY0dvYB3T+is522cwUkgo+1mVOV9/tYcanLXw00plsdJ7Yr
 8Jr7ThyQzoXOu9pQVY+IKwc8EbnnvOiWQ3pIydtH7duNr6eUd5X7Js7WPIi81h7yAf
 GzyWGCQh5GuopAqNefq75xGuTn+X3zNqcRDKFR9rtMVKx662DLFZvtAau7n2UBYha6
 YtKvg77pgtI3FOyP8qmcEbqoNzEFjNpzCSTsRpGrzZCjmlhYPwMHLRN3Oy2QJK2++a
 g2xnIVBkg9E58cDi1/ZNZvQgNjIqloneUdQnfDDoS/E8dBnC/obwEvn0uYfF6kvl8i
 kddcjoOs/1MIw==
Received: by mail-ed1-f71.google.com with SMTP id
 n12-20020aa7c44c000000b0042ab2159b3eso5557987edr.8
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 05:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=inh+fWbIr/Bd67tkllRc1lC2WFfhluEbQ0iFzzDcLrU=;
 b=ixBjO9NVNZKGx34LDeUbtX8HWEjohzr6SLQtcGaylUXfj9lHq8NXP8Gdl/Lnd0DtbP
 CFn8siZVshYCfJZkTep+sy9elam9lDwIsx4wLwHYUkD0RWg+qoCBAA7Z7QW8misz3Bvb
 ZHJ0jws1I4MaMGGJZFKm9yJglX952+6c4wQk3JD8B5WWxR+Tk7kXSDodLf3Gp26eVUr7
 nTH+0sJNn+iHAt+Iti0fjp4EqH1jk0+mAjXml6QqfRWSVg/P5Z9Q7LGDlef7+i/ZsuS7
 rfhT/3nHoLCB9YPvvkGHLLk+dRPvFSwvmfkRE/Ynu9H1KuRbedU7fWkWwXIt4opbicUO
 e9GQ==
X-Gm-Message-State: AOAM530LOKhqs3baNyK1rBxMpwn+vsHDbEpwWPwGlf/zTHeJgTMjIMLe
 3qTWcBiYadLJdbxdYzHb0UQoaSxzBg7rEyb3cK23OvizOO2AMlaSpFhyhwJacQg/9dYFp+SD14+
 OHlBgRaGJ8+An4zQM2ppdR+kwYOrUxrgqi63TGxmBntVj0w==
X-Received: by 2002:a17:907:6287:b0:6e1:6ac:c769 with SMTP id
 nd7-20020a170907628700b006e106acc769mr8584193ejc.388.1653048159823; 
 Fri, 20 May 2022 05:02:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLo7j6dIaDOh3PNDbQKIoRVWD3XVgyw32vGanJTzDPhngStWix2JFCu4iM6l3wsA+bjA2SFw==
X-Received: by 2002:a17:907:6287:b0:6e1:6ac:c769 with SMTP id
 nd7-20020a170907628700b006e106acc769mr8584173ejc.388.1653048159593; 
 Fri, 20 May 2022 05:02:39 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
 by smtp.gmail.com with ESMTPSA id
 fg22-20020a1709069c5600b006feb002a620sm560042ejc.1.2022.05.20.05.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 05:02:39 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH 3/3] riscv: Kconfig.socs: Add comments
Date: Fri, 20 May 2022 14:02:32 +0200
Message-Id: <20220520120232.148310-4-juergh@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520120232.148310-1-juergh@canonical.com>
References: <20220520120232.148310-1-juergh@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_050245_244979_43B528A5 
X-CRM114-Status: GOOD (  11.11  )
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

Add trailing comments to endif and endmenu statements for better
readability.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 arch/riscv/Kconfig.socs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index f6ef358d8a2c..c831609db249 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -79,6 +79,6 @@ config SOC_CANAAN_K210_DTB_SOURCE
 	  for the DTS file that will be used to produce the DTB linked into the
 	  kernel.
 
-endif
+endif # SOC_CANAAN
 
-endmenu
+endmenu # "SoC selection"
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
