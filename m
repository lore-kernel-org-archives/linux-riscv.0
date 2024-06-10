Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A12AC27C5F
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 04:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqa29ioM35s+IodLVgQOJA4vH7uxNMbOF41cX06Jpkg=; b=xkjysYnMSnTFjq
	otFPrPPyfF5hSx/QqGW6r6r27f26zWVDIOXhTKb7ommNvSvmJpsbDRsp6tqbKtW3Eet7dLjjuqZo9
	quo+yMUSUQYWJ7mingYefb/GBmMDNNIpk6hCTCUgL24KlW7PdAfZ6OwQKkA4VtISZrquKnXZVh//J
	eQFC+z7Ho0RKewaUMD3mggdtjbnl1wrCvYPM2hoKl0jS8Rb/IBnZnaNWUzvvH6Zr6vKJSjKdQZ729
	8CLST31C7zAfhL9N+S/UerUazvEUd/7XDnZG2ZQmRaRUhixRMCZw2zBE8ByxyPU8KrHCBW1l+D1JS
	oAfftwydR7AEW9PHQkIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWuw-00000003mfo-2SV3;
	Mon, 10 Jun 2024 04:46:02 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWum-00000003mVT-1Qql
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 04:45:55 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-6e41550ae5bso1544159a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jun 2024 21:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994750; x=1718599550; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HBSOfNpcERRo+IfFfSUzbZmQ8OANKCSab29OA8NgQg=;
        b=EOAt8ZSuwHTDhk0FGPPSVoY8BQUEncGvUoOy9JW0XQqUohZkdRs8Z4x9A+XFtG4ZwE
         h2dQgtrZeBlglrpEo/oeNcpRSYotWS4tW+/UhG1uMmK3ceL6jwT4QwBD85+Dnkmr5K3G
         z29lsiLBimBlXfFD+2+R8tXC8NyfiOxVK89GcljLPeG530Suzx0IwprQO2ey167P3o6O
         lAVAcwLIn+8eE5oc7P5cODBdywK+JGP0oAECcnyBcrKAoVisCdWwtufjJuAGN0bUcbC9
         vipYZaaRrgciNGHDCdK9Bp/VRIeSBgDqcrFOynZMyvb0Tj+PeSb3I/rHwxqRGgjl/2Ov
         ptNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994750; x=1718599550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HBSOfNpcERRo+IfFfSUzbZmQ8OANKCSab29OA8NgQg=;
        b=oZHDQ72/MTH0DWb/1DfEpm3Y03CEz4ZbHJQo0ytZgrs1cFn13wJG1I9q/WZUajdYtj
         pOaPxv53oPJqoAEnKPebMUYs/fSn9JrxQ213f+aFqNMW/+OOn+or5fLKuTAHLRselrRX
         xhUybHqwV/QbRcNNxcAc+j2sZZmsv82xqrJnX9T9hKJ8VKXvxIxY4XZuHOr1N8HhZDLA
         +YG1sgG0YWOh+QK3C6rGLq5uuUEtGSy23h+eA1XzT2+0nJkpiaG5+BgBqpla0m7nD4TH
         Behr0r7IwVPv87N8v3z3cq46K3sbmOOh63nul3MykvkulkM7SzfXGKxYnd7OedeRPj2r
         EUOw==
X-Gm-Message-State: AOJu0YwSxjfgiV09C6v+15hJfsfEuv+ojrj4BUta5L0OY/mQZblN9GWQ
	4kwz7YMErEGtgHcVeKmDzGNzv/ZW7WLAaJItCrnBwDi/Q3N4Agz4pn8zDh4vhAw=
X-Google-Smtp-Source: AGHT+IFokGlovp2IkNoCK67wcj7YPJ3AH98Sp2QxsCqsaBawuDAm3x3I7E9iE5QWcbZgk110G1+MgQ==
X-Received: by 2002:a17:902:d4c3:b0:1f6:326b:cde0 with SMTP id d9443c01a7336-1f6d02f98ebmr107670705ad.31.1717994749999;
        Sun, 09 Jun 2024 21:45:49 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ce8asm73124095ad.77.2024.06.09.21.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:45:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 09 Jun 2024 21:45:12 -0700
Subject: [PATCH 07/13] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
MIME-Version: 1.0
Message-Id: <20240609-xtheadvector-v1-7-3fe591d7f109@rivosinc.com>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
In-Reply-To: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994732; l=706;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=YRbwjAEMooOC1Wqfne0YGBAOlvdWm2exzND7IqGSDDM=;
 b=99wn/niA0cQScW2RZHdAYs/G3d+6fucqbAlEziDCOsNFlslIJ1kTJdSJRonbVlLwckEyjZYSv
 oLpqsYahmVoCslt9Y6Si3QOPyFQR5kdwcQuHfdy3fJPz51XrWIzyAzd
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_214552_646489_DCA67EE5 
X-CRM114-Status: UNSURE (   8.69  )
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

The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
has an encoding of 0x9.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 18e178d83401..9086639a3dde 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -220,6 +220,8 @@
 #define VCSR_VXRM_MASK			3
 #define VCSR_VXRM_SHIFT			1
 #define VCSR_VXSAT_MASK			1
+#define VCSR_VXSAT			0x9
+#define VCSR_VXRM			0xa
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
