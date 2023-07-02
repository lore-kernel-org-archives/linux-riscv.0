Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F46EEB64D9
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 20:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ELCjQAw3qaunfEzEhfJA/8DwURWZPDwgtMn6a1xuDLw=; b=CyyzMftog7+STF
	zC22qSyEjyuUY8ZLI9eJm/Crx0KZlLosVYLumosrH87RZWZAGfY/31tyKE21/NXeUbHoNu9P9uRdH
	8pgs1T7BKi/mXisH/7ceUUkBZgbklYCG2Lmtu7hFMvWQ8IT/mmuat+s4gA6xUYXX4n6E4a6P44tVc
	YMbt5L9pqgS8XdFCPTJ4R/5Sg1xL3hJxMEsKr0iEO8vNDD3Bgs14MI/5yvhZm6dFhnJc8keJmgnTm
	55x/qE+PdQhOGGoGznutXMBDwrwhA2TVuVA+eSfMkBFVKC9sBQJUOCTmPelg/EJvEzD6a02J4ZHhl
	mp+WmLMoW4mU/8huEjAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG3ma-008bEe-1G;
	Sun, 02 Jul 2023 20:34:56 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qG3mV-008bAj-25
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jul 2023 20:34:54 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-314172bb818so4355361f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 02 Jul 2023 13:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688330090; x=1690922090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ID8kESIcXo+JBd9ohyZe9IZLbyTyjD8SbfRbMI5qFEo=;
        b=BAuhXWyxUV9jb2UkRQTf9DPJNkmILjxCO5NWyiVZ/O2FX1ngphoU4v2czSJDx8AItf
         lvxD8Lxu1jXc22ZXwp5l8kNG9BwtcfNp0yltgOOqN7jdtr0PNWgFiCsbCt3zl+jjnqdf
         Tx4BxoJM357CkqkNVVkHnv/04rd2KR41O2XYeJwJRzs/KrSyqiNCBaA/ayPqzHRPYsPG
         dG/v8xp2+K9hQGRuw3+5hXcZFm66D368KDRr6KVqwDy990c8d0HwleuPNP04BtzfGmna
         ZaWZCg8Bp3ZTCVq23Z6WvP2z9DbpSb4nJO+QmnbYP2mEa4UvckUsRIP4bljz2xOoQhjD
         wXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688330090; x=1690922090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ID8kESIcXo+JBd9ohyZe9IZLbyTyjD8SbfRbMI5qFEo=;
        b=N95NWNCzmbVXYMo3EHSDje0rlIQb/aiTxATmfIFa+87Gy1qKrmQFGRDGF6eIdM0wSK
         Guh6uMFL08ILPb6mrnSmA6UQStGVb7LqSFZ1zpX9Gaz3H6GQPJ7ZRVgxQBANxkfUPPPz
         Jfk3G6MeYSSZuvZm75O/ohHZxbx58OqrB/BWCKqmfXZTt70y2QpfdFgJEh9TvGIu8zRf
         fQxJqYH+3XzCU8yx4E1k/Q4z7PHentRXYMv/oCQKKmhOhCfOvUMBhgtlWxluM3xUD5WB
         rKoZ8z5POhuHmW+AdjbT/pXISMud+o0AjdCXE+ZUW9AoO4rsVxQvw2+36kNhTdlz6EA5
         JQsg==
X-Gm-Message-State: ABy/qLalwpVAu0wDioMngd1e/8VZjzA7wUr9v5UBel3Hm+x1ml9S/U6E
	ICfmxdYGxfhZJAj8VEmFMdo=
X-Google-Smtp-Source: APBJJlF/U8GeITsUI1y3/TsqaILmZuxoWDfflBDvjfxNDCBS2XuisYyt26PsVfIBN97jJ0wEbKaJhg==
X-Received: by 2002:adf:fc08:0:b0:314:824:378c with SMTP id i8-20020adffc08000000b003140824378cmr6798565wrr.20.1688330089839;
        Sun, 02 Jul 2023 13:34:49 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:b4ae:ae48:2e1b:1dcd])
        by smtp.gmail.com with ESMTPSA id f1-20020a5d5681000000b0030647449730sm24000478wrv.74.2023.07.02.13.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 13:34:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v10 1/6] riscv: asm: vendorid_list: Add Andes Technology to the vendors list
Date: Sun,  2 Jul 2023 21:34:24 +0100
Message-Id: <20230702203429.237615-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230702203429.237615-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230702203429.237615-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_133451_692929_8922BE81 
X-CRM114-Status: UNSURE (   9.98  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add Andes Technology to the vendors list.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Conor Dooley <conor.dooley@microchip.com> # tyre-kicking on a d1
---
v9 -> v10
* Included TB tag from Conor

v8 -> v9
* Included RB tag from Geert

v7 -> v8
* No change

v6 -> v7
* No change

v5 -> v6
* No change

v4 -> v5
* Included RB tags

RFC v3 -> v4
* New patch
---
 arch/riscv/include/asm/vendorid_list.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index cb89af3f0704..e55407ace0c3 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -5,6 +5,7 @@
 #ifndef ASM_VENDOR_LIST_H
 #define ASM_VENDOR_LIST_H
 
+#define ANDESTECH_VENDOR_ID	0x31e
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
