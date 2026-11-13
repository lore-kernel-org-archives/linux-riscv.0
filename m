Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ABA606A337
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 07:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a9JYeGSJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ozi0orls6StxLKz+d5QMLNQkaVdTwUbfpwOa2Oweymo=; b=a9JYeGSJz0Hi2+5a8AEoCM8Ekk
	Gdy2Eg+D0nu12s3v2eiw0jSccSNxRKuq8LrYumyOmuQpsrfFTbM5rBNL8cOaM1trl+JE6d7ZS2u3J
	gSrssbMd80JiPwElMDHsZN4dS8Eh1phQpAshv4JBG2dYTVZl+zw94FtXArc001OewDgsd0oYLAsGI
	DwMSKoZdCR6L65dbIdnRja4Qd3buMaGhdeCUHdEpr6SVNofoMi8BuGyZYgkc3oiwHoUXGdGlG5+Ru
	ppwrc4ONl7n/fwxG896tv8HU2rMmZ/xU1nV4DfUCmE1g4ypalplGRga6LduW3iVrv2A8mEpqO+Khv
	y2RLgr5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlUT-0000000BrC2-01zB;
	Fri, 13 Nov 2026 07:14:29 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlTv-0000000Bqua-33Te
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 07:14:11 +0000
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CUZQ059152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:30 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:30 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:30 +0800
From: Mina Hui-Min Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <conor@kernel.org>, <jic23@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <minachou@andestech.com>, <az70021@gmail.com>
Subject: [PATCH v2 18/19] riscv: errata: andes: limit the IOCP workaround to RZ/Five
Date: Fri, 13 Nov 2026 15:11:42 +0800
Message-ID: <20261113071143.1446167-19-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113071143.1446167-1-minachou@andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AD7CUZQ059152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_231401_827057_F386692F 
X-CRM114-Status: GOOD (  11.95  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SBI-based IOCP check was added for Renesas RZ/Five (R9A07G043F),
the only upstream-supported SoC whose AX45MP has no IOCP. It matches
the AX45MP marchid and the mimpid of the RZ/Five core, but it is built
into every kernel with ERRATA_ANDES_CMO, so the SBI call is issued even
when the kernel does not support RZ/Five.

Move the match into soc_is_r9a07g043f() and make it also require
ARCH_R9A07G043. Kernels without RZ/Five support then skip the SBI call
and take the generic Andes cache errata path. No other upstream-
supported SoC uses this AX45MP mimpid, so their behavior does not
change.

While at it, rename ax45mp_iocp_sw_workaround() to
r9a07g043f_iocp_sw_workaround(), as the check is only used for RZ/Five.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 arch/riscv/errata/andes/errata.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
index 530d2df216e0..f2535a81b1e2 100644
--- a/arch/riscv/errata/andes/errata.c
+++ b/arch/riscv/errata/andes/errata.c
@@ -25,7 +25,7 @@
 
 #define ANDES_SBI_EXT_IOCP_SW_WORKAROUND	1
 
-static long ax45mp_iocp_sw_workaround(void)
+static long r9a07g043f_iocp_sw_workaround(void)
 {
 	struct sbiret ret;
 
@@ -39,6 +39,13 @@ static long ax45mp_iocp_sw_workaround(void)
 	return ret.error ? 0 : ret.value;
 }
 
+static bool soc_is_r9a07g043f(unsigned long arch_id, unsigned long impid)
+{
+	return IS_ENABLED(CONFIG_ARCH_R9A07G043) &&
+	       arch_id == ANDES_AX45MP_MARCHID &&
+	       impid == ANDES_AX45MP_MIMPID;
+}
+
 static void errata_probe_andes_cache(unsigned int stage, unsigned long arch_id, unsigned long impid)
 {
 	static bool done;
@@ -51,8 +58,8 @@ static void errata_probe_andes_cache(unsigned int stage, unsigned long arch_id,
 
 	done = true;
 
-	if (arch_id == ANDES_AX45MP_MARCHID && impid == ANDES_AX45MP_MIMPID) {
-		if (!ax45mp_iocp_sw_workaround())
+	if (soc_is_r9a07g043f(arch_id, impid)) {
+		if (!r9a07g043f_iocp_sw_workaround())
 			return;
 	} else if (riscv_isa_extension_available(NULL, ZICBOM)) {
 		return;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
