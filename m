Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5ADC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 16:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zv/R1LlM4B0/EcYeEmFmo1AWL59VmiCWsVXs6iEzsNE=; b=tL8w7p52ZDrFnX
	35L9Xz/dZ+eL8EGBfSq/IkHCdoL3cjKhkq8uXna3MTJjmTXDsH6jBh6qMtl9KDCNQgZFoxPy7wR7G
	key1doy7aRblzsIXB5ewwh1ei+hMAaEqF2WdRgg6Ae0LxF5NbUkhLG0XVVq6I26IEGbU2v9IvcUHN
	/MgDlwl7ytQ7ri8ZsZWpT+tCv0aHmLHk0eZzmsH46gST5bpPKabOj52YIrfBv+ZG70GhNq6X6tUyw
	onaTBC9PHc/mfzWNowaxu5YreSvZ2iTtVUBdo1tzY8iKqpwltYyqBQ5X6NODBWqJljd4OM6SAOh5/
	6BPkHn7ViDgueqmWaD8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56cF-000000022H0-3XMy;
	Thu, 09 May 2024 16:27:31 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56cD-000000022ES-0JcI
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 16:27:30 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1ecd9a81966so15647795ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 09:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715272046; x=1715876846; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/faDAFpSR0nEREgruz48ieW2Rr4UgJ9rT3PHGQFx6A=;
        b=mZ/L2wCF6nFDfoqkvaXUE5IFBi2Gw64/bV7KuSGrfet5rzPSjq3/pJvbvuUhGqe77X
         xQsW3WBtgw7LE6elCBuO+R4Y7DtyGp/fRBL5hpm1V4uASPvyViI9I3tsLLjzaUFcIkM8
         krncthWsATEYn1krTcNW6FncRzgEIRMxFcy9JLU35SpCxqNAXFC3zUfEv8fXUCESOqd2
         5/cAomYl+0lwEVI+NzKcZa4XgnQDcoKodfagRoK+v76A2KZDAUbMTAZuYqbdz1Fmfe6e
         EC3liwr2p0/sGPr6MqSJe/YO9aBPB/eBVoEUeVB2js98eI862rkX4DXxmtwanNU0aGMU
         OObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715272046; x=1715876846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/faDAFpSR0nEREgruz48ieW2Rr4UgJ9rT3PHGQFx6A=;
        b=hLdS7QxUISaf59bw/gXYIHx873T4UOe89nLsIKYUZWDrTPlHipy/hvjI8UTmBpaZ5a
         0Vg0wzr+vSIhwa575wkO5OPoOO5X0Q/QeE97HUtg+PVilOgjZoIgwQRNS7tRnrSGlNkN
         GXvRcd49y0Ww8OTqPpqgymvkvpDu9tMknBCNMitbtHsyG1mB+lHeJAEeOT24HfqPSiUm
         Xb8/+8d5ppc44hN9bL9FSwhiZ3COXL2veJnw3WZ8l7gifyhgG9pAmbKEVsMHQZesvJGI
         mPIKxV2St9QNK8Icsz2xmQh7vZtHnBzc1Rk3nOtwfpjtJfsRTRxyKZtSO2+Lqj5ADOp2
         XTkg==
X-Gm-Message-State: AOJu0YyhvMBiyKATAVB9sbd8/K5ERoauw3tjzGeOvqFZQzTmAU7on5yp
	+vfvmNY4F2NIPw8i0u3x0S37zBwIkrYZ0kPOQAteiC0gK3lWI2nZ43Cu57a4pX4=
X-Google-Smtp-Source: AGHT+IHRJN0hklVkmHeffKwUUkj9zkJwCxFOEPyg5vihbQBuEXUImJTw4YLdpfC/uaaO6wRigNHbew==
X-Received: by 2002:a17:902:e74f:b0:1eb:7162:82c7 with SMTP id d9443c01a7336-1ef42f74f9amr2694775ad.18.1715272046337;
        Thu, 09 May 2024 09:27:26 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13805asm16210285ad.264.2024.05.09.09.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 09:27:26 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 10 May 2024 00:26:51 +0800
Subject: [PATCH v5 1/8] riscv: vector: add a comment when calling
 riscv_setup_vsize()
MIME-Version: 1.0
Message-Id: <20240510-zve-detection-v5-1-0711bdd26c12@sifive.com>
References: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
In-Reply-To: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Chiu <andy.chiu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Vincent Chen <vincent.chen@sifive.com>, 
 Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_092729_158097_65ADD5D6 
X-CRM114-Status: GOOD (  11.80  )
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

The function would fail when it detects the calling hart's vlen doesn't
match the first one's. The boot hart is the first hart calling this
function during riscv_fill_hwcap, so it is impossible to fail here. Add
a comment about this behavior.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Changelog v2, v5:
 - update the comment (Conor)
---
 arch/riscv/kernel/cpufeature.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3ed2359eae35..15ffda1968d8 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -683,6 +683,9 @@ void __init riscv_fill_hwcap(void)
 	}
 
 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+		/*
+		 * This cannot fail when called on the boot hart
+		 */
 		riscv_v_setup_vsize();
 		/*
 		 * ISA string in device tree might have 'v' flag, but

-- 
2.44.0.rc2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
