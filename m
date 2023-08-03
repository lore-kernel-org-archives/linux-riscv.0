Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B8EC04E69
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 16:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/fkcV4FOZsUNhqceeocv7NPHOe+tLliExxp/Y04xUWg=; b=yMgtb+2VO2VjTC
	qpdxrip/KcnATq64aZvj6re3xH+OAj2JEDdZcIBt7D3ngtAA/ZK5t9SSGKNqzDGWmazrVT57oKztz
	0SxoSFn/iE0Nv1eq+a3Vj/uDQx/pxhlMLm5SrbgvdNwIaNRJbe45odvrf+MLHTGcqur67Ywl6r0o8
	YvwIO8r1wKrPasQRMtVjn5cFz6+P8/osPPaohZFeSNTejffWpjJiCJOQxxleYqUaouqGQd6Rvb0r9
	BhwQWut5vC2fjovCiZDaZ8zluyhe8PucGwH6aMhvzvnF+nDOMfCJ56IAGIRehKkWzihWk8IdErNFz
	8ooPWTo9KHTdxQinJs3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGR-00AKe0-2U;
	Thu, 03 Aug 2023 16:33:27 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGP-00AKYS-0O
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 16:33:26 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6bcccbd9365so538359a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 09:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691080402; x=1691685202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEYaOjRkNiCc5Arsd3SH+zFXne751CxcbC3uwvEPq2E=;
        b=nDqgSReQn24+I/TOy7vw45dSl5z0FFfSL4cVqGNwP0d0zlHKuSGsFLdlXng8abhd7q
         J/hIudebRlWXVsf5f0chJQEScgO6UFi5gVeNqlnnZiv2ktY3ija7neMd+GJvW0qGS1Jb
         DN/Lkjj+so6bSseF3VG9x1Iv5wSJBqV+r3vRnBaSLqTlALDqRIrv/SE7nwNjFfVks0le
         MlS1wKRpXnFKpEXXvZGPXh19Q5Z/jg4quL0E7sJ78ZvGrILu4tBaq1VWB52uM6PC8OR5
         0+S6IpNYUS9AuCti4m7DjFcI+0YMKAxr4QchZW+qSPitKjCVCr6b19wKbYHvRzS8qPk/
         x1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691080402; x=1691685202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEYaOjRkNiCc5Arsd3SH+zFXne751CxcbC3uwvEPq2E=;
        b=LHdbDVgHFZzS3i6zA2Bm8UpE1ZUkCE7pH3Nsrl+xWEIwnEmGRLr9eKE/rCrKVTSebs
         08Yfk8y11cL682+ontTMoUwaeEcyVGkXuSRRn9SD6z6KB9JlUGpSiVGiTPDa9QGrERfa
         n4VDWGWfNhTbtyRpvej+dxeFgNMJJ7k2B2Sh8W7VJA92h078VEfaLYmt3D8DY0jatAr4
         mTgBHzBqBxHjD6WSpSYyob7TVs9fTG/1S43yA2+AsK1TzfGyslUNNYQ+n8W8858I5sjI
         MNgtjDBTVOdH0NCmPNewF//oD/b6HI6q55lwqumJvlj9VQCF2mkbmI/T08Fo76w6QsD4
         HMxQ==
X-Gm-Message-State: ABy/qLYBCL56t1ENG+N6AQJtdSo4b8LzqmiwSom3CP7j+AefSnBNFtEt
	JEOnBQ7ze2HljC3BQfPiNTtydg==
X-Google-Smtp-Source: APBJJlGKhxjt9ppMdXXgRQCK3rogM/kWokH5xOaV/O6CG2pZlKZm+depQdkRXmyceKMNzwj0pPo86Q==
X-Received: by 2002:a05:6808:1144:b0:3a7:4cf6:f0cb with SMTP id u4-20020a056808114400b003a74cf6f0cbmr10603918oiu.21.1691080402043;
        Thu, 03 Aug 2023 09:33:22 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id y5-20020a056870428500b001bb71264dccsm152929oah.8.2023.08.03.09.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 09:33:21 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 05/10] RISC-V: KVM: use EBUSY when !vcpu->arch.ran_atleast_once
Date: Thu,  3 Aug 2023 13:32:57 -0300
Message-ID: <20230803163302.445167-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803163302.445167-1-dbarboza@ventanamicro.com>
References: <20230803163302.445167-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_093325_189567_05CBD854 
X-CRM114-Status: GOOD (  10.87  )
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

vcpu_set_reg_config() and vcpu_set_reg_isa_ext() is throwing an
EOPNOTSUPP error when !vcpu->arch.ran_atleast_once. In similar cases
we're throwing an EBUSY error, like in mvendorid/marchid/mimpid
set_reg().

EOPNOTSUPP has a conotation of finality. EBUSY is more adequate in this
case since its a condition/error related to the vcpu lifecycle.

Change these EOPNOTSUPP instances to EBUSY.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index e06256dd8d24..971a2eb83180 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -212,7 +212,7 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 			vcpu->arch.isa[0] = reg_val;
 			kvm_riscv_vcpu_fp_reset(vcpu);
 		} else {
-			return -EOPNOTSUPP;
+			return -EBUSY;
 		}
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
@@ -484,7 +484,7 @@ static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 		kvm_riscv_vcpu_fp_reset(vcpu);
 	} else {
-		return -EOPNOTSUPP;
+		return -EBUSY;
 	}
 
 	return 0;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
