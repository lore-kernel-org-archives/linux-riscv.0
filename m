Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300BCEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 16:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ttqdsDixgCk0GOeeBOp2dQ/3dXtPxSlylvkWPrr0w5c=; b=Qqa8YmmETS4u/u
	aeotiXrHL7rMZMS0dWIT2fbQcjwysXEzfQ5HepE+KIubhWOxugblOOwSyXZhDSM/fgTIVYI12r2+n
	NvJIJ8OjHAVG6sH+2fS6IfrvTILzPGf+R1nLeYm1cSf22ADIE+FZZm46KtxgJ/B195ewXlFgG10qM
	gcwKtylthGltcfgpaFqF4nn3wUv5V9mLTNnWInQ7SxpGCvS02Qns1FNC4f7SHcrRNPMV4kj3FCmNU
	+X/KOngms56NPpkVu9cXz0N7rSHu3WA3la1tVH0cpUV22L+Gk0lRZHFF3r8lSkh/q16YO7LSvpYJY
	McDo4Vvb9jg3WNxzrOug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGX-00AKjl-0b;
	Thu, 03 Aug 2023 16:33:33 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGU-00AKdq-0x
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 16:33:31 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6bb29b9044dso1122703a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691080407; x=1691685207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qX6uX+zjhMvlxZ1l4PideJKUAkuckmjO6QKloArzLfk=;
        b=R94Jg27ghBMe+8pXyv0yNEDs0bC953tVdWKPFV6vA4TGK6rzvTc09Y52RVPgfdp0mG
         /6RpDcjZJW5laVWp2iBMOuPs7dwUeHIQtpV5sa9d9dlTN46QrCnnjJj9ru1HkA4X352q
         yc/y/mPR/WIKSfMgrK8ovU1adcSD6tkSp40mcP9J7vrEGVnAmmhfkSZXzfXrwd3n7X/t
         gzrPj9TuiW6ucIgg4GJ1+QGG50bQEbJBTUPNS0y9nhC5FmNRMHevTeDy+1nHyRKbh9c1
         X0GCHHwVFuZUWQvVbYcCldacF/7YPRwWHAzsjpNDxUZ3pS2+6S61CZgDWf7oYL4Yb04h
         +SXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691080407; x=1691685207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qX6uX+zjhMvlxZ1l4PideJKUAkuckmjO6QKloArzLfk=;
        b=gLctptbiTyhSZ5R6DURXA1AWx4i6LaaELZaLxBRpYFDI9LBSe6g6naqWoAzutJgsK/
         EbeMrpTCWPvaBVEnAvhTBHe0JV7M2onN6tAo7ziTwYGX8q0iN00kKxsxQJsANQAUcD5G
         hLs9LaDeCASGhyIl58ZKUTbipw2tPBX5mE4CfSiRTum9qeO2CxKLGIt9bT59akxbgGk1
         Z6GMhR98CusEiDpq3JrDAL0JgWhTzHKDnbnmyO3CZUpOLjIKvoSC6z4trlQ6LPbNRKXj
         jS7I9Zyp7BhfEnvqmTcrvc6VRnqOd+YSKqfcEfJcvzbZbx8LlwM27hRikmNgh9kjJaXV
         1pgA==
X-Gm-Message-State: ABy/qLZv2ZKDPIt7fpQitH7xfbOsbvK4KPfsHw8meRiKBe7z49y+qeQW
	rfJcVjEZTPA1dB5BJLn1yqD9Bqtd3HJny/+HS1wRlQ==
X-Google-Smtp-Source: APBJJlF4UpvVSQIIhQhdxGLDKP5P6kayfkJ70CHnvKXEJ6xr3Aa4W68v/I+nOVn2bKwzsQK9klklyA==
X-Received: by 2002:a05:6870:f583:b0:1ba:f2eb:baa3 with SMTP id eh3-20020a056870f58300b001baf2ebbaa3mr21860578oab.3.1691080407296;
        Thu, 03 Aug 2023 09:33:27 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id y5-20020a056870428500b001bb71264dccsm152929oah.8.2023.08.03.09.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 09:33:26 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 07/10] RISC-V: KVM: avoid EBUSY when writing the same machine ID val
Date: Thu,  3 Aug 2023 13:32:59 -0300
Message-ID: <20230803163302.445167-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803163302.445167-1-dbarboza@ventanamicro.com>
References: <20230803163302.445167-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_093330_351129_8E214984 
X-CRM114-Status: UNSURE (   9.96  )
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

Right now we do not allow any write in mvendorid/marchid/mimpid if the
vcpu already started, preventing these regs to be changed.

However, if userspace doesn't change them, an alternative is to consider
the reg write a no-op and avoid erroring out altogether. Userpace can
then be oblivious about KVM internals if no changes were intended in the
first place.

Allow the same form of 'lazy writing' that registers such as
zicbom/zicboz_block_size supports: avoid erroring out if userspace makes
no changes in mvendorid/marchid/mimpid during reg write.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index a0b0364b038f..81cb6b2784db 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -235,18 +235,24 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
+		if (reg_val == vcpu->arch.mvendorid)
+			break;
 		if (!vcpu->arch.ran_atleast_once)
 			vcpu->arch.mvendorid = reg_val;
 		else
 			return -EBUSY;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(marchid):
+		if (reg_val == vcpu->arch.marchid)
+			break;
 		if (!vcpu->arch.ran_atleast_once)
 			vcpu->arch.marchid = reg_val;
 		else
 			return -EBUSY;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(mimpid):
+		if (reg_val == vcpu->arch.mimpid)
+			break;
 		if (!vcpu->arch.ran_atleast_once)
 			vcpu->arch.mimpid = reg_val;
 		else
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
