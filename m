Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC18BC433FB
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 23:41:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 663C62074B
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 23:41:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZmlCiL/8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="r7QsZjKU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 663C62074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BQNj31fxxSpfXrCeiZGFPQXqpKKvPyy0a5jjqTfnCfA=; b=ZmlCiL/88tsbLBOxhNsneHwTi
	pMcjWmQ+z+esBz9mCcvVJHuno+0oooQxAAUDQkRhTHAY/13HFj/wAUZsSYioElnCNDgZp0uK+hgZa
	DO8Uq0ZdAhwC/hT35Pq3i0bmlbuQPJWbfy09lMAcL1rXsaMqHuCeWPCshe1ZqZwD/xqL5JHljaksz
	fJ7yiP777RPpgGBdiLgnTFsfyaBZLe+LefEX7K3dzbiT2nMFY876O7hlXHVb+X8xMIqP3xxhv0jmg
	Ki8wZnnFbT/hNR/2kfABokgpnri9j89u9lpaod5dT5zeJ+EZRI0enZmlAMS9LIXdA7EVEoouhZGJA
	ZgOC9+TJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwDVU-0007oJ-K0; Thu, 16 Jul 2020 23:41:40 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwDV9-0007dp-Gy; Thu, 16 Jul 2020 23:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594942879; x=1626478879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M/aLmMoaf+R1cfTR4Mi4doOLt0MJCtDnvFjCl4cVqNk=;
 b=r7QsZjKUNI8QBZPcaOjHSIKMEHvLinv2XV4nHJkUXJk2Tm2iXelGAkla
 0+F+YC/049oVrUxoJG9BSXjPmo9bdLfYKP6NsFrBU6qRho2uN2jYQj0i+
 XfqxC1fDLXn0/2i3HQiMb97+EKOJ0yShmKN9LI2kfsDzTq1diK0A9ttu5
 SftdcPvLuzxKIIE62pJYkkDd+jYwjm1nYJFaw4WFojbF6VSFBUo6tvQFn
 bODExy9EPK+G/5e1KE9ua8enR3uz7oWKsRu1hodZBl31q5il7bwP7NoeJ
 E8Lrl74asRxEjzbWaAPXsUTEVdtatBdsd8nGjafn55TpwERTsAMV0Bz8b Q==;
IronPort-SDR: 1dM6In74c0rEszBKgsrATzTwY2ez+L0iqq+0CZsx1AbNQQJ3MZKGEiKb8WzHrxChM3xtD8np1o
 +Yfj7EaioDjXBxzH5pIuCHVecluOifQRkOripkeUWk4kWDrslNUD4MnJitAo1qMoNZDvpSU+Zt
 NguehKLYi2zaFCQQeTEJDr22opPolFYcXAckduTG3yaI4n7FNm+3+XfRQhHRSsF7aS3BtjNWOh
 //KPuxgXEgy3U1KLYUP0ANYonAdtti3sShvL8jG+m4alhv0hm68ViOY8+6+GsMk3QKev70E+LV
 vyM=
X-IronPort-AV: E=Sophos;i="5.75,360,1589212800"; d="scan'208";a="142782177"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Jul 2020 07:41:19 +0800
IronPort-SDR: 07nUIhBnlt7ndLsQixpTgKWsidFIrgoLXCPjcLyAQy8ly1/cUeQbCnQSLwIyp6/b1u9DQ8b5TL
 t/mv21l4hE0uB2HxvmgE3agleq8BZ04F8=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 16:29:42 -0700
IronPort-SDR: mvb6V7T1kzM/mdVXBhPssCnk0svEdQRax5iRV/H9DXHuJJ+ah2FZShI5xbLjomx4rNIMC/I1z+
 jV7WUySWQxmQ==
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.54])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Jul 2020 16:41:17 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT PATCH v3 4/9] include: pe.h: Add RISC-V related PE definition
Date: Thu, 16 Jul 2020 16:40:59 -0700
Message-Id: <20200716234104.29049-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200716234104.29049-1-atish.patra@wdc.com>
References: <20200716234104.29049-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_194119_767865_780415D7 
X-CRM114-Status: UNSURE (   9.44  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <atish.patra@wdc.com>,
 linux-efi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Define RISC-V related machine types.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Link: https://lore.kernel.org/r/20200415195422.19866-3-atish.patra@wdc.com
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 include/linux/pe.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/pe.h b/include/linux/pe.h
index 8ad71d763a77..daf09ffffe38 100644
--- a/include/linux/pe.h
+++ b/include/linux/pe.h
@@ -55,6 +55,9 @@
 #define	IMAGE_FILE_MACHINE_POWERPC	0x01f0
 #define	IMAGE_FILE_MACHINE_POWERPCFP	0x01f1
 #define	IMAGE_FILE_MACHINE_R4000	0x0166
+#define	IMAGE_FILE_MACHINE_RISCV32	0x5032
+#define	IMAGE_FILE_MACHINE_RISCV64	0x5064
+#define	IMAGE_FILE_MACHINE_RISCV128	0x5128
 #define	IMAGE_FILE_MACHINE_SH3		0x01a2
 #define	IMAGE_FILE_MACHINE_SH3DSP	0x01a3
 #define	IMAGE_FILE_MACHINE_SH3E		0x01a4
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
