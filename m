Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBEFC83F09
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 04:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CHhPseCba+2SPZ7vIB+DU833ciPCqNm1E2VviKO+Pk=; b=r/jN1ySFlzINS7
	4cmaC+C55gYttfmnLqt+r2aR5l+aDTov8pXF2liBJXuwEE6MscAOi2gMZa5SYFwF/LtLyE+8H31wB
	HFQNSg/qwC6+wf3n1wawhZPiXJ0AP+MFn7GHH8pT1OKu+tIfMbdRprL1OuzFYAikoVKxi+Hbdi7aE
	p5qk4VOxODLBt2tEmmx9JtoCEZowvJbtSYLVIwcC80qkqj+P/xAwQsxvAQeGlwXbkrWMWiByJhyNt
	vxkyB1c9KLHhYCkjM8VGXjuHG/KwGJr7OuuB3k4hs2R/t3TajCJHYfq0pTkJVeJiR/J8H+J17J8Lq
	vTtR5jLJ3ZGYZiA2265Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZjEw-0000000AgHp-2UQ1;
	Thu, 10 Jul 2025 04:50:34 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZjEu-0000000AgGL-1HLs
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 04:50:33 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-235ea292956so6339875ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Jul 2025 21:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752123031; x=1752727831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGHzgNL4+vgpSA0H+m9gA8FMtg3Ii9xrQRTg+31D7LY=;
        b=ltYWtlOGrbY89Y4mnatmzgO5SQaBjZGBQ+3NSeI1Hd/9KRYGjAK9tGzSQtGSi8vr+0
         jIItyBFa2oHQDWtqjwZUHI2hLxqfPo2hRlOUuAyAZLJRx48cnHsTeLHx9IBDhyHVlNPF
         SRsHrbzeuIkp2dpI9AImjL+5tQs7R89K6TswsSPLRahbtZZPdYqsfmxJ6QBseEDG6MMV
         ob1oeviwC326j5Glkr406uwKxctDTQR/lN0nbq3IRwIriI2Zuwd/hyczaQTBYeQ3UhFB
         uReQ/dwZaqDVI0OOH4sE2sQZXXa6Sv6MX+xHh5v6DtKM+1Po2lQB7vNffR48sDFMjqxE
         zX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752123031; x=1752727831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGHzgNL4+vgpSA0H+m9gA8FMtg3Ii9xrQRTg+31D7LY=;
        b=sqMmGO1nm4Rx9IDBs7SwRavA6EP6UIEMjhcmYVbfD18VjAm/jqHvUl2t560NTWBZh1
         0YW3mQOBGvoZYTsZkyAJHPFelL6k5jsy6YEEv2S7b2atPgo3rGWuOLB35FgZ+o10QmDr
         QCKY8xowkW1boZGROLI2cPQHyYAIfHfTXLm6dFOc9zhX/6Pstqf4b1XEO8ttpsZ9cq5w
         b/VqRR1/MTouBquvKwfhB55WrzlGY3d4q6z+5LNeF07egNOcgxZrI6uYfdYEQiSeNWcN
         +FbW7k2FWrQjd7cuqHBD0bSxtWwkTNesQWDsWbKU0U244FIRYKbryXdkY6KPfT/oZz+K
         brQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3gY4MCGy3dZ/sZQqzHEGdzNIuyCF46BCNsrbRVj9O42yUtUTMHjPxs0PY5n1BM59v3cHggNZRjaqirA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKjotlp/EeVO0t7Xv+xH75iCLlxz4ChTnr3jSWJsBt1uBrRovZ
	fR694HO/7fweT/ZAqNpYgE1jRH32qIFMoh4q3pBJylNN5K9uBIrZ+3AJ9XsPUQFZKOk=
X-Gm-Gg: ASbGncu7DvQCfIJG0K4a+4TdZMm8Mi2qf16hgnpAI+tmmi8Rk9Bk4JaNdj6cqpfD+Py
	eWJbvJzCRnUSmDWTMYLb15M8JGtAq8S8Pvqo/zYDnfRicqWIvgdsQchJlX2bWLWfoP6IiNdhbpa
	c+ttroVOEDcb09Tg9RadjYPJh8Z2rzyJvqiTjK4UEWkJMaJC3KP8J9BoXBxbols+LXrsfVYnNk3
	yhTUdkdb3MTSPTeCDMDnyTWDZ9Xr4FZvSV8iHk1VVAgI6mwWeT4EY4Lrh6W2F9dU+PBbYx+wiF7
	431T8Eqgf7iUK1RO/v58ZoabpP35WiKq8b9ZqSBPMiIHkkbiYJDjyIvRo0aPpA==
X-Google-Smtp-Source: AGHT+IHXOFRlJemTmjivVF6ysNCWCNLeYhGM/RjPG780mLaRyKh9lGj2s2LpZf9AP77JDjrcO+IkNw==
X-Received: by 2002:a17:903:3b85:b0:235:f70:fd44 with SMTP id d9443c01a7336-23de481bdefmr17144405ad.21.1752123031495;
        Wed, 09 Jul 2025 21:50:31 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23de435c238sm8530655ad.234.2025.07.09.21.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 21:50:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Han Gao <rabenda.cn@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: sg2044: add ziccrse extension
Date: Thu, 10 Jul 2025 12:49:46 +0800
Message-ID: <175212292372.416883.15637532130862457065.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <0889174f2e013e095b94940614f4a0a6e614b09c.1751858054.git.rabenda.cn@gmail.com>
References: <0889174f2e013e095b94940614f4a0a6e614b09c.1751858054.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_215032_340079_E7A51898 
X-CRM114-Status: UNSURE (   5.75  )
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

On Mon, 07 Jul 2025 11:15:18 +0800, Han Gao wrote:
> sg2044 support ziccrse extension.
> 
> 

Applied to for-next, thanks!

[1/1] riscv: dts: sophgo: sg2044: add ziccrse extension
      https://github.com/sophgo/linux/commit/b1d1810649b9d912c7990ff479a1c0f4c75610d9

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
