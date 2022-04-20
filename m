Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E0BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 11:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=muexY+eNaWTtKvAfOM6aLZY/Mre0gC6DfQEQwDB07JE=; b=3i7ZWMg5MejHox
	Xq2Ut49ChfAmqByqq1t4WKGyGz8VRnO5hi4l/dkFtEuc0N7RqZTNsMVpisu/q/QQ+DCpBlOUZ6NJv
	/p5KAJUozsSvxq70hC5ItNJ58jTV6L78Hy62QUbCMunpq8JK7l/q4HxQ92Eqm/2KYAP8f99IjGkmm
	CS4Uhob+xUnkHOOwCQdYb0Aq+4Nj7pvYDRUaSVA9CC42Zy9Uu6Tn9yUg6ewY5dM3FNYri7i/Wb1AR
	eHoFUQey0gWSnQ2NaYa3v5EjFsWK6Oh55sT8ZVakm+vCW41lDheM64OY34bENiZNRfTPcidvICdhR
	5hvwceTgpgkIT9eoCzpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh8Sf-008kqX-Op; Wed, 20 Apr 2022 11:25:29 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh8Sa-008klC-PL
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 11:25:26 +0000
Received: by mail-pg1-x52c.google.com with SMTP id t4so1358196pgc.1
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 04:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W/lhXgecBDWrQwrmi3IwcGDaw2Q0aGQ9eYgSFA2SGhM=;
 b=mq0MqMZABzTc+/HenZrx4jIjHskHGbPWFO0zolX7aGm6nOvmdHo3sUi4z1OzbFH1kY
 FZYRRTiZGfmnFe905yHmrNmy082WbSRJL5akr43VqfbRTWKbyWgJh2aUSPzmG/g1Qjqb
 RRIDlaEWJVGnkZ7JhAPFeyh9XKD5/PSU4g1P/ofzzHSV50GyRPFTt1SJniBKJ1xXP97N
 hV49noZYTRKb/YbNmpp8lI55WEJcKdgvoU45RRpHcSHe0xh0pefKcprDEFalAnYcp1iI
 7gn7AJxBgE3WHX2UtcXxYc1BxfBHMcEyFOwGqYMjbp6Yu2rC5WGzKGJNeg4xVwiP2+q0
 Rc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W/lhXgecBDWrQwrmi3IwcGDaw2Q0aGQ9eYgSFA2SGhM=;
 b=FauQ5nAV8fmTf1VY0FyLwZYDhUkKYNj9IH42rF9f1A8Y5pRkZ+UhVr668be7pgQqpi
 IWF1cgTfgmClA+w75ySA2Y/lHbP9uyzDZIMnvre/vfZeS/f1Ka0TrYFSbvSDX+pPbX+B
 dGMysKLyPh49IfVriYkge6cqEgpw/XPrkmFWGdpJp6lKaz+r+/w+jQG/m+SK5Ds2v2hN
 Rq8WH8hAjzR1kP3w2jFlvzvh65i1B+0Y0vM76RPwr66/khjzHHbfN92S/B1Jgu7bC6UW
 4ag9i6W8elwANS8yyPawcg6qm/12TgtzNGUApdFQj677d/EgGjb43UblDd049j7lktda
 7Yrw==
X-Gm-Message-State: AOAM533I8Je6Af0frMaiiYHH/IFcZXUdtzLTUmd5sHplm01twJ1vdzE9
 lB2KuTjxEB4Io16+5kBz69zPiQ==
X-Google-Smtp-Source: ABdhPJz9nV0msPZvcrWhZpToFAJ37v3xNoclCZihIzibbkZvB62z1STbaDlTLIG+owmRpdjqD288fQ==
X-Received: by 2002:a05:6a00:996:b0:505:b6d2:abc8 with SMTP id
 u22-20020a056a00099600b00505b6d2abc8mr22909619pfg.11.1650453924256; 
 Wed, 20 Apr 2022 04:25:24 -0700 (PDT)
Received: from localhost.localdomain ([122.167.88.101])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a17090a890c00b001b8efcf8e48sm22529274pjn.14.2022.04.20.04.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 04:25:23 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 5/7] RISC-V: KVM: Reduce KVM_MAX_VCPUS value
Date: Wed, 20 Apr 2022 16:54:48 +0530
Message-Id: <20220420112450.155624-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420112450.155624-1-apatel@ventanamicro.com>
References: <20220420112450.155624-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_042524_857991_5EDA3B1F 
X-CRM114-Status: GOOD (  10.18  )
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

Currently, the KVM_MAX_VCPUS value is 16384 for RV64 and 128
for RV32.

The KVM_MAX_VCPUS value is too high for RV64 and too low for
RV32 compared to other architectures (e.g. x86 sets it to 1024
and ARM64 sets it to 512). The too high value of KVM_MAX_VCPUS
on RV64 also leads to VCPU mask on stack consuming 2KB.

We set KVM_MAX_VCPUS to 1024 for both RV64 and RV32 to be
aligned other architectures.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 806f74dc0bfc..61d8b40e3d82 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -16,8 +16,7 @@
 #include <asm/kvm_vcpu_fp.h>
 #include <asm/kvm_vcpu_timer.h>
 
-#define KVM_MAX_VCPUS			\
-	((HGATP_VMID_MASK >> HGATP_VMID_SHIFT) + 1)
+#define KVM_MAX_VCPUS			1024
 
 #define KVM_HALT_POLL_NS_DEFAULT	500000
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
