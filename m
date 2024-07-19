Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B180EC3DA70
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJg6XHBjO5z82nAxUFSt3lgv/35imd3NGP07Jn9V+Fo=; b=oHF68+V4mjICMY
	cis0X01O9mvCVTqFcF+Jm3QnYbsTZaCNzNCjmj++2uYLBzrMNrOP1bPyX8qNO2L58OcKFwqX4Ab2v
	JoY+x611K1eqydRsBlcgKe6MawOalMdXPyXRDfG/3FMxzdE8Sa8ZP84j1NLMyQM7SfIasYycbgCzd
	C65zJeR9rlnsZZWZCLyQcQehpGBYoU6MLpG6HLNtCa/a9K5ZOVrnlPQVmHwnW2yH+w7S1OfjOk9G6
	LFlHr97riMMpkUQzHemj9xQ0cS/86fE1EWyAE+tTpbeQ9MgVmluPEIa2HrokkHsvh1QuOIpjPSqfO
	oGLv8/Qlbt6MRoRJ4Eiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqKI-00000003Egd-33fR;
	Fri, 19 Jul 2024 16:19:22 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqKB-00000003EaP-1DvK
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:19:17 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1fc6a017abdso12590705ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405955; x=1722010755; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=Fpg++THa0pranFEHC4HiKZ5nmlXPpYkWoFWU7Or2IKHAKnwxFOx0EFkDWKfvbw0vNa
         VxSnq3kgkXohdFRH0hJwn6JuvooS/dqTfT6+NhQgS4YzUdTtM3VfxxNWLF3Mhzzhfq/Q
         CfrvQEvMPLMCsse9taB/e8cMt6Iu3T4oOiLHIoufcrr/3UteG0jHbaew8opGdj8s00RJ
         vbn72+/7GxLn6d8SiAzZm4uNSXCyBxpVk8Jb9ZbkyrjQqK+ElUENxU9ovHysrQ1ZBCi3
         wwGS9gAd5NdzGRp32MrL18U2CObdjJ30iTFpjVGl6HdpnHhntrGO//abwkMyWM5DKxPV
         V7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405955; x=1722010755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=uFTYlaHUSp90lsRwy8SuniLRkUu3hOWm0wqpOQEfKsVMEfUiyHi0+jGUdEHpdHSsuB
         iI7ywEcpBV7/cjIFURt7x1o8MEzdhjPPf8slBya5ungOz+mf0M6HzDRUWLYNMduPrh3G
         7W3k7Y3vaya6wCdiL7DdzjXjuyrYgNxQj8QXzZ/tqdDzafOZEcgACvdeuMQkNlwK1QFQ
         8Lq6UYMkfDVVS/XCl52/WcF5RtFcVl0hGktBT4uj2b04Ifz5+s2wIsx5+iUYmuizKAtM
         9p9dyYGLmWiCx+o788kL+qZhIh4xHEsSeYKfST3yYYJJAsI9hmbtVi6ue62r/TFFWUaY
         xfGQ==
X-Gm-Message-State: AOJu0YwN3PPQPdPHVX+V/XlAXwHjvg12eUM6Ra/xmuEGiFu1+43K5DVg
	NW/Zx+feSOSm31Fe61Z01rGRm/iNCIusjxVvLsAZ7eWgGVHiBSCYTsyzOwqnJJM=
X-Google-Smtp-Source: AGHT+IHd7APHDJpS35FeR6ima+9K+gVcF/yw8osLtSNDHRBv0ckC3G5hlBewBT39FPTJMJNG74+ooQ==
X-Received: by 2002:a17:902:d489:b0:1fc:287a:cbb6 with SMTP id d9443c01a7336-1fd745bb20emr3172445ad.23.1721405954729;
        Fri, 19 Jul 2024 09:19:14 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f490dcbsm6461435ad.297.2024.07.19.09.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:19:13 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 19 Jul 2024 09:19:01 -0700
Subject: [PATCH v5 06/13] RISC-V: define the elements of the VCSR vector
 CSR
MIME-Version: 1.0
Message-Id: <20240719-xtheadvector-v5-6-4b485fc7d55f@rivosinc.com>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
In-Reply-To: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405940; l=930;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=0jkC45FH0LUvSVfvCEJuCBZ027fqPbAipPAnc4zFoN4=;
 b=kJKsEpX+fUX2Wt/n4c9KZOx/LoIvpni+uGwAmrg5zbcQiIgJQZ0LwLXDxk0v5epNZ16kgtSmF
 oT/F1Zju1FNBC6eHRkfuhUidUEAzjP+Fqr1KM7TrqvwE68kkRQ/SZc/
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_091915_380189_4BC5866D 
X-CRM114-Status: UNSURE (   8.83  )
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

From: Heiko Stuebner <heiko@sntech.de>

The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].

Define constants for those to access the elements in a readable way.

Acked-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04..3eeb07d73065 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -300,6 +300,10 @@
 #define CSR_STIMECMP		0x14D
 #define CSR_STIMECMPH		0x15D
 
+#define VCSR_VXRM_MASK			3
+#define VCSR_VXRM_SHIFT			1
+#define VCSR_VXSAT_MASK			1
+
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150
 #define CSR_SIREG		0x151

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
