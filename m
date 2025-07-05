Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4573DC8303C
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jul 2025 07:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ftERf4gBNEv6+Sd1oGwFPck+alKryh5/Vf/pQDCGnHs=; b=mwnCxNMOgAbSx1
	j2QQj5GZe4Y3rXkkMJ9AT4qcpWwLh/EmJSfvLTNv5hBLUjNs0TZeVIamqKDde75LC3I8MStRBsgZp
	yOv2D0Z71G4qe6HVA7smWO2EEl8kMs1LyQPwB5kR3hSJKDsh4sgGKOOjLoW79HRkI398PQH67Gr4o
	WhryRB1KAxQoDpasTqsopMMCj7kyfTvGOian2qK0XtbJQLlNaZvVFMFIhWOqmSu0rRysZwXsuwVYz
	pHez7tUixclLeeA3SPKvP0j7UWE6OKotsdTNzrFBYiWz/awg4TEiUBheWdcLoaA7RpZLRmTdjdsQv
	NKyw06xwsOymGrgnzrqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXwt5-0000000GAfk-2KQ7;
	Sat, 05 Jul 2025 07:00:39 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXwt2-0000000GAfO-3g7J
	for linux-riscv@lists.infradead.org;
	Sat, 05 Jul 2025 07:00:38 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-73972a54919so1367943b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 05 Jul 2025 00:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751698835; x=1752303635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nssAUAlhMduaAjfLKEY31UHSStHFXQFJc1UCeUJTUOU=;
        b=kUy5XUyy0OORjFBWyJqlgCiWFhe/FRt4NzJjHq2swUmZTROdrINLwxtTapTp0IGCWA
         02kxAQgC9eUbopOlZlj4mjKew93nPj1rLGR3+yVRkApoMIBaoG0naAYcTxo18KLtuF3Q
         E8/T9+cGgdorjoqgjequICTYAEkXoold8JdTwlZlhX0/mHjO2y3HM2uZFd83ClwZ78mi
         qTP+jbtU1ys0h2sXOQvluQarK0bX3eVpl23UPC3oBY5LlPNJIENlqWRLk7Plq117rjhg
         482mgbsORm4yd7ZfvWiA4Uq73CDm0MRaWvwWmmeCD93cx/Oc44M8FR7hn4oxpdS+a/6T
         zIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751698835; x=1752303635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nssAUAlhMduaAjfLKEY31UHSStHFXQFJc1UCeUJTUOU=;
        b=k8tpfcLzQ4NqKwnBPLjvySx/ZsS0Xtxhsx95QLvQXOvlzz9hIcpAytA4xZZO1FINUo
         f98E9GC9Qxe+m3sniEP+L5tue92Po0V6ZLt6wEjrlz3zKkJZ5FhTeTN6JlXpoFCzGOxH
         ypEIzjjO2KzLiBcODdsf6EjGPEp9Bi7cTyBJlfUfO9v7x6NHcHMDfDDPtxR+WdF/9B9Z
         VthNA/rJp5xoGIchwxkTVJY1+NU14thTovVFEZLZgxCi9Y/j56iD/ilJpRoD6iYDqbbR
         hr5PLcBmsQreZ7W7+paj5ZYY4HzmNGTymhhTi0zC1balk/G9gX+sDrw/snExNOwQn+MJ
         qLJg==
X-Forwarded-Encrypted: i=1; AJvYcCWREle6ONqNIfHgq8yLmXX76OwrLHrj9pS2HhmqAoq8pbDxdtN87OjmXrXJjigmqLzWqBPHm+2LXX2E6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqli/qf0JmF2cmxaqOg6O01m3Q4G6B7wli0iSE7OMZUBo44i4y
	2Man5/dIvhwDnNmHXnRHlaGw7oXVby+bRffaA5DzSdl8VSEMZjESeR8w
X-Gm-Gg: ASbGnctrtY0N6RrD4if8MOAtFsB4kCjUyRjVuAM3ijmgMUIOL6GoWF5R00f6UJYkXlT
	aWtGMtAdno/UIMhI3smsnJPRauDJ7WJ4dte4SdbRm4foOpRz2xRVEsJPw1eWjFHJTK2QJeNY3Cs
	Xseyz3q1FXJixFXLxF6sd/iXAyfipnThKFqbW1Of85hRdoNnIPd3JQF6HbIDJQOYvc2NzVcZl/V
	6UUxLl1DYtfHYFPZaESfkqyy8zTrjDcEMN0psryeiNskh0sxMy2itSHk0UfCo+V1CWo0MuL0HXJ
	USgwioF1WPg3FIIBURHOJ6rm5fpk/wBfPYH2ZUv4fGiHe3Vxff1mXOX/OjS52II1q6YYVbHQ
X-Google-Smtp-Source: AGHT+IGvNv873ht3zYXKYDK4jQOR12YQwVSFK97C52NvA93Agip6zuoIuhrdkBpAwe1Y1Kc/3dsQpA==
X-Received: by 2002:a05:6a00:928c:b0:742:a77b:8c4 with SMTP id d2e1a72fcca58-74ce8824f1bmr7863083b3a.3.1751698834683;
        Sat, 05 Jul 2025 00:00:34 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce43d5186sm3638341b3a.169.2025.07.05.00.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 00:00:34 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] riscv: dts: sophgo: add more sg2042 isa extension support
Date: Sat,  5 Jul 2025 15:00:11 +0800
Message-ID: <cover.1751698574.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_000036_918281_50B5BE8A 
X-CRM114-Status: UNSURE (   6.08  )
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

Add xtheadvector & ziccrse & zfh for sg2042

Thanks,
Han

---

Changes in v3:
  remove zfh in riscv,isa

Changes in v2:
  add zfh for sg2042

v2: https://lore.kernel.org/linux-riscv/cover.1747235487.git.rabenda.cn@gmail.com/
v1: https://lore.kernel.org/linux-riscv/cover.1746828006.git.rabenda.cn@gmail.com/

Han Gao (3):
  riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
  riscv: dts: sophgo: add ziccrse for sg2042
  riscv: dts: sophgo: add zfh for sg2042

 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 384 +++++++++++++-------
 1 file changed, 256 insertions(+), 128 deletions(-)

-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
