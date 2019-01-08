Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F095EC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 09:38:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC82A206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 09:38:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xx6uFDT1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="JDRKqt76"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC82A206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iaVQLkgs2QWgkqE3Qtu8mqs865dfS2z9DuCvBdss/gs=; b=Xx6uFDT1BQRRhSFfI+uMNYOJQh
	qiffvX/cmjr9+cIb/FFIHuhOItZPB8sZ9LiYa0oGY3SkYByccc7eAZv+YtnKJVVcs3ZdmpIvcGcwB
	TPO837UxYy/gEprfEbaWm8hKYc6VEd53hlXRgM0DuThhG5I/Gd7n3EssTJdSDn3wBGnh+ubPJ6OX/
	gs0ViGARVyHHoHm9s0NUXISW3LZSF399PfQ1Oi82U1rVco4GvrVyyD7ihpHdW8bfLwKqknaq0jYzo
	7gfJUJWGx77HKexFqkz9BluAPyzAoZ4ig+QU0hojctdE7NXves0QVYasqi42ihGkdp8Xm9NIffAHs
	gwD2O5Iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggnqb-0003un-29; Tue, 08 Jan 2019 09:38:57 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggnqT-0003lv-Ak
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 09:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1546940330; x=1578476330;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=c3GlsSU9hpztl0F7FBnfC5nPlii3rUi/viUc2pT+k2g=;
 b=JDRKqt76G/lqPd5zX/UzTvH8wE7a4teB0xD1e3y8d+Q1mAqdAruQugHe
 /W8RIafPy9EjX91bcEIGUKslq2ECRPgZjsteidMhSg4d1ovdv0D1J+YG/
 SVkOv6zZhTjLlSc/+7CHBynGYHmsKwx9wCKoHYMsnTGtiyFmjRTgF1QsF
 AqBcm3VyGyy9OvZ2bgVxjuaP5yl/2qEHlPg3kPQUP16g2zdEkN01PuxdY
 we6PAMoQo4jadbb4n+BCsSnAjn3j9xH+hUOBALMNiadZvKDD3vU4DYbL/
 MktkemhHfY99GLGt6iZ7NwZ98uJXP7M50zqwcsbNTXjh5+iLzT4AUHAQL Q==;
X-IronPort-AV: E=Sophos;i="5.56,453,1539619200"; d="scan'208";a="100000254"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2019 17:38:48 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 08 Jan 2019 01:18:51 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jan 2019 01:38:46 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v2 4/8] RISC-V: Allow hartid-to-cpuid function to fail.
Date: Tue,  8 Jan 2019 01:38:34 -0800
Message-Id: <1546940318-9752-5-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
References: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_013849_482014_025F8A13 
X-CRM114-Status: GOOD (  11.11  )
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
Cc: =?UTF-8?q?Patrick=20St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-kernel@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Andreas Schwab <schwab@suse.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Zong Li <zongbox@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

It is perfectly okay to call riscv_hartid_to_cpuid for a
hartid that is not mapped with an CPU id. It can happen
if the calling functions retrieves the hartid from DT.
However, that hartid was never brought online by the firmware
or kernel for any reasons.

No need to BUG() in the above case. A negative error return
is sufficient and the calling function should check for the
return value always.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/smp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index e407bd4f..ce9a2e73 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -58,7 +58,6 @@ int riscv_hartid_to_cpuid(int hartid)
 			return i;
 
 	pr_err("Couldn't find cpu id for hartid [%d]\n", hartid);
-	BUG();
 	return i;
 }
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
