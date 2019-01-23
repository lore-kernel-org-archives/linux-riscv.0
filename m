Return-Path: <SRS0=FsxO=P7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D0BC282C0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Jan 2019 22:50:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2B862184C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Jan 2019 22:50:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FXU/R8u4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="aElOB8uh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2B862184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9vIdq+QO30KW2mBTe/WngRIpg6r5fPnBhGTBQUlfPw=; b=FXU/R8u4ssC4XH
	byPzL2nYPnXtPQ7ccbji3+sLriHer9kKCnbUA4W0tAmUax2XrrAv8m7QBZucYQw3qYnNJfUfqrft+
	2XZQerRB7NgCYY84g9l12XBgjIf/DcxniZtiNMfRk8ATG4aHfjwT63hLFcYmtsgaOPL5MTRAYQMJ2
	qotM56vLE/a9kYZbIzr0L65yeYnVmsF0ZaGiCJzQWEcTxvf+3DkTPAngyBVXbT90kPG2WPIPJJtvJ
	WJnSFNYBKpkDQ0JBcQnqNZerb4l12UVPnqNablUH8TdectIGnwa0TTT+7hga3SkC/egstdYhIRjR1
	lNXVSETr8vI4c5J+wzQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmRM1-0003fX-U8; Wed, 23 Jan 2019 22:50:41 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmRLw-0003d9-VP
 for linux-riscv@lists.infradead.org; Wed, 23 Jan 2019 22:50:38 +0000
Received: by mail-pg1-x544.google.com with SMTP id w6so1742223pgl.6
 for <linux-riscv@lists.infradead.org>; Wed, 23 Jan 2019 14:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:cc:from:to;
 bh=05Qbg7pbxQDm/HDDvgjlbqm0+RCw61jilyLYrNwSmNU=;
 b=aElOB8uhkum/wA1lCxLnHJFe8VSGlGpqSXUBibdUYrK5TexwmZVL2+hfhPnpXKOJ4b
 LaIKfIxPFUbv3wOuAteSn5HpJ8jiVv0k4zVumuV7LIVKaWMIu0QDr8pkv3cjsXDI8ihW
 5LiAYYHectQ8kX5NIh2CauZ55HNw/jSVfMwyDW5SFdIOSrUPtibPkDFZXfSwRZN/VguE
 dg5xPQZV1TJh8CY/ew4Fsi4FjA52JWrUI3qm2nWH9YX3uvPKttdIOPTW6yP9h/JrAUj+
 Vq+QFK6JmU4AEbtdTAD2Oh5b46KGS39iwKgMU09JQ5uxqajYtg2OUBas2aspLrqgvogl
 IKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :cc:from:to;
 bh=05Qbg7pbxQDm/HDDvgjlbqm0+RCw61jilyLYrNwSmNU=;
 b=amPiyLMzeS8ONKxS8Jf1RCKqsZX2bITh/WLONzR8QtQD4EASXuWidwOKpC1Mi0xd74
 vkkkC16H2nOzzCX869xJ8Rkbw9hbLrri250Am9bemCbSGfXtdpEglAt+FwpWA09elDmE
 6b41IF49IJ/BGfVn0KmQvZY8h+ErdMPeGJFJP0WB5UYgvQjJGGf14j3+dBVDMrvTvSde
 KyPD4+jzKmW4B7VKolRlItwGbqZGq6eOlwu/VGjP6doTCWM0O2LmY21Hs96Zjwghd6jV
 DWx36tuqGFNXi2IAt4eB+VE/q7M0ij8KubZvuPL/o2Q5RyJoWwiKBoaAHnPQCFx5FSJL
 c0lg==
X-Gm-Message-State: AJcUukcIOjOBg2fzF2fp8cSuCZLUsTFxhE89et5kqqZKhfSn9jQRjva3
 g7lBysrPoIa74uncLBB6tL8fXA==
X-Google-Smtp-Source: ALg8bN5Ckjn4EEJJ3lTq/bg04TIy//Y4NgZyf/8wFKFF2ECbDnTADv3vNYz0ojtwzt06rN3HPH2XYg==
X-Received: by 2002:a63:c10f:: with SMTP id w15mr3692099pgf.199.1548283836404; 
 Wed, 23 Jan 2019 14:50:36 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id n22sm42698260pfh.166.2019.01.23.14.50.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Jan 2019 14:50:35 -0800 (PST)
Subject: [PATCH 1/3] RISC-V: defconfig: Move CONFIG_PCI{,E_XILINX}
Date: Wed, 23 Jan 2019 14:50:23 -0800
Message-Id: <20190123225025.32052-2-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190123225025.32052-1-palmer@sifive.com>
References: <20190123225025.32052-1-palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_145037_007731_63F65A6C 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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
Cc: Palmer Dabbelt <palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

eb01d42a7778 ("PCI: consolidate PCI config entry in drivers/pci")
reorganized the PCI-related Kconfig entries and resulted in a diff in
our defconfig.  This simply removes the diff.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/configs/defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index f399659d3b8d..658be23fa2c6 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -13,8 +13,6 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_BPF_SYSCALL=y
 CONFIG_SMP=y
-CONFIG_PCI=y
-CONFIG_PCIE_XILINX=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_NET=y
@@ -28,6 +26,8 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_IP_PNP_RARP=y
 CONFIG_NETLINK_DIAG=y
+CONFIG_PCI=y
+CONFIG_PCIE_XILINX=y
 CONFIG_DEVTMPFS=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_VIRTIO_BLK=y
-- 
2.18.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
