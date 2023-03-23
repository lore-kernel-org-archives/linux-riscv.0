Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDC2C6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 16:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WlKkYSW6y1jJ7BibbTu7JX/OdkGuFFeZMYgvEL01RA0=; b=UF6E7fHrxCsb4A
	8wQh9aomWoC8je0b5eICaXFJb74VU1YxmsDj2Tp1aWzyEHpOa58E/ZQszKTBs1NAzZ7iXdNwWCY8l
	mDIac6CKiLgvRHl+96KQdg2Gu/fnGUOWS8e6KNKjmIKmeY9EQyjDiohAmQC90B8cH9nnEa0HVLTB4
	8ZiDMto0J/+W6kNSPAvODek4vpt5xmX5DdD2r7pOGUgCv2PSo3t4GyH9JX+jMDGJ/mbm6rJqOQGt+
	fVWIKj5LUUle2Osz7l9ktizxHkCNueulYIx4Ud4SDO6VLNGdT+69sBiS2K3Pe/g3ePm0RG2ocfk84
	bm1REj6NNQTj+9YhhLqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfNNe-002Q5Q-2G;
	Thu, 23 Mar 2023 16:01:34 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMRJ-002HIY-1i
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 15:01:23 +0000
Received: by mail-pl1-x62c.google.com with SMTP id z19so12144210plo.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 08:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679583677;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JozESal/Fbpp9RViTDB8Qd5//8qhpKIjNlNXSseO97c=;
        b=GLZYv/aG+Ac/8djv6J4vsr0ttPd9TwjukVUqCjcfy7McPcuKFVHuqGy5w0iYCgH0ve
         YRQhpVGOmVc4RurKC+5esLk2PdcLbPPFidaAN9Hp9u7ozr0XoOlEO5YKecamglCLfr+Y
         0p75r2grShf5CGdEDVy65zHfCz86AqYD4ygkSKKuiUDhhfLFNWWY084z8ZwLFhwK7ids
         R4w6yIbHpa2CiACplfWPfzv1nDfk4gnJO6CPCZLH+NyTylJ4Hp0GCsWVP4mbvnI6d1DI
         CUTL7UkrdUSPWSfpdf1sI1Pw9RDsFBUuHaQhsOWnoxF7ZuJn3wxmIYay6txUTs3gwkO5
         hNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583677;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JozESal/Fbpp9RViTDB8Qd5//8qhpKIjNlNXSseO97c=;
        b=QZkAtjKEvT3846jfhtS6KxcMdIUPO7rEojJDdCfL8HlN5DTYSo3zJB8Zmu4oI+3k6d
         Gq9gKKl3CtOj3b/E+GJLpxrcjguzz9VSamVjeTIh54doLZ+7kRUHb6sW+1uLTeCZ3KcZ
         +qYYc8tdDrq8aP+QfEuzUhuSGc7R4o/sJycydUUoJm4lCJuuO8QqNfY3XkUtoxB3xD2V
         +gUQYvCLgMZVNNz2qKqXzSYTt0twVyBnoKUWtZxBMh2gDK07MfFt8b18mZTcZw4GC21R
         YmT9O5lsjLObuYsqHMC4XyyE5O0SJYFx2HjC4+1S3nBQj/GsXJo4YrjyGcprCFo87k9Y
         zUoA==
X-Gm-Message-State: AAQBX9cBpCVqM4FX4sHnlA/Nzmxs+enW2M1u8gr9gOvW/kHbj3pjG8Jd
	jk95gXBXn7FUPSEX/VvRZFl/gS+QwN03j3lvYq9gHaiD8YsPN8IcPJJJKY7Q46xrMGdgQyqRQGt
	6MsP+zVkrOs8fEjosvlBjj4IXdK7OLDXdH8Rj+OEdnxcmihZWTiT0SWetiKvq3kgJJUsAuAZFsX
	N+hlMY68ZQo5Mw
X-Google-Smtp-Source: AKy350a6Nkugs3BdGgoNETgzYze7cy/cXizByVIZO8sc3UhB/5O/9VTlWpWOJUEXeJgtEB1dDswOuQ==
X-Received: by 2002:a17:902:e5c9:b0:19a:7217:32a9 with SMTP id u9-20020a170902e5c900b0019a721732a9mr6934775plf.26.1679583676752;
        Thu, 23 Mar 2023 08:01:16 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902854900b0019f53e0f136sm12503965plo.232.2023.03.23.08.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 08:01:16 -0700 (PDT)
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
Subject: [PATCH -next v16 17/20] riscv: kvm: Add V extension to KVM ISA
Date: Thu, 23 Mar 2023 14:59:21 +0000
Message-Id: <20230323145924.4194-18-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230323145924.4194-1-andy.chiu@sifive.com>
References: <20230323145924.4194-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_080117_567008_81C754EA 
X-CRM114-Status: UNSURE (   8.72  )
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
