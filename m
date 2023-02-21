Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE5DC636D7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 20:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zzg+zjYmGfgoGBgAlX3H7UvyCOjLWje4QqQm79UWgiI=; b=W4GNdUeenF6EvP
	P1bHSHsedCDHMvOLmwITApIpGmmrSBY0aD8Mhz76t7gy3lt2a153LyVkKnY1v2PyuPlFFDg+w5wgs
	P3/glYtOsLdtADVpAuybgX1NWM/gDaViXwMwpjxkZruwzpMiMH23W8OIk08LRJjAmxtnFKBmg65rv
	uV7Uez0tJ+Rc6nHeZ6JTGNdLtqAhhX1maC7ymh/nfKSI8L45qkY5wPOysmwQX4X2zqnpVRxfuqu4z
	UlSZmtRVNc+uMVfWRE+CfcqaAsMTCXbtKPyfITlZvNeMTmHkIKyuSuSGgDr5MiqkH4hdR1sIdCXE3
	YkCsyJl3AUGOhClIEdLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUYqq-009dY1-R5; Tue, 21 Feb 2023 20:03:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUYqp-009dX6-5A
	for linux-riscv@bombadil.infradead.org; Tue, 21 Feb 2023 20:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LQSbWzdXITTUFGVPTFXHGgENmDgXWQs7cxb8n6vTRIg=; b=ahIy9PymP04pLo3XSIogyXiYzc
	fdK9oXJCOG3U5f0+XSmkDwnBXIlAbs3zbh2Ij2kf6g+wLcMDuVM/6rEqA58FpF6p+6q/lmKhr1oyL
	Yrj22lFs5fzYzULBmqidcT0YILjM3HVoqggy1snwckED6/vtY4VjeEAC35uJgz9Ixb5PTVVrUbHzh
	dPTL0PsmbuaYoxM++hN3Qnw9t3vEfB6mBxymqS8xbF94XhDvOVN3pN+HP75sJ7ihg5PqPyOjau72U
	YsjkzVV/SbbfGi6VqEtjas8bjjBwAyzayzp7rKF8bVrLq6WoQW5Eq6Q74NioYlwmDX4h8yNb5ciPA
	sXa/l0Iw==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pUY15-00CGVe-2c
	for linux-riscv@lists.infradead.org;
	Tue, 21 Feb 2023 19:09:34 +0000
Received: by mail-ed1-x529.google.com with SMTP id ec43so20864628edb.8
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 11:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQSbWzdXITTUFGVPTFXHGgENmDgXWQs7cxb8n6vTRIg=;
        b=XxAMGoWv73/z3O/e/TZW7W5m5IwiXjtoyA8bp8jFz2NakB5O/GfUjsIl0WUiN4hiHj
         hT08h5nj9m91jxSsVJsUj0snKdPrmvVIaSWuTXH69EzEDhIdn01F3CIv0gB+Di+ujQSI
         ykJramzQDCwLJsz7xkD4kE9DynwJPGqICZ5eklWmscYOhJJHW2Rzeka87dKEsNDmmn4b
         S7GszEz7Rb3BA3LJKpQSrOeWS447OCGp1Kts6pk5VkMTv7FpB77YxEDAnyVyVGW2VNuH
         NnjQ85WrQjzepoicZrIYWxDwtFTJTcIu4ckqoGJmq/z6qCMMzP7eEmTnITiFyeE5tVt1
         ASAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQSbWzdXITTUFGVPTFXHGgENmDgXWQs7cxb8n6vTRIg=;
        b=WcUR9cFdmJzbcK9RNf9Qy+DpVYoeD9BOfrcEGgg5t6m6DreOvF+F1B5//qER8cyF/a
         a9xTJ8/qU5pZuYdpLjbRiq1W3QGIqypPRx0g/4x20AE1TyaEtfSuf7bhpCHPwMNlBx61
         uSsa8/jL948qcbqyy+KHy5+3LM+O5OReENz9Oo472fRf0bj9fCyhbLbH98mmvhP8cJ9m
         PUfNlG9yn3gOrQHZ26uU1jEFe3kFEsnd/fWnwey741ivlXgLWuMQWB+RPCqC4/Gc2cjc
         Y0Dfwr8ycrMsa0WuVd9ahcimC91VMOcajg6gS0+l+EJp2obpOFBpy+QRpMv6l+mXIpE6
         7P4A==
X-Gm-Message-State: AO0yUKVAzxSr7dplNZFx/J+tRvnnAJ7XNGLvDXEkH4YDUJscoMnECq43
	JVVV+5Pzry8xmdjIKE1dxQYqfR3p/d4ZK3k9
X-Google-Smtp-Source: AK7set+QxS6Nf/kPSQ9yU93mzJ3Mgta9VHeTQonMkPjJqw/qXdCPEq+ZiHN80rpKxC+OtcbK+or3wA==
X-Received: by 2002:a17:907:a42a:b0:8b1:730b:a296 with SMTP id sg42-20020a170907a42a00b008b1730ba296mr23303956ejc.15.1677006569859;
        Tue, 21 Feb 2023 11:09:29 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id ck20-20020a170906c45400b008c95f0ce32esm3967120ejb.3.2023.02.21.11.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:09:29 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: 'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Ben Dooks ' <ben.dooks@codethink.co.uk>,
	'Atish Patra ' <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v5 8/8] RISC-V: KVM: Expose Zicboz to the guest
Date: Tue, 21 Feb 2023 20:09:16 +0100
Message-Id: <20230221190916.572454-9-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221190916.572454-1-ajones@ventanamicro.com>
References: <20230221190916.572454-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_190932_049792_72BCA2A4 
X-CRM114-Status: UNSURE (   9.38  )
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
