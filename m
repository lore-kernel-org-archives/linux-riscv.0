Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E61EC0219D
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Feb 2025 01:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAR1F0AjuZ99bLpnLkH6PGBiEz8SwsGxE890atC9j5g=; b=Lz3BgaP5zEA6Zb
	VLbYWkMFypUWsgiOtodF+/f/7mYtX2b/8F5vlX53KxlloYuQ6TNTPDtMhvvPhIvRqFvRNM+kxyvwv
	4LgTPjQND6t/rKHOICku3yYXacU/ZbKkDy+xV588zZmTpYMS2jP5EvnKKTO1Vajug5jq4eR9aieoL
	hFT1XmkJ3PH36CaY3+QvkVCfXQjsqvy7k2hMYKFI3EXJqx6N0727ypHnt+YO37/095/8NWrcxAzAE
	LqKWB9tfDCkUnHzu8yTuK+Kx5/7uPQb3QB0l3Hlx1QFZTvDBDXEA/p04fi+6o7x/LruPtzlkck3rg
	yZKiBH/urvdCMxpxYn7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgwFc-0000000Drcf-10HH;
	Sun, 09 Feb 2025 01:36:48 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgwEP-0000000DrR0-09n7
	for linux-riscv@lists.infradead.org;
	Sun, 09 Feb 2025 01:35:34 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4717bb7e7deso6688541cf.1
        for <linux-riscv@lists.infradead.org>; Sat, 08 Feb 2025 17:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739064932; x=1739669732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRKxhZCOCzmEWMOmRJ3g2FeSCwaByEabS7PO0p23q1M=;
        b=QJjf1+IrrM27Z91fu3Sd6BX7A9xlt4C6A/lEpy7BJFrwxeyPKkRNErqpDZ1WDTct4Q
         XAmQIi08H/2hXrYtcr2poCeiZHENAET+xzt/nt/w60NEdPYJHcW9w3oNcrXrQuGzRXSJ
         2l5cjJ025MXvCrnYtS2dIrhpaY05pnNDuUQfhgyYpG2WNwR0a+kJd1nDdYFloK9ECcSQ
         ke5NM15N95l9rSvY3JTjzuhTfQX1QhYVNpLjn2P0lGd5lPdjhSqDKGq9nil1txYirun6
         AJ8ydvlQ8LEYXBfJanxLH7QKBb3DhdK0QSfgN5k6bOoryjTTrarbC3QXMaJjZ0c3L8Hr
         wEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739064932; x=1739669732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRKxhZCOCzmEWMOmRJ3g2FeSCwaByEabS7PO0p23q1M=;
        b=a/jQ6xb0k3HxCJedxcbUTQi4kI8c5XUWvhRfYdu4RojJ751Pv0FElJxot+nvTRu3La
         SGQkE+s0m1H9HdAhXjFUH1UBPe0aJPXyMrPwleS5J9AhaOS+UaS64wQRbBm9nJxq5Jo7
         viyH02EeJEsKxNXJzZbiO3n00l8dTvT9x2HEmindkqbaiXPb+7rvSpmzaeacBRTzGGG8
         uUFr91zmAtSnTjbTIniKepCvJtKSRenfbmHENuH62P0adG+lNvT4k8/0D3ynTfCSeMEk
         P8IGuux0doQpOHE/XHmVGAAmESa3mMlDq3cppDid/m2mJVX6N+HcNtCT41jOFC1Thqo9
         k/pA==
X-Forwarded-Encrypted: i=1; AJvYcCVeP9fwrLrUYvksUyjdWG7cqt1hxWbvZAQHwtT8peYRDujpEztKl8jGzQFoChzcbnw7/PCjtcL4qw8z8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEbUw6t/wSwzJjFN9l9TbyFHmHWLbV7LSClflpYwQTskFZtf+U
	/kJmO3qpLqaiH0q6+wy9RcAzzazHutQE8BzEon57wRDSz0+QgzVW
X-Gm-Gg: ASbGncuy5P0BiZWG0yrbqWMMCNzSvduTxpGpuk/yD6Ntj2e8WYk3tksqZaKQrFXHLIx
	HzmcxIiDCd6WkTqigjqHSLU5FNuizIUZnNK7yR1OQWbHbEfFqB3HxcNRTI7kbcVd8styY2v5y7y
	PL+K+9pTN0VUK8mktABOBBvMIyRJXlUcIRneMJ1MEG3oJwoHr7obydleD+heCUo5yNLtmUs0UIK
	3TnNlbuQ6dNp4VrVzB/dRo3j5ts0yQSKGAsY2q1RuzZBO3H5XgpbiQoHogUHd/XXco=
X-Google-Smtp-Source: AGHT+IG/BVHvdXAXof5qqJIuc21MLNDf2r+VR4zGQM6LRrXsfYAW+xMKs7Mf2rV7lWGzVoimw2X9dw==
X-Received: by 2002:ad4:5d67:0:b0:6e4:25ff:4bac with SMTP id 6a1803df08f44-6e4459a5cd6mr126757016d6.10.1739064931991;
        Sat, 08 Feb 2025 17:35:31 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e44f7dcdf0sm14316486d6.39.2025.02.08.17.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 17:35:31 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com,
	Chen Wang <unicornxw@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>
Subject: Re: (subset) [PATCH v7 0/3] pwm: Add pwm driver for Sophgo SG2042
Date: Sun,  9 Feb 2025 09:35:25 +0800
Message-ID: <173906491553.817664.3244041315572858075.b4-ty@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738737617.git.unicorn_wang@outlook.com>
References: <cover.1738737617.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_173533_078350_4C3464EA 
X-CRM114-Status: UNSURE (   7.17  )
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

On Wed, 5 Feb 2025 14:59:16 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add driver for pwm controller of Sophgo SG2042 SoC.
> 
> Thanks,
> Chen
> 
> [...]

Applied to for-next, thanks!

[3/3] riscv: sophgo: dts: add pwm controller for SG2042 SoC
      https://github.com/sophgo/linux/commit/255f83ba5c16b0f79ad0c46c69b2e907012bde83

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
