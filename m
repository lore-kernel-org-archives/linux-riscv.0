Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03704C54F52
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 01:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjQmGxSV3PIKdQWSXtjtLa0lFUyiHMqpVepjC+y47sY=; b=V6QpYKEiwI+Ekw
	hpSS/GTcN88RNft6IeRRXRBmUzSMj9hJ3xs3F4d7q1VUNvUVvoqjbeKK31Mdpzs8n9p0tHHk3HL5c
	ZTuARSOXkmrVGbRZw70KQVqw7HY+d5Ssv9fMK5v54eohX12jxFLC3JhPlKLaX0GgGJ4x17FH/at2X
	V9XL9+CdosdwS5g6YzmSalaNpOeXNRMAcfDf7Hu+EqgiihPnuKGYiBmiB30A3DCO4eBabMCjD/njj
	8V+yqbX0brN22i8CIf+lcH8oHA0AGOVHhr5shMJANL9We54GF0x+XMW0R2BMrehyjlYJSxuyUcnRL
	fEaSbHcdHJMyb7C+ZF+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotPT-00000006cxV-1N4d;
	Wed, 29 Jul 2026 01:48:39 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotPP-00000006cwg-3Nlu
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 01:48:37 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8485b358552so475507b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 18:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785289715; x=1785894515; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J8VS8ZB1guuCz2FDTf2FUiR3jOA+ZzoXLBMbwtZp+5A=;
        b=TTcJi/A8eKm/Qy12NJYQ6vcma8ETBeHr1YyPb1V9kJVTg+d5xI+rt/KROProVPEQ3Q
         UP9m5j9dHYLgBzpUOy1jBE7EuPyysWbfc1NV3E/ER9CaG6jtsYjIp8Mjwe5TOH5E8Mb0
         Zk3I7RBMrJ5CPw5oAV3sZEHefwLPUJZ4K/8tmaF055UXthwhUpLJUlFaNlZwEfQXFYMN
         8tMJkEGL6vd4AOxxcFXzlphQ1+Y6ukG83y0EF4tnqE1vujbPBO8xc4J0v92con50PoZe
         uC5576t1iEXMXHz6Q0rgV0ChDDTITraZr1slGs2rnUhuTESoNAcypuuXyk1GmdJP15p/
         EFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785289715; x=1785894515;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J8VS8ZB1guuCz2FDTf2FUiR3jOA+ZzoXLBMbwtZp+5A=;
        b=l6kyev9WmYAfslicmzmSj5PxxoeOP7zOtnzEF8bsM+TdBIoo7rfcSIGWk+ypBzjkqu
         sgEbLzCFYod+6tD2Bbo7xSmkyfD4OTVCYfKDsnKxxAY9wT2JoZLxCs+me/GkrUuEJyMe
         UWG0yL0ENWfGelJcUmmN8I/N58D+IyjnqI0q4r6Vv6JKSIS+C7qRqSWJTCKdkmICRdbE
         pzRCMW6kDk4APPdoSHMOrGyIP3tSW+9lgSNbG2aePDf1mES6pZl0mK8v2PG/u78g7RMo
         fpEdwNYFIhH6attV0VsFpJdMrva57pT/Nis8LdGD8zmZ1o9b8krKgoM5b3JSgzsESo9E
         VDhw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6lbGZOPJPNZhVdAvsSLzGFmpDt7LAINdfISl7OmBT+5o/owdtplZ4JFneW00M21kcgOEyarZyZT4ZIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzU3U0aot0XQuxN8XBhqmNNRy6pyndplDmim0eXdy3MqM1ZHgbj
	sl1lWsTcAnDBRz6AZBq7TgjL7QIsLvWeBlnrjUTB9IhhVO17FhgIIwy2
X-Gm-Gg: AR+sD12NaOjbskPW5VdUHRsyuUvGzw0VjIdAX3I7Qm5BmE30n/+b5UgKeyoXowEscrE
	NkbVGXEJTaJNAXghgedhDxFbRJH5vz2QrfSpgu0AQ1mtWg+kqn+JLY4A5+kZtpJK98mteRCSfBA
	MKlBHirm6Whu+DYQO3AzGdVW4x5q1JTyl60i7P3eowrG7MG2KhFoWbsYDf/p+ya8E1H66SA/8l7
	Bxwe3+Ytd1X3y5rirVQNFNqDrvC8PyFsxCu1Y+zITkRZ/rirlby3yqDa81DQmEXO9SxE///LOCi
	A8oCtt8xLtOXuplBoNAnmwewBTi6JdKYUV/Z2JpIv7JvcivE05J/pUbKjw87D971bsjAig6+fi+
	f3wZ1tvj1dl14ATuD08YQn2WIh23ibBJJLMhAu+2iTHvfqTNd7FwKX++jI07nYJTmMSbviWbuKg
	DG2z7cTAGGBYxiQn0gzBgd2GC27T/1kx4fVHPR90on9Cr8Kx+2oOQFBd81d8k=
X-Received: by 2002:a05:6a00:4fc2:b0:846:8b21:6304 with SMTP id d2e1a72fcca58-84e9311de36mr5193587b3a.14.1785289714696;
        Tue, 28 Jul 2026 18:48:34 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03d3c5dsm590510b3a.57.2026.07.28.18.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:48:34 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	chen.wang@linux.dev,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	rabenda.cn@gmail.com,
	hanguidong02@gmail.com,
	Alexander Sverdlin <alex@sverdlin.org>,
	Joshua Milas <josh.milas@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	michael.opdenacker@rootcommit.com
Subject: Re: (subset) [PATCH v6 0/3] Add initial Milk-V Duo S board support
Date: Wed, 29 Jul 2026 09:48:20 +0800
Message-ID: <178528968141.162041.7895894684986779851.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260615120324.1527881-1-josh.milas@gmail.com>
References: <20260615120324.1527881-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_184835_871023_82422DFD 
X-CRM114-Status: UNSURE (   9.99  )
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

On Mon, 15 Jun 2026 08:03:21 -0400, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> Ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been tested
> with ARM64 and RISCV64 to boot from an SD card, have networking
> from ethernet, enumerate the wifi chip, have bluetooth, and can
> read a I2C slave device over i2c4.
> 
> [...]

Applied to dt/arm, thanks!

[1/3] arm64: dts: sophgo: add initial Milk-V Duo S board support
      https://github.com/sophgo/linux/commit/fd2544c8cffa6a53ef8faeedbf9a66a171de0fcc

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
