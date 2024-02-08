Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85025C4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 12:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HcYwKEVrD98G/CVWrcOfVCl3WYjDnaUu/mdiTcg5CF4=; b=ZepcTWy6Lh129/
	D7/i6HkNQNmV4Fo0sf/JNXF81s19/Uc4ELplr7DC0hFguLj4R/FU/rNWbp8CU0yEDM3AfhUyF+1AH
	uHeSLadJZ5DzH7zP/0qy7GV8gR/dEu6Yb0ZZkoJO8PTXWUa0EVreI+5vnafuIoeFVGl9IuMJw5C6G
	bzHXPZT2g4FrUuGZIs3smunn4AHrtfD7ynZLzC9emUZLRGyEhC1eVKmJePR1RE0WdpmumNRkjy1Sw
	4zahkpqKPlTgUKiLSaLvfvukop+G7IlGJAi4SeeQe4Ss35rVy12y8QcWAN93NnNSgMm1DzOXvvTVU
	hDi8BME44kat2V5L4Mqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3l3-0000000DlYq-0nsL;
	Thu, 08 Feb 2024 12:44:01 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3l0-0000000DlX5-3WuA
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 12:44:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40efcb37373so16035765e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 04:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396236; x=1708001036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ryh17vkvT9rK0W07k4+YFM6FrPWL3ef1PYzKuNba8sI=;
        b=WMDnoCkFGukFnv8TeF1vsZqpIjSMZhPeR0ce19FStfFtpdinXs31Q2pHxSQYA990+d
         S+hMsaFIay0O9oOlWWVk9oMQt3GuIDFuJHXivrfHEC4B6w8MgTbvoXRJtj826VZSOiSt
         Api/Jw6rTqe+7U5/ikvB/PG7423SEjr579xt499C2/+lOBzDCjHoNqvy6WM8wWhUMfRn
         c/IuLJ/q8utOmtYWRIkpgaZxB5tm8LeIf2N9QcWH4566TnaPNIaS3aLeYVcBSR7JEGa9
         wMT/r9Gt3XapHLvHdnl4Rtfg9vTaoUUr/o5+/+nWvgJFR3faSokvFBW58tAvh21UQgW4
         EojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396236; x=1708001036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ryh17vkvT9rK0W07k4+YFM6FrPWL3ef1PYzKuNba8sI=;
        b=S1mJzwpOXMpeBFRuxk4ufO43uZqjDAWSRokrrgM3oLuY6PRkQuwAUIIdAPcQSeCiZk
         IWadqDBnS6dun8dN+YMR1wsAkhn3DESICNYWHD6WsQWylWbbXmpjYjyWtr8vBaihZ1j6
         ApJhlvOAcQnmqAniWJ4IXIKrF39Sr3ucIHZ2zYEB2c8gsRDZ1weMBZAi2irlKjbRv850
         JHdYVv+ll/UFxXclmRlW1YedcAGpJxJKooHHyZeF3jHUEeV6w8WmC2Pnqznl49n6VTj2
         71k1jv01MVSt7OJDCbfixytcKPBrcRT7e3jqh/Ug5oDtOv6T8B+yxSrY0zfPrZD6AIJH
         HcXA==
X-Gm-Message-State: AOJu0YyJxgpWDvgfPYtgipHhfkx5WJshFZItqrA28GCvNzRn6lUk0iGX
	mAIKcSV/tl0YPjfyAa56U6F+gXWvMb+cKvA3Dsd/TV0Jv6LgHkd8DUjyRhfh5IU=
X-Google-Smtp-Source: AGHT+IHunpYJbYbBjEl+8Rn5E8DhUzBiGFBc6/YTorX+D5VQ+y5VLngR+jFaUnHhz8Rw+cH4nUY4yA==
X-Received: by 2002:a05:600c:548e:b0:40f:ba01:6125 with SMTP id iv14-20020a05600c548e00b0040fba016125mr7327127wmb.32.1707396236421;
        Thu, 08 Feb 2024 04:43:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaVxKvgjdrUHMcn+vDtcSzWaDLuDkKGG1MKSWLY3PNZ0O8PwbQ/8uKSqKMrqsQyqbOXAvtKOsO1LiBcuVvKeuoJx/oI6dD0l+RKX2QOWKdpr1o20p4aJVnt9tdtQVLVnhgLycsbb0MxgH8LB4WbTuAL2XDwzB5Zl4Rzg1ujmlof7uMPM4JuCUmoaQjhm1yeySRXnRdu0m7SxyBzq4hhN7AUVPRnkUG9Od2zTGWQWtP3uzmqD4IOp99FGsKRXP2RVqFf/7rsH2xbwC4umSG+DsLKMgAYh1jBS1cVLJ8reXQ95Kt2dZyD+dqaa3OZ2TKL+wd0TaHTvsUF685HHjxJmb1MFPemn1IMMFHQ5SDchoPTqUuEtydBYfK4Bna0OuO43zXHHHDpGgJENqzdos6kbRBndcwPaLKecp8w+qSOlcZeun+FZn5SOSL9hG2I0UghoAdsJjm2wzRQvyBGvK45w/YznQaw0mhfYpvHJHNwf+VoRuJTR0X+SwDStf+YxKzZKBFvcUWqE/eH8EKHSLN8tzSHCXW8KKjCt7vT47cvh0+bQ+Oa4H96qsLHH3XRAJGMOg=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:43:56 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 06/17] dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells = <1>
Date: Thu,  8 Feb 2024 14:42:49 +0200
Message-Id: <20240208124300.2740313-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_044358_906532_520DF1F1 
X-CRM114-Status: GOOD (  10.74  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The driver will be modified (in the next commits) to be able to specify
individual power domain ID for each IP. Update the documentation to cope
with this.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../devicetree/bindings/clock/renesas,rzg2l-cpg.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
index 80a8c7114c31..d7de3ddbc613 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
@@ -57,7 +57,7 @@ properties:
       can be power-managed through Module Standby should refer to the CPG device
       node in their "power-domains" property, as documented by the generic PM
       Domain bindings in Documentation/devicetree/bindings/power/power-domain.yaml.
-    const: 0
+    const: 1
 
   '#reset-cells':
     description:
@@ -84,6 +84,6 @@ examples:
             clocks = <&extal_clk>;
             clock-names = "extal";
             #clock-cells = <2>;
-            #power-domain-cells = <0>;
+            #power-domain-cells = <1>;
             #reset-cells = <1>;
     };
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
