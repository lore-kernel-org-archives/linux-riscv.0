Return-Path: <SRS0=meey=XI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D9CC4CEC9
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2019 19:28:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C82D1206A5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2019 19:28:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XPZv2PMu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C82D1206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nr/cPI9sNN1dcNV+RoSiyDkLzJ2BRsxAC6wrNe6sKJM=; b=XPZv2PMufGXuoD
	AslsmTqN57PqO6ytiwP69d6thUx1sqswQVKJ/muXBU1bpAPUaKfs5XphedkfBSM7WcqDY8IDjsNRD
	uRXwlWXBYXRCc1QV6PpWoVjj/W0m81TNzwfJ3gSV1BMzN+ewnL6/eJBjRcA+9mzdCadi6vM0/yKbK
	euGaldMwZciCKa8T4rs3DCIwtoujONWN9F6Eb22BZa4Jmw9yzfDu1A1v34qkOBAPwjULWw6Zpg2sD
	090n31j6S0oHD36kDFE5Z8ezOVahabTqCHJkQVxUG3PmtuedNxkPXhuwI3ApoNdtvYL+WlGGkFiX0
	u+nThBpb4wNIYcc+ON3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8rEo-0003fm-GV; Fri, 13 Sep 2019 19:28:10 +0000
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8rEl-0003fA-5d
 for linux-riscv@lists.infradead.org; Fri, 13 Sep 2019 19:28:08 +0000
Received: by mail-pl1-f196.google.com with SMTP id f19so13638359plr.3
 for <linux-riscv@lists.infradead.org>; Fri, 13 Sep 2019 12:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=j/HQ4yd44rMnWbaPGJXdCjqvy1nS3e7OT5N0X/iTPHo=;
 b=aFWuvG3AXPu6spvZqhWs/y7F/0n56F5wY/NKvQ3uOdTf7dkYVliqEHiqIsbb6Nw+xD
 XPCvn5AX9wGdrQ7JKu6bKWtIR48Kf17lTsOWAOXArEu++X5p/pQKNZ2WGxe6YcF2FPA+
 MjJHdT3RdYHEwZ9zaVwb6UuMw4WNu7bvIwoDS6Z8PxfW2IhL+5y/zJLKgRLQooxurocU
 AKRqNNCPVOkHpML59K8KkK90U5TDloyUEYQR2CG7eZZGKeIHg5DfA74LuVZ5EIjhs/b1
 cu6gibHKlrFop0Zdv5tECbNODyWi1XfKUg1rqhY4jnCu1PXHrDQ6Xm1Txk4z1lD5FZoF
 +8Ig==
X-Gm-Message-State: APjAAAUgLGJ1IdyHUa+W1ZMXkdYcZzo8YYEMMLJvGYQ/newSUPoOEVaw
 Lghh/GK4XIved5E7Zj+Cd1jRCQ==
X-Google-Smtp-Source: APXvYqy2XXXv07m9yyvAjB1CS0Vsz0L8V0DXsepZLzb2sVaByQeE9X9gOTJYxWk0mTF8ECVIW5B0Dg==
X-Received: by 2002:a17:902:b685:: with SMTP id
 c5mr12130443pls.16.1568402886477; 
 Fri, 13 Sep 2019 12:28:06 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id h66sm3665649pjb.0.2019.09.13.12.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 12:28:06 -0700 (PDT)
Subject: [PATCH 4/4] Documentation: riscv: boot: Don't mention big-endian
Date: Fri, 13 Sep 2019 12:24:33 -0700
Message-Id: <20190913192433.4316-5-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190913192433.4316-1-palmer@sifive.com>
References: <20190913192433.4316-1-palmer@sifive.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_122807_211212_9CC8CE85 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The documentation defines a flag to indicate big endian systems, but
doesn't define what that flag actually means -- for example:

* Are the other fields BE or LE?
* Does the BE format assume the bootloader enters BE mode, is there a
  kernel stub that does so, or are we adding extra BE instructions?

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 Documentation/riscv/boot-image-header.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/riscv/boot-image-header.txt b/Documentation/riscv/boot-image-header.txt
index e325d1c9ad4c..d3efaf374b27 100644
--- a/Documentation/riscv/boot-image-header.txt
+++ b/Documentation/riscv/boot-image-header.txt
@@ -42,8 +42,5 @@ Notes:
   header extendible in future. One example would be to accommodate ISA
   extension for RISC-V in future. For current version, it is set to be zero.
 
-- In current header, the flag field has only one field.
-	Bit 0: Kernel endianness. 1 if BE, 0 if LE.
-
 - Image size is mandatory for boot loader to load kernel image. Booting will
   fail otherwise.
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
