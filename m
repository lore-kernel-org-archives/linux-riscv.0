Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C56CCF042D
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 01:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XRPfca7e4WSODhMHGlG/Gz2yK1SLssaPmx4nabiUmh0=; b=B2qgTIQn93ZWf+
	4MELtjQJzNWQYL3Jv2KhSt+07dHHqlm1XnsKaQOswSkWdfG6U1hN7Afb6cMqkAlL/Gj9TV7TRg69N
	6zL6Ed6N/YfMaxCk04JiFCwtuhNXATa845PILLsYjWRvybOZFyqkd+rejNUK6oF8Zl++7K1rfWeAZ
	o9F3ov0aQlPj408S2cQskh5IYaKvV/2UyIf+m/4KaavZL4n42escHw58RI1yNxvZGi+k2FIVXAYeX
	fnveuai9UE9vHXMoDD8bqjULUc5QCse4jzRIe8ZZlsK2oihLhKA8nA0hmTMYWMbrSJpjbcECUCw3z
	RlYu0h2cuNpyoR9i1JdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syLKm-00000007a7o-4BZA;
	Wed, 09 Oct 2024 01:17:49 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syLKh-00000007a6w-3Xi0
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 01:17:45 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20c6f492d2dso3155ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 18:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728436663; x=1729041463; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rcvxYGMoOTRMXFV/E9b+WvC4bJSrWDz1gUOsF/dMGQ=;
        b=aeT3DC20v6dM8PFMuxOb2Zm4TsfVTG152pMdWlQl8O+MrVPWGGNxRcKEEzRTfhn+kO
         wNL0BLS+ZRQz3yzWivNjrfHlRwBvlB/EMJtUsaRZNItXbiobqaZBFFzOSz5tJ+TF6SvH
         VLEYqepKXA9XXzgBoSDLfWpNKHAT5PiYkEeVeyjmI1s8ELnxNRYKbQUD5NUUgPiUdiH/
         Hk+01rEb1788KEL6ZOo708Y5WKuByrEeqVTRttrfvUgnp1fSFLGV/5H/M1ZnKgD9P0L1
         SxIm/AZpkDDZdp98QEhUf1ClVCMqKNJMrhCx2Q1Via+nafvz/lKPqmolcjP7lniAGVmE
         RO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728436663; x=1729041463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rcvxYGMoOTRMXFV/E9b+WvC4bJSrWDz1gUOsF/dMGQ=;
        b=dbGRXGcxWi+pW3wEWvWLvjLa+g+Dr5eOD09VrXkeib+rdB/p6UzlaYosraOx4dPMBa
         icSOZENlAwV0HJnNWCoZgvMxjWMXJ46CZ4jxpOsD7bAYxXbc2UGRqO6CZIe9oprmockP
         WMIyyIhsukJdTo7frK4ObihadcE5pg/UWb3k5A8jp6qJePOGVAg40IfJ2fESFeL1zZNz
         DAHSvaFvweU8bRY+kqQjnxi3tH0nuaYS376hJ/Razjx8p5A6qc3UJRHKkLbmmO3aIEKe
         zZ96SeqJoc/9TMW2OihV+reO1wkIriY4VslhvTXocPbmKXlr60l9VMm6rFJdZK8sVuJm
         xsaA==
X-Gm-Message-State: AOJu0Yw+/nKNkZD3WyjqKZ/G8oE5G2mpDv4MDTARUqwknzeo/UKi+ljL
	sqBR+OXVeP2HhuMvSqmZebF2t8ys57Hi6ZjDjQF1j/kQ+YQUDzFUblSMyPIYTFY=
X-Google-Smtp-Source: AGHT+IEtnc4cCnA2h/Ncwk1hbYGngsttFCPHK379AweSgZoFPZhde5eOvn3TJ4RE9RdqiHPP0gLTfg==
X-Received: by 2002:a17:903:1ce:b0:20b:bac2:88f6 with SMTP id d9443c01a7336-20c639155bemr10883575ad.52.1728436663352;
        Tue, 08 Oct 2024 18:17:43 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cbbc2sm61076365ad.78.2024.10.08.18.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 18:17:43 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Tue, 08 Oct 2024 18:16:48 -0700
Subject: [PATCH v3 3/3] pinctrl: th1520: Convert dt child node loop to
 scoped iterator
MIME-Version: 1.0
Message-Id: <20241008-th1520-pinctrl-fixes-v3-3-5b60db446a49@tenstorrent.com>
References: <20241008-th1520-pinctrl-fixes-v3-0-5b60db446a49@tenstorrent.com>
In-Reply-To: <20241008-th1520-pinctrl-fixes-v3-0-5b60db446a49@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_181743_919600_0D46F709 
X-CRM114-Status: GOOD (  12.50  )
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

Convert th1520_pinctrl_dt_node_to_map() to use a scoped iterator with
for_each_available_child_of_node_scoped(). As a result, there is no need
to call of_node_put() anymore. The put_child label has been renamed to
free_map which is now a more accurate description.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 7ed3f82b9339..c8d2ee6defa7 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -417,7 +417,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 					 unsigned int *num_maps)
 {
 	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
-	struct device_node *child;
 	struct pinctrl_map *map;
 	unsigned long *configs;
 	unsigned int nconfigs;
@@ -425,11 +424,10 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	int ret;
 
 	nmaps = 0;
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		int npins = of_property_count_strings(child, "pins");
 
 		if (npins <= 0) {
-			of_node_put(child);
 			dev_err(thp->pctl->dev, "no pins selected for %pOFn.%pOFn\n",
 				np, child);
 			return -EINVAL;
@@ -445,7 +443,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	nmaps = 0;
 	guard(mutex)(&thp->mutex);
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		unsigned int rollback = nmaps;
 		enum th1520_muxtype muxtype;
 		struct property *prop;
@@ -458,7 +456,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		if (ret) {
 			dev_err(thp->pctl->dev, "%pOFn.%pOFn: error parsing pin config\n",
 				np, child);
-			goto put_child;
+			goto free_map;
 		}
 
 		if (!of_property_read_string(child, "function", &funcname)) {
@@ -524,7 +522,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 							  npins, (void *)muxtype);
 			if (ret < 0) {
 				dev_err(thp->pctl->dev, "error adding function %s\n", funcname);
-				goto put_child;
+				goto free_map;
 			}
 		}
 	}
@@ -535,8 +533,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 free_configs:
 	kfree(configs);
-put_child:
-	of_node_put(child);
+free_map:
 	th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
 	return ret;
 }

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
