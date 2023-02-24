Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4065C7EE30
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zzg+zjYmGfgoGBgAlX3H7UvyCOjLWje4QqQm79UWgiI=; b=ZV+ilnuZ3Fgayr
	zb0uJqBqsFQeLvLDMv/PSVqvEp2PpizQmUmU9wyvG0xBVRkWNLDjbppRmBy+xcvg0MgZgsn4kF89C
	dYxUHvt9oPoU8ZLjfICeUqhzcM6difUiNLUblXG9XBR8lp39/c2pskPxPAZJGVrq1pe3bVfvp/DIU
	1lPsDWZQ5PEyqegTg2ZV3JdYnXYtSDXaoRB0vQzfTyfFb+11SEY3w7xG6KDJX70SYVWYBDe5y9ilF
	KKIKpOPjqbTH2zg5CPIRO5r1UHl/HGdoaBFpuOe/3raJs68vQtfuLuacflON8FhRUoL7d8qIeYKTS
	e4+9+YbyhPyjRjxmhGJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbuS-003JKu-0V; Fri, 24 Feb 2023 17:31:04 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVauJ-0037Cb-0F
	for linux-riscv@bombadil.infradead.org; Fri, 24 Feb 2023 16:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LQSbWzdXITTUFGVPTFXHGgENmDgXWQs7cxb8n6vTRIg=; b=WfjWvZpiIgvVy5964W86uD+NkN
	TjS5OS5MMWIVZF9yP96EuN491JqDZs8f3FP76pehfEaqVtwC7+klLBN9q+ECOJR997+OL39hf5sHU
	D6ZSFnecbgAW5AO80JEAoBx4NncgcKra7I/yn+URX15R8KcOhG73bDnv8OvEAeTs13qYdGg9PahpA
	mHt+jWOtjT5kq6MINwvjxcrtubeou/zgezUnM7HNGe9C7xlii+MGYcwn+bBQiU9XCMTesGuMmeTZP
	bMtV9/tjuKYCEe3x1VHL+gxgq+GZDWK8VgE+Ar0RJCai2hqBe1RliRWoqA6Ilm1pqS5He0zSNBZUI
	OSVwKg/g==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pVauD-00DG7Q-1f
	for linux-riscv@lists.infradead.org;
	Fri, 24 Feb 2023 16:26:47 +0000
Received: by mail-wm1-x32e.google.com with SMTP id p16so11492wmq.5
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 08:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQSbWzdXITTUFGVPTFXHGgENmDgXWQs7cxb8n6vTRIg=;
        b=WYvJAh+G6x6Vlax3zUgVMCE5aXia8pEEMHFNGJZMetpJPvr3AFrx1UrS6bgxuRlFYl
         fKHzZw7I1iDnhJfcYXRJMf2tEm+ZJ9hg9Y9xvmFG0rEb3OHivpXDTV/Pv03X1YkRFJQg
         cbhwwMKK2Os8sLmFRb9cWh9yW0rtwGZ1XOO6VV2JHqQJcZXesoRzsQ/jkNjoZhsX5hFc
         an+IAXJ+TN2el+6ea9OJWLW1AkRFD/P6PCHlro7SkO1WYB5j4XTQXRdS2f1dodDMbojn
         oPldkG8xv0UfVfz/WGB0PliCkOlM8q8dpFBruuPPq2KUYDZovFmzoaf1b6hAYSUzqwoz
         y1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQSbWzdXITTUFGVPTFXHGgENmDgXWQs7cxb8n6vTRIg=;
        b=amapLfncoPbaCzFKusnweN7fuetr2yXnWWkrJ2MbjUjHrCFFGSXsx3dVWceXTjKMkj
         jrHES7xSwdsMpwYI3/B2jUvItZZHP1Y7gOTpQHgMwpXb7YUiROq2mDRKi6s4c2UaGi5h
         0DdKwwzAkn8rvifBt8hmNd/SbK3iRYNGG/0kunMm5mvv+/+PIP6NrVSwjz2XBG9oxF/l
         Ew+I78EDvM/UGJ0XyGfdJHiHgcL2uke6/H+5yiFpAbBzC0FXkcw2xQu6iZjoPIVIHrjO
         LPrJb7nFXx+4PTFb35iXeVXt6Fiou92YNmVMfJ8eM1JIIEmGW93nUKjPJ6yt9HdLD3Be
         l5vw==
X-Gm-Message-State: AO0yUKWkyNTwtyBziBnVOQN5DGj/3U0LOH8/UFrwRzALay46sImtJfpA
	KxYRanN5vWIBn7aWGiTSkIrDz3+oFxmfk6Hx
X-Google-Smtp-Source: AK7set+B4L+KEhB/KyLIkSH6PHaVRqL2xDGuGkTQosj7QgMJ6o2wSVbxw27nLBgEAAEMmRkOdbvzag==
X-Received: by 2002:a05:600c:354c:b0:3df:9858:c03a with SMTP id i12-20020a05600c354c00b003df9858c03amr178485wmq.15.1677256002565;
        Fri, 24 Feb 2023 08:26:42 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id j22-20020a5d4536000000b002c5a07e940csm13820864wra.33.2023.02.24.08.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 08:26:42 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: 'Conor Dooley ' <conor.dooley@microchip.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Sudip Mukherjee ' <sudip.mukherjee@codethink.co.uk>,
	'Ben Dooks ' <ben.dooks@codethink.co.uk>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v6 8/8] RISC-V: KVM: Expose Zicboz to the guest
Date: Fri, 24 Feb 2023 17:26:31 +0100
Message-Id: <20230224162631.405473-9-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224162631.405473-1-ajones@ventanamicro.com>
References: <20230224162631.405473-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_162645_880625_1556B3CB 
X-CRM114-Status: UNSURE (   9.13  )
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

Guests may use the cbo.zero instruction when the CPU has the Zicboz
extension and the hypervisor sets henvcfg.CBZE.

Add Zicboz support for KVM guests which may be enabled and
disabled from KVM userspace using the ISA extension ONE_REG API.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index c1a1bb0fa91c..e44c1e90eaa7 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -106,6 +106,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_SVINVAL,
 	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
 	KVM_RISCV_ISA_EXT_ZICBOM,
+	KVM_RISCV_ISA_EXT_ZICBOZ,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e5126cefbc87..198ee86cad38 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -63,6 +63,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SVPBMT),
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 	KVM_ISA_EXT_ARR(ZICBOM),
+	KVM_ISA_EXT_ARR(ZICBOZ),
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -865,6 +866,9 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
 	if (riscv_isa_extension_available(isa, ZICBOM))
 		henvcfg |= (ENVCFG_CBIE | ENVCFG_CBCFE);
 
+	if (riscv_isa_extension_available(isa, ZICBOZ))
+		henvcfg |= ENVCFG_CBZE;
+
 	csr_write(CSR_HENVCFG, henvcfg);
 #ifdef CONFIG_32BIT
 	csr_write(CSR_HENVCFGH, henvcfg >> 32);
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
