Return-Path: <SRS0=qsF3=BI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2BCC433E4
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 23:37:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9D19207E8
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 23:37:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QqQqkZzU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="PvVQhQp8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9D19207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BQNj31fxxSpfXrCeiZGFPQXqpKKvPyy0a5jjqTfnCfA=; b=QqQqkZzUGNKh7lF8ElR1BGZfm
	G2Wh0TntHfqlLyglndlKSWMNdwAkpHBfalu/8qX5MKhwo8EoxItPoMZZ9hTbDkcOdYKF/mp8/h1Pa
	VBQ9i4eJHGxq34DAPgvWs10WfLIujxPrkgJWHeGS6gUB46ieGTTYwlocyqLcJ/oNduYgdkNkuzTP2
	fhJOOmWCU1xY47Roj6CuoEjTillCe5GOjzjPABXzTNGPuyVXBiWigtS4KlhABM7e5EHZ3ARTQmENI
	jAfAzsjJqfCo7EuxzIVopmCXl5gyetZ+hrpCJY5jlsssIZDz7NI77auJUHS/jt8Ux8d9aTQ9nDOZw
	nngNG748Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0vdD-0004vr-Ey; Wed, 29 Jul 2020 23:37:07 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0vd6-0004qV-Ub
 for linux-riscv@lists.infradead.org; Wed, 29 Jul 2020 23:37:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1596065820; x=1627601820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M/aLmMoaf+R1cfTR4Mi4doOLt0MJCtDnvFjCl4cVqNk=;
 b=PvVQhQp8A1IBFTPVaZqQzq/uryZIgxstw4ifvzuIlltGdL0SncnZvMC7
 FY5hMoUQTFhzQMS6OYIV8sHNBQpT+xHASftI7eRrrdkHxjWpMMP/R/eLi
 zdtgGjrLKey8x8eMdERt9sgkNq2HQw46BKYzK3zboS77j7eSI65nxc6aF
 qjIM9MRt4MCzvcjY69KousuZQj+b1eyEB0giqYEmzg2MOZD6DqkuxHEO3
 XOvsvVPjVTZ5TFnANoVbBNRFQb/7hVemeRdH5uF+JMBRHEPrNeIJ6/Ke1
 wtHh+z7XQ7YZgkjG47mUv7FMLRb3pbl0rgN9SDBfphnj7N45GxJmx7gdh Q==;
IronPort-SDR: A0F3+5e5SBq5DnKG07Dk7QZGi4yVjn48GUZg780MAvpT02tz2plNJgdva1fwm1HEH5IgQnNBE2
 N0KmA3+AOb44hpssvhq/K6SYFxxjTpvjsMy6EJxJswK38PHUvi0EFBzazc1fWKbnegLD5GmiFn
 0eyNAJu8SH5YHH7+a5bF+XEGoIUEGWQJa0HoygOV9+hVijksUgwICWkpj7oOjl6p+3YNGt2vSc
 FHNnIVxUMt2vHASErnQ9c3hittAEhdcrm0Ex/Wh5FO+jLAptwBhH5mMXwH/utcPgqFTOD20n51
 y1I=
X-IronPort-AV: E=Sophos;i="5.75,412,1589212800"; d="scan'208";a="253037257"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Jul 2020 07:36:54 +0800
IronPort-SDR: aYNERphjueSTN0gShin3P93GlmaU0FG0QQaG1lbIAWiS5KW+G/gkH6sp68x2LY0PHlUEmKprCN
 Et5Bv3ZrR9wwT5Vz2tlmmy4cfiH9l+fLw=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 16:24:24 -0700
IronPort-SDR: jl9KKWRuX6o+x8EQ503ka+/veCrEXiFcusdtj+sSoVDP1zToRbSi7am3W7Eg9UsAaTXR81Cm24
 ty0Zbev3UtFA==
WDCIronportException: Internal
Received: from jpf009043.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.210])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Jul 2020 16:36:55 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT PATCH v4 4/9] include: pe.h: Add RISC-V related PE definition
Date: Wed, 29 Jul 2020 16:36:30 -0700
Message-Id: <20200729233635.14406-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200729233635.14406-1-atish.patra@wdc.com>
References: <20200729233635.14406-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_193701_131788_50E47326 
X-CRM114-Status: GOOD (  12.19  )
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
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>,
 Nick Hu <nickhu@andestech.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 Yash Shah <yash.shah@sifive.com>, Ingo Molnar <mingo@kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Arvind Sankar <nivedita@alum.mit.edu>,
 linux-efi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
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
