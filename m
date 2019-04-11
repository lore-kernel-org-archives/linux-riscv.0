Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF202C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 08:43:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A029E21841
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 08:43:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hGTiF/oZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GYT7PXbt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A029E21841
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7PNwD6nGs+6VotnGq6XO1tHVQEF0K9miNx25CtcGfB8=; b=hGTiF/oZfqdIJY
	msXF3JatHpIC6lU9C7W82hY3S84DDojxKQiJHg5QcxJ9cDc8Tbco7tAMICwZC0WFEePLfGis11SEX
	Eql+BkaOINCCk4VYZNFHrboe8YmefkbACnAMrnms4jyU1+MQGzy2hk7kP9Y9HpZV/T2myutjpHn8m
	QpYFeoRHD0VbPPLRSxa+cRVaJnvo0+xO2o/dE/p6ok9R9SnAldBMYcwVIpvNW5NKqSHytgdZNI2IZ
	X8NSJlD02OcbhxU2bxp7lpEX+FkFCJl9pUwHFIT/YKvYW7HmiLhJz2vMjw1oadiwPG4OlvFe46jAx
	0IEHY1sUFVMgRy+TEY/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEVJM-0001AR-2S; Thu, 11 Apr 2019 08:43:56 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEVJJ-00010o-Av
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 08:43:54 +0000
Received: by mail-pg1-x541.google.com with SMTP id f6so3182373pgs.8
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 01:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3uDRcROgGcVy6omy5p81C7LS9FeeN6XiopSGYFDTY88=;
 b=GYT7PXbthjwqYq0DLG/UzPHOX+w/ANcASoFvtTw3H/15gT2HSG2WQcXoAhqTW1AcSg
 pDzJBopIpk/7YJL2wWWBFjS2A6+frZ/4L/myGtJF5wjbDouaKClAhXoTz/peiMqxvMDM
 iNZkSQtIjxJdZkMSG8lJ7AkhL9KOanQYpKwnQKBfUiZYh7Yr+5/pBmVK3kDaSeFthJ8A
 vmw/SQbGkWwtmNB/0ZApAPEtYh0SpNtXLxabS9hllFSy5upNYaY5KzYU8m/Y02y+wFaz
 CbdfbNQVW3XmxWOvLxNqwE6ylPctPUlEhr/PL9GNyzVFyPhZ3mDc6LVZ+Rw1XLKD0Ox2
 kfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3uDRcROgGcVy6omy5p81C7LS9FeeN6XiopSGYFDTY88=;
 b=ITjRDApdM+oljpjlx727FnzwtbxBQ2VqO7haHcLJHDQE/Vqj98WDGHdrRgt9dhKe7f
 2ojPutqOZcOlzpyPhpMVYhTn8s6UWJaQ2oZOz0L+MG3AU6LDU0akhM1QFaG6HCSv5AEt
 nzFmWx2MWB7emPYXPhTdps189OpBF+8JeOgb5YRf+fSfHojMcCnffGdPajyYRYFeHniz
 /3rasWrue3RV0SuJLOPiyppxXveR1uxBvy5oGyekNufUazthLkX+bELgDQ6gOfTD70Ll
 DDYwaeP4blj7+WMskS8rU9ztjgoAWQIJP2BzEV/9BRXAw24ydpdCNGFV/SgoojoNmP4a
 13UA==
X-Gm-Message-State: APjAAAVi4cWz0Fc8YKXE3pwAho00gbF/EpNIYJCRgt/OtHZYUDXhSe3e
 ILCbIp82/2ZHmk8YVdIH2oxV4g==
X-Google-Smtp-Source: APXvYqynHgbPARnw8SqKyrMoIi7d1N9ocPMTUPVNg0szL7boUoJFI746C4foY3XJWkSUDvALMbTJAg==
X-Received: by 2002:a62:415d:: with SMTP id o90mr48539392pfa.236.1554972232835; 
 Thu, 11 Apr 2019 01:43:52 -0700 (PDT)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a3sm61699456pfn.182.2019.04.11.01.43.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 01:43:52 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [PATCH 6/6] riscv: defconfig: enable ARCH_SIFIVE
Date: Thu, 11 Apr 2019 01:43:04 -0700
Message-Id: <20190411084304.5072-7-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190411084304.5072-2-paul.walmsley@sifive.com>
References: <20190411084304.5072-2-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_014353_554587_CB42A7B9 
X-CRM114-Status: UNSURE (   9.38  )
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
Cc: Paul Walmsley <paul@pwsan.com>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Enable CONFIG_ARCH_SIFIVE in the RISC-V defconfig so
DTB files for SiFive boards are generated by default.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 2fd3461e50ab..0fb782c8cc1e 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -12,6 +12,7 @@ CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_BPF_SYSCALL=y
+CONFIG_ARCH_SIFIVE=y
 CONFIG_SMP=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
