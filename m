Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADC9C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 14:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VX1fSgjXBf4JFjXC34xzS/VMb9d645JLIb2ac4uflX0=; b=Km3fQ585R5G7Tz
	aSxOlv8L+t8pGReiuaYer0YaB39m3u+jyDb3PIqS4GQqFKVg4x6GSDb4LTBHR+AoyBqdODMj/NAzW
	oulpqENbAXqyyrcBdTHlew9wXGWRfjGNeYtkIdzB/CeNIg18uB3jQOKzaNoiV7aG9D6SeG/beydq+
	YJVxm3/B35OsMtbC/3Ew8aJVkqEqD9d+vU2rM3ZHRC+j95qPzxFnS0l6ty1d6TPvcR7QPm15emxLx
	5DpcwgTaWyX2cPWYCcwrPsnhXVgh67gup/gtVZOFbF4mc8SThgIGx70tzktv4S0abbHt4TcGT3+2t
	dV0KRr1XEzRSakwe3oHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zTx-005ZT1-2K;
	Tue, 28 Nov 2023 14:54:37 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zTu-005ZPE-0N
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 14:54:35 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cff3a03d8eso7501655ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 06:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701183273; x=1701788073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcHeZCCZuGmWk0VDihN7K+RMJm1jmcttzitsZzTnM4Y=;
        b=WQu1skCs0fMMa8Q18ngi3URYzlKCTMP3+M0lKLwGAqWMjVbiWdvv6gjc2JWPKx/rKr
         VBnB2RMDet6gHcvOPtU6SwyGSgG/3uiPL9UEvdnDMF7FvbeTH1elPqS2fUqam+PZUGjD
         L+7/xStB41UcKR+u105wi5IHXujeOawlNCC/xqovJfZR4gD0uoR4IjFbuU8uJ4QpWfHY
         /lbwYbGtBzWTt0o2UZ4THqJsozxVYf2xbaNr6XOQkTHYjo4XS35q/C+kDZOjDbuiPMFs
         uFDRhnmemMwtazIDEzbdPfc21j0Wmztifoc9ESAYA3qi+xIWI+8LiQlriQtKeAkZVC/2
         81Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183273; x=1701788073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcHeZCCZuGmWk0VDihN7K+RMJm1jmcttzitsZzTnM4Y=;
        b=MG/5oSTzPJrR5ajJDWlRiz7Gvv7hlcQKEkSsawd5kqryGrZHwNhWco1qap8as24GXE
         9SrQhxVhLftXKP1RGOsX9HRwd7MwubBQJjo/tImlcYe7vJ/ccp41Uq7EG+JQvgkAOxAc
         ft05J1JBjduosHsKjXFUV4iBM+PQHax1R+S1U0FHKtdTX+KxkmvaCl69CIYlkdLdypfw
         nVyipKAV5joLYTTkvdGcvZ6fp/TJP9kakfUX80kZdmghiPGrob/MgrEF7+f50J6imv0E
         08WETe46UJaZCaDEQbMb0ACmVMONH7seXbElOE38eR7PBFTA58O7VcGVLfH6o91IK+e7
         CChQ==
X-Gm-Message-State: AOJu0YwCuPDQiEtn6SlN9tXSAu9E7KCNfnM0gzdVzQGhMoqgKhsh1aDz
	sXjP0WeDfo4f1MpM/072URCtymlQ3jf1tJ/OujE=
X-Google-Smtp-Source: AGHT+IG3rh/n5LIwPOXeioV29umEzG/6UEmBsnjYv9Xdltm19th+jgin03EX77B7GOr1xHQnvGTJDQ==
X-Received: by 2002:a17:903:11d1:b0:1cf:66a3:16c with SMTP id q17-20020a17090311d100b001cf66a3016cmr16237259plh.21.1701183273418;
        Tue, 28 Nov 2023 06:54:33 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001bf11cf2e21sm10281552plg.210.2023.11.28.06.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:54:33 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 05/15] KVM: riscv: selftests: Add scaler crypto extensions to get-reg-list test
Date: Tue, 28 Nov 2023 20:23:47 +0530
Message-Id: <20231128145357.413321-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_065434_164336_798787D3 
X-CRM114-Status: UNSURE (   8.75  )
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

The KVM RISC-V allows scaler crypto extensions for Guest/VM so let us
add these extensions to get-reg-list test. This includes extensions
Zbkb, Zbkc, Zbkx, Zknd, Zkne, Zknh, Zkr, Zksed, Zksh, and Zkt.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 4b75b011f2d8..aabc05e4b02b 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -45,6 +45,9 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBB:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBKB:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBKC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBKX:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOM:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOZ:
@@ -54,6 +57,13 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKND:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKNE:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKNH:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKR:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKSED:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKSH:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKT:
 		return true;
 	/* AIA registers are always available when Ssaia can't be disabled */
 	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
@@ -363,6 +373,9 @@ static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
 		KVM_ISA_EXT_ARR(ZBA),
 		KVM_ISA_EXT_ARR(ZBB),
 		KVM_ISA_EXT_ARR(ZBC),
+		KVM_ISA_EXT_ARR(ZBKB),
+		KVM_ISA_EXT_ARR(ZBKC),
+		KVM_ISA_EXT_ARR(ZBKX),
 		KVM_ISA_EXT_ARR(ZBS),
 		KVM_ISA_EXT_ARR(ZICBOM),
 		KVM_ISA_EXT_ARR(ZICBOZ),
@@ -372,6 +385,13 @@ static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
 		KVM_ISA_EXT_ARR(ZIFENCEI),
 		KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 		KVM_ISA_EXT_ARR(ZIHPM),
+		KVM_ISA_EXT_ARR(ZKND),
+		KVM_ISA_EXT_ARR(ZKNE),
+		KVM_ISA_EXT_ARR(ZKNH),
+		KVM_ISA_EXT_ARR(ZKR),
+		KVM_ISA_EXT_ARR(ZKSED),
+		KVM_ISA_EXT_ARR(ZKSH),
+		KVM_ISA_EXT_ARR(ZKT),
 	};
 
 	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name))
@@ -742,6 +762,9 @@ KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
 KVM_ISA_EXT_SIMPLE_CONFIG(zba, ZBA);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbb, ZBB);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbc, ZBC);
+KVM_ISA_EXT_SIMPLE_CONFIG(zbkb, ZBKB);
+KVM_ISA_EXT_SIMPLE_CONFIG(zbkc, ZBKC);
+KVM_ISA_EXT_SIMPLE_CONFIG(zbkx, ZBKX);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbs, ZBS);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
@@ -751,6 +774,13 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zicsr, ZICSR);
 KVM_ISA_EXT_SIMPLE_CONFIG(zifencei, ZIFENCEI);
 KVM_ISA_EXT_SIMPLE_CONFIG(zihintpause, ZIHINTPAUSE);
 KVM_ISA_EXT_SIMPLE_CONFIG(zihpm, ZIHPM);
+KVM_ISA_EXT_SIMPLE_CONFIG(zknd, ZKND);
+KVM_ISA_EXT_SIMPLE_CONFIG(zkne, ZKNE);
+KVM_ISA_EXT_SIMPLE_CONFIG(zknh, ZKNH);
+KVM_ISA_EXT_SIMPLE_CONFIG(zkr, ZKR);
+KVM_ISA_EXT_SIMPLE_CONFIG(zksed, ZKSED);
+KVM_ISA_EXT_SIMPLE_CONFIG(zksh, ZKSH);
+KVM_ISA_EXT_SIMPLE_CONFIG(zkt, ZKT);
 
 struct vcpu_reg_list *vcpu_configs[] = {
 	&config_aia,
@@ -765,6 +795,9 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zba,
 	&config_zbb,
 	&config_zbc,
+	&config_zbkb,
+	&config_zbkc,
+	&config_zbkx,
 	&config_zbs,
 	&config_zicbom,
 	&config_zicboz,
@@ -774,5 +807,12 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zifencei,
 	&config_zihintpause,
 	&config_zihpm,
+	&config_zknd,
+	&config_zkne,
+	&config_zknh,
+	&config_zkr,
+	&config_zksed,
+	&config_zksh,
+	&config_zkt,
 };
 int vcpu_configs_n = ARRAY_SIZE(vcpu_configs);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
