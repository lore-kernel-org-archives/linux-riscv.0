Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF8EC4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 04:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SO/hA/JkxpX3mapIsl0+IJsv6E6VcXo/j4pzi50X3Hs=; b=QoHSVzOkzHCeEw
	Kk7xHZWJFbb9urlOhCBqdHxKksBg+VWKAZVkjtw2AQa5BoXrR59CTKSbkGK9m8W6tH0rJUa7GdJxm
	u9FjXWfwKppkHC9BkFhF6F08PqIdlGFJY8Ql7otFoUwLQNjMrhp+QC8i9gOb5KCEdTE3oKzumbOoX
	ibjdY5kLf5V19aABoiXEwNYmGTN88+whR+KNjaiHdKs5//8ttMKCqsSLPzyP83oqRj1Irb0GH1YS6
	Hlbjg46MyMTB0fFPZzERzhTsOHovJ4mdZZyMQ5xhGTDiTxUNbw0mdTwKxhxs/TRKsAV1BM8YHL/Wv
	0fZ1ruokWI+TybocAQOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kqn-0000000F36t-0Q40;
	Fri, 03 May 2024 04:48:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kpR-0000000F1uQ-1iue
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 May 2024 04:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=X3SjbYRlfVLcKXzSMNjYRrKo8hPdxAu3bA3GNGrI0mQ=; b=EEwcpyNPHFfvu0lDWtUbtY3x6P
	613M2G6zupZCDTOiy/V4cgnA1skefO+HIoXEiyW5Ov7HkJ/SvgmAeh051mdy96WkzU8PatpFzt0yO
	m93VpsvBS9az3jylBAjCMrkWNiv/THe5TPl+1rFEXi1O1fHulDGIqBq2uRdpsvNZQrNpFmzZEkwZF
	ZRo/MjlVHxwoCpRpjAiIr8nnCtG6DobjzxbS8szuuyT2G9nMt3o7OVRWSTum4PA7my0q6plILG6l9
	tTwHH2mOOanFZL4KpONb2onQf3T6MBxxeB+BNSw7IigZ67X3HFOAUYD0YgtR+pBOXfDOcjs5KNyfy
	ZBeW1ABw==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kpK-00000000Q4c-03AF
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 04:47:20 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1e651a9f3ffso47147755ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 21:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711636; x=1715316436; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3SjbYRlfVLcKXzSMNjYRrKo8hPdxAu3bA3GNGrI0mQ=;
        b=x/16RH2rUubzVe+z0CB2eE09WLiBEIuuu6lNTvZMki032ej4BsliZ4glspxWFBwUHb
         vB2QiMIHfStprO37C2Vdz6wrb/DTNRb+QPrdZZlLIUnRTUUvWOGO8K7x04WCl4I3/q0X
         YxONqMxY+YKXMq/TK8qU5C1Y/iJMJINqXitplq2f5EpX+BcXzzx0TpJrYdRxBVMW7uHa
         zCljQMp5IH+tNkSTPqHiFDY50TTZGuWJV18VEN7qKceNgkL9iVmVqIOatZLrLTLtbHR6
         kTTKAQ3/RLdHYmzJa3DmfIl/EzRmaFRy5ogTnIthew/9ohMIRc3vGWs+r8274fRsSGe5
         EC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711636; x=1715316436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3SjbYRlfVLcKXzSMNjYRrKo8hPdxAu3bA3GNGrI0mQ=;
        b=RGFIjqwyldkjooMelpE1ntLceKxtVUzd8MYHy/igSt56rY3V/LwC0xVhJGH8kEwpER
         F3N5XDkb8/2t/yrEL6V0rgzP4D9DmDWx7jStc4ffnQl50x/WEct7ZhEkD60C2wjmk1vX
         UxGRi8W0OTYiqtoG9HlYLm6i7qPUxVSQLELqXEnr9WTw6iDJyzl1KAROBRHxrdjB8rOP
         LX0Mm31txEE2KN5Capv0qGxTo8yRxJ9EazuqBieLzLPA0DuXhs9WNqfmvBuRnFSadVWs
         1yJHNkxd04z0UONwibS+Xo0z1Oj362JpJt+J1s3EhUXcc9MEZIdn4joIF2DeXBGMaNbJ
         t6VA==
X-Gm-Message-State: AOJu0YyQQW7da1bvR3//Zd0VBYJBUa73wvkKgbOQ5E4TiqxFDEW/7MNG
	loWYpgnR4VCSLiNaNs/Fu1FXfNVdxJvGLym3JIwMunLXpePkYrS9QDY/0H85pJA=
X-Google-Smtp-Source: AGHT+IGM/dp68WsaICJolpFnJ7rVWv8zpuJnZkNE7iR04J0tEr/yBdhTSU5oueJaXbYqQhfKWlcWFA==
X-Received: by 2002:a17:902:d484:b0:1e7:d482:9e09 with SMTP id c4-20020a170902d48400b001e7d4829e09mr2156048plg.7.1714711636126;
        Thu, 02 May 2024 21:47:16 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:47:15 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:50 -0700
Subject: [PATCH v5 15/17] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
MIME-Version: 1.0
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-15-d1b5c013a966@rivosinc.com>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=1205;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=VVos6nAzmHOy7EOA1ppaqJ4Dx+U57WxCTD6XuCvS0Gs=;
 b=6na65VRDMTnnCy/+6CqiPA9pKtnlM1Q98D2vcAEWM2LB61+5gCXnut4ekMn7J31diUbqo7FHE
 zcnD9r7WgrtBVI5ezwnTpIeMoEFwFXIDsE30Dn+rGlOO0XYaU2+kgye
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_054718_249238_3DCF316F 
X-CRM114-Status: UNSURE (   9.23  )
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

Document support for thead vendor extensions using the key
RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 and xtheadvector extension using
the key RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..b2bb305140aa 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -210,3 +210,13 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing the
+  thead vendor extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * T-HEAD
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
+        extension is supported in the T-Head ISA extensions spec starting from
+	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
