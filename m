Return-Path: <SRS0=2eJe=ON=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27652C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Dec 2018 14:11:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E78C22081B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Dec 2018 14:11:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jWWHgcdf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="gopouSyp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E78C22081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fyVBnfIJUai+zcIwJU1R8SqVljDi/0vfEFrfeRe+j3k=; b=jWWHgcdfJ2M2c/lrKP67dQVvYl
	xO/ofi2ak+JtpVw1OEdp/YQQmcSzusS+9qNt9ccB+jrTAUbTv4tBy1iIIYtGqJSovZlCipi0T2nvE
	L0nCWAYEu3IZiA6TZyiTE95psKnLgMy3DitmVBtS0keiXSKo1J74JSE5BJENod40loZ5SiFsBCPnd
	huYYmbhlRbLUKkaT/6H2Eaidi3S/V1N9e89j3/px5tEFTjcNcs3OuGUdDpZWzYRAq41NelgsC9X6j
	PKzxq/XxdLiGMa3ludobbczsJ3p3J+N0UpAvJoa/dPB5eWkCFAqMrAZxGQ02vUw6dyjvO0n+1Xi8g
	YBDZmsHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUBQE-00075q-Ut; Tue, 04 Dec 2018 14:11:34 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUBQC-00074G-CG
 for linux-riscv@lists.infradead.org; Tue, 04 Dec 2018 14:11:33 +0000
Received: by mail-pg1-x541.google.com with SMTP id w6so7420768pgl.6
 for <linux-riscv@lists.infradead.org>; Tue, 04 Dec 2018 06:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rquojr46N0DT8TNw1OqodG4b4JFdn/DRt/UImRH2pNs=;
 b=gopouSypkCUDiKsYoLEe34rSJgyCu3D13Whb2hsHrWlUMo9FK1M9GD0JjmxxQlAu06
 DC/fyyVT+JQZ8LwBpjwQL7BTT2sY35HrAqonl03n2Qz5l+aPJOE4S9bRm+FvX4fp0tcw
 ngrWx3s2pdaqyY0NmevKTqf8meVtOV7bYjQ5JfvRnB5dHPlTbzKZ+6XkH4KbrUXQvGs1
 Q7Dgwkxma55agw3W2UAgAYcG1ftTDeSX8rCEcudNsyEat86SEXKfg59g/NTe4JgQH6Ox
 sWAn1adcanyWHyjvCK0q2eLi9f4EgIlZw8iKMglVt8MzJHhQHWHhcMPJlO8gXz5GVkEf
 6BKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rquojr46N0DT8TNw1OqodG4b4JFdn/DRt/UImRH2pNs=;
 b=SJ/+2eOURk1uOtXhzV9z/lc/RCrmXayakBh+5Fwk1ndwUA/0rr+N/l0HeApytSYinO
 VaTSjZAQOc1rc//ls9TtEZwmFh32+043/ODHsUf3RpZ1svjq6sRepvtOPoLUZz2Rdnnp
 t4q+ekFLLPeUM0KLdXtbjZ86uviPHWw0z8HSfr/BTxkBqjAHitNMe8C0CZYTr++hjMFq
 N0Xuasxks3l9KpUND8gvNgttp6b1sGCsRN6Bn9Rv3eZeUwI4x3zMjSynBpKI4UbrdFxn
 ejU0ogKmtVaOvFSSHs64E6QElXzozR8QuJ7J2+kuEZ8Puo7Kob1SehxmSN+ohQjhsHuZ
 N85A==
X-Gm-Message-State: AA+aEWbCGKUK9OQGyednmsG0TBE5K7AreooQ0W6twQ/+Vi5sriy8sw1B
 rEqIcLsPM1Z5gp4ZpOrmO19CRw==
X-Google-Smtp-Source: AFSGD/U2ACi+EMyJKkM+0b6OcU8NBpdc3iaZaawwGFLQGWmj3usKTeCb5cqTPEnNsYR7r4P0oDOtoA==
X-Received: by 2002:a62:644:: with SMTP id 65mr20270358pfg.161.1543932681416; 
 Tue, 04 Dec 2018 06:11:21 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([49.207.53.58])
 by smtp.googlemail.com with ESMTPSA id
 k129sm31298884pgk.29.2018.12.04.06.11.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Dec 2018 06:11:20 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 2/3] RISC-V: defconfig: Enable RISC-V SBI earlycon support
Date: Tue,  4 Dec 2018 19:25:06 +0530
Message-Id: <20181204135507.3706-3-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181204135507.3706-1-anup@brainfault.org>
References: <20181204135507.3706-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_061132_418034_CFE1A185 
X-CRM114-Status: GOOD (  10.56  )
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
Cc: Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, linux-serial@vger.kernel.org,
 linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch enables RISC-V SBI earlycon support in default defconfig
so that we can use "earlycon=sbi" in kernel parameters for early
debug prints.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ef4f15df9adf..f399659d3b8d 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -46,6 +46,7 @@ CONFIG_INPUT_MOUSEDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
 CONFIG_HVC_RISCV_SBI=y
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_DRM=y
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
