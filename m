Return-Path: <SRS0=ua5H=CG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B48AC433E7
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 17:21:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A7FC207DF
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 17:21:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dLElvmdB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="k9VwhoZo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A7FC207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BQNj31fxxSpfXrCeiZGFPQXqpKKvPyy0a5jjqTfnCfA=; b=dLElvmdBRHNbUbQfPPz7btALD
	wRhjgUsXefjT3wGQGcrO3fNqMuGQTqjLyc+m+MH8JaGIv7jkKeUAn/mm42/kv3e8Gxflu7K5hLnZ1
	tAqQmae63ckYbUEGQlWsDJFYFOBfwNkQpRtus5BYixvcfIZvkUkRIknSjLvLZlVZ06qI2X1nIIJg/
	HGJ0Q7uVcE7ZiCHHB0T7/QqtZ7QNiFqajdYNHpQFj4zW1b/QWkdMcT4fe0p9hmY9nWvDitEKCNeI3
	W3dv5gQOXO2QzTgrnMzFpBE4zRtwluhe/cumOjKSQNB3y1wCghbg0ClLNJoMsf0rTgbpqnwOMSSSK
	V5CFBAARw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBi3Z-0006SP-Bz; Fri, 28 Aug 2020 17:20:53 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBi3T-0006Nw-LM
 for linux-riscv@lists.infradead.org; Fri, 28 Aug 2020 17:20:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1598635248; x=1630171248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M/aLmMoaf+R1cfTR4Mi4doOLt0MJCtDnvFjCl4cVqNk=;
 b=k9VwhoZo3gRMxlnpBfbt3IS5DqfzwJgiFzXK6pEc7ZLzCf/0RCOtFLIU
 b4agkXrU0t+TwrJ/AGtOOe4ewhO2pyhW/amBUxLACBO7OJM3VccDEHG3N
 pTMNiEbbNK2Rzvjz+uBClirCcSGGztPN2UfgsxaUc2AdTXtjzAHgCKmUF
 ZgIr42mbi6HwN0+3ZYGxOrm+nWujSsaCZiqmsvLNEaCX6AHBusz7u7LH7
 vbbCGHsGvD2oC1Ei42vI0cCaOXQnY8EtwjcZ4DqUIpj6BJm01wfmnrMRl
 siHE+okvRGITGnKonpjH5xQSQQv6gxLoetahDTtrpBPBs6E6/RUitVG01 Q==;
IronPort-SDR: ih6wno2z6B6+lmItG7akwWZAb7IuWjmQHWkexcB9EktvpLmIeSx9v+f6iMi429MF3lw9LBO+P2
 P85WqRNg5wv0cjYVfBRufcjHrLn+RDei3j3T9u/07OMk7bWIZ3yObnTs0VLMIQS+dEIZ3ALsmK
 +21uATBsVo0GcqpZI1Q+SyVuZXvhBJr317K7Ux5JCT+s5laHZsF2/UP5mGyfBF9WsDDvpfLCbd
 YhWniWdVVd4pXUo5PDjh9sbutDjcTaewDyErUsGEMo7UIAZTgV1bTgkM/LvKBb/lATH7RCpviE
 K/w=
X-IronPort-AV: E=Sophos;i="5.76,364,1592841600"; d="scan'208";a="150414079"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 Aug 2020 01:20:45 +0800
IronPort-SDR: qZoGUylgbGPZDVoMHWohn3CCU00MS4/XdfdQAthlTrCBRJFdn8lG1gldvYZ3z5crU6/CZgPrjh
 ESgs9Fp+w8xw==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 10:08:17 -0700
IronPort-SDR: ZTyP3mzi45xXb/+m147BTGWwAF6GtiLXedYwJhhQekkEgjpwYpbo6+F+/IIBdcv4sxJ4ZLuu5A
 eq1Xay/iPsAg==
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.137])
 by uls-op-cesaip01.wdc.com with ESMTP; 28 Aug 2020 10:20:44 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/9] include: pe.h: Add RISC-V related PE definition
Date: Fri, 28 Aug 2020 10:20:31 -0700
Message-Id: <20200828172036.8056-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200828172036.8056-1-atish.patra@wdc.com>
References: <20200828172036.8056-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_132047_853753_6FF89198 
X-CRM114-Status: GOOD (  11.09  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Ingo Molnar <mingo@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, linux-efi@vger.kernel.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, Mike Rapoport <rppt@kernel.org>
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
