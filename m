Return-Path: <SRS0=PPu9=5B=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7011CC10DCE
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2020 00:48:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DA44205C9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2020 00:48:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LVJtMx7C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="nmqQUSpC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DA44205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sOM3aEmjEqWWOAVUA5kLxhBWRDkm4mIPbH4c62vvABo=; b=LVJtMx7CDrNBMl
	89bouyfMxZEcoGvbpZWMvTPxDjvF+mh9zdyjbPbo/y9ebjm2HUG0Clx4WLgb3UvUtFlecpqkKedyq
	/OEJ3zw/5yEMMq1L0LmIfM3l3aTnXwEDEfb3vUlWjwIC5fbp2B1rU2V+TJCHFWH2NRj6e8kuTKta8
	5sNg8QPSXXBelgqKwncVhlZpUc4O4HzenJD3suMc5XPKePddVeTnexvNpWMDtOV5yVbbw3xFHHPqH
	wKnzBQKHWTwpXZoZlFcE7HEH2Kp5yJ61QBepGCbnaZvw0yK0kPCQxsEhKQzUDEboqx3N47x21EbEN
	Y4zxQ6VMOzq4tsyS/Whg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDdvG-00057H-NT; Mon, 16 Mar 2020 00:48:02 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDdv6-0004td-N8
 for linux-riscv@lists.infradead.org; Mon, 16 Mar 2020 00:47:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1584319673; x=1615855673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ntv2epMPlTVdoKFDBWuow5pGs7sY9f+O3nNQNhnjiU8=;
 b=nmqQUSpCP2Piq0Z1dx/LkZeKCM30VjVwI/Y8Z4SMiyIuQIHkwaeEbYNh
 q9ZDx2V4ZBNYlSD8KdFwAsfYgdAkoiI+0zn+5A10YpVqcD1dadFQknvRZ
 q1cYfxC+mU/pmrbW5kzWHAlY00+/636IU5zUeF2mgyWfaFAxmq9KhQ4nm
 rFdZfWWefTae09c95yyxOE2ZMtsRYs7RlD/J5+pgN9Unwz8R36V2yqEf4
 Hf3vbgsGiKhcpM48URDRYdXBPY3iy+cD7QrKQHFRs6hem3u9p4HRt6PjN
 xPXTWQSOsgqlx9vmHrVrYALuL0qs+5mGeE5Brck6J+Q28zQMf+zt39Z4a Q==;
IronPort-SDR: A3rgdcmompXTJJWufYEwuV9nFW+/8LCvo0XpzMe9U/JBziHOUZvzgNco7xIf3PiZ6jzPC3e81b
 WIDKEb4Wz6LjCinWlCQ8FFVR8Cf6v1zJ9GyPi82pwPGxJ7Cu6Xdh0eB73vhwg/2i07Prmq/MLj
 R1Mb+NFSSqSdSDpHePrvaLIIsSlJsZoalZR+7HZ1JiBisZU4lAeEFxPZStYdAhbcd+6bNgeoaF
 FaDxGLwivi/oIrbUMyM72u1LfloNDo7ht9lTBg55WWmNJTeshcZbCN7H8BEgw4J7Smxy+7OEps
 QYs=
X-IronPort-AV: E=Sophos;i="5.70,558,1574092800"; d="scan'208";a="133011925"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2020 08:47:51 +0800
IronPort-SDR: qb3Jzckd4miCX56z2gZ9jGfdLVrxS85wu1IoeQ7Ut0rT8aeGbp+dNi2zdODgSoOj8H9n9sekzR
 Y835IVDpOiuCN/zZ8BLiS2en2Mv5of5jB1pRNDDlRFpmXM+LZ0zytCWsRtsvu0eDD/hkZGJN/V
 +yIo8zxMDZw1N1nlQLIrHvd+2f2TkWwjpaW8fQ4J2j4m46UzsCqHFbImcVGs2Wc3aF1NzO52ET
 5ceF04Ht6RSeN32PNb8SI0Md4nR/2DGPhogbPpiD7IP8TidgAFOa7Iebec+Pqfo30UUjgv8QLV
 LVYNKvRpfXoF4Mcg+xnF6OGb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2020 17:39:21 -0700
IronPort-SDR: uECJb4fk5IPWZFo2ZGUE5KyiJVPICrcQzTwBMamwMkOosccYIN16NLSKcC2MgbIPyoe/3Fq8Bh
 ulnqgFSMzO41hPN8SCvXuvakEtTu7UDtOswqzg/ISX6ydS4sXd7Nqnignl0He0POIUzaNx6Vj8
 1x8vE/PuS143xSOiuGGiq7NjPaYb5mYp97a3J6WbEgYKUZtDN2gqx4rTFuPKSotREKgMbWeIH6
 Zqk6+iNeKLjWGsxMlUoWBnqJV84AZ9+BvcrAbIUZmKfrjXWQItXe3ztBPwbT8X/5JQNUru51MY
 3e4=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Mar 2020 17:47:50 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 5/9] riscv: Select required drivers for Kendryte SOC
Date: Mon, 16 Mar 2020 09:47:40 +0900
Message-Id: <20200316004744.209292-6-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200316004744.209292-1-damien.lemoal@wdc.com>
References: <20200316004744.209292-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200315_174752_798595_47F8D135 
X-CRM114-Status: UNSURE (   7.64  )
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
Cc: Anup Patel <Anup.Patel@wdc.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch selects drivers required for the Kendryte K210 SOC.
Since K210 SoC based boards do not provide a device tree, this patch
also enables the BUILTIN_DTB option.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/Kconfig.socs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 69071578e181..a843100124ae 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -37,6 +37,10 @@ config SOC_VIRT
 config SOC_KENDRYTE
 	bool "Kendryte K210 SoC"
 	depends on !MMU
+	select BUILTIN_DTB
+	select SERIAL_SIFIVE if TTY
+	select SERIAL_SIFIVE_CONSOLE if TTY
+	select SIFIVE_PLIC
 	help
 	  This enables support for Kendryte K210 SoC platform hardware.
 
-- 
2.24.1


