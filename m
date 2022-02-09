Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1945C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 18:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Own57dLHsDV3w9+TVg1PyimEvkYmaJpIAOpV2l7v0tA=; b=OP6YAV8MWS+8aL
	moby2MNuacnsrhmei4GbyHJxCM0+MKKyzeBGzpbwfcNkSSxomVvbHKk9U8j7sXdnAgnGdIU6DBd5s
	PvZ8pKCZ4BqAVTAZTrgBuDd+raKya41it4LaXZVJabQFtkiRq6P2uBZGDWer+a9A4LrnyNC6UjDJa
	Kls7DzZIO+kBDg+T6Kk1/kMrmCurpXBan37PCQWZFm3IYjqjMT7VSjUWwlWySk03K2W2Nhveddkua
	iEVYVB/LJSCGSsI0b/rcpuaXJqr0xcbfWScgh8nOjwg/KckxGGEWUtFm7pYvZMWBC76bPapHOHypE
	tcKlyDzFSbqRdMF3EwDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHrhj-0016ng-LY; Wed, 09 Feb 2022 18:28:35 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHrhg-0016nI-Kg
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 18:28:33 +0000
Received: by mail-qk1-x729.google.com with SMTP id b35so2368445qkp.6
 for <linux-riscv@lists.infradead.org>; Wed, 09 Feb 2022 10:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bn0WKXvV0wH64Fyn35769rJ1j57jq4L1z8r72QPkfFc=;
 b=mk35s4az97TJp7WfXMKqywtvIL/s3xNeyXIfFuo5hIiD8kYz7JSXzA7iPm9s93qzia
 rb9GnE5LW7nRpZ5aApDa/VEWjtoepo5/CyhjVaBUdBoy+s6YmL5mMXqhqTveEu2JO6ig
 acHz36mOOUPVnZ/e87ob1egzCaZQlawtlR2btLGEwhgHF68EfsS+2QcmFuQlR6w9ddkC
 ko1PzC494fLN6e9THRBv01pXvoFr01ts5EwGBi5MyI3IcDPQdsUOdjYRKqsH4MSehPV2
 6iD5ZLJLjhdlURGdbduaTHkRstqsfgK4kkffV4QSa6AH4AAUjSL+rVzPKnfrwBnjD36v
 vPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bn0WKXvV0wH64Fyn35769rJ1j57jq4L1z8r72QPkfFc=;
 b=RWqReIl6/IpPoS+mMf9HOZJ+237G7vLrbRKi9BH7fM0aJHoMXNA/AEaBykKlAswP3m
 BmE2XPS9oNXCP0Ol9s3kzqGujzFvS3ZQeUlHZz2wlzfTbq18SPccF/VlfbNYNQ0RdgQ2
 k8jtqqsGwH+xF56WChAR6OmC5/gtWq2+B4zA00HWNi9TjdQFveevz1EmeSXyUkN1IkFB
 +d6I/blqnT0F6cxroNpyozYMtQNLt0vr9fbarjICEVCfG9eKysKfPQAB/OJGfj9CHtSK
 e5IuV0G1ZbM0O1QaR1zSbzNsFWFkCNwKXz5eHj5RPMryVBbPlfZYEQKbdgGA7+ccfvvu
 gr0Q==
X-Gm-Message-State: AOAM533n7Px70SyPF2k3cDa+z3zj/sCFG5IwN8O8vl5a35OQ9ta1FXxM
 6S5qHLX56XNVC04f2yQElns=
X-Google-Smtp-Source: ABdhPJwYVNCTYVD+5C3ouMfC747bld6PVChncLlfcf5qjZ4TddDhI+r6fR1YfMvelphlJtWlOxiYGA==
X-Received: by 2002:a05:620a:25d2:: with SMTP id
 y18mr1886373qko.522.1644431311724; 
 Wed, 09 Feb 2022 10:28:31 -0800 (PST)
Received: from godwin.fios-router.home
 (pool-108-18-137-133.washdc.fios.verizon.net. [108.18.137.133])
 by smtp.gmail.com with ESMTPSA id z4sm9831131qtw.4.2022.02.09.10.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 10:28:31 -0800 (PST)
From: Sean Anderson <seanga2@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Cc: Damien Le Moal <damien.lemoal@wdc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>,
 Sean Anderson <seanga2@gmail.com>
Subject: [PATCH] pinctrl: k210: Fix bias-pull-up
Date: Wed,  9 Feb 2022 13:28:22 -0500
Message-Id: <20220209182822.640905-1-seanga2@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_102832_702855_137F4F52 
X-CRM114-Status: UNSURE (   9.11  )
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

Using bias-pull-up would actually cause the pin to have its pull-down
enabled. Fix this.

Signed-off-by: Sean Anderson <seanga2@gmail.com>
---

 drivers/pinctrl/pinctrl-k210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index 49e32684dbb2..1ad61b32ec88 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -527,7 +527,7 @@ static int k210_pinconf_set_param(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_BIAS_PULL_UP:
 		if (!arg)
 			return -EINVAL;
-		val |= K210_PC_PD;
+		val |= K210_PC_PU;
 		break;
 	case PIN_CONFIG_DRIVE_STRENGTH:
 		arg *= 1000;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
