Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B90EC0044B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 20:18:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 404A0222AC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 20:18:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lZpvts46";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="PyUNhGEo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 404A0222AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yp824XKfX+CAHGGUn+XWKhrKyv674BKevqdM2T9jp/M=; b=lZpvts46Q5+7vPcOsyWSMODQ3o
	/Gpkoyhb+MumGlh5cjF2m/RWu1bmlBKoqzrw2J3By+2pdi1u8ik+3a4hpIfQOrUHi8xG+Y1i5StXR
	9S+1BWrwaNKN9hSCF85NguqAohXPD9Y5gEt2IEYH0jHtVGydlhrHrWx+LG8qWtLxg8TbY99D1Ftgw
	THUyHhGedKX1NuLZzaRYZMlbKtAnDIQf9NKGrJfEh3zb1H+rx7+E7ni7LZ+hkAS0E3DA5fyHwCJnV
	2AYoTpioVQJVMFaP6Yb9KuZt/FWK7nBvy9ReOa6kh0EuOgZmoi8SxUHzdtbD+eOSmIpkfDNAqNPAY
	uUPsbrMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu0zF-0003Ju-E3; Wed, 13 Feb 2019 20:18:29 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu0z9-0003C4-R9
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 20:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550089104; x=1581625104;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=dA6aSe5XZKK9jbqPUE7aSPe08mUJ7TsRaBX9UTEfvg4=;
 b=PyUNhGEo8zyQx0+LlTmOagrDzt+NZp6n/22lE6VWiwZzADZufT1zEFtt
 ELE0wjp1Idpg+y5MOK2yHmX+4YvwoKI5eZgrDUBlGHVuxbSuyzE0hbadW
 C5bM9uJC5Wsq2iLzGIurgfXbBx0+wg2pl6GkVglxFQxtDuiV4WYkDtcol
 QPFx/o91i6TlRfIx5I2O3vqTdFfSbotB879nCBQoSzTnpwv9JF+NMLDH5
 d8Um9kEZnvy8U+rU492/2MAY89Wl8b+0WwJrCl8AvYB9ryOAK2kgwG/RN
 an0BhQm60ZyfBkpP7sZFE5OaF6PT12bMmRrcPKjNfeWauDmEELAmAz1zr w==;
X-IronPort-AV: E=Sophos;i="5.58,366,1544457600"; d="scan'208";a="102463817"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Feb 2019 04:18:21 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 13 Feb 2019 11:56:54 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Feb 2019 12:18:21 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v5 PATCH 3/8] RISC-V: Remove NR_CPUs check during hartid search from
 DT
Date: Wed, 13 Feb 2019 12:18:07 -0800
Message-Id: <1550089092-28783-4-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550089092-28783-1-git-send-email-atish.patra@wdc.com>
References: <1550089092-28783-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_121823_996977_CBA0F5C5 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Guenter Roeck <linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

In non-smp configuration, hartid can be higher that NR_CPUS.
riscv_of_processor_hartid should not be compared to hartid to NR_CPUS in
that case. Moreover, this function checks all the DT properties of a
hart node. NR_CPUS comparison seems out of place.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kernel/cpu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index d1d9bfd5..cf2fca12 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -34,10 +34,6 @@ int riscv_of_processor_hartid(struct device_node *node)
 		pr_warn("Found CPU without hart ID\n");
 		return -ENODEV;
 	}
-	if (hart >= NR_CPUS) {
-		pr_info("Found hart ID %d, which is above NR_CPUs.  Disabling this hart\n", hart);
-		return -ENODEV;
-	}
 
 	if (!of_device_is_available(node)) {
 		pr_info("CPU with hartid=%d is not available\n", hart);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
