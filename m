Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F19C04A6A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 16:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H9iD7DfvOs9ze3vy18thfoDV7qxVTAvmYi+kcHZQpos=; b=gwNYfIEIEKV+t6
	hknrmwAmLIQRXB+AvbKFWJA8KLLTcqbFR1g/x+gTrua0SBvEShvqNxTdBOX8PtA1YlabGRKYgRwTd
	DSM38qHyl93bhZ0E0BkQ3zWYyitUBXpLxqyz71wQIn7gdrNb8QWO2T3TuPlZJctaMkGrV5ODxrpB8
	99Q6iFHWwuKRc7NYtJnXNDoIt/ZV5RlJIrHCy+ZXq5f9zK8XBzgcIU1gtpWODK23L6iL3GL+FuU6L
	7nhDI1hzNySf3oNciR1HvnuOcKVJ50UQ4U2pVMzjp+DCq/rRkBWsN2ZgD7TNt9546dMErB2/akgPx
	WDmOrAuW22cJB+UZsARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGM-00AKYG-0X;
	Thu, 03 Aug 2023 16:33:22 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGI-00AKTz-3B
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 16:33:20 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1bb7d1f7aeaso826047fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 09:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691080397; x=1691685197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fx5RruSr8XX/h9I2AtxnZ2PV0E5AQnOItUyD2ZQGSo=;
        b=OXVlIvxqZq/ugA1tq8HnCrf89IYbUi3eCY5Lw7klgG72620m39mehcGvLdVyg8XyzC
         m2SoQpwziTq7cySZd+Q4LKeLr6ZjPVep9YuOuiRsYcHZ21oia+3/B58NVbFXThBSXxro
         +ZftTWsJA6qUlshZf0K89f4vgs4nFbHNvi1Auv3VxjtLAOLCtIrHJl4b6vHKM8GyhiJD
         q9xMGGPOqIKCLnOvkIwOmKEs4NVy0KTcsN2vxA8omyt2IF3/7+U0kZomC/Aojok5VYn7
         MWVlAumDQBlubFvgBOpBgQoQfJ/ApYfWdm/sXjcZ/eC8VLaUDFFrYDkQaUmff8ziH8Cu
         Iw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691080397; x=1691685197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fx5RruSr8XX/h9I2AtxnZ2PV0E5AQnOItUyD2ZQGSo=;
        b=HrfsTmpnVJ8TxJ1Taa1lFDzLOhyznfK6M0x1zQeNYGecSxB3JMSMLNjpJFu1qQnTAT
         N8EMomTaS61n+sE+JhjWaTzonA+DCDhgOF+ke5l/DJvT0Pbqvv5qtV8txPRnIKxz7MCH
         Fv+yeUqHc4Ogcug41DmFEr3yPVqOzrWQzRP1Tm/GXRaQ4Wu+3Gm6f+mK/PJsOn7CY6pC
         0mvzhxcP3EEghtlN3cVBox29s3+sAufCTiuL//Eo66itXNKqTApCFhPW7AsEXNQdK8uZ
         zH3BfG1DysfJgT6oT/YTLT2Wxx8AxBTxjED2ssBTlX5A1FWVYmV6B2eyrhxEFtm9pPmK
         fBYg==
X-Gm-Message-State: ABy/qLYgInZDTgqRrIZpNVD6fRtv3ruaHrZtI8UaTY3uAd47kxe0k6Z6
	/wg3GGLi6ZyNudy5RHAzjEUGlg==
X-Google-Smtp-Source: APBJJlGcRltldAfni3BfR3KZMxmiX5SNdIToiZOXvm/eqO5x/Ld7sy5xC6M5vBBDuRjgsANoD+hfWQ==
X-Received: by 2002:a05:6870:4251:b0:1ba:199a:984a with SMTP id v17-20020a056870425100b001ba199a984amr21455947oac.55.1691080396728;
        Thu, 03 Aug 2023 09:33:16 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id y5-20020a056870428500b001bb71264dccsm152929oah.8.2023.08.03.09.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 09:33:16 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 03/10] RISC-V: KVM: do not EOPNOTSUPP in set_one_reg() zicbo(m|z)
Date: Thu,  3 Aug 2023 13:32:55 -0300
Message-ID: <20230803163302.445167-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803163302.445167-1-dbarboza@ventanamicro.com>
References: <20230803163302.445167-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_093319_024459_F8E4E082 
X-CRM114-Status: GOOD (  12.60  )
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
index 1ffd8ac3800a..e06256dd8d24 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -216,9 +216,17 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
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
