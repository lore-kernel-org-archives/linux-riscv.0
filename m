Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C947C83017
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 11:03:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FA802080A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 11:03:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bW8mKNCk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="PPcmCu/c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FA802080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QwrxA246aqCM8/I/nBm98O5CtlS8u2eJXaNatGujeE8=; b=bW8mKNCkhABiRVwy6wgl2DChfS
	wBnPMeUr6S4In/nX7n66lSpahNep1jqVmqZcq9aDveR9QIShISM8bdX9/vx+vmwK9jMn/laGWJAUe
	Jl8Jla7k9fCpKnvaygWCRooWormZfCYTIzqgpkA3rV3SkFZgaetn1FFgAgsxVX9ARvWMSbhGzDMH0
	sQQBXqqewScmW2YcC2b0RcMw1mJE7ADUJ4ckyJN0wHQJpIL19IeT+WAfAQoiBKmdX+KfF0b7HFW2V
	9YfgbEVVCYl5H5NdC4MFbHW1zym5yJsd77V0i9m3TKwiGqojkfqpLScgfQri0y15OLFWQTqmGt4fo
	UiRchHbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk3RR-0004SI-23; Tue, 01 Dec 2020 11:03:29 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk3RN-0004Qi-Mi
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 11:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1606820605; x=1638356605;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=21fm/s2a10024hJyayAnBeJLM14GpJpHzPwsgaQUW9U=;
 b=PPcmCu/c6aHYkFqH/dA0AzNokPsOJaqBmnvZSBQQ5TflpHfg6xC7kp78
 bvj1aNz6gvv9RTNZwvIyqftNfJG6G8zaJFm25AbiYIXK3EUvfltcQMiGz
 xOdfqmfSzQrgzvAt+3LzpCkg96IBHRkP+XRTgEv88sJUMqMsGYjZaB22Z
 EDmjYfaATE5szuTwhXmB9zkNghNkExHMpejIj5J23omZ6NcLa/FwhNxSx
 +QwV19qPSlnJppBv7e5vOiBT2Mw5BM+MFBuklh4aT+fBuRuclp8VGpy7k
 t6oOliA0oGeKwgx9VoQl81wot9XtcfMUZ7TIGSsnbK06uWSQz092I/25E A==;
IronPort-SDR: 1OYou1MdYQAQHhN+oytf220YFG6dvyBEvttP9dqsGqe5oVAbCJfhX/uQCq8LzHyVUdhh9jlZjP
 bOkBdSOA6B3Q2wWgGOeKk8YijdBVben2dKp+Fy2crxFjx/EultzKIJBbwJ0j/WaY7hhRfkm8DT
 ei1A8tvR++zYwZ/+FXbUKyr1wJ+yteCaT31dC0TXZxpIL5qWJJAsD5DbXC902glflUDlWcG6Yu
 RVrC+0DOnbFPJ4C2hzWQVeDkfoBDvdTk8ByiBGQAnWCrAaE198GrU8W5Owt0S0JO9+mYpYYqBF
 bPc=
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="100945453"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Dec 2020 04:03:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 1 Dec 2020 04:03:19 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Tue, 1 Dec 2020 04:03:17 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 5/5] MAINTAINERS: add microchip polarfire soc support
Date: Tue, 1 Dec 2020 11:03:16 +0000
Message-ID: <20201201110316.28656-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_060325_969931_6B7AFAAD 
X-CRM114-Status: UNSURE (   7.27  )
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
Cc: cyril.jean@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, anup.patel@wdc.com, atish.patra@wdc.com,
 Conor Dooley <conor.dooley@microchip.com>, lewis.hanly@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Add Cyril Jean and Lewis Hanly as maintainers for the Microchip SoC
directory

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2daa6ee673f7..2241bdac4816 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14989,6 +14989,15 @@ F:	arch/riscv/
 N:	riscv
 K:	riscv
 
+RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
+M:	Lewis Hanly <lewis.hanly@microchip.com>
+M:	Cyril Jean <cyril.jean@microchip.com>
+L:	linux-riscv@lists.infradead.org
+S:	Supported
+F:	drivers/mailbox/mailbox-mpfs.c
+F:	drivers/soc/microchip/
+F:	include/soc/microchip/mpfs.h
+
 RNBD BLOCK DRIVERS
 M:	Danil Kipnis <danil.kipnis@cloud.ionos.com>
 M:	Jack Wang <jinpu.wang@cloud.ionos.com>
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
