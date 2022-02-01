Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3122C4321E
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 08:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKN4A3Q5R1WJmikUp2ghwV+kBNAsTNytpzFvXQmbYUc=; b=hp+fkxassQnZl4
	c0sw+N9ea7zmC73S52x7TAHDKQny8fCpFhpsD4P64fUSIq45tAb78X8XGPyGM+EP7Iegv9TYzF0XX
	+ndaC4qIuo4YuLNFX2hXuNJilcZTO9yz5IC3gkHgvzCYsKrB0PVZS8KcawZtdunzgrHcTiMdt06Iz
	nLfKfBe3sF1choZIAYyCxuxiLkJ9xOvaU4hzSrqz+1ftYF3zS8y3TonvVViLnAhw/EY5DlLx7curH
	JdrA1pxK5K19z2fv8ZmDrm9X+vPdZfN+Q0RDRYSr91CbcFTll/RuCIWOpoxsZ6qZwetqDDRMS45TQ
	8UbB/HR5uGAhhumyLZKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEoS3-00BVz0-K4; Tue, 01 Feb 2022 08:23:47 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEoS0-00BVwx-NE
 for linux-riscv@lists.infradead.org; Tue, 01 Feb 2022 08:23:45 +0000
Received: by mail-ej1-x634.google.com with SMTP id k25so51269772ejp.5
 for <linux-riscv@lists.infradead.org>; Tue, 01 Feb 2022 00:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=moWXwRufmzv2uumLJS/9LAZ+TSxfYh9+Zsj12AAFml0=;
 b=megPh/BG5oFnZ49v1LXD50Xj/andQy3srFKAFC+gMyPjfTvGoYsIG3hfLiq4hYxtIB
 8iuFJWW+cp099IAO893rjhKCAI7teY/UWouMMrE7TJQehbHyaDR3nAqwlqxmsgfSwBli
 9f/DFJf4yXzoSnJA0VHLwRjiWbGW8jspI/EAtajH8hxW6yn7RfRW7Xs7xN/8j5u1MRLU
 sneA5mmfSueXTPSQvo+Qh1VoTKL8YJLj8VRO6qzHXLnTzddiOV77AdPRdMooMWFT/Wvf
 Rjubq2A6dSjKTSCKaLs390u3FQ7a+IlROa9jV9cSkyXu/5MwrnSW32MKoIqsVH+LaJf5
 oR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=moWXwRufmzv2uumLJS/9LAZ+TSxfYh9+Zsj12AAFml0=;
 b=23TKit9Z8sNejYYlLeTOYBQTT8KI/ujfrFsxIlE4xJ1HaOahxdHGXnPNlqWSwLR1JW
 Q7FZD0BOKKMqwlrN0jk9cfNhW0or5vaDxSfqeofOB6eClQ/rtTTj8Xe5Lg/Q3cvzbcAr
 EEY0BG00rbr7xJT9qoHxpX1Godxjo+TdV42x/ZQ7mNaIfOwcHJz8WQtFC54cP9TR18f6
 KpKLYj1wk/CeZk/shSVnusOVPiyOjOP7Gq00Us0pzWPX/zCpghE3iyTbMMbk3kq1rTjn
 bnoistVwVfAlCLpf/00V+MBh49rATrDmhFs5O5m8q/qj7g9m0hPFz3kwRP4AhEAb2xew
 9dYg==
X-Gm-Message-State: AOAM533oKSPH4fGoL5MmJ7YNK1Rey0Km0GIqCunMP/r8cDfBVGVjGq4S
 86sWBdK4Vkgg2QAp3epVIOCcW36w6BgDbQ==
X-Google-Smtp-Source: ABdhPJzlSuQ0ORHAbwDAjB4y7DcyZYYBLC+IfC2qa+oxDfgJJAX2C9+sYwnhDEYPKiloCVEXgsoaNA==
X-Received: by 2002:a17:907:1b16:: with SMTP id
 mp22mr20683012ejc.537.1643703822407; 
 Tue, 01 Feb 2022 00:23:42 -0800 (PST)
Received: from localhost.localdomain ([122.179.76.38])
 by smtp.gmail.com with ESMTPSA id w8sm14312133ejq.220.2022.02.01.00.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 00:23:42 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/6] RISC-V: KVM: Upgrade SBI spec version to v0.3
Date: Tue,  1 Feb 2022 13:52:22 +0530
Message-Id: <20220201082227.361967-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201082227.361967-1-apatel@ventanamicro.com>
References: <20220201082227.361967-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_002344_784581_6581D3D8 
X-CRM114-Status: GOOD (  10.49  )
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

We upgrade SBI spec version implemented by KVM RISC-V to v0.3 so
that Guest kernel can probe and use SBI extensions added by the
SBI v0.3 specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 76e4e17a3e00..04cd81f2ab5b 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -12,7 +12,7 @@
 #define KVM_SBI_IMPID 3
 
 #define KVM_SBI_VERSION_MAJOR 0
-#define KVM_SBI_VERSION_MINOR 2
+#define KVM_SBI_VERSION_MINOR 3
 
 struct kvm_vcpu_sbi_extension {
 	unsigned long extid_start;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
