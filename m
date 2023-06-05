Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD89CC7EE24
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ij6wI/IZkBsC8WopvwoW+mAsCfbH0RJm06kElnuwyQ=; b=Sy2NcWDIa1Amzl
	3k7ln9trR2+r+IQXBzzZWu4XwjOqlYcOSAWqE5oMVfh96rhwVh5+t6EtB6HI71QHKQgZxNxvAyQok
	a9vA+UAvtfP6d9IoaM5MO/ymR76k3u+cg8q3re0d0zu5d4//fMawCU6hFgCc2xpH2xiZ3i3YmyUFD
	c2ukb8vXDtKgWnV7MLZvcKcfl7k7/EXvNofIt/g4pUjSWsaTW/k2bZXXqMlcBPtAaP9Gol0bdam+K
	cszllYql6Vjx5kFQwcYPmawFPExSPQuq/9z2v0bbDeRaxWqKdw0tf5j5MIqSTnqCG46MIwGOAZ3Vm
	S2RPQ0HOFlPPRJt0Kw5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CJO-00FyfH-31;
	Mon, 05 Jun 2023 15:40:02 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CJM-00FycZ-15
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:40:01 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-53f9a376f3eso4371264a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685979598; x=1688571598;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3y8ZxaitI4vDMB0+bZfjoHdHul+aXR4kvCb6HBDbSsk=;
        b=JaqNg7sN/e7gIeih2uZhtfREFG2IH1olkhz63U6B6sCbbDXJ+OSaBFdImVqpTtz7dQ
         k7dh1Kj3qgCbGUwraqgZGgGxaTIc6oX9sYPr1SVxsEbXdCwqE/9QQkgyIb6IcRTqvumO
         7n4xeE37coXrJ431vwE9t4gOlstc/yaKtSMg026KWweGp9qc6qDenmzprcxJdC4pgktU
         KFBdLVfhS9+755LCUU+/m+C+SW7Xn+C9lThCIaQ48tHJQ3jDNH2szJaoWf2GRnhArOvK
         0OaSEoMvpudVAuesI1tkV0oZqmvO79O6POYuNbVc1r4XHZlhfGaXBVw6OpLv3qdwf/pV
         jxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979598; x=1688571598;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3y8ZxaitI4vDMB0+bZfjoHdHul+aXR4kvCb6HBDbSsk=;
        b=iKR2rkUDMqPP0watA1ir1KaVWwqeUdiJmyjuUXR4D/v9wmbOJK2ucaohabFCSy2i7E
         nOLM+NcHhzKH7anxLWU4KtAVWAVaQjDE1BvUEAqzR8vh2Qbq76daDqezr9p0gM9eNJvr
         PCvA9roF/LUiKmA68obF7HcI8iFyV98wJZEukeys0m1lDxU/qecyaSpAh3PjlRQReZFW
         ejkuI+tdZk2VOXFbuMltIvSUpD9b7KVi5SRpb4egaZ6LokLviFJex8BrFBn4nl0LOWMb
         58Lcq6qsbXzBHxsm6xgAByhGMI3LuT3hyoqcSw87KXLnepV5VofvwlnSRKwC7Y7VmsFj
         Fc8A==
X-Gm-Message-State: AC+VfDy0AFOzqSrN+7ibUApGYaWUAiURNXxm/t3sxrnERp1rpQbnM8WK
	qVSgJO3uzUE+HHvusJWgUb8u3u7kK2XtiSnZanAuz7PMFaWeA5es0oeUGdvlfYb+/ff2gUSpgDG
	kirhI6Jc2496IwlpHNE8uLR/mg1q30yNlCm0j8opKGsTTGOjFj/q5BuLTr//cq0Frjml1Mvk2bu
	H+ZfnDH5DiM1zpk/E=
X-Google-Smtp-Source: ACHHUZ6VLVHTULzJC3UwlOIGxh1xz1Hej5pdJKL54f/HWuLX+oy5kWMBPi/AnZJSJIE42NhnPdD6dQ==
X-Received: by 2002:a17:903:41c7:b0:1a1:b3bb:cd5b with SMTP id u7-20020a17090341c700b001a1b3bbcd5bmr9720134ple.62.1685979598362;
        Mon, 05 Jun 2023 08:39:58 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm6725962plb.256.2023.06.05.08.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:39:57 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Celeste Liu <coelacanthus@outlook.com>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH -next v21 03/27] riscv: hwprobe: Add support for probing V in RISCV_HWPROBE_KEY_IMA_EXT_0
Date: Mon,  5 Jun 2023 11:07:00 +0000
Message-Id: <20230605110724.21391-4-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_084000_377352_3F0FC1DA 
X-CRM114-Status: GOOD (  12.05  )
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

Probing kernel support for Vector extension is available now. This only
add detection for V only. Extenions like Zvfh, Zk are not in this scope.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Changelog v20:
 - Fix a typo in document, and remove duplicated probes (Heiko)
 - probe V extension in RISCV_HWPROBE_KEY_IMA_EXT_0 key only (Palmer,
   Evan)
---
 Documentation/riscv/hwprobe.rst       | 3 +++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_riscv.c         | 4 ++++
 3 files changed, 8 insertions(+)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 9f0dd62dcb5d..7431d9d01c73 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -64,6 +64,9 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as defined
     by version 2.2 of the RISC-V ISA manual.
 
+  * :c:macro:`RISCV_HWPROBE_IMA_V`: The V extension is supported, as defined by
+    version 1.0 of the RISC-V Vector extension manual.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 8d745a4ad8a2..7c6fdcf7ced5 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -25,6 +25,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
 #define		RISCV_HWPROBE_IMA_C		(1 << 1)
+#define		RISCV_HWPROBE_IMA_V		(1 << 2)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 5db29683ebee..88357a848797 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -10,6 +10,7 @@
 #include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
 #include <asm/sbi.h>
+#include <asm/vector.h>
 #include <asm/switch_to.h>
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
@@ -171,6 +172,9 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		if (riscv_isa_extension_available(NULL, c))
 			pair->value |= RISCV_HWPROBE_IMA_C;
 
+		if (has_vector())
+			pair->value |= RISCV_HWPROBE_IMA_V;
+
 		break;
 
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
