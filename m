Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BA5CFB442
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Oct 2024 17:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJdJfUQYL5DvdI47D2097qNS/SU6791FEl6qFQG7B6s=; b=s36gzBRGMjTnCF
	fhM7N/b+Jxo2eg0ON7J6ygEN3iikXzBj43IwDsl8ug93idr2Wp8V/7z2tO7xZiwDjjx9ggURj8lZF
	uma+s8dacM9hBvNVDgGQ3A8LJo8S+qvmA1/fSnBm/FftrefwTXObhv3KoSiuRc8oRKaCSuaS0lBwd
	gAC9NHrq6rPiFARnIW5iesWE0UJYBM4spQedm/W4U+Tn4w776pQriyJp4p89C1JSuV8JoXcfRYwS/
	TARKqg24HD4qP7+M+/do1DJexqWJVISFDxAtGKSpHZSfHeawq/QOIMR1DwEuQvVdmgm0T50PiuNoT
	0iJ4w2+X2HEzAjJpjgXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxVI1-00000000Lmh-3axn;
	Sun, 06 Oct 2024 17:43:29 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxVHx-00000000Ll3-2QV0
	for linux-riscv@lists.infradead.org;
	Sun, 06 Oct 2024 17:43:27 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7e9fd82f1a5so496640a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 06 Oct 2024 10:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728236604; x=1728841404; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0aqH8Nz3YTxyf3WOUwJPMSHP7Sz01anRaWLkW9KhzE=;
        b=UKd/NlPr4QgNd0aAinV8Sfvg8zZiEIj2PDtiwtAg42Cgx+p/vhjtCfGxCpRdhe9C11
         +GX4HojJ4y0DNmKBsBA7GGxCBF6ohnwKiRxiC7Mdh0Y7Y0cB1tAkxa0XvQFpC5wRDK58
         0AiVp7vGz4nVZQP4PFx+NOAmh1KzSxiKVngy8x3cXEkT0xbumJw8zANC4BeMIygnMqvU
         eR3L2784cmjgbZH/smOLXSVGSJ5XpOZs/tYrhE3r680f9Uddk9stTAo62qEBZOctnnAT
         weZ2XHJHkZMZBZfG0Ued5kRJJ7o/VzuOv+ORuUmV4Z8HJzrdytyTbTHXDTOpmhFgDiWq
         U4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728236604; x=1728841404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0aqH8Nz3YTxyf3WOUwJPMSHP7Sz01anRaWLkW9KhzE=;
        b=eoAdF4b2mXxe/kRF91vwxqXkwTgC4Xl0Ja8XXUhHi8LPem8+UshvXUMiQ7HK8SsFBf
         zxUNAnKRyu2zFfJbL9Dl+JXBVP/1TINzgS8L6FvgB1agRuodEAFY8QDqNDjBMnTor7gj
         2KMe+EKGMyZeU5v/CbDbLt1SuhyPawfnS0buozsvG/mCg4oKIIEdMCQ7hBCbADfNZWLn
         Iv3O9cMFEmaReV9RbI0b+TRZTgNntFHq2+KYH0Tejg7QwiGBgapWsfxJJ8oN30w5UtBo
         1GYcSRfut/VtsyfKttmXG+j6PamdCG02i7xxkkPcATKN2+dcdSS8TS9Y2rwPtIAGrd8E
         HU1w==
X-Gm-Message-State: AOJu0Yz+w0jkoQxhYIfVtspy3dY01PBoTOGjyHkR7LlWEvzith/j3PHT
	WBBfjTnJBMSijNQTIe8QXIN7d8ouJOsIhbID6sUR58xVSwpC53ja4avNr4NcVyM=
X-Google-Smtp-Source: AGHT+IHVc4JR7QyWPEo99nCtTOnKJvnv2SE8G5Rtxbg+iGO4JRlQKbzCRbb7fdIDCqesN12taDtiuQ==
X-Received: by 2002:a05:6a20:1a9d:b0:1d6:e61c:23ec with SMTP id adf61e73a8af0-1d6e61c33e0mr7436331637.6.1728236604624;
        Sun, 06 Oct 2024 10:43:24 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d6526bsm2999591b3a.159.2024.10.06.10.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 10:43:24 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sun, 06 Oct 2024 10:43:22 -0700
Subject: [PATCH v2 2/3] pinctrl: th1520: Convert thp->mutex to guarded
 mutex
MIME-Version: 1.0
Message-Id: <20241006-th1520-pinctrl-fixes-v2-2-b1822ae3a6d7@tenstorrent.com>
References: <20241006-th1520-pinctrl-fixes-v2-0-b1822ae3a6d7@tenstorrent.com>
In-Reply-To: <20241006-th1520-pinctrl-fixes-v2-0-b1822ae3a6d7@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_104325_663482_2152E418 
X-CRM114-Status: UNSURE (   8.98  )
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
 drivers/pinctrl/pinctrl-th1520.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 265a75a78d5a..7ed3f82b9339 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -444,7 +444,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		return -ENOMEM;
 
 	nmaps = 0;
-	mutex_lock(&thp->mutex);
+	guard(mutex)(&thp->mutex);
 	for_each_available_child_of_node(np, child) {
 		unsigned int rollback = nmaps;
 		enum th1520_muxtype muxtype;
@@ -531,7 +531,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	*maps = map;
 	*num_maps = nmaps;
-	mutex_unlock(&thp->mutex);
 	return 0;
 
 free_configs:
@@ -539,7 +538,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
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
