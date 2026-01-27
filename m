Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2F9D2FED2
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 18:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/HdhA8wpKUzTXYyPz1KaKNsXCfkPUcR33h87glQ+lsU=; b=4NEl+qA23WjLOE
	Qtt5v5rtUNPZzFo+ikERC0+ivQGmxCc4luRZAtPsE9cMXvtHwoHrEb3muA4KDQ56VRyaZc7XPCc6F
	sWNz2duIITEMpc0G+8BogfIQAUDsvOV9bSWCn0JHEXmdQWhYbYTz1t5b/GaP0a9WOmnOPDAbSIuSf
	fmgwavCj7PWwhkM3agGVfsfvP/KMOlykYechOmw6E0rN/Y0jI9HPFVgRMiOp1b4UhHhR9CNRQ7peD
	2/5xVlzl4tPOMyUfKrFQXhxwN85wRPnByrXGuBIkFEmiAqU73tNClhgO4v4caCye0UVQRaIpYDlbx
	WCbPnFCvUhbS0FpU6eMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vko7G-0000000EqHe-2G0y;
	Tue, 27 Jan 2026 18:48:42 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vko7C-0000000EqGt-3qzU
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 18:48:41 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-4805ef35864so22891225e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 10:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769539717; x=1770144517; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KIPiKXcszSKqC5Pe05TjPejSszZASfo0tqdtxtTf+sk=;
        b=WN5AWO8YAD9rhPe/dK1p8ve+tGtwTV55l0gVl6OnV6CEWlYwXu8w0yg9Ojh4LVEc+U
         NRmCnH8Cs+ay3eNprWqodQAfs+igL4lpE8jgsBEVjgUm3mSv4QTXv8k7hlCqb8/a4cR/
         PuI7OdRSYW+zIqRhnXmf+NZu/QHoEWz0w0YrCn4imPXQtD4u+G+lVqjst7dticG79cr9
         urEgYLQqzQapvcWgcSHH4CbQkpM3vJCe3W2QMc9pZMwoprGkckxmtxSff+Gts2iauPHG
         /Ayym7kWQnOeojqA3/FraSsDJqR5WAARDhYrWaQEu3eH55n8lzhBJVfc5Ca8EwhRKvzR
         88JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769539717; x=1770144517;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIPiKXcszSKqC5Pe05TjPejSszZASfo0tqdtxtTf+sk=;
        b=hDLpTqqwXk9mjDDPHLE4qX9CbkWnlyTDLTJJbny35ddRqAYe+kd2iwuvLXLfV0RW1B
         gFFwinH9MC8F/cTRyWKxkMNYd3DFdvpP59U8rttBWYMoDD/fvTvPUbA9XEjHuER0+kgA
         RRprVd5wYOo6+uzXyiXg7mAGHeq+4nHE+zakxDnaPO6U6UIRMtk1ZxM/gzvq5SvSyf8k
         VUyo8xYJpAOXfmHfjE7MBdZhmZg1O5Yqm78gn2c5bDlpXeMzE0+SMgEvOr5KkxvQ2Xz2
         cHDi0b3rOQ4CqH6W4/nszc4zY4tPLg1ExyIjwHhi8Gi7cmQkZZlPFN+T8NADs4ezTBLF
         uYBw==
X-Forwarded-Encrypted: i=1; AJvYcCV7Mhx/hMO9b7MZ24hHLOJcEsGkI9csQxA0w6g1x46pWvtkQ73UzRBeNcMhuYbiUSh2wagbjt6WZ3PTJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg6JD3LhJAh6io3GcVorAQk2zcmX1q5QoO17cdZXzooTLMxlcc
	BO0OlakP8R4uSG4WnXR2QzSsbhM85UxAMWArgBsaLnNH1d69ihFQ+/qM
X-Gm-Gg: AZuq6aKd/k2to838Ziakvbb4DVkLQqscVCHABatYRcldVfRgLjjl7JkJE5FMOTA9CKV
	gw3hhD6KHVEgt8ZSSxD9U51Gsx4GsIQUxYnE0/DbkFrIRv+zySLZwsNHw7P2Kojl5eTXL4YY9jl
	inNvbUVLUiL2dyZaelhOKC7h716gsgJHs+4CqlDI/Z6/am6Apsy4HiHJZ0nLvGneBcUU8yZQWQl
	MjrctVeQtt0713Mbu5TtqWZ4IRmGjKLyXCGJPkLqaBnqOUuPHD8REcBYrHfOBDtFEn8T6XK31ov
	vS2O2WTT+QCX661OtIo4COogP3A4IlA11IJEvpqisxw6gKLIgHhkVpCUrLXsjNmwPvPIx7NjNhc
	b3Tpx1iWc+rOXZ9mle8AXbiXxd10k3GJzD9R5LV2dAe63SToTW1J+ixGZAxzBM6SLWaDsBfBi9d
	jdXdVDMrjwsO9e+HfC4qBUQINozYpxR2XNWJ4KibMbWi23IT8jnWHTAig=
X-Received: by 2002:a05:6000:1a86:b0:431:1d4:3a8a with SMTP id ffacd0b85a97d-435dd02c1cbmr3380605f8f.7.1769539716838;
        Tue, 27 Jan 2026 10:48:36 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee057sm903100f8f.15.2026.01.27.10.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:48:36 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH 0/2] ASoC: sophgo: cv1800b: document DAC overwrite handling
Date: Tue, 27 Jan 2026 22:48:06 +0400
Message-Id: <20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGYIeWkC/x3MQQqDQAxG4atI1g3ELJT2KtLFdOZXA+0omSKCe
 HcHl9/ivYMK3FDo1Rzk2KzYkivaR0NxDnkCW6omFe2k1Z4tR8cP+R++PC7OpoXTZnB+InYSRPS
 TEtV+dYy23+/hfZ4X9B0UuGsAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769539713; l=880;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=nzQYk89pkPHGP6R9yMxHj/NHVae7UpktsR44AHN8qy4=;
 b=TJUZT6XopIns2Aq1PkC0y8MR1LmYdMKUSI/PbXI4JnKpP2YxaJmJzDyKFryrDuINikpNhjQxd
 iDhtmZXTcl1BljB5y3BIqfBw/HkpuDVmV3Ugvi5lxIm5dhKFwA/yPv1
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_104838_999706_A4856C79 
X-CRM114-Status: UNSURE (   7.19  )
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
