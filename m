Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE13C83F1A
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 13:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QnIhmXXmXGN4icOr3gp7kJkPlTpyPYsSO71gVD1cdFU=; b=I/8DF2rsXR2uBD
	wO9v4y/Y/5nM+o9EJVk/gRaaLrgTBeAbui8BhTCtcdqp3KETEw2hwwNk1lTuQCl87D0ncwRCkFkJm
	EHO0/PVnmAJvuF7tCOGOK13BcbDBzuX77sGY11NPXLpvqpiOdAuAnYZ+Ur0W1H9iijnN3ghL4aOyi
	JNFMHcYR/jHKTE7QUMq1SSD7gUjmXDiwC/0TunakcNezfMcO8ZkBzUfVLylC+HuwAtlLhoYyn9g3y
	y6Klw/q/U/fWHpm0n5YWgVcchXLlyg/NhIEFg+cA5a6iqzBG8qbm8hSS5H5psAUWl/7jYb3TS7c2V
	fdf+hZkhYC00UCCAdT3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZDe-00000004zjg-2aJ8;
	Wed, 23 Jul 2025 13:09:14 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYnl-00000004vz8-48pR
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 12:42:31 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4561607166aso51654985e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 23 Jul 2025 05:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753274547; x=1753879347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4veeSt022yF8JfTtf9KGz2ZcsYPnUB3umlBs+pcOABk=;
        b=tU3cAAC3t7LCg+0JuussQ8zrzEFwcrO3ew7+nVv5CDZmrqeDUSLK5qKn4EVxR07ZYs
         nZghC1DJyN0vIg3JGzJxU7U9L/SLHxGoWOMGNJLoTOEBIRL4Q0D3DqGaQVGQsXjR7cwU
         9ks+aPJ7mXGkrjqp/cevgHzEjwnzbLBXFg69KaxRD1QWwId+QjSSKn7qfva5CUYOY+nE
         saxu6FXoS+gvo0VPRtHioyTyAH2KRD2oU5+nAxv/xxokiXLlLoAKNPduERw7A119CCNh
         iD3rujpbYhbAS9wl1Nbmgjhx9EwkOpjSniXqnVaiowpuEhM32fY6iWUYa/i5ORNasJya
         1wIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753274547; x=1753879347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4veeSt022yF8JfTtf9KGz2ZcsYPnUB3umlBs+pcOABk=;
        b=A6dretOUt5RiexAJSK4KZHyYMjJMB4+0kHLd3QrkaYTZ8S2hPfcnELHd+E4XZusgOW
         YCuvwmxDOkLMLvMfws800fkK7hczsLAPUmPKm7yB1/L9MZUob8XZVIxVJ4BpbJ1NrdWu
         Ylp3anV33CW7yXqZgFStjMMySbJUQGcwNMpTtOvyYp+Lno2O+wDYn70EoLe1si+xtsjM
         eN05gSSgaaeAdeilwz/CC9Yxli8CwzpfWCdcBkOFufYwetvWbXO1k0Tb0ruB7zrpkbie
         2lLn6aga+3hX9nx0iAto2H0OHazeNOjp/8WzBt5Pu3ZYiEV3BA1xJN2Ejaw1gK6X5X3i
         1cdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJnXbFH1+FkXR8ZB6WoN8ap7i6ArQw+exJEABlWyjYWN14tdKTvuA7NitxsgEUNAytrghOjq718LOi+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZpC8UzNRQ73c663wVtJB6E5IVbhFq/sFnJU1LftlmJ+QO98Yz
	tV9rcNJVpkNx2MXtxoqd4seFX8swaIzpXI3gSChXq7UXIQacQeNICgoaehEaw1TvUTQ=
X-Gm-Gg: ASbGncu8hKB18q7UUe889lwnv89ftgFwuhku7wMSxhwUcpIGrr4oaYV105afvs/jo43
	cK8u8uGdFDpmTzA0XCDOnmUKKBmnegEC2wSKBVYGF0x/ZixO/XU1lWJBrPgF7l3932l49SN4KuU
	cTS7g63cbtRsie6OJKkp8Yznv/GzK6EVdxFRIe7kRo4SiaJcwHzzJ5tzR2zJ+Exz6EUrxeaavWi
	uynaOYJ4xFQllhOLRAfBUYqttm9MN+Qd/X3GyEhsIhWp7MPxIhpvkCt+zbhB3dkQcM6ehlL7ko9
	EnM5sgfivfQL4FmfaWWqhWs9sj18D4ELyMUXFA4sCAHFzIszEKzK5wqWGNrscFmsjnWbrUUlKHC
	VkOZjAzbpLtiUcPOeEWCvRkUSa7/JqJGDp8LDqeje7jE95USgWw==
X-Google-Smtp-Source: AGHT+IGbJ4sHUsE4vetWaUrzV0GCHvxK9m7lFsG6KCeg9nkDSwfu/KGJ+XeTwbxg+UQe31rImyB2lg==
X-Received: by 2002:a05:600c:4e47:b0:456:1560:7c5f with SMTP id 5b1f17b1804b1-45868c9d3c0mr26871425e9.14.1753274547109;
        Wed, 23 Jul 2025 05:42:27 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:7fcb:5e01:8f11:1009])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458693ab0besm22035165e9.36.2025.07.23.05.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 05:42:26 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: sboyd@kernel.org,
	dlan@gentoo.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] clk: spacemit: fix resource leak in spacemit_ccu_reset_register
Date: Wed, 23 Jul 2025 14:40:20 +0200
Message-ID: <20250723124020.60897-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_054230_137248_FF974944 
X-CRM114-Status: GOOD (  10.69  )
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

The function spacemit_ccu_reset_register() allocates memory for an
auxiliary device. If auxiliary_device_add() fails, it skips cleanup of
these resources, resulting in leaks.

Fix this by using the appropriate error handling path.

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
---
 drivers/clk/spacemit/ccu-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 65e6de030717..5bb85e32c6cf 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1059,7 +1059,7 @@ static int spacemit_ccu_reset_register(struct device *dev,
 	ret = auxiliary_device_add(adev);
 	if (ret) {
 		auxiliary_device_uninit(adev);
-		return ret;
+		goto err_free_aux_id;
 	}
 
 	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
