Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D56CCFA02
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 23:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bO4pqRPO/lJg0Bq2a6nlVfjwlfXNoD0Z+/QFXAWf+Vk=; b=iwhpMFIU7PuF7X
	Vqoq3FNxzOhbr1HJCkO7vcIDRyUJU2mLuD3mpo7wAjHfNxE8BntzOsSwSBnv7MDn1XLkl2ZI1ASPT
	PFkWnh00u277Sh2QjDYtt5lE3JC0f9cxwxUGSHNFCu16R4cPaZ9L3McSN3TqVfMQMOYnI5sDKvBXC
	Tr2MHFgg2v8KuTY6lXNe8YB4cUYghSe5QKAmuwOqdfr/WkCMvKOzEV3vM8suEsrqFiKBQAREhhhM5
	CQupeJRPL88LfoWCdGLJMt0Gi2pmuFqOjkvOfQPFwuhhf35+nLXqKuBFTVW8AC+uP5QT69twUDv4a
	OL1hLjp8v0zzFa99GT8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFLGo-00000008ADv-3Zbo;
	Sat, 01 Nov 2025 23:44:30 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFLGm-00000008ADX-1qbk
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 23:44:29 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-27d3540a43fso33601115ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 01 Nov 2025 16:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762040667; x=1762645467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5xrL6w1s6Y/SwQgHOGtWpqSk58YCr4boule2VrLo7o=;
        b=fMSPS7w7asjmytuEQGEbPd0OyIVkB0RsdAqURwczxi4hMowORFRMojv/iZzH97rRlN
         OGtATVOsLcUFP4Q/Zzi44p4A+bkVyj8N+Mfn/BIrCHQW2t8oHpSR0PrJ9p/Bh1hiTXua
         kw+BIa4dgfolRXUXtKQxm7932/SnpcCGb5u7mbJpGJT+W352gqpvC2vlQsKXYnhstc3o
         96KJI2Um3X55oVYL7aZsp9kjga1DCemEEYLngZePE5sJLnAtf6teUmmJ8mGtwHwrJ+Mc
         PwhuR4UQ0nfm1zLrjXTR8GD9/2FEFaf6MzWDIvcmKpuq0bmijxCy1WP3rWjWXe3XyKH2
         GIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762040667; x=1762645467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5xrL6w1s6Y/SwQgHOGtWpqSk58YCr4boule2VrLo7o=;
        b=tGCk1+bJSogALbkklrWDyq+nXNMIomdEbzf+RpeOYztGCa5D0V0kh+RXtQe+pMucUc
         OMTTGscwIbQMWs1ZpheOzuEF8Zk/nWHY5mdNbhntu2fDHOwf54trvZsl/ZUu9Oh9LrLA
         aArTjVc3YfYHwdEEPaVJkmaGMSinIgL8uwRxnY38hI3ip9x//URxvadLkwp/Hj2o9Uiy
         wm6eUs8xnKpu8M2N04Pt6XQfCUVqBIXy91zEr8B+FOOth5t/z2mIjckW8GblC5k1yOHz
         WYVmHlYVboRgVu86+p5JA4jPawVt1nH9bsAG07lRX5nIn3jiwmWJNkd6ElLPPvLGqzvO
         3kwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtzOCkRc4N1dj9uOTi5aV13mt1ez4NwFSyYd1gxNPkkgiyCtuDgfu57WoJRvZ1psf5ZYMz08UtElwFYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfbO18zFmFwdrv+eeqIuOMsd9OiXZKPTk6PfvPcsMiYpxWOqHp
	xP6wG2JU/0x/GOx9ex2pouQTQLX2dsPbrHUasX4oJvAEREarRpRxvWu3
X-Gm-Gg: ASbGnctCPmmtsOEH0e8LJHfZBQmu22PCouB7ycCEoyBG8Jlz90xpR2qbmgVHhMYKaFo
	yPVvTk67ynXp8t9zyp1isov2sDjyHgNB9htW/jQcTdUISEpC/m6MSNbxpxwlh4ncIYQQpI8qhLL
	hGY4o0P2u6+JBn4+ABFvJGdK2u/SQA0IZHHiTvv5cwIyf6B7/Mb+/S2WG4hsy1DzlPDiOYl2s4E
	9vt/Kr56Mkn7zA7lOUeaeS5pSg071EN8vvwBwSK3DgvWJ8eKD7f+AXREqQZ6ImgfpFB9xHVDdcb
	elXOviz8HA6Kh1FBOAKbmRDGWZ323Ns8kgP7QyyGvktGQ2zSJk62HfZ2FlHA87SQZNDV+SQqQnj
	VLmpGNsgNsChEnAwAZ47z1/UJ6XOAh6dseLLXyBFwlcxnt2mOJqZbrOK6u2uA0gPyPcpPiTwgaj
	s2hyi+Wy2VQA==
X-Google-Smtp-Source: AGHT+IHes7gAPMGnU9C8dtef1adr+TMQgs0cEQ/JgUMpaIjuvVBJgyDHwEuzKah+vpeRkyOHYuQGpw==
X-Received: by 2002:a17:902:c942:b0:295:7f1f:a80a with SMTP id d9443c01a7336-2957f1fb69dmr17823945ad.27.1762040666931;
        Sat, 01 Nov 2025 16:44:26 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340b070ec06sm4370384a91.3.2025.11.01.16.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 16:44:26 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	rabenda.cn@gmail.com,
	krzk+dt@kernel.org,
	mani@kernel.org,
	liujingqi@lanxincomputing.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com,
	Chen Wang <unicornxw@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 0/4] Add PCIe support in DTS for Sophgo SG2042 SoC
Date: Sun,  2 Nov 2025 07:44:12 +0800
Message-ID: <176204064246.157916.1254578946904175496.b4-ty@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1760929111.git.unicorn_wang@outlook.com>
References: <cover.1760929111.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_164428_484515_EFDCEA45 
X-CRM114-Status: GOOD (  10.47  )
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

On Mon, 20 Oct 2025 11:32:55 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> This new patch set is a continuation of the previous patchset
> "[PATCH v3 0/7] Add PCIe support to Sophgo SG2042 SoC" [1].
> 
> The drivers and bindings have already been merged into the kernel
> mainline, and this patchset will focus on submitting the remaining
> DTS changes into the mainline.
> 
> [...]

Applied to dt/riscv, thanks!

[1/4] riscv: sophgo: dts: add PCIe controllers for SG2042
      https://github.com/sophgo/linux/commit/4e27aca4881ace1e9a812fc2c88b33dd84e29993
[2/4] riscv: sophgo: dts: enable PCIe for PioneerBox
      https://github.com/sophgo/linux/commit/b85ad0d06a19de95d41f91162389a1bbb461a405
[3/4] riscv: sophgo: dts: enable PCIe for SG2042_EVB_V1.X
      https://github.com/sophgo/linux/commit/c6c215099e89b1eb71ed6592163ae5b530f4538e
[4/4] riscv: sophgo: dts: enable PCIe for SG2042_EVB_V2.0
      https://github.com/sophgo/linux/commit/579d6526aa43a155c8685a88ef8350a8c29afa47

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
