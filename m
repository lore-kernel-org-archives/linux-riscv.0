Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE7AC38142
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jan 2023 19:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IVH9JnQtC55v5DkxisXehaEaLgmtKHrT79ALHL6x+/s=; b=n5qhiYnhXOfhBT
	8ejwZ+E8jeHnGzdkj7LWxzYWQijwOq6yqUXpQmMf4dz8YEOaPhlvk6uU03pDTtu+3NUm549/hRLs4
	Lf/s2puZ0VhYmvVK7TzkadXhOezuA8QrmEgx/qQOX4pNbKh3S2IWLTGZb4i2uwt+mtlXV0zg7XymC
	rMNfwvfNf8UvSq7ogBRtqtYDdBEjBlLmoI/lUf3rq7BpIdfuYVhBeETjr+P/QRdSNGtNYK5iscNye
	rJc9wNXE7wXwA90mdM8V/BpJpdaZwJGN06i49MraVKxrarkO5RkAvdSDIxamyJwTpl6LDYE4/R2z1
	7TbhssQ+1/IF68SMqPRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJfml-00FiIQ-GH; Sun, 22 Jan 2023 19:13:47 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJfmb-00FiAD-Go
	for linux-riscv@lists.infradead.org; Sun, 22 Jan 2023 19:13:38 +0000
Received: by mail-ej1-x62e.google.com with SMTP id bk15so25528996ejb.9
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jan 2023 11:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCB1yeJ2C8BuxgLI3WtNTAyAuvnmgwo5nu5lGlrGmQY=;
        b=oyj11HGM5iX6WLdIPLSnmp9uOds0WadvBQInTHQ0ta3zY2H/Ph+EAx424+xbG3LKoN
         +mBfFvzh6vhDmtkAglBnLXHbGmwYdsSBSZHL7lZo++MfNLNK2Jyf1jyxS4DQ2qrVP3R0
         7Sl+haW0THgPZRpDpkVKF6xjAwUNpqUy7Enb+X7dacIABt6eWstRLGDeClL3i8WUrrix
         YI6JDT1UJ1eeQeIw66tmWKJYngvnpFpheHC4LPGyPFvlyYLeawEk71F4X7suBGAGyium
         w1KgO5Hh/Y8GqYKgoE/9QrLiW+aj6+U5xs2zVBOzmV8W4nFHi7GvvMnC7vZuH5qlblEL
         b6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCB1yeJ2C8BuxgLI3WtNTAyAuvnmgwo5nu5lGlrGmQY=;
        b=VXim+Yvydd8ptPntkyWfFpTYZp6gZsij1e1+qTwmFx1Ld3ccFatNveEIS3t6erxJel
         qP577Kv8fNKvPQWA3CNJE2q8OCrtWelOQ7RCLNZR4cFUgGD2m7AGbEvz/bZJjrX0eX4B
         BVONJu2UNBrYWDrCyk6uPjs9na3YCAyEpMjSlt4w6dH9nFz3RTp99vHXUSU09ZejDJCo
         Er1dqjK2x8ei0t80qkPYL9XX/EJnUAc6e+ku8kVuApsIntr5YDIHMClpniMEJwlQMvSB
         0T2LUlcv03BjFwWaZDT0Nc6nSA6Indf8eHd0Y5b2pqJPrIzf+t5JLxbSo3kZq4+Xe2Du
         ugCw==
X-Gm-Message-State: AFqh2kogt1KRMG7SKRaNR58Cd0MxjAX4H/uaazpLlZRs0TrRGMFFLIR0
	iWtms5v++SRJTk1xOU8fly/ETrrgfTB/JpVr
X-Google-Smtp-Source: AMrXdXv9QauEA7skP1B1vnSyfzxd8QdwzVo01W961bfw7+Aur/T5EcwtiYbMtkB9vmwli0x59OyQDw==
X-Received: by 2002:a17:907:a586:b0:86a:316:d107 with SMTP id vs6-20020a170907a58600b0086a0316d107mr26235376ejc.72.1674414816922;
        Sun, 22 Jan 2023 11:13:36 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id g11-20020a170906538b00b007c16e083b01sm21111413ejo.9.2023.01.22.11.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 11:13:36 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: 'Atish Patra ' <atishp@rivosinc.com>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v2 5/6] RISC-V: KVM: Provide UAPI for Zicboz block size
Date: Sun, 22 Jan 2023 20:13:27 +0100
Message-Id: <20230122191328.1193885-6-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230122191328.1193885-1-ajones@ventanamicro.com>
References: <20230122191328.1193885-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_111337_607334_ED9C6829 
X-CRM114-Status: GOOD (  10.78  )
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

We're about to allow guests to use the Zicboz extension. KVM
userspace needs to know the cache block size in order to
properly advertise it to the guest. Provide a virtual config
register for userspace to get it with the GET_ONE_REG API, but
setting it cannot be supported, so disallow SET_ONE_REG.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 92af6f3f057c..c1a1bb0fa91c 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -52,6 +52,7 @@ struct kvm_riscv_config {
 	unsigned long mvendorid;
 	unsigned long marchid;
 	unsigned long mimpid;
+	unsigned long zicboz_block_size;
 };
 
 /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 7c08567097f0..e5126cefbc87 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -276,6 +276,11 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 		reg_val = riscv_cbom_block_size;
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
+		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOZ))
+			return -EINVAL;
+		reg_val = riscv_cboz_block_size;
+		break;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
 		reg_val = vcpu->arch.mvendorid;
 		break;
@@ -347,6 +352,8 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
 		return -EOPNOTSUPP;
+	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
+		return -EOPNOTSUPP;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
 		if (!vcpu->arch.ran_atleast_once)
 			vcpu->arch.mvendorid = reg_val;
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
