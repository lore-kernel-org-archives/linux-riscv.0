Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33865C83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 22:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KS4Y1zU20j15hUyfgpO1wzw/9g8orB3fVyUJtzGE6Y=; b=DBL6iUTHYSFHqO
	qu4SvXE7JchzaZ0mrcOogN7ywTMiuCpNP6ayNSym0YLHYsP3NLmZLNpUF/7xF65qvj2GlQhUU98VG
	kyGH/s62P7uGy5gxaOFzrLaqrJHMakYbQJxudElLHNsLlwsm9gfMPfPZPTgWhU6pdxMWNTosJ8Pau
	9Bh59EMtzcWdLwW65HqWyXkb44hmT/ZFvv37FJJnBODb0/qGsuGffy4ysM71qtalRgjZfGsiOZW2Z
	9bO3AUmhfX2RDFCRfQlx4BT9y6QmKrosiT9sotdPjD7TFiOm/D/eWCKwaPU5GWQqEKC2n/vdFLCLp
	2Fz0LSh0oJViW8+27PFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uboIU-00000006Ksx-1LP0;
	Tue, 15 Jul 2025 22:38:50 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uboIR-00000006Kse-3dnc
	for linux-riscv@lists.infradead.org;
	Tue, 15 Jul 2025 22:38:49 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-23c8a505177so55910975ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 15 Jul 2025 15:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752619127; x=1753223927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMHzguab1ISG60/Qj0OMV0c44NRNKay9hHw27b5AXY8=;
        b=M/WE2SDAvPC01vVwuYRChnira61a3qCdOlg1IWSK/7xvrGn+sbAMkIahOWfMHnrHrs
         6n6prnr/FqqBG9akZ3oQonlhihWV7MxGclmKQO7XSiswb+W8BnLIu7gJoYYJEKG19WkG
         uPpjKR4qT8vq1HHqniu69fM9JMgvn94dAz1bTdMV0xMxgx2t5pwi+M6TVueSCHC5QTlS
         PTTEekntesj8rZvqqQZPhktOHStI+cjN+8MGY4Bvtkp6U8wdNf1eajAKvrfKYYQP9kTY
         Ku+HlNbPc9UC9nJO5wFO0yMNYIOSAwmfTIBGlY4MnpIYKEnJ2LtilOdmPYeS7AWDw+xc
         fUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752619127; x=1753223927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMHzguab1ISG60/Qj0OMV0c44NRNKay9hHw27b5AXY8=;
        b=kkUGq2Qs0dsSMHp3pf/HOOURw932rXQHAR5YEy4sSUhftNp5iJBwqL5fX4MXUw/MK0
         yMPddReDgcv2sc6TiSkfsDWciFor6OlrDW9wX4sHhxkBVSjRC5PoNYOzQH6ZB8L71kDK
         JuUmvkYq/H9HLGfmwiWUARdnyIfNDNBNrHeua9+ViAi+AxdgdDSEOkRRZHxDZaR+dkdu
         Wz9UCCr54T8TiB0LeyOlNRZoetSoqRBGypDDLAoIRcMXLeg3m6DYp8lKg0AdHCNVuA8e
         MdIKVMURisKJOqkoDrI9nK659PCU1Ml1kmFobOBR3IwttFLctMBuW5QHJg08tSjW68P6
         /vPA==
X-Forwarded-Encrypted: i=1; AJvYcCXf4Akd5Qnp4svb0M8bc0pJTEbCvP4546+h1NSogrmBquQP6F0pJaVF6yqUYe089Ht/J8GKJYt4V21H+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzR4gPXC4mchu2kqCbD2NYxzuxhAPIEwc4+rZw947LxoqmkpCHE
	dv9EuvvZU91KnaOA6P8DoreJlsa0eYGl19kVItqwhepvw0C3pbRmZblR
X-Gm-Gg: ASbGnctOA7x43OTJMJnTdfVTZBGGbnk283IgRukTa9R948DXSBYY8AiJhatM0K93QwC
	G507PouVYGDFJPeEf1nO0CYAgIfa3Gff38EjZeLSpQRGJXPBDJq6oBngJI4qrz9ZP1/6F+xIGWL
	1dS2wPpPsubg0DNAlBlvbwLMQ7jOIhna4U85DWk2AAq3ayQ0G7rs6Xtl7sP/BNmVcjtUauee+Ya
	D0Qp+hxHEL2xI+6zeke6U23T8+b/1Hqq2iYgSchUQgcJCpx3zjg/IdEpgbXoCKDJJSYGO+Xieis
	1o9Je8znluRU1BrUErlVirL3MX3ow+nj3Olk9EOuPnsnm+Tgsg5lzDtSmFXLX1SdWALrD6QYGOW
	Tueup0sH+DikcEN5FqKV22w==
X-Google-Smtp-Source: AGHT+IH9n9nO7kec5bACwYWFm50WGXSEE20ljzK3YGhA8V2Hti9BIGctkVsu30lXV9YAdLdqJiq7mQ==
X-Received: by 2002:a17:902:ea0a:b0:235:2e0:aa9 with SMTP id d9443c01a7336-23e24ed635emr9028845ad.14.1752619126885;
        Tue, 15 Jul 2025 15:38:46 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23de435d42dsm116929105ad.233.2025.07.15.15.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 15:38:46 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: dts: sophgo: fix mdio node name for CV180X
Date: Wed, 16 Jul 2025 06:38:25 +0800
Message-ID: <175261908156.94132.11302071914429106821.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715221349.11034-1-inochiama@gmail.com>
References: <20250715221349.11034-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_153847_905709_C98BD845 
X-CRM114-Status: UNSURE (   8.60  )
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

On Wed, 16 Jul 2025 06:13:48 +0800, Inochi Amaoto wrote:
> As the mdio multipledxer is marked as mdio device, the check complains
> the mdio bus number exceed the maximum.
> 
> Change the node name to mdio-mux to remove the following warnings:
> mdio@3009800 (mdio-mux-mmioreg): mdio@80:reg:0:0: 128 is greater than
> the maximum of 31
> 
> [...]

Applied to for-next, thanks!

[1/1] riscv: dts: sophgo: fix mdio node name for CV180X
      https://github.com/sophgo/linux/commit/8727665368cd4af112146b650ec0ebac038b5cf5

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
