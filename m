Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597E9C54E69
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vwLDjpTFA/lSnapVFTdvkXs//mdNfLcv3a68BukqLyo=; b=p61SUVOQzwpWBH
	0JppSqoo/THVskv89XSx0NwjEjPUEcTzzXvfgDsPc+a/W0YLri49g0HB7nitG3dd2HtLf1FXcoHhp
	9rzMuxnIzBrX0L7EYS1tNBiUS5FM3quXTzz6H5ixhwrxJVIJlR30I12AOconWlPBpg0byl4M1Njpo
	bJWMHmuaVxqwDmoHfu865+FSOVumXwRyHK7pusLkqubmm+Gc21KjaeM5cFvA02ZhLp5rK0yx5UbDD
	z8FC78MO4OO+uPOnRORQQ/g6i9/wXzHFpVgCfaubzbMLmlwsSQfRCdhpyhuDHQhD/X3oZHYCOPsK4
	siUeX3wFjD8x4SjJX3Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAPb-00000008AwQ-0M2q;
	Mon, 18 Mar 2024 10:40:11 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAPX-00000008Av4-1LmJ
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 10:40:09 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6e6bee809b8so3902306b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 03:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710758406; x=1711363206; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4G89K9j8VE3g8Gv9q5f0qrofTIdr8mBhI0SxEhSzJo=;
        b=HMcsjqKDSAOwtZHA/aEQ4asdH2AexjLuXCpQ9euqJWM6bltQNXF/RNm7t5g+1Uktkf
         UBofd/aWt9ryfGDh/sA4wFl80ghmMCxCXUUiNcykoJ+HRszfH7yM8ToXSjTwNe44mxV4
         yj5qWFFQwZ1ENKTNE7YSJ95G9RMXk/dkvsORMekN4iD7jC7aeLRDOP3FMyDmM64VJNxJ
         k1Psspah2ufQ1HXPBw8M8jA2asjZplPkULQccVbaWP5sI2GADKwtGZ0+G4h3bv96vKDM
         pcvYL4p+FkZCyBKUgDksLxjCA1yccmv08uzqrFpXfOI9OiQmcL4ogLTp5k190GOPk/bS
         0ywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710758406; x=1711363206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4G89K9j8VE3g8Gv9q5f0qrofTIdr8mBhI0SxEhSzJo=;
        b=WFWlb6geTn/QHX91txEkDqRmkHQStqMiFFT8yl3FT9kamC5tiZT+3Ctx+qgtwJbxA3
         l61OSzq3Zh8U0qRiPh/otJpVZam6SLGaPe2rlgvQGsvMlYvNQko+qLh4kmeZt7co/bCd
         Koa9vH9b2EfSw70FOYN/PBTZV/OKayufKBbG9DuEKPkwBtijxrYCycqpypuwOUS5CXVe
         jp/wCvDTV8f0I4W9S0MoM9l2NMKHXz9NN8iJLAaTsLyHlHRnk2ugn1HpnXDsGD+gi7NF
         5DEA+h+FjLRoga8AmQ+H9iXLoiBiHlZOFJ3bs736pZwg9cKU2sdD9lDguuFlP9LotwhU
         rmug==
X-Gm-Message-State: AOJu0YxO3bZxX/T3Z2tsFpuNzztb8R8LcT3qG+7JMvZfFteX5Qj6XPgE
	SzvV+PNNMjwwYbTZKqnVVa07ewKTmEfBsSHe5QPSDJRR9ZQioqEr4q8RFXjkRms=
X-Google-Smtp-Source: AGHT+IFqB79dONowSawpjuYLz5TiNWn3yO3qpKw7DuwQE8lzbZJr+AjO3CtY2R0Vak78UgOkSbTFhA==
X-Received: by 2002:a05:6a00:1813:b0:6e6:9c97:c712 with SMTP id y19-20020a056a00181300b006e69c97c712mr16121332pfa.22.1710758405008;
        Mon, 18 Mar 2024 03:40:05 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id c11-20020a056a00008b00b006e647716b6esm7838969pfj.149.2024.03.18.03.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:40:04 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 18 Mar 2024 18:39:54 +0800
Subject: [PATCH v3 1/7] riscv: vector: add a comment when calling
 riscv_setup_vsize()
MIME-Version: 1.0
Message-Id: <20240318-zve-detection-v3-1-e12d42107fa8@sifive.com>
References: <20240318-zve-detection-v3-0-e12d42107fa8@sifive.com>
In-Reply-To: <20240318-zve-detection-v3-0-e12d42107fa8@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andy Chiu <andy.chiu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, 
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_034007_424630_8C79CA28 
X-CRM114-Status: GOOD (  12.30  )
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
---
Changelog v2:
 - update the comment (Conor)
---
 arch/riscv/kernel/cpufeature.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index afeae3ff43dc..db9fb90cb272 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -658,6 +658,10 @@ void __init riscv_fill_hwcap(void)
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
2.44.0.rc2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
