Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3062C3064D
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 09:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3YanSgV4tAc4FW6GqzY5egKo6656djGFHYueCZsgkKo=; b=lYLHhkL8/a+3J9
	7umSERp/vtDJGeSOJoHsQFgxb3VvMwSrEuLdupM4Hs9WeY8mLAsxCPejwrpRK9FXaXg4YIWyck8zq
	EQRpHSB4PoSjkVq2L/+eaf4io1MN0drEfO8KuZ2IKR78qDLBGVpS+dMJ9Nb+u6+auQDqV9ktaJjCm
	bbCPhtOttTcQPNQ18HemCBvCL+6DbxdulPn5tjZzljTUfwe2ohwwQTrLnCFDmqtcXk484UPPUB1qr
	mpv9i0Mg9qhMtxQW8vUzCo1Ur3edKfCf9LDc3vAifaSeEt4u77uhZErBg4V4it1xf9MIlmF7/WGZj
	gNHYgh7LZjGHrLUQGi1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN841-0000000DHqP-1Pjy;
	Fri, 28 Jun 2024 09:38:41 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN83c-0000000DHZK-2K5d
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 09:38:18 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-6bce380eb96so272908a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 02:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719567496; x=1720172296; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PpDCA7CnSWtIO6seFJ4J0hDKtH06inwXMPU5CaySLhw=;
        b=NKrGUI1SyFpAgDrOzgTUxjOAAg7Dt+LwqoHCNLFPGGQJaBG6jShB2swkSRyw5Sor8M
         TXMYvs/CH/J3sYzh827Oz+ZHM9Nomm0yFCeITyxjv/dH2AimXGJHlF92Ys1TKwagyfpK
         TbYNSaHNF1W3ZVGP0my6wywtt7/XadYmFUm6yY4qjFrbscp9g0QZvAXX5YIxKxX7kCIA
         B5PSm9hU31HVbwa7bw+97T2iVDLmwOqifzcBRDCUUqheQpbb6o51ujrkdA528EzVR6xb
         GG/K4MIFUoPib8tYLjYNynxSXrIr6plsOLZrK7PCk0TagSZzrJPmXXsnVSAccELx+WQ+
         JYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719567496; x=1720172296;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PpDCA7CnSWtIO6seFJ4J0hDKtH06inwXMPU5CaySLhw=;
        b=Azw/3hVHXfJdFKrVgKz2lE1q3zN1AoOiS3NwUZwhHWvXLES4g03C8aBuBdoOx7kMt/
         rV9ZX/8F2SeaVjmLCgLkOGzrMPwLxlxlclQ1n5E5dTJdkOyan4/7wTGd7rREUlDuMkHJ
         UmHzAfrH1Z+ojwjLWEuFZZ7K7OjsHzOe3U/8WZaHwhtfIow8Z3nt7a5Hu5GYlYk/dB+G
         G8qxayVeXiGTFwCmuNhvPX1WgnQVparpn50n2YnwCc4r6mfr7i+U7Cl+LsuDukzltNri
         nQTxi+PBUHsJR2lqFxZAe019DxHqh99wvqsxNN0fHdpBEe9NdrERTVtnaXk1HwQ7pwEa
         pfTA==
X-Forwarded-Encrypted: i=1; AJvYcCWLkkQYbnUJ6ySmmWq7br8BIp1S7NCHYWBCFfxIoH1qPXg4ZTvmyw7ndpRsIjSHJmuydlXnNktBI60+qEu8uE0h/4aD+c/r+aa8JQtyvfPw
X-Gm-Message-State: AOJu0Yyi79YhDUoeU6UvdcIEEv8E6b1KQujr6YZ4bKoK+AT6fVdh65eX
	NffDkMGyl03/nUJtHxu3+8NCoS5ILis2DHyDCwffGGUZ24KHAx+94EhfCvCe4DE=
X-Google-Smtp-Source: AGHT+IG3L14BlCwHPiIKSplLpOkLLGSwZSlMj6M+WV18XsZAbw/WIXgi64YPVTn0Axv2MFnAlS9dBg==
X-Received: by 2002:a05:6a20:45b:b0:1bd:2703:840 with SMTP id adf61e73a8af0-1bd270308damr8420473637.33.1719567495751;
        Fri, 28 Jun 2024 02:38:15 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10c6c8dsm11087155ad.26.2024.06.28.02.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 02:38:15 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v6 4/4] KVM: riscv: selftests: Add Svade and Svadu Extension to get-reg-list test
Date: Fri, 28 Jun 2024 17:37:08 +0800
Message-Id: <20240628093711.11716-5-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240628093711.11716-1-yongxuan.wang@sifive.com>
References: <20240628093711.11716-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_023816_629335_75492306 
X-CRM114-Status: UNSURE (   8.26  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Update the get-reg-list test to test the Svade and Svadu Extensions are
available for guest OS.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 222198dd6d04..1d32351ad55e 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -45,6 +45,8 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSAIA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSCOFPMF:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSTC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVADE:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVADU:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
@@ -411,6 +413,8 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(SSAIA),
 		KVM_ISA_EXT_ARR(SSCOFPMF),
 		KVM_ISA_EXT_ARR(SSTC),
+		KVM_ISA_EXT_ARR(SVADE),
+		KVM_ISA_EXT_ARR(SVADU),
 		KVM_ISA_EXT_ARR(SVINVAL),
 		KVM_ISA_EXT_ARR(SVNAPOT),
 		KVM_ISA_EXT_ARR(SVPBMT),
@@ -935,6 +939,8 @@ KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
 KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
 KVM_ISA_EXT_SIMPLE_CONFIG(sscofpmf, SSCOFPMF);
 KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
+KVM_ISA_EXT_SIMPLE_CONFIG(svade, SVADE);
+KVM_ISA_EXT_SIMPLE_CONFIG(svadu, SVADU);
 KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
 KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
 KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
@@ -991,6 +997,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_smstateen,
 	&config_sscofpmf,
 	&config_sstc,
+	&config_svade,
+	&config_svadu,
 	&config_svinval,
 	&config_svnapot,
 	&config_svpbmt,
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
