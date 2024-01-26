Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC860C47422
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 09:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0YOAz52NxCgsF51yTQeGOFg1p9eu2edHvLbP5O5DxMc=; b=IcjIXOVPliHyXs
	Enr7OQqpp9bBCgyf2pp8VZ02Gwpl6LN+PJgXpkLIsU+I5z6/+J2pqQHvfw+F+LpQX8vdg8McAO+kT
	eLDQps8Kde9slx4ogvnAyH1sdKuGMLG/tvFG58Yb/UeiLgJrDyNuflnGsc5iZ16Q9hjx7zsauvr3f
	eY7aLMM2sYcjjn/ZrGTnVQMLnXdFIfdWxVGweLLFXyKBZogRRXgg2dheA/5Ike/Ftf0FeD9WoRv8f
	ZMsFtKgvCWSdPl9F2NXkwCbAQeacm5WJcS1XySkmGt1wpUG3PsE2LtBuvbAub38idRI2Ame9a6ouI
	cfXRTbew1Hr8eB+Jg4QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIOM-00000003d9e-0K1g;
	Fri, 26 Jan 2024 09:20:54 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIOJ-00000003d8Y-18wt
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jan 2024 09:20:52 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-20503dc09adso110761fac.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jan 2024 01:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706260790; x=1706865590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J49bMlLhf05kk4FSUGnjaiEjqAJComLQo//Z+1eeQ7o=;
        b=KTN07TSM8BjmYGGtZ69PDpy+f0H/Ekpk4aOjA91Vc4WlwEUzColJBKtoecnMF96RlG
         BoMPvTRpjjOneT5trADytwRRTnVwQNEFuMnVnZdn5UWI3PwzD2MeEKf6O3lKlsNS55CE
         ikQQNKRqZFoj4dZN4R93mhnVztK9LX7e4+G7X7mYltWGE9sdhvJ06B9+UqMEJm5xc73v
         Vf83CuQmj2ge83aqlrG7jTOlgiuH78YNDCi+BDmeEf7gfadNyEtCELmtW1oFNfqSj0P8
         wgNWznNS+NyKXEyHoZiKIBdOx8SBlmXWzpzuXoVMEY7pu1qMGQWVwLzbvPu2izjaFvvD
         W9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706260790; x=1706865590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J49bMlLhf05kk4FSUGnjaiEjqAJComLQo//Z+1eeQ7o=;
        b=AJIWuoldBZ0Q8nC3ZfUlPtRpYRzO9cp0OArBLaDzXLyVcklcEsx3pcjLsCWyVk3UKO
         WkDIY2ZYhz/9fXeWBzMXiWgwx0hXulpbQMl5SOuGpvlwtoAGqt82oq/ztDFv/S0jh3Rk
         LHdsR8y0Ltv2UFsaOe4jEgNw1rway4B/1V7yApHEZ6pXHN8U6cCv2bG4VQicb9Bji7+i
         c64ZAvNRAKNrSRaSt5CzB351Wqa2GV/eupzaMNuGYTwobaiBabYwXYj8Erav+Iag/BL+
         +a7w2jz0w8pbCSLaAQqxKw8RgXbAqif5rmF5v+3XBQ5drmuLiY4dqTZFievhyo0Evh2C
         iuiw==
X-Gm-Message-State: AOJu0YxF31SDp1/RPYccKX0CTbe+95WY1jxnv6OCng4ozGXjM5ebb1I1
	3wvgBxX/P+nDdeqUPry2a9Jj48IznbJR/TlLdK8syM6ULA48Lo/in9ObeBdU
X-Google-Smtp-Source: AGHT+IELGpjyvmeeTrl8i+5bEFhubb0M6Wfzg6gEcbtJvuHErN807mdU53478urbw00rNkSd1xE7uA==
X-Received: by 2002:a05:6870:55ce:b0:206:86ef:7b40 with SMTP id qk14-20020a05687055ce00b0020686ef7b40mr1101554oac.109.1706260789533;
        Fri, 26 Jan 2024 01:19:49 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id pl10-20020a0568704e0a00b0021837cadf53sm69258oab.39.2024.01.26.01.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 01:19:49 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: soc@kernel.org
Cc: conor@kernel.org,
	palmer@dabbelt.com,
	linux-riscv@lists.infradead.org,
	inochiama@outlook.com,
	xiaoguang.xing@sophgo.com,
	haijiao.liu@sophgo.com,
	chao.wei@sophgo.com,
	unicorn_wang@outlook.com
Subject: [PATCH 0/1] RISC-V Devicetrees fix for Sophgo/SG2042 v6.8-rc1
Date: Fri, 26 Jan 2024 17:19:41 +0800
Message-Id: <cover.1706259884.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_012051_333723_8921804D 
X-CRM114-Status: UNSURE (   6.09  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Hey Arnd,

Please pull one DT fix for Sophgo SG2042 based off v6.8-rc1. 

Thanks,
Chen

---

This patch is [2/2] of [1]. The binding part [2] has been merged in v6.8-rc1, but
the dt patch [3] is missed. This fix add the dt patch.

Link: https://lore.kernel.org/all/IA1PR20MB4953C912FC58C0D248976564BB86A@IA1PR20MB4953.namprd20.prod.outlook.com/ [1]
Link: https://lore.kernel.org/all/09b2fc2f-dde9-4f43-9704-d8053bfc85cf@linaro.org/ [2]
Link: https://lore.kernel.org/all/IA1PR20MB4953669C097D9C9E24B549FFBB86A@IA1PR20MB4953.namprd20.prod.outlook.com/ [3]

---

Inochi Amaoto (1):
  riscv: dts: sophgo: separate sg2042 mtime and mtimecmp to fit aclint
    format

 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 80 +++++++++++++++-----------
 1 file changed, 48 insertions(+), 32 deletions(-)


base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
