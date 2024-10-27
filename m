Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09EFD13569
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 14:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MrQAD6OXWt8RsKnxwYbYc6quL65b1FY8EbqbUqyUb+E=; b=nM38FvXXF6XFX0
	KXFI5BiR5Nm6w2t+bEsRMaFvKvONhudBuSx3XtV+tuYc0u/eUX8/saRyUMIjampsyP86F6/BVVw/m
	4X55yIs94QxUgwOfpKo1HRvp3suclfZC9w75C+78dUBYn+QSl6t9jHYDSwMDX2oi0pEkXok1Ze1EM
	BuPUxNw+bM40+uHXG/GQmTRLQyogUyhlnDZWX4pMKEwQeu+72GcL7fz3olx7s4CSwtj+rLuewvwc1
	r5/8XfIKOWWC1+/HyRGDoimp4KLfVvVt7DqRdNkqyTqv/Xozs09SFdGh9UJb8ONfDRzgizGt72UwX
	vlNCFSjkV09oJQsQQRyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t54Xr-00000008RA3-49Bc;
	Sun, 27 Oct 2024 14:47:07 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t54Xo-00000008R96-3rex
	for linux-riscv@lists.infradead.org;
	Sun, 27 Oct 2024 14:47:06 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-71e52582cf8so2490427b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 07:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1730040423; x=1730645223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4GIeGGDuOvllBO+Y9jQ/t9+qEbNG0Nmk817vsmjLiw=;
        b=hpBozLNWIeQ44+nuC+2XJ/ogvp331t53JOH+SGUkfT/fmTe+qteYAjK/yBNS7xHNOS
         m2I4mL/dEWeJgDefPpft8g4MkwuYonRv2CGB3HAzASICTqttJ+MJ3ip9cFKMM+5xtAuR
         sOYN4TQwmGdaZNDForit0oibJ77vRbBFISGBw023Pd8FyPRVaQEP2fR5D8Q5vWaaMDud
         0GUVUTY42T57OODZ8V5SAz92DCytqQ/Pq9fbVyl990xBNDmn7fjmytx6iAhXAoR1vsb4
         gHjjSbtN6EvzXmlEZ1q8sX6RPfUoylWXypcauuo8BVXgzpOMDz8K6sX5ffFwDo4VViZB
         HlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730040423; x=1730645223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4GIeGGDuOvllBO+Y9jQ/t9+qEbNG0Nmk817vsmjLiw=;
        b=BOxupAaE2bisjFvsprwevloSeh185DNpa7gBEwf5uvAcTHZRU0apl/YemLUQ7N/tqu
         I9TTuLri9kXbQGlWuziRbmJlqTpsm5HUeh6uBVRvmzA/8KeUtfluD52Oa/uTfl1KFMKa
         t5sljkt24z9K+1iy0FPnQiuWqNxhye/wD6Qxo1nd4AYCt1ID8nsOVnRZtsNxoX8l66y0
         5cGL4TFXH6sjshqM3DrcyvygnNKVPR2lHvkhShu31k3a5TdLcjP/BJ9XaBLKHbGIyA5X
         Dwi6DUgde7dKRHFs6KXEyDkseeSbXSEhnFIr9/jJInUDle3GSTcHT62k+XRXWn532rc4
         RjMA==
X-Forwarded-Encrypted: i=1; AJvYcCUfI+z83EV8iE6kfxMjIVH6+s4o6Te8/X1RVwbOyvHK/rLs4nGBdfmNkWm2p9AzQTKBn0cKYOWUwJEkfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqHE+79Gvxv0IVirejLud4/RMLcCj1hZcZvebJ0EAk8vhr7cEo
	/8SjHRQIa02+K9osZuG/jyj8qevgIQawZgbyp2w8/XBsRmKiXS0+4AyNLsB1wJ4=
X-Google-Smtp-Source: AGHT+IGc+yGjvgSTs9oPY7Y6tGkDYIk9TB4OVA42DSvWRUo5dUztajHsh/RICDMaunwtF0trrzElzg==
X-Received: by 2002:a05:6a00:2d8d:b0:71e:21:d2d8 with SMTP id d2e1a72fcca58-72062f836f2mr9281823b3a.7.1730040423607;
        Sun, 27 Oct 2024 07:47:03 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::401b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0cb06sm4065110b3a.115.2024.10.27.07.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 07:47:03 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	rafal@milecki.pl,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Alexandru Stan <ams@frame.work>,
	Daniel Schaefer <dhs@frame.work>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	Yuning Liang <yuning.liang@deepcomputing.io>,
	Huiming Qiu <huiming.qiu@deepcomputing.io>,
	Alex Elder <elder@riscstar.com>,
	linux@frame.work,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guodong Xu <guodong@riscstar.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH v6 4/5] dt-bindings: riscv: starfive: add deepcomputing,fml13v01
Date: Sun, 27 Oct 2024 22:44:47 +0800
Message-Id: <20241027144448.1813611-5-guodong@riscstar.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241027144448.1813611-1-guodong@riscstar.com>
References: <20241027144448.1813611-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_074704_984781_5DEECAEC 
X-CRM114-Status: UNSURE (   9.13  )
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

From: Sandie Cao <sandie.cao@deepcomputing.io>

Add "deepcomputing,fml13v01" as a StarFive SoC-based board.

The DeepComputing FML13V01 board incorporates a StarFive JH7110 SoC, and
it's designed for the Framework Laptop 13 Chassis, which has (Framework)
SKU FRANHQ0001.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
[elder@riscstar.com: considerably shortened the description]
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
v6: Added Emil's Reviewed-by
v5: Removed extra "From:" line in the commit message
v4: Added Rob's Ack
    Updated description
    Changed board name from fm7110 to fml13v01
v3: No change
v2: Add deepcomputing,fm7110 into model compatible list

 Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 4d5c857b3cac..7ef85174353d 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -26,6 +26,7 @@ properties:
 
       - items:
           - enum:
+              - deepcomputing,fml13v01
               - milkv,mars
               - pine64,star64
               - starfive,visionfive-2-v1.2a
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
