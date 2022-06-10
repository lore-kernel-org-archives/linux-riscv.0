Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD652C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 07:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GsobyLfELQzAYFgkAzGWERXTFtRs+/M5ragCk04hLgU=; b=mLZAoRYTeRPWCM
	2EBKL3Tw8kh43HwTICrPy/TuKzaHjXDOEXPkQ+ngz6ui1SSfaUuHmExdkTU10i4YN16btsD3A3nPZ
	0Wx8PPA5rYqiYqk4GPLFB3ye+JsCCnpAzeybnCnW33EciZaDpAxvx4LiNzsp0zlBEsdq9XLUJJxir
	MZ5zY3Wrkfbz+/b6KuQ3xIHIpPmAhpOaKy0PXjLRurt5ICkjEAkrwR7OeHt7/mqvhyhAjdvpaImlK
	FSHcV72o5xAXYdb8VRTcrb7zuPbFBr6CjZlmLYxYIkTYEqVh8HotOsIDaRi7Up49YYe1GykCc1UwD
	ZfNaDiHrml5OkfUH4uJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzZNS-006YKK-8f; Fri, 10 Jun 2022 07:48:18 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzZNQ-006YJV-4K
	for linux-riscv@lists.infradead.org; Fri, 10 Jun 2022 07:48:17 +0000
Received: by mail-pj1-x1030.google.com with SMTP id j7so23370529pjn.4
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jun 2022 00:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ri9yPZe+t7UbMEFaU4OG0A4/vjYvLt9KG3tOXTl2Knw=;
        b=AxuJJpIZvDDdQAcCIZOe9JBBN78j+7RQpIKz9sDv6nsruezNmnTog2aRo4esz7Itke
         LvZ/4aLSa4+7OtMeytrpEofyyC8DcG2iF8VmcLeEbCNYJg6AKmUOlC0QBuialO4dysfF
         +1XONlAYf1xbgPxVriX7TPfPZJRARMNQRmV+zGtcHngR7+5Gj3M4/ovi7X+3QczPC2aZ
         2kWsnsmNiBSlmoljiR4oiLprp73uImwKxPxfwE8nxrlkuA2sMJf9o8a8IW3n5TdCeohd
         /RlTa9/lisWyGaKdn7yFE74aEodSwdfs4SQgdv1Wph/b4vCRki4G34kKZEvwLPvDQ9AC
         2+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ri9yPZe+t7UbMEFaU4OG0A4/vjYvLt9KG3tOXTl2Knw=;
        b=GcAvTFDag/grjkhxMRCEeEOM3NmSAmPqEDUXnenzGsCPWaNgzmvNXPzINAR7o4eqWH
         GduzHxhZ7hiX1Ms4hq7g5uNDA+GUzWCvoBGUhopxwYVHYT338gR1Q3ZhH9qutzExLby0
         DWCGvdTTYtdjENXNGePGo57FeKqaeA45Rk2QC3K2IvHif3mDpgTbzbVS0R8N6k2taIIU
         eoNspc6P/G6YZcmrbWeP/awbj0dJP+vRtJXD8GGattzUUaZjx7dIcvB1QwbRF3xYqf7r
         6Lt06bRwJ4jY+rKn3wUZhTgYLHakz8LJfYHM8YGihJMC2o0MsgJG6zMy7sburjxT2eYc
         fLKg==
X-Gm-Message-State: AOAM533mZyRV6hQ2bGfMKk37NGglxY48tZ+M/tk56sqVR5ZVJZnqORaZ
	NbTcjaRzYLBAhTWUs4IFc3d3Sw==
X-Google-Smtp-Source: ABdhPJyy1nrV9a+tBwcx2FWnnDsTGWnzuGr9KJ4zlcsxM83a9PcfBuxb7wnpudWaFGaud7qWQw1sVQ==
X-Received: by 2002:a17:90b:17c7:b0:1e8:5136:c32a with SMTP id me7-20020a17090b17c700b001e85136c32amr7556304pjb.43.1654847292748;
        Fri, 10 Jun 2022 00:48:12 -0700 (PDT)
Received: from archlinux.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id r72-20020a632b4b000000b003c14af5060fsm15902394pgr.39.2022.06.10.00.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 00:48:12 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: broonie@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Andy Chiu <andy.chiu@sifive.com>
Subject: [PATCH next 0/1] Add simple PM operations to sifive-spi
Date: Fri, 10 Jun 2022 15:44:58 +0800
Message-Id: <20220610074459.3261383-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_004816_225051_D4240EE0 
X-CRM114-Status: UNSURE (   6.24  )
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

The patch has been tested on Unmatched using pm_test. The Unmatched board
uses SD over SPI and it was tested by initiating S2RAM cycles for all
devices while reading/writing files at the same time. We found no dropped
connection to the card or corrupted filesystem during test cycles.

Andy Chiu (1):
  spi: sifive: add PM callbacks to support suspend/resume

 drivers/spi/spi-sifive.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
