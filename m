Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F50D1715C
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 03:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tq8QgDqwjvUFe44HqxeW9DczDbzsb61tDD4QGtyQvNE=; b=1Sp8tu/zO5j7bH
	+6lzbZnMHY1sGK9xZMieLQ08WmP8lVVUsHsov/luTiVg68TJni3yV7NjnIT6v/535vEgC8Jyxoxvd
	DIqWj2C4BdnuiLvesTau5o3G0nPiVpdDWgmmrw779WrvoWeXjE5W/3l758nNfOOs3RAMkRlpyEiJB
	fJr1ktZGHMOFedaTlPHTmOow5/02jpPuVtj4QVeIy+MgCBTomEy6g7w0h3oW9jY/9C/yJEc9HQ3Ya
	8aTdLhig5NSIf2kRSa3YGNIvzx5qi3UjuiO2AYNZ7GaYVfItc7pdTeF1ePcgvbB04Dkx8Y5J2ogqM
	8D6ucl67V/bTbhvHP2lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t35Mw-00000009P1F-0ac8;
	Tue, 22 Oct 2024 03:15:38 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t34D5-00000009GYs-1dnJ
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 02:01:26 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20cbcd71012so45656335ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 19:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729562482; x=1730167282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPNabAA00UhSLiwzu+RL1RxmJwr1aDxxDCGsIyPJfSQ=;
        b=DpVOXNgARgyntrC3CzUPj+yE4K8Xz6PxjkkgIxOry9MsvLhxCxGUlPEqNB5MCgSZaP
         q8ByDHi7/HyTA03hTqDoal6ewI7UJxYnYZnfxTzNiz+aI/TTgkujQ6c5hO1/w1M6Fpg7
         NB8uvaU1pUUlLK22sxAe2XUUUsdZASboI7gx9ONWJ4+ekn2aX8mfawyjeCJFJrY3+F4D
         HQ+/D/JW7cKKomoBW08SYWl/V4FWwPCNRE7nHF556Y5tYLGaKxshtFS5lXglgL4OdWr/
         rQ5ByTI+FXbLphbENuZUWyq2A00wRzKIPD+AMhSlJBCEndS9oJ/eR1gV9gCCET2egkMl
         T86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729562482; x=1730167282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPNabAA00UhSLiwzu+RL1RxmJwr1aDxxDCGsIyPJfSQ=;
        b=U5P3d2U6ibbBl/ygSZ2oSxcpvBLXBNogF3Yj/eS4I2FGWJOj6VVoQ6d9fkQGjXxnh6
         gGPreVyBiHqtJwLD8KBQP9uf7au0vi7Eh80e1TJ1SKaiuqFEW+JKSKDDR17l9Ly6jmCM
         poC+SijMAF3K7TiFP8Xp59hjFPe0bz3LdfMbSNeXu/eKuZvykwvh0IcO8tqdqsAV6ls1
         SPFZDsN6rDw1U9ffuVbPZ24QAk815EbfEq41D7nIe9YuSywAIotJD28JL4hhMVECtSPd
         wDYlfiV/gtOfks2LhHBqh4pSU+AYDt5hETDQsRN/eBaIHxJMTx/4dcUAJ2w5N1JVuxTg
         AXvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSyMwIgg/Tm47Z5kpdj/GDpxSZvjL/1A2D8rKERJD/2aTIHssqWNb5y08BDvwRl8OxPkAeBR+xiiIxQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzB+DC2fXVjyd59ASmVWmWWgrgZa7NcV1h24BwEa8TqIwo6/lfv
	LmA11a2QTcOljkA0gQXzsr6Zf5+LyC6eHP3pt/6MNKuwRj3FiXIE
X-Google-Smtp-Source: AGHT+IGzuILj1RsrFZjoJ4dXI5tDh7XMcKK2Bx+k0YFTR77UD8om/JwzukAtT+4x7q3vK/f91G9AFw==
X-Received: by 2002:a17:903:2448:b0:20b:58f2:e1a0 with SMTP id d9443c01a7336-20e5a76137fmr161321345ad.18.1729562482111;
        Mon, 21 Oct 2024 19:01:22 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f355csm32435915ad.265.2024.10.21.19.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 19:01:21 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com,
	Chen Wang <unicornxw@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 0/1] Add power key for pioneer box
Date: Tue, 22 Oct 2024 10:01:01 +0800
Message-ID: <172956244972.305559.6733343990944223670.b4-ty@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1728350655.git.unicorn_wang@outlook.com>
References: <cover.1728350655.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_190123_545976_9BA74053 
X-CRM114-Status: UNSURE (   7.16  )
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

On Tue, 08 Oct 2024 09:43:32 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add power key for pioneer box.
> 
> Thanks,
> Chen
> 
> [...]

Applied to for-next, thanks!

[1/1] riscv: sophgo: dts: add power key for pioneer box
      https://github.com/sophgo/linux/commit/128bded4bc5253b94c66acd63bef03f16148ae4f

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
