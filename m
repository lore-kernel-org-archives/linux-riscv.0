Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694E0C83F17
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 00:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lf35QVCcuvuloLfhi6K7Q9dUJ90aeqiG0pD/rFfVzY4=; b=WTbV3gnrn8lnvZ
	Uh/spRYuIlY4I70W/6I8I7IeTgJd9iDaXTwoW2XUMRaqZy7R+6EGbdlathaF25gA/RL/m+VtlUc3T
	i6+/0zxGoSfFrBWqwNZzCARS1f5TwNnK0NsKeClldB61IZ3UiifPyptkEfnjHCss1BKTfXtnl3R4z
	rnuhZhXZMBQt8zRYZo1fIzsoaB+2DnGc91fGP2+mSQYUqQ9bV2HNGbzOnzZ5aYHhG9t4oFDmVmtYR
	FnRdQAkf/ivsjwbOQ8QyPNWwtcHejzgzbyTHTT0y85gF625L0XloACPZ1espBp2eUW1Ntx2R29JSL
	wL4xokKcKfdLFQMbAh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub7JS-00000000qIV-1lRU;
	Mon, 14 Jul 2025 00:44:58 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub7JP-00000000qI7-3351
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 00:44:57 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-748f5a4a423so2231216b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 13 Jul 2025 17:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752453895; x=1753058695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLeYUFYsbjTuUrfuMR1HqB0mRDFpmVI0gLEVlp8hfmk=;
        b=fZqOG22Uh0Eox2InqEJZDrlMoCk2kyCgu3xPXcaBNTXZ6kbIveoCvp+Mp2INKe84yW
         E0rzj5z1zbmwxC9hYHaWVKfo3KqwehsfevqYr7Q5d3qSLnbHWVcAfFSTZkCVncuyjM/x
         LRkj7S366iX6VeuF+FftVso24EwLOP6HPfJ9YrHkMS91as/K/xumArDyKNyHkEXhXUSN
         u2fED5C7qO7YvjStPegMUCSei9VHCeeAZlDNipljHFu50f1O1MKwQrgkQ7SREv1yDwaK
         9tDFyi32ssUalWQ9APJ2hrLDyzpqenFn/jXehkuawhakjtZLnHMMO0XCEmlAkX3cm1WH
         PtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752453895; x=1753058695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLeYUFYsbjTuUrfuMR1HqB0mRDFpmVI0gLEVlp8hfmk=;
        b=M9bfniBpx3drgX4Pnz2dAyZ9mYQRG7fabD3BDoazVvO0u7+7zWGGmXXeUiicU4mDsI
         P/53fzmy0nw+ju31bBNzDfjuJVHgGulAbIsEedykiQEzjdbMF7uEDdOTHRS+7Lod7bsA
         1DntdOnEUtN4JXopes9OywA6vxbY0y2WVe8fsl6D/HdBhx6GcfItGiwc+Yf0wlGYVxjS
         BnB97gNCDIOixzZ4ocXrtkxbmgbumNvHlV+6E0F5XVIJPaxNebYeL35o+7Mjiv3ZzH4o
         /mpEdAihh+TmHtifwJIh6lquiNHTDzkk14q946jW1Hb4uC7AMbG8lnHuPZ2vE6KGbQ3n
         txvw==
X-Forwarded-Encrypted: i=1; AJvYcCUAODI+cyhRT84l07ZRaHle4GBpSMPAEZ5+WHqkUICO5GXMLpEb5MucmbzHDz8UFNETJk1oeHoU/aL8cA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRX7Jf1uVOY0LU2iCyq46sN7axcrtoiPfFaKVs66dYsFTgUHdL
	4blkL4LTNT7uNXDatXrqieifVlzgOfOgZzXSTYaEs9C1+Zf0AB3iZIII
X-Gm-Gg: ASbGncuRGbIz0ncIAJoFZmlVTw6dNsAvHSux8H1rD3WSDjAqhpMWdAFstENHuumNqQ/
	m2O46bleMJEjasr/GVhe2eGJsrfelXyy6RneTtfmBaMJDSxMVevqnXZNVceU+CcJMcVsU9ZvEna
	XI5MdWPf8zaB9GA4aKuQj+/NgCf7gvmqMKvC4Dug0RsK4fGnTAUjSpCdYND84CI+VH6Bphelbzn
	HvmLPcp0jWXLcCWDObbYBB16z/eviUALIRAVFrmLfKX0DnGDMoiZ9mbQSIT62IUB3mSMAPQ6zbb
	ZwbIv4jHsvY+sXHT+dnYTjGJkurHgBMFST3p+P62tBFCno1NIlUCGHEojFY9xiQ3NvHwYRmOPDx
	usKxErvSc3hjC+/Nw6OgJNQ==
X-Google-Smtp-Source: AGHT+IE3o1PVbYcGVOeDDd2u9PBkS7qnGIBAlmbvXpp/v9MUV/Gw0EgVgPEcUGAR3AbyDFV8S3qXgg==
X-Received: by 2002:a05:6a00:1708:b0:748:2cbb:be45 with SMTP id d2e1a72fcca58-74ee2160164mr15089737b3a.15.1752453894571;
        Sun, 13 Jul 2025 17:44:54 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74eb9f8f35bsm9245897b3a.169.2025.07.13.17.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 17:44:54 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v2] riscv: dts: sophgo: add ethernet GMAC device for sg2042
Date: Mon, 14 Jul 2025 08:44:34 +0800
Message-ID: <175245386393.141174.1523471014566184474.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250708064627.509363-1-inochiama@gmail.com>
References: <20250708064627.509363-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_174455_782615_4368428D 
X-CRM114-Status: UNSURE (   6.15  )
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

On Tue, 08 Jul 2025 14:46:25 +0800, Inochi Amaoto wrote:
> Add ethernet GMAC device node for the sg2042.
> 
> 

Applied to for-next, thanks!

[1/1] riscv: dts: sophgo: add ethernet GMAC device for sg2042
      https://github.com/sophgo/linux/commit/d099560dcbade90c9d508cb745faa786ae230d0b

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
