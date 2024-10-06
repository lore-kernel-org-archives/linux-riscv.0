Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C53CFB43F
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Oct 2024 17:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEuU3kYcFoPgLrACXk52YjTg3tGMxDxOmoPO2HnK9cw=; b=EHDszH3+GCzcMW
	7OWcm/TReVav80GouemaRdhSyHK9dXbXNXcXATmNH3WkOFjuIXXvQxsgjCpj2nkg4Edmhn9PqVolW
	hjtPaqNiU8AK/ChdHMKpK0WlIG1Lj0Y/R+EM8VKk7BYgNjuIPuqQ7RCvtK4okZFFdKVPFDlJAX15z
	sHuu2lVVGxh6kbPHNzQKF9/NHe55kXCAn2JR6IY3rsx7LIvrWG9GsG18IKWFPMO4AFI7BFTfbj65w
	AugF9xRKH77a7W68b16lu3qIVQU6NiijRPpOxjjkf0DmG1heSnK9v0YZURS/SAN+BzekciR0tbZAd
	hriLb+YsTjPpbOggi37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxVI2-00000000Lml-2Ce3;
	Sun, 06 Oct 2024 17:43:30 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxVHy-00000000Lls-1TKc
	for linux-riscv@lists.infradead.org;
	Sun, 06 Oct 2024 17:43:28 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71df2de4ed4so697682b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 06 Oct 2024 10:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728236605; x=1728841405; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djOgLMSN51sHizQfwcHscupKpoOvQDcxpJ2VLwRGCXg=;
        b=CGzM04aR5UkN1dUE8gi6TjxkEIATkWaqKIqRbe5+KNmEni58ED8NQnsus0VZXaSmK7
         V0OAlqL9N9R1igsbz5DAAOXFpHyg18qrLI8DhC+LLBAaxf6mpQrHiglubO+1eYYUCc8b
         J662WpfNGRNYdAp2j/MU7DtJsRudpnqdu2qNLm47uNdLzNiZSgBT8/ff0HaANWTVkE4/
         refbcDGqwJ68KZumpYJFoks+9hpZeTOBr9JrC2Ty40Hw0YPQSUmkcrQzmVXreNV0DBYN
         NcmCGHRsULPO87NMnmUku1XeuuzT2AJMRgHVKm5u8BEuoCZgxYdzfs20sROAMQGBlE/5
         3o0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728236605; x=1728841405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djOgLMSN51sHizQfwcHscupKpoOvQDcxpJ2VLwRGCXg=;
        b=w/UlpReQKfZIMHmipGH2sOwAaRAzmNHLBVNJw9AsGbLxIp4BzUpGpRwYn7dSxuyR2z
         2AnJ3t8Ic2S5BtsE1AfEFulloLdIZ+knbZqOdlAPzD7Qxk7yLg0Oc/ipevxQDtHUXk30
         ZI8pJaLzIRhZUFr2I1yKE6R0i09zq6hdV0itPgB0GIoDIclgDx5+n1jIybmdjaE8c3wk
         YtANX7IwVIUjmx1xn8+L81MejmEtJTjp9z1on6/kjdsABVepuWKUzRqLNi+1eaLEiT5b
         ETeDi+xUZQ/H9V44hHMXxJ4vfbMx7BZgNAXsszPD1/HWcxU7WSdrUHeMrZOLS3e/RAsR
         u1hg==
X-Gm-Message-State: AOJu0Yy5Ut1BCkan0BOKuoOTvI+gl+eBS6q0Q6MrgusCBkFFxlGEOnsY
	mn3m/siNzjiKLab5Y6OIC0BMsZuERRrfW+ruNz1iGOhBTzTIeKKvua5ee7SIDjA=
X-Google-Smtp-Source: AGHT+IEfzDi9RgOylFPwN1JvO7nrxNbSXiuV8IIZXmhL/38SyLJYVdOoGtu60uzg4Rm52ToOrod0oA==
X-Received: by 2002:a05:6a00:b84:b0:71e:190:c131 with SMTP id d2e1a72fcca58-71e0190c1b5mr3066456b3a.13.1728236605481;
        Sun, 06 Oct 2024 10:43:25 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d6526bsm2999591b3a.159.2024.10.06.10.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 10:43:25 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sun, 06 Oct 2024 10:43:23 -0700
Subject: [PATCH v2 3/3] pinctrl: th1520: Convert dt child node loop to
 scoped iterator
MIME-Version: 1.0
Message-Id: <20241006-th1520-pinctrl-fixes-v2-3-b1822ae3a6d7@tenstorrent.com>
References: <20241006-th1520-pinctrl-fixes-v2-0-b1822ae3a6d7@tenstorrent.com>
In-Reply-To: <20241006-th1520-pinctrl-fixes-v2-0-b1822ae3a6d7@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_104326_424857_6C75E126 
X-CRM114-Status: GOOD (  11.01  )
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
 drivers/pinctrl/pinctrl-th1520.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 7ed3f82b9339..286c6b2b0b13 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -425,11 +425,10 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
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
@@ -445,7 +444,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	nmaps = 0;
 	guard(mutex)(&thp->mutex);
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		unsigned int rollback = nmaps;
 		enum th1520_muxtype muxtype;
 		struct property *prop;
@@ -458,7 +457,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		if (ret) {
 			dev_err(thp->pctl->dev, "%pOFn.%pOFn: error parsing pin config\n",
 				np, child);
-			goto put_child;
+			goto free_map;
 		}
 
 		if (!of_property_read_string(child, "function", &funcname)) {
@@ -524,7 +523,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 							  npins, (void *)muxtype);
 			if (ret < 0) {
 				dev_err(thp->pctl->dev, "error adding function %s\n", funcname);
-				goto put_child;
+				goto free_map;
 			}
 		}
 	}
@@ -535,8 +534,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 
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
