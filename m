Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA111C48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 12:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WLccWMjvFAwVz0S8iAlAU1WKfSvOSt7djJhchBpusYw=; b=tXRYftpiWugSon
	/TbFCAHHeo/hnGzavEadlpDQgN7aVw3O/8TAy2lT/4t5fOX92YqmaT2Y06Uc9Ur1XrKUsgtzAVLPk
	mtPE2mMuzGCfZEB5Ez4ySJRGubXXLNqXV7AypbTzR2hY1xbKh5z0I62vhrbFe3bRZmpBBDJc1VEdI
	AQKVqX8/YkQShg7BEW9pBz/XQ/FNFS82F4JUYCkxZddZ1GCwgsAveyAFCP5keTeM2noIUuAyVNl9C
	UOHo3wobt1fpT3JNpBxwvtxpX8yAcXb2QPd/W5SwluKXzc3ngJO6of7VoNZGpL7VhzmpLYLedq6rQ
	koKJiVAUXt0EqqQZ2DlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raEX0-0000000CrHz-2jT1;
	Wed, 14 Feb 2024 12:38:30 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raEWv-0000000CrCz-1pHa
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 12:38:28 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1db640fc901so2705505ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 04:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707914303; x=1708519103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBSxSTn4SzFgJCLw2mwbPUiKLRcghcd12QFIpuWImtY=;
        b=op2XlWQBFTS9/VOfiqoCaNkyfRd65EJyIZTDMzXD3KERHiXt1HNQq6ZlXFN7Rx0cYR
         ws4jexdf5IAHl6UxyZPxcFg6H5IDsWb+ks04geX3BRKX6WHcaN/VtnK9uOld3DG3131u
         gMhfOjUJVwu30INVig1Zpssg4DevDGFIWGsaF/5Ic92l1tuhb986BmJHEBtMpa6az25Y
         GfCNy6tudVGXrsvNmZQzlmAY2IKmfCx/olBS9q6MtwYZFIhUl3AFDiKTIbUQl2ydGp/z
         djqRPAvrmwF0InmaCVo4NqdQhK8qkqApGTcfhHueePKrEVH0GGT/12KMbrCLFUeJnxQ9
         HAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707914303; x=1708519103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBSxSTn4SzFgJCLw2mwbPUiKLRcghcd12QFIpuWImtY=;
        b=OJUck9P04gaG0iu0xYT6RPEJ0IlqeZePO0SXIqbpf1pWVnXoflOw0gVUBMeRZReE8E
         i69k3Qf7I+pTLhyzu/DUSlt9OgiV2EuaWd8QQManPqOTfSltcWi2I0CQIpJRnkA2h5ZB
         I0qn5g37SS/tGq5ZHogZ5NP76fNcNGAtlIbdRByrVusKZi/BIJqm9k10ypRbtbnKLQdG
         rEXN7wJlBC7LbDSew0I1dADpl1FxTWmiH6WEdWDskNkxvkYC0deKiBLqglGYd4/jGvCq
         guDcSxUoY8r9Xly3mTYlrzf6FrP3WovLY2QTZfX5Lduycd3G8yM252yT7sFXoS2Ub++s
         zPcw==
X-Forwarded-Encrypted: i=1; AJvYcCX1I7tKo02uBDS1u1BZj/3uIbdIWF74i6T9l6xhMgqXrRfhW79rM/kvZ+DXSwIGOC+j4Bcdjx7X4JmkW3ztFTGCWo2wQDD5spyUaEKUCBr4
X-Gm-Message-State: AOJu0YzVK7vxPU7VIyTsKyrp6576yyrhod6wcJejmr+j3KCmAxCIa+rI
	3SueRI6urzqWnLjdMRGpDbAvV185W3FYEfFk4jT6dp99AQd/HVangkAMxqKJX6s=
X-Google-Smtp-Source: AGHT+IHZQFnNrVkrei4j4ZNoY7pCPgZUX5vwqHY83d+LoRS42msBSa4XSwOZVWRzwbeoKajJ1Adrfw==
X-Received: by 2002:a17:903:32c5:b0:1d8:d5b0:aadb with SMTP id i5-20020a17090332c500b001d8d5b0aadbmr2210794plr.66.1707914303508;
        Wed, 14 Feb 2024 04:38:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUoXP00E/iqkcjEmAUlBHrFJKYJoKL4q0+QeKcB6TPtbNEYX7VWrlUX2Uu4YkbXuRUJQslzZEHFfn4RRvKWNaoR1WGgwBvKaBbLuwi1AJnOnuRbkIMSuR7avQ1052diCkJpSrupZ3VKHRgEDuNPXtIbEhll4ygTcHqYxOA/MP4rJGThf+wtAPVi3AFCynE9gkIKexohY7Vd7k4vqbCkAHGmHho00ydthMQHcwzX88GbrObaKy1fPto4j+hoMuCbWMJrPdoFd6zCAhMaSq3mikn72w6/DpzwMNRrJHMsGUiBmghCZoY3PSJ0HRwHl/aGY9OJ1J0rJviin0rxG5PtBlecyMLe7mNfEE+tC7TTqPTFsxyL+evcZjOYIWg/SgZWHHLZB2lm5nnkEvTFrvx8F0KGw0C1erIDuDyRozFYxsy2oK+85SskFZaKJr2sRw==
Received: from anup-ubuntu-vm.localdomain ([171.76.87.178])
        by smtp.gmail.com with ESMTPSA id o20-20020a170902e29400b001d9b749d281sm3041419plc.53.2024.02.14.04.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 04:38:23 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 4/5] RISC-V: KVM: Allow Zacas extension for Guest/VM
Date: Wed, 14 Feb 2024 18:07:56 +0530
Message-Id: <20240214123757.305347-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214123757.305347-1-apatel@ventanamicro.com>
References: <20240214123757.305347-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_043825_614421_62FB7DDB 
X-CRM114-Status: UNSURE (   8.38  )
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
user space to detect and enable Zacas extension for Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index f8aa9f2ace95..37fb0f70b3e5 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -167,6 +167,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZVFHMIN,
 	KVM_RISCV_ISA_EXT_ZFA,
 	KVM_RISCV_ISA_EXT_ZTSO,
+	KVM_RISCV_ISA_EXT_ZACAS,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 38f5cf286087..f4a6124d25c9 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -40,6 +40,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SVINVAL),
 	KVM_ISA_EXT_ARR(SVNAPOT),
 	KVM_ISA_EXT_ARR(SVPBMT),
+	KVM_ISA_EXT_ARR(ZACAS),
 	KVM_ISA_EXT_ARR(ZBA),
 	KVM_ISA_EXT_ARR(ZBB),
 	KVM_ISA_EXT_ARR(ZBC),
@@ -118,6 +119,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_RISCV_ISA_EXT_SVNAPOT:
+	case KVM_RISCV_ISA_EXT_ZACAS:
 	case KVM_RISCV_ISA_EXT_ZBA:
 	case KVM_RISCV_ISA_EXT_ZBB:
 	case KVM_RISCV_ISA_EXT_ZBC:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
