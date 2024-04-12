Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88FEC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 04:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5y2SK2tSMlu+Ty4ohYAPRQdB4fhnV5h+UuieEhdNc4=; b=h+aD2Qv/9lqUsl
	YDgLdFw/SHJRbQkEvJ97KZcKVTCTpj4HccMpQg3d/PGCtcB2+emROm/iUeA5ks9ICtbkGPaB4KFDO
	Bro+w3spOsgjoyHG87+EfAPhJGKBcn4DbUQc62W/TPXg706jZVBk8uC+6RCuqC3SEVF6BfpOIV28Y
	KxkGXAl8oldCDvWvifxMh50/yW5kjihclqeFumi65dR7R+8eNpe3kvAwJHNrA7frbr1uB9os/YjdU
	iMj39fF/nuF7T4dppjJXtTCQXwJZUt2r22B45brIue8NR2y7Z3dq6leC7i1FrQwb9yB3af2Y9moRc
	MOSLIora1AbZYVy1KLQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8JZ-0000000FCv7-3Gst;
	Fri, 12 Apr 2024 04:15:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8Gu-0000000FAgY-1pdz
	for linux-riscv@bombadil.infradead.org;
	Fri, 12 Apr 2024 04:12:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=plhzSwBN2tg2hM/OGJHCzSMFajymGFMMB5gXR65w0nY=; b=SaeRHUhGA0mGb7eM0nW+eDWTaE
	G73rdhj9o1pueDuxCfrbW0OsSjdauUJmNNyeUhBVkfQnanEKtaozG1kXdCkzOCaMPHoh96lwpcy8w
	2IkoAvn/8ioDaiQiGrbp79qx3MnMVPxWW3DEmziu1gA4ghk4f1TuW5rvUbIV/kKdbJYt3QzFSRY7x
	A6OK3ROzkVe2o3BLIH1DFSRJZ5Pf4rDCbTsgVDu59iZWkJxN2wfjPbjjRf6gihl52Fk2OUidlXmti
	JzJcFzzV6YRx1V7YVTzIDSvA4SEGMJVoB3+BTcY2eFjzIcJeAD/aQxJnm2CmYxBmwjuGkUJZ+LHa7
	DISPxjVA==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8Gk-00000008x1b-1Jpp
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 04:12:13 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6ecff9df447so554508b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 21:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895120; x=1713499920; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plhzSwBN2tg2hM/OGJHCzSMFajymGFMMB5gXR65w0nY=;
        b=GUYfJ7r8V6VvJg/BNAb+WxG/YG0tYRG9C7h9GISzdwx/3zVxxUhCPkB/lGdmb+ghbs
         p61K5ZFn+14gu0gbCiCjGMmE6Kqe0c74H9u35YsYKkVcVNCFdE6TsjgdPRVlBqqCjkSq
         Mc6/uqnBYAYd319r8OQPhvxBfzN6xUJOqHbgmUE64PRAaba5i6tG5JJK9fjQSqzZ+0HV
         B1oiJljeaw613ItaGFFDcundazl16QNWlXNKzH25z9CacYW/+offRvE7cpN2COWt3fpW
         c5YrprWGOEWzkqv0XydBj/loZvrriaeIc8nLhDqQCY52GrlR/w8fBM4VwNeRgVJMTDs2
         P3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895120; x=1713499920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plhzSwBN2tg2hM/OGJHCzSMFajymGFMMB5gXR65w0nY=;
        b=JvdYP+emntnHAzbzsU4etmBJjYILk1aHZspLqK75p68s6/6s8bEp8UXu8tVFGUPZDF
         Un1Sj0JAakDDChfhnWxs3McMb0Q2PPKLzBoWUGjAMI6A/P3qLBxEthtT72f+7V1oK/kD
         IJceKQH4G/VYqQczZlZVRcgOhA+S6lkwOHGn49COcyC7xqSoWVq00ragiD0DTWPxKDh6
         EKQXr5Fvw/067tfqfS1asZD0NSvloKb0jMrNXaOjR8CXDzBcOuojMKkxqDrTmDsvU1H6
         PAWvr+NWwLMDV588bogqs7pkOlTo63ryzFR6Dkhy4XkZvIzSR5D24BFybAF/8CSPDLGu
         OyOQ==
X-Gm-Message-State: AOJu0YxcUYzgTh8DPhaWxT3XdvwsUa6FWx6lSQ6XCDRndK1YIfVyhkJ3
	rKXwwKGMQiAtFnUSklUUhioQ14O5WAXtJT8HXdALdu4bijlLF2lJ1mQM2nhC2O0=
X-Google-Smtp-Source: AGHT+IGB7qEzfffwtlvMeSArFRe5b2IbJWtk76uBcLMkAO0+GhaFRMgJf/WL0fMJial1eSC+YOsckw==
X-Received: by 2002:a05:6a00:4b56:b0:6ea:7647:282d with SMTP id kr22-20020a056a004b5600b006ea7647282dmr1404792pfb.29.1712895119945;
        Thu, 11 Apr 2024 21:11:59 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:59 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:21 -0700
Subject: [PATCH 15/19] riscv: hwcap: Add v to hwcap if xtheadvector enabled
MIME-Version: 1.0
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-15-4af9815ec746@rivosinc.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=2034;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=lbXM7gEz8TjX6THMhyqDltfPVCT1kYIv/wwg0eIvR1o=;
 b=gL8I89W2iPbnp9JhxSnVt0+YsdfyK3XR6HPgX62u6VidPvO2DFakfFikn+qtu3GgFR+cwPIl7
 u5WOsb8FluDDKKVd3JMS+Bqr6mmxoegGLXkHjjZWJ1mhV6fSumSV/y8
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_051210_605577_B85A12F6 
X-CRM114-Status: GOOD (  12.08  )
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

xtheadvector is not vector 1.0 compatible, but it can leverage all of
the same save/restore routines as vector plus
riscv_v_first_use_handler(). vector 1.0 and xtheadvector are mutually
exclusive so there is no risk of overlap.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/kernel/cpufeature.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 41a4d2028428..59f628b1341c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -647,9 +647,13 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 		 * Many vendors with T-Head CPU cores which implement the 0.7.1
 		 * version of the vector specification put "v" into their DTs.
 		 * CPU cores with the ratified spec will contain non-zero
-		 * marchid.
+		 * marchid. Only allow "v" to be set if xtheadvector is present.
 		 */
-		if (acpi_disabled && this_vendorid == THEAD_VENDOR_ID &&
+		if (__riscv_isa_vendor_extension_available(isavendorinfo->isa,
+							   RISCV_ISA_VENDOR_EXT_XTHEADVECTOR)) {
+			this_hwcap |= isa2hwcap[RISCV_ISA_EXT_v];
+			set_bit(RISCV_ISA_EXT_v, isainfo->isa);
+		} else if (acpi_disabled && this_vendorid == THEAD_VENDOR_ID &&
 		    this_archid == 0x0) {
 			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
 			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
@@ -776,6 +780,15 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 
 		of_node_put(cpu_node);
 
+		/*
+		 * Enable kernel vector routines if xtheadvector is present
+		 */
+		if (__riscv_isa_vendor_extension_available(isavendorinfo->isa,
+							   RISCV_ISA_VENDOR_EXT_XTHEADVECTOR)) {
+			this_hwcap |= isa2hwcap[RISCV_ISA_EXT_v];
+			set_bit(RISCV_ISA_EXT_v, isainfo->isa);
+		}
+
 		/*
 		 * All "okay" harts should have same isa. Set HWCAP based on
 		 * common capabilities of every "okay" hart, in case they don't.

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
