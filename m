Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88307C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 07:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8WvwcqvPhNI2GPvnUcMXRH/FCNhrz0awJiEHJgaIIfk=; b=iSupPbA1DCv4o2
	O/0Qx4qmGRqUc5/wnmSFGvLz48uOYIu0xXdp2F3s1+HzBcslxnI2hi2xI76sWSatUw4APiNbYB0kP
	w9Z9jwUpsVgRi1pQ8sbutQsioAfSu1ZfDLZQ+I7MTXMTOkqQUmgBy9qsFbB0bTT3vkM3igGMJ/ctx
	FcvSH1tj7WyUT9yQXx+wHMGL4HYkDsqSOsjZk8WimMVCg6jArKgQD5WddTqxWw44i0RSM8zvbGelb
	tkWtnbWhAsa3C0ccHkYMF/339FFbzUZaFuku26ENa4omc8neuf3RsRuFU1O4y8I0Og7iWbosrr/xY
	ADlwf9QVw9xQLHPGmFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi694-00000004OqD-1sp7;
	Fri, 10 Jul 2026 07:59:38 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi691-00000004OpW-1iHQ
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 07:59:37 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-384c94c9423so107852a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 00:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783670375; x=1784275175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvjNxqwnoH3kM1IlyzkqqQUMkDcovkXPiLWFB1jUKmE=;
        b=LQz+aBQgRTqUrNleFMv80dNZdslaXxPX7qXVNuwZQg6vhpPc1tXVKDmwV93sQWa7Hp
         qkxC8arLkxnQ6328fXu54B7eBh2XRrQkKXw+Y+z3SQgBGd6Fvh5PLbYd/MpLjuVnDz+R
         ffXOco9LuiQoOIoFPruSRftEwviQkx2UW798RGpMnETLzr5puHY+gULpWJVpIScYGuuI
         6LN/ENofsDvtDlIOiiHWeSiEhcwn77F8ZnHUXB8Nq1B5rKhLhv0kR/+Jbw0vTbZiR7t4
         ZJietVXpN7zhbAvvB9QFe3w5jUxAx+FbVYiZCTA36Xis+j7nC5Cv3LZmN5+oGE+5cLSC
         ACjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670375; x=1784275175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qvjNxqwnoH3kM1IlyzkqqQUMkDcovkXPiLWFB1jUKmE=;
        b=l/iIP/9R2k4ruVNZqxWxgzqWMmIq7uRfsAvsVpgi37N2i+jfoTngc7gsMTdeE1webT
         lB3RV+PUi/RkfatPpn5RedHiWteLutSsnJbaH9fE54nsBStY/gU3+5t1volIoYdEYQBq
         uoGYSRwUbeMZt9e93E2zIeDPsAHbTadVoBypkPgU7ry5i1NN3T0dc3wU34N+NBaiHuub
         +btunPIy80WulPQVobtqSB4hkChk2hFzA6FxuwBBgW/0sA5abKu5K8oBienmJ3QjmxIy
         eMsHWhFMBmBL0ISiVI8PD1ZM5uOehoh1YfrJoC0vX9nmF9Z3amW0WOB+cn0/XgZQT0pu
         UlaA==
X-Forwarded-Encrypted: i=1; AHgh+RosWw/IE7VZCpKPhZqPNtzHI7Ifz5nUrQWoZUeVsJlQCcyY3hFO92eTXwQUZ8dEXNRPJAQ+vdsZXrEvAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoGtQJvmTv6mehswmY63ec1E0zrZet0TZveS5Fy8L2QX3pjJqM
	fAAghpnkhn8PnUtrJANOcfrjxeMPHbF10g/nCFYx+iKgsTjoTcY4l9qb
X-Gm-Gg: AfdE7ck7SfbYLO/WxE6Jf4y5vYrmRIGxWkJMXKMZGEtqWuOjthULAfa2pchjuIS4fqV
	iOKBWONNVGa4u8LyhWmuxWxhhrB/FF3ZLemsmDWly4TtYHGo17JcnaJvwDj7hVWQa/DqtW8KrNW
	i6LNXs/H68tqBqyuhdTp8IZUhWd+FB0Xy0CnqRPLNv8w5AZmFTze/9f8H0huM7XMO7UAhmwmu4b
	ozne67N4eKNZ2p3oRiefSpOOVNI6WXmBRsuX+2tUIPjni6uv+Em6XCRqwLHY6n/gsuLLYtEbkP1
	P58bHOtlW32NbQuKXV2tcdolKcA3df35b5aHWAQWmWUBiRnFow4YyaiSOhYlPBWvuTzRwia08WV
	ZunEJtrq4f90Csjj6WQPceNVg8O/0N40rQ1HYwTdHGjzvhSwz6DTneWuyBYIWKe67nkRm8Eys/F
	YSqLkDnB9/zqpxXaM=
X-Received: by 2002:a17:90b:3881:b0:37d:f70f:fbf8 with SMTP id 98e67ed59e1d1-38a1c1b0a81mr5870558a91.0.1783670374731;
        Fri, 10 Jul 2026 00:59:34 -0700 (PDT)
Received: from chenyou.. ([140.116.78.205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm19044999eec.26.2026.07.10.00.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:59:33 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: soc: sophgo: add Milk-V Duo 256M board
Date: Fri, 10 Jul 2026 15:59:15 +0800
Message-ID: <20260710075917.159969-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710075917.159969-1-chenyou910331@gmail.com>
References: <20260710075917.159969-1-chenyou910331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_005935_449289_B9975904 
X-CRM114-Status: UNSURE (   7.84  )
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

Add compatible string for the Milk-V Duo 256M board.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 1c502618de51..fcb1d905da7d 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -31,6 +31,10 @@ properties:
               - milkv,duo-module-01-evb
           - const: milkv,duo-module-01
           - const: sophgo,sg2000
+      - items:
+          - enum:
+              - milkv,duo256m
+          - const: sophgo,sg2002
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
