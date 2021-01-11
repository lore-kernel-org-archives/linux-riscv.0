Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A50CC433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 23:45:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57CA022D08
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 23:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57CA022D08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tIoURQEik4PWfmwotpha84YnR5yjzVQJLqUy6Rwp398=; b=PYtUT+y4OFQ16mmphY/zZOynY
	tq8bPtILnPLSDDahPnbvIheh2c1vKZ9yhQQzGIQEfHmKC9yLcmfOWm/pWG6HtVp5IJm3O/YMugSMI
	rRukZG8cRXXMAs3A4nDbvNHeLwPcTCDDRHTuZg6Yjn1dximpepDLKLSMC33LKPfFOzi/6/n19qtGr
	GrKjbmKsSQ/NOWgH8Uh42vaSDc0w/E2hkQSJlEogZmMGQvTLcpIeJOEd9/ibpXGom4ha/FYCv8D8J
	MsrR00tI/Ov3v8Zy12GRrjbgTSvOXPc1Q4LVVS0nQ86WkQxviGH4BhEjYTQSbpuhAPzXHN1wtssmD
	caAHAD1Og==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz6sP-0002O3-Hl; Mon, 11 Jan 2021 23:45:33 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz6sI-0002IU-Tv
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 23:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610408726; x=1641944726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RNOH9gvngKv4PYnI6ojB0jPRmrRFh5gcDLRyBhBMMTY=;
 b=CmvOE1bRJ2hIuchpI8E5SPFXZyiI3NvNvLoWl+NPp69Y3aRJlzOd7fa9
 XrxhFuLpAB7vaEymwkGFFobWcVlbIf3+CO4ZXS8Qj8buOPNwkg10N9fDE
 CldbW0lm1ELK7y41MkeCn+VOd6x32vrGWzdnbLbQdZf1tNTYXeKnlGHgB
 W+JKdip6gvVPo2f5ahih41qu4W2PKmtFhL3/NfMqIhwUTpd9kD8NCVbMr
 YlyXtyiGt8bzm/onp0xX2b2b+QG+LEJjN06j1XV6bEblqL3zo2a8Bf8H9
 X6OsdFOAX2NEYT2CZkCzClR09577PHbbNcHjK1DBCx7ZIXhKA4Ammh420 w==;
IronPort-SDR: +rd9AA2lqMQTGiRNAtwwE5ykpJNLTLyKfot/jl+UnV8v2by9zhylHgtQsP88tgqQjjp/QiXKp0
 +tG1AOc6IS35glcJrT+MH/cGwdA7EQ6Sp+JMCsW9hv7Ufhp2XXWbUqjARPiOZm8yt/izK1tZi6
 /xViZue3eZYQQe3lhU7j15WXwL+D7JD6epz3lXjUmVDp607RffvR96+DPnyTMoDwoiN8jPfSwh
 AGIrWxzL4FQuBPZrEHDAQp04lT7bKip8LsfHgD651KO2v163CgOkrwFaQRBZmkQAOsK2uCR0FG
 qqo=
X-IronPort-AV: E=Sophos;i="5.79,339,1602518400"; d="scan'208";a="161629292"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Jan 2021 07:45:20 +0800
IronPort-SDR: hg/JWht7DY9TqWUKItEcVJEp/+bKIWB7BWO+Tc0BP7l6XYkNYTYYkw/KCHLYE0ZwrDq7qEZUuX
 36OQJYK5KmRhQ19syHJm3JjrOUfrurrTJ5vvuJKiEvsYDtNBHlg3FRLninVYWHkCZvAEellU2W
 sY/j2RKv4e99Id4dxpflybZ/fBe2oS/DK+f/h9HXmcn+4IKFcJebQ1mXPni01BMDWE8n9V3kHa
 kEseaevswQ1JzvOd2izaqbGNmKA6pBN5E0PHu8y8Dq/gheBgd0aYRjZYkIBPAZ2RysltyLoRoo
 8VHfwY8+ueAprWNVSvFLV2Df
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 15:30:06 -0800
IronPort-SDR: S4/lzpttx6/ZOnuXtMd2AXORHB8tLqvAqVfTYA8r+mdnyUCj7ItefrtrKECOgJE02m8nayn5A6
 CoVXlHknaU3TfcNc2Uwee8WCnSvWmEpd5tkfUQ3TEA+uIGX6197ACGDOBZkKGdI39K4Oi/0Por
 UgnAQY6aaf9JjD83vanUpc2jsIUtaElnPKvWUN8WujGXNRDtUUybiUa/b42T7LSb5TPIn/VFEZ
 /kqrRJVFAxSyq60AiEaVu8jxdvKhccWAJDDroZZMKRxusckMqvhm0DW29VLl65CpImj5UVpZ5t
 +rE=
WDCIronportException: Internal
Received: from usa002483.ad.shared (HELO jedi-01.hgst.com) ([10.86.62.194])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Jan 2021 15:45:20 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] RISC-V: Fix L1_CACHE_BYTES for RV32
Date: Mon, 11 Jan 2021 15:45:03 -0800
Message-Id: <20210111234504.3782179-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111234504.3782179-1-atish.patra@wdc.com>
References: <20210111234504.3782179-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_184527_202297_15E68916 
X-CRM114-Status: GOOD (  10.08  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, Atish Patra <atish.patra@wdc.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SMP_CACHE_BYTES/L1_CACHE_BYTES should be defined as 32 instead of
64 for RV32. Otherwise, there will be hole of 32 bytes with each memblock
allocation if it is requested to be aligned with SMP_CACHE_BYTES.

Reviewed-by: Anup Patel <anup@brainfault.org>
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
(on vexriscv)
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/cache.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
index 9b58b104559e..c9c669ea2fe6 100644
--- a/arch/riscv/include/asm/cache.h
+++ b/arch/riscv/include/asm/cache.h
@@ -7,7 +7,11 @@
 #ifndef _ASM_RISCV_CACHE_H
 #define _ASM_RISCV_CACHE_H
 
+#ifdef CONFIG_64BIT
 #define L1_CACHE_SHIFT		6
+#else
+#define L1_CACHE_SHIFT		5
+#endif
 
 #define L1_CACHE_BYTES		(1 << L1_CACHE_SHIFT)
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
