Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C539C001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 12:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1i5/MHBG6V8wkx7p7R/9uWeeNYtV4/bOCfCZG1Vbzc=; b=OmS1Je4A3zBhAJ
	Z4EK6Lg/QJDc45dI/5MnILwtjPCDD64HpEsfsMmu4JsMBYyTrjh33gakfQstFItSoYC4dBNzDAnYW
	gvCJUk+mE2EB/jiNeH9b/LdZ7Hi75wros99Me2RJSShPXeO0bVuuL79lq7SHL9EzvkQwixO2daBRJ
	P3jr80U9AHODijpu7HhLDmNP+oMFD+tbrgCMGyoJil9dTNinFjiv5GqDiIlsKIpe4PfohUambloVV
	SAtJ1t9NsK74YDQK7s05dGAlvCLbk2zrMs6TqTs/Bg1zKQ456QHlpfa3K0s7dozIWYvAhE7nzOTvG
	qTSec5eDKoHuU8O+raig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRdi-00FUh4-2e;
	Mon, 31 Jul 2023 12:04:42 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRdd-00FUdI-03
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 12:04:38 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3a412653352so3023642b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 05:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690805076; x=1691409876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIucR+Sjo1L1b52bma92ee9wHRVqNY7UNJqfHapIUO8=;
        b=eAAVNloP9p+8BWzpb+GCeyEqZre3HkYr+w7Wldlxy8JC2pOPcvfcfsAReK8/lp6+FO
         2GHUqukJ3POTBxEAHlsd+40caRTdkCqpoKxXXvGPFgNt0Qq/W962EwqFg/UTTfa9yd6t
         GpfwfNZLqBcP1X3Ctz0tMIcl0snYkAZ9vBimx8uInovpB3LaeWt42mLJ9KvX2nsHhfhA
         F9eyHTfo0s42IS3A4DjvWh7p3ziFGMXGk8zh9fqVKc+iuiZvaKVMu8ogFhYPV5loLwus
         SAsIgIrYHwElnvhV9X4XrbaOGZ7PVC0cPdxBzlnEKRSu5qXuMGGKl2HK7iV82mkGb8od
         Zh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805076; x=1691409876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIucR+Sjo1L1b52bma92ee9wHRVqNY7UNJqfHapIUO8=;
        b=HNdA4/B9yzc1Y/Qh21T7ir9+BQkLkcUwv2BWNsKQq/9n7aeBzuI+Nnbttcl40CdpfB
         SxujRXUPwCFJwQrDJWFvsUevkyQ5qHUIk3clYxsUaLhNqdKEX2XcFwQYrh+/9RWuV8Av
         rRl5k2nFrl80LO/N3qJ1rvBZBEKQjYxcrSQac+UM2SdskLK6FLUi8foCqpLRVlF0Wvwr
         552UIRQQezmnXeuR6lU97EYOunEQ4SStd3zZsIsYFxkNkDhhqEoPJBMOwQ2L1nZSU3+K
         ZpeSu1lMIqWib9WJ3Ihg2yU1H9PY9l89ipzHaf0lDk0Kp7EX/orZIq0Uo7iPYw9Y5jKz
         EmbA==
X-Gm-Message-State: ABy/qLaFu6HmydomQCoJLyPSXCkjHNHCOK61lmTuZ6bX/W6CWdA3V94B
	H3MI730qua9q4pVEfhilanl0qQ==
X-Google-Smtp-Source: APBJJlFF1X9useGPToJKkpTy0AkH3xIA5EFERBBIFwAku2kDhpMk0eZE6+trW1uN+35617iGK2V/hw==
X-Received: by 2002:a05:6808:1689:b0:3a4:633:44d2 with SMTP id bb9-20020a056808168900b003a4063344d2mr11844680oib.18.1690805076179;
        Mon, 31 Jul 2023 05:04:36 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
        by smtp.gmail.com with ESMTPSA id a12-20020aca1a0c000000b003a41484b23dsm3959316oia.46.2023.07.31.05.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 05:04:35 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 3/6] RISC-V: KVM: do not EOPNOTSUPP in set_one_reg() zicbo(m|z)
Date: Mon, 31 Jul 2023 09:04:17 -0300
Message-ID: <20230731120420.91007-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731120420.91007-1-dbarboza@ventanamicro.com>
References: <20230731120420.91007-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_050437_057019_A5AD5C9F 
X-CRM114-Status: GOOD (  12.43  )
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

zicbom_block_size and zicboz_block_size have a peculiar API: they can be
read via get_one_reg() but any write will return a EOPNOTSUPP.

It makes sense to return a 'not supported' error since both values can't
be changed, but as far as userspace goes they're regs that are throwing
the same EOPNOTSUPP error even if they were read beforehand via
get_one_reg(), even if the same  read value is being written back.
EOPNOTSUPP is also returned even if ZICBOM/ZICBOZ aren't enabled in the
host.

Change both to work more like their counterparts in get_one_reg() and
return -ENOENT if their respective extensions aren't available. After
that, check if the userspace is written a valid value (i.e. the host
value). Throw an -EINVAL if that's not case, let it slide otherwise.

This allows both regs to be read/written by userspace in a 'lazy'
manner, as long as the userspace doesn't change the reg vals.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index e630a68e4f27..42bf01ab6a8f 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -213,9 +213,17 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		}
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
-		return -EOPNOTSUPP;
+		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOM))
+			return -ENOENT;
+		if (reg_val != riscv_cbom_block_size)
+			return -EINVAL;
+		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
-		return -EOPNOTSUPP;
+		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOZ))
+			return -ENOENT;
+		if (reg_val != riscv_cboz_block_size)
+			return -EINVAL;
+		break;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
 		if (!vcpu->arch.ran_atleast_once)
 			vcpu->arch.mvendorid = reg_val;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
