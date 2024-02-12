Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F80C4829D
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 23:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YHs98TkCUJhCGkuMrWJCzGACI1XLcJYPAZO1i0ZDOL0=; b=XmbEU9jz9xlwvS
	vjKW0JIL1oTEmNcpNDA+IPeiQObsbdn8D/xTt2VbguHrO3gliVs8/w/F0JGe9TyV3uoOaevNGnUm2
	CTewwMUZh9TtyGvBa4fOQIJkNHdZNR7wFh6gbuDXNd/9931MUYJB6sxpfaIr2EN1789UhoIVuGiDa
	NqIOmsE80+LvBPkT+VTmNtwYYXGUtjAuMS/O6FQkJqh1w+ejl7tnAxL3NiJ0Q0U3vqZLgrQI3zaWf
	0LWRkfnZAbh+ZWz2mjECD9e+/HmucK73Ez20R83bsHoqwDv3WUgpUjZ1GjtFCltRaB493BMzADkHk
	OcqeI2m5M8sh33uEXteQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZfqm-00000007IYZ-3csP;
	Mon, 12 Feb 2024 23:36:36 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZfqj-00000007IVk-0ssD
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 23:36:35 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d932f6ccfaso25855875ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 15:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707780992; x=1708385792; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Olje9xypbAZ3WrcqD8VBFVJOFseKRGh8fXym/RnF5g8=;
        b=JGZfXw55kE2giJ0UjkzUVNcGuYyvjzoDDklsy4tHFDGn1jLsbtW4sl8CTPcbg8gaCl
         onFhKpMnYS9TtnzrM6shduymAmb0crVUPVngXXWVtIEK6BAS7UgLVdlR/Zm9oQYRRd/1
         +04fyCjZMf+t4SAJMaCVNZ/tI4Ow0F2J4l77rXK+diyViFYuCH0DUa0iA/YilAJmhV/j
         Trp6fvXf85IyHPvrFRSnCSkP4ykCYyStQta7g3wRKfrBuPpWEQUH5tuI+IdxfYNOF4qO
         2n0hmK080KKOvISMP3Xx6FYihPRgvKJxGogJBG8ZGyoBkc3WHlLT1bivqHtrTgIOXPMV
         hQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707780992; x=1708385792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Olje9xypbAZ3WrcqD8VBFVJOFseKRGh8fXym/RnF5g8=;
        b=vW+NnjljgAkEYK4eE+mjwuGQFGWrZsYAoxVv6OYkQ+Z4TBsoMb0grAxCdnZ/pWllak
         AOfeqKM2oez9Ylb/smaGC0h/wEuE9fhWaN+4HOo0C8LhkIQjHuimqi5Fyw/Db6dWaKOL
         mzL0JRMThtmh7uSaVhdd02ypcIt3JxLlEJuRHIFMuhwApbA/jSuED+sFXoxF4uGbLEMy
         dKYb2btDzi7arCkZ/Kv7GcRH134uIQBdZK8kmE9eZET6BcggpeUXd11/DKcI/s9yPH4J
         uzRBwFB1TVNDA9fbjcDAv8QvVht7ROhrb2hu2TNqQuWjoXJq660P83ses7zSWeO6bCAu
         VDAA==
X-Gm-Message-State: AOJu0YxFi1xLicXKxcfoSAlVhap0LqpSLJEDrwlN2JZBLrki3b6+Kie9
	UjisWKe0TjvfRvqOPI2DdO7JT7G0zaYJr9rSI3jHvGMdlhI1v56uJl2Cku7RvN0=
X-Google-Smtp-Source: AGHT+IGOdL3DrCigpJSkV5Hyr5gHXGMCKTbmU/aGTha2J+6odxlz/IBG86EKAkZRn2/3Gp0s/00GPw==
X-Received: by 2002:a17:903:110f:b0:1d8:a93f:a5b2 with SMTP id n15-20020a170903110f00b001d8a93fa5b2mr8982004plh.12.1707780992600;
        Mon, 12 Feb 2024 15:36:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9IHTBBsAU+LBcf9fWTCl49GRnlyxiyibnmfNmj/O7/h+tbt6+9IJmYjNakft2CXqPJE2jvAw7F08375+jC2mD8UEKwPVTypk5fDmJjKI4eySgbBuL41RNQiPmVh/G39Mt/x9gU7kceMUF8weph87jKzxgRSZYh2uoc0/jU3QHfpFOt++Vig/JOI89YyFKpz9KzEiw5gqb52lYt9ZyFN1i9QwIao8p3HsGo7mlb0dGMvYrmwUGIh7WwIBRywBXQ81Dsu7c6/iZGoPu/ACXbxByF8/LQ5BzCqKpUcLiixH9vZw4FNFoWJ0s74FhJty9ej228GQJZAzOn8FA1/UJvVNtlr65vPY33AkHuEDcnKBD5Ygcf073mQheXvc3jmkAooEpSecmNLA=
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902650500b001da153682c5sm888693plk.261.2024.02.12.15.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 15:36:32 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 12 Feb 2024 15:36:26 -0800
Subject: [PATCH v11 1/4] riscv: Remove unnecessary irqflags processor.h
 include
MIME-Version: 1.0
Message-Id: <20240212-fencei-v11-1-e1327f25fe10@rivosinc.com>
References: <20240212-fencei-v11-0-e1327f25fe10@rivosinc.com>
In-Reply-To: <20240212-fencei-v11-0-e1327f25fe10@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707780989; l=639;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=23qauOezLdGd/qvi+eoGfAUmo21GdLnF/O1XuhUSBhA=;
 b=3fk1hPn8uk0LHRB8yl3Y0RYndhVQhDbBlNi5Ce1BSrXXKhsMTW4JUlwl8LFpuZbLYzru9RLEH
 y8tsCF/wTQcAF+CZe6nMI0QqK6iZZlmz8RM55ve7LYSJeVzXo12jwfv
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_153633_379441_90A4015E 
X-CRM114-Status: UNSURE (   8.80  )
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

This include is not used. Remove it to avoid a circular dependency in
the next patch in the series.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/irqflags.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
index 08d4d6a5b7e9..6fd8cbfcfcc7 100644
--- a/arch/riscv/include/asm/irqflags.h
+++ b/arch/riscv/include/asm/irqflags.h
@@ -7,7 +7,6 @@
 #ifndef _ASM_RISCV_IRQFLAGS_H
 #define _ASM_RISCV_IRQFLAGS_H
 
-#include <asm/processor.h>
 #include <asm/csr.h>
 
 /* read interrupt enabled status */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
