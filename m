Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E83C27C5F
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 22:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fv9eKxOZfbD87CdAi4OhoJnVWbHw5UCHCEwpwYvDE0s=; b=SDRMZsqQIUGiNS
	6MjE4BtDFPsU75ipwmU52DY9Z0FkPr/tf+SeO9xTqMVCQWFYycZ5OqAf/DVDMpWWaFFWRLMBACbbU
	vkXt7XhGPcHTthvn9FEwnxc9NOEANRH5bGvJkILQDaI+sgNZ9w2vwpFhwA13PJ2P9OONBDAxqjwaW
	2kX8q3tpxm7NumuYE9WqNO0MvuSSMK+M50JrQtPWXn0x0W0JiHzoTcwve5YmAzMCPsfhaaMxx0L+1
	Pc0z7Hi9E3ZdlBQh6b7ColuLx2nb8ikrYmlXf0Nfg9VoUMZmhz40olDzNShXJBmvXOQevY5g93K7Y
	ahR/s5rkfuzLzBy/wV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnws-00000006jgh-0hJ6;
	Mon, 10 Jun 2024 22:57:10 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnwi-00000006jXc-23L2
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 22:57:04 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-6818e31e5baso4172752a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 15:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718060218; x=1718665018; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P240Gh/m4dWtpIWWlN8DjDnG2wL4gQcnQEBhQHOtafc=;
        b=yWDLa4jxWfs7oYdCfdCo13rxguzKul4wZbkiY5xYXzFKUyhvIbOs+xDt6YpzoQnckc
         jst6mJ30Je1WlgPEXbYJbgzggHx8oe7WEFFPppWk1wFpN01o+VlCr+GQ9bqdcwrePtY6
         f0QiZvKbi2tKpmuX5gt5Y9Df0nPOx7U1Gva/ibRsVj/70ZQLK3VA0DW5ZbXMh7QXrjwz
         H4REDnNQh1vDy0QwEH8KKZnViX2NPmMi9s9kaZYuCZ36H8/b6puxa4deBVGFgsBKaQOc
         OF8gmjV8tMUx5Gc/Znhx4mYPkDP6VQDi6EKU7TzJYFetkxe2DO+jujsa20CU+03vEnTO
         60jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718060218; x=1718665018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P240Gh/m4dWtpIWWlN8DjDnG2wL4gQcnQEBhQHOtafc=;
        b=DaDEaoTCMJjuZz/4RGY9TuYpv465hlqrWlud/GpsJ5h9W9pbu2/lb1hlF+q+GyQ8aq
         qpIdwW5EVcZnOZ0hhCv8yGD8uMuY/kdt6xOOp62L3dHhbx7RBbUQUQ41pflAwjXTS1pj
         vJpq8KfFjnjqDYg5pYyuV/dQ6OhZ3NkyR0EHXzGGLdAKVaaq8U00SxJpadXRw6T+aZJl
         uasINeiwTVlsb2u6uevm2FfSiOSmtOdwazzlBZ21QtmqpJzdPgErt9i3Uuu7+EUiiWv2
         Ix0Z7SEjVtD68ioM/zBoL36ZVMPOQIdohtHI0na2BHccOdWObZxWzHQQI8lUIXoEB8OR
         pFlA==
X-Gm-Message-State: AOJu0YzmKBdqVOjRzGeyIefoq4nlnfBKz1Ncg/7JxN7m4riw/uzR7ItS
	1gzUaMnmFJ006YPewZYzy11iDzCHPguhRCUXoxRCUv/NzOhF7c1bRIxEFApCqssqzKpEYicVBTE
	N
X-Google-Smtp-Source: AGHT+IFseKGLwmj2osLDgxyS4P9gQTqGeoZhbSAjbr4fblHxFDjXaFSWzLh8Eh75n43SvPorzoMJnA==
X-Received: by 2002:a05:6a20:2d0e:b0:1b6:482e:b71a with SMTP id adf61e73a8af0-1b6482ff7bfmr6284268637.62.1718060218334;
        Mon, 10 Jun 2024 15:56:58 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71b597072sm18355865ad.99.2024.06.10.15.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:56:57 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 10 Jun 2024 15:56:43 -0700
Subject: [PATCH v2 06/13] RISC-V: define the elements of the VCSR vector
 CSR
MIME-Version: 1.0
Message-Id: <20240610-xtheadvector-v2-6-97a48613ad64@rivosinc.com>
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
In-Reply-To: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718060203; l=954;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=rl/YEju2Da4Y30TCSeGgcBJQ4jtog67tmUBEGN9KrFw=;
 b=IRhCPk4XbmkpRzK84lEWmQUutCnAIEIrCrTYoyF07vjrds3h/wdbdAbFu3f7IKtjrQbzVrH3b
 BQdDwVsjJq7D1QtIM9g/0505gvg5bTytwfowlYZHjPzLPpzNFKDydTs
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_155700_686077_2BFE4B5E 
X-CRM114-Status: UNSURE (   9.03  )
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

From: Heiko Stuebner <heiko@sntech.de>

The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].

Define constants for those to access the elements in a readable way.

Acked-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04..18e178d83401 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -216,6 +216,11 @@
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
 
+/* VCSR flags */
+#define VCSR_VXRM_MASK			3
+#define VCSR_VXRM_SHIFT			1
+#define VCSR_VXSAT_MASK			1
+
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
