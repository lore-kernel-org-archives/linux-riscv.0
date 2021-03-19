Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645E0C433C1
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 23:01:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85DAE6197B
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 23:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85DAE6197B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Un8D02gIgGcKGriU182T8ga5fztEBrCSbLryJNh07EI=; b=FiGNuVsvsPT+1HW+oTH4IKx+T
	yKqWor8/9Lq65aKQxka5xl3wdXICnWMvZndqnwY2iAG4fhKvi0DRxYAe6lsof64PZa5ODNaL3+8SX
	sobXUJbxEsOK4fReiOunLxA6yaLSm1OCrJzD9T6RSYX9uyMeSzKQPzvB1AUNzbBFCd/o4j2GHSXtC
	mRjei365BXObF+1vZih2cPJrNsOL9LG4/u+r+tmKl6aa/j3s0dDlHr+D4MjYg+m42OpnZ1sP+pnq2
	S3SEWvw0Jfqn2s9jWnVbrRxjydto1V5938igj+uH107oVjp/Gh4uq1JmN15xD8MNqcnB1P8AhLXC3
	+HpqtqBxw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNO7f-008IVh-U8; Fri, 19 Mar 2021 23:01:41 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNO7Z-008ITD-Gx
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 23:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616194894; x=1647730894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XocJ1hDuH4ex8QRC/y2Fe2jp6AaWu+jTV16swTNZi6g=;
 b=eWRYdbWOEuwO6fVCJCRxUNskyk6A/0wq4UYxH+ym5QNw7JJxA4JUHPXe
 HJ/4LJWVZasBNG8Ly4qXGTaOaEoDR5YKellmTuHqhN6Id0shAnKyCX+hf
 y3T6wRY+IctPyW8Aw/5MalXdJMnJC2/mVVp5L+dZIOzB/hzB3Rky6U4CR
 GQLJ90dvJIeZ4T0MZ4evN66Otu65w8oK/P4GxzQWOtwi/SGuu5jjLzt9H
 nuJ32E2QhiaQ2529F/OByIiowaOXr1687PsnSb7wHFinqANUblvrXWdAv
 /c1kQDcuqd6L1vGUjdMpDBhukx02K1DythbNyBIFnlUl0qPYp9BLbI2wv A==;
IronPort-SDR: pdtRMykNdEtT5b00I295JourO57ltHMFv1tHXiuhmuNTLuC7cNhewTSxCiRob654ZoPThmBnpm
 g8rV01m4k6myHhiBbxfimcc33s7mcKpH7qrz5bjZ82/Rmu65nhS/NyjMaH+J2AXrcGoW/2B1/D
 uQDPRw4KVdPCiVjIFBjigGnugu6GY716RP+E/gZgfxbtA9Kxtc1dNa3JV1TMZp+NYtG7xEQbAZ
 O/W6YXISnH2LBtWtUP2502pjWu355OKnVhzSyCBR8ZtCfeo5VBnEfmaESvQaOb9gFqHzgTL2u+
 Ylw=
X-IronPort-AV: E=Sophos;i="5.81,263,1610380800"; d="scan'208";a="163715804"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2021 07:01:31 +0800
IronPort-SDR: ZvFgpqYd9URrKS8xtGow2QyS8JPR7N3yyBJvyNChZbbHzYcEaztRG8mRj6U7Z3CSYcL97g+JyC
 YQf75DFtPtYCFfAhlSMOLIKk5w0VZK255Q1fPdKjZZjTedjXbOZ2AMX81L/IYeK+DY6N+Wg0r5
 qqokVGI/UauNfhhgSb0VC4WDfiy9xN1N8+yJPu/C1Nw7OaZZmZ7hzFWZ7Awzzi+TnTQkvU0oeW
 lkyKW4aZbg02DG8EpOwWnWFv4O5yfTOR98MUmutyV3jBAk0oqgVCAoA+Tmj+qZ6Q8xix0zy1kW
 YsIKICEuVajEYiLD8FsnMFTB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 15:42:02 -0700
IronPort-SDR: VZy+zW7u+yifg45JsZ6vxe+eE6tbJIoMUoL7OOUF6h1FTweBuLIHAyMgeRDNwMEgMC8pg+fECo
 1bBlPa1RQ5AMlckzn+olvIDNrfWa96fLZJj8gdlKZzwuNbuc0I1vnt3s2ifh4OUf2tdJAMkljd
 0mm2+DPSkv8Do/m9b1hZDoDCHib6cW4eEpIbwTZT1jJhVt79wA+ZrMjzvg/DMo7P+TQA1Q/1PA
 klkBbnNqLEzee1FythgdbCGODjFS0mjeZEWj19P1+qoIhd0ZKlXmeiJenJ3ux/hZ4QDUqHK8UO
 UeU=
WDCIronportException: Internal
Received: from ind002560.ad.shared (HELO jedi-01.hgst.com) ([10.86.48.105])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Mar 2021 16:01:31 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>
Subject: [RFC 2/6] RISC-V: Add CSR encodings for all HPMCOUNTERS
Date: Fri, 19 Mar 2021 16:01:02 -0700
Message-Id: <20210319230106.2186694-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319230106.2186694-1-atish.patra@wdc.com>
References: <20210319230106.2186694-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_230134_555563_C5ECB269 
X-CRM114-Status: UNSURE (   9.32  )
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

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/csr.h | 58 ++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index caadfc1d7487..7ce8df8f1683 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -89,9 +89,67 @@
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01
 #define CSR_INSTRET		0xc02
+#define CSR_HPMCOUNTER3		0xc03
+#define CSR_HPMCOUNTER4		0xc04
+#define CSR_HPMCOUNTER5		0xc05
+#define CSR_HPMCOUNTER6		0xc06
+#define CSR_HPMCOUNTER7		0xc07
+#define CSR_HPMCOUNTER8		0xc08
+#define CSR_HPMCOUNTER9		0xc09
+#define CSR_HPMCOUNTER10	0xc0a
+#define CSR_HPMCOUNTER11	0xc0b
+#define CSR_HPMCOUNTER12	0xc0c
+#define CSR_HPMCOUNTER13	0xc0d
+#define CSR_HPMCOUNTER14	0xc0e
+#define CSR_HPMCOUNTER15	0xc0f
+#define CSR_HPMCOUNTER16	0xc10
+#define CSR_HPMCOUNTER17	0xc11
+#define CSR_HPMCOUNTER18	0xc12
+#define CSR_HPMCOUNTER19	0xc13
+#define CSR_HPMCOUNTER20	0xc14
+#define CSR_HPMCOUNTER21	0xc15
+#define CSR_HPMCOUNTER22	0xc16
+#define CSR_HPMCOUNTER23	0xc17
+#define CSR_HPMCOUNTER24	0xc18
+#define CSR_HPMCOUNTER25	0xc19
+#define CSR_HPMCOUNTER26	0xc1a
+#define CSR_HPMCOUNTER27	0xc1b
+#define CSR_HPMCOUNTER28	0xc1c
+#define CSR_HPMCOUNTER29	0xc1d
+#define CSR_HPMCOUNTER30	0xc1e
+#define CSR_HPMCOUNTER31	0xc1f
 #define CSR_CYCLEH		0xc80
 #define CSR_TIMEH		0xc81
 #define CSR_INSTRETH		0xc82
+#define CSR_HPMCOUNTER3H	0xc83
+#define CSR_HPMCOUNTER4H	0xc84
+#define CSR_HPMCOUNTER5H	0xc85
+#define CSR_HPMCOUNTER6H	0xc86
+#define CSR_HPMCOUNTER7H	0xc87
+#define CSR_HPMCOUNTER8H	0xc88
+#define CSR_HPMCOUNTER9H	0xc89
+#define CSR_HPMCOUNTER10H	0xc8a
+#define CSR_HPMCOUNTER11H	0xc8b
+#define CSR_HPMCOUNTER12H	0xc8c
+#define CSR_HPMCOUNTER13H	0xc8d
+#define CSR_HPMCOUNTER14H	0xc8e
+#define CSR_HPMCOUNTER15H	0xc8f
+#define CSR_HPMCOUNTER16H	0xc90
+#define CSR_HPMCOUNTER17H	0xc91
+#define CSR_HPMCOUNTER18H	0xc92
+#define CSR_HPMCOUNTER19H	0xc93
+#define CSR_HPMCOUNTER20H	0xc94
+#define CSR_HPMCOUNTER21H	0xc95
+#define CSR_HPMCOUNTER22H	0xc96
+#define CSR_HPMCOUNTER23H	0xc97
+#define CSR_HPMCOUNTER24H	0xc98
+#define CSR_HPMCOUNTER25H	0xc99
+#define CSR_HPMCOUNTER26H	0xc9a
+#define CSR_HPMCOUNTER27H	0xc9b
+#define CSR_HPMCOUNTER28H	0xc9c
+#define CSR_HPMCOUNTER29H	0xc9d
+#define CSR_HPMCOUNTER30H	0xc9e
+#define CSR_HPMCOUNTER31H	0xc9f
 
 #define CSR_SSTATUS		0x100
 #define CSR_SIE			0x104
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
