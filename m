Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1B0CFB424
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Oct 2024 17:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgZiQ0Gv1ZjFGDY3dpaeQ8id4HcRuoIhXJQhDPK2jLo=; b=fjQOfYjjnNlVNi
	7xD/U3BL6zB+AZuRcZSM0kI5NwCihWKGsXT7hipqSoN+z2AmzaMfw4ivmVyowMqrCXktFEffAk+bT
	FyTbri45A98Xsn4L6w/pod+JpQgXhiQQGMPiqpRmrQAfLLoBY31sPkd91CgoKIvCaFQl2zTuu4Pmg
	CAg94I0uNAu/bWOfx05zD8KqeUeX+sMCDY9k9E9z3XTknDsh/3opvaSb4p0mxJ7hbLuqE1+7Qsv6z
	9mJ18Q2Uj6m7pfNFy55dWvg8gjVZmceqYzy5cuFC7QBVb+JzbOiodIVqty5njaM/NRHOaEOS+ReQB
	gLvSlZADbZg9T+ICtj4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxVI0-00000000LmR-2jq9;
	Sun, 06 Oct 2024 17:43:28 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxVHx-00000000Ll1-0XXn
	for linux-riscv@lists.infradead.org;
	Sun, 06 Oct 2024 17:43:26 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71de9e1f431so1560423b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 06 Oct 2024 10:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728236604; x=1728841404; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2dcGg6sikxvnM8Tn6Zg71r8Ca2eyP6yTGUfifpMwTY=;
        b=ClDi+TYV6JVhuY2gfFa7ELXeSKTQyu7pfUjXOpRYytLP0UmnzWE6WkWJfdmna2VelW
         sDUl9Ja8HTr7VWp151nnFDklZSk7NuYY1PUOd8uZ4iHs4ewIqVWjEQzMiW21XuYvlble
         0sSHsxxuzclYt40/6MXlmYMNvaHKooRWSRApGfQzCnrNqNXk3EmQj0fM2Cqesokqs4uQ
         kmnAwH9S0+AXvARAsAQxv/yUBrjx2vfpjG50g0LdVQjTG/4heYx1W28BOer2ZPC9XmXv
         pJ/VAkIPiyOkRlw2KjAiOviKAYDxewPHjwHDNTfWixv6d8PMOu4ejSWH1bOKixOqndb9
         Ln9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728236604; x=1728841404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2dcGg6sikxvnM8Tn6Zg71r8Ca2eyP6yTGUfifpMwTY=;
        b=miYRP7/hW4jnU4YrtT+s090K1+xy+puAOdZTRBTH80Ygx5q8d2vzc6Yw8GLvkUrFYh
         V3KM80FRCp5dlt/wLJnOBnlM/vTpkRuSDzCrRgZqcWVorGciMkUGbRKtXHmCxfhKPkmo
         OraIpnOCo4UbCquHxhrQ+mtBP1L/alegY8dlsj9DUkeFLDrEOJjtRZxD36pphF1nnMak
         TplyjRIlrg16592CGo7famZ+VyOT82Muxy4SGvMmWTqCOT80NztsBZanFM5X2C2sq46V
         Q+osHeXCRo1TFBeg41VE2TbNrOYxBu+AStayIwo4XHF0NIixwA64+o8C9Xep4fNMT+ar
         aV5w==
X-Gm-Message-State: AOJu0YxmhLtKKEowjw3J1/kUCEm7dIleyX8RfSfaXDnBy8lw90p/pdCe
	ajOApowXb85U1RB0CBPUL6lAcR00xfk8vmo4yDz/0ZU4BlnELQYw11wtmmBVx8Y=
X-Google-Smtp-Source: AGHT+IEW4o7tvLckDilWYjuXJtcfmQwtg0eJys42bHOEUexDRrnhKPRGjs/rA1lE+MfbcUv1uwJCiQ==
X-Received: by 2002:a05:6a21:a34b:b0:1d2:eb91:c0c1 with SMTP id adf61e73a8af0-1d6dfaef79cmr14944850637.42.1728236603796;
        Sun, 06 Oct 2024 10:43:23 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d6526bsm2999591b3a.159.2024.10.06.10.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 10:43:23 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sun, 06 Oct 2024 10:43:21 -0700
Subject: [PATCH v2 1/3] pinctrl: th1520: Fix return value for unknown pin
 error
MIME-Version: 1.0
Message-Id: <20241006-th1520-pinctrl-fixes-v2-1-b1822ae3a6d7@tenstorrent.com>
References: <20241006-th1520-pinctrl-fixes-v2-0-b1822ae3a6d7@tenstorrent.com>
In-Reply-To: <20241006-th1520-pinctrl-fixes-v2-0-b1822ae3a6d7@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_104325_204113_3DDB0380 
X-CRM114-Status: UNSURE (   8.46  )
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

Fix th1520_pinctrl_dt_node_to_map() to set the return value before
jumping to free_configs when an unknown pin error occurs.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202410022336.xyWlV0Tf-lkp@intel.com/
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 9331f4462480..265a75a78d5a 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -499,6 +499,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				nmaps = rollback;
 				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
 					np, child, pinname);
+				ret = -EINVAL;
 				goto free_configs;
 			}
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
