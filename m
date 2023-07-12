Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCD8EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 16:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w3ev6Hu5AyCQPVHZA5qkLlrZfGYnXwixWyBZeXKm8lg=; b=EZN5R59GO0Nrik
	u7aYryrcnHCeBbSLb/noYd6km1YMrpcY70vmJllXC1Y/wjOuYiZbaTA1Jqp5ZnKzar7rVXWqLf5gp
	0Gmg116zNDjlZXOWC2hjV5H7+8x80cfzhAiGk3TkjvlGPh/PHWZVEdOp0K9mJywhOt+V7mON7W/zn
	95C641KXNRSOn9H6fWL/Zr+Qy0k+kHlK8oGl4Toh3j2FG6GjgV7D7/WA9BkFf1Jsqgpi5uVP3WevB
	Fb3RyWC+PxAqH1lazg8A96oqvZ8Grvd3+U1Ifj0hsC4IA3apasriTUZShzu6Caz60QRbHf3ORbb8i
	8wlnd2xfBRzB4DwmeD1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcR1-000ThC-0L;
	Wed, 12 Jul 2023 16:11:23 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcQw-000TcD-0p
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 16:11:20 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b9ecf0cb4cso14923305ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 09:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689178277; x=1691770277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIhoBJIji5REw+c97wvX8gH5yx7OMiGOjWHtFLvuXY8=;
        b=DZZl6Tyw8rygxq6v1Ip8WcrsD1yMw3IJx70AOvwyWIZXUv6g7wymi7DWduMTgyI/t9
         uvO8LdmbUqraLqRMq8xwFd6S9oAciovNB9nTsIblGR+XwQ9Xe/FL5Qf1lsXCblO0QXM3
         X8jEL+v85UEWQggyFYzoT0GNUi+xZunYwUP07iidokwKQYaorj8lmWEV1b1jrIBPCrQR
         qO8iH1vLuooQC01OSehv8g3+36qDMzDLYB5Ccghk1GLgLihiA6Orq5rk7GKR17rBy4SO
         rPpkN1ZEChVnqODAcYV2KjMouU3bds6fmw4j/qEkE6SBWX7QfhNkYV/nW7wRcyRbh1cY
         dipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689178277; x=1691770277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIhoBJIji5REw+c97wvX8gH5yx7OMiGOjWHtFLvuXY8=;
        b=ikjkWAFtm/Koj2ek2XIkuZySojEc4bUTbAPZGwgCM/O+kt0nFflf4Z+tFFRIeMAF/j
         24N6EC6DMkvwh9UXa4h6tmLFjP2LplG/ucdZ4b1qEPuoKxo10OUFmraY4xwdZvTuv6Ai
         +AaKhAAxn4XrEU65TYoGOENfpuJnl1nziVXI30V2oCWZDfgKsFTOBP2YBQP1I1JXRJ99
         kblP42W65Wzoh482gPl+fOqVoPKXsuwfUxCbjGuxKhrSrfJrA9x128wHOyv1jMCDYToG
         yqsYdaCQ8Rbwe1t9+qtgszZVvFXGIJuP3YhMGcTiF6ulo4s3JdMcA5xLKOfWoZ6Oamcf
         YF6w==
X-Gm-Message-State: ABy/qLbEEriWikUlQg3x+6Vk5ScgAd9hr5hFFuYhHaAC+wWkdDq35CFy
	AyY1QtrGVhB3zfzbf12uguPEsA==
X-Google-Smtp-Source: APBJJlFZDPe0kDucLXqtwvSgUfPEhKZKDiIULA3ytTvWn38iLHBRbIqekwRmcjuywf6ZlCFyltNA3A==
X-Received: by 2002:a17:903:2305:b0:1b8:9b17:f63d with SMTP id d5-20020a170903230500b001b89b17f63dmr18745465plh.23.1689178277316;
        Wed, 12 Jul 2023 09:11:17 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.82.173])
        by smtp.gmail.com with ESMTPSA id bc2-20020a170902930200b001b9f032bb3dsm3811650plb.3.2023.07.12.09.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 09:11:16 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Samuel Ortiz <sameo@rivosinc.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 4/7] RISC-V: KVM: Allow Zicntr, Zicsr, Zifencei, and Zihpm for Guest/VM
Date: Wed, 12 Jul 2023 21:40:44 +0530
Message-Id: <20230712161047.1764756-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712161047.1764756-1-apatel@ventanamicro.com>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_091118_319759_FD5847A0 
X-CRM114-Status: UNSURE (   9.27  )
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

We extend the KVM ISA extension ONE_REG interface to allow KVM
user space to detect and enable Zicntr, Zicsr, Zifencei, and Zihpm
extensions for Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 4 ++++
 arch/riscv/kvm/vcpu_onereg.c      | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 68f929d88f43..9c35e1427f73 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -126,6 +126,10 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_SVNAPOT,
 	KVM_RISCV_ISA_EXT_ZBA,
 	KVM_RISCV_ISA_EXT_ZBS,
+	KVM_RISCV_ISA_EXT_ZICNTR,
+	KVM_RISCV_ISA_EXT_ZICSR,
+	KVM_RISCV_ISA_EXT_ZIFENCEI,
+	KVM_RISCV_ISA_EXT_ZIHPM,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 555acebcbe02..e73f9b105a02 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -40,7 +40,11 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZBA),
 	KVM_ISA_EXT_ARR(ZBB),
 	KVM_ISA_EXT_ARR(ZBS),
+	KVM_ISA_EXT_ARR(ZICNTR),
+	KVM_ISA_EXT_ARR(ZICSR),
+	KVM_ISA_EXT_ARR(ZIFENCEI),
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
+	KVM_ISA_EXT_ARR(ZIHPM),
 	KVM_ISA_EXT_ARR(ZICBOM),
 	KVM_ISA_EXT_ARR(ZICBOZ),
 };
@@ -82,7 +86,11 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_RISCV_ISA_EXT_SVNAPOT:
+	case KVM_RISCV_ISA_EXT_ZICNTR:
+	case KVM_RISCV_ISA_EXT_ZICSR:
+	case KVM_RISCV_ISA_EXT_ZIFENCEI:
 	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
+	case KVM_RISCV_ISA_EXT_ZIHPM:
 	case KVM_RISCV_ISA_EXT_ZBA:
 	case KVM_RISCV_ISA_EXT_ZBB:
 	case KVM_RISCV_ISA_EXT_ZBS:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
