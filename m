Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B487BC678D9
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 08:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yFEy3m75huj+i2MWw2NRkJQmVCEQDYj8uZfaEGo6B1M=; b=3+4a7+HirORkSu
	oCAoBVBDG+gtNdft32oPS1V0jMPpbh/d1LRTwC0kmEpohd1SB5eIKtQ7Nb0O+bKK2+runnwr1ub/0
	n5EfvwNjpWLotoYi5/jNLoDZo+6+Ldutb/drN6lsaz4/3RAA196amvy/gp3peTqxj3Kiph4j+aO4S
	5iSJ8H50F/cAY0f9+H99inCll9xzy4K/2EBglmGw3kQCJQoLhiN3fjVgd79/RW+H2rLtF6DwW8wJi
	1f68A7/4JCENxrtqHrB1E05Tx9D0lCU8WdS9cXLou5Lm7QSiY9o0eWbEyMriWcdD+JKTv5y+hdeOX
	bg4FWDy9JXnzzG3mLbeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFTD-001F06-MT; Fri, 13 Jan 2023 08:31:27 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFT9-001Exq-Q0
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 08:31:25 +0000
Received: by mail-pj1-x1036.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso26352925pjt.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jan 2023 00:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kBEmviVcUaQ36DwQBsnDSO4G5pwhdVpJ2oN92m3Dybg=;
        b=f7++enNZEL4SsuxaJnsnZw81kRX/EsImW+eWHRw7liJ4tZ4GxYfSxv/XoDk7ZDd2Kb
         FLFdF0z+C+Z9lwX4++CP2JAcT8PiOFISW0WmA2vRyABVYWhCZlyXJLkiGFsQ0PvCSeld
         ddHgzgygcReJgHYxDbmh0xcqFJ72wGizpuPdhUkCpsqC0SuDJcNt5idS0k9q+CxmBM6w
         hD4M7U/S+6PopWeq7zmA6sv0KTnREJWg5WYpNCW4CFiw4RsPYYD1bqSxknpqxte95XjR
         8dAPEV4bkf4hfBHTA7wxFVh6AqQjwjn22CmxskfGyaT5l8HKtvU1gTfjmBsWPcVRfqP6
         aMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBEmviVcUaQ36DwQBsnDSO4G5pwhdVpJ2oN92m3Dybg=;
        b=5AubZWNd37Diiw+cJlsiJHuyBMjoiBfAXFY9SZ1tMS+YPkiO8RcyyOWS+9rSxjEEbc
         kZKbb94PCYMCamszqgRio9cYoTn4+CZDnElds6bPfbUDRzlCV28015SVc7uT2x8M6Po6
         CH25HubW4k+3XLT3BfkH3QQ2aTvUIRrPUH1Ljsv+/gnVx381yhpRVc0rtYoe296ViZje
         L+EAa9UMuuBx+tVonhlhojcL513mVl51Kz3DWqPzKCdxvqtBnwneSev5b72JdKHgkWj0
         4xDLQliBZLv7IIZgQ5L+/2sK+uk9wRQXfPJJ4vADFHSad1BDbQUzjWKKDw+1aKLpHyAf
         lw7A==
X-Gm-Message-State: AFqh2kqcFE3oiDUh0KqVzaNzp6uUb+AdClVRUFbnQ1U4puP289Urj75z
	TWQV9D/tiKQzcvQHRm9Yi/FKjQ==
X-Google-Smtp-Source: AMrXdXtBLLNn01zlZ5/XfXv/LMaVCWnTxeF7fs3ronY2mkDvlXYwSl7sAG0uTVhhxl6IBWPUAFD17g==
X-Received: by 2002:a17:902:d48a:b0:192:48d1:f06c with SMTP id c10-20020a170902d48a00b0019248d1f06cmr13731785plg.35.1673598680109;
        Fri, 13 Jan 2023 00:31:20 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902988700b0017f73caf588sm13466123plp.218.2023.01.13.00.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 00:31:19 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: nylon7717@gmail.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH 0/2] Change PWM-controlled LED pin active mode and algorithm 
Date: Fri, 13 Jan 2023 16:31:13 +0800
Message-Id: <20230113083115.2590-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_003123_916167_4D123F9A 
X-CRM114-Status: UNSURE (   6.43  )
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

According to the circuit diagram of User LEDs - RGB described in the
manual hifive-unmatched-schematics-v3.pdf[0].
The behavior of PWM is acitve-high.

According to the descriptionof PWM for pwmcmp in SiFive FU740-C000
Manual[1].
The pwm algorithm is (PW) pulse active time  = (D) duty * (T) period[2].
The `frac` variable is pulse "inactive" time so we need to invert it.

So this patchset removes active-low in DTS and adds reverse logic to
the driver.

[0]:https://sifive-china.oss-cn-zhangjiakou.aliyuncs.com/HiFIve%20Unmatched/hifive-unmatched-schematics-v3.pdf
[1]:https://sifive-china.oss-cn-zhangjiakou.aliyuncs.com/HiFIve%20Unmatched/fu740-c000-manual-v1p2.pdf
[2]:https://en.wikipedia.org/wiki/Duty_cycle

Nylon Chen (2):
  riscv: dts: sifive unmatched: Remove PWM controlled LED's active-low
    properties
  pwm: sifive: change the PWM controlled LED algorithm

 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 4 ----
 drivers/pwm/pwm-sifive.c                            | 1 +
 2 files changed, 1 insertion(+), 4 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
