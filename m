Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE2DC47087
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 18:45:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75ADE613D1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 18:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75ADE613D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fiKYx92iQk3lHdzzrzcBUsgr9gKlRKULH2J+CN9tcZ4=; b=MV0GKak+2Njvgs
	l3+WEwFqlqe5SZBWHSAEl70NAbAM5U75YyF/cHloh5lh8uMtsVGyglgooZDcQ8Z1ZZus/XJkvuasZ
	TW3syW/ItgpwtOy8tMRcadVqY+DDuGrVSEfc4Gu0ZJPkTKd2MbKzkeQSjjieK2UEluu367Ofuh2To
	wAxPjzITy+JusQDfXrKUTmHex6iyxlczktFdjj5jAolwqP9c/4DPIyIJwm+GeyPHrRmdnp/7rV++i
	iTDtzmsMFHdUdaO1QqwErnwt2FXadjzrvNPjeOSOwYgV1r03gT+UNRVgQ9TdT/ZR+UfNpAB6GdmVf
	VV3Gw6LHdYi1mlTeIgSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmhTq-000Mz3-JF; Fri, 28 May 2021 18:45:10 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmhTH-000Mad-K8
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 18:44:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622227473; x=1653763473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yUtYu3gMswSai/R0sCyOGc9Fo+GX41jucxP7pg0MEIA=;
 b=Tjr9acytyb6m94B/tmc8HxUzEI9giV39zOuFtasKVJBjpBe2VhI4i5JJ
 HzVD4dUAK1yiyXkJbB3TNt09ojcFSJZ2PFw2vSaCwi0XlETu/HjxwZ51C
 2UVH7r+wjtgQBRHgx4F5SgBXfYp+S2Chpp5TETi4v0d+a5Uln8LaKJ7FY
 WRdO/0XvGM0fB0gXs7utUP3g1L1r9ktuwAIKI0IYky31bSozw5h4iQ4Us
 JQV+e8ltiuvbvvw3JUL5MeT75X1nO8HkwrQymA3lFdxUlu0G0mKTB6AsZ
 ghoQMYA2fqLA/l9FEHh5IetI/eiWX75q66sx8drqSlDdftNS9vIAM2i3X A==;
IronPort-SDR: IjGl8hAXdwdX4ZT36i/Bh+oLakbClfhQKBUrEZvsharYUoiOvGF1wPFcOEHz6KXXiPLe7nK8TJ
 KmsAU+UHE5U+a0GmXUyT2vVhM7rrW0p6TTlRaX041AiylBxYBws3CZdFSt1qTXb4LoLxe+TvEb
 Vtl6/1Hb3Gtz4GZi0CiCE4unUUBWj34o44UrYHAY6Se0h+Q9GRZz39k2fvVQUk6I6ZD5gA7aUR
 zkPsCYmO595VOfJv2WKVoM9MZjhwTw/Ywc0D2TzxlLm4yZ6KdgzdhI3QK2tMXPmBFAVoloBA4i
 pfE=
X-IronPort-AV: E=Sophos;i="5.83,230,1616428800"; d="scan'208";a="174577175"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 May 2021 02:44:33 +0800
IronPort-SDR: dw/u6PohckcVGGsispwDMVxH6nmkonrSU+VoMyOLh8bmc7G/YnDqlKQhYNl/nWQ4EK6F6VI20M
 rYxpgHrq8uc/wFiiJbHytMXvlU/zFtYaqcp/k0TrvERCIWt3a4gQcaIlMHVUDEIYzGQvCj/Bg7
 aWLwl/ysQzeJ6Gs8+Ie4qSamn1zpiUrc8c1rTRiIhVpQwNZxjvECh7RfvF5N2KPv59cuyjGird
 ug2XLpqRuurFSpRpOcpEY7CiJUmpi0zmGnfqtt8gWOgMa+L5v9p9uiAN1xLnct07sCibiL2qEZ
 VRtd5z0lllVTf9d/dyXvc8or
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 11:22:35 -0700
IronPort-SDR: 7WscSkZAXKGXqCRtdW1KZCfMKDYysvxYRSJ6fLgIWkvIf5J6dy0sUxukflCpgd5jwIe1F+waJ4
 ataa00iwNT7Xm11XRmbC+jDVT3ege9rIRTHyYiCjZIniVsHpvT9IMh8R5W6wilX8HjieZjtCgv
 Z00gkK7jAaLUI5DOdUrfi0ZkXIYrD+2GZdZbFfnHTRe8DCdehoh6j9acSnmDWbGpPNh8U3e3dI
 oIbYowqDWj+6mzJMppBnMQ7sip9oJjSDkZPcfhOq0+1oAN9ntbg3exzrBd33CdevTXJvlLQwgp
 /Cc=
WDCIronportException: Internal
Received: from unknown (HELO jedi-01.wdc.com) ([10.225.163.91])
 by uls-op-cesaip02.wdc.com with ESMTP; 28 May 2021 11:44:31 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 bpf@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-doc@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alan Kao <alankao@andestech.com>,
 Nick Hu <nickhu@andestech.com>, Vincent Chen <vincent.chen@sifive.com>
Subject: [RFC v2 2/7] RISC-V: Add CSR encodings for all HPMCOUNTERS
Date: Fri, 28 May 2021 11:44:00 -0700
Message-Id: <20210528184405.1793783-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210528184405.1793783-1-atish.patra@wdc.com>
References: <20210528184405.1793783-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_114435_716929_B1BA1BF8 
X-CRM114-Status: UNSURE (   7.89  )
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
index 87ac65696871..e4d369830af4 100644
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
