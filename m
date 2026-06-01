Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6FCCD5BD1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 02:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMhk2/hkNU9yN8xtoXRAQFdS1cK9TPm/xgt0HkBPxCU=; b=hB+IdYzXYPojY0
	E3AXVqOOP1qfNYgqy7oqnClj6NPGyVg3acMNidH6KjUddoBjjCX3kv7yfBmZNh5BeyOfdmniOzZjW
	D8aIGXBaXP4GiseXdTmihkJj+t/oZQn2ZjzkAW6/BI7mmoXjO2jgawENI42OOHbx3ilXKwaDoYuen
	WpM2wdeKphqUeX5ZznN8h2mt1FzsCD+G+9qkYrjsRMLyqnDX/u8K17uBr2X/IJiUvgPWLdzmX5PAW
	NMVHy99W6kuEF1ciIeMr/WEqREMwC12YeEX+QbL1cEo+qRKGjtF5zpGyswnzbIMuev94vHNoTK6LZ
	ZDsf8IKDtI2YTJAQ1YTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTsqc-0000000A4VQ-0Nuk;
	Mon, 01 Jun 2026 02:57:50 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTsqZ-0000000A4V8-03ot
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 02:57:48 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-36d8b644473so936682a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 31 May 2026 19:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780282665; x=1780887465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4dc1e6o27a5Kq5vwZr329EQ3xcv7LkgpKk1NAl1/Wo=;
        b=DVOQ/KWTskHk5FeAr2IjTtEc8J2NngmYhUyzHqSG0Dk9a+JBppxbv3NusqFYvDTcpK
         mh2cC27UYOQdvDS88wUOOrX5u1a1wWywI1VidAaPYoMldPQap62XCWAAcqoA+MJxWGHw
         4CPCy0JtjBgW+qVsUBMLnVEKipP3qGbD6Ud5pRvQ6T0GWdB/GhpOe5R6j7sGfszD4mLI
         pUSZjGP2SAYkyfS+XmP1MH+fhpXmIYdQRxlwr/fGy9p/a6FkIlazAfE2ou87s3h8h+0x
         YvVRVIIZImWsm8Fhx0zX6Q0lnRHD3XYNwO3lOlZKuSpRpmG73EPkmFXi3uxzgkrmEu/O
         ckqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780282665; x=1780887465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u4dc1e6o27a5Kq5vwZr329EQ3xcv7LkgpKk1NAl1/Wo=;
        b=sXT7rpXuQLTipTEs/AQw7vslony5yFj7E0JENdOjt3a1O9Q40hGCrGU3c76qE9ixa8
         C+6SPMAVzK+rtzGIw1RTcNS5ufIZEH7JqVoXlAItOxmU+8jGs7qmRoSsiE6brFwi31G6
         sOjIKFs5UgRlJI/bm2zDCId+Wa8nTbtcb3efhUX3I+C4rmWeXwM5P/r9nE+n8askXuMU
         trf5L3X9pVjT0/dDOoa1IbAVt2O4srgNEKUuiQS5UnEny8IwA04cFCL+LQmFcZqlpnun
         b5OajvrOE5Qdtv/ha+cK4Po6DX5EQWIaY3c02PrEqnvGI0a85gpMmpVLmJ4/tcepqBpm
         o6Gg==
X-Forwarded-Encrypted: i=1; AFNElJ/zDtCgmbGZ9W06F4HH+ZnYkKjYJoyqtxFqjXm/QR1zf4OBG+lV3ma0Oa3FYDJA/5+Q4ls4ImiS1s0hCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUq9o4HhasPj+0Xn0BkAeA6PGWveQ8UCY9YJpLq+Jor8guwwZZ
	QryOmzSvSlsKiIoJxwX+M/oJ3IEZqy9cpbnL9QeIy3N0JhEY0OozL//poEPDPFlf
X-Gm-Gg: Acq92OHh6zrFhr3EFVLyu7hVd2zMzbbYIX/7vWfPaqYfouDfjXb/lQXhHXdOsk1RO3+
	OuK4wto8amhJSvjqDkeGIcEgcEpXub3JxekHB1Qf2OKKxn6X8JkjHT/2qMqCAGmH/fiB1acPTpM
	/FM4zIo1nBkE9m3Su5ILiIEgrHVhoO/9q79jiZRamxOv6ECwrzIsG124wqVmIstseuZvP5JoHMW
	iZPscxs3zJiswrtEVbLskNBX7Tglv7y2eZbCG7RkWot9o9p8d7C0K5PBK07ckLG7oosaXIrG7LO
	2S2dxirhH39k1e+0yOLiQ2uBPt5IDhSzGSW0IT9NhA7vMNwavFbZsXgMaRBuGHwvV57RkCEa+LH
	f1F1cA/nbUkIR3Yg9dE31abql8NrllnCUcMv2gsfKWPoCmU66ptegVv1XqIdqrdL2EAGPrTZXzs
	e+PwAC4OyRqTHKGkF+ZGMJbkQ18LAcuE3aYQ==
X-Received: by 2002:a17:90b:264e:b0:36a:ee1:fc24 with SMTP id 98e67ed59e1d1-36c4ff41964mr8396209a91.8.1780282665674;
        Sun, 31 May 2026 19:57:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6a340b7sm9065397a91.11.2026.05.31.19.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 19:57:45 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: (subset) [PATCH 0/2] riscv: sophgo: sg2042: Enable PCIe DMA coherence
Date: Mon,  1 Jun 2026 10:57:24 +0800
Message-ID: <178028263198.557087.6386925175219722340.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260331171248.973014-1-gaohan@iscas.ac.cn>
References: <20260331171248.973014-1-gaohan@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_195747_076794_D87571B8 
X-CRM114-Status: UNSURE (   7.32  )
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

On Wed, 01 Apr 2026 01:12:46 +0800, Han Gao wrote:
> The SG2042 hardware design supports cache-coherent PCIe.
> 
> With recent firmware updates [1], it allows to use DMA coherent.
> 
> [1] https://github.com/sophgo/edk2-non-osi/commit/017a5aea26a066fd2bf501b7893937183165af36
> 
> Han Gao (2):
>   dt-bindings: pci: sophgo: Add dma-coherent property for SG2042
>   riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
> 
> [...]

Applied to for-next, thanks!

[2/2] riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
      https://github.com/sophgo/linux/commit/e728a57834d06b9bbf9bbed69e3ea16416d257d5

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
