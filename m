Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5DAC5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 01:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8qgDlu5sM5+iyNO28VOGjFAFKKVNFGjZY8PtEAcMNtU=; b=Jvxb4YPdwZg3OW
	UMqLvDsIQKqK+62WruMi/7STQSlh006tuDnhciTLpFoJH8HhSd0lszBfwuupFWOPC8Mb5vP9zdxnn
	L9VJFTJ8Ahm5yao0K9MOUGhWVwoeXqBByd5bDFHZU79XmmDzFKOkUvflvGulybC97e3tw5Pn0ypnH
	pYyYrKvQiFmbrgmZn1ZNPwCQffPaDYcwx66awDfPI4nTsSJu4j8qk0juAgAeJXqiafhNa6cWmbk4v
	towpvBFc8T8UUxJvcy2/hU/V5xdK2ZAEOH8nnjmeCP8xXbbCZhtlgG7pe95puNk2H70IxEEl4BCT3
	aMQd8Bgoe1OzM1KW2clQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOoD6-00000005aro-46ls;
	Tue, 10 Jun 2025 01:55:33 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOoBz-00000005amg-3kAH
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 01:54:25 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7d38b84984dso359548185a.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 18:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749520461; x=1750125261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zysQkTOL7VgaSXw9pls6ruJyOkXSEGdyuCbnLSDDgu8=;
        b=JdFPo2WoN6+/LVgzPLT232dexB0QCjy4DwhJuweyY/sfhUnMwN0AH5SmB3fPV/L7gM
         uPv212ScZemjLxRJRFuv269mWyTh2XCXeBdwTWVlXmc3W+g9GrR7t/mn4J8WyOVJL8Ag
         w0sj0URfvpvshzQTFxnVDzNDIUyPzzyccPaTjJTgu8mQ05XtJ7qHqy4q4+RTbEU4i5i/
         tIUjtl7ZVfYpIjp1zbydWnwYAel6XHXsjAucZiwf2DGOYff2VpQxeJtbczJy9x7UAEPb
         D3CIOA/Bo1w+BAVX2FuLdgq2pci+PXR8DhHAaU/LgGTVXm66I1JYoVV/MGjPY6lxV+Sp
         e5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749520461; x=1750125261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zysQkTOL7VgaSXw9pls6ruJyOkXSEGdyuCbnLSDDgu8=;
        b=xAERYkmmUCl9hQlTLRVv2hjGEY7LV8dgzP4o9v7gCNb4fLgvHIsJEpYnUp9X6NRDzj
         9WYHealhnUczef2HLMIft3vZCBnDsSupjVxBl6I8yn+iDAF+sOeWUZsxii0mdJQnQOEk
         clzZV1s6KAeOAoDy9rI8UJZ8HXScD/lTyS3kDupQHq9tRXZ041ymBLdx/M/JdXD0aMjN
         Xu8EE3B0AjAOfe08SJrivXL6V0/vH8SQM0aFaK18VsdFrvfgcZHNm2aGDMXhwNK0ihRC
         NFonYlpl0bycSyaVvYy1AwQQ3WOtPRZtul4N0PKuh1bEvbCdXKYNVgnTTstGyDMPkWVr
         Divg==
X-Forwarded-Encrypted: i=1; AJvYcCV/plQh3gXOWOIA3+3Bfkzsb+tAPBYoyGBZuXRLMdfHJKDfjX3xjidvKOp/cSNW1fyYu08nt1R7mIRj7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqGPujvbadOch5ejsqcKx5skPfoX0hQgRETRCI3hxTkcWud8N5
	Fx5DMWT1QM6qCTniDvbx+fNmS829PQEsoL5urdWpd3sm7cVo5vglxd4e
X-Gm-Gg: ASbGncv3+yLlgTNA5Li0tZaA1693DDyT0E0tt73w+pwsPhLZSHZlrSB6IKZ5b7294l3
	RGg0JKFfNlgJckkAym8EbrUOnV+VeTjq8ev5XUd1HEwoyeccvtrmI7a3iknRvc6si7BND9UQ8Pe
	A6Ltb+d57r9k8hf8fBaOnSbx9CXR2grs9SsbTyV3QXcfxypfekU7Cfpr24mK6vgyuZsL8AaRm39
	ikDRS/don8BJuSWzW1g0MPIDpTf9zpE/hOPAB/IbRt2xJwyP++cMsOuBYVf5Nx1ulDH4bNkI90I
	0aSbd+2ioVCd7kHbAKHtzQ+YCv2I+C6DDFQto2aZgyqtPBAN
X-Google-Smtp-Source: AGHT+IGJg+//Ofhuk923r0pXGjvlOiPdRgjYkQEFmw4lkzq3etJ3xBBBD+f4KoaeRoOYtCBqhB6xhA==
X-Received: by 2002:a05:620a:8b15:b0:7ca:f3c6:c0a1 with SMTP id af79cd13be357-7d2298ed317mr1921854085a.55.1749520461458;
        Mon, 09 Jun 2025 18:54:21 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a61a8ebsm622857485a.89.2025.06.09.18.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 18:54:21 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	sophgo@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: cv18xx: Add RTCSYS device node
Date: Tue, 10 Jun 2025 09:53:12 +0800
Message-ID: <174952038849.949885.15347540485983948845.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513203128.620731-1-alexander.sverdlin@gmail.com>
References: <20250513203128.620731-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_185424_007867_8F0BD31B 
X-CRM114-Status: UNSURE (   8.13  )
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

On Tue, 13 May 2025 22:31:25 +0200, Alexander Sverdlin wrote:
> Add the RTCSYS MFD node: in Cvitek CV18xx and its successors RTC Subsystem
> is quite advanced and provides SoC power management functions as well.
> 
> The SoC family also contains DW8051 block (Intel 8051 compatible CPU core)
> and an associated SRAM. The corresponding control registers are mapped into
> RTCSYS address space as well.
> 
> [...]

Applied to fixes, thanks!

[1/1] riscv: dts: sophgo: cv18xx: Add RTCSYS device node
      (no commit info)

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
