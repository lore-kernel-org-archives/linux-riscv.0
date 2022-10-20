Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F4AC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 07:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VAG6PNjIYmLqTuGIeOwVsF8LbJffHJHY9dL/+kAaDEs=; b=bE3DAYCh3HfgQl
	JQKuOqoNX9VXyW8DN4AVsFgeo5zpWO6vhlheKRc2xJoma8IBhMwzFVQ4K5NH4WAJPalLN/nGwB3I2
	jg6ZvoGFV0qy5gEu4jYxx8oAqeOQD9j1RKLQEIqKhgeRp+O6iD03xuq1tht9y/0ZLNO6rKvKDwmtI
	dd6wpEP/26jfiS+PsV5kRHpjzEtH6ICkn0+LRtcSJrv12rzx+fjG4qkzhQFqzP+647JfuXqXaIKRV
	4F8fQLoWqTvlLR2eWsXw+lnHzX3+U3X4YRNdRQrTEOynlDg9EIUbZGat4Iw5//cXp9WW7+ENLE+fq
	0EeoFCLCv1jusPdKeDWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQST-00C133-0Z; Thu, 20 Oct 2022 07:59:17 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQSQ-00C0w0-V9
	for linux-riscv@lists.infradead.org; Thu, 20 Oct 2022 07:59:16 +0000
Received: by mail-pg1-x52a.google.com with SMTP id e129so18513797pgc.9
        for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 00:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TnLW0RVC/l/l6ZpSJGiQ9RS55Sh7Bww2u/zF6eZ2bY=;
        b=eL/0WYugw3H/1sxFC9WdKuigQo+DLOOuD80Q50Flm9AQs84m3h9nhYf0lLQYFWRd39
         DXs4iq9U35DNMud1OLd+16okiAB2eoq7QcO9OSbRglrpg20DSO8trF8j8xmLmCcLLGPC
         cN3DT63GsaCqDSugUopR1AvikeqYg8gC613t1k9CY7q9hO9lJ8lvKYl8Ek4e6lDvJMlw
         vPg3fbNz3pUhmLaNqjOoHF5hZZCC/VZeRstJaWGQUmsQd8PNC4hcrRrPGFxTNz1xt4pK
         Bw1uR/NrBdi2x1QlXQ8AkRO/ok1dsPlcpY1fOB2o0/DwqFlo7APjo4OD+L3+tAq4gC1g
         HMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TnLW0RVC/l/l6ZpSJGiQ9RS55Sh7Bww2u/zF6eZ2bY=;
        b=RAh0D5Yz6LwwoeWC0Z5LHBTGfFuJCpSE5fZaujwuG5ZG9rEHHbOZdFyVa+fuIQdmsi
         PQzJpwVD1u4ERUMoTLaF4myfXyk34X/cVm5lCXDId7UtJZ+IO7jFPuUWv9x1NCkvhvMO
         uhAHIrc5KmatMdwVJSKZZQZEg7GsQxFSvUepgIzF7/tFhuLJOirw0W1C+Ymjs0qA5z+W
         HdsHy6t7YESj/llfT7gjw7Ig3GM+grdlZnuP2G6kkhBsp71bzGLlxMzzwzn4gh9gta8W
         s/K+nJ0GXeY9NzpH8dTH6GiMk5BUHlir2PzBlzQyzm+uXyZYY6dNT1S1OeQgsimygpE0
         YCAw==
X-Gm-Message-State: ACrzQf1WjE/5xiVkqqenrvW4zFLiZDGfUf0KndmahnO1NtoXvn3hAhhA
	BvwQ+HEoSj4FHh8Coinrk+QFjA==
X-Google-Smtp-Source: AMsMyM5695BW3bf/MyxpS9FPVNImhqrzxiREVKiQzjuNPGrSayyB3orzN/hf7wn69DCszXPk5MNb7w==
X-Received: by 2002:a63:ef18:0:b0:439:befc:d89c with SMTP id u24-20020a63ef18000000b00439befcd89cmr10373730pgh.504.1666252752020;
        Thu, 20 Oct 2022 00:59:12 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.80.23])
        by smtp.gmail.com with ESMTPSA id h30-20020aa79f5e000000b0052dfe83e19csm13206438pfr.16.2022.10.20.00.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 00:59:11 -0700 (PDT)
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
Subject: [PATCH v5 4/4] RISC-V: Enable PMEM drivers
Date: Thu, 20 Oct 2022 13:28:46 +0530
Message-Id: <20221020075846.305576-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020075846.305576-1-apatel@ventanamicro.com>
References: <20221020075846.305576-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_005915_021767_5BD88D4F 
X-CRM114-Status: UNSURE (   7.06  )
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
