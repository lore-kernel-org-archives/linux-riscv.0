Return-Path: <SRS0=TuAZ=JO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FE8C433ED
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 01:10:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A3F6610FC
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 01:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A3F6610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DAziZJY5EVmc/u1OkSmuta14wWPIxXDsR7tpiAZuWpk=; b=XY/cW7TMov5hLYGB/AdTlolZq
	tCIpudw7H6pJ2nq3HPN2Iox97gcgTdOq8P886MdFZSTcbEq3tbY4tWBMF4Fv4q1ivFtgRBmgk4iUJ
	+qmpBqIcWIA1r5Z2C5IBf3bGjlnjEbdL5JuGy3PnnAQntW10QnzdBJc26PMOCuAgkcbZI692zqOqj
	mW9DVDkMHZdPBDDrelWiQORNL2e/aORSfdJJs3CdolFh2MrXvnkK5OhTj5LSxTrVwhw8/fRpY1PTb
	XLxRFd3rW6WVPuT4MA36EFQ/fIb+q7E2FHme4Rh0gtYs8pA6wnUOEEPmdJZ50Q/KsqQeMHR7/4riu
	gHng8chCA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXZTr-003vkT-DY; Sat, 17 Apr 2021 01:10:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZTf-003viG-R0
 for linux-riscv@desiato.infradead.org; Sat, 17 Apr 2021 01:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=2rL5JbH3pZtBpSx4UjgPN/9o8h57zLSwcMHJ5vhnwSQ=; b=aM3TBE3pNtDomXhx6JbpyO6wyt
 tan8j+r0LwL5JBGnHtNCcI7dhdhXirtrEVL4WYWUgwF1YasWAwycWvtN93CURxwB/VcrovMlLvAtg
 F14uPYPFxT45930ExkQIVCgTuwrK/Laj5kkZMHmjhI/9aa1cmAvjkEKFa7auUTDFnJ6DU68rimb5W
 fwLEjcgIuEOjdpqADOblw0QbLCO/4UrvUcAMcBAiV3zIUBGSTlG/bw6YXyTnNSeEpfxc4Yizo9/5o
 L9ah3Qw3GPox1zWKDhvorvyPR7eq3Sfmrg1z5Thz47csbdpa50bkdAqebn47f/KgiCwejVCDA27Te
 6uEh06Sg==;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZTX-009owy-NR
 for linux-riscv@lists.infradead.org; Sat, 17 Apr 2021 01:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618621819; x=1650157819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4DgKpWxB0XLKsv65kA39h+j5FEcPc1pXnik7l1I2KYc=;
 b=H1loPJCd3F41k3Ow2Gin4bC0VAoXWNfLQJxJjmvNO6Y3BmBXUTMdTWsx
 YCL3i0ei86zg7kPa/yyaDU+ZM+8qisT5YR5EGszAF6i5sssZixjc+5jQo
 JFCXBznfBHsvziMZQL5w4Z8h0ppYnkW5bvMZxTNHeOrztSgPpSARasudE
 775MM1jWI4jOB5Ets/nTMC9lCGocfMDhYQFnsWb3UDR2R6siV71Z45eAS
 jqR9PTrTyC7NsceqvlCI2W4X4vckbwgW5teGxq9BPcuAHJdzqBgq8AiXQ
 xgZ+bPU7v47+7n474t8gyKWJHOS9bBLTNn2kcgkWqW+fbIQQIft4tHSLe w==;
IronPort-SDR: nqBDSh+eaSrLATahqoQ+SgyRRHzfIdg9YLq5m8xbFoI6HJJWjLgHmH9cToNj1VEQJY8Z59+ksN
 mLPCMEwAftoJFvkYPcv+rpzwUZ89BkE5Y9PILfFAgGa9ZNPkspYKXoDasCuJpCPQXAjuZe5A8B
 MSpLmhiL3DiFsGQ+vg04e6DT9K77XOsZjBE5PMrZAHhwT5wD9G97N+KS1JBLanFS3akRS3B4A3
 Vaise86GBLDaSOffZo8jDSeWLT3ONWoBfGhIomXl2turipQ23crPCedWSSLQIaHvJePN/RLGdM
 x/g=
X-IronPort-AV: E=Sophos;i="5.82,228,1613404800"; d="scan'208";a="165185060"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Apr 2021 09:10:19 +0800
IronPort-SDR: 3ppweCNY4KrCkRBupHYM6hh1pz/uShTMKnxqsaDYJSGqtsKmfbgYHoLsxuUzanmUCFaHWAeWo+
 KVK79YPAw+qSErLC47frTDODQ3JdVAlP+rtTlJnKEGoBAPhWZWKb3nL+KS7owIxyYsN8T3ZiZK
 LoQcHnLHYCO6ysapF9l6M4vqmUHYsy0SQq9Kd58jVwJuw3q0gX5QqWj7YptZFvGBCmaccRx6/7
 C10DcdcGN1oNoxyaBQUeMYXklkFHrkgWiw5GuCw//KL/fi4qCpBpNPusbxg60aC3I7jTn9eKSr
 Usvl2Oe6XLCDeMf8qxmg7Kue
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 17:49:32 -0700
IronPort-SDR: YHPDjhLsFx+LE0qZcYne9xelQgeX9OMP5X2ZphNVvunYaGLHeFJ1mCFHZFOA/iQiLF2zhhcXtU
 MEAGtd/1IXUQhhFZGoLVY2ThXNO1MzxOiMJScd5bDoDEfzVMxvvrVaNrWmIdMhP3yLGwzOaSOh
 JjUOY2qcSvRBSUP0dNuwngB8KtonYjb3AgqCKor6so+znxZFYwrDssokH9eqmSVqCnraHD0Tp1
 S5MQizOFLgkC6Xt5jU+v1SpBuftnhWhyTAsq0iwzjBdeCH+jUh9mVfA89HbeqlscP9/x+zmNiw
 JxQ=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.5])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Apr 2021 18:10:19 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: uclinux-dev@uclinux.org, Greg Ungerer <gerg@linux-m68k.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Christoph Hellwig <hch@lst.de>
Subject: [PATCH v4 2/2] riscv: Disable data start offset in flat binaries
Date: Sat, 17 Apr 2021 10:10:09 +0900
Message-Id: <20210417011009.54569-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210417011009.54569-1-damien.lemoal@wdc.com>
References: <20210417011009.54569-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_181019_786013_E14B689C 
X-CRM114-Status: GOOD (  11.36  )
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

uclibc/gcc combined with elf2flt riscv linker file fully resolve the
PC relative __global_pointer$ value at compile time and do not generate
a relocation entry to set a correct value of the gp register at runtime.
As a result, if the flatbin loader offsets the start of the data
section, the relative position change between the text and data sections
compared to the compile time positions results in an incorrect gp value
being used. This causes flatbin executables to crash.

Avoid this problem by enabling CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET
automatically when CONFIG_RISCV is enabled and CONFIG_MMU is disabled.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4515a10c5d22..add528eb9235 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -33,6 +33,7 @@ config RISCV
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
+	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
 	select CLONE_BACKWARDS
 	select CLINT_TIMER if !MMU
 	select COMMON_CLK
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
