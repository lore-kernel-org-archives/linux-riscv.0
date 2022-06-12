Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3533BC43334
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jun 2022 19:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9pG7X6xQD5CJN3DH/+z1y3raiM4EeVjKM8SZXZIYbtM=; b=xchQxDcIiCSePy
	N5T4srgKagF6p4XcnF/tbfGpbPqQ+O+hQJ/Cze56215imUMz25BeDrnjUDzM/tNOTQQEx99zRABqF
	hBYwETTmba8jBR92S9BE0ulIHDLJc5rJhn976Sx9iFZ7cCEvolDoJiFGen1wmGh+UGKlUXFVkidnx
	ar4VyQErfBR+MJD99jQdH1HollRof5InZ10J+ZUli5QKYMTDC8fIXrq681p2OomZgmKfjzrEtHtXa
	ua7dwslhIgpVwkcp2yFCiSYneUqfBndvboYlE6yxjG/rrQ8bPeZN8kZA37lfgvAj9R1TMYZH/xcHk
	UYgE2KTM2jUbkp5zOpow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0Tim-00Haeo-DQ; Sun, 12 Jun 2022 19:58:04 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0Tij-00Hae6-KD
	for linux-riscv@lists.infradead.org; Sun, 12 Jun 2022 19:58:03 +0000
Received: by mail-wm1-x330.google.com with SMTP id r123-20020a1c2b81000000b0039c1439c33cso2044810wmr.5
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jun 2022 12:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HPK8k4gKJZ+wQWjBYJ1REf4HNNl/uXfLF+28+th4jm8=;
        b=WxS4e3m70DLW1yjIUhnUbrBdeC8hHUVcYuxLS5HhyBfAJgqwPHyGo62VUl1t4TWG78
         qa0Spt0qrqCK77WFgGnytj+CrUY0uFwa1t0rjiMFRo1x0VIWcrz7L6fh3uxeHawYDRaQ
         pz56WqD45VRi3cPSZrS693lfJbwHCAaxUAGBuEf61Lb+Je8HLEgo1gMymquk8eSzGsbC
         ovS/fUm/RDwASKiWAK3qRBaoSq6y3Af0NNm6qTUhNOsHKGDJTORGKjmxWeEVt1bG7fWO
         fB7pIC2mJ2H9ISdqp0viUSfC8Ib0W+ACLclo+DLNepwN6QZgw5ybyCWA1mx1QYljyb9+
         VkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HPK8k4gKJZ+wQWjBYJ1REf4HNNl/uXfLF+28+th4jm8=;
        b=mxA/1HyXiMa3Rd478Ljz2DbeiPYpPCtGM1MfMJz4EbfdquK22WZqaWqpOPAat6MZ74
         AtLapgu1lm59wwmOiT24/daPC8YHIeXkZpvPwTmF7FAc8yKE1uVrWIfTIUvbHGlhM8Gb
         D8wFzsJ5ohmn03+Z+FtmkCAyv+eyhPGFRxWc6fpn9/aqNu30yCM+rpD9nJx0zgtoPqyp
         +GdPP0z5CHMxX010GpZfBOS5mw9/LP1sjzX/gtkeGls529egGWuw8UH0AT7Kc5r1y7WR
         n8r6I3Pz1NbgW4dFN/ZHzFGuI8MpKS/O49+UJU6uFOe0B+6sOOFl8jBS7hnlgLbe4nIV
         7XmQ==
X-Gm-Message-State: AOAM531Io03PFB30VfdBC2SESXNeR/Gu1YxIpUu8EE2NxfCNasz0tk9u
	uLCn6rrswZpcKpvm2CxSQ1YOdA==
X-Google-Smtp-Source: ABdhPJxVD+6uveEwgGG0ZXNpTkwYft114nVu3ghAlq26nsiNc/IJ06GFHoNEAPTGysm8ECJzB0DhxA==
X-Received: by 2002:a05:600c:3d07:b0:39c:80a8:db07 with SMTP id bh7-20020a05600c3d0700b0039c80a8db07mr10727828wmb.168.1655063879180;
        Sun, 12 Jun 2022 12:57:59 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id r16-20020a056000015000b0021108003596sm6402404wrx.10.2022.06.12.12.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 12:57:58 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	conor.dooley@microchip.com,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com,
	zong.li@sifive.com,
	palmer@rivosinc.com,
	daire.mcnamara@microchip.com,
	aou@eecs.berkeley.edu
Subject: Re: [PATCH] riscv: dts: microchip: re-add pdma to mpfs device tree
Date: Sun, 12 Jun 2022 20:57:35 +0100
Message-Id: <165506374015.3753145.322560637772164805.b4-ty@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603083825.1910300-1-conor.dooley@microchip.com>
References: <20220603083825.1910300-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_125801_719052_C8C7032B 
X-CRM114-Status: UNSURE (   6.35  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Fri, 3 Jun 2022 09:38:26 +0100, Conor Dooley wrote:
> PolarFire SoC /does/ have a SiFive pdma, despite what I suggested as a
> conflict resolution to Zong. Somehow the entry fell through the cracks
> between versions of my dt patches, so re-add it with Zong's updated
> compatible & dma-channels property.
> 
> 

Applied to dt-fixes, thanks!

[1/1] riscv: dts: microchip: re-add pdma to mpfs device tree
      https://git.kernel.org/conor/c/5e757deddd91

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
