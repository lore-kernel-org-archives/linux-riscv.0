Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDE0C3ABCC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 14:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u3/zuqC6h11K42KFjxuk7NAwgyCgB05wkR2YYZH6w5I=; b=tGROaQA2z98d3w
	n9cLjjTqim4+v/7Izs8n3Yl9nGiqBiw8p0y2Kp5V3t6FFX9mBeRWT0qfhLP3SYy2MRGtTtx3Y8DRR
	iccrPeWI4ad2RaalhygCc26NF8T6Vb5Za1UFKOqAcwQvTeAWNn2I03iSxr/5SyTlxpbp/Su3doORo
	NOfHWUbWSxQZ0oz2BMxRpPdN7C5d0AKZuGiEvqRswFd80MokQMFUvunHz0LHSAMmfDd+0ihKEArSK
	Iydkex1hdhgySIvhut+nP/wGRhpeeovceUdqpfCNkBVBPFgLfYIHoO9cu47RupQrE/cH/7AO9UkVM
	F+AxPs6cyQdCcP/41EIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDGN-0000000FRDN-22LO;
	Wed, 14 May 2025 14:39:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCo1-0000000FNCV-3fpX
	for linux-riscv@bombadil.infradead.org;
	Wed, 14 May 2025 14:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Y/YcSt7LXpLFIToFcWwcO2jaJLtudxyRIp4lpPUkGAE=; b=pNTzE/LJIieeVdlBpa09dUr1fy
	xzm3+NBRRQQaTY2mpKTbiWBe1srYRTfz7CO8APNjCE//d1bsRgQ2OOe/yN13BWaFHRY0fgiSGDMS4
	7q5AeP+/slV9+NWbgsURv9mZuoqQOcEkGCyHjCxiGZMOlaLTMgFPwdftrAShCKLhoyw6vP6c80Upo
	l23G/NWpnx5pwydsmA8BNGntXMKiVYLiAHoh8nQ9eI8frr/O8hD3XaYFQl1rZKU3xOELqfEuco38n
	lIsLeMiiQPhwOdNX+lajx8G+uga+6PaKs+gfkViJgeRTW96spQL31RsrxsC3xid8caFXArYLWJfAH
	TvmNoOOA==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFCny-0000000HCr3-17Gu
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 14:09:56 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22e7e5bce38so72385885ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 07:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747231791; x=1747836591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/YcSt7LXpLFIToFcWwcO2jaJLtudxyRIp4lpPUkGAE=;
        b=Zt08dixJ62XI06onL6K5wQ5tqbG7moJTvDnDaM26c+iWh+GgiHQ5U+0/TL3JKhPzJX
         4CQZWyhmOZTP4/z1FntLiijbL9u/a5pkUkUxxudYv9xbKVfYIrsAp0wltB7Pi7WP4iJ9
         P5UTq9wBhWDhxkEctMMNzaTWPC0khKZ3hQlAyOuICxqUjzCAIY15hTiPuLDO5V20IvHK
         DnDPxv3MF//m4/7nRMvh1KkCfkL9TY7lNIFVs6bR1FOlM5S3G/2ftj1HXG2a4ShYmRlU
         ZkrCYv0MEIYS+clvWGecccWNcZo6JmWL0/eqOwrAS8DRiqd/ZWEx3dVsjd+wkr0jLuVM
         7wEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747231791; x=1747836591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/YcSt7LXpLFIToFcWwcO2jaJLtudxyRIp4lpPUkGAE=;
        b=egWDaivyRxTOcJLodzkLYryT3eMgTyEE1oRwnxRUD0U7yvKe5NXrEt497zjdERGW7/
         mbTtwHPaJwv7So6zWjTL52veJnoKmNWR/14KQJdydzwbQRdpOc7bxkTAxEIUAZDOOJDI
         gnKEsiUKkwWkxfI/uYS6F3kh/xj/WZDyIp3agpxVoe4tXAiQXFaOKr3/j8QKOXonSiyV
         uk8T2Z9QEhqhDAfCrkWipWbOWOr7rjoBQtWoJYN5zArefz045iowW8Z/isftcI8Fvje5
         aYwkKoizQ+rsDOzV0vnN0gCCfuROgKuR3ffIGRcnob8jYpCSY8onWf2XhQ6OrC+xm0Lc
         SLqA==
X-Forwarded-Encrypted: i=1; AJvYcCXtVWlHBTFAfaDA+eAQyVR6RxsnZBJwRPrZK2Y4UyURs1FHqmoM9fYOwoyuG3YzMY8VPgeJrx9xCzyPKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YymOfj72hIqIhxFcQMHgVF1umyuZec4Z7a8wp5P5g4A/51pd04/
	3MQdNXO3KBp5eE51OUse/5mlcF0Jr96bu47V0omplg4R+4IaKuqK
X-Gm-Gg: ASbGnctseQIsOljjVb8rpxhdefJyrIDlfBciz+/n7e2dF8j9YEJ6/WYoPj+TySKWJF9
	lnTxK3TNwNufzJY93rs3ICmbx7AusmH8jHUEFTi5B23bw0Q0EolbssRCrL5yBqL8TQbrEtXMeXN
	0KrvIc0oemA4OWT8vcBoJyNaZAQ+6424RAD/bbtHM/pekjnwH/ZzglxlqJvrbhDm70wXSMST3Ae
	DLMdrH8QDLF3a7FZ0vLO87yhJ1iaokwD0O58O0IO4lT/bWgku6C9hFw1cU6d4qWiiejl0J23pSX
	UfZyn3sHlrUI4oT9DR/RiuQbdZ/j4IJnCA/Aons0s8WxOH90BSGdEihIvh9V/gzTGMuT93Y9
X-Google-Smtp-Source: AGHT+IGE6zR+71PFZJvXrrGxXGU1Je58bhDIMNTpwJKTTEpQE/rNBSGSw+vM8hybiqYQ87lEF5ZG3g==
X-Received: by 2002:a17:902:fc8e:b0:220:c067:7be0 with SMTP id d9443c01a7336-231980bbed9mr43762735ad.6.1747231790969;
        Wed, 14 May 2025 07:09:50 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271ae0sm100407975ad.128.2025.05.14.07.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:09:50 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: riscv: add Sophgo SG2042_EVB_V2.0 bindings
Date: Wed, 14 May 2025 22:09:01 +0800
Message-ID: <dddabd3bb2c718a506d2b6669a8252cfe3872fa9.1747231254.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1747231254.git.rabenda.cn@gmail.com>
References: <cover.1747231254.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_150954_462372_86FC3E3C 
X-CRM114-Status: UNSURE (   8.61  )
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

Add DT binding documentation for the Sophgo SG2042_EVB_V2.0 board [1].

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index 6c82f89b56ca..cbfd07cc053d 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -35,6 +35,7 @@ properties:
           - enum:
               - milkv,pioneer
               - sophgo,sg2042-evb-v1
+              - sophgo,sg2042-evb-v2
           - const: sophgo,sg2042
 
 additionalProperties: true
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
