Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05124C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 18:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H9SzdVE/1xHVkCHMvxgMlXHITm8XHTWEagPd3uGnqlY=; b=YEE/5qlcOTKoTx
	+a3Frjb14Hxd5B4VKASxUl1LoZXdwgxXuF3nLC5DkLuU9aW1mQ3oy0twYvpZxaYzzfsr4m8WrmdEM
	RMQEIzuBY3QtpETIa3mpflY3KuWzOPv9x7x2pZg8KK206/VlOO41/RXFI1glk+5B4jeNE1QIvzGa9
	7hQr/K+nGV2LQtU4bYbjsijqtTkvtMo4dj3n8cKisTuS3//ig84yK2bLnhnX2yaOMyVOXL/V3z6xH
	9dNijtYEvfx8vONXnrxPYxadu09cGD+Ue9D046Lavd/+BNK4Fv8Pi6GenSqQFy/riIZYzpXbj+opc
	vtBuzmAbOZjaML3ehZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAyOK-003xh6-GR; Mon, 11 Jul 2022 18:44:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAyOB-003xc7-W9
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 18:44:19 +0000
Received: by mail-wr1-x435.google.com with SMTP id d16so8139250wrv.10
        for <linux-riscv@lists.infradead.org>; Mon, 11 Jul 2022 11:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V2JL5BeTsm1LVU5sfoBIObfRgPh6LElCg+G5xm4swvo=;
        b=H0r3Hxp2neTDv5jPln/vTpOMlYqL6h/423r3IpRFomDRFVkT+5eMLk9RHOKG1n2NHh
         n23b0BXFwzHNaAr/yy3KGnEWhtevU42TfeXI/1MalTCyz7xTQ0DE9+nimMV+v+Q5wdDm
         Kt0DC6Ng+8+c/9wH9JqSYjETUO6ZbSeUpiIFk3pBHRiMoF82muWlxGs/4Tc3jILmjNUZ
         I4jB1JqUP1wvZuMG8sA9zOSCJgVCYlhhwDwU+WWfuIIvgGLPs8O58NLgjI77PbOpxJY4
         tFML/qQM775/o5yBW9O5qhLhq3IsWJfTDzpvC8qJbSngIzi0CZEYxtjmKuaoDskJ1b1h
         IR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V2JL5BeTsm1LVU5sfoBIObfRgPh6LElCg+G5xm4swvo=;
        b=bsz+XyXiRgr0DwTJRarglx+kN0L/vYuRGToqI+ctCNGQ6gjVErk7Mrqik79PNhXiRY
         u6P9/zlmtwHJlR6UBvgAccGg8ml335Ju/ZzE7OyN6ljQeycpWEZeyj53QERP4zRR34X3
         KGEpfkt40x6BpneHmrsccrcJiptUYxqWr6/Y57/Rcme2KMFYxR1CzyVb6gwlkcborj82
         4ZiVd/GrYBM1TjP41SiLafJQZuHTG+/rgBkuTTzYHhA01m66ZBb9v4rYpmLkM5udzf8w
         DpJWl3or0QB8G6oo4Laocw7Y1UP6Io1yyXjQK340s+SwvI35NOVv+1CSfD1cJPkIQeum
         rQcA==
X-Gm-Message-State: AJIora/xi/v+vDB7O2eL5D+68qHbNX39HuRu5lVpykQc7IYwbOqkJWcN
	O7oyK5KQ8sD9jXPWxIHB5oRppQ==
X-Google-Smtp-Source: AGRyM1uuUcWNsE8syVVPrFhzpMcpyLLcS0n5o2c6m4kE2QklAam0XRkF04EnT7f7dj1PLfBVVaxsmA==
X-Received: by 2002:a5d:5a1a:0:b0:21d:68ce:bc88 with SMTP id bq26-20020a5d5a1a000000b0021d68cebc88mr17745842wrb.527.1657565049608;
        Mon, 11 Jul 2022 11:44:09 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c410900b003a02cbf862esm7330892wmi.13.2022.07.11.11.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 11:44:09 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: riscv: document the sifive e24
Date: Mon, 11 Jul 2022 19:43:25 +0100
Message-Id: <20220711184325.1367393-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220711184325.1367393-1-mail@conchuod.ie>
References: <20220711184325.1367393-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_114412_076380_F089008D 
X-CRM114-Status: UNSURE (   9.30  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The SiFive E24 is a 32 bit monitor core present on the JH7100.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d632ac76532e..195e762094a8 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -29,6 +29,7 @@ properties:
           - enum:
               - sifive,rocket0
               - sifive,bullet0
+              - sifive,e24
               - sifive,e5
               - sifive,e7
               - sifive,e71
@@ -75,6 +76,7 @@ properties:
       lowercase to simplify parsing.
     $ref: "/schemas/types.yaml#/definitions/string"
     enum:
+      - rv32imafc
       - rv64imac
       - rv64imafdc
 
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
