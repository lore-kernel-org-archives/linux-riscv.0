Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51C9E776FC
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 03:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxlXid/RWKEb9iwU10mylFGwqwsu/fJwmMOdUETDl6A=; b=ITax9LjWCpUhRP
	TYrZB/pQ2n0R7A/5I5amQvlWb5lo63e5K+Da2ybRC5CRqxAurhKiRS4EEn2WYmTencEr+p2js+geT
	0b31A8qtzjF61Iw+1cMUsuzG3lRs+zoHPaMUE9bBKC83XCKKmvviHzAJCDv+7QbrWiTxvrzDGyTV3
	UjZ2dCGEibxulYnS1lpJZux2nFFHibSy8L2/5huB44kvwP9rUHvjOL0epU93gj0dF6cmVBFWLUD7L
	VRaojublINKZ7qWk8xXC7HXVR++MVnTGN6voLEM1gQKRYVYjbjPmqiP7VMJOCM7jWscdAHbrJQmIC
	XA2VC3YdPEcDETro7PTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnWT5-00DkA8-0p;
	Tue, 03 Oct 2023 03:53:07 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnWT1-00Dk69-1a
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 03:53:04 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c736b00639so3340975ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 20:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696305180; x=1696909980; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPmuiSFVvpuLv2dpw8j40AU0MURCdJR8iWnmtgcJS7I=;
        b=ilUJG+eUoqB2UGTNvv2T13Xwi4uUvdpXLrLPOcZNkNWr0Xdq04S7U+ss6KDykWdQus
         50vLTcF0LiV7Rah8SABr4bziVVSib/Lyhjx0wF2Vm2zCA59xsP9g7XomGtFGYhXY9jD4
         gNujVNlR7/tAZWOD6ayWbyDJhmiPk+AaTnbvM3XkBlwQCRzl2kLxcqZevujmMW1K4OCj
         fTe+3LRVa4t4bhr6d9m3Z5DZXr7oUxdz9qrukPixPabh4YekqnUTadvNvAv5KrGcnEEU
         DWfTgt2Q+Nm0OxHIfCuvYTmNqqx4HgaKP39cEfztBvGS37cigg6XKRBCU+U6JOacpqdc
         vjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696305180; x=1696909980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPmuiSFVvpuLv2dpw8j40AU0MURCdJR8iWnmtgcJS7I=;
        b=BI+xMHb4xAfx/BAB+AMJQSqoaSRvpjJc64HzD8T3nxm/Dbh/wtesIeY4ORttoxDRLz
         Jsi1H3hm/dSwtD7zYO3sS1kAnZ3QgSbrRVAjin9aw3q1p9HnDWqacsyWEaMEg7U8AvIF
         Psk87zedx6OyIXTbxh1/U/i3tXslSXPE6KSeezPx63K8by266hLAheO/1d+Q1hShL2Av
         +w+OhVnBMOyxEHIJiPXfcaho3D/JuYMzjl+FS9C4RQvqwmWSdxgZoQlf0dJNnIrW2FIr
         CA6RXrF8gH3GV3Npzk8whsx7CM9fsvnZaS+IsR2n8rpmmUJz2Px6FN1l7zBtoIj6cPga
         04RQ==
X-Gm-Message-State: AOJu0YxHOSTBFvMgQykdmEA5u9gUnSquoZ9Ux/Irp0rMtdZfOVl2w6oa
	aHZ1Y9edS2pEhICW5/3hyMZvNA==
X-Google-Smtp-Source: AGHT+IHam7uEpuZxRNzndfsTMEK/VL2fjCzPC87o5phTd4UvXj5ySMEaSTGduC8zgkkya1ayeGrlQQ==
X-Received: by 2002:a17:903:2305:b0:1c6:e4b:bbeb with SMTP id d5-20020a170903230500b001c60e4bbbebmr13020119plh.56.1696305180186;
        Mon, 02 Oct 2023 20:53:00 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.132])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001bf846dd2d0sm277381plb.13.2023.10.02.20.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 20:52:59 -0700 (PDT)
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
Subject: [PATCH v3 4/6] KVM: riscv: selftests: Add senvcfg register to get-reg-list test
Date: Tue,  3 Oct 2023 09:22:24 +0530
Message-Id: <20231003035226.1945725-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003035226.1945725-1-apatel@ventanamicro.com>
References: <20231003035226.1945725-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_205303_535928_B73E7769 
X-CRM114-Status: UNSURE (   9.89  )
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

We have a new senvcfg register in the general CSR ONE_REG interface
so let us add it to get-reg-list test.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index a61b706a8778..6cec0ef75cc7 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -211,6 +211,8 @@ static const char *general_csr_id_to_str(__u64 reg_off)
 		return RISCV_CSR_GENERAL(satp);
 	case KVM_REG_RISCV_CSR_REG(scounteren):
 		return RISCV_CSR_GENERAL(scounteren);
+	case KVM_REG_RISCV_CSR_REG(senvcfg):
+		return RISCV_CSR_GENERAL(senvcfg);
 	}
 
 	TEST_FAIL("Unknown general csr reg: 0x%llx", reg_off);
@@ -540,6 +542,7 @@ static __u64 base_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_GENERAL | KVM_REG_RISCV_CSR_REG(sip),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_GENERAL | KVM_REG_RISCV_CSR_REG(satp),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_GENERAL | KVM_REG_RISCV_CSR_REG(scounteren),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_GENERAL | KVM_REG_RISCV_CSR_REG(senvcfg),
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(frequency),
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(time),
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(compare),
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
