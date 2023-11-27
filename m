Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1B8C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 07:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9q4FvDMZujw8xdOjcDBYhc8/giaAx5Zx7v5xGqPGnw=; b=hqNZ2daUJ/ueWA
	RrUPP5Hyg0KOD11wXROAjzfGmjqyeDM/3FezHjy2BVT03r+9Jp6vJca57AM+q9JGAPOtzGYmJ94Af
	6RKpD9CGp9PqmMunYA9sWAH+EUVfO6DoJOllWMmwnVmDky8UYrk1nSZEKbUwZj42EDF2vRkzW6/Cg
	aeh9SPoRq5R5D0XhOEaNeqDqCQ9deK2gyhaHdDU0XR00TAwntdelYIY9zMSvTUmkps+W08ZIiVO1C
	zut/52jteLnkWci2RQPQYWCBG4Cb3gd1WVSOa+gkg81hgHhOnsmLsUFHLkYZI53mdaDp2S/6GN2QD
	NrZS4Tew5e8GAbG7QHeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ViD-001eoX-2d;
	Mon, 27 Nov 2023 07:07:21 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ViA-001emt-0m
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 07:07:19 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5bd099e3d3cso2118548a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 23:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701068836; x=1701673636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AQWefridDFzEX+S3QZsEdRxceu5Syx5iK5d77pjmdM=;
        b=DotzDew3xops7RqyEvYcxSQCkauAyrCsL/JpAHRlw1x/QSsqVPuoDVn6+zE980XtfD
         C+WJKSRkGhXN/VSYUusRdrhIgisyjCLDzsANd+jP52LKp6nNq6aqhK9YpYw0sE6m4nkQ
         gCCTRd2WA432hRCNKeCTy/3o8g+cpQ7OtN8acJWRVTR3YHp5Idw0OhET88OG38aToTOF
         w5TXC4McxiqNKSV6rxNf45CsZ5uLrIP9J8QjBzeMPUcjdRuJ35H3IL5sZfBjdg1Z6ejD
         2JJeoOP+lR1Ac7mcGyAkJR0tULV4XSPpTK7Nuq5NPCXi2/zSLR/JRPfETt1TlWqgysRd
         Wp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701068836; x=1701673636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AQWefridDFzEX+S3QZsEdRxceu5Syx5iK5d77pjmdM=;
        b=im6i79FKFZA43zFrj0MqyOpgu4HTrr9qi5HpFJd9YYzlFo8VDQdQkSKKl8sYBgjIk6
         ctlfsZysLiOZbwynbo1BtviK3ab74Eb3l4cei+uUP+vrCcyXXR3iqfLTo8wWyCB2C5J3
         rylKFXcDnVNvI+s7bzdnZPx6jizswqnr2yt460FtFJDsW75jFfgrchHSfGS3S3Bq6WyO
         I0qXSs0VSL5LedKgKDSyu53Or+Z/jnEuTFdRjQRtuYZkGs0l+5Yx7O/ZE+V46LBDYgld
         63Ev9+2Y5s8Iy508EKvao0zJZIqeVCW6ferfrEymA4uLccI87o7lLv2d8vaZYjIkpbYW
         09yg==
X-Gm-Message-State: AOJu0Yz90LkSxc9qTPwMXW7PWWPhhyxioQ7j/L3tZvWD5w2fF7JgW7sG
	m7KD2vH76g/SkGE35P2B8kKI+A==
X-Google-Smtp-Source: AGHT+IEfgbssJ61TZlq0d2dhxDtdtwhMhkAYzY1cvNJK6+MKTZHhqLX3gJHGHb4gNjKA9hC/r5Pzfg==
X-Received: by 2002:a05:6a20:d48e:b0:187:3b1f:219c with SMTP id im14-20020a056a20d48e00b001873b1f219cmr12639143pzb.10.1701068836407;
        Sun, 26 Nov 2023 23:07:16 -0800 (PST)
Received: from localhost.localdomain ([101.10.45.230])
        by smtp.gmail.com with ESMTPSA id jh15-20020a170903328f00b001cfcd3a764esm1340134plb.77.2023.11.26.23.07.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Nov 2023 23:07:16 -0800 (PST)
From: Jerry Shih <jerry.shih@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	conor.dooley@microchip.com,
	ebiggers@kernel.org,
	ardb@kernel.org
Cc: heiko@sntech.de,
	phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: [PATCH v2 01/13] RISC-V: add helper function to read the vector VLEN
Date: Mon, 27 Nov 2023 15:06:51 +0800
Message-Id: <20231127070703.1697-2-jerry.shih@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20231127070703.1697-1-jerry.shih@sifive.com>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_230718_289032_CC995074 
X-CRM114-Status: GOOD (  11.47  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

VLEN describes the length of each vector register and some instructions
need specific minimal VLENs to work correctly.

The vector code already includes a variable riscv_v_vsize that contains
the value of "32 vector registers with vlenb length" that gets filled
during boot. vlenb is the value contained in the CSR_VLENB register and
the value represents "VLEN / 8".

So add riscv_vector_vlen() to return the actual VLEN value for in-kernel
users when they need to check the available VLEN.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
---
 arch/riscv/include/asm/vector.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 9fb2dea66abd..1fd3e5510b64 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -244,4 +244,15 @@ void kernel_vector_allow_preemption(void);
 #define kernel_vector_allow_preemption()	do {} while (0)
 #endif
 
+/*
+ * Return the implementation's vlen value.
+ *
+ * riscv_v_vsize contains the value of "32 vector registers with vlenb length"
+ * so rebuild the vlen value in bits from it.
+ */
+static inline int riscv_vector_vlen(void)
+{
+	return riscv_v_vsize / 32 * 8;
+}
+
 #endif /* ! __ASM_RISCV_VECTOR_H */
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
