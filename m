Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D31C54E65
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 19:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBIWqPoFmoyqLNCs73z0AL8Em/Pln/7KcZVmQExmNw0=; b=I8Y9hHgwWrUfRM
	ZFa06Sucbnl+nborkaX0UtIfgCn2om1oV2bZXn8tuw9hVe/XmFVPmW4HtnRI0Y3KPI16cESIASV2j
	St5fuak+iSJ+Tm6rsq1PdJYOHfEDZQk7X60Pr4PfblbozRPASAHSTxvomys23EcI0bRxxj/1xWMcp
	rCzQSM6+yO9pRb8zhAskRuze3RAMfqQ+4lZ+MqxJKsvpxzjhaIU7OYH1+5HFMGnrjKGEM1KjDrgi2
	lWgNz7ppbM4t2npTkj19ZFRYBh5Eh7jdVC9nFBHwyZhnzp/wbeJItRpg9GnybzvmlciLV4k1n60ap
	Eo0aD5lD0xzUMrqPY8pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBRH-000000020QV-036Y;
	Thu, 22 May 2025 19:18:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCs-00000001wVO-3gax
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 19:03:56 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22e16234307so1796915ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 12:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940634; x=1748545434; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NL+JjaCkPLIbpCFGEZpnZEqKtEvm89wxDo8gtW9i88g=;
        b=G/x/xI96ny/JbhY2PVQ1Waa39l7iDiIPFnIFn0NLPcnfaz2v82/skLijn/LVRsmClF
         y44pJ6VT4Y+GAR9nrGrB1I8M/ZaLF2sVopdRTz8LGVCzvfZ0d8YsLuBlBYa9lnelJtCO
         mGkb4xjxtGRsbXZK5STKly009D5eZlTiGshWEJ12fmFaUE6+DL7YXDiCGRrlQYaTcev2
         wuwbfN7EwHlBvVDNrz02yYAYSZD0Rch+9SwSkUN1OLVkycG0at+zSVaVK9/EuzH7ZB3/
         1aEmZamvBpchzdTjtSpj7U8sVWltRnruE68uJ9G7Lyu0lR0ntpeGyGD3henP12hK3xyE
         KbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940634; x=1748545434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NL+JjaCkPLIbpCFGEZpnZEqKtEvm89wxDo8gtW9i88g=;
        b=HMO+3lhdb69iuWvcbHzPIL7qBSFtcldZxwa+URLLaruxL0VG+7EUYFc2xLXhXWlopM
         XwdDWhOm6HdDQdbipuM9aHQH/c9vbJX3XAafZbLPKoQ7gQeyFbGx8B2OCbBqrfblMHNg
         tI3ZpUfhMr0hPvhfyeiuA0iw04x8voKf6a7cwSU4e3ZBHsthp+WtTUID6dwi1ktvGaPh
         4sjNf6AZjc7CfTvrfdAkokWaOMlpgJ9PUmOX5IPVVvc8lrZr5fpq6OG1aJiYl7O2vRM+
         dnFd3MSHhtyQr9dO3Vhpzxksj9FEEUC/x6ngWOpGsIaPCOmO03FkXVY4GIwAhr2pdzsT
         yWXw==
X-Gm-Message-State: AOJu0YzJ3l36du14sDf7GhB3StLUfoFCNP96a5Xudly21OVbEmvyZiCd
	DjuqhsMHEpLfrdVfQ5hc4M0eJ0k/ijcLEh4UfrSzyntRWbg62C9jri9Hm0ZDhFclxS8=
X-Gm-Gg: ASbGnctNerW8w0WAgjg7LAD2CpVnbyfLIqrFYFZkwf5LJ5aCNDC5Rcyotw2Sv9dBie4
	dJNSgwxfTcaUaawzV3NxlSjVLU+iWAc7pYvVgmYcES+PvWanWnwvae634Rt+/lTVb2ugGCd+VuH
	CUDJ+MVwvm+OW+qxGpyVy1DCt3W2On5xOYbJDQGWjg+Pa7/KncPHe5gt8vtRkwYi14Rb0p4dTtF
	TDpe20ffqZhMM7ZknSFo40M4JvuVl+PTb+DB+h1VLYnDQF13/uQnggRWHBrN3D0sZ8alQBYfZWb
	6sWMQHTMBLotvX63ykTbUiPcIDAd6ydokNLeBMe1lujpGxTRfBq+jbAcI9fjw4L1
X-Google-Smtp-Source: AGHT+IE7MkEZajOwtulJ1pSoS+YJGY/C1JUznV8zU99zjbdE3O1pdB4nhaqsx7X0UH6Pko2Lha+e4w==
X-Received: by 2002:a17:902:e545:b0:232:1d89:722f with SMTP id d9443c01a7336-233f067c489mr6091775ad.15.1747940634357;
        Thu, 22 May 2025 12:03:54 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:54 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:43 -0700
Subject: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
MIME-Version: 1.0
Message-Id: <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_120354_942879_111D5793 
X-CRM114-Status: UNSURE (   9.71  )
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

Upgrade the SBI version to v3.0 so that corresponding features
can be enabled in the guest.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 4ed6203cdd30..194299e0ab0e 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -11,7 +11,7 @@
 
 #define KVM_SBI_IMPID 3
 
-#define KVM_SBI_VERSION_MAJOR 2
+#define KVM_SBI_VERSION_MAJOR 3
 #define KVM_SBI_VERSION_MINOR 0
 
 enum kvm_riscv_sbi_ext_status {

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
