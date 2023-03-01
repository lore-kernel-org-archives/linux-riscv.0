Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C93C64EC7
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 00:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NHFV+1ypgy4EtHWRvdGVZPF5T+6lkM5qwhKyju8/b4Y=; b=gSkBraDj06Usmn
	iUiybp6o6CLGJL2czPi/lYkYOyRjk2jbx9dHs4xy3f+iygtp8jfB/DpNzgqKvHiDjM6+hqCxvjKQC
	Kk1rEVsJSfksHndP8+J7eHDKkM6YShufMls7u7k0HzLrIJ1JjNAMGzzvZlgZN6lERgR6vq+bAiP3/
	Kl0AJM694VEGIek3LDrBw/2VNHAB2puHZO5pEjrgA5ni/lpdFb3jRNg6cQbsZvVolKZxFFIJynGgH
	BkKUZU9o2lwFx5E+9Wm17neWH7RM3vF5M3me6E6VfqcYwfVsVwGMUyC8qlDzzlzP3lx9ZPblzSTcr
	xmbfITUEgoE8u2ExMITw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXAJJ-00EeDl-GD; Wed, 01 Mar 2023 00:27:09 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXAJE-00EeBJ-Jb
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 00:27:05 +0000
Received: by mail-qt1-x836.google.com with SMTP id z6so12723865qtv.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 16:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677630422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ah2e83PDoe/U6Gf57zepbByTh0n9RNpGO3gN23MY0Ho=;
        b=Cjy/nNRu165SghzyRoqBtp+mon81oWgIkg4ZrARfae2E9Rsz8v/brGam+WmHVCrGm2
         EJUFWKIkQnPjCIaJhSD3M9cWgX4rHCi9bdnX22p2poLAQyjNF6ayxZHO2a6bWB+6/uL9
         vFcUd1bOjeoR07sXMzjbVsONZDxMQSC6t8rI7qaKrXNulpyuyU0TWec4hlrhRB7TF12X
         NA/FZ+SvEA4uc1PklvT1POYrJ7bHPsBVAbfMsX2JkVP1tX8YwzePyfLbkuPpcZCb02f2
         DvBphTVSgrLmolfoO4XAwdZ2o1VW68ULKkmOaSTw2Eyu8Qr5h5v8m4Qeus2AE10sERpl
         m3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677630422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ah2e83PDoe/U6Gf57zepbByTh0n9RNpGO3gN23MY0Ho=;
        b=v2fYZ7RiWkMaRUGdtiolxOyf3YsblmjOyXRtQGb/G+dkR0FdAEHyh668mxUK6iAJ50
         MGsAKBJ8N4kcm996GhBfAVTvrjAAK6X2RIl28O2F7y2xk1V9wYWHk7S3/xXwGx6YNH9Y
         0QfBi3iK8i/KegSO4S5SCmr7sSXu0VePg7aQjjKAq6NqaZq7Wrosb3e86Fe+MdXjCRj2
         xjFrCAO3EfNiXdBOVu6XL49y+54iVe8DcRUR8SpT5XlBekyVQ88RrmHH3llZFhUjwb5Q
         8SQwHSNjgw2qfCMqkER5JCjMjBmGrn6IZFynDdZ0GHPr5fnSXZC5OEF3/Jx/07FrJ2QZ
         /v6w==
X-Gm-Message-State: AO0yUKVAw0QJ9ZmWqhT6/mYf3W7Wi1Wz75uSC7CCMZrQTFumIDghZdNi
	MMm9w026PZvscKjrv6tlgT/840ZvEz4=
X-Google-Smtp-Source: AK7set9iiLqJtrwPOOeLikPIZrT4VRpY2Bg6vQXeyHliiddZ31/ha/5MTwNUlgvr+61QjoyKXtwnIw==
X-Received: by 2002:a05:622a:2c9:b0:3bd:155c:3ac8 with SMTP id a9-20020a05622a02c900b003bd155c3ac8mr8147019qtx.67.1677630422226;
        Tue, 28 Feb 2023 16:27:02 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
        by smtp.gmail.com with ESMTPSA id t8-20020ac85888000000b003bb8c60cdf1sm7576698qta.78.2023.02.28.16.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 16:27:01 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Yimin Gu <ustcymgu@gmail.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v3 3/3] riscv: configs: Add nommu PHONY defconfig for RV32
Date: Tue, 28 Feb 2023 19:26:57 -0500
Message-Id: <20230301002657.352637-4-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_162704_661599_B6F9CAF0 
X-CRM114-Status: GOOD (  10.30  )
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

32bit risc-v can be configured to run without MMU. Introduce
rv32_nommu_virt_defconfig .PHONY target, that is based on
nommu_virt_defconfig. This is similar to how rv32_defconfig
is based on "defconfig".

Suggested-by: Conor Dooley <conor@kernel.org>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Cc: Yimin Gu <ustcymgu@gmail.com>
---
V1->V2:
 - Fix typo in commit title
V2->V3:
 - Change from defconfig file to a PHONY config
---
 arch/riscv/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 6203c3378922..1b276f62f22b 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -174,3 +174,7 @@ rv64_randconfig:
 PHONY += rv32_defconfig
 rv32_defconfig:
 	$(Q)$(MAKE) -f $(srctree)/Makefile defconfig 32-bit.config
+
+PHONY += rv32_nommu_virt_defconfig
+rv32_nommu_virt_defconfig:
+	$(Q)$(MAKE) -f $(srctree)/Makefile nommu_virt_defconfig 32-bit.config
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
