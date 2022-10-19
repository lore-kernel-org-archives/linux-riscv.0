Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C1CC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 12:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VAG6PNjIYmLqTuGIeOwVsF8LbJffHJHY9dL/+kAaDEs=; b=sPzyBYPtoM7P5N
	RCw3FGz1KrqfOQkFZwGUlVpxtZF/J6YH2u56swLR+ja+4vWVA16KS4jA6BtLPFXQ3JuvfBlY6xAbv
	N/6nyAfP8d0QU/Afa2qRf6GuuS+HINzBSJoXHbhvuDSmaLSMiPuBPMDmk/mfvCn4GbFSl33Mt7LBw
	6FQiQLt0LIaAflKibspgvBzfiBnVq7yj1OFK1l10Sseb6v8h5/o8hm7QLoL/fADyqilcTDCrweWZD
	PdQJWjGKQD9bt9YqWydb4QqyBNrLpcWKqxvEIZSVgx3Cqw3xli/3oS0vq/4tCQfJIcG1VfS8EUAoT
	RVbQRXxIa3UWskANEFzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol80P-001MKM-HS; Wed, 19 Oct 2022 12:17:05 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol80N-001MFd-Br
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 12:17:04 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 78so16064144pgb.13
        for <linux-riscv@lists.infradead.org>; Wed, 19 Oct 2022 05:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TnLW0RVC/l/l6ZpSJGiQ9RS55Sh7Bww2u/zF6eZ2bY=;
        b=VmIxWBCxoy1QBqErke7QvouhcYXidpSrec5Syh14pJIJHPU4IBaHxcbo5EwewVpxfL
         +UHb3B6tURYxJ+OMRzyrlcY+MIaMEqksi7YojEEuFTcgkBk003zRHkht+tWuAJp4V6ZY
         QCSIAyp30+aUccx4FNMCqs+VHPBROZrN7lIbY+1aPL4xUDoMqH9mIfMhPgJU4MnEXfnZ
         L0HgoJGg4fg6k9uq8klAOIWdCgvuyJc6V7vpS0Ks0TbusDQpzC21nr3ul8W93mlkXKVk
         br0cf1zSv6un/eSvSABH4wPAVlQRXdptBqGmfovPgMB3oj6Eug03qiKrnUlOk/Tl54Jl
         VVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TnLW0RVC/l/l6ZpSJGiQ9RS55Sh7Bww2u/zF6eZ2bY=;
        b=PoLxtv31CxOA2YG20r2M7i/D3EIElXqQfHM+sJ5JhZsinl7rkWeBMwv/0kBmUbA/EH
         fQuWuGIDF/gUZM4/qBxIWpuiZUwQdDrXzjittrBeuulp25J9enl4nCzHnjT9EsEx8CCa
         V0iwLM4yoGvs/dHOEGIV1OAF9+SNJQv7O2YSgnVgJYelMbkAn3BzSS7/075g7NWO4Mqw
         on1a+R77sMZshHfrqaxgX4eKil2MGyWt/Dgs8bTAuwORA8xIehTDParqcHGi1Cv06Pp9
         A4tX9uhBkv95dvcutaWah1zIJUKserOQDAc2ULU2l6hYLs0O1hBfJYYafMPEyS9p+neF
         +plQ==
X-Gm-Message-State: ACrzQf1f2tZM1q0/DXyHJXnSoJX7KWXYgGnVB/XR4krL1aK0D1Ath4Bo
	XIR9ErREKFbetxKlcaxxYZNwPg==
X-Google-Smtp-Source: AMsMyM4wiTY98cvros59bvbWZy1Au2cyR34sxy+r9pEvM1Gd9ScZS4SNsiJ/t0LAvGT2I169S3b7hQ==
X-Received: by 2002:a05:6a00:114c:b0:528:2c7a:6302 with SMTP id b12-20020a056a00114c00b005282c7a6302mr8415575pfm.37.1666181821492;
        Wed, 19 Oct 2022 05:17:01 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.82.102])
        by smtp.gmail.com with ESMTPSA id x7-20020a170902a38700b0017e93c158d7sm10529824pla.214.2022.10.19.05.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 05:17:00 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 4/4] RISC-V: Enable PMEM drivers
Date: Wed, 19 Oct 2022 17:46:22 +0530
Message-Id: <20221019121622.179024-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019121622.179024-1-apatel@ventanamicro.com>
References: <20221019121622.179024-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_051703_421258_6898CB26 
X-CRM114-Status: UNSURE (   7.68  )
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
