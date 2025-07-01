Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED35AC8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 05:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C65jlRTLfq/ExMnQRwO/AhdqAZF1l3EquLQk65EM3pQ=; b=um+aZ2x2kggCQP
	gyJhoxL5e7ZQA1jeTh5JpHmn9TWGwfkuk/0DwYTSi7p+MauqY+0smc3y27iH9mJD6QPJsjnZuIYcF
	Gi3Q4ojO6gJtiZFq8GiCeXRqWCzTC1trlwzrHlOvvOjeDJz/rue9IdRTdPieMzsjVy517jOm6esIp
	2Kky5QkLJXRuJXdbb6QLVusb5U9Zrdr693Y49bhI1uP8n4M5GP8ixWqzVrocIHNgRO5k4pqQrSpwF
	kBueEtOus+kmRn8haMP5vcRe4HMhArPy83A1Wkx0ZsietU/KPKlOrspA4df98GqmDOajxE6uhgug3
	opS9kPXgK2cPgmSa6vEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWThL-000000043hI-1V8d;
	Tue, 01 Jul 2025 05:38:27 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWThI-000000043fU-32sM
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 05:38:26 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2363616a1a6so22773855ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 22:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751348304; x=1751953104; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkkyJkVw0bfJeEfuvrb6+q04bt1dqt1H1Dk83FQ9SZU=;
        b=KU9eyBjlkHrblNiSeovhj+ordGMxAk+4wkCG+5+TCbyih7ChGEhjRuwih7AeMwJVyw
         1cQhotR3VUEzKv2Otw8vlr0p+pIzbk6gAwdqFQVXqmqAg0pMtxL+ToJHi37BkwgXZjzk
         1e82JxWTN9VKOBi7prCO0lIv0G6VSa0AMuq25YeoX/CcGYCG0xAnS+E0uQ0kXMXbzh4z
         v2z6cY8d8l5IyODi4tjBI6KOKz0al3yyL5NVOATdGZZJbOk+STWTRam4TN8F8ClYGOp4
         y1Bnb4RZq8wgUPpI9a3ueteq6/HIPkoQeF/G74OJsg0lp+YzlrzJnzVQDCMk4iiADL92
         hWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751348304; x=1751953104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkkyJkVw0bfJeEfuvrb6+q04bt1dqt1H1Dk83FQ9SZU=;
        b=evwwJWAue9kTsUIoWUwnL/DiZy3YDesfgfX7rsHxtMGFhJ4l6ln7xGh8FLCzzA6Ylk
         fFPPS5DNtAad2SiV+1lCP4u2NoKErlDNHnpctEN/Q37Gfrfld7UT+zBTdM7tvcJJhwrS
         /NbahX5PhSMrYtdAg+rWOW05fhNg+hE/X+zKEXp9vtEn3qWY3OgwKn7++URgbMDTUN6j
         i8uksFINDsNp3gFGdm1TC1g63VYpmnXryZ4k422h+0S+1kaK74QjRnMEPAE/5Op/70et
         ldVaerHJd2wyngUmMQEVL6Dpw2y4LVZPS1nLv0POR0yAdv4HuHsEEbjGxqqkATOiIgCk
         qdcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXKlArIqx3T45+lO0cURkE8nRQQvLzLt8JpYR+hIeLl7j6cnUjkN1q73teCNPRHcNpuAf1PkqrHT/IPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpIdmkmHHDmr0v5m7rymajq8/9ydwA0XiAJ8f9dy8P+Wbefrgg
	gwQ4KeAW40vFY8NX9lMnVTQ5jN01wTeerZteW6Kw5I6alYX8XWA5TnuIbU1k+K+56vs=
X-Gm-Gg: ASbGnct7bjLAamn8xu9NOdbYbJK3iA0WT5ApnIQz/pTUaj55CPgswT5YkTMmhl9QpCo
	nclndwFJVQKe0//dMajR7s37Y1Vx0/Ciw/Xmc/jIWWYI5RD7XQCDHlXll3585iB2HP/HsKpUAm+
	H+F+DBpWC6IQ3fo+g+2XEsZBHvOG918rv7s3sB46YVxJK9KSV5UQms6PGJru5N2AMx+NSyX8Es8
	70z93Wd+qvUZXN+pdcGaHN6B58ZJzl1+jJ5R04i0Mfyzf4IH2Zt2W/ou5p3bwsmV4VDNgYWN+Eh
	sq0KSnjkgiUR8qzQTTIRX3VocE0g7MHKKRcYmjQ=
X-Google-Smtp-Source: AGHT+IFV0sJft9TTbW6Dof5c+OPMKTEfD4ooz1HCHFSKDnOrbvDpDaREUu+dR1A/ELAjaCh8Jizt9A==
X-Received: by 2002:a17:903:2983:b0:234:aa98:7d41 with SMTP id d9443c01a7336-23ac4685adbmr249282415ad.42.1751348303953;
        Mon, 30 Jun 2025 22:38:23 -0700 (PDT)
Received: from [127.0.1.1] ([2403:2c80:6::3092])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf5fsm101729865ad.115.2025.06.30.22.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 22:38:23 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 01 Jul 2025 13:37:02 +0800
Subject: [PATCH v2 8/8] riscv: defconfig: Enable MMP_PDMA support for
 SpacemiT K1 SoC
MIME-Version: 1.0
Message-Id: <20250701-working_dma_0701_v2-v2-8-ab6ee9171d26@riscstar.com>
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
In-Reply-To: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_223824_770044_64D83556 
X-CRM114-Status: UNSURE (   8.53  )
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

Enable CONFIG_MMP_PDMA in the riscv defconfig for SpacemiT K1 SoC boards.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Rebased. Part of the modification in v1 is now in this patch:
     - "riscv: defconfig: run savedefconfig to reorder it"
        , which has been merged into riscv/linux.git (for-next)
     - Link: https://git.kernel.org/riscv/c/d958097bdf88
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 37c98c0f98ffc0ee9d021e4d07aa37a27d342f7a..b6519fcc91c0bb56f71df336fd3793af3d64fe78 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -240,6 +240,7 @@ CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
+CONFIG_MMP_PDMA=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
