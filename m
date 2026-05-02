Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DFDCD3423
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 16:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dBPuyZSesUlpB6Lm9Vt9GeRPnLMeBaLiQPp4uRtcteM=; b=aNO+phtgKrakCj
	NUFiM+xqu8MncIcJfhO4O5gnMRO9E+sIg8Cxzkx1nWVLnOXfOJcmXn1r2g8OcwgZVbePprhUoq8L6
	D3HvdSrwJhW92qekye6ae28+hLpSdB23szbPwXLxz6MgtnjjarRwvDweSBoCOnKLunKibv3pFz/QF
	Eg4k5nGOF/eRkB59TDl+lJvQvQiE88+Tz0H+31xsphrPI6xygXKScNj8eS5hz7c6alCyyu5AfBpV5
	XnSxo/VjsUiKn2ZG4rh/c7Ex5uRmZQ+FoJNouhMJ2XtuI8gZDJz3L7UGPugXEy9XjOqs2Fea4Np1M
	0WKLtbW5zY2Bt5iYIX6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJD2j-00000009J0c-3xur;
	Sat, 02 May 2026 16:18:13 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJD2g-00000009J00-4AbT
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 16:18:12 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-44c4cc7c1cfso278844f8f.0
        for <linux-riscv@lists.infradead.org>; Sat, 02 May 2026 09:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777738689; x=1778343489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gTnLxrweHacdIUWs4xS8Vhtx7JA+Z2sF9+LBTQ6TbAc=;
        b=UCE8MqUvliVfwKuOLmm/WTbmRxem+SCPnrJXdWI4W9MVvD0x7bjwxLGmFb7AmhJdYZ
         KQOL5Ow+hDW9D7AxVvGiSQuafCgUBTN8RsXYzNixvgt3vchsVxF5m9GS8FZNxhdTbBBW
         D9yt+zIdEao5ClqZXPKaFzzmkY6nnr9w13KiDxR47e9FQ+eqfQIebtpuMSEWveXoJvkq
         aqV4sMKPGEzwBkDrj7XVakcjfNIKo84s4062lBHGzjxM+PXgU9bDkMsbdYjxFyDoeWo1
         TMC86smTNXnHg4KbXuQRI2aOdOtSWENk3rIWzkj04u/Ce6RIX9EapKV4nuB3jVKfAfRS
         whsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777738689; x=1778343489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTnLxrweHacdIUWs4xS8Vhtx7JA+Z2sF9+LBTQ6TbAc=;
        b=R164imrQPfsFjNpBcGdIgbWflUG9bwE5FGys0li5FWRhN9R1JPZvT5fL2fLDZDBqbx
         AEiLcOrtAS1ieNvciN3UM9v5tYP5cdIp8TQ8JJGpBYskVMVgYdKBPltNn5duwHEKpGMb
         +NSFJFl8RB/9ksaCEGMyWpwwnOI0Vn2eGeCOXPWhNqVmvXAHzOJFPzvZ4WH8JAI1BEK2
         gd07pRbj4a7ldl6dXffWs76xo3LB+D2nB2BhtWu33hxOFLe6dSgb4QpTJ9CEvHSPkXOM
         3LzAjsZDMFihofar0bNXNCDgw3tQP2opP/0v57ESWrAJczaRsvsuMDTUUmbusDwhY9px
         r6SA==
X-Gm-Message-State: AOJu0YylbP8vu7YZsml/+ZKZa6J+6JaRSy1IBuY9+DQXLY3Ef/YaUuOS
	naRkW7QgQN1xA5XVoTQhkk5qfWKT8/ZtcX9bxEZPUqkDg1MZwkoNzCCp
X-Gm-Gg: AeBDievjSVKHQBjFUgvYxquAS2NGMGvXG8qhlnV7Gmlh2kou5xZorpwhRFA9UXphU6i
	6rmkUNc78ph3kDnAidYS6QgcIWCX6XV+frebIMMpUDeFyLLWJBtOXCCsHSGV2ufxM5H+b/H9Zqo
	5HSqNCFGXOue1pcXng/wLmIzaCwb/ylD5NCnT31JnXliKCx+LNOgjIoh8jrTLO855YcfnG2qeVg
	7TrQ4W3KpMeClg4LkoO9k+T+4DQy1/4ynNKgwyMRaNh0D80EsqtO2nmHlbNEEI5QDvli4nD0aCj
	+dIIc0NgmHjX7x15nLTskf8pJ2TbmAIaWNHd7xlLuxZCLxbwj+HFaCv4RCi1G6FtRMqVOqjB+mR
	rB15WrMXzTnyYQ0rN8q+iDpCLsOuw8i5vz7kDo385F3mo3yPFdklAjPFmWbMMujcOp3m0l2m0hd
	4TQEdXN58Pecx9Dw5jDgXUDL0dmoI/oh6mS3ecRfopd0mSN22K481FXo8EhnFRfrSwyCH8GYpG
X-Received: by 2002:a05:6000:2489:b0:43e:a9ba:b194 with SMTP id ffacd0b85a97d-44bb5c43349mr5844288f8f.34.1777738688650;
        Sat, 02 May 2026 09:18:08 -0700 (PDT)
Received: from ST.. ([196.221.137.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ea7d0e7sm12138842f8f.3.2026.05.02.09.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:18:08 -0700 (PDT)
From: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Mohamed Ayman <mohamedaymanworkspace@gmail.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] riscv: cpuinfo: Fix NULL dereference and inconsistent error code
Date: Sat,  2 May 2026 19:17:58 +0300
Message-Id: <20260502161802.515547-1-mohamedaymanworkspace@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_091811_049985_F55FC3FE 
X-CRM114-Status: GOOD (  11.37  )
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

Fix a potential NULL pointer dereference in c_show() by ensuring
the device tree node returned by of_get_cpu_node() is checked before use.

Also replace a non-standard return value (-1) in
riscv_of_parent_hartid() with -ENODEV to follow Linux kernel
conventions for "not found" error returns.

Both issues improve robustness and consistency with existing RISC-V CPU info handling code.

v2: Add missing Signed-off-by

Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
---
 arch/riscv/kernel/cpu.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd..e0bc7526861f 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -135,7 +135,7 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 		}
 	}
 
-	return -1;
+	return -ENODEV;
 }
 
 unsigned long __init riscv_get_marchid(void)
@@ -348,12 +348,13 @@ static int c_show(struct seq_file *m, void *v)
 
 	if (acpi_disabled) {
 		node = of_get_cpu_node(cpu_id, NULL);
+		if (node) {
+			if (!of_property_read_string(node, "compatible", &compat) &&
+				strcmp(compat, "riscv"))
+				seq_printf(m, "uarch\t\t: %s\n", compat);
 
-		if (!of_property_read_string(node, "compatible", &compat) &&
-		    strcmp(compat, "riscv"))
-			seq_printf(m, "uarch\t\t: %s\n", compat);
-
-		of_node_put(node);
+			of_node_put(node);
+		}
 	}
 
 	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
