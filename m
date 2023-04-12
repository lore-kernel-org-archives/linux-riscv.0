Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D38DC77B72
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 11:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8hvZiH4D7/ZZ9XYJnQ/G6uNwzkuzFu8k+YM8mqfGq0=; b=TTNABe2wVkQ/Gm
	aOqDwy4oPlTvn6sxa0266frT4ETmR0d4ZdUsmDFA0zSCM1E3eKjPOJtKCNUHCWv7GWcSAWqeSBedL
	Kthm8I7o9OgDqiADSnRJH0sCuc+WQh0m2ZwzJ12SbIgy1BUzbzC7VLHTqLZ8iBDg0tmUknYIst6ov
	a2Tv4pNh9o8A7bAJJm3EOOVW+uaMLnGPdPSqqVMoOUTvxOXyyEbRWEVbBHqu6G48f7UjhT50gqFYB
	HVF3U0L/8UWdkt1lJ4iTRzJ459aZ1c0IPunPDPhr2XCSMPC+/SFYVog1MSUTJ//ofM8zL7OjuDReU
	7oI1vVKIkFnWRvj0eFlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYM1-002kSi-0q;
	Wed, 12 Apr 2023 11:09:33 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYLw-002kPg-0Y
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 11:09:29 +0000
Received: by mail-wr1-x433.google.com with SMTP id s12so2008235wrb.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Apr 2023 04:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681297766; x=1683889766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pD04tvq+M9m50iyP6xVhtqLbPbgsKDIvDjFswr8cjxc=;
        b=mmmmbdiYt67XYwHB4JJGDHgGj/0WqOUnZKlnLbxhhm9g922yNLznh/ubB9I6GbwgJP
         ssMgUgKNOUSdjFM71EEAotwNazn9gsaAxYt6KahL8nUFsm21Oujq029r2WVYk/BFEyb5
         usQAUlQ6F9/JhCZ0gVGlMEEs8MPP6OrkI8GwgqtgEAEf/Csy9vtVyoVZ8/35NbwxGakr
         +Dh2X3DhyKHR+KzuHOB//COuoDGVKLxUHac7yNsRJkGTZDov5CZA63VPgsN3IB2mdwZa
         MSZNpNNqfColZwj1k1nvyU+dq+kuZrc/YSY7ZM3XlZNHAUg4wG4WQhBPKxb3jiVSjZuF
         WEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681297766; x=1683889766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pD04tvq+M9m50iyP6xVhtqLbPbgsKDIvDjFswr8cjxc=;
        b=RV0ShjNZQLAphVjIvLrhSIuN9IkHFZKa9Fd74sMuzHPTuVuHH+AA8MI4YpRoE7bGIG
         gIR8T/wy4UHLeh0YjTcWbQcjLErfsziR6k/spdU7iNXnLGYaTphLJzzG0ArQL0HTUPHm
         Orljmhup8sVXLUBUWwoO2awbbJhRGY1qXV11jwCiqgIhyg7IqP2GzR9I8ExzVmGuxe/W
         BOpjRJIY94E7KNk+BBh/fYhuIPQYDESAvzsbtv77+sOrg++JHI9i0gzDCZgLjoSnPyfD
         FBxMTl+SuTwZ/IccryfJTKxkwEhSIKSNDTS7F5dOo/K4crM1pT1x1gUUNvB/ZiCsSXfX
         DNYQ==
X-Gm-Message-State: AAQBX9cejne6oGcoLBuH+cviDXNjwkmOiYh50XePdbAaPbUo+p2EOPAe
	f9TOHSsPd0dQ8bUlr+h7kkQ=
X-Google-Smtp-Source: AKy350ZG+ziQg2f5yeP8bvPDaskt2sxwWBoOSz80nvmpvV5ou9fl8wAEhJk9S4Fpi5rT8+zmvU8WAA==
X-Received: by 2002:adf:cd05:0:b0:2f0:c90:b720 with SMTP id w5-20020adfcd05000000b002f00c90b720mr3459066wrm.61.1681297766125;
        Wed, 12 Apr 2023 04:09:26 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:783d:9280:20c4:db22])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d668d000000b002e61e002943sm16863582wru.116.2023.04.12.04.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 04:09:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 2/7] riscv: asm: vendorid_list: Add Andes Technology to the vendors list
Date: Wed, 12 Apr 2023 12:08:55 +0100
Message-Id: <20230412110900.69738-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_040928_211358_E7F973D5 
X-CRM114-Status: UNSURE (   9.40  )
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
---
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
