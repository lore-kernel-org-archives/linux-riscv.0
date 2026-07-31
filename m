Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7E5C55167
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 10:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f3UAIPo2nDMnVYJzCaN6TADTFgOSFFcqlB0L5RBe5Ks=; b=BLd1zELlbLsnI/
	vpfx8W5QFBsR8APCQsKVcBkr2Ine5N6dP1GNdBe2ANKeFrB4t080yJ/gSarVOCwpeAaOER7Cuyh6H
	wL6pGg3c/fWH4Z7p9WTDqXO+u8bK1yeFNvsScLLOv5ncCKt2YQeiAc9AIvLX6PXGDw/luxSO+U/nG
	wxJnJW0IRqB5aN3S2ny/9TMaOVUwyvScbsaIPYT0GboQ6F4153TM7kVTDjUOXYl94ehNMrlJsqwxt
	00sqhcxcwB8+fvsuBuZtn0NHkUtGB4+8aKKvXqZa+Yq8FEjw7aRJC0B6WwOEG7+L//SVxTU3bn0B4
	XkNzy+wNwbytV60WXREQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkHi-0000000CIEY-1J44;
	Fri, 31 Jul 2026 10:16:10 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkHe-0000000CIDt-4C2w
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jul 2026 10:16:08 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso708727a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 31 Jul 2026 03:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785492964; x=1786097764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xhY5pmRQ6A67JZa+NLW72z8V+CYSZWnDWCHhcpLOg6g=;
        b=XsK1H+10pZuIhFQ3zFtA0jEcfZttYeiJaWo3KhO1qeO0BtElirGkWKaw+IqaVaJcfs
         ikNihHr+FD3kyoOkKJFsIJ9Pq4oX+Et9g9oROktABKoYxABnrcFxYoeXnA+Vjzgy1km/
         aG9yP2pMCbT9sRbNOrg8D3CGsEieZLFGdK2b6ZHj+xwo+ChlQxcyZHkqiqCxhLJEX50a
         VOCKiBm9H/aB7nuMbpTcV84cgaMNK+WWLWA6lLzEmucs5Dpjh52ur7LMGzaKsOv88onO
         nqlDVPbNKs+BZSgJPMhkk5vLnnCRPrUiVgjVHh4+bQEKGViWwxcNoYHMlbprBqjIPzO1
         jNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785492964; x=1786097764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhY5pmRQ6A67JZa+NLW72z8V+CYSZWnDWCHhcpLOg6g=;
        b=Rx6K91eARHITfmsVFGECbO9UDcYT5I6ECAPu3N9eSANdvwXu2XPzWtdFdjPUvKYFOp
         CqX1dts7zk6Zf938WW58x3eeV9VDu0hkc91zrA8pauDFxB+5BX8Xg0hpifg543M53NiE
         btFVTyWDpuEpcPUZ/CEBod0ge3XVeKL2kohLD0qa3KclH12nox30dW+hnuJDjHzyCDi2
         QPWaZbXsEds50+1raQIYKbNzgImTvIZmUz0axsYxOl95wVqgTih6lhnGEQBE/eoBRg1t
         BDT8rZFw4lH62hHPf0KZjoOqaMIBlUe18+re9BLGUMphxp+uai1YsZUPT2yuQEndFuv8
         QsAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrF2pbgBr9teEmjZFSrMGlhfS7NTk6g+QdWYTatbUXpzK6i0yfdD8ygMR/Dzt1eWyrBelk6AJB5Pme0GQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLHiC8VX11hiMf6urZIx5IuHbK/1/INuO4adVD3N9VcVnJAPpV
	II1AymRZlYlS65pVTpOM5YE9W2z4LKmyTrcEw77A5RP4OYlCMz4YlDbh
X-Gm-Gg: AR+sD12auW6RLBAPs8OHjfQc2QNNHU8Xynug/NZ4VCnfYwaDpik4RhhSJhlesz7s4SU
	H44jIE/+bpRqOB9pKG5lkI24jrYx1WsVER4HCllwThxJgJh/SXyExOoMmcDnalrPbD3TcOZ9G0u
	T4s0Av7QnQADy3eCvYXJ9j4GFF8w8hpmx9OzAZYmx1N8JxMGIr/EJxcg2m4zxiDBg8YgFD1u4sl
	tjojnzEl6THHxWKa5Ta4BOkNpWRjE59Sg7akyjwzOBWzbiaJ2VyV6UA3DZCDAVkjQYDONG20MIY
	OEWf8uyH2WCIN55F8bijhmaC0/pxicFiIONAc0Amxz3kjz5P8XhD7KZ75Oji4jcameOFL03FcDM
	lLwqh7fhi2ePnXkcBu5nxpBPL4JLeq2IAYByW/SHEzeli8JJ1n9jO86iEMIelPAsqQmc4IpkySY
	2k8r1+vA3KMu5fgXd6pT/1HmofY2myx2WHksapjFF2GRtn5bQAIuqiVxSDoFbf3VcyaFUb2ZbpW
	EZQXgr6W4eqy2H/XNPXE3wLPyftEq/gFAfDgV36RSiAeYEG+o/87DY02fcqykL5K3TcZI87XAKL
	ugKAzjlhS+UdiRo=
X-Received: by 2002:a17:90b:4d8e:b0:38e:895f:25fc with SMTP id 98e67ed59e1d1-38fb14a50b9mr1388374a91.38.1785492963980;
        Fri, 31 Jul 2026 03:16:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2ce28c7sm509733a91.16.2026.07.31.03.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:16:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Yixun Lan <dlan@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Goko Mell <goku.sonxin626@gmail.com>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: spacemit: Drop redundant error messages
Date: Fri, 31 Jul 2026 17:15:38 +0700
Message-ID: <20260731101539.36290-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_031607_042393_F841976B 
X-CRM114-Status: UNSURE (   9.62  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

The called functions already log failures where appropriate. Return the
original error directly and avoid duplicate error messages.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/spacemit/k1_i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index cd461f2aa756..64510c9a1a89 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -478,7 +478,7 @@ static int spacemit_i2s_probe(struct platform_device *pdev)
 
 	i2s->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2s->base))
-		return dev_err_probe(i2s->dev, PTR_ERR(i2s->base), "failed to map registers\n");
+		return PTR_ERR(i2s->base);
 
 	i2s->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(i2s->reset))
@@ -495,7 +495,7 @@ static int spacemit_i2s_probe(struct platform_device *pdev)
 					      &spacemit_i2s_component,
 					      dai, 1);
 	if (ret)
-		return dev_err_probe(i2s->dev, ret, "failed to register component");
+		return ret;
 
 	return devm_snd_dmaengine_pcm_register(&pdev->dev, &spacemit_dmaengine_pcm_config, 0);
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
