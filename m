Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB37CCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 11:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGkK6j/OFduYZZLOc2EE8A3E4O4uyDEuIruRK/s8JSM=; b=E6v1uGSS844/SW
	dbZCjuBw1ZaVx/aDbojjmC0jnt/pWNR/psuzNknY9qKCZ5H5tbcupjKE/hQ0lTfu4rPOwc/1Erjv4
	PCCgEYe6pcxQKnH8GACBBMljwB2TalFSpfnyiHPIPk65UAYCim/q+v3CPpchXptqr8T5kBPXb67HB
	VO+avs2WductQEjRj5v5pljaaWN9EvypzrzqA7y+2JceS+hGhMLEl85eBQIoauqZsjFRPsmPkmtOh
	87V+PHCTKjtmxTRdJcoIaSXruQfNBNUGFFY7z3VZZQXe9K6IsD5EQ2ojlPIFNxQ/MuewhVFiXZo6L
	WDQLExFxPRxI3cWUnAZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4LP-00000000ySr-4BMh;
	Wed, 29 Oct 2025 11:28:00 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4LL-00000000yPB-3PLq
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 11:27:56 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-33d896debe5so7877411a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 04:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761737275; x=1762342075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EM17XL2D8YjMnEI2n2oDZbxwn/ekL7mieaWD4DF48lk=;
        b=FUtDoBnRpwVlC8jsnXADMMqcoGU8UCXg9yPi1/75pA37sADuf4H35bB7sNu3ejiJmJ
         URdtPDgROhoN0Ou2Ri/oHikHt6lq6BGuvfLa89B6L+zkTQ+/Ve7PTvuu+wdFGJa0m+er
         QjNK6HmIDdleecdD/6ohv0K4bAectH+6UkLbNVwbs17w4cCJ4xntcb9e6vfB4kIE+34t
         9hKmeH/FqvdzWABwwkLHJY+jlsV2pXZKei30AOgiiob0Ufcpb6cHeXNojnxJwdKYbdvR
         obtJ+CWtwuNLdluheua4j0oVifmoa9sEh5G+zBm+Dm2HhkAlBrN99Wg/HIaV0Ar5X9qk
         P2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737275; x=1762342075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EM17XL2D8YjMnEI2n2oDZbxwn/ekL7mieaWD4DF48lk=;
        b=CBcBFraww2sxrmuGl8TQ00VUFSPXKLQCMPXeWS8z05hwSVt2iZUZVJjGLJd7mkq7lX
         6rdsl219UfWl7Ti9O73zs18cX44BKRdMcTAMUvWbgO4Zg8plPqwwJMR/lXQTrgAB8TdE
         BEyZsDKQ/Pd6T/De8TWQkckalSVkbGN1TQz7sfHf54uuzDwVRxrleeGB8d7pI6GqvYFK
         XvpcAVnBKn68ovwcXInVViFKSAwgk6q8Qwa/OlvrpJf2UPC3nd7V+ajAAHlTMaMFSRpV
         QcO4KREknDZiCbUHvkm4Kh0oC/N81+LMiZ9WgD6e3BlaxSC//TFzLddPAMhxYVxm6+qR
         fRjQ==
X-Gm-Message-State: AOJu0Yx/JVIiRyu1154BRTBavL9mP4R97SJwOvtv1ZhKvEKot6I4geBu
	3orGDCLF/ZXw3RuBQOcp2ZsMZ4i2ktdDueoUGg5UXyAtGLZoNuVyjWD2Udwawn2Ymisr03Eb9ND
	RzefJgRtJeA==
X-Gm-Gg: ASbGncsBI8sn39oMsTRpqj5M8eFVMaKQuylQ3bFVU+Ab3vTWFvumwNocCWVCGtIbJQn
	/WA8CxAkGZrrZA/nkjNkMuA+LeXayQ5PBP6EWuEoog2RPdN+b5Ekp2XUgudqZLcepU2JemMSr/Y
	X05xt6cRVxR2F55lvEvdSXfEJJ21F5v5ruyiKqCBsPRnzxmx4wvwJm0vbUrbvBSzvhqEXw4VA28
	O1XNffzKHHjLSNwA+HrnWRm401sxS5EHDa+xc1LKxkbVY1O1HlWKSJzeYGrkD++0eg95h8+XBU2
	cz49+cPYsrnbaGPVDSw4pUSXEp3YnOQMEFTNT3wF1X+0NUDCbvHuhBWpvwZrX3KTVuYtRP49k2g
	+/Rrz526oCRI6ec9we/DP7CTpMXKE8o/lfoib+KM2Bg8nczJStNc/Rd3/9sodL1DVTkK6xvfdH8
	6iRqnbZe+Boyuzwe/GQz7UH1Am1YKx
X-Google-Smtp-Source: AGHT+IF600ISkv3fQ7BjFWjXUYnsdlJjH4uC/2j9DNguZaBAOpmO8VBsTXPp9fAX6HQJwfo0kcCWuA==
X-Received: by 2002:a17:90b:4c10:b0:33b:c9b6:1cd with SMTP id 98e67ed59e1d1-3403a281deemr3120310a91.19.1761737274703;
        Wed, 29 Oct 2025 04:27:54 -0700 (PDT)
Received: from ventana-desktop.localhost ([2405:201:d019:c0ce:f7f5:7789:48e5:c03f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7f6040sm15316918a91.16.2025.10.29.04.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:27:54 -0700 (PDT)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v2 10/10] riscv: Enable APEI GHES driver in defconfig
Date: Wed, 29 Oct 2025 16:56:48 +0530
Message-ID: <20251029112649.3811657-11-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
References: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_042755_852763_D79562FE 
X-CRM114-Status: UNSURE (   7.73  )
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
Cc: apatel@ventanamicro.com, cleger@rivosinc.com, tony.luck@intel.com, Himanshu Chauhan <hchauhan@ventanamicro.com>, robert.moore@intel.com, conor@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The APEI GHES driver is very important for error handling on ACPI
based platforms so enable it in defconfig.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fc2725cbca18..3e62484e148f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -44,6 +44,9 @@ CONFIG_ACPI_CPPC_CPUFREQ=m
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=m
 CONFIG_ACPI=y
+CONFIG_ACPI_APEI=y
+CONFIG_ACPI_APEI_GHES=y
+CONFIG_ACPI_APEI_ERST_DEBUG=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
