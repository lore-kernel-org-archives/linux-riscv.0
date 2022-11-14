Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8BAC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 09:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VAG6PNjIYmLqTuGIeOwVsF8LbJffHJHY9dL/+kAaDEs=; b=UiZYpwlkqcpMps
	JYh+BQezrtw1DAhGy1QS0MIcwuko9WtQyb/newQpniXgEHWArGsR2U/+irCERtdiS8gJUtJa1bA2L
	LWbOKpJEUbceyPjWv3fcvRR0BEiRjpemlhrVHPqoZnwUwxDEUYOg3mjZBCYlVXFFZ7fpHjQrHl//7
	FGAXDdWGRi414YPQs8thfLQhgBZSBRuatbYRa1wJP87Ror8dSUhPV/t++55pdMEvlMgZ1E37udHue
	ouzsMNPs2hQthYCLzMqNHK3Iz57CxUQ0rNHPQ0b9UzgsygTgqTveIMjOJhynzp1jEWrlRuaPZX22f
	LenRH/oZy6wTk/yb1DqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVUy-00H72P-CU; Mon, 14 Nov 2022 09:11:24 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVQ0-00H3kW-Au
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 09:06:17 +0000
Received: by mail-oi1-x234.google.com with SMTP id q83so10745271oib.10
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 01:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TnLW0RVC/l/l6ZpSJGiQ9RS55Sh7Bww2u/zF6eZ2bY=;
        b=NcRntpJUBXD8X/NLF4ZQYon44J4DDA4fW4p44wwVOyzCLSddzAsRYxd3Hs04Jq4WQp
         taS2Xb/+DHAySaLWYUuHLHTMZEohNNtNBl6ZgSsaZuFtPW6xCnTO25d6jYdddhnfFJMi
         eLLnCj2xC5gI9RAISo+4T9uM+IJ7pMADNDkCKQe8vb6nMu+Ts+WP3ic1NyYKdGeTTccI
         6zENqCEG8GuhoWacXYSrr4kZ93M395NaZmPUfDc6i843EH8DHNv6XTXdj90EVLQZFAm6
         SQpeVr/VyZIGm6y7U2T3aib7FEg6h66EAt1gEg0xmiGgwg+vC45hKiPPxISmll6HcuY2
         LQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TnLW0RVC/l/l6ZpSJGiQ9RS55Sh7Bww2u/zF6eZ2bY=;
        b=KMbyBUbq0cuhi4ZdI7REcoJnuETxIbNntMnG7h+2tw2X3/R2p2WXI2VsYWiVJFTn3J
         63TK5giC1n3m8jMt5OOot5gs7QkS0n0kpUWIgb8m78q9VIFW8ok0aGAbN+E7nuk91At7
         LlPHJ7DGzRGk1pa0U7PVhd0QA6rlSvE5vA3Hdbd4wc5gbOoAi7Vo2KPr42Uz6FOmDHT+
         5MKEpLcgGEmSG4j0na7Tmw1wNCDg4K0h84BqOg4H7nueWJ2tAewx+YqehZ/qNhQwWefK
         jOk0H11jYOJP3JFbdhTmk+2n4W788Cc612GzJPmXmlNF4qzHJ4fa8+zUzg13PqvCmGGH
         SdYw==
X-Gm-Message-State: ANoB5pmRY10TBSFxxoDusSWJqTsSAT/rJYfJjUJuJWf0u9XotYy/9t6L
	P6ZukCbO3z/MKAmZUQ1xacq0DA==
X-Google-Smtp-Source: AA0mqf73xXWXRmFpczTe5uuG5ukc7zfCe8gT0PITVl8J6K3RsuhawTE/L38MdQ+HsZ+RzsqFx4U1Bg==
X-Received: by 2002:a05:6808:130c:b0:34d:d3a5:b2d with SMTP id y12-20020a056808130c00b0034dd3a50b2dmr5235455oiv.224.1668416775584;
        Mon, 14 Nov 2022 01:06:15 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n2-20020aca2402000000b00354948e04e4sm3432939oic.2.2022.11.14.01.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 01:06:15 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 3/3] RISC-V: Enable PMEM drivers
Date: Mon, 14 Nov 2022 14:35:36 +0530
Message-Id: <20221114090536.1662624-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090536.1662624-1-apatel@ventanamicro.com>
References: <20221114090536.1662624-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010616_424569_18BB675F 
X-CRM114-Status: UNSURE (   7.47  )
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

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 05fd5fcf24f9..462da9f7410d 100644
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
