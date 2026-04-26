Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E732BFF885A
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Apr 2026 01:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AN1ff6XGvxxCQIisr/dI8ktXJcz9kzWpXcTOsgJ/9Ec=; b=kTVhSP58iG7R6k
	kFPQRLcxq+CkVFAmGBRbSm8fm5oi+65k3eOumel5PmVZ6cZHtGnEFcA5oD3lP3KUilCaSpFzZqz37
	fufXogwYXj2Cj6zgunMtVlwzc7Wb3gijzVgSAmEH7lYwcv1Nk3dUFL/JzzzqOomIzjG2ujgbiFHpH
	6/WkXNNqCzwWlwMBj0ejWOW4jl3I1ibHBzh3OJD00xzjvbGbzRaPALbjR+Mxm1E7rgcvV5+NF+vqI
	idIKuyHM5XBCXN9AZ7lVANfu2XfKLrMaqNPniRPYoZ0gVYizZFvDgcAbn1vF7qsZHm7Xk3PRQrQMM
	5mEQdCsfxxeQeiheSvpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGoOg-0000000FAPj-2lDY;
	Sun, 26 Apr 2026 01:34:58 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGoOd-0000000FAPB-2l1G
	for linux-riscv@lists.infradead.org;
	Sun, 26 Apr 2026 01:34:57 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82f943870baso3683756b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 25 Apr 2026 18:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777167294; x=1777772094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQlX97El9hfOHAc6J0vlS+XAoLtlpdMNeOx9avsuntw=;
        b=o3F2S5Vg90BOFvWAFnyuyKo1idv62lmtzjWK59CFiyi1l8Jbk2eWz/yXGRjK317Vuh
         bHxWqhqZIRTF50Qqck2WOzDsBAuQ5ak3Y12+BtgSOVcj+GWMX10lKt4h3urVpWcc9O58
         z8b3IMYsqnhUXwxWperSjKVxFClIMBT62rigpgfW3Qhw6uV/b5jwNX39gWIL8kAatqUU
         sR6eb4vLKbeAmdzAEOxhDz+uiEXdxNHyQaNxexhDGlbGKhnW1YAj387KzCs5mUJpIJtE
         +/WjWfnGZ2kk4LT+NSp2mZSqEzVe0xTuHtIYDqygw051qsbK764Iop8QjvHIuwLQxyfr
         +P7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777167294; x=1777772094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQlX97El9hfOHAc6J0vlS+XAoLtlpdMNeOx9avsuntw=;
        b=Sz5FJMnuicNyOyNzO906iH5oVKEi9bH7iIVeEIHCM5Zzzri6NhxwzEJ6rAGeF+ADFZ
         auVjZx1UbFy1pFNG377bF5+/fMS9wdn7NzuKjDa/ubMKp3zs5rkHBJHNNxIr0BivKz4p
         lCvaUagNACnQYq5jjzZCiRbZ9aFN6CpvTXmV7KoyWO3HIbXXjZthaEgFBXVVOc1GG/He
         QQh958mk8YygeGtUdFpmgyH9k1qOikU2ebYPwvRiREMsapZB2TWmEbXwvLedmX8iKzuF
         zSmLRmgGbTJlEafZi5fnwiNADKia8R2LApCLwfjAk9OvFbnVHns5Eu9cMkLdN/Rguaul
         BFPg==
X-Forwarded-Encrypted: i=1; AFNElJ8op3KvlJ8h7P07ZPD0UKKrGbXnuq0Vu6DjN/bp1U7N15YmTPpwdU95RqJFcpZNzihjheYiWWpystl3HQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVHnlpAS0l7Hn3gDDjNPlba2f4RVjW/RRmHUGDu05aGKp+pxmz
	wX41IpscYBwe2m7wi7fsRj2vxAv6bcajdkpwqRE4lNnQ9M7tI6U9NB0R
X-Gm-Gg: AeBDiesyG3Y9liqtE/8a82K8H2lrN4+mnm2vMiPMM2ssCe4TkphDRIQgRI8S3zqE1Pr
	PeO8YiqYEiR8ViSVARtkWkiaEqowkYl+r8KUFHQZp5H+4vC73ChQqX++nAf4p3448Uzm04ihlOf
	Ry0lYLgLSjPt9viESkfXtLayxkP1M+c85EpwkZgdwEMPZpboNAamSjYiwH9eE0UgpQ0LW3fLt/f
	hZBSa0YK41bksQm91DzgiYj0rF5eZ7w2leS3vNiDDbFI8ccrdrjsfBwN0SdsjGgPQWQEaYlXiGY
	gjJVCBfd4NzoJ59daNuJyNH/lsa/vHAcamX7oyEKZOj6fRvS89uNknppB6qrwQCcSZL8+EVwfrG
	ZxHofFra+tqW9SgoP2X+5EK3l7bn00TxMokn/tqXSQK4ccw4flRGZeZWDoeEGYcdHVS1b8Yk9SD
	ifGCqP2Vs+kx+muzlW+hCbP7Qo820oZtqXiQ==
X-Received: by 2002:a05:6a00:3693:b0:82f:4191:da10 with SMTP id d2e1a72fcca58-82f8c84d72bmr34897489b3a.6.1777167294286;
        Sat, 25 Apr 2026 18:34:54 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec06cbfsm32046385b3a.58.2026.04.25.18.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 18:34:53 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Guodong Xu <guodong@riscstar.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/2] riscv: dts: sophgo: Fix CPU unit address for SG2042/SG2044
Date: Sun, 26 Apr 2026 09:34:47 +0800
Message-ID: <20260426013449.694435-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_183455_697763_ABF99694 
X-CRM114-Status: UNSURE (   6.52  )
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

The CPU unit addres for SG2042/SG2044 misused the decimal number for the
unit address, Refer to this discussion in the Link, it should be in the
hex format.

Link: https://lore.kernel.org/devicetree-spec/00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn/

Change from v1:
- https://lore.kernel.org/all/20260406232655.144043-1-inochiama@gmail.com
1. Apply Guo, Conor and Chen's tags.
2. Remove Link tag for all patches.
3. Fix comment for clarification about node name change for all patches.

Inochi Amaoto (2):
  riscv: dts: sophgo: sg2044: use hex for CPU unit address
  riscv: dts: sophgo: sg2042: use hex for CPU unit address

 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 236 ++++++++++----------
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 236 ++++++++++----------
 2 files changed, 236 insertions(+), 236 deletions(-)

--
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
