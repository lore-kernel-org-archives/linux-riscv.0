Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A02C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 11:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCg/5krH4cNqHuikHeYaHk3DgaDTeqndFa2p01kBGoQ=; b=tgaFzh6Z4vSR+z
	UeIig+w3e2Qqw9QTWt9YGeNXpztis45a7/H/kcyossaL+IjwaljI6k0AgTmJdXg49oWojUJVuUpSP
	Vlg/4jBuY1iJgShE1cLfHaaYhaeydJyIYvdCwfAxfkWnMH/A3hLAgPTw+rl2jEc6obZTUn2uENDE0
	YtPor5hXthRRCNvEhaQ0gOSK+nAOxCgl2AwOkstQ1CdP2bNPJHutrgtbEa8VtJ1+KPh1gBW2Frx0a
	YHnzYhjsfObwGh4UWMIxt9uyTJBM5/irxmfMXmzGYXdypMQkGtuCAUSwbSpL6uUyXlANBZ6rAytdL
	vFImbcHcFtdVz8P+tV5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6Fg-005E4i-0l;
	Wed, 19 Apr 2023 11:45:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6Fe-005E3o-0P
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 11:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=B4LpILR7uuc84V0nBeCkFyyltCgxgJA346GsW698exo=; b=UePpOd/3g1ofXzA7PR1C1Ec9aV
	qrCEbWgwBbB0QFBBX7xG2vazY0ME8D2mGlgr+KO1EsUZwbFMbHMlidTQE1wvqFlMs0+kqBX9TWZQe
	0JACQ20T85uOEcEPYCCVB/MBJBaU8E7/9kSyY9jSNz9UPuIaFUVHlX3FRZIy6uDwFacsIgpCfRCy9
	ZTFC7pLcJwGtXcG26s5/xOhxXfPWSUIVYKwVkPAWq2zZeJVWyFhpi9YtH0zNX9y7Qv5WC72Cv/5jD
	xCyj+PWFAiEBeX8VreL2YO5hl4ptjAKUFdYPggAlcpuRq1mCNejZs8Oysz35nCy3I5YmJRkzUJy9/
	VTgz5vgg==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5hx-001sPK-1I
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 11:10:43 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1a645fd0c6dso24014895ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 04:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681902638; x=1684494638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4LpILR7uuc84V0nBeCkFyyltCgxgJA346GsW698exo=;
        b=t7Dv+2N+QyIlF3rBqJ4Yw+dboRf/N5xEHL2v5J6yE8SzdkFIHKT+ft3xzMqnOvvWtG
         c73fE87KpwIAcE94sAtSve8nl4GaovkVh6Fn6Jc1trDM09dLWJtNDjrtNeeuNW43fLDq
         4m51S9CKnzl0sMFYrEj7vzX2NwMCb50ZlvH26tOiItQ+Tcn2IJHg07eABhYBUNS/y0nj
         CJmXX3IjPKbMDGd+Wzd00nqNjBqs5zER84mmVHtQtveHb2wbk2U7Bs6lorj4N4OtdvXE
         izAooKlxyqE6K+IQdYgVU6POxvNISn+BRm1HTHKsOPAbta521PPxg8Ucog3XZMuI/yrr
         cOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902638; x=1684494638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4LpILR7uuc84V0nBeCkFyyltCgxgJA346GsW698exo=;
        b=aU9wD9QEzIo85byL3z3etRP0t3nPohRh/NkOwdzDVGEh/Kghg4+u1OJnn1YM0jRjzO
         DYLxF5qnkM1puZKMOVrZ6rgEa1T+7qT9snEao5e2i5YSix2twbbLx6pWw80tCzIE9j4k
         /Dq2U/vOh1YOinIVUYXq9CZj1WVTENEMHjs4xa3++EkUU+yBL2e5Ws+hTlpRVj3Jhma9
         A/v7t4i8WJ5I0/7w3ZiZ0D0RZfi0jEGa6twlB1Bc081w0rQgnU10C++F6es8M0miSuYw
         lcWoXQzZFe+hSnw/f5TDvqRmXLsEuqli6sBRIA0VQy9tedCH+0a3YylbGshBQ3FklN2h
         KIgQ==
X-Gm-Message-State: AAQBX9fZcBLWckAPVDCy38yEprQ2XHNn2HlS8PH4jR7yROsBXKP6SRnB
	N1aMihHn3wLry0C8yp0Xay5njWF7gIaKWNLMHfY=
X-Google-Smtp-Source: AKy350blBgJTgWuZgwD/ElBAI6xPXER2rPw+XTMHx0qcnAQYuIXvYmMpwQt5BTkTII5ML0gDgkFSGQ==
X-Received: by 2002:a17:902:f70f:b0:1a1:aa68:7e61 with SMTP id h15-20020a170902f70f00b001a1aa687e61mr5676956plo.33.1681902638229;
        Wed, 19 Apr 2023 04:10:38 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1800:f680:eaf2:1d7a:7338:16cb])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709026b4c00b001a24cded097sm11180774plt.236.2023.04.19.04.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 04:10:37 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	x86@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	James Morse <james.morse@arm.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 20/21] DO_NOT_MERGE riscv: dts: qemu: add cbqri-capable controllers
Date: Wed, 19 Apr 2023 04:11:10 -0700
Message-Id: <20230419111111.477118-21-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419111111.477118-1-dfustini@baylibre.com>
References: <20230419111111.477118-1-dfustini@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_121041_546837_658F4EBE 
X-CRM114-Status: GOOD (  10.04  )
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

Add nodes to for CBQRI-capable cache and memory controllers.

This is necessary as the qemu branch riscv-cbqri-rfc (based on
v8.0.0-rc4) does not yet support generating a dtb with the nodes and
properties needed for CBQRI controllers.

Thus, an external dtb (qemu-virt-cbqri.dtb) built by Linux is used when
invoking qemu-system-riscv64:

  qemu-system-riscv64 \
    -M virt \
    -nographic \
    -smp 8 \
    -bios output/images/fw_jump.elf \
    -kernel ${LINUX}/arch/riscv/boot/Image \
    -dtb ${LINUX}/arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb \
    -append "root=/dev/vda ro" \
    -drive file=output/images/rootfs.ext2,format=raw,id=hd0 \
    -device virtio-blk-device,drive=hd0 \

Link: https://gitlab.baylibre.com/baylibre/qemu/-/tree/riscv-cbqri-rfc
Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts | 59 ++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts b/arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts
index 400ed48a06af..2c4ddc4271cc 100644
--- a/arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts
+++ b/arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts
@@ -367,5 +367,64 @@ clint@2000000 {
 			reg = <0x00 0x2000000 0x00 0x10000>;
 			compatible = "sifive,clint0\0riscv,clint0";
 		};
+
+		cluster0_l2: controller@4820000 {
+			compatible = "foobar,cache-controller";
+			reg = <0x0 0x4820000 0x0 0x1000>; /* 4KB at 0x04820000 */
+			cache-unified;
+			cache-line-size = <64>;
+			cache-level = <2>;
+			cache-sets = <1000>;
+			cache-size = <768000>; /* 750 KiB */
+			next-level-cache = <&shared_llc>;
+			riscv,cbqri-rcid = <64>;
+			riscv,cbqri-mcid = <256>;
+		};
+
+		cluster1_l2: controller@4821000 {
+			compatible = "foobar,cache-controller";
+			reg = <0x0 0x4821000 0x0 0x1000>; /* 4KB at 0x04821000 */
+			cache-unified;
+			cache-line-size = <64>;
+			cache-level = <2>;
+			cache-sets = <1000>;
+			cache-size = <768000>; /* 750 KiB */
+			next-level-cache = <&shared_llc>;
+			riscv,cbqri-rcid = <64>;
+			riscv,cbqri-mcid = <256>;
+		};
+
+		shared_llc: controller@482b000 {
+			compatible = "foobar,cache-controller";
+			reg = <0x0 0x482b000 0x0 0x1000>; /* 4KB at 0x0482B000 */
+			cache-unified;
+			cache-line-size = <64>;
+			cache-level = <3>;
+			cache-sets = <4096>;
+			cache-size = <3145728>; /* 3 MiB */
+			riscv,cbqri-rcid = <64>;
+			riscv,cbqri-mcid = <256>;
+		};
+
+		mem0: controller@4828000 {
+			compatible = "foobar,memory-controller";
+			reg = <0x0 0x4828000 0x0 0x1000>; /* 4KB at 0x04828000 */
+			riscv,cbqri-rcid = <64>;
+			riscv,cbqri-mcid = <256>;
+		};
+
+		mem1: controller@4829000 {
+			compatible = "foobar,memory-controller";
+			reg = <0x0 0x4829000 0x0 0x1000>; /* 4KB at 0x04829000 */
+			riscv,cbqri-rcid = <64>;
+			riscv,cbqri-mcid = <256>;
+		};
+
+		mem2: controller@482a000 {
+			compatible = "foobar,memory-controller";
+			reg = <0x0 0x482a000 0x0 0x1000>; /* 4KB at 0x0482A000 */
+			riscv,cbqri-rcid = <64>;
+			riscv,cbqri-mcid = <256>;
+		};
 	};
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
