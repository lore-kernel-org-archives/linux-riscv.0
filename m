Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C44F4BB9A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 10:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEncy+DMhUg2YHTHzb7liJxdWmRWv0H1p782LuZy9og=; b=LQk5MS78BDxQM7
	2pqIDAqfSxfhYmKM+yEDu7e59Rl/tDeKyQ3qH/aCzsPLf0GkWt/4ha51I10AdWQqLrrmKrU3+YtXI
	aJ+c/JHGWfZ/3UawfRbJHeJ1vL3Pq5VKXCqVepZvXCtSaiwigBq+dKY1uR36MnR17lKNP27npTX5I
	ENC+6SYhdyHd+tobUdq2O4vpqQC+X52UTUlFmq+X86pPJiPhbKBKFCjGlYVRXfm8PUTbXV9PEPtVY
	xsjlRoXiQn0VW1AMVaKGRV3+Eopj5TeoH4qGnoNOuaKO5WJcDcqQVP5c/g0ywbGiWTbf56W88D3KD
	qaNBzEYqPSdfZuAI/NqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCKP-00000003oyr-3KfE;
	Wed, 25 Feb 2026 10:41:13 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCKN-00000003oxe-1vtb
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 10:41:12 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a7d98c1879so41955475ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 02:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772016070; x=1772620870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5JusZ8CeTeNO4qDCoYo5++ntNew4s+UIqyoBHnZ8bM=;
        b=PUzzUKZd5y8Uo58hIYyZniSjk/Y3+XhlNt/pPlvN0FUOsh0E75gL91CFoamziAeY67
         DoNmSrIQXjWb7Qmw52wWDWQ0Obeg2agweT7JK5HIDxjnle40PO6Wqt+0WZ2fluTtDiwu
         d3Ma7d7CNE7dvHhXeEvS7WdEuOBhemSZkZKepgQ21gPyJcwumvPWn8EKXvWlz8kkSZkp
         5LmVE/QkbkDYtSX5Z3rNf/kxGyfkRrJrM2LpOlPY2MLYOo/D3MRnC1gRUaTBIDz5xdkM
         JJlLqKGtEtcdLSX4m6vSRvs+GiRLUcbjSVNFPM2rkmCMhXImQQEyYEbzApBAWQDcSvEY
         qn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772016070; x=1772620870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y5JusZ8CeTeNO4qDCoYo5++ntNew4s+UIqyoBHnZ8bM=;
        b=nYA1yvwQnXuLuHURK+RRrMOtZK56LOWjrAro5ghHej3sZC48/iAP9nW9vKoBT+LGHu
         2DjGnuKIMACf1i1gka6LW6q3NaCH33ID8DvCNyeE/1SA4eB+HWQ7Nn+epESrgHzj5nHd
         CGlhi1PvLlEVCLQWO4uN2qkpfFz/qqBHpTd/U3aVWgHZGci/sTfj75o4UOyaZ0ru3K1G
         Z0om9ljA2OlpjVeTnOdDSnx40HmgLetWHjOgfso5NvT960LZZamp+F6/M7mtoxBIop8j
         fKKi+9vCnJR+PEixVdN/WAdN4mTIUm9v8lCnhkat5OSIyJTOr3n+j2iaszd/lXGoUQ0T
         808A==
X-Forwarded-Encrypted: i=1; AJvYcCVL4rv0WrqvDriwqiE856XLd6ne5eWPTtPu3I4KmtQz1AZlrUBplRrf6jrtTr/NLQOVuvcj3dhnIUvp7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzBhUuzo88GSJPaOaWKF8PiiZQYgFE219qpgPYp35Yq431KJDg
	RrzPL/S7f2fJnana62WBlq6vE6dscad5kRPDKrIIVQmtwQ24s+tBEN+p
X-Gm-Gg: ATEYQzxl6CgzxCWuYTo/P2en9HHUYtZ+MCIao8JANc9pCMBPPWz6KRPRpNq0f32Cp9T
	5WTQaM4iPlOAAQXUyuuHvL0fnX0eBS+o3os7Dcfz104blisKv6peTU2pm+Ki6YaZhSogdJoLSbK
	hoba6Z8m+nfheBH2XHXEo0BqqXXKpg9YqZCMZCKQ5TXOjfysCoTH0ft1pkkONplIJaIWM/2iFJt
	aF6DKrE41sDYrdjMdWJ6vMZaza/jxFHYwf5O4JWsLY3TMdRgE4TRfH6KDN1KjrY+8EHguAukwuh
	mridoomQfUb5lj8Cxai4iBM4rfmGAYkArV9hyVpZw/Mol7n10vrnCIjTmEoj1PEoDK7tV0/G0U8
	P00FAwKCcAOdn8jl7riZ4MBKYyMe+xWePO05ElHYxKidp1ir+0D1ne71x+tKNpUKWaqfUqQjX5F
	AoiK07pMaiNkWvQBjGe6RuV/2vpEaf6FSk
X-Received: by 2002:a17:902:e787:b0:29e:9407:a8cb with SMTP id d9443c01a7336-2ad74548a87mr147819225ad.40.1772016070549;
        Wed, 25 Feb 2026 02:41:10 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adb1bd6b05sm41625085ad.79.2026.02.25.02.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:41:10 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Ze Huang <huangze@whut.edu.cn>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
Date: Wed, 25 Feb 2026 18:40:39 +0800
Message-ID: <20260225104042.1138901-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225104042.1138901-1-inochiama@gmail.com>
References: <20260225104042.1138901-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_024111_509760_227A9086 
X-CRM114-Status: UNSURE (   9.22  )
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

The DMA controller on CV1800B needs to use the DMA phandle args
as the channel number instead of hardware handshake number, so
add a new compatible for the DMA controller on CV1800B.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 216cda21c538..96b0233d9b1b 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - snps,axi-dma-1.01a
           - intel,kmb-axi-dma
+          - sophgo,cv1800b-axi-dma
           - starfive,jh7110-axi-dma
           - starfive,jh8100-axi-dma
       - items:
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
