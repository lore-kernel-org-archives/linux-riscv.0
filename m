Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7751ECAAD1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 04:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBewGTy4OM826OrlD8xL7kJmwzGN9N70oSvCyzqnMK0=; b=k4Sa5liWb826F9
	/rAOzaayN7MMLrUee+uki3u7X+AwYESlBXiQJY/08er0zAAXmNoEVH8M7asdNwvBkzng7BzIbQoep
	y43/W/2Wk7bC1v2uWCTpXn8oLs1h7stkoP+KouBnWDccEdCC5Xnv0LOLBuF6hA16oaM2/H6jZeSjD
	VqAbAwqGGDFGXAv4cBMi4zAnwYBE9qswCyeYpBUtmjP3bUp8y/S1csLrOKdMdEtzzsBwYwohwy2vA
	CkxBkHoeV/38kCG4gl8KzIzpgvsgd6iPfj220YJ58SvWBdf11k4e3V2LqDTTPtY6gEYN53+bAXgVk
	pcdNPS0FOa7agn+F5/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oStAM-00E3uY-Tz; Tue, 30 Aug 2022 04:47:59 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oStAD-00E3pW-1S
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 04:47:50 +0000
Received: by mail-pj1-x1035.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so6305770pjq.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 21:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Z/mBY2jgNDkWQ3lEWcoeCOwOWescKqJwUlwqGO5KuJY=;
        b=lcMsqLdRZBsh1/gE+Om6+9NNv+3cxCzdFy+52mewdqx7Myu1GG270U5wm/uWxmaAuB
         bWUyMzYKZgd6KlAwoDeIWNg/ySRIt9WJLvEfij3ceJRNNf6FJDFc6jKyvi32loU214Kd
         IIp/l3Knw5x7Ah35ABT0IwTSW/liiduLwdAAXtja8YQkgP/Cf3cuYnSsJkC4cnA3ZNXT
         7ddhs9HdHwOrX6T6yvjR7DbXmj74a7o3JiqyOxf/GBJinx6X49Hl3/sPm9ZtcqrOoAZQ
         +g/+qaQORJ5sxzPgivFlwGU5UnqGYennizwRUcSB+4xjsRr5yb9H/LGB/qd7HqiM4Gfj
         oLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Z/mBY2jgNDkWQ3lEWcoeCOwOWescKqJwUlwqGO5KuJY=;
        b=u6nmznmrBeW5pftpeoH5EvLfeHrX351Fo2T5SiNXtV4GqZbEu2Qy3WwvU4Zh4p8RLH
         BBqpij06LFlTNSZeMkD7solmMRjLMs8IigEqUJUwHykh4YJX92HR0+rapXx6gn8mcEQU
         x1aUxlFWVkMRdlB3PUnOV7VRJYIHj2Yy1EMK25vecFD3W2HS6DUx9VUGBolMjqlWcf7N
         +m2r1Cg+gLyHRpV5RlMgynmmyYImBJPO9vWiWeStPC1eNLNN+QHo/aeADJJL0MsbenFF
         8JMFE0HVZ64BxrXAe8Hv1cpP1hKyxbXNaw0oF35P1vFrrvlhMOC3H3KAUIG7aI2Cb4sX
         efTw==
X-Gm-Message-State: ACgBeo2wtDmkfXIgdhZyNODudB8AcN+/DYLFKp+GG3bxfn+n0AIZprrF
	WxXcmi602e2a3hXeo2lPLUqCJA==
X-Google-Smtp-Source: AA6agR6XrkfmOxoBKob/nJpRXtmL+AzNaaiMBZH+BzRQYeIJ3CiaTKVwkXr2+cFUppJYxY/R+NLzhA==
X-Received: by 2002:a17:90b:4a82:b0:1fd:9c58:daff with SMTP id lp2-20020a17090b4a8200b001fd9c58daffmr13582124pjb.48.1661834865182;
        Mon, 29 Aug 2022 21:47:45 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.81.23])
        by smtp.gmail.com with ESMTPSA id y27-20020a634b1b000000b0041cd5ddde6fsm592240pga.76.2022.08.29.21.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 21:47:44 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH v2 4/4] RISC-V: Enable PMEM drivers
Date: Tue, 30 Aug 2022 10:16:42 +0530
Message-Id: <20220830044642.566769-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220830044642.566769-1-apatel@ventanamicro.com>
References: <20220830044642.566769-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_214749_110714_D9ABE587 
X-CRM114-Status: UNSURE (   7.16  )
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

We now have PMEM arch support available in RISC-V kernel so let us
enable relevant drivers in defconfig.

Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index aed332a9d4ea..010b673ebd11 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -159,6 +159,7 @@ CONFIG_VIRTIO_MMIO=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
+CONFIG_LIBNVDIMM=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_EXT4_FS_SECURITY=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
