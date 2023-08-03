Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1025BC04A6A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TJ/IxhEPu0+m5T8sJwy7zn+DMJeXd4ld2c0r1JqgRo=; b=wBWEmu1e4jp2Rn
	GZE1jNZ9SwtFTkn1cF+t41JU9itaFp8guxTFAOk8q2T0Ws5zV5WnzAkptRKm4+BLe/6vOgJ9nMqQW
	GpITQ5npVBhXou6CICqQhecj8WZ4HONH1XnySYAJxaTZm49VeuwBiopjhmAQrmcgwk/GVFZFxn9gp
	/kr1L9dTBEHHvVRkqQoHF0D8eyuo7QlnTloNHxBKfEDTFyK2+JYF9a00BCsHngyneNwDS5hg3lsoU
	tc0MDHbrayI3RWFVbo1KPJkpmzQGv2dLae7uQV7q8w9Azh3fKL5XSXweo2yWpd9gnSPq4yNA+VDYM
	evaTOvldZtbE5Drs6vZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYsk-009MBP-0l;
	Thu, 03 Aug 2023 14:00:50 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYsd-009Lzg-22
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 14:00:48 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5633b7e5f90so696054eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 07:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691071238; x=1691676038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfxDwps7lgF17ypk0wnS9BfXgR1hQYuTelZWUrO/6tw=;
        b=CMqqPGLsMMuaZEUTphocqW4yFgSoZOpFqaDfOJpm5Rug/qGE9nn49ubd9rzwGFSkYy
         gQUOqVylXWKM/wTTBU8nWcEHm3tuePXEChxVDioVSXD6CJ2rw3z0aEehDSfzXZ+gBX34
         yrO8a/MPZztz43ooGbfxP15GnXMDOCZKYKm6mCz55w1JGXGI9fAY/GO4ynGqjvHLC7vg
         VW/5fP/O+PQuhuSGS42oR/3+eXmK+PtqPtt2VySOYmoEjtW5KTuwpdJPTWr6/AwvmnBU
         MgZ7I0ojWWcuyr4IJ/AJdYFvTeo3cwAlmSsCB5iumEtSoFaYOYFmEPyaAV6/O35EVbNH
         kw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071238; x=1691676038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfxDwps7lgF17ypk0wnS9BfXgR1hQYuTelZWUrO/6tw=;
        b=ZrEQeJTDq1MLVjSVkDM6sZ8PIfN/DEv5Y/DncStGx3Z3z7j/izqDhXYtUSGAtbOgnF
         HyP6YXlvppYedR1E4OpK9ASjg45Gt5FEWwDgJrmYT6SO9/OEDEIRxXcHMQqkg3hym1jp
         JJ1BxSmZxtzkafm6exTzeWEgci2o2/JVLoghdYozcoLMjtb82DuD5uyv4rNjB5QGRP16
         remoG9XirIWSU/I6l0Zf3PLz0aTMlhMdb6sNDea8g/ZO2VAhb5r+EwzBB/c7V0D/3Pwe
         QNH64z8ULJV5ReBd/koZicYzjvAhhQ+dqhtAgPYzE7EMYo/bGdKULXKRJ7V8MYyzbizS
         Cd9Q==
X-Gm-Message-State: ABy/qLZuoHuFrQ7CKVp7bf1xq9U/HA0bncwOHR8n/IDNBKUTUHblqW7t
	ThEoO8s1PRuqy/Ucoxa7qkrxvQ==
X-Google-Smtp-Source: APBJJlH4xxE7xbhXT7gfioaufiAVlVy9fF4cSW5XrzYXhlLE8iZBPjWLQ97nKoSQ2HQL6LkEmEzfrw==
X-Received: by 2002:a05:6870:ac0d:b0:1b3:eec8:fa90 with SMTP id kw13-20020a056870ac0d00b001b3eec8fa90mr25825081oab.6.1691071237839;
        Thu, 03 Aug 2023 07:00:37 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e14-20020a0568301e4e00b006b29a73efb5sm11628otj.7.2023.08.03.07.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:00:37 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 03/10] RISC-V: KVM: do not EOPNOTSUPP in set_one_reg() zicbo(m|z)
Date: Thu,  3 Aug 2023 11:00:15 -0300
Message-ID: <20230803140022.399333-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803140022.399333-1-dbarboza@ventanamicro.com>
References: <20230803140022.399333-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_070044_131198_E4499AFE 
X-CRM114-Status: GOOD (  12.81  )
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
index 546f75930d63..49d5676928e4 100644
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
