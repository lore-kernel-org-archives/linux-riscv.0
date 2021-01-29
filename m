Return-Path: <SRS0=yqCT=HA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE9BC433E9
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 19:01:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E87CE64E0B
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 19:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E87CE64E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xRZiMm3y+NOzr6MTUtX4N+UYKJQP8yb4y61O1wDzQW8=; b=IisRLJ/h7Yhr/rEkDNDF3mZJR
	TrvF8W0ZoZh8coMoDZmmhAKx4kWBbCLlLiyDMLLvTWBkkLb01w+xqLciNSp4q0kkeFCdIM1Il5f8O
	uqEgNVIwijTFA8MjmcJKemJ6Ul3qfvUEnglL81N6xwTxdDfi+rEli7xfshJjAcL17PHbop0iwJ/r0
	nYtumiYE1PWos2UGndQQKUihDOija53pF7RJIFxQQjk43i7AclcPtqxPcb+6gACScr1aEnYxdJsdd
	dh53vjO0bavBaLSkOgIoh/aS8Dl3UYF8d54SvvIfDkccBc69sgTdmL0pabjafRA+0P0RFETZMFZIB
	qlyqpHRww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Z0v-0005q6-Nn; Fri, 29 Jan 2021 19:01:01 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Z0s-0005p2-QC
 for linux-riscv@lists.infradead.org; Fri, 29 Jan 2021 19:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611946858; x=1643482858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mHKpdCHAaIc6wWDciCP+VXwGBcRZytaYsIXTPrszhlk=;
 b=rb11zbNX5bmVVyMjyJX24meAGYaWPolfxL7vvJFGcrhi2RMRlBIr/o92
 36IRBUJlv9guAytxclYcOAAnbmjRVAkqVCvfr0DdR61jvl7pz738pQ5J/
 G5g7xupVhNbrTm+TwHkw0NmHehIos3j8WkvEyNYV6bP0h/RKx9AERmurT
 N2mPel5LMuxuIp0Xq+Tr3WK9GU2d/rMEj43aTq4HtTB1sBHKamwz5vkb6
 NFP4SVFJWkpcOEqnIi/Q9+srcaukvaqPP7o729I5B0Dr0AO2Uv34NDV5m
 7LCholKVI3lHGsvVdj9F6uPyx+R/kufgnhURm8XeuUCKRg857lcDjqvoR g==;
IronPort-SDR: 3Vd9SC6nxPgO9ZihmRJ9b/LVBHPU7a9pqoQMF+CzdY9ts9GbPM+AIUlOKRxJkcHqpqxq4w3Quz
 djQ+CP4GdtTCERKf4t5MLC4Xdh+5KSpF2dQkITrl9NTk0vJeGQ0pUuv0mQYkEYC8bXiQZs5GuO
 +QSScj9p+qXUqRMUDpeCKeBhvrEBpQAq9H/rmMUkLRxF+eRwSLC37GSEL7sP4UkwtuHcFAcVo+
 /nk/B5jcCi3OfpQLxs3w+lebYJuBjgQzS/7/4pdAgpJ6NsoVuUelS30FIU9GhQsMcLWoKVALIO
 pWE=
X-IronPort-AV: E=Sophos;i="5.79,386,1602518400"; d="scan'208";a="158658730"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Jan 2021 03:00:55 +0800
IronPort-SDR: pRButyDkr39QQn/8vuPB5vReytjs3heh8bjefi6pqSXbN0aw60u+rV+/iZZ1u8lEs0xs09b6rp
 VjE/1xFkPBu73BL5ks5IR/ijbt75w8CUM++gb4O0kf+ax4LOw3H08Zpob9fmKh+QN8GjagHC3a
 dD66xT7+AfhtQCzo8P76y6hr8m1ar+2chVnpkg9hwYmjp/M2jQLcw/9s/iSJ5Lt9s1m7G9KgNT
 nj/NsPPXUAOJCdsn9u9WtTfRZY4Bydd39n4lGSdMLFVEwscfcSi/fBgMsnLWILK76o62RkO30d
 w7uY+bDL4gRc+YYPz43/W6+8
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2021 10:45:13 -0800
IronPort-SDR: qWiMg5teuON++9ffe8hyV4AViVWlg0EpHL3QmskW2g2LA8On0O7RC+XJFaR1v53Ntb/+cNVqHe
 tBA9ufRGq/9busQADKuFl4pdq7rvKyt7AQ7tPybQIZkkRhTBIiFROSk4J6eQQyL+k1nSPkwl2o
 8Uf+2KvEsbTOSntjA6I7ZhDDUy4QF7qtQO6f7bjm/A/d/HA/y+gULjZxkB/OoxzQd79rOj9QS8
 TOzGKqLNbNGbPhbnhw7IJOYv6dT6cupTygSUa6+cBf3/QpOTUWIdVdAV5UtQcHi+IIRf6RbvuV
 Qbk=
WDCIronportException: Internal
Received: from usa003967.ad.shared (HELO jedi-01.hgst.com) ([10.86.63.124])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Jan 2021 11:00:55 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] RISC-V: Define MAXPHYSMEM_1GB only for RV32
Date: Fri, 29 Jan 2021 11:00:38 -0800
Message-Id: <20210129190038.1001626-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129190038.1001626-1-atish.patra@wdc.com>
References: <20210129190038.1001626-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_140058_992929_29691350 
X-CRM114-Status: GOOD (  10.50  )
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
Cc: Sebastien Van Cauwenberghe <svancau@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Nick Desaulniers <ndesaulniers@gooogle.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

MAXPHYSMEM_1GB option was added for RV32 because RV32 only supports 1GB
of maximum physical memory. This lead to few compilation errors reported
by kernel test robot which created the following configuration combination
which are not useful but can be configured.

1. MAXPHYSMEM_1GB & RV64
2, MAXPHYSMEM_2GB & RV32

Fixes: e557793799c5 ("RISC-V: Fix maximum allowed phsyical memory for RV32")

Fix this by restricting MAXPHYSMEM_1GB for RV32 and MAXPHYSMEM_2GB only for
RV64.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e9e2c1f0a690..e0a34eb5ed3b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -252,8 +252,10 @@ choice
 	default MAXPHYSMEM_128GB if 64BIT && CMODEL_MEDANY
 
 	config MAXPHYSMEM_1GB
+		depends on 32BIT
 		bool "1GiB"
 	config MAXPHYSMEM_2GB
+		depends on 64BIT && CMODEL_MEDLOW
 		bool "2GiB"
 	config MAXPHYSMEM_128GB
 		depends on 64BIT && CMODEL_MEDANY
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
