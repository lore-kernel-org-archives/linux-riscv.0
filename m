Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C2EC77B73
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPvM0mcFH1GAyzL6R3mrnTrArM/xlT+p//HV49+9KGY=; b=ycLRatV1btH0C+
	Scfma/q3JmpvZxR8NfHQLxOTzq0GB3PdmZ132dJ+XyUyaxfSVKWE1kBnnDLVFEH+edPzokaveyMX5
	VY5DVw/UlCh2NotUSd3bh+rHlbSVETNwskt0ajbik6qFRJkJMkrrv0+Fu7Afcw7q0soQr2f7XdYcn
	obzc49+UMfSdd3wvoN45arhZAQFj4rJFzO9TaZXGwu4byuMONAdhfZwtgDvh/z6Eg0wzHqGroO38u
	zWl0meuI35jN8ylOW99z/DWaYxUh40mszp7JyWmmxY8uy/2EyecP6F5Qis5aagD5htyQNPTl+B9hv
	nQevz7a1Z5c2DyGo2eSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLqq-00A2Ev-0t;
	Fri, 14 Apr 2023 16:00:40 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLqn-00A25F-2d
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 16:00:39 +0000
Received: by mail-pj1-x1033.google.com with SMTP id cm18-20020a17090afa1200b0024713adf69dso6565766pjb.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 09:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681488037; x=1684080037;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Odmz0JG+bEL0mEy4+sqiyjpf0XMQ6vVYrEOWb5kBhbI=;
        b=FOctlegUDtDv3ZHjXnrQJCTB/Q6yyurIgcxUtsUoFzS7dn8jftYmLbD+75EhDZA2Cr
         zRVATn8/u7h4RXGHOq10e69KRyHc/0+D/hBly1p5VO/Y1tdMTqJaNtb7RYGA/nhmWAf3
         08pNFxl+FwPz9dxOalOIoXewTsF8wfk9yyojXsNQOUEFPUe2AB/bSHL2WyxhicJcsa5i
         0nU6KQQTrq7QW8967WdAfAJ6sVx/21Z1pTNb/OINlieAIVJVwXtmwsASd+1L+42QsLIg
         fCWGcV29bYX2+zTqwJe446i9FzP9Dm83skLE4j0C2s1H+FWSddrMeia1ROtHi4sZWwCw
         3h4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681488037; x=1684080037;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Odmz0JG+bEL0mEy4+sqiyjpf0XMQ6vVYrEOWb5kBhbI=;
        b=b4NWqSUeab+vnVmLES2zj/sUXGkVB569z0IqlNFZhKup2macB//gPweM3aFt9WpqwE
         0qM1EzBuLcBT6rHeRARw8SE/p/Rms8QP8rxY6ZoFySmNSDy51B6FBGkshcYogD+Wgakc
         nOULv8rXI2UgJdwmPl/YwX7EeWYmSW28i2zKEbGAmWr1dGrHdRSW0AcTp74NxhAA2b1E
         7/RJP68P2gOMepM5Yshh13wXTpF7+QzeGiYyLHe0FV+xB8/XJ1TmckXmktkAPmDIApIF
         UKNLaJgOVIUONDU1stEOKSTcD6YRJyG4AOCuIUYZ1RO0Z1nBa3mTp+JyvZf8dUSssyDd
         FmlQ==
X-Gm-Message-State: AAQBX9eAx01PRDFSQzMjx881FCMPO542S20Cvm+qQJO6t6m3uTsdCdL4
	0skO/p54egysbv9tbHr+3lcZ6rQK06rUM4ayq6KL3XeWkKqGi2RH1tWrz6BB/16UdY0uXVDTVfu
	l1ApwocZX850PjDYf3CYW/8bgl6HrHZdloizppeHftVnQe8bCQ7CRsps2A8udUdCISHPd/yriJF
	0e2XLFC0V2Wohj
X-Google-Smtp-Source: AKy350bD7mze/O0+fYsB9lpeXlbduhlDKv44rIlF3vXS+82oFbA62wV5LVEzKRe2kkBUE5wMisk7Nw==
X-Received: by 2002:a17:90a:a091:b0:247:4538:a62e with SMTP id r17-20020a17090aa09100b002474538a62emr1878454pjp.27.1681488036960;
        Fri, 14 Apr 2023 09:00:36 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id br8-20020a17090b0f0800b00240d4521958sm3083584pjb.18.2023.04.14.09.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 09:00:36 -0700 (PDT)
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
Subject: [PATCH -next v18 17/20] riscv: kvm: Add V extension to KVM ISA
Date: Fri, 14 Apr 2023 15:58:40 +0000
Message-Id: <20230414155843.12963-18-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230414155843.12963-1-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_090037_862909_DE685893 
X-CRM114-Status: UNSURE (   8.70  )
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
index e44c1e90eaa7..d562dcb929ea 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -107,6 +107,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
 	KVM_RISCV_ISA_EXT_ZICBOM,
 	KVM_RISCV_ISA_EXT_ZICBOZ,
+	KVM_RISCV_ISA_EXT_V,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 6adb1b6112a1..bfdd5b73d462 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -57,6 +57,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	[KVM_RISCV_ISA_EXT_H] = RISCV_ISA_EXT_h,
 	[KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
 	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
+	[KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_v,
 
 	KVM_ISA_EXT_ARR(SSTC),
 	KVM_ISA_EXT_ARR(SVINVAL),
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
