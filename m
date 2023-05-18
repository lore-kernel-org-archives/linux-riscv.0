Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B9CC77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 16:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cWE0WNTDcIJGT/EIxnpE8HahZhonS2BjUM7ROH4ynOU=; b=JyKzA5aH0MFLP8
	P6PK1sRqUCN6s9SIIDSXOdhbh2h6cx3cLnnqcpfNYWcQXcgqFQQdsQHqX0mqzMHlOiIw0drdvk2zW
	AxKZP2QqBh/9Ob/sx/h2dY6qr3Ge6oppoYE5DMHHAqA1b8NKUkTq26ORXJN6v73VtEosuOwqQbXiu
	gfvl6/bMz05Eod+YRw20eh2IwrUvBhWYh8GTDWNL0onW2+xpurab3pSdnMW+ZJX2taSoJg0oqESe7
	9XdkpTmt4j/v+4+1Vmd3SAiCESQkPoIZKsOq0sGT8kTaCqFDRL7b2ETmbDRaE+u9CsYcpzUv+mbEC
	KiKsoTc3wd9RZRzAZgkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgg6-00DV2y-2U;
	Thu, 18 May 2023 16:40:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgg5-00DV1c-1m
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 May 2023 16:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=d1t0mcJTBhtsZBYqWTjUk/5U+5ffoYMHXYjoCjqrD1Y=; b=K/OWGA4BgcuSB4qiyu1jF6LuOl
	A+wFcZ9e9vafe90+DwsDNkHuoqHSbVWs8yECfmA6CxHx/7v40WtOJr2kE9GTMFXvbqM09IfRceurY
	L7f9X5Z0Hq8uXSiQYPAoJRL+6OBz3g+8ztne1BmcogRVB9uS0njMxAlT0i78vaNQKXoYvDVz67IhE
	JpK8NS7szROwWStYhLqU1W4DTtpNxcjXgacB8Wl05nYId1dXRFTdBoyoOkNVWVACKV5wmDlsCklfu
	euT1N9kKdAtfrkq1yPrRg0TXfW6JwFWL75rjZrIw4H1N4g+MuyQaGDTpjfsgc8o/oDIpWCG9OGe57
	0/Wb/inA==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgMm-00ErJB-18
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:20:38 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64d2a889722so266547b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426834; x=1687018834;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d1t0mcJTBhtsZBYqWTjUk/5U+5ffoYMHXYjoCjqrD1Y=;
        b=j/lNhEwTb7JEJPIuoeqzcOoNlaE9EqVE/MZI6+2DWzQNO6XCErcOE2TDOSR7eIsYwX
         nuo+9r/OqRnGOX5t07Sxq0Q8Vzs4aWyTIxF+ZXQYje5CTeltNr00p47KJsH1aSEVqs2U
         brOJOywB1UfvF7mHrkMp+tc5M1tR5tMy/k0eV1Td+kCt7ThlX/IFBLXM8A1YMn2ZovuO
         dWuUezKtPO4fvLtFmXbmPhIW2DheeIb2VUF4qT0ApoFG36ruAHlBM4fQBy12OVhR+o5w
         E4pw3Sr507bSIqgvvz/+/0ft9ai4MCLwdiyFsKlcD6a1nD0wITeZxQDUSUzetmMfeTVo
         QaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426834; x=1687018834;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d1t0mcJTBhtsZBYqWTjUk/5U+5ffoYMHXYjoCjqrD1Y=;
        b=ljkI5TrdFdu7SQ5zolUbpTD264IkPCEN/vF4K4NXE8D0RTVIx9rnfYyghhzvVx88sF
         y0n6niGwDtTJ6TFZzT2aUR22pycQs9yo8HiGwzxWuc2KCIjbwHfzzeE862A+JPt4Q2iN
         vqzu9C/fBqqWTQAwjucD4Gt0+uydQC5ceMxEshEEAB2Epr1ubEQE/RzQs9x+1dGL49dL
         MHI+lSca2x83jYo/SuLh0sKKbXywqcnqEpX5HdrZ2RUBrbXboqLjh3Fysbr7Gavd7w6B
         imDJrjl74L24ZCPVTtyhGXVEm6wyw6lShEifnKSJv/m9sBRPXSdgzl39lvJ1c0wci+xf
         zBuw==
X-Gm-Message-State: AC+VfDwLWe2J0iCZMMQhDo8ICzjttaPYDEAjKK9bUSp/ulsp5MZrwBdn
	dFU/psSmGZgVD9ji7gil/5vq77gYjUHNWSkraKz9DpJr4ZATMQCrPboz1n6w/RGam6nTpGXz7O3
	g6bprFT84Pljq1O87Tadspy+1oyAwGC7d+OI3NY/YFY4rPSrsO5jW2NbaW3ujJ1hdJSVQTZsvoQ
	1e/SygAmpkSSB2BeY=
X-Google-Smtp-Source: ACHHUZ5PIN2Byi+riolmbgeoMB+vCD0zudt7ZJVUoMZ3UWR2Wl5reYAaZjZzQ8xTchHoGIInJ8gAzA==
X-Received: by 2002:a05:6a21:3701:b0:100:cb5f:5b91 with SMTP id yl1-20020a056a21370100b00100cb5f5b91mr196914pzb.25.1684426833823;
        Thu, 18 May 2023 09:20:33 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:20:33 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH -next v20 04/26] riscv: Add new csr defines related to vector extension
Date: Thu, 18 May 2023 16:19:27 +0000
Message-Id: <20230518161949.11203-5-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_172036_440387_83D7CE36 
X-CRM114-Status: UNSURE (   8.39  )
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

Follow the riscv vector spec to add new csr numbers.

Acked-by: Guo Ren <guoren@kernel.org>
Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/csr.h | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index b6acb7ed115f..b98b3b6c9da2 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -24,16 +24,24 @@
 #define SR_FS_CLEAN	_AC(0x00004000, UL)
 #define SR_FS_DIRTY	_AC(0x00006000, UL)
 
+#define SR_VS		_AC(0x00000600, UL) /* Vector Status */
+#define SR_VS_OFF	_AC(0x00000000, UL)
+#define SR_VS_INITIAL	_AC(0x00000200, UL)
+#define SR_VS_CLEAN	_AC(0x00000400, UL)
+#define SR_VS_DIRTY	_AC(0x00000600, UL)
+
 #define SR_XS		_AC(0x00018000, UL) /* Extension Status */
 #define SR_XS_OFF	_AC(0x00000000, UL)
 #define SR_XS_INITIAL	_AC(0x00008000, UL)
 #define SR_XS_CLEAN	_AC(0x00010000, UL)
 #define SR_XS_DIRTY	_AC(0x00018000, UL)
 
+#define SR_FS_VS	(SR_FS | SR_VS) /* Vector and Floating-Point Unit */
+
 #ifndef CONFIG_64BIT
-#define SR_SD		_AC(0x80000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x80000000, UL) /* FS/VS/XS dirty */
 #else
-#define SR_SD		_AC(0x8000000000000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x8000000000000000, UL) /* FS/VS/XS dirty */
 #endif
 
 #ifdef CONFIG_64BIT
@@ -375,6 +383,12 @@
 #define CSR_MVIPH		0x319
 #define CSR_MIPH		0x354
 
+#define CSR_VSTART		0x8
+#define CSR_VCSR		0xf
+#define CSR_VL			0xc20
+#define CSR_VTYPE		0xc21
+#define CSR_VLENB		0xc22
+
 #ifdef CONFIG_RISCV_M_MODE
 # define CSR_STATUS	CSR_MSTATUS
 # define CSR_IE		CSR_MIE
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
