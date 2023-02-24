Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE89C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 15:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Gda6d0KsQ9gxdJCxQKJWhJISmpTOLQ+O5obFbch0ME=; b=WU5TQjPd46UkpS
	sVi+D2ANO9bNWTCNNXI9sMGwWkwu3ntk3zJ59LakV+m9KNDEEv7dDUqRj30c6oVy4wzV/TpXz2kcs
	vGGmV/jAU8OO99S9yO5nvqOU6zfNRugL+wAqRPpt/qNk6g+71/av6Yuv7fOT9n+ciFir18ODhwClz
	MSTWFDEP2nrUWjPneRYw9MMYlR7m/E9aHbGo1hhVumRn5CA2hMBh6fPO8Fuq9Hmr3YRjmVYFb2gbU
	IDxf+UMymuwzpTY9J0LDT0vlpjN86i74BeFxyqpJDHQhPvpJgH1NEONrqJEGpG3OqL1ncimOAYqst
	L7QDl1wPqOadhAgcHpcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVaGy-0030be-B5; Fri, 24 Feb 2023 15:46:12 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVaGv-0030a1-9Z
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 15:46:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id j2so14185065wrh.9
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 07:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGbYsJ7D0VVgip5QYpKcTxXrep0iIVqF+e55j64Dw9E=;
        b=aTTd/R2RL2oA04nfD/jdxo5g7RvLD61XMDRh7gUDRW2eHBnFG6O25luyjWUl0Ch+ux
         XPCrdtfIhpBSz5/V4r8lodVGKWWfnpcZzd5c2RylEm7VHxqzhMQJlcbGlW1zIo/bUW7s
         XKJ9cijoWuNx+XcLXymsT0iNBOGiZU8IM5mJvVdu+5A9i0TyiueBvmNVuHPhpI0CFIUe
         M+J/I3KeaKRaude2Kn++yxVOK7RSfYxPLIGpStU5/RjK04jT+QdIcZpLzo9kw+9pKW4g
         fXdgU9RhfG845myjk9LZ8iIamfedqJvf+0o8ggAQeAHXSsl/qnpgvNiFiAoPz78Yetn+
         49ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGbYsJ7D0VVgip5QYpKcTxXrep0iIVqF+e55j64Dw9E=;
        b=VIyMDLwE2zYyYVyh4y6+oTwVWNYeZtI5eHjM9xKRuaVOj7UXWbKr84qYG4Hhuzzkzo
         IQyfofRvClDAqavKiiJBmTKJTn3cBX6sITot0lS5NqZdcHqyYj2S8CmItJ4vpeZFPI55
         0dMezuPtRIQyQgbg4sSdqTl1W+HyTanEVEdNwZ+aFckU5eyO2uLCrztpA7DVVrwI1o4G
         vQSPzOdp/7l5gqjnsIEVKIc5a3vPsLUgGb9GVMGQlwE228oMlnf59NIvpG+LC3kFUnCi
         bRIoiyaqjLrmsDD9tZeUSWagJCP9SReYSmerop84jqzmjqWktDXN4y36NLBn3ngcI6ds
         RY9w==
X-Gm-Message-State: AO0yUKXanMYVc3FUIdhUYvPn1F93dQPAxyLE3MlfzDsvcXv/W3g6Smu8
	JjDERQktw9KXxSdR3JP2+zhxigieemLCfPG6
X-Google-Smtp-Source: AK7set+FhKTTfQ5xvzxi/YoISfCu1v5v85pkr5VHbFHuQl2mIFCxFnIB/RHqj73g2R77Iu0vhkp5dg==
X-Received: by 2002:a5d:58f5:0:b0:2c3:f8b8:87 with SMTP id f21-20020a5d58f5000000b002c3f8b80087mr13010768wrd.25.1677253565981;
        Fri, 24 Feb 2023 07:46:05 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id l11-20020adff48b000000b002c592535839sm13414793wro.17.2023.02.24.07.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 07:46:05 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v2 2/6] riscv: Rename Kconfig.erratas to Kconfig.errata
Date: Fri, 24 Feb 2023 16:45:57 +0100
Message-Id: <20230224154601.88163-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224154601.88163-1-ajones@ventanamicro.com>
References: <20230224154601.88163-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_074609_350202_C3C148BD 
X-CRM114-Status: UNSURE (   7.35  )
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

Errata is already plural for erratum. Rename it to make the
grammar gooder.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/Kconfig                             | 2 +-
 arch/riscv/{Kconfig.erratas => Kconfig.errata} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/riscv/{Kconfig.erratas => Kconfig.errata} (100%)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index eb087e17c91b..80bc960706e3 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -246,7 +246,7 @@ config AS_HAS_INSN
 	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
 
 source "arch/riscv/Kconfig.socs"
-source "arch/riscv/Kconfig.erratas"
+source "arch/riscv/Kconfig.errata"
 
 menu "Platform type"
 
diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.errata
similarity index 100%
rename from arch/riscv/Kconfig.erratas
rename to arch/riscv/Kconfig.errata
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
