Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A5FCE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 13:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PcJYBAGwbgLacDZhLRHSpFlVVz4ho/RSBHZvAnG8Ws4=; b=HKuwBnuaQuFHMG
	DUPFZVgeLnMgd3B/s04mgbcJUFpGPN5TsXalDI6qxWARWB4dslTO+1v/8xHrF40iVkVd6NIs4La7e
	HYpdyPSqw2d/mtlm+x8WMCvlaJm7EzZ5DpBThqo94MzM48wvUz3aWavUk+aqDlNpq3nS8wN54Cnhk
	g0QMJ7rakzYkv6eYIaMP4SUUghsiyjh28i/iXN78edgNcUUYJAtabaKEd3e1+Xiqo1xcgwAswmA14
	Viv0jrGAs57u7qdG1NNNteMjtm2MflAlTwrPQ+WBDUFXEqBrpcOKOS4vsHduaK71t0J85i3GVjIdw
	W/ifI0ZSxwqX7/wKxmCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qklob-00EMRh-34;
	Mon, 25 Sep 2023 13:39:57 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkloY-00EMOL-2l
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 13:39:56 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c3d6d88231so44438925ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 06:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695649193; x=1696253993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiGfuZzpdgt2mtsTil9OGkblf0k2xd+WLhVWfEwORCk=;
        b=lu7Hsep6lOYiSYukxDkbmg1OhPEUC7AZke3WOcIVRcbxUNEzdk2bUjFMrm4Mhm4ul+
         Xw1FJ3epcUD5kpAhyIcOL0LRsTdQnZ/CoTJWhXbymFCM4PgqWcOHR+lYISrAYWVJc4wF
         epj834Yz/oBlVmU3o557P7QJOyuAKOuhrUt8o2JJimB50uuHQWwrACxxsYfY3dvWj7jP
         brNfaA/6isu8Mu6N9vgFzqR7qYqm8inZKmMTgfKrNCmRp1hLDrNh2JFG5t1eazjxJx7w
         MzRDDwrl0L9AZmUW77HXBsFjGhfW5xLudLP78T/9T3SeDplskZDsDYPCY92M1POAppB/
         VtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695649193; x=1696253993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiGfuZzpdgt2mtsTil9OGkblf0k2xd+WLhVWfEwORCk=;
        b=tnz7+fnv/Dh9kMUZ+sV2aVLuDCbeAU2CTJD2mmWqW0VfoTV4bHR+UfmtY2+nUr0cRG
         ojpREnLrvgFsktNesfAii6wKvg/RjqlJYIwV2q2G5c9eFaqeH2q37/5P8GdOJoab/VzA
         m4RxhCJw5U+hGs0mNMSI+uzI9AQcn9LOfAHJuo83IExmNdtS+acGU1gZ3Epe9ZNYiplO
         I3PPIeZWPyHh79+XEavvk0ZnWizMatKkR0B9240uplrlCkLiZ1Z1M7xjSUTRgCil767k
         X2yGLU72GM03evPuAgIXKXKnhmAjivXKg2hU4VEX+RCR+2p825X7bc3BFlTr/V2Mxz2l
         xxZQ==
X-Gm-Message-State: AOJu0YzrUxI3BjyeOIjncxpY9dG5C8Lcb+RRnuazWOjRiVdLeWTUVGD3
	mhr2uc5cXXz2x0wGEvBXw6ADWg==
X-Google-Smtp-Source: AGHT+IFAFl3LL8p0HXHNpJm36GoHz0drDmeIuMdA9JnKQikzt531c8bL68ncefHeUvtNOSQlgomJjg==
X-Received: by 2002:a17:903:24c:b0:1bf:6ad7:2286 with SMTP id j12-20020a170903024c00b001bf6ad72286mr6241708plh.43.1695649193249;
        Mon, 25 Sep 2023 06:39:53 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id p11-20020a170902eacb00b001c625d6ffccsm969433pld.129.2023.09.25.06.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 06:39:52 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 6/9] RISC-V: KVM: Allow Zicond extension for Guest/VM
Date: Mon, 25 Sep 2023 19:08:56 +0530
Message-Id: <20230925133859.1735879-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925133859.1735879-1-apatel@ventanamicro.com>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_063954_891928_6FCD2D9F 
X-CRM114-Status: UNSURE (   9.20  )
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
user space to detect and enable Zicond extension for Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index e030c12c7dfc..35ceb38a4eff 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -139,6 +139,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZIHPM,
 	KVM_RISCV_ISA_EXT_SMSTATEEN,
 	KVM_RISCV_ISA_EXT_XVENTANACONDOPS,
+	KVM_RISCV_ISA_EXT_ZICOND,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 17a847a1114b..d3ca4969c985 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -47,6 +47,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZICBOM),
 	KVM_ISA_EXT_ARR(ZICBOZ),
 	KVM_ISA_EXT_ARR(ZICNTR),
+	KVM_ISA_EXT_ARR(ZICOND),
 	KVM_ISA_EXT_ARR(ZICSR),
 	KVM_ISA_EXT_ARR(ZIFENCEI),
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
@@ -95,6 +96,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZBB:
 	case KVM_RISCV_ISA_EXT_ZBS:
 	case KVM_RISCV_ISA_EXT_ZICNTR:
+	case KVM_RISCV_ISA_EXT_ZICOND:
 	case KVM_RISCV_ISA_EXT_ZICSR:
 	case KVM_RISCV_ISA_EXT_ZIFENCEI:
 	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
