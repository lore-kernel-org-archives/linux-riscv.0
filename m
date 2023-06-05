Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916D5C7EE24
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J7Zpk/i0vy9xvBHfYOIufpEZ46C+ZgqW+byMyoUfrIg=; b=n6TRfOWnldpuho
	qq7tgtyZVW2UUYDEZzUcehQH69sSmh/fd1nyUgova+/W8WaAopTNuiwtPpho3XzJ7LauiuwxuB47j
	Q9w4NT7Nnnxcns4p6tzwVsP0yhFpfVgnzpAaWKshWiw5kdU5QnMbD/0myE9bznj91baZHr9y2jjg6
	SnGjThsz/KTN6Fq0t8vG65p0DFtanjVpMDXdY15m/i+aYkWmv85aVSXeOaEANL3cuJ3DBHXxlkHxP
	dPTSNXcnamlZsEvpFywERIB1gg1ph5jlDc7xxYzT+WB2cqp6itx2ix8mre0cRK+Qtk929UXevnQYN
	k4OUKSz2T3YAYD/Cq8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CKs-00Fzkl-0d;
	Mon, 05 Jun 2023 15:41:34 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CKq-00FziF-0V
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:41:33 +0000
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b01bd7093aso25069945ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685979691; x=1688571691;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2CmyEkggETxM6j+XfIPwTDc2gU78hVyVqaTRQMELVN4=;
        b=iCFGyw/jcSbZ7dkgZNFFY73VpPKL7Q1jzPShY52xxnw02H0ROZZFhfGGq3FqayLf/9
         ly/kcUznEUd13mFhS/4fFO0qsVJw0y7zessKqUQZU5NYl6XJcbETE9k3+VI3bfzauzN7
         KOEhJZQBlfqFkkj7kiD5/x7M9Zp7OcrRMiOPXiOKMidQEl0myq3nIzfLZJE265Cwp48D
         DDq5QMhhZdBRrQS9dtk77EVtO4TVDZnUl5Qad7SUHDInY2r3au1wJLjBQilARUexc6fi
         kIVKgoAMwyvK5anHoyXJrR4fWgwo9fP3Yc4FflfywJfMtK2rosH5S/oUSimheAPTH8mQ
         SzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979691; x=1688571691;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2CmyEkggETxM6j+XfIPwTDc2gU78hVyVqaTRQMELVN4=;
        b=JriH3AQ1cvp00XDb3VXVe4syUtspOK4X+qpIVXtvv24qqEvTjpSRmofTBsZu9b8pmz
         AwiASnNTLTPiRBKfnjiNRAViAPLHVbRrYSkVGTwkaIqFs2VbusV6ehaF1UGe+Q96tem4
         lvv+qwpRz0k6af2mSNr0kTzAafwHBNhxh92qqopOE/z5RIGdJuB0GYb+P3Tcnxlwkh8P
         m0VIAmb7PIhcZUfVKGFwkpuDbf71NnRwIM/ZWp1Dtvf1pe/Lbv8i+VKnzAqSR6FPvwB1
         lr43JR+AZUUr3kh3Oc02OYb4F2/GHRHDN1NpUM+1apRbFxopecd+X9oG53UulqktsdRS
         H0lw==
X-Gm-Message-State: AC+VfDzcOVwxjjADKwe4YkgefvhZcwbrTN+skusn+fHBe+IRlEUf8jyM
	HCZMcZSIE2/T3HF+2w2Jq7eMfkHCQ/CMACBUAkWPMVIC3JS1bskousZMT4+HNJ+b+DQLtA5AYzq
	d5ODZ5ocRb911NcAkQfQNA/e6HarQRwLiJDH04NT1AdIGKE2wkLYfJaKFczPsNkiMhuAPCGH/Yy
	tJA1nMGmS1P8+VoUY=
X-Google-Smtp-Source: ACHHUZ4zcDskmXzgjybyy5dRFrqQcD6alz9N7UbXNzqeE3JhCcVu+yZ7RCDNiKVpRYqrwdECITUOcQ==
X-Received: by 2002:a17:902:7045:b0:1ae:8b4b:327d with SMTP id h5-20020a170902704500b001ae8b4b327dmr3443354plt.42.1685979691044;
        Mon, 05 Jun 2023 08:41:31 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm6725962plb.256.2023.06.05.08.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:41:30 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH -next v21 18/27] riscv: kvm: Add V extension to KVM ISA
Date: Mon,  5 Jun 2023 11:07:15 +0000
Message-Id: <20230605110724.21391-19-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_084132_211418_2AB476CC 
X-CRM114-Status: UNSURE (   8.90  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Vincent Chen <vincent.chen@sifive.com>

Add V extension to KVM isa extension list to enable supporting of V
extension on VCPUs.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index f92790c9481a..8feb57c4c2e8 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -121,6 +121,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZICBOZ,
 	KVM_RISCV_ISA_EXT_ZBB,
 	KVM_RISCV_ISA_EXT_SSAIA,
+	KVM_RISCV_ISA_EXT_V,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 8bd9f2a8a0b9..f3282ff371ca 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -57,6 +57,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	[KVM_RISCV_ISA_EXT_H] = RISCV_ISA_EXT_h,
 	[KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
 	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
+	[KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_v,
 
 	KVM_ISA_EXT_ARR(SSAIA),
 	KVM_ISA_EXT_ARR(SSTC),
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
