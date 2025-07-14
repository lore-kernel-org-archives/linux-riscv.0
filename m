Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BDDC83F17
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 00:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FCoYUpF1RZb8dAXb2bI24dmdM4AioSMadqNWZ9saUHU=; b=1RBofzR+RVFn5x
	/HmjHpDRdqV1+NpP2e4QboB2AHXOg/LTRy4sgKhWUjYTxNwfB8v0CO6Bizeqcz+td0FxMao+juP76
	pGiRgTzuUrFG0+Kg+lZ0JQMLxoQomQqPlyL+0WcTgag7Za9MfPdGPBkW00yQji/0ktSEwtli0C6/p
	ZjBZuQ87SnJF5UmmKkurYVgyWWQBzfkDxEQRjHBYwJ4iCMTRtiTuBqB43+nh3n3HtT+x3nJLfF49n
	bjxiJPA1XI7uAXscDsrkj/mtJ1FB6w5lRdlyNEdywejUGnSa9bAf8mYJolqsYNoCj2F9kMzTCpXDJ
	hRDW4hhBQEF5XhRzhqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub7Ma-00000000qXC-0vG4;
	Mon, 14 Jul 2025 00:48:12 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub7MX-00000000qWm-0xFd
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 00:48:10 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-234c5b57557so35934645ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 13 Jul 2025 17:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752454088; x=1753058888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AE8gcfRQh+HMf4a6A0pf2sS0KbyGC33gzglhO7WkKO8=;
        b=EAIcVLAlNOPqPiMum8XHmP1Ae2DJj6Tn+HXqlbd1E/Ad2uTkrOyuK0t/lC9q2aDRsd
         A5sE2KwLQF8qYJpUX+SRlPAUvEfZOYpVWL/kwov/exptvShdJIlPd+zj3DnLkbaoO+xp
         DtzUcBRCWruQZPTPB0jCdF/uSjiFp0ZUAWwzGUVescW9KjCLfKGvVkc1Zp4HpoTXCWbH
         tXgGL2AbFs6nOBOJe61XthPQu1Fq/O8f7IzOz8QVcgNbuvcwAD5JuXisrhuGbk8Lr8oj
         VQhd8+PgunZqBz3DlE6et3y7NnToTAkJk8XTyWxeVwAEgXjNFs18SFLa/iHcWwW7DQne
         Nn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752454088; x=1753058888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AE8gcfRQh+HMf4a6A0pf2sS0KbyGC33gzglhO7WkKO8=;
        b=Ownqmbp3FSkJ5k9MyOzAHRbA61EMby3c3Nu9WaJHE7GE/2ty2HDejd1qGzj1drff56
         6cV4+TqzlxZjNkNDlYK0qx+MFzOgiQBujqtJyhulxEjWPMlaZA+oBtnYj5f/xxEk0t2C
         591jIYld1g0NP3rPrYxx/d7O+/95UWJuC1lKiWK+8JZ6WinN1FV9565RrKeWgEvQmA79
         5dIaVbbrss9wEpdN9dSQ9Av/HGdVGPzblcuokN/AyF0WTEEu0N62GcCH+wa6Xuwi8FLn
         ZZkBSvgkaTBxHD/ZXyHXzAHY09EU8IJYRKxKiBSAy4i2Dygmv4yCntK7Z6//6Vrk5u/X
         GgzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBHvCJ/90enXxDskg9Hj1hkIHJFtme+k97lr5clGMwUjsb29zHQZms21IW5jzx06hMd3CiD35JPo4WCA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2jZDKPwdebvHWqWKDp84Q4sp5+AjKssNSyiUCNtQ+L8Pc5rlQ
	0XeFfdbtbSvwpcgzjwvIVVYiCNITJuE+KJjstheL0MaJt9j0Ow8f5Xc1
X-Gm-Gg: ASbGnctPi/K7SBQOOC5Z+9gvQ8ntVSh35VUocvOWEt/+8Y1c436G1tOl4b5qMq5LNvj
	ezgOdijSZe+YMcDrHByTq7nZ5iNdT6XSA+pOwt011kJrnox4nJAvAqbT2oquWftAItcb/RiROcS
	/WnflL80Yn9h6kix/ZszmiWljTvrpDWuvqwGP7ritDIivVMSbITc3CYeModVmyMZj2unxV0c7c6
	ichcTLuEX8Ok+AloLMPp3E8pE7uzqNtkZ75H42rZSJC3AUhqeasZe8bvITlnXrqepE9hQOR9AWV
	qAP8EnyzHVp1Qi7ao9qh5RvLqlllpYo23IulTNwalI4GkjhYetU30JRwHu+hKFOkSLljLEhCZgZ
	DLwFkR0ggSZQJ8QhdoSq1vw==
X-Google-Smtp-Source: AGHT+IGfTuXiEaw1ivPyHcSOEg1RjHIi71oU6RD2M1GmI7E+NQWCV8xxX3I9b/f/wLUPbWMfwnb8OA==
X-Received: by 2002:a17:903:13ce:b0:235:81c7:3c45 with SMTP id d9443c01a7336-23dee0de80cmr163437605ad.46.1752454088461;
        Sun, 13 Jul 2025 17:48:08 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23de4283a81sm81070505ad.27.2025.07.13.17.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 17:48:07 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Longbin Li <looong.bin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH] riscv: dts: sophgo: sophgo-srd3-10: reserve uart0 device
Date: Mon, 14 Jul 2025 08:47:49 +0800
Message-ID: <175245405815.143339.9845329520923216196.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250703004024.85221-1-inochiama@gmail.com>
References: <20250703004024.85221-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_174809_273570_7F096AA3 
X-CRM114-Status: UNSURE (   7.50  )
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

On Thu, 03 Jul 2025 08:40:23 +0800, Inochi Amaoto wrote:
> As the uart0 is already occupied by the firmware, reserve it
> to avoid this port is used by mistake.
> 
> 

Applied to for-next, thanks!

[1/1] riscv: dts: sophgo: sophgo-srd3-10: reserve uart0 device
      https://github.com/sophgo/linux/commit/a3ec6cda33ea16e3b7cfee80a6278085948cb793

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
