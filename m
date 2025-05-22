Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB6DC54ED1
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 20:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4GN/JO+z2q4iSMUlKdG1Vqb++zL9m5uVcp0AsivDxA=; b=ZXh7e1RD93p2JY
	6Hr4qSBt8qo5KmBhqfYiJIm71A27Fc1aFlnDP7rYQhcfSxQUx0Vhcj/0P5omOHhozv9KC3wCROV0u
	pTLjDNn7FfdVy2vt/GLeu/XgAROuA/W8ms4JLVTFBmmKzAbQ92mZA2vBKGq2wHOnHePp+9BFJkuYO
	ylby7zVfzfhhWalR9TExtjt2jeSBTBuJkt4EXGddp0hDPOP1i2Xh92YtZGyptmH/FnPpCcJL02B/u
	siAv+h+bPeBPxsuLJNWfETIAvpbsLUpx4WjsP73PiO6NS8gYX4PRFZmemgYVgO8PSrGwyh05pWRtM
	IpHpwyaqd1azdi2m/H4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICdm-000000028B8-3LRn;
	Thu, 22 May 2025 20:35:46 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICdi-0000000286f-1p0a
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 20:35:43 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3081fe5987eso7034171a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 13:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747946141; x=1748550941; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtEdIrem9+Yu9wt2wQL5f6sWXSENwBasckRwFklDCAs=;
        b=xleRcQ5Dxo5cYD5xCTAUuNsY5WsCZWMyXeCNERO5HjV38QNXeEe/Ujtz7puVo+IjHq
         jqo5OY+XABUiYC9/GDA0h8EXrBu3AP69ytp3LTNGUlqArHevFQ/Y0DG+0ZwFXn0/7/IO
         WhtLF/kRbFos3yjShVpUMySSPUBWggSuxMUeZd54u5H2gTcR0HFpf+12u+ZhQUN2hNDo
         x3UABcKXGPoWjiW/8grrzHwiURdqNnWIT3809KA9JcCZngQ6byZuicWJXt21hd+vjHlJ
         MrO4pRdFSnPt+6QoCPP00NkKbW3OB6sUE4AEtsi8rBZRXweDczhwI06UEeE70z75yduf
         arXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747946141; x=1748550941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtEdIrem9+Yu9wt2wQL5f6sWXSENwBasckRwFklDCAs=;
        b=R/yITo79yCsDxzx7p7NTH66O9YCP2nDNlq2bIo6fWN73DMbrJxZbQm1mmoYxLX0y3A
         D05xIJ55s7pZdzkExUQr2WF/bb/2x3yHTjOgdwphP8lHRcLKwf62Q7lwMxkqOlpYHhQp
         9aSHwh4lpa2Ej1SiDEOkTdtqKHWMKkw5BCEke8JKRI0W/nTv7kyP4ERsla51jvL9uTMS
         eykHgMWL+WpIpFLL+CfmtgJhDSPIkhyPoKG/IIeLe66sMcwbI4UdXG+d2ni02L/AHCLr
         VvR5JhhSt3G6nsz/yZCKVJGSrXMvTmnEVYctsiVZDLREjHqok0QnD9h6OMovhvL93s4s
         LcWw==
X-Forwarded-Encrypted: i=1; AJvYcCUffF8q4xmq9MNOQaA7hZyhLgcX8YKpt0PTaNb2fnIOBg4YfU2H4nOjsmcCmjVj2RnEIv/uS1/VPSlPug==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw8BtOK7TG+DwW2LA51g7Fb0TmIESBXwog6/tqooVnBkoOdeK1
	EZ8lljJSTfl2ipa9aW/uDVmLOo+1oTukehGkvv/22HCmF9aWI1+9ukYRwAlrY4vi9II=
X-Gm-Gg: ASbGncve2Fn7uVw242UFPzv+/E9Da2TKryGRAYz6hXDvKQ/F6t35g7FQnFzh16e4oVE
	M/qYv34cnH0o2ScCzMWG94zu0u8ATgKeF90Wv5RfytnweQkhk1VUIw2UXoaUdwlmhLzdh20XyEl
	rdh0VjygcvYfe9T0jwGbiDcAGzmUh7ttmtsQe59LsuinCGd6l0lzssP/+Jy26dpVuDcyK6hAqi4
	Axzk8/yTITP93qIzpCcKnMvRfn//OqGhweeStB3+Nn11DIoZ1RCIBaEnGrHpsjDTQdbE9ejUkCc
	6/Jhstj4VsOHhOAwS2VnGMIF944fAod0sBrIqDxLoFyvBdnWvkCQLffXFq2U+9aY
X-Google-Smtp-Source: AGHT+IGqDOgucStiU9mIVygqIjkW9gQFkzXHNqcolrSvYh0x1SWTXJ0keMr/XGvbvYLot1jB1dLQqg==
X-Received: by 2002:a17:90b:3dc7:b0:310:8d73:d9d9 with SMTP id 98e67ed59e1d1-3108d73da51mr15859023a91.18.1747946141494;
        Thu, 22 May 2025 13:35:41 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b229csm5932754a91.10.2025.05.22.13.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:35:41 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 13:35:29 -0700
Subject: [PATCH v2 5/5] RISC-V: KVM: Remove the boot time enabling of
 hstateen bits
MIME-Version: 1.0
Message-Id: <20250522-kvm_lazy_enable_stateen-v2-5-b7a84991f1c4@rivosinc.com>
References: <20250522-kvm_lazy_enable_stateen-v2-0-b7a84991f1c4@rivosinc.com>
In-Reply-To: <20250522-kvm_lazy_enable_stateen-v2-0-b7a84991f1c4@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_133542_472743_E724559F 
X-CRM114-Status: UNSURE (   7.57  )
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

All the existing hstateen bits can be enabled at runtime upon
first access now. Remove the default enabling at bootime now.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 02635bac91f1..aa8f7f67646a 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -562,16 +562,6 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 	    !riscv_isa_extension_available(isa, SVADE))
 		cfg->henvcfg |= ENVCFG_ADUE;
 
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
-		cfg->hstateen0 |= SMSTATEEN0_HSENVCFG;
-		if (riscv_isa_extension_available(isa, SSAIA))
-			cfg->hstateen0 |= SMSTATEEN0_AIA_IMSIC |
-					  SMSTATEEN0_AIA |
-					  SMSTATEEN0_AIA_ISEL;
-		if (riscv_isa_extension_available(isa, SMSTATEEN))
-			cfg->hstateen0 |= SMSTATEEN0_SSTATEEN0;
-	}
-
 	cfg->hedeleg = KVM_HEDELEG_DEFAULT;
 	if (vcpu->guest_debug)
 		cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
