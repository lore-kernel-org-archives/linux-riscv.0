Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4F6C636D3
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 20:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PXtuEqnHDSVXQk94pqKM750IVd3tl8R7WuC9M0Yrims=; b=R3fCsG5JRvNcSc
	arLC35pTFrgXHiGyOW/siosmH3AxmFgfDXyp84ANdAt3qYcqXdZ7VslUJAZe+OJnKLsSghyPhURqD
	NLh7MYAyNFcxiE9Hwxb0Sh+HA+b5NgQsYQ1dN4p4AJW7C07VnJlfKX1v8xqqqpZF0ieU7xVqp15HA
	CphRnk3LBb9DRr79kUmNglGkY5fB5raXrMktCTH2szbOb8y2qJ5++mqz8cYm+/0nRXHLHvpzJ9G0x
	VMaOrtmkqsdqpwxwM+syhufglwJyfKQajLHO7TOyTt8pm//UXU9cBj5yG6bE1c6AKGES886hOFnHA
	Fpj2jZYoTDYGew+ZN/qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRJNX-00CJVd-1u; Sun, 12 Feb 2023 20:55:19 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRJNP-00CJTG-VT
	for linux-riscv@lists.infradead.org; Sun, 12 Feb 2023 20:55:13 +0000
Received: by mail-qt1-x82f.google.com with SMTP id m12so11944232qth.4
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 12:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvWquSrWDihZ0acdWJU0hmpgtyP5vfxrh4ZjBtKv7GY=;
        b=WNWzEb8TKQjRiPhehEQX7DRiF0/Z63jHq43yArV/dBCmlAsI1tKxNiT81JcFwOqny0
         yu+MxWkK0EunFt8gijrANji4vbcteVxEkBlBDwbebRpUOtoaSGAw4PFS507An51wz8yi
         n2rcek9j14B+HNpZDw2q1d6n+bpi3CzPQ/5FSHQif1tg8DkbbP4F/gplofGk8Us7wUZP
         yO7LlAo/6P+ZoYa6POP11pScfnmiLiiIFDDVMQu9HkWKJ3RoV3+hxYBsl7cSXshCNkCx
         jKAychv4pUqiToMrhSVaWoJWboi4U7GtXMLI+pnJ8w18LFWwXPiroigNwc/lZ1ED1dbk
         RhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvWquSrWDihZ0acdWJU0hmpgtyP5vfxrh4ZjBtKv7GY=;
        b=nULkkmvTivplUvC8BQRS3LwfSSwjvFenSgpW2TpL2/SWEJ2bszIfpPQcoGE+SaR2a9
         IZLhC2J+8SuWUlppHh6egvliQPjXx968DQ+bFBEzr5HqQwNxDZw9DZwoKnHY+ZXCMWO/
         xa9Ue2rrjNuNqGvVjsE8ERJCIVZOGHqhHclouvfZCy4g9kZts19MbeE4fTQ8ivpuQZPf
         wl+ISPbz6FHnv6nUrwi94iWRiS0GJJASIFhgNPkFOSBYTNb40bmbvbGnH45Bq/d/SWR9
         btJ7B3IWg+1AWzQWCaPVVckWFBLRY3z+bwfNzfvNL6OJalt8fhUT2az898EXPBjZj29h
         ZeLw==
X-Gm-Message-State: AO0yUKXzc/D7MyG3fP4wEqSWTQ/U6yZiuzA/4LZgmMXZgGnNlb22h6UH
	sKoYS7Po0dZ0GDmichlPVVGl23jzy/P9QA==
X-Google-Smtp-Source: AK7set/xtp4Wf2aA37Exq3ClOp0kX71cmUo1VJxyVPprCWafZdvKJIGxNGYF41HOd0BCPxlMuXvyWg==
X-Received: by 2002:ac8:5cca:0:b0:3ab:ceb9:10fd with SMTP id s10-20020ac85cca000000b003abceb910fdmr40007531qta.25.1676235310522;
        Sun, 12 Feb 2023 12:55:10 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
        by smtp.gmail.com with ESMTPSA id o62-20020a374141000000b0072ad54e36b2sm8289233qka.93.2023.02.12.12.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 12:55:10 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Yimin Gu <ustcymgu@gmail.com>,
	Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v2 3/3] riscv: configs: Add nommu defconfig for RV32
Date: Sun, 12 Feb 2023 15:55:06 -0500
Message-Id: <20230212205506.1992714-4-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230212205506.1992714-1-Mr.Bossman075@gmail.com>
References: <20230212205506.1992714-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_125512_112999_EEB1B3C4 
X-CRM114-Status: GOOD (  11.14  )
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

32bit risc-v can be configured to run without MMU. This patch adds
an example configuration for RV32 nommu virtual machine.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Cc: Yimin Gu <ustcymgu@gmail.com>
---
 arch/riscv/configs/rv32_nommu_virt_defconfig | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 arch/riscv/configs/rv32_nommu_virt_defconfig

diff --git a/arch/riscv/configs/rv32_nommu_virt_defconfig b/arch/riscv/configs/rv32_nommu_virt_defconfig
new file mode 100644
index 000000000000..460907253a80
--- /dev/null
+++ b/arch/riscv/configs/rv32_nommu_virt_defconfig
@@ -0,0 +1,16 @@
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_MMU is not set
+CONFIG_COMPAT_32BIT_TIME=y
+CONFIG_SOC_VIRT=y
+CONFIG_NONPORTABLE=y
+CONFIG_ARCH_RV32I=y
+CONFIG_BINFMT_FLAT=y
+CONFIG_SLOB=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_EXT2_FS=y
+CONFIG_PRINTK_TIME=y
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
