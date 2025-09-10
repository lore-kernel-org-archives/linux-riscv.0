Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38672CA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 11:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PeY63SMleaxKNIsLc0S8G01UTgnz9UVKtHbHeAbIvXQ=; b=r89EztlRaz1jx/
	41imWZGHX+C/T0FetRNn/swDC5GCDNG/ciGD2Vf4Fo01kYS1yPEuYr1qhvzo6LL8sz87ssxRr5F6I
	GxV6IjzKikwMFV3c3886LX0gwGgCEv98/xOXSPu6xGo3nnnRiAQyaobAY6GVvymFR07eMoQrXKQNH
	djodej7q3LAp8ePtNPvEdPlFBfDdi0i7Gh8buwY0xEWGi22akggLDp/NjkF7ydzvyBD3Pscpm99K6
	UN9ASiaAtsNSbJZiTL6SGY+G5i+F2I/B8/jgCSkuS+zR/oEdJstLMfOSiguI0e4vx0H+vA5XWP6ua
	/lDL5Ijx6TQN8OmlDOhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwIvy-0000000Dnb0-0iUT;
	Wed, 10 Sep 2025 11:24:18 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwIvv-0000000DnZx-2Q59
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 11:24:16 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-772301f8a4cso9315124b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Sep 2025 04:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757503454; x=1758108254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N/TTXO4gixGHLhOwbcVZRnmBexzuJ8V+thRGTmK2A/8=;
        b=gKhxP8kfxLQg5PooDbzXVb2RJDQi/8YC1exh+F0VG9rOry4lxoiiseYic6+VSdNfia
         OaPOO+s6DKsYYYguxIzv9wwcROLiHfzYez6hnspuEfFKV1DAdvghEXaQUmfndiS6ySb8
         4WSBNEXeYuWnkQypChHFBZphyEV2IS7fksHCITr7rts6lqMkkQr0X3nu8KDYYUeYXGvw
         OqNCJLq4IPwFv1kWCc0M0Ef1CJ2ZeIJtrkYPJo9AwL4i7NjYWIq4qFvYJrw52132gJJa
         ic8mT20NoysUOpl7/MRMh9tyl3Gli527BGH5bJbCS1vop46T5r5gXy1Z5znvJNzq5NSm
         5xqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757503454; x=1758108254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/TTXO4gixGHLhOwbcVZRnmBexzuJ8V+thRGTmK2A/8=;
        b=DRjFky8Gfh2WUgt/AJHLh0UTK8PyEVKr9mz/sSc9bEu7v33BpQvIvmfI6cXkDMovpE
         LTIFOZvallijGCl/zEHq/RuwUwY4Bhj6RC4L8dQT2RMPtRwVijYL9/beHH/8mXOVSCht
         nA9sccJSTOeIv9tarrKSLyln29q8yXvw5j8lIGUbEG/Xfip7eAygWWtSYMyAg1P25nKc
         G9HD8og2cAkvcCNMhr1XTw8l/U9JCDTzHac1IZu6kMqSm8rT1LrO1hschL5159xzx5eL
         CgQFNy9i+qQvli4APge/7eYaLTGrhz8G+ZKN4HHIOlSJU8kc1+9FPB8Z+MLQqk/nBnFX
         XZjg==
X-Gm-Message-State: AOJu0YzjFj+YP7ptGi4+QCWAR1v+M2s3OJnLO42Q57IGpAVrbHh8AbaQ
	Z8i11dqPC5BKyvvX8DIOHl45+NFM28RBx5iSyn3LO0vToLpcXi5jbFnX4JwPpcMSAwNkUA==
X-Gm-Gg: ASbGncsPTiKO+Irol+FdBzDVGi67unBiUOWjAL5L5Ixrk0UPZtZdyRFKrARb8ZCfWlq
	U1FrbHt1uCHvRQ84keCad2CvUyLeGyRNyCLlD/hKE55re/QiipV75H8BeJf95sNcK/XWptrMqS6
	X4+wMsdgJaPONEHNst3Ced+BsYI7ucBCqqjCeRLCryj07Dp8MaDbQVerxKq54nF6X+gklOPWDjw
	Rn9BJyH1rSH1MHUOTZi58JWa7P1pzFi6QgZh3HxCRkry+54vX6sbnpsPJXosn69KhzeI3BvUHZm
	KliOGEGWMXIq98cdyilDgTOCLShxA1i/7EVCJZncbPrKzOlS0YFAKUisBTzUpmRFkhW+ypkynM7
	JwHHO1ICFznJamSTdwZxw30Z6HAhjwxQK
X-Google-Smtp-Source: AGHT+IHf9ljGSSI5D0eYX/jCF1ENGjCsNs2GTVoKAKOhVS8gT9oVVkaoH1FVSM6lQLvvSyF+uVbghg==
X-Received: by 2002:a05:6a20:4b27:b0:24e:2cee:9585 with SMTP id adf61e73a8af0-253466f5f47mr17083813637.54.1757503454024;
        Wed, 10 Sep 2025 04:24:14 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b548a6a9bd0sm2312530a12.27.2025.09.10.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 04:24:13 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Usama Arif <usamaarif642@gmail.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: acpi: chose to boot from acpi then disable FDT
Date: Wed, 10 Sep 2025 19:24:01 +0800
Message-ID: <20250910112401.552987-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_042415_617284_EA3E0A32 
X-CRM114-Status: UNSURE (   9.92  )
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

avoid errors caused by repeated driver initialization.

commit 3505f30fb6a9 ("ARM64 / ACPI: If we chose to boot from acpi then disable FDT")

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/kernel/setup.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f90cce7a3ace..d7ee62837aa4 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -330,11 +330,14 @@ void __init setup_arch(char **cmdline_p)
 	/* Parse the ACPI tables for possible boot-time configuration */
 	acpi_boot_table_init();
 
+	if (acpi_disabled) {
 #if IS_ENABLED(CONFIG_BUILTIN_DTB)
-	unflatten_and_copy_device_tree();
+		unflatten_and_copy_device_tree();
 #else
-	unflatten_device_tree();
+		unflatten_device_tree();
 #endif
+	}
+
 	misc_mem_init();
 
 	init_resources();
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
