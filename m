Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F213C7113C
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 13:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GN/ad2wGUJRE2QGKEUjQSIiMQdXJn0ApCpzzVM2h9qs=; b=bBuc25KmfzfZMY
	sg3G6I++2Z4Ih67jNLlKVgZUB5ir+rEIkizsMbB0dOOZAV6rzl44hlixqLmm6iH0OiyASz1lfiHA4
	dCWQOHe9fP382oUOvp9XqaIG12/JXfDEUx7kxKkLoIYPvPJKz3qD3dlwyxVq0DNI7YmTS9zoIV1gN
	ZSuESGCxxeX63GVL9ualdYRS1bTSOe5BAAiEbK1W03QfV8dZbRIjeNIf6heFhwGzP3uR68brmJp0L
	E71Rh/m69sM3Ph/eMsiUZ5RIQYmv8HTaAwUl+ZbUoMSTmm7p3bjPb7/VUJTfI6jHqc67mDeRN/AsD
	QrkESVhh+rH84/FM3ymA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWzz0-009REM-0E;
	Fri, 18 Aug 2023 13:57:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWzyv-009RAM-1B
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 13:57:43 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fedba79923so712635e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 18 Aug 2023 06:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692367057; x=1692971857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZWgrNspKoB0gULl9FriOTlRKkFCV7w76E4xQuu9Nl0=;
        b=KexVFDCysQJSKwqA2PHchcATu/fVdyN5dzj+MnC9lvuupAvcgUaERaEYU8fXez0XgX
         i43PyJBskBi//E9RB/S6PXpqLnh7lVciHUBjCJrYluBxaugnWRttJsl65oP7BNNKMu+c
         Jo24rl1VRSKWTnOfSNsHzTvaK81unipTMIddNapREu5xSZvMKQsgqda/UV4fJ5eU+FTL
         nunF8fYQsfMs04sEcizsvSn8l33AIieOkPvSKY/WC80+MPb9Q/o9joZ4/hnHvkDL1ExZ
         dASoED2bMcJ5sIRWxELsXgJFK9N9IuhLSu+NhvNxLgGLKjXkZicQt2ladZ9gwnTmZ6Hn
         JJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692367057; x=1692971857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZWgrNspKoB0gULl9FriOTlRKkFCV7w76E4xQuu9Nl0=;
        b=Eot1xiAiKe68tvUx3p/RK9RSobT3/+XUOC8nLYLQ6Jc0nu5kZ+W10fx5uxfdkEBOcP
         bJ9jXHjrY+VPZDj1DNY4nwhVOQKNHr846tGIRdyWo9ZRHH/J8eZQOWSw90O9q9yMhoQh
         7C5Y90KkrBGWbRPB9NdLix9NuMBHEHHTERWWPq5O6sJlN9+ZzZqkc4mDAEd3YBBJxm05
         3oaT0FSERPdTCCbLXoNfjbRwM7zHFDnxIxlRJzBuwyi4TMSxdkEql+cKLUYzj6oEDlEZ
         rLXCpSJNQmzFy5mpCBS8tNfXEJL1yTp+YMIFDp93NqLwrSm+KF8ztszv0TR5cEp8wmi3
         DRow==
X-Gm-Message-State: AOJu0YwPvZipHfhTlOPJ3QvFKFu2WsXkDCKhrJfVUBwx/avuOtygk6wd
	ClrG/oXjQXEFNmavJRkPI68=
X-Google-Smtp-Source: AGHT+IGfQ7eoFxZQPgul7H6egLkGZJmIPP+0IzqWmxmsHEkAGop6rTnMrsK2OAKWZEjHE+l7fbJF1w==
X-Received: by 2002:a7b:c4ce:0:b0:3fa:99d6:47a4 with SMTP id g14-20020a7bc4ce000000b003fa99d647a4mr2214398wmk.22.1692367057449;
        Fri, 18 Aug 2023 06:57:37 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:4b30:13e8:1d57:42fb])
        by smtp.gmail.com with ESMTPSA id s14-20020a05600c044e00b003fa96fe2bd9sm6444055wmb.22.2023.08.18.06.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 06:57:36 -0700 (PDT)
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
	Christoph Hellwig <hch@infradead.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v12 1/6] riscv: asm: vendorid_list: Add Andes Technology to the vendors list
Date: Fri, 18 Aug 2023 14:57:18 +0100
Message-Id: <20230818135723.80612-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818135723.80612-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230818135723.80612-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_065741_455933_D9C3707E 
X-CRM114-Status: UNSURE (   9.45  )
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
v11 -> v12
* No change

v10 -> v11
* No change

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
