Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9B6C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 14:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=04da4buKvEbuCqzW0yKH8+0EuEd3r6BnC4EWIIQn7G0=; b=ohNP2j6/9Adz/j
	t4JTTN/N+MtAVW0DMY7emEZTTbgxOJbUBCErlap1tcv0tNiQdF2sMT45wnB0dc+EdiGHtmKyzPFGe
	ANyrJF/cyHzlEfFJ2KUVWvygGun2wDwIZ1ogYj10O2UTF4kNFXWAbd3ZnCywRGkGLZu9fE8nIW9rl
	zRhZ4qPUdp9MtiZzU2P6HziaP3MZdzgXXzNG1IiIttqaox/5Tp7Vp6/WCO6aIrSzccMY4NdEJT1jV
	3uq8t4m1lBFiHuBahBVgi4GBn6cZVezRzNJ0LeI0etvubIf1zTUe5Cx0O2xrcmGauSSzy6pHGJymJ
	TvzOX5m0oT3k1iI4Yj1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zUJ-005ZnY-1i;
	Tue, 28 Nov 2023 14:54:59 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zUF-005Zjg-34
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 14:54:57 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cfcc9b3b5cso20383525ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 06:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701183295; x=1701788095; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hci+9UDHQawot6/zMSxnmVJawqM8CfBCCGrmHWBS6oU=;
        b=DEpfksKTm9YrkrY2mAZ23/VDEMEHvQ0kK0wccwLrF8q0pSjp/TmgerPnNNfZw6J4M2
         ldDLSbyXzi/wVKY5GvA++WTBm+tj2SGnhRD1NAUH2abFuU+6CKpXq450rnEBJR+5WHUq
         58+wP3GKM6olTK7uIO+N4rYHjbxzv7XSmTNnUHWmyTPwNbU34VuabqYgjsCv/HB7EyC0
         Z0BjCBV0s4yHiSUmxxATbVE2n5cwmMdPjtcN3d6i6TiGi0QEWKZqxYKQwgwH6vvdiFt+
         l4bMSvAJITNPuUXYbrCwky0hFQZh9LX8IR1i3eh84CUQ9wVutFkwKv3rQnAcYL10yiT4
         bLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183295; x=1701788095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hci+9UDHQawot6/zMSxnmVJawqM8CfBCCGrmHWBS6oU=;
        b=tep22Ni2Wm5ADxhoWTReVQPymhE51Xshl4pSVltJUEKt4kfXt7Ag5EAdG1Pv+tMY5P
         dB2PE/hOBkrTk1OIjFh+zilAc1H/mcsqhZc/ids5ZgY93a01QflZF3s57kyazRQLHGo5
         3F7wU2ncd6Y+96fmN+O6M6yfJ0bBHphh2JxVF6W02Fi9xQE4zugD9cIBD9kaDidhmw34
         sdSXtszbu91bY51ZYiUu9pCC8cmR78GOBfNtXCnvyG3D3GelaRp6U+4qCcJvKbufWcx4
         MCJGy0uxmtPpi9OVIdG3nSW/2ZzIFZEyIx+PSiO3/M1iRkdZ1Kye1ib5CMElWdP4HMxc
         tJwQ==
X-Gm-Message-State: AOJu0Yw//DooVbHKZZ5XpR6B7ByFt0j8aGi4YMWbzw8sFdyrnXIZW/Fw
	05mb8uK6yGY1HTUSIIrsNvfOrg==
X-Google-Smtp-Source: AGHT+IHnloDLnCJ3p0XiWdFIxCZ3S8kJNR5OplVR8qRnvg9ozpD5v57Rnc9CKkPkmm+OJT2ekALH/g==
X-Received: by 2002:a17:902:e5c7:b0:1cf:a4e8:d2be with SMTP id u7-20020a170902e5c700b001cfa4e8d2bemr18008232plf.12.1701183295332;
        Tue, 28 Nov 2023 06:54:55 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001bf11cf2e21sm10281552plg.210.2023.11.28.06.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:54:55 -0800 (PST)
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
Subject: [PATCH 09/15] KVM: riscv: selftests: Add Zfh[min] extensions to get-reg-list test
Date: Tue, 28 Nov 2023 20:23:51 +0530
Message-Id: <20231128145357.413321-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_065456_011510_AED2FE85 
X-CRM114-Status: UNSURE (   8.10  )
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

The KVM RISC-V allows Zfh[min] extensions for Guest/VM so let us
add these extensions to get-reg-list test.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 04ff8836c474..4af0f9a750e8 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -49,6 +49,8 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBKC:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBKX:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBS:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZFH:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZFHMIN:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOM:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOZ:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICNTR:
@@ -387,6 +389,8 @@ static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
 		KVM_ISA_EXT_ARR(ZBKC),
 		KVM_ISA_EXT_ARR(ZBKX),
 		KVM_ISA_EXT_ARR(ZBS),
+		KVM_ISA_EXT_ARR(ZFH),
+		KVM_ISA_EXT_ARR(ZFHMIN),
 		KVM_ISA_EXT_ARR(ZICBOM),
 		KVM_ISA_EXT_ARR(ZICBOZ),
 		KVM_ISA_EXT_ARR(ZICNTR),
@@ -786,6 +790,8 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zbkb, ZBKB);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbkc, ZBKC);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbkx, ZBKX);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbs, ZBS);
+KVM_ISA_EXT_SIMPLE_CONFIG(zfh, ZFH);
+KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
 KVM_ISA_EXT_SIMPLE_CONFIG(zicntr, ZICNTR);
@@ -829,6 +835,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zbkc,
 	&config_zbkx,
 	&config_zbs,
+	&config_zfh,
+	&config_zfhmin,
 	&config_zicbom,
 	&config_zicboz,
 	&config_zicntr,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
