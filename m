Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACC7D0D7B8
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 14:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4CocuXx3dGhoN5YTSCVsE/lIRg3vKC8mcWa00/lwLSo=; b=IkugbOSyzLdLQ6
	tlT/y78WgsbSGmgNXJME2i6LGtMAN7akPuvG/dpXtO8ICh19D4L9PgJAM5oH6BsKwwKgW6KHEZYgp
	x2BhvHWe983Q9/bqdq7t1AcX6PYsiNvT0ypL1ijs1jLx8Kn84HEsKIY7CTaAtKAPPypZDQt9nNWek
	NAz2RPtUTuaM714spXzmyNPlLitjcewnNKYxMC4l891AigUFArXrsgs22KILQepY0Mjeq66l9Fgxt
	YhbzOFYx8yAJ2/QCNY26eo7QV3MpfCzeloIXQNGkvYKlB3lZnLxP+ClSRjQbALj0Ont0GAwiqviAW
	FIUK5p5Mi3xDAYOC6JqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szGzl-0000000GgrU-1Vmi;
	Fri, 11 Oct 2024 14:51:57 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szGwT-0000000Gg2l-049q
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 14:48:34 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1538B40AFD
	for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 14:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1728658110;
	bh=y7+YQmnss41fm/ukNbmPDdCc/cnUksMm9Me8dFSJczY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=tO7urpHai9TgRLytvr2cpvkKCBCkgK0ucKPuStnCyyMnxffSkGgNdxmG2N6ix2b2K
	 GxtlblntzDpT+0PTGxGpfPLY3eztqpthbRR4LrRe6S+eG0I67loPiWRw9iWkrC/YZ3
	 PEm6fRk1GmC79muFGJK84Ki9owH7AKLulWFb34knVLUhnqF//s3M/jmpiURHBRGsI1
	 1P1ZZatY4rvlZR4rDw91sB/8eqaL2Bt0vSRzqycCVk3y+bzh2MvHsaFlPBVrwShZFZ
	 G8gLUBF8iIlkMoZmsthnTIJFc1YLknBtWW/LcGtgZjxTVEQE0+z8dnVud8r1o0ZYTM
	 9ogd4res6x4ng==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a994a22d6b9so139144566b.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 07:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728658109; x=1729262909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7+YQmnss41fm/ukNbmPDdCc/cnUksMm9Me8dFSJczY=;
        b=It+gS93iB5I8skgWV5BEFnO9iJEOT8SfLlEaDdGcCtWVXxB0TqO/lSHvAhi/tYqkUo
         WJx6SPSqFsH3PIKYkJIcM7N/kzkMyd8PM/Lr04aMaSvNPvSufbmYszl9yhABPb6lGeiA
         hIS+EWwl0J2hRtd5ih0T71gLF4ZvXbf4GGzKFVCMVfB64bhlQnGNiGhbP0KZF98VBptp
         lFsBse+Pbrrif75nPDCFq2islZQFsp8xE/3ymxiWQO3k2OerXhgIA4s1Oq5Z0uJFh5Rq
         NsdkRDw04QaFcH4LT9dwvei7Y7mXi0U/wcOhDWEs6wXpxS/eqKTcFCDhize+UXnE9asz
         GoYw==
X-Forwarded-Encrypted: i=1; AJvYcCWkj4mbyAZgh2Ps4FvEExA14nzh7zOzrXLo05oCoDc0wVZEv/sMJfThZAh9p2W4M4VdWdVF033ZnqNdiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9jk3ILcvd10ZFoyAkJXCRqJBgsQoxlvMtjvR3fD4Kv3nDLuzd
	PB41LUjzwOS+aZaLOLVLwhNQym6z7Ah/dIoHnenLdpnykQKbv8EdCV14kwu7/FOEm0MXrUezLuy
	+zyS8IbTURqPVuf87LP+9IJ84IXzSjeViOD8h/Y1j09joRcADuCBbFXzd9yju+bTwKdbzOeiTNw
	3bfUA0oA==
X-Received: by 2002:a17:907:f796:b0:a99:5cb5:6175 with SMTP id a640c23a62f3a-a99b9436b1dmr254243566b.35.1728658109124;
        Fri, 11 Oct 2024 07:48:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1I4NMn4gYPdo3MbVQwrz/uYAefwMxC5m+RAElwaCH4bD85EDqoY9JLmmWjwDhkrc8lxHdRw==
X-Received: by 2002:a17:907:f796:b0:a99:5cb5:6175 with SMTP id a640c23a62f3a-a99b9436b1dmr254242066b.35.1728658108783;
        Fri, 11 Oct 2024 07:48:28 -0700 (PDT)
Received: from stitch.. ([194.62.169.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99c0c89bfasm54134666b.162.2024.10.11.07.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 07:48:28 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH v1 1/3] pinctrl: th1520: Fix pinconf return values
Date: Fri, 11 Oct 2024 16:48:23 +0200
Message-ID: <20241011144826.381104-2-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
References: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_074833_215140_F3829893 
X-CRM114-Status: GOOD (  12.68  )
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

When Drew took over the pinctrl driver he must have changed
all the -ENOTSUPP returns into -EOPNOTSUPP. This subtle change
was most likely not spotted because it was never mentioned in the
changelog of the patchset, but it breaks all the places in the
pin control and GPIO frameworks where -ENOTSUPP is expected.

Fixes: bed5cd6f8a98 ("pinctrl: Add driver for the T-Head TH1520 SoC")
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index c8d2ee6defa7..03326df69668 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -591,7 +591,7 @@ static int th1520_pinconf_get(struct pinctrl_dev *pctldev,
 	u32 arg;
 
 	if ((uintptr_t)desc->drv_data & TH1520_PAD_NO_PADCFG)
-		return -EOPNOTSUPP;
+		return -ENOTSUPP;
 
 	value = readl_relaxed(th1520_padcfg(thp, pin));
 	value = (value >> th1520_padcfg_shift(pin)) & GENMASK(9, 0);
@@ -636,7 +636,7 @@ static int th1520_pinconf_get(struct pinctrl_dev *pctldev,
 		arg = enabled ? 1 : 0;
 		break;
 	default:
-		return -EOPNOTSUPP;
+		return -ENOTSUPP;
 	}
 
 	*config = pinconf_to_config_packed(param, arg);
@@ -661,7 +661,7 @@ static int th1520_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	u16 mask, value;
 
 	if ((uintptr_t)desc->drv_data & TH1520_PAD_NO_PADCFG)
-		return -EOPNOTSUPP;
+		return -ENOTSUPP;
 
 	mask = 0;
 	value = 0;
@@ -676,14 +676,14 @@ static int th1520_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			break;
 		case PIN_CONFIG_BIAS_PULL_DOWN:
 			if (arg == 0)
-				return -EOPNOTSUPP;
+				return -ENOTSUPP;
 			mask |= TH1520_PADCFG_BIAS;
 			value &= ~TH1520_PADCFG_BIAS;
 			value |= TH1520_PADCFG_PE;
 			break;
 		case PIN_CONFIG_BIAS_PULL_UP:
 			if (arg == 0)
-				return -EOPNOTSUPP;
+				return -ENOTSUPP;
 			mask |= TH1520_PADCFG_BIAS;
 			value &= ~TH1520_PADCFG_BIAS;
 			if (arg == TH1520_PULL_STRONG_OHM)
@@ -718,7 +718,7 @@ static int th1520_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				value &= ~TH1520_PADCFG_SL;
 			break;
 		default:
-			return -EOPNOTSUPP;
+			return -ENOTSUPP;
 		}
 	}
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
