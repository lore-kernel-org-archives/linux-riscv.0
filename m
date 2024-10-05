Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC69ACFB42D
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 19:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DofwRFrJGIMpcnyk/xmWlMy/UbDC22J3oKfBTcY3IQ8=; b=XWPhJW7iYbt3OP
	TwUEA8hZlerCP1iNVPuWtvRajaM5JLnHrHvFDWCMB/J7EIJwunoCA6axCTgQvoeUbg1wnrTABUGXl
	6o+ArAdR710kTzp3huw0yWLBikHJ+j2JnNnk1V+dB9HIjmiWDCCETyLy2phSKXymJv/nzvGCTo9j9
	ZGD3RK3LCR+W0fVW61PtirvUawtqADC6LDmoly45U3PjfHg2mECY0+HAkwh2y8O/02G7T1Asx+MZL
	0CGxrf72zj0Ad9GarMrwCRj97c7pauuR36u71FgLsjuoDkgFnANtiG/KPelHfYPpI+5KCs5SiWou8
	F/X1QyTnCSjgZ9A/iOOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAZ3-0000000FnxA-3HG0;
	Sat, 05 Oct 2024 19:35:41 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAZ0-0000000Fnvi-24XW
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:35:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20aff65aa37so27528585ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728156937; x=1728761737; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=siW7EdgyXTgOQPOyS518eaXhNYDdg121ayiXgQNhC30=;
        b=fC7KmaQATnG+8ZQO8ZsCP9MtayVYTdSkz4GxDQ5+xIBsgwpyn1qTQNEaYDmHOzauPI
         NEDi7g/isyu8kFdawe6N0pj5ju4REOzbOfatqqatTc7k3BAMmdTPPUVEPDiPavJy7rkf
         1mHoOX/UdpnzHdbYhqpJr9m3/hrcrHlhzcHi5GThrLQ/3lDxWaRdRv/txCxtT7mxEMmF
         HsmeEO8Luhifar6HQC8Di9cTMiCRXl/I8qJGa25VUNMAycziug25m9VZ387irdDqi6xt
         2teM11Q9gxe6uKe+rKLN1IBLF+gZqZ41j+DcWL7KUsvewdzeom7JSBrnOKtlR+9c7mOV
         rGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728156937; x=1728761737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siW7EdgyXTgOQPOyS518eaXhNYDdg121ayiXgQNhC30=;
        b=CG4OWCx8p85/YUn5lX+io5udoKA9jQa+MnNChVEDyL57WGnw7BudCWmRuDmjHyHaY8
         uGIJACnzMmvcEafq4goSkC88mRm7BWZhc77OpHgmOR2/1hMUq+2SJB/Gdd/yhKTq8NGJ
         QgHczQoBnTqj7PCZtvpx91/ZC850lPjgH4q35H4tysAXjg1UmMzMYtVVAO9gPF6fnqtR
         U04HhnppZSqaLvBzDPgp+BQoN63seGY1eOdhji6TdAvI0EHJ2jAZA9mlQZmX4jzkanai
         vy8jY4/9UU0us05DZRux/jIXYLBH+qZTxbBJixg7MUvsu0ew6muWMFG8giFdDcJCPZ0o
         69BA==
X-Gm-Message-State: AOJu0Yz+LstaBa7pxR6q3/EImIYYqI4j0L063VM6pCbHeQxkUhh5hXgm
	9dl+QdCdqCK2a2eo1rfYnjRdRV5GFY5v0379gWLHtFJwy2jfN3j8/hnLLLIri6M=
X-Google-Smtp-Source: AGHT+IHxAvGS4eyy68/Pp+oLN7B2msxCL0H1dN/Ea7Y+bzahoG21QB3NmwpOSm+LgTop+ynMkU/8Zg==
X-Received: by 2002:a17:902:ec89:b0:20b:982e:73d6 with SMTP id d9443c01a7336-20bff043851mr90330595ad.49.1728156937357;
        Sat, 05 Oct 2024 12:35:37 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20ae6dfa4sm2208372a91.2.2024.10.05.12.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 12:35:36 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 05 Oct 2024 12:35:27 -0700
Subject: [PATCH 1/2] pinctrl: th1520: Convert to thp->mutex to guarded
 mutex
MIME-Version: 1.0
Message-Id: <20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00@tenstorrent.com>
References: <20241005-th1520-pinctrl-fixes-v1-0-5c65dffa0d00@tenstorrent.com>
In-Reply-To: <20241005-th1520-pinctrl-fixes-v1-0-5c65dffa0d00@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_123538_582712_E25B2708 
X-CRM114-Status: UNSURE (   9.78  )
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

Convert th1520_pinctrl_dt_node_to_map() to use guarded mutex for
thp->mutex.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 9331f4462480..d03a0a34220a 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -425,7 +425,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	int ret;
 
 	nmaps = 0;
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		int npins = of_property_count_strings(child, "pins");
 
 		if (npins <= 0) {
@@ -444,8 +444,8 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		return -ENOMEM;
 
 	nmaps = 0;
-	mutex_lock(&thp->mutex);
-	for_each_available_child_of_node(np, child) {
+	guard(mutex)(&thp->mutex);
+	for_each_available_child_of_node_scoped(np, child) {
 		unsigned int rollback = nmaps;
 		enum th1520_muxtype muxtype;
 		struct property *prop;
@@ -530,7 +530,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	*maps = map;
 	*num_maps = nmaps;
-	mutex_unlock(&thp->mutex);
 	return 0;
 
 free_configs:
@@ -538,7 +537,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 put_child:
 	of_node_put(child);
 	th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
-	mutex_unlock(&thp->mutex);
 	return ret;
 }
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
