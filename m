Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2B5CD4F33
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 08:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trj5l6htOFp3qM5j4Z2hYYdWQ+RPlZWoLbhp4M2YLXQ=; b=FTZCF9L7Cm7qrw
	bp1am0bm30QGwPaa2MeRz5r+GwZLi/BDQsJpRm0Ctl6vMSy66Lw+oADrxyneL6cfC4PpKFRzQe/YQ
	J0STYulGrWs3KBmc8naQPa2RY7er7Z0lhNVtYavKvbOe4VsqHZ8Q9YYxw1WsyT64mXW9XNgH2HEZN
	nlGJKh55wJ1ys2x5Lgbb5j6CThUtJVJhUEWDqNW/03UAMwhFw/T+A28ug6HlHDVOV75E5GFMBfJng
	3xWs4a89wQhtmatepWY3l6YTEjlY+gZKgowYv4PQ85xWP9dehEhrDyBEdml6tjT8Vx4EpYzqcZfdF
	VydvLMkrqhQm8k1VMacQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbyg-008TMB-0x;
	Fri, 22 Sep 2023 08:57:34 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbyd-008TIL-0w
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 08:57:32 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c43b4b02c1so15053775ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 01:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1695373047; x=1695977847; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vCzI3E8aO188t/F32/cMXTqfHUINrJvH0Tp5qCpKPJc=;
        b=fuwQomsBOSjPlwK7qCZLHvna7MODMjO2oGPwFJEtCmmjDu09G8fy8AlaYE0LRUh8Nf
         I+f0X/NaqNvjFo4lP4gYzmPDHanMhEyDpQNFytSGRBxvnxDvP8stcDPDyZUHxjalg6J0
         DGBXd+lTPdMPM2sEbw8QytWl3KQeNweMgfNHwVRCKUg060JAWs4iEQsbI6e4VySdaqt8
         1I//iRA3ztVMWipz4el7Cpnj7l7rKZHDoK4ZkgvZP9vBYKa7gqMkYFH1b38szUcVP6lz
         ZgvbcFcZAZFOmJnzw481RreR6PflDyWON255Fkw7KHUL8dVMUeg+I5Kqea8IPtp85+8C
         3STg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695373047; x=1695977847;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vCzI3E8aO188t/F32/cMXTqfHUINrJvH0Tp5qCpKPJc=;
        b=RNkc1gkzCO7vfeNVsjspMacQM2q0t99Z5yKgILZrTxZyROd3nabFKmyPrulmsqUHD3
         zoLA1YaM/vMVNyDl5EvjpLjKZ79qBCS6NkPojAbtDsriM9E/3QDqtO/QBjn+8zzfZsMP
         lLsJLz6CzkUbJLUQiR1UqVgnDYKSAepMXItVIFVQTgE5mAczcHiHOOZjwCqZSgG3GV39
         ySOYTSDyHXErEED89mEq8fJEpVFX6tkQyCvq2eLdWMqF3piQBKoDoylJJQxNTgO7raqG
         o5fpSSp9EdeRPx17M1HZegpiKPfbRSOwjZOO/xadZ5MueBFBc5Swm7OH6e5ow2nQhzRQ
         N5EA==
X-Gm-Message-State: AOJu0YzIVJAxWlWEbT0vfJBGmP6lpcSVs9TgXs+i514OAfsmmfTh6FCU
	gNPygBWEOPHjWLVbjSvQxrL1fvhCH8LEKdYuVhPHCgI3O5sHgLv2i57wE1AzyjHKcMnDMvZWMgV
	Gxld1d8E3MIIZn9sjtvsH9wu2sPQhOAsIDPuYOGdNs3aodtX0PtCcdJfXLiSuiTo70ZzWGtz5rq
	ti+Kw87MfEw3/HAG0V+w==
X-Google-Smtp-Source: AGHT+IGDUKE6sMJpErXb0g3YaZiHZpkET1mM+9eSCn6hTWCw/a2PztVDthPTlrRDuo5MMtmRLuJFaQ==
X-Received: by 2002:a17:90a:7066:b0:269:3cdb:4edf with SMTP id f93-20020a17090a706600b002693cdb4edfmr7843278pjk.16.1695373047171;
        Fri, 22 Sep 2023 01:57:27 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id t15-20020a17090a024f00b00256b67208b1sm4815024pje.56.2023.09.22.01.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 01:57:26 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	tjytimi@163.com,
	alex@ghiti.fr,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] RISC-V: KVM: Add Svadu Extension Support for Guest/VM
Date: Fri, 22 Sep 2023 08:56:49 +0000
Message-Id: <20230922085701.3164-4-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230922085701.3164-1-yongxuan.wang@sifive.com>
References: <20230922085701.3164-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_015731_325949_C87B1054 
X-CRM114-Status: GOOD (  11.46  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We extend the KVM ISA extension ONE_REG interface to allow VMM
tools  to detect and enable Svadu extension for Guest/VM.

Also set the HADE bit in henvcfg CSR if Svadu extension is
available for Guest/VM.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 3 +++
 arch/riscv/kvm/vcpu_onereg.c      | 1 +
 3 files changed, 5 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 992c5e407104..3c7a6c762d0f 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -131,6 +131,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZICSR,
 	KVM_RISCV_ISA_EXT_ZIFENCEI,
 	KVM_RISCV_ISA_EXT_ZIHPM,
+	KVM_RISCV_ISA_EXT_SVADU,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 82229db1ce73..91b92a1f4e33 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -487,6 +487,9 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
 	if (riscv_isa_extension_available(isa, ZICBOZ))
 		henvcfg |= ENVCFG_CBZE;
 
+	if (riscv_isa_extension_available(isa, SVADU))
+		henvcfg |= ENVCFG_HADE;
+
 	csr_write(CSR_HENVCFG, henvcfg);
 #ifdef CONFIG_32BIT
 	csr_write(CSR_HENVCFGH, henvcfg >> 32);
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 1b7e9fa265cb..211915dad677 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -36,6 +36,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	/* Multi letter extensions (alphabetically sorted) */
 	KVM_ISA_EXT_ARR(SSAIA),
 	KVM_ISA_EXT_ARR(SSTC),
+	KVM_ISA_EXT_ARR(SVADU),
 	KVM_ISA_EXT_ARR(SVINVAL),
 	KVM_ISA_EXT_ARR(SVNAPOT),
 	KVM_ISA_EXT_ARR(SVPBMT),
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
