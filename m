Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AB8C25B6B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 18:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9q4FvDMZujw8xdOjcDBYhc8/giaAx5Zx7v5xGqPGnw=; b=0BwbAOd/2nKGbG
	eUU6qUNbpC4Wm0WTi8cVa8nm+DwlwIccBTHOiYhesq+6bWkSVV+VAjyqQn/E69u9pU4jDl48A06J4
	sSXaWvyxS1b7rwKWqPVEkal5AqlgE60is9As3A/iQV68oDvALT4C5mfr9+fyZbcD7TJdnekjVz1ra
	FWH9yu2K8GWIGI2hJFhLkrpUEDx9r0e8mXswExqAu4nP9VSUV2mSIcweouy6+YqEsMG0uJIkFOn+6
	ymITJLpNKNekP4yxBt/TzyDLczB3IslUIbiHn7wWqFzoLUJzEbYn9+Edh5c79HT82xvC9f/KIFtXx
	APp8LxkkzqLkKlB6EMwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvikb-00CsDd-05;
	Wed, 25 Oct 2023 18:37:05 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvikY-00CsCE-1I
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 18:37:03 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5859d13f73dso82163a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 11:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698259019; x=1698863819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AQWefridDFzEX+S3QZsEdRxceu5Syx5iK5d77pjmdM=;
        b=UWXbTLVmRRNl608IcHdj26Yrn1lTsPCsND5QNGAGPo8q9TsdluRVm+P0/MIeIQ/P+c
         gYv/Zwefi41phy8tG2bpSnz3iuhrflTIlfAXbfhyPRBOUf0TmiraYUqivQCZT/iuXO8y
         jM43+Q2rbDw1Xkns68Et/iaU/YsJobG3/BcWzoosO+QcNYNGkoEmL9ZsgaAF/rn28C+L
         +wVFLpwLz+oU+BgkKv8nbyXrjVP8hMcPmGqDc8Owqb5q4bdlrrhgflkzWNQfIVWofMqg
         KYRp3tvazPtLv2gOhmm3Rpv58EVz/AKCDrTleArt3BmsMMwqH98TeYZFjxSQBCdjjoWF
         kydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698259019; x=1698863819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AQWefridDFzEX+S3QZsEdRxceu5Syx5iK5d77pjmdM=;
        b=F7riucYjxvUCDWROzQ3Y7eoLVuuofpFkko3k5/a5T11/Cr2h2mqjAB4zMYbBjDjXDK
         LPYIlcWBfmo/Y9SvaogMcY8HTq7+le50h7Oo+/W6Dk8Cg/rLtnsuLbNnoovbmFCXarkZ
         4us96LF8Yu/1vludn4Js6rFQw/+4HEwNrdsOLwfaiVA51X8pIVAE6Of9qO3/a9PLLgXy
         6TzdWSLso1CaTjkOwwPSLEtwY4hd428DQbdL8ET/BPau96CYARUqvmJbxBWZ7sVr+4EV
         7f+RkCxAukbzKe1p0hAJFOuT1+lYAi02KGFdrt9nCSTzuAplzhyC5FSiHOYmqqzMHxUQ
         qsbg==
X-Gm-Message-State: AOJu0Yw/Vta8dYOu9Fu49lUKCnbOw7M4agDo6UQnl7pA8GX55J6j3QlZ
	TRiTT7p2oD23bcOQPw871YZ2hA==
X-Google-Smtp-Source: AGHT+IFi/NboaaxSjvkdMStkpkrWMbnIqk4WWFJWYRx8koDO2Zab0WQxKwEoeYJQcTe6ecrly6nnFw==
X-Received: by 2002:a17:90a:17c5:b0:27d:2100:b57c with SMTP id q63-20020a17090a17c500b0027d2100b57cmr14411038pja.37.1698259019481;
        Wed, 25 Oct 2023 11:36:59 -0700 (PDT)
Received: from localhost.localdomain ([49.216.222.119])
        by smtp.gmail.com with ESMTPSA id g3-20020a17090adb0300b00278f1512dd9sm212367pjv.32.2023.10.25.11.36.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Oct 2023 11:36:59 -0700 (PDT)
From: Jerry Shih <jerry.shih@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net
Cc: andy.chiu@sifive.com,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	guoren@kernel.org,
	bjorn@rivosinc.com,
	heiko@sntech.de,
	ebiggers@kernel.org,
	ardb@kernel.org,
	phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: [PATCH 01/12] RISC-V: add helper function to read the vector VLEN
Date: Thu, 26 Oct 2023 02:36:33 +0800
Message-Id: <20231025183644.8735-2-jerry.shih@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20231025183644.8735-1-jerry.shih@sifive.com>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_113702_439592_FB5ECC55 
X-CRM114-Status: GOOD (  11.85  )
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
