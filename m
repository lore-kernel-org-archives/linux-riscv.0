Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DE8C44501
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/L6l08eNW/d+NPHRbAUJfk/CJN/RBy5JMG/R4Mezmo=; b=qA7pm6NieTExiZ
	cYeZNDXrCTmf4z/2nAQbAvOMxM0HVAI3jJWQR6BIIqkfInYLquf/k3k6vyidKMiZOQBZ9RAGyCOvy
	5Ypj5fzOe1v9KxEZGyYZvHkqezPLFnMdTEvP4dFMu/6EMX+MaJHuxG0Aey2alQBrM2No+FcIxebnX
	2UfnfYqptSq4Rg1VimLbGr668WbUOFbt0Nm7ic4dTgQBasXHQ2Y9y3wLE398CwTRNX/DMHBpVL/P1
	Gt+hFnDdyX8GqEfPnVu9xiXB0ctGA0JrkyaOXrBugOyMXhin1/P3mHditVc4SuhG3e6fAg/gnn+Nb
	AMTniI1IXV9FBKXMIy9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxn-0000000BNQK-4BoS;
	Mon, 06 Jul 2026 02:21:40 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxm-0000000BNOS-0JqQ
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 02:21:39 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c9a20f70263so1425987a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2026 19:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783304497; x=1783909297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MI4l7nifRnfxUSWJkRHmALVeDUyVcPjbpLqiu+zme2g=;
        b=CCVaDA31EOAiC6BGgPgorl+OokMTRCDenyXshC2nXYjO4Scw0eSsUuqRzeyeMnYgsD
         Vwaa6eqV+w1RyPGOtHUld5roD7Mv32jBuTHStPoge6wVOoPFMHpeFqOSU93MDcJLbNyk
         wQnxaot2Wlc1XDFh6sNy/WALZLXFI9+D2yOdPAx18W4KaCIwm6paaJFGuIeqCbBnMFNi
         Zg4OTXpmZ1ODh8H/NmRWOexeaey2/lVfktzwuxyC616Gg4ZioJG1+Fxf0L0Ly47a2LoV
         gLF5eOwp/xlHrER5mCnK09Sc5LaWVtFQy1JztGDs0SjUIVdnlDOjy6gD4WsOfdFDAp0K
         7r6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783304497; x=1783909297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MI4l7nifRnfxUSWJkRHmALVeDUyVcPjbpLqiu+zme2g=;
        b=iRiSEw2lZJMIztxiD2kLkzjQIIoJ9/YsTIkKX2LeCuAxKVLHm/fzCtQl227TQQX/WW
         uBxwE2sbPaHznN+1UoHBzv/qFJEpcUYCfCZyeLHfxkWuPhzuJv+ouvkdC6PkwmL2Ve8T
         KGRjDaD7i6JhvXObGOxiIZym4pJ8nAwwVuBFM+W0MJDvGtpdE1k/fPbdAGCwbqRKz2Md
         9MelBn0H/gVl6wMamdvFofoaeoDf2eKJR43pWqRSH8S6MWEDhWKjYrJy5e4KjdIQif2O
         pd08mIHp0ZwE9eLmzi9wSAinBilinK36LpJH7cQqwGmsaJUR2pu76VtrmcLTMlbmC3xD
         M67g==
X-Gm-Message-State: AOJu0Yzltz5oqo/eEX88sdXPLkxUkOSHrAhjJJbklvNLToXGGcvo9s4C
	lZ4qVRwRkMjvSC/i4teIc84vELxCMx/Vs4FLNgtQO8ry0oFUq6rZPk7j
X-Gm-Gg: AfdE7clsOyE+Y1wOYBzL198Pwu0KEppv7m0ZCT4aEhCvhbMljD0yvjCpbk3y3PtWddW
	Y2S/g6/Zlt4ultv4hv5HydDF3kCkKDUMzdliu9lMnpD5Xl3FBEB+TfUNDd9K6uRDvQ3PPibCGXd
	00g6SKBBL5EQ+HUzmAdM/+IXpmtmS5NKqmmPjMf14yLSx3SJrlPkNwmvNg/OJMRZEfZBk1EP0UT
	mhkJe+tEJEZgRoT98gZhVVScJrpFzY8r5GUaVJNhlHP3LXmLtbBPUsmDdOOy0dVIreoiMu0QFoZ
	TNJy6HPHWC5szDm3FRtuqsDsiP9xhj+fCTzfPB3ag9STBhvT2cfHq7sQeW/ObKu5o2YtjuwBCAE
	1y8FpWavLdIexC3XNf9AuRgVogP1cnI4dBwgCVSzrsYyY/cazQL8WE5TL9G2XfhMWf6Ymmtltjl
	U=
X-Received: by 2002:a05:6a20:e211:b0:3bf:990d:3fc7 with SMTP id adf61e73a8af0-3c01caacd28mr13139722637.20.1783304497212;
        Sun, 05 Jul 2026 19:21:37 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e91b0a2c4sm4953589a12.19.2026.07.05.19.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:21:36 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v5 2/8] KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
Date: Mon,  6 Jul 2026 10:20:38 +0800
Message-ID: <20260706022046.214956-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706022046.214956-1-inochiama@gmail.com>
References: <20260706022046.214956-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_192138_123755_4C30016D 
X-CRM114-Status: UNSURE (   9.72  )
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

The KVM RISC-V allows Svadu FWFT for Guest/VM so add this extension
to get-reg-list test.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index cb86cb6b3635..94e33b2ee796 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -745,6 +745,9 @@ static const char *sbi_fwft_id_to_str(__u64 reg_off)
 	case 3: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.enable)";
 	case 4: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.flags)";
 	case 5: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value)";
+	case 6: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable)";
+	case 7: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags)";
+	case 8: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value)";
 	}
 	return strdup_printf("KVM_REG_RISCV_SBI_FWFT | %lld /* UNKNOWN */", reg_off);
 }
@@ -944,6 +947,13 @@ static __u64 sbi_fwft_pointer_masking_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value),
 };
 
+static __u64 sbi_fwft_pte_ad_hw_updating_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value),
+};
+
 static __u64 zicbom_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbom_block_size),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
@@ -1259,6 +1269,16 @@ static struct vcpu_reg_list config_sbi_fwft_pointer_masking = {
 	},
 };
 
+static struct vcpu_reg_list config_sbi_fwft_pte_ad_hw_updating = {
+	.sublists = {
+		SUBLIST_BASE,
+		SUBLIST_ISA(svade, SVADE),
+		SUBLIST_ISA(svadu, SVADU),
+		SUBLIST_SBI(fwft_pte_ad_hw_updating, FWFT),
+		{0},
+	},
+};
+
 struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_base,
 	&config_sbi_sta,
@@ -1268,6 +1288,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_mpxy,
 	&config_sbi_fwft_misaligned_deleg,
 	&config_sbi_fwft_pointer_masking,
+	&config_sbi_fwft_pte_ad_hw_updating,
 	&config_aia,
 	&config_fp_f,
 	&config_fp_d,
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
