Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1357C83F1B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 12:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1asM7dIcpCqN+1dZhawtIu63nhzUTpzppKmQsUYB8R8=; b=eqTBvfNoHiKz5Z
	gV7qxUu6ZRveZyORyi2i6mh3by/eol2W1A2SHOl29m3QqwgDaEjg/2XFMExCoWVn1kcvBJ8Jx5Sl4
	ZgTGywKLzQ3kiklduRGMpiUHmeqviGGtWjVzFVDdNlgyJUyjgEtaoG1FsKW8BwdxdM8z7QnQbZBkN
	F45LeMWsxZ6denJwuHy9EO+4Hy5WZ/Abz5jJgonlDbBbBLT9Px8ofHucl+zDvNrNnuDkDfb/M4VQF
	xSNUBdn7uQbY+Vj8wUA/Q1zNTMkeJsgw889kXo00SLxsvXz37RD4nBWmRaPOCRgK7NEaIEt8JME5W
	YY+PAvRR0oW3qB0I+AuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0wl-00000007dHg-3cg8;
	Wed, 16 Jul 2025 12:09:15 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0tS-00000007d0j-1iuL
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 12:05:51 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-74b27c1481bso4153677b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 05:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752667549; x=1753272349; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mv1g9KTy4MBNS32Uw6S8h2XR0Uo4HzG8ylTUFdR6He8=;
        b=JWfzRE1OUhzlILqG0ltN+PVSsqZ2HlMi0/9LVk3ME0QFS+UtsaLw0Noo9dxtfDPzVD
         ZapwQyVVCxnDQDKn3WSMWU6B0dBAIo7Vm9reS0MACkO5PUrL0uyghaz7ND2rweMcB+vY
         DyXPpAI7ofcWuqH4ivUC/OHCiRHR/ZWyWTc2eoj3u9D1uBj5JrtctyN69srzQyju9YDk
         93G8w7DYwZMxQ1FQEPBfkp7GmSktoF0bc5Gc7KYmE/bJ6e5yboMLyPQeiHYbq2B6VhU0
         jiZp/1rZAeNc5PIiGikPw2ontMVEJg5+O1zkikY7Dx9RCHGMDEB57dHlWJHVIUNKhT/8
         z5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752667549; x=1753272349;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mv1g9KTy4MBNS32Uw6S8h2XR0Uo4HzG8ylTUFdR6He8=;
        b=dFNnknvlvNQsQIj3NiP+9P0WyVVLl31MiWnVCQLEgTiel1VslelCFok8wMSUV9u+Q1
         bBRwZ86oIqYYBprt2Q8FGVr7zkOExnHHcL+14HhiQJdBqTFtyNT27vnBbo4wuRK7gcN4
         cpZSgsgPqSvXjUyFXVktgt5oh+GUQBCmAVsoYqveFWMZymRKHhOgGIc6OBXqB6WfpJM9
         dHW2l5fUFHYvHQF9oCb6hYw5ZIo30+NNNVtjhpaeioGWaJipWUQDyFjnmBuj1P4ux/Im
         Sm0fzSvk0O+jbwXuf/VsgVSLTQEVk2ISdPkfOBq8RyFBKSI2O+RFgOtKMASJ5jU34nzh
         DZHQ==
X-Gm-Message-State: AOJu0YxtS3rZlu82SHlI1AhBsV2q2skr0N5n+LL+XrtrUGqZjUr4gQlI
	/UeYMOqJafJd56y6WTkPHXmouh88NHhahdU8948+9w42cXd144d8cvc6w0sZeEuzip0=
X-Gm-Gg: ASbGncs09v+SlbzKWKyQ5GfRqMvwGZ3WJqdYHruyMzykRt7ZBbNKsJv6TbxzkbpQuxG
	nLays8PDUkRwQhqMyHsRemObJ63rxeT3g38Bh7nfW6Gyeteop2R9YryPe6dKg4GgDquG8allu/D
	MJ8RzIQb7+HYswE9VLeWbCP1X34bonLlp5HUvfW7MeTNIKOmxjQGubiQaTh8kJg45OxQgwMbfhg
	G1wDussFMUrzfB9O90FRNaL6IqoGeDf3bKyMvcdwX4OOxLkCBj4JE2W7m3yNc0nPT9mkIZaSCVJ
	HGfh9acQEGrm7N7MLkEy/6JXzvhSwVs5opHlFWGXICOWRJdXppWGNTN2R+/pUPDfwFk8WmRlE5d
	tzOjGn4CwhCl1XwiGwA2JuckJcUJ+UN+8hyve2t/c0+qHOjt4buG8kTcQrCWfqpg+5zANjyl5oe
	IqsDxX
X-Google-Smtp-Source: AGHT+IFHR63eCjaXHy6ZUAG7RHZy+oj/uFE7LzrrP+Ag+oxEgYcVF+c+wEYZkXLgOiJuODKL1x5tiQ==
X-Received: by 2002:a17:90b:3942:b0:30e:5c7f:5d26 with SMTP id 98e67ed59e1d1-31c9e77a443mr4186090a91.24.1752667548984;
        Wed, 16 Jul 2025 05:05:48 -0700 (PDT)
Received: from alexghiti.eu.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f287bcasm1303067a91.32.2025.07.16.05.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 05:05:48 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 16 Jul 2025 12:05:16 +0000
Subject: [PATCH] riscv: Stop supporting static ftrace
MIME-Version: 1.0
Message-Id: <20250716-dev-alex-static_ftrace-v1-1-ba5d2b6fc9c0@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAHuVd2gC/x3MQQqAIBBA0avErBtQo5SuEhGmYw1EhUoE0d2Tl
 m/x/wOJIlOCvnog0sWJj71A1hW41e4LIftiUEK1QssOPV1oN7oxZZvZTSFH6wiNUUF407R6DlD
 iM1Lg+x8P4/t+m+Ih7WgAAAA=
X-Change-ID: 20250716-dev-alex-static_ftrace-882f0d8357bf
To: Steven Rostedt <rostedt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andy Chiu <andybnac@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 chenmiao <chenmiao.ku@gmail.com>, kernel test robot <lkp@intel.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1957;
 i=alexghiti@rivosinc.com; h=from:subject:message-id;
 bh=mqWEUluC/ejSKjmWKztJJt6Jp0vNzXefaNC/LDpRSPw=;
 b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDLKp06Ycu9B3QqrZapv5BXnnrRpj+Fa7dN1YPMy1eMn7
 1V0h+lf7ShlYRDjYJAVU2RRME/oarE/Wz/7z6X3MHNYmUCGMHBxCsBEXhoy/PeeqV3/ZabxRtOK
 j7/qXt8/0+b3LVOj9dTzdrbZ7n7bZSMZGRbVVpfsuuMsaVistW1DNl9mpFKOW9HGgKpiPW+H780
 r2AA=
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp;
 fpr=DC049C97114ED82152FE79A783E4BA75438E93E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_050550_563762_864A64A3 
X-CRM114-Status: UNSURE (   9.17  )
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

Now that DYNAMIC_FTRACE was introduced, there is no need to support
static ftrace as it is way less performant. This simplifies the code and
prevents build failures as reported by kernel test robot when
!DYNAMIC_FTRACE.

Also make sure that FUNCTION_TRACER can only be selected if
DYNAMIC_FTRACE is supported (we have a dependency on the toolchain).

Co-developed-by: chenmiao <chenmiao.ku@gmail.com>
Signed-off-by: chenmiao <chenmiao.ku@gmail.com>
Fixes: b2137c3b6d7a ("riscv: ftrace: prepare ftrace for atomic code patching")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506191949.o3SMu8Zn-lkp@intel.com/
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d71ea0f4466fc3eefd1bd89f37637193d9a464da..1c5544401530fed9ecade4dd11c1c33a0bd6a2da 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -98,6 +98,7 @@ config RISCV
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
+	select DYNAMIC_FTRACE if FUNCTION_TRACER
 	select EDAC_SUPPORT
 	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)
 	select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY if DYNAMIC_FTRACE
@@ -162,7 +163,7 @@ config RISCV
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_GRAPH_TRACER if HAVE_DYNAMIC_FTRACE_WITH_ARGS
 	select HAVE_FUNCTION_GRAPH_FREGS
-	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
+	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && HAVE_DYNAMIC_FTRACE
 	select HAVE_EBPF_JIT if MMU
 	select HAVE_GUP_FAST if MMU
 	select HAVE_FUNCTION_ARG_ACCESS_API

---
base-commit: 5bd6225da2e2d8bbf2b6713fde42159f85ad3fdb
change-id: 20250716-dev-alex-static_ftrace-882f0d8357bf

Best regards,
-- 
Alexandre Ghiti <alexghiti@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
