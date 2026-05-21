Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A97CD5BB4
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 14:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DvDxeFVLeYbzpymlyE9fGwx7oDcV3NFuioksKhOZpic=; b=RsYiq5i1fPcq29
	sg7UFz55PTGWsnrll+ALnLZ+qcNG51eSWHR+rv8tYNm+FNO7XE/u1NcXQ6jTwvADgP7RuBx8W1ijp
	W1wuUusib6as2ckwsZ6o5v8Zr8avBARx27H+VB4JuT57jYaVZIFClE51MF9hNkG9FPgXbR0fzCV8h
	Fz8VbSz/0kXSuhSwZSA7Yl0k5X526MQ8pF0WqEyTyDypbRQ9vaG/DK7f9OLjB3dABrED/0SZo2U3S
	tuPL8yA3Mvc1kpDSNoPeaAzXtymsp0WTeO3zEUsDeiwYf848LNnSM5MWxAJW/hs2PdDrXEl5ai5R4
	1LBY1DxGH7g/c5KUmrGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4eG-000000087cE-3gY8;
	Thu, 21 May 2026 14:45:20 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4eE-000000087am-1Zq6
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 14:45:19 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2bcd730e090so48146425ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 May 2026 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779374717; x=1779979517; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3LTiYFbcU6wC49KHcSNJ/mVq4ewVk4truPy8q0vUtbk=;
        b=M9zc3X7d536z0G/FdhyQTxbQozNXCWU/ZBqZsUYTFsNYVNNPmcjxgI2+x85+gSdB5g
         zmuPNBSFq1l4M1OdjS+3LDXAGGG4H35ixh6WCne4c3eWIJQvuP5djz8bAtSqAh+lBTUr
         smG5cP9Tu7Ps265hIo1aVKBj7r8MakM9AA5DjNGovwfY2Daxv9660yonEms68jVrGe8L
         tmDQI5ADU2MO7kcWfl3fpdA1ESRme8qCaHztuZDsnIJRSUpF6ZwiN/Rwg0sBTtWWRHii
         De+zNxyiCzqdpoa3UIULKstu03pItgM1WUZmWUopstgzNu6y2VvaAENXAKpNLollPpnU
         fznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374717; x=1779979517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3LTiYFbcU6wC49KHcSNJ/mVq4ewVk4truPy8q0vUtbk=;
        b=edOQwpbpo3cQWG/KvRJYTup6zYkYR0Wvm1bZNLmQxnqBrKnew9znKwORsrErGJwtWC
         OonW9a8h64roOGCW98/gWBLrXi+X4AmQUjPZVx5o2JS+r7RFOVdDjdFUbWGwG/bqnpHT
         hTEmhe39SrA/RT1Wb6/gIfgW6z7vDctTDmEj4UcOGuUJBnxDvv44yRej6z+7hOJSNcYG
         4h9JIUDFuKo7MXxbfx/BmuP774W6Bg4l00Nwr9MtfXsjQFtAnHn4Rd0sFqqM4PPoaG1e
         CW9mDdyHNuAYdnUj4NxNtWGMGeIIPDHnYT56vJGrit22+4JDidU955bgiaVPbLbLrCbl
         Jskw==
X-Forwarded-Encrypted: i=1; AFNElJ+mZesxWv2PEWJ/ttm6Xb3lsxXkP5ndo374rzCv0v9zlNkamDrHPb8SPONBoTUawm9Oa4xMf9oJ9tMRJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyStuJDLmlbhq0fWs8p2rlklZ2ZxTzYJjjxOhv/R5D3HJeZflaD
	WLOa4UHyYbBl/cB3ujco+8F6DW8XctsEkbBd5KhvYHcx/hjEAIzz8GEK
X-Gm-Gg: Acq92OFezSqIo8n/RsuFPlsBoKEQrr91KpGndRzeeYF5Qn+1eQm0/EqKRwDD2whniWL
	3+mW1fKO2fw75PcfzuzLK0mFbLOXjM+fneZ4s5ANkfNNBZoKoKQjzm4ZT0lBvt+gHGyqzhW71PZ
	u2pUHVlZvgq+qKzFw4cKk38g1A/3001j2Oe9cKE25dfVgbbGbEnjFR+8RohSkciE6D3Pwu6iOhQ
	ywawESU2dwlAuX+xC04haXoQ1hA+nwLkczErD3zaWiZSTaNQngy/OJ+kDELmeVyFbPFe86hDslE
	3SYOqTAj/2bmTQDcNX8HcwGMpoW+PprcYOdX+aramgDAicvzN9ySOQGGcigsqk/wCgKsk2EpyA/
	Uy9u/nrHs3gTDRN6lwKlwTy1ecdo9EVn7oUPCI2Ou+9nOO521pRvKB8IAqTyOFauyP4B4m62xGc
	hgfBppd+Ic6nZ+exR8+7jIO9OMHDxZdg==
X-Received: by 2002:a17:902:ec84:b0:2bd:c5f8:504f with SMTP id d9443c01a7336-2bea35e13bdmr34721505ad.40.1779374717456;
        Thu, 21 May 2026 07:45:17 -0700 (PDT)
Received: from [10.240.146.115] ([2.27.148.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea990f667sm13261475ad.62.2026.05.21.07.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:45:17 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Thu, 21 May 2026 22:44:45 +0800
Subject: [PATCH v2 1/2] spi: dt-bindings: fsl-qspi: support SpacemiT K3
MIME-Version: 1.0
Message-Id: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-1-52bce26e5fd8@gmail.com>
References: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-0-52bce26e5fd8@gmail.com>
In-Reply-To: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-0-52bce26e5fd8@gmail.com>
To: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Wei Fu <wefu@redhat.com>, Zhengyu He <hezhy472013@gmail.com>, 
 Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=niGbdLtWYmxOuaPaN43bokPEuaiPAfLAecgrPZ1TUoQ=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqDxpvWmnMnZ47DBxJRrP0paCNfmcE8KttLsrcO
 fWP+VpDyxiJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCag8abwAKCRDN9pw2gLgN
 2EDjEACF70KrGYUz1B8eIr18DxEfVXeO3tv1w2uDnROb018ze368iFdbCEj3A4Wumpzc5w8kcJc
 TMa+xI7ZxJUOYkBY4oqlM9XFzdPtjHJHDmUeIiIXR8uu9o6IXw/ijjK02N7Kgj+GxvLPrjCjFSO
 eDtbVSh5gX4/zb/wl85yojEjGXyedk+jQ1XXzd1j8PtmSFe+oS27v81jTI0cW/iIKMuZ6ZVfZY2
 F0pDcaM5eCgZgmIr3AjDWJMaWmD+N7x8expa/8m6kmfcoBxmckIHD+UN5axI7fI7a2yrNmV3bWl
 pt1PuuopiusSOTV/3cnvV1XOlydtpzfTyPysZVIBwI6iluzeiS387jd7j0jw97l7pDx/La4k9Tj
 v3WSw+LoJc/L1rxwgjwmSfvbsQQ5t/PiJnNMFvSaFkvJnSvHjUGCMiAzeQQBtCjxLjwluczk9hk
 J2XZDVEo6hkQxnd2TZ1dAX4yBp60YDqeY42HfZWTWVc9EqoVqBR8qebOcfrQShLr4F1rAK7n+y7
 DdaZDUB8yvdQvTQE9wHPgYkm0DZxmW4LOZhKO0wL5O8ZtNhjxXTjaf1nsrZV0/d2n0n6ag9TQF+
 nlYc6ZcDfLLpHjr4Gh+IvUYlErDGiT0GrwzRO5gi50BZNfL1Ej+MivsjgarP28XsWaCzNbqUHQq
 HGCObBeI2tXNlDw==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_074518_425380_CE23E776 
X-CRM114-Status: UNSURE (   9.16  )
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

Add the SpacemiT K3 QSPI compatible to the fsl-qspi binding.

K3 and K1 use the same QSPI controller, so document the K3 compatible
with "spacemit,k1-qspi" as fallback.

Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
Changes in v2:
- Use "spacemit,k1-qspi" as fallback for "spacemit,k3-qspi".
- Reordered Signed-off-by trailers.
---
 Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index 1d10cfbad86c..504df31a4f90 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -20,6 +20,9 @@ properties:
           - fsl,ls1021a-qspi
           - fsl,ls2080a-qspi
           - spacemit,k1-qspi
+      - items:
+          - const: spacemit,k3-qspi
+          - const: spacemit,k1-qspi
       - items:
           - enum:
               - fsl,ls1043a-qspi

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
