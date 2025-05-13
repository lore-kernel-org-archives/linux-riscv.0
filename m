Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7CBC3ABC9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 04:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJ9IFmeVJeO1x6ygh+hD1BcqfRg0IBHZNDLH7aEHAJ8=; b=lkv5wGOzq52lG5
	l8khrUbiwNn1TXK/kK89SMd0eGGAlObJ44hIl1ogrzg4KUHBWaCMtcE3AaK63DZEstCSO/sjDAQNB
	0avTYDB4obmQDoy8XFMd0sN6AjKhmbd7TNzRS+FCy92HviKEO2k8XhgHH7DUq1KkHGT8IGZCoi3jb
	OXx3P1IbBbbf20awGZt67tXGbbiOw6IL4zUHlL9npaKtv4j77VY7Cj+RrexM0F3BRX2mo1QSX5rbI
	PXo3kBKGFBHBOHZO/iUKLzklWwGiURYcIy901GuD1WYQAPdO97OSqA4EcSEGSyW4SnrW9gC7ivTs6
	Vi3V+Jb1QryvbFvAFelQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEh6n-0000000BIfL-2kyQ;
	Tue, 13 May 2025 04:19:13 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEh6k-0000000BIdO-3FNN
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 04:19:12 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7c542ffec37so620744685a.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 21:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747109949; x=1747714749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbE8qOEQ8Cewj2pW9YzTwebuhpk4BnHjgjL+T/zo0qQ=;
        b=UbTFPPWOU5XJVXAnlRoMN1asCY78TW+4Q/nMNZ9Am7oq167hqQPe9hgKgUgfSYcNK+
         clWMxyMPmCtS8JTXXJMipM23A/df0OuXHEVaWlFOx18z3mJvnb7z6FLZbCt6vfagE5MO
         ujuwtyp3izUqTNcXID6ubVcGVjGqrod4G1/rZemuldYONDuOmqFnsbeeG/sGJZcyQF/D
         6H0TxD61ZTgo8VFuRvH38ZaksE3eLGnY5NcYMvpXllXuLSEfz5WlM5Cx4PKNDQCXy3UA
         CCzcSlNvW4vd4Z9mpmm3YD3Osvxd0VZbawU+TNjgeeh1oHmL8db6WtXVkq4154vddPd+
         HfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747109949; x=1747714749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbE8qOEQ8Cewj2pW9YzTwebuhpk4BnHjgjL+T/zo0qQ=;
        b=cKNDT1y4i5tpctI2chP55KXgHwzJtCHqTtnmw00cmaXnGGqb2FfBFgqwylV4c0HGqE
         GMROqrDQJTAbZde/bujPE56ij/BvZb2xhKAs4imV/FtcLvwqg5RcQQd87B+PnLQkyqE9
         rq/SruElKiuPjqe8TYLJfIXSHJtg/VfCRdHhViQCgprRVfA78rrbVjZ6tVXofTGPxdJT
         bmQPN5eaOGJmypgauuHxV2bX5DfzH5qRgoJPYzu9sEcOLr5GTGedVGw7mlNHsYrJ98I6
         5y6fUtNOfz0M9Oic2sxorKAY+VpjiB/F1EnVrtKy8jCQfkPp7Nr5yU6hq+le994bY8Pb
         6tIA==
X-Forwarded-Encrypted: i=1; AJvYcCXxpKH7Xr7UWsSqIz5QVvw6oS/0zRaadb6PCNcZ1dCJXlyNtz4doueTtmk4W226/dEybbURnUrlgV9+mQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFdnuISO+qaZkLB301BF18FTAFZpGhxjuN3JYbvnNv1CFuRDMW
	2VhqP6dN6s78DDSIvsTkU5KR856E6nxrOT9sMACpT4OCGddq9Y48
X-Gm-Gg: ASbGncvjzshPzvziDpSp/it513oHdJyroecgvIYK4VhlFf+Yo6cgYO0sInd7oTB2VnG
	9fr/BkfBR27+IMqRItLOfNmJsmYgblaBpRISmIeh1THVHOqmRjeR85iwdfhgua1mfh68oSNk/b6
	nYCQEg5LrCNh/GC8BmcwTHEhLuhOsKn2YLIvpddWtZ3OpeZ+Ik4efztkgjXbIFtrFMDVfk6T9W0
	LY45ET2SbSgJzXPKC3i6XipzJ0hcFpXhTAhc42UyIg90yjf7HyH/EFfnB/UWaYIezmMGB8tw6Qm
	r0SwJeFtsRY/HhdYC0IeXjM85Jw=
X-Google-Smtp-Source: AGHT+IGaGXEPNSY7gDD/YfTu/S9mOVv0B4S4N0WdSovqwATeGF5yrD8SEU/YDNwaJa71opCgKDqwWg==
X-Received: by 2002:a05:620a:40cc:b0:7cd:1ebe:9ad8 with SMTP id af79cd13be357-7cd1ebe9b28mr177227385a.10.1747109949442;
        Mon, 12 May 2025 21:19:09 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00f6423esm652274985a.30.2025.05.12.21.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:19:09 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v2 00/10] riscv: sophgo: Introduce SG2044 SRD3-10 board support
Date: Tue, 13 May 2025 12:18:22 +0800
Message-ID: <174710989164.597941.2410446871539052309.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_211910_812430_562E05D5 
X-CRM114-Status: GOOD (  10.72  )
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

On Mon, 14 Apr 2025 06:34:54 +0800, Inochi Amaoto wrote:
> Sophgo SG2044 SRD3-10 is an ATX board bases on Sophgo SG2044 SoC.
> This board includes 5 uart ports, 5 pcie x8 slots, 1 1G Ethernet port,
> 1 microSD slot.
> 
> Introduce basic support for this board and Sophgo SG2044 SoC
> 
> Changed from v1:
> - https://lore.kernel.org/all/20250407010616.749833-1-inochiama@gmail.com
> 1. apply Rob's tag
> 2. patch 1: new patch for grouping all similar compatible ids.
> 3. patch 7: remove unnecessary compatible check
> 4. patch 8: adapt for the new patch 1
> 5. patch 9: fix copyright e-mail
> 
> [...]

Applied to for-next, thanks!

[02/10] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
        https://github.com/sophgo/linux/commit/1e76b39eda76f7317ab75dacccaeda5a5b02c519
[03/10] dt-bindings: interrupt-controller: Add Sophgo SG2044 CLINT mswi
        https://github.com/sophgo/linux/commit/a3cc46f7925b6b48e80c70815e3f637abcda77b9
[04/10] dt-bindings: interrupt-controller: Add Sophgo SG2044 PLIC
        https://github.com/sophgo/linux/commit/a7470f20e271203494b4cd427e687c12649f0087
[09/10] dt-bindings: riscv: sophgo: Add SG2044 compatible string
        https://github.com/sophgo/linux/commit/9ee1f97cf3e1743591ae76324d96082c8fb496d8
[10/10] riscv: dts: sophgo: Add initial device tree of Sophgo SRD3-10
        https://github.com/sophgo/linux/commit/c8b1ca99c8485036cefa962aead3a0c57cb27d3f

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
