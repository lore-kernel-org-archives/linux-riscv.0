Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489C1C83F09
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 04:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VxHiKHwoiwsgHFvT8ndRK7kHfUzaj2QYjAZSHaWRfz4=; b=2AdK5PcujCNIRx
	tT05C2p6q4m0J/PZCmI2YYD47+AHRrINfsmM8PWojx3s+mGneyJzz5uYUw+ANbJ4d/iSRNvAnJNqj
	9+Jb8LymYLGdYoSKBeMpZv9tHkkUa37t7AMCb5gg3dVcF251qhno10LZrxfMbz+l9FOZggw0VdKbp
	OXXuKGLcQK+WHDhVgBLYz9rkOgAd9u2sqnYfQvK872eIKjqamutTLUE8xUnBSisDTYsA4XxuMcezI
	jzTwUmZu4cZYpvWGi7axQi/tkEcLBgybdzRicGSFjYfvjB0H5LK9BxkUf5QFLkPDXDj8pplEoP//c
	kJVt2G+GKHI1z46aQBGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZjEq-0000000AgFA-45ht;
	Thu, 10 Jul 2025 04:50:28 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZjEp-0000000AgEO-1ag0
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 04:50:28 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-74b56b1d301so374965b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Jul 2025 21:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752123026; x=1752727826; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7N/n4V1gD63xC4EXHv4+dlIpkFn7EZuSphI0w630ag=;
        b=abMbec5Z1grU/uDBG7ifw36sd9TNQslauxYIrxl7r/pBW+xIujTY1qDqDKr16aUWo4
         etdc2+jRD90VYApCPGqL5PQT2T5SaXTcdVzrzXuP2ZmhN3H296m8RC2oJSMZ1tSbT/40
         5n1jRK0eV0HP5PckfMdMJ7ALUi/5Kda98tKfPURTRoyrYxGgGYMxj9KQSStaurGLZ77q
         fJiF4VmNbu34zPJpS/H74Ks3pUf6kOfCA07YUhioQAj+bQ/IjZo0VZW7SqUMTI8CvPPC
         iDUy6ErQotGQQcoVDFJXxvhJ0kuJeawaTG3eyqZq2vx/hk6aurpuNj7f/ANZJF3Sqo4M
         pT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752123026; x=1752727826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7N/n4V1gD63xC4EXHv4+dlIpkFn7EZuSphI0w630ag=;
        b=bDrGZk/jCaUOtvquJ/eLLgfMcmILVX1/YMqa8WUFv3HccEp31l/Jlw/fLtC7kKQLNj
         vIZsLGVZmmNyicGMUZsGcsXbKIPqsx5ZRStZbSs0zcvccCixO8V/NhkWQ0aqvs+IgqMD
         qCKPjEbO7JfhPpBhRYZvTsz2iyX/lhxdw+0ZnB70IUdnZGb7UULwSGQyN5jsao5qowxC
         Hk5OXQ9dYuY5cXI9acv2BPBd54McWnBYazIiP86aJoPPdaEykWG3VyONADyQn/V+kaKz
         csHCJv2V2eESyZcVJJBEUf0M68Nd62vjS55IgMM5cNRXZJ5jZF+iI8SZHjWpS5h8OfU/
         MG8g==
X-Forwarded-Encrypted: i=1; AJvYcCWGYrznL8E8SNZ3oANXu1lhrZLGZWibTUM2X1Mdhtpm8YODB1dpyvkMAug3yLIDxteM333RZ/MG3jtV8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDLp5dyJquS/LAZIzFMhFm/3tzIcIZKc8ouDYOtwm5srSSawS6
	k6G5K/gRgG9o4+S9+7qNH8W9NVfdUW+TQ1vZS3Rx6eemTM6LDKqxAeGP
X-Gm-Gg: ASbGnctnPYOYeOfiYlvoWfSsHhUkY79Zb23RLrH5x9vQJaXzmSDKEYNJwQx2CMQWRvL
	LK+HBF/A08bSYA0jpM4TZD+5FXFg7AbMeh5ECDSNnTh6q2M6MlT5VA0d2cubDbkc74TRkGCMdHU
	MO+e2FYeIzP4qBP8XMmFv/cC0qhDe4pyqA4jnJ1P9ItW4i9Tv4ORhxumjQ8+JdNUa3tM3B5F+nU
	UP46lU949Y4WTYFp/NTqbvPC1ynbz/w9ufju+aq7xJosf+7xpjrF/p9k2Q8eIJ5gcyUpRSExEzO
	TCMU9aKPBAFDY3wOBS9uLctd+Uj0Sn48KQFtE/Jigj+3m7Sndpn5sGEtV9WNdA==
X-Google-Smtp-Source: AGHT+IHuOp25kVX40AKI+YI7J3pVcWxjA+P2rjstauIuq/UhiYjgiNwjgAfEnySBXpD5cfDnLEReYQ==
X-Received: by 2002:a05:6a00:2d06:b0:748:f854:b765 with SMTP id d2e1a72fcca58-74eb8e84e50mr1962266b3a.4.1752123026300;
        Wed, 09 Jul 2025 21:50:26 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74eb9e069a1sm850099b3a.46.2025.07.09.21.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 21:50:25 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: sg2044: add pmu configuration
Date: Thu, 10 Jul 2025 12:49:45 +0800
Message-ID: <175212292373.416883.8963674402175536459.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250703003844.84617-1-inochiama@gmail.com>
References: <20250703003844.84617-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_215027_415413_3BA3B17F 
X-CRM114-Status: UNSURE (   6.68  )
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

On Thu, 03 Jul 2025 08:38:43 +0800, Inochi Amaoto wrote:
> Add PMU configuration for the cpu of sg2044, which is the V2
> version of C920.
> 
> 

Applied to for-next, thanks!

[1/1] riscv: dts: sophgo: sg2044: add pmu configuration
      https://github.com/sophgo/linux/commit/111ecba7b1f884133c53847558a8595294dc002f

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
