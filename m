Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB10C48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 12:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b3BjZjgHWyWHbV2ABaKxJK1ABzJRh6IjEOS9afteLho=; b=sB0TufAHHw3Nz+
	BDBLpHafIkU80VH+Sq7K1npGNa+hW9WVI9HfPF3hLyyxFh3ID56TymRrKr9zNVTXRHVchUG9t+vC5
	VOYz14xeghURSVBG0LAooQ+u1ZB3ZkqD+GaVmyCubaW0kcVbL9fc2hz5SYcVtzOaEpvDm4QAHywyE
	31li8F1zXPClgqUziUCGabARy0jGjWnEanU7XZx2X6e7/Z7FGnzu6tZInNytVEyK/DDZ6IhkK3IbU
	ZNv57BVltW7emNE54VcEfhjybKRFgCo0UCKFQLZOogDP5CGBSfqZY0qXc+iSHq/HK5UAJsuPJrLT2
	gW+fKLQOa3kxAeL6QHsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raEWk-0000000Cr6O-0gpf;
	Wed, 14 Feb 2024 12:38:14 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raEWh-0000000Cr3n-2Wku
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 12:38:12 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so4424276a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 04:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707914290; x=1708519090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnX8n4eslB3tatxrOtV2L4MVIcOQlO77yyiHCpmaDS0=;
        b=F0/SiqA7SEj8VSytBd6tOnkHup6LWWailIpjL5VMGsczxq7LFjajb8qKi3PYVReLCR
         6+HUZHwPQk/f6gqFdw4TvLEAAhqAq3A36VArk6snaKeaOLkodkk4r1syLDs80w92fWLr
         xmGHlGGvRtwWBRpDT0ddarybBao+iIVCY1t6YBhQIksvI9lx4da6Y1ngOzdclZkV+zdY
         0sCngvYL8AW8rmfqJ45wN+A6M7jODCn6J+CB6Vu/bklDHilnIhl//GlrmbBmW1yZ4P5h
         PnLXuRTw6pcdxBOrMNvLCU42pa1SK/GM3KjLVuhciUCFg8CENPh3Tz9EcKJECEOVr/or
         YrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707914290; x=1708519090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnX8n4eslB3tatxrOtV2L4MVIcOQlO77yyiHCpmaDS0=;
        b=QiLrjZbVtVQ5z1oVrRDtrQzb4CX3K7b2nayF+TJlCtLT/XdJtvYi2CdHtf4UrYoBmi
         ndRX1McUjf5D/XEj2DlPpPL1TgP437dsCYE5w6kgHCponmBkv9F8eyYW6SiQQrZvxR8O
         nosboBk0Ih6OhHPjcTIO3Mq5YkDiC5+oi0xMP3qSuU0fX/kju36p0kVjIkfgUTW0puNt
         gtRrJCV5Z73IF0d1Sz9QU+WmgjhJE45UArGcSqNX+Tk+QhjNPFmcZmzOjCqF0T2upU17
         bHGtdCevMW9qMh/z1I9GnEWxwWpIz4y0VaBwbczm8Ikruau1XTB12jNmaAId5VFETVEL
         INyg==
X-Forwarded-Encrypted: i=1; AJvYcCVbUBKPCbQIjSsJYFY2klYkIrlnzr93N2QM6DPghgfL3CDCtat2BCJn7mJQQrCNVYCteHXJbFGGxhuWvva7P3Rwa8v/E+mp5ZBwnJqAuPxI
X-Gm-Message-State: AOJu0YwKAvUWQ9hJN9c9Y1bDclXM153RX2k1leIqZX1jAk3uP0EWl3ys
	JlHGT/r+M7kZsIZIH5j8b46OeqZGv7cVvQ9CkmJ9zWLE2lPq6FlTM3+9elaL+qE=
X-Google-Smtp-Source: AGHT+IE6uz5maWXsKH4t6Aoq6//Z/uwPwTljcM59c0ZygfRhwmy9JrCrRK0P+aMmGkUP38CMtl1oDQ==
X-Received: by 2002:a05:6a20:d90a:b0:19e:cd5d:8903 with SMTP id jd10-20020a056a20d90a00b0019ecd5d8903mr2859932pzb.24.1707914289771;
        Wed, 14 Feb 2024 04:38:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUseRnh7ThDsfj5aeC1nn7XD1vuC0T+l4uR5+8EA2oeNaaY4beARLRbEc2A5dB3+gf69HhCmg95FNFrVqsL676h30byk8kTd9lYlLxs0hSgvQ8X5/etcT/DhcJY8x1psR7VHew9KbANffe3Cy1WV5dL6KB3sEeLM+e1Ggoznv+uXUAmeTpY+BHCYZ+k+q2ITM53/7M2rM/QM66hI4uepvz2r5n/RgCxqGIjSxTLyWZKFElRBSB9M1Eyognik4Z2r0UgSIMR3y93lLWpqJJ90Dc5/wjKMjvhSJsf6oFZNXoF8FTdUTdBAUpRfkelhR66EbOuZ2UQTbcsxdsyDQO6736aiHEUmDWyc6aZlgxg9YIaxd7odR3dbPTWOrxRnRN72wFkQyDH2Odm5MjV6E7fQl0JJwQp0hyrQ+wglwQXoIC3GobElHq8xRR5QOxNNw==
Received: from anup-ubuntu-vm.localdomain ([171.76.87.178])
        by smtp.gmail.com with ESMTPSA id o20-20020a170902e29400b001d9b749d281sm3041419plc.53.2024.02.14.04.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 04:38:09 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/5] RISC-V: KVM: Forward SEED CSR access to user space
Date: Wed, 14 Feb 2024 18:07:53 +0530
Message-Id: <20240214123757.305347-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214123757.305347-1-apatel@ventanamicro.com>
References: <20240214123757.305347-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_043811_648917_2C391331 
X-CRM114-Status: GOOD (  10.65  )
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

The SEED CSR access from VS/VU mode (guest) will always trap to
HS-mode (KVM) when Zkr extension is available to the Guest/VM.

We must forward this CSR access to KVM user space so that it
can be emulated based on the method chosen by VMM.

Fixes: f370b4e668f0 ("RISC-V: KVM: Allow scalar crypto extensions for Guest/VM")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_insn.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 7a6abed41bc1..ee7215f4071f 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -7,6 +7,8 @@
 #include <linux/bitops.h>
 #include <linux/kvm_host.h>
 
+#include <asm/cpufeature.h>
+
 #define INSN_OPCODE_MASK	0x007c
 #define INSN_OPCODE_SHIFT	2
 #define INSN_OPCODE_SYSTEM	28
@@ -213,9 +215,20 @@ struct csr_func {
 		    unsigned long wr_mask);
 };
 
+static int seed_csr_rmw(struct kvm_vcpu *vcpu, unsigned int csr_num,
+			unsigned long *val, unsigned long new_val,
+			unsigned long wr_mask)
+{
+	if (!riscv_isa_extension_available(vcpu->arch.isa, ZKR))
+		return KVM_INSN_ILLEGAL_TRAP;
+
+	return KVM_INSN_EXIT_TO_USER_SPACE;
+}
+
 static const struct csr_func csr_funcs[] = {
 	KVM_RISCV_VCPU_AIA_CSR_FUNCS
 	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
+	{ .base = CSR_SEED, .count = 1, .func = seed_csr_rmw },
 };
 
 /**
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
