Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E1DC433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Nov 2022 12:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EsYeGg/4tFSDWH0T5QWzWT2Q7f+IjS2vnQKjBVppx8o=; b=JRQYl4O6OkhouL
	DazW6q0gzMTrvXSlpfGFAcKIt1D9W5iwLw1bQuSuZCFkcXsoDnbTClIqeD0zqiBweA60NOYgDGiAl
	RBDDg4p65bTGz0ly8jXuMIaUIpUauTmjBXWraAN6xTSkIlj4wrSo4z3l3Zz7VgxT8ZnzXg2ua831d
	GN2sxH5o6g33oQw76aQx8cXxNeOvCL/OZMznSn0pJq/u3cO15yg9dvVecyKG+C8iAl9QxHj0dKiPp
	0mvxOfrRuuaDGpbEc9JXvIm4obRYfQuvLK/6x6wiB1VMxeqyHOsYKXG8bbsmazB7D3hZoanvmiMf5
	73xgEgitpMu0PLhVKg3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owMpM-00DVyc-H5; Sat, 19 Nov 2022 12:20:08 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owMpJ-00DVvY-1Q
	for linux-riscv@lists.infradead.org; Sat, 19 Nov 2022 12:20:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso5921251wmp.5
        for <linux-riscv@lists.infradead.org>; Sat, 19 Nov 2022 04:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cLJgdJggOziMXi6IiE8SX5FvNKSVl5DqzDodf2L/iU4=;
        b=5weTQjMpYyZLArzWcRVDHDNeUr+uiPvvXTjT171sM4KriNuICh+iUAIMXotJJwvgTs
         UJiwX3dF6unJuA4NKAkfMhCvxGMkksmGbgIZB5XzUYM6UC23nLXrisYGgkfM0Grl+vCS
         T659ljWNaNx/nyuJ/35boLRWbZ/CnAv+D6uUw7NZp7m694rSUiO1owRz3ikS7M9NjNGf
         fxgm+KsD5SfMcLm9yc0rf04AJDAb6z+J7v2SMnXLTknEwUKhHZJ7NmB5FPa8IhdMOHJy
         EQJgC9PUw4fb7wc7LBia+bK+5AssCAE5FK/geOjGUpwmcMFcGWlI6XaCcQHiQy5jeEA3
         Q0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLJgdJggOziMXi6IiE8SX5FvNKSVl5DqzDodf2L/iU4=;
        b=hbtaOE+b7tQ3aKIXCnLcIYr1sPt+Cg2gTwSBj4YLStukZ8SNcMwj4hcPPHjMgmEjvA
         OIreUSljul5QzHWkdZNlnWTN898A2ofXST3Apn6n3t447F2dbI9jbCH88Xr7c5h4qJgJ
         EryTA7IK8W3oZPaPVJy2OwiA9p66Vl2yQobpSziklIWWcfDUHkDbgI2Bk7W+IM5fvNvb
         GUXRNW0+ycH2KV/s8fumF9nUzHc6nOiVluwoGQpb0qX+Ch1BiOMQC9v2g/AU6G9AozPO
         sBVOVU6Q+3TVBbmmpFU4qSJRS+FhhVtCwliI8H8jPLXJ6MUb17a4PveOdMJXN/o7wQ8y
         1SQA==
X-Gm-Message-State: ANoB5pmwc2mXQPEOk9qT8uHu89aGtr77MdCG4p5Gh+vzjGGI/ceZJeqn
	9Fh2pgvPpaVgnd7DZHoQ9fLMcw==
X-Google-Smtp-Source: AA0mqf4LFyOrePUIgycRqEuPm5CQq7mnhuFsGijBchwH5J/bxA8LXECYVDFvOCYvKfiuK/RBk9UuAQ==
X-Received: by 2002:a7b:c00f:0:b0:3cf:7066:cf53 with SMTP id c15-20020a7bc00f000000b003cf7066cf53mr11014926wmb.135.1668860401970;
        Sat, 19 Nov 2022 04:20:01 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id z3-20020a5d6543000000b002356c051b9csm6007440wrv.66.2022.11.19.04.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 04:20:01 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: aou@eecs.berkeley.edu,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] riscv: defconfig: add SERIAL_8250_DW
Date: Sat, 19 Nov 2022 12:19:53 +0000
Message-Id: <20221119121953.3897171-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221119_042005_321715_70D57CC3 
X-CRM114-Status: UNSURE (   8.34  )
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

jh7100-starfive-visionfive-v1 DTB was recently added, but all my try to
boot it in kernelCI failed.
This is due to a missing serial driver in defconfig.
So let's add CONFIG_SERIAL_8250_DW which is needed.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index f7f32448f160..9a35ff88bec2 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -123,6 +123,7 @@ CONFIG_MICROSEMI_PHY=y
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_SH_SCI=y
 CONFIG_VIRTIO_CONSOLE=y
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
