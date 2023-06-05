Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F37AC7EE24
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4k3nCaEbxEK6Q97cKvkDXNBXRksU/riV0XuPNkPtg/Q=; b=eImf+16li0ok06
	gW7cKFI7qR6QUIekWmRc3++KHH2fHWeOzuCOw2Mmpl7Sfp9eXVeaNJ3myKrXXzuiPQ7F5UHfpT/CG
	k9PRjJ7U6vFjJJyzdos7fc1Hle6cQ7OmeilVaS1opq62mbFQE8E7GMy4gt4nQAFNbs5hdz/ri4LBC
	/9yt1lMPB49TTpHl/SvyQ6Z49qbZuJnz1XgA88X7c9LDnh0VKd9U+NNXZBuEJcg36Wveyv33T+jcK
	HSHYIxLtahUTst6ZVVrOKFCU3qTLDyvwHVTt/+IdYwrul+MzymIo4OKpmbxQKIgmVzOv1WGYEnXRE
	5rLL0stQT7YPpJgFIHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CJh-00FyuZ-2x;
	Mon, 05 Jun 2023 15:40:21 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CJf-00Fyrl-1i
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:40:21 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-65314ee05c6so2079691b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685979617; x=1688571617;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EvrLPd1cTqQ0pEVjiT8YUKSvx/1xPgu8clZhUQSofCQ=;
        b=GLGpLSOO2XQGnAjD+WTSHwZSoz7d6GqWYDdRRuaFM0fOXgUKJjD/vDh+BPvkA/RgyU
         685CXX6eIHuTbnIUzRxlQybayn8cRJM2+Xz+RvF9qfWKesDHBItFu9Z29l1Jp9/sEwIK
         NDZR5kWj6facZIXcTG8CaaattaKnUv9kDlSTnQ21Bd7TBZqx4z/9xRNAw1/CRtiX9SqL
         UUfDoiu02MWoCs+dBtUtAIobuD5akmfGI9NXiQfMwO9XmZ0qH1X80TlyAGpBLfHZQrBN
         no+/MLmmn3PKtBmXm1fF/hw1H6IzIJriTRSqWrbgGHnNtULrHKYTZE6x1zccrxa0RPGI
         FPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979617; x=1688571617;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EvrLPd1cTqQ0pEVjiT8YUKSvx/1xPgu8clZhUQSofCQ=;
        b=fLshY7JxQKT+qrWFFHajwTbkPWtLYhHHmyFUkQFcjxI6jOLkDlMAHMbM8X5VryV7iU
         LarOIQAzJV4KVX9P0RJZOa0FoMRA6ntzZDp4RfpXzzmKtlRqaiGdw3HURWFglOcy3TYh
         WCEPqVAd9habFEnjYDfZi1ROqsuSWUK/xb+9WIkrS0suPSXGzZUqkty8f15uLe7jEez4
         Ma+GekpsObfb3Fb/yxLKxZTAku+yPyBivKlBHJnUiI7hUTuuZV1yy2vJVmtl1F9BD9Mw
         fhe5zw3iIrUYzsz1u//bp5U8qSTieoz+RaBBuBJxucj8od8cBj/EVsxeyoWk0/i6BVQq
         fAkw==
X-Gm-Message-State: AC+VfDwc1AMJnYseRBMDxwPZIIBrugNw1+ft6nPndRXCwAlVOAJnGrKm
	JUGj8cjSwKDm0GHD/dtQDkoVEGDoqlIu/3yVENgbkQcnzgZ7Bh7sqluOSbTy3lT78xlAobOM+Hj
	TKvYnVzyWB83ASXo6uBxwtajfRnIQ8/MjAKP88MyCW3TPa0BpcnaiI9XCnBpIcaeLBp1gGW//y+
	jHvQu9y0GmRHxyy/0=
X-Google-Smtp-Source: ACHHUZ4UH3+nQ7w0dxAK1qHTv+AY0CqemgAzfxycKSq/ENc3IsLO/TPxD8RwA0uyPe86zzm/LsZEXQ==
X-Received: by 2002:a17:902:ea0a:b0:1b0:66b6:6ae5 with SMTP id s10-20020a170902ea0a00b001b066b66ae5mr4752327plg.61.1685979617657;
        Mon, 05 Jun 2023 08:40:17 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm6725962plb.256.2023.06.05.08.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:40:17 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next v21 07/27] riscv: Introduce Vector enable/disable helpers
Date: Mon,  5 Jun 2023 11:07:04 +0000
Message-Id: <20230605110724.21391-8-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_084019_568340_C6B15FDF 
X-CRM114-Status: UNSURE (   6.65  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

These are small and likely to be frequently called so implement as
inline routines (vs. function call).

Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/vector.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index bdbb05b70151..51bb37232943 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -11,12 +11,23 @@
 #ifdef CONFIG_RISCV_ISA_V
 
 #include <asm/hwcap.h>
+#include <asm/csr.h>
 
 static __always_inline bool has_vector(void)
 {
 	return riscv_has_extension_unlikely(RISCV_ISA_EXT_v);
 }
 
+static __always_inline void riscv_v_enable(void)
+{
+	csr_set(CSR_SSTATUS, SR_VS);
+}
+
+static __always_inline void riscv_v_disable(void)
+{
+	csr_clear(CSR_SSTATUS, SR_VS);
+}
+
 #else /* ! CONFIG_RISCV_ISA_V  */
 
 static __always_inline bool has_vector(void) { return false; }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
