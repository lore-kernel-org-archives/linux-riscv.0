Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924B3D2FED9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 19:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XOMdE5pMB3UFW2mAzoDAYt1AkNDssbf/dK9BrRi0TGU=; b=Ayhqs2kE7tER7A
	Up7+Lrqc27lWsLsisaZ11dI6tuXsf4lydYA+BmqpaNh+XBrl9/pPwMZVTZSx03/Qgeh4itDz8t3zu
	8i6SRrIxO1ivCPOWp5Syc0LlnINB3giOqKE4x36QyLZt4mplhNIaCuMUBw81lLpgPByvgMIjO0QOf
	diglm0dUDq0fSfeMrxuoXEDBq6wm9CMqckQNcLBELbKnOV9sQRa5PX0MgGhbfQ5/mdcU2qD6Y4iFl
	Xg7421GuTRdbr7FY1GdSFsS7nIGxDIW1FGNAGNnMJiUOWhexgA+P3ww2gESceM2okQ+J8SyHUuuJL
	XEp1grfj2t4TlLDvIszQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoQd-0000000Esw0-3lqn;
	Tue, 27 Jan 2026 19:08:43 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoQb-0000000EsvY-3nEm
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 19:08:43 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so47175605e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 11:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769540920; x=1770145720; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zXFv6WOP8W3azboFkG7Bd/jPVLZoa2VMLxSLFbmHKbc=;
        b=kfhewroyrk/HtGeBvaQm742M95P+vaA/aTgbufD7KDmWxv+oJ0Yege1LPZ84bcfwBz
         T5hc5XMX8LH5cc/I0ZgQ4+OshUOPBVWOvYoHF6HNlkr47ndB/b7rihP8OxF4R3ANQLIZ
         zk1m9SHkur9yhIVNssw6lePwBxxla3Ad7/DmwmCzIGGZU7gXUNbx3ZLVlXRxnA6mKmvQ
         m4N2vatUFiyHeXTGiPPAmPpmlZ3M7gnfu9bRLGwX7R9xDbRWoN9jLU91ivh0G2ym1oyK
         7+ZOj909e5y/Smlog3JytL/VKlwuC8zE5XP5yzIGc1afQRDGzGY6aDvMiVNblMv4rtqX
         INog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540920; x=1770145720;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXFv6WOP8W3azboFkG7Bd/jPVLZoa2VMLxSLFbmHKbc=;
        b=P0/eUvOzjymhftaHyd5V9Ipx5q3zJPBGoGhbIWUUZBJKDecZfrhCESGl3Y0q7QPGCc
         6fPrJ05h7zVM1fwapW/GM9rdhWNFHBUgyupaaFEppcPdwZdabxCtcqZmUX/vCzKjWC+F
         n23XsVSrpGwIwA+8K/s552/E7L3t3klfHgw4CfD7czMtrtGTkzCEQfWWAy/CHI+n37Vu
         fnSfzMhUCD7R80GPHJaAE/iYmJe9xgiaQJOZYLxhU8CJ84taWZ4tnybx8jr8MfvzH/hg
         UltuTQOTsTjT92lsbsLFz6/Ll3de38+3z6GCrabfx+sOer3GtmlXXflA4cxtVOT2S4G7
         ftug==
X-Forwarded-Encrypted: i=1; AJvYcCU9ZksfWVShlCzGtORDaTFlq6u+CJhCEKOyWCW2aWAYAomwaksXn4vJSbORJQYxiHaADmU0W0AHgNe6VA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2ca/DvDhdzfMtpHg5meqNaGb0C/r7AQon1l/adX9FLSrFv3Jc
	REoYuM4+73U124zIgkd/bpHrvNrWZBYginpFl198dMKuGvsPjEu/pu2ZPrSnoNTb
X-Gm-Gg: AZuq6aIDVpxUslR8xBhUHpEmj3K7/t1wiccjFpL2m8UnuMp9c2O46wENC4965cUxVEw
	g9KOHQAhYmRiv4SzHgWtdcxd8IsJA+BVfcGL8v72VGv8OpNsOgAgybPb62/+/iJg9FDyAoAQB7b
	lppxBvN4d1l/XeHIaWYsYGYiGD+cS2B5f43lYNX+EmDHwjdsGX6ivQ6v5xlpqxOwWlooDOVxW0z
	dPdEv3oLDbPiCAS0fJe3X63bJgEbwWpejVbmjqMT8hv3Hq27RqwoYzSZu5wc9IjphQD6Xy0Nzen
	ugLjXsPG2cIlG6QCB36/H9XsI3QxAu8mt02KHgeS3B2WgTp2RbEifpg2bBm60iHp5BiZ55fRvCT
	/UxB8dVQpw0UCxQiTl2bMj5KgEw+vgjjB1euDCOHIUSKb/MwhDeLwWpXvRiAmNJwVz9QIK9+wTa
	nIqNYif6SgDwu5JcWRrfVbxBrSuJruu5U27DiEhb2j2mS8
X-Received: by 2002:a05:600c:699b:b0:477:8b77:155f with SMTP id 5b1f17b1804b1-48069c3f914mr33405045e9.8.1769540919784;
        Tue, 27 Jan 2026 11:08:39 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm74577805e9.2.2026.01.27.11.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:08:39 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH v2 0/2] ASoC: sophgo: cv1800b: document DAC overwrite
 handling
Date: Tue, 27 Jan 2026 23:08:18 +0400
Message-Id: <20260127-incremental-for-i2s-dvier-v2-0-5f66b841f63d@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACINeWkC/42NQQ6CMBBFr0K6dsy0GBRX3sOwKO0Ak0BrpqTRE
 O5u5QQu30v++5tKJExJ3atNCWVOHEMBc6qUm2wYCdgXVgZNg9pcgYMTWiisdoYhCrBJ4DOTQEu
 uQYtoeu9V2b+EBn4f7WdXeOK0RvkcV1n/7D/VrAHhUuv+hq1rauMf42J5Pru4qG7f9y+xnVTvw
 gAAAA==
X-Change-ID: 20260127-incremental-for-i2s-dvier-9ec60a002bdd
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769540916; l=1049;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=NJPV83aALQ0kqd42SvBkY3VtRID2IKOpShixJK7N2m0=;
 b=BALvBEZkSNpptOqmEwB5MQtyO80EUcfyeXUyMbbmVZzVuUmopwgYKeiywgJJKQXQ00KP8BFtq
 7AqNTbv+MOoDiQh6P42kT3FpzcGOcasc24nWIxMoajEBf8soCo5aPTH
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_110842_056520_8181C790 
X-CRM114-Status: UNSURE (   7.83  )
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

An incremental patch on top of 
"[PATCH v4 5/6] ASoC: sophgo: add CV1800B internal DAC" 
adding the explanatory comments as requested.
https://lore.kernel.org/all/20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com/

changes: 
 - added description for cv1800b_dac_mute function
 - fixed "extra change" from previos commit

Thanks

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
Changes in v2:
- missing Signed-off-by for the commit. 
- Link to v1: https://lore.kernel.org/r/20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com

---
Anton D. Stavinskii (2):
      ASoC: sophgo: cv1800b: document DAC overwrite handling
      ASoC: sophgo: cv1800b: tidy Kconfig spacing

 sound/soc/sophgo/Kconfig             | 1 +
 sound/soc/sophgo/cv1800b-sound-dac.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)
---
base-commit: bdc79da6c6206a12c9a13ed5e4eb1360d62b321e
change-id: 20260127-incremental-for-i2s-dvier-9ec60a002bdd

Best regards,
-- 
Anton D. Stavinskii <stavinsky@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
