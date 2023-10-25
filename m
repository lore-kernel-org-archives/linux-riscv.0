Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FDCC07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 14:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JU8HfEqy+hX+pZBrwnTN04v6NcGG5PAVL0D/1+NLCDo=; b=f77rpaDzPJTk7w
	0Wm29ER+KIPZI9XiMpFP/em25t2SUZlcTMVBWYk7nWx8bjwCCcvuYQuUpOyfq26pmlRC5gLXJiEMV
	WWc+Hj8awd/gYZQu+NC33fWuiEZyYoWhcYIQIBuLwpHZPmUpOgnGGMuC3zMtiz6C9iPNIhSb3XaS8
	ndBOKu1fMVv83VCdOUui4nOtkQz0U+Wjt2Q1Wj6aHondHHcfITgkf/Ce/6KTGvC8ldq4srQNsABwy
	SN+9mwQ6m7PlTQlgre/9N+wJRsTaqrZHL6S8UqucI8mluXWKpPjMs7novfShFjtkxkM7UXNOLIjxR
	PTJ2SmpFvtiGGIs711rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvesP-00CW9I-1t;
	Wed, 25 Oct 2023 14:28:53 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvesM-00CW7y-0m
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 14:28:51 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6b709048d8eso4662064b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 07:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698244128; x=1698848928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KBK3NZC+n7aQ9gEOFAwoNpYjPv+cjuqYwdG+XSaoH8=;
        b=iyAJs0x90NS/mBRu587KkMzUGmSmzyBwguWM6Z0wapYy/iv9m8KD2zPl4/i8U2TE4m
         rSIgdWREZUWGel9daofvn/Svs26p1XKPllzyVUqz+qsQZLWdWeFA6B3J4v5lMk7ThDlq
         PK1Ym9mPDT+/O8qhVKJoRCq7Hnl5ErFVuhvULVSZVfGtSOPoKrTNkcWXK5SR7OCU87AC
         wxwunsr2+kqvj3vCry7+XOk5eXbJu2fT1E3ReXQQFlaK8LYc+DU3WZs9mxHf1s96w0EJ
         u6Z5xssJ1xn+OyLlrmLrNKK5iRm6glP5J5gvGNnK3FXtD3uNJiWOJia6S8dM7aC7iqXa
         MzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698244128; x=1698848928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KBK3NZC+n7aQ9gEOFAwoNpYjPv+cjuqYwdG+XSaoH8=;
        b=ewUvcmKaRag/CobWtEK4bOvMFzv8t5djm+EiYsF3cgPVG2cA1sZMMUAmE8vgRehGCn
         YdCzIehpF/cPAIQ2cvyuZ5lE8C8xUCbyZptg/HeEVdxbQ2lcMxBK7QVWBN78zvGkJiEF
         ENuHxjit1ive8oapgSGtYOR4Xbs4cRbaRwglwMlxWToWj8Wt0e0b076JLWYsJiayKrNI
         +HS7NO8vPw/iFgYqCHwZfiRjo2x1cNd+mES/SAisOt8fncbvQKcjxc3Y8C+hP1Y5NFvX
         0SahJgHq9jXfGgQnFe8bx1exym0kBK8VEmF/aVLrtHZqSkmfyCCY9sAjmSIFbX81M49T
         hSfg==
X-Gm-Message-State: AOJu0YywGSc2vq3QmHiFdQbplV4fthpI8LVUK9GxFRNLGwAf6iU3u3VQ
	YTGxnMhb7BGHLa92zkGFaUmjKA==
X-Google-Smtp-Source: AGHT+IHf5xLTf1KfVLoRMBRais+yDi8I/s1NVEGKVd+AFMTt9BY+nGX8/ulLd9cgkH/b1pX/mifhiw==
X-Received: by 2002:a05:6a00:2308:b0:6be:367a:2a71 with SMTP id h8-20020a056a00230800b006be367a2a71mr15594745pfh.16.1698244127853;
        Wed, 25 Oct 2023 07:28:47 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id g2-20020aa796a2000000b0068ff6d21563sm9817411pfk.148.2023.10.25.07.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 07:28:47 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 2/3] of: property: Add fw_devlink support for msi-parent
Date: Wed, 25 Oct 2023 19:58:19 +0530
Message-Id: <20231025142820.390238-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025142820.390238-1-apatel@ventanamicro.com>
References: <20231025142820.390238-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_072850_280899_A3E51034 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This allows fw_devlink to create device links between consumers of
a MSI and the supplier of the MSI.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index cf8dacf3e3b8..afdaefbd03f6 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1267,6 +1267,7 @@ DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cells")
 DEFINE_SIMPLE_PROP(leds, "leds", NULL)
 DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
 DEFINE_SIMPLE_PROP(panel, "panel", NULL)
+DEFINE_SIMPLE_PROP(msi_parent, "msi-parent", "#msi-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1356,6 +1357,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_leds, },
 	{ .parse_prop = parse_backlight, },
 	{ .parse_prop = parse_panel, },
+	{ .parse_prop = parse_msi_parent, },
 	{ .parse_prop = parse_gpio_compat, },
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_regulators, },
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
