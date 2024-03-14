Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6527DC54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJNZ/z8I8FHgihYafm0vRfK/ITgVeE/Yk/lZPu00q8g=; b=NY/Io1giyphO1c
	f5Dd3GmDuYlTdUnMqvsviTHfO+jisz0qFkw2HWpa+plNuoRD7KI6b9iSJEc8xydiK7f3d+/niKIkP
	DMDKUWrDRtYCNSF11XA1iEg6aOiQPSns9OnEQ5wGIiOvZ52CJ4zI1toGgjCQyXE/LiEWgSw0/ewjz
	Pr9qUqMO6PaNQqmdqjuA4O7n+Hs+3nhSFT538FScX6AOVutAF2pC1dVSJm9eUf9Kf3ZZmgDm+NN1I
	MsIT0JOK5bUjGxhvzNZr2o/WGNJ54Y7STmFaA3Ckm4hIeUUq4sG9sRDn363A/CK4dKHtX70GvSkIV
	MOBEsY/HFcVZZWc6jqTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm2A-0000000EcvT-3h2R;
	Thu, 14 Mar 2024 14:26:14 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm27-0000000EcuY-1Lxm
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 14:26:12 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6e622b46f45so851194b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 07:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710426370; x=1711031170; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iokJkQN+CYLbQlPf0rnQg68BHxPHeGrZwd8/xHt/yAA=;
        b=eAFJ48KrQs3jxYLaqCiJC9TnT6eCv81wDYn00LYZks1AcK16VF/N9BZQPO+E8nTuRq
         lvrRYlb4Cs8jH/Cvyuj44kazsv0OfjfU6Y+/0gHt3/H6vwkofJDd4KBIo0RFtF36lSIN
         8elIJYqJiIrc1mT0o3uxwCRPkJPdZNyUyg2tnm/NSnxTzhVt5iH7G14palPkDqmIYKh9
         Va0Fa/0xWvc+Z983N80QQQm/tklVOXZ6z5HIhA1xmdMxYCQnxzkylfHNYMQKbREt4SOK
         cPlTb6qRbJ28yoPAk+2IWER+IhakOKXoaAx5WohbnDzXvOpkb8zRzAB5JaAhUhbdL0lV
         4kPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710426370; x=1711031170;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iokJkQN+CYLbQlPf0rnQg68BHxPHeGrZwd8/xHt/yAA=;
        b=ImMl44bGh5yPQjxitB7S2abMGrHhnGvUFHCrN6DDYG+mZKinZOVz88uJHLJAqy7K79
         fpmFsfXurR2Mf+iEPjXBsP5MSNH0hmTy+nEECVwHPnS9ZEEssB5vP6A2gNFJTHrmN8Ug
         5uEj3JVq6eV4Lqxp7cMXsy0lhV0OSX0ZF7JSx4hcJ74r9cmSCVuf++j5wCKywjNttOj4
         Z1u+YxGgw6bV1zy1XxoErlnIZT6cHpEcA/YQTVBTb9BDHpZeVjugzyqGBmUWxxDY2t74
         Lktx5c2ewsAjP7g4caNjj/SYVMmhfeNSKbw9SYnRCre15tThVOMBSGKaM+egFbXje4vm
         0GvA==
X-Gm-Message-State: AOJu0Yy5ye8eErytCV/KmS7bjhWWQdTfyX1+w+6vMmovKpuwiW65zxaA
	Cg7veQpYeJaAtKIgYp5LyZy8SyhBoLrQoa8jEvFd9Qu/BRf5khsSbOn0eWPb0DcQ0E9DhYys6Ch
	1mlhPq46UIvgK/5eOh/rEtFlLhdnBzUfiImziErSe9CUH1V4ow43jZXC/EgsLuxpjpLs8uhrGw6
	Ufa9iFAiFfZml81xgcfzsANf9UaQSy9yYYoeQdmoxLD5nlSQXPGy2S
X-Google-Smtp-Source: AGHT+IGKwy5Ft0ZR9Ei3jcAi5BghXMatW97i8/AmBgmIYutHSPKmSiKOxNxEZjnx7g6RLMIEmSH0SQ==
X-Received: by 2002:a05:6a20:3541:b0:1a3:4671:2285 with SMTP id f1-20020a056a20354100b001a346712285mr166309pze.44.1710426369571;
        Thu, 14 Mar 2024 07:26:09 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y9-20020a62f249000000b006e6854d45afsm1556435pfl.97.2024.03.14.07.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 07:26:09 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [v2, 1/7] riscv: vector: add a comment when calling riscv_setup_vsize()
Date: Thu, 14 Mar 2024 22:25:36 +0800
Message-Id: <20240314142542.19957-2-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240314142542.19957-1-andy.chiu@sifive.com>
References: <20240314142542.19957-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_072611_394950_AFA31DA4 
X-CRM114-Status: GOOD (  10.39  )
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

The function would fail when it detects the calling hart's vlen doesn't
match the first one's. The boot hart is the first hart calling this
function during riscv_fill_hwcap, so it is impossible to fail here. Add
a comment about this behavior.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v2:
 - update the comment (Conor)
---
 arch/riscv/kernel/cpufeature.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 89920f84d0a3..36efc8e77ace 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -671,6 +671,10 @@ void __init riscv_fill_hwcap(void)
 	}
 
 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+		/*
+		 * This callsite can't fail here. It cannot fail when called on
+		 * the boot hart.
+		 */
 		riscv_v_setup_vsize();
 		/*
 		 * ISA string in device tree might have 'v' flag, but
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
