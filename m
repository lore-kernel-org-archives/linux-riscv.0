Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA98CD8C9D
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 12:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLZFamwshmbFSDEEbVouieOxf4qx/aY/6UiCOcf6t3c=; b=rBfGK+4dSvF5vv
	FNbhbqpmBEWPFTuNqfHMRgykpT3yw7RJvq+0/QRe18R377LTILrymoLoJrlD1UU6nMTafXvjbB0i4
	+aTdXX9wDo9XjxbJlwYD2nfAxkjqvEbqitNZ++UlC8yVF2LaVjrQkZoFG2izBR2aRaO24W+zfyl43
	man2mejotxD0vPvKzRfhPQNufIn5X7ddvH39jtGNHyIi0KW05t1+HDL0ElN/YJFT9bDpXHXrRCOVO
	ArZpR7QHt1x7qh12XzO2yuQPDWtyp6N3edyt1Ohc1De0hLgYfVLWbiw4gwnav3uGU11ucSm0f3CoC
	t33fxv6EAnjiy9+n/VnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYl4-00000003U9n-087e;
	Mon, 08 Jun 2026 12:07:10 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYl1-00000003U8y-2Ych
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 12:07:08 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-6607048fa62so4084746d50.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 05:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780920426; x=1781525226; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NxmYofmvW5hO5Z4QL52f7IjdI8gGLubEjn1v9Iv3K/w=;
        b=DR8jvzy/VbjutIW32xRYS2A4j6cbYm463oUpAlChQDmNZdC7DsZLHp3UUox7ffwfFB
         ROae5fDGVyok4iVzXWNpByOsBbSsqKRfSr1uxegaDKJD5fB3XGpxj+l/xbP6dhXQDH29
         8zOi6BGusVBjBZczgOQ+citwLZeb5syMMjnmPAO1weAXpSQQSD8ZThckCN5EHhKdypIt
         CJw5xOQmqI/l45U2m2KPD/QLWJJI52uuJhvRnUrMACvEOzbNtf92FA6tAk9NXALiFx9W
         6+5I1+XbrjZaTLo6ip7KEk2/YYYVaPXFIKJiy0MjSwT5whCqZxtzT2P0YUYxx2zKb8HQ
         D5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780920426; x=1781525226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxmYofmvW5hO5Z4QL52f7IjdI8gGLubEjn1v9Iv3K/w=;
        b=MFvIkH5hHCAfoG2j40Iszs2+/lRXxewdmFRpIeVyL9h9U2FngVCRgL7VgpGYsTNvor
         z1Qp8zLuQQEuiNhnl5YSKe9/ihW18coKFXnOILw3+2GwOZZ+eiqWgaFIsofc8mdxS7JS
         y5U9ZByYGoKUznTIljZC0TlgGrPs83bHz4zHxLO/uaTIedy+4dfWYx4Vbm8wCE7A+cq6
         6YLrICc91obUuzKhj6Tjh6zPkROaXHb7XhJPbeRSZon/ClkS+9DzAqD487brWOi8yV/p
         4FsyL9UQelVo74uDavkAGf+EUJS2HH2oeyBDs5y2SxZuSW4VtuZIyVoMwuDIMobd2Tx9
         Bjvw==
X-Forwarded-Encrypted: i=1; AFNElJ/oqd8Xysoht8Shovtp6FEF9B8cX8s7TYTg2m132h8RLgP5kRfIo5HyE6A31zxdtkYskscBm76i3w+70A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5LS/g8HGuniP6ojwVV1eO63fItfroy4c0+h8VirmDYppEwPFv
	a3l0WebQ0ljlnZi8g8XdWTxIKLcl0j5Ei/43bN2Z591GbaHA36nFzPEA
X-Gm-Gg: Acq92OHo4Ic0mGqDqXWItXxwNwgh/XpJS84wp0na80+q5ANTFgPE2W89R6/SSbHJ8+Y
	fWGzS17D5AV3j1uSuW14O3NMs5FSZ1ua8xxUBTVcVqeOveOy/B2I7ZNbTbgF21uNhjXViwDEgtE
	AKw+r/dShyXrXa7+hn2k3CGCclDqRS7TH8ERAXJ7cEZyZ7OsSBcnONITNwz3bKmDu4SThT/mCHQ
	8lM3WbjjrLlaKbS6hrbyN+KXc2EYF9AfUwONjBkxpMXBVJXEcF9guzGjOyEJZ5F/eIz0JbuFuBd
	R1f/F/nptm3R59UcYYjrfIpTj0Yis9/AihWBB6YFEDosYMZh9Cn4UnzyRbqr6qLx7Mi1wAzpRM4
	KUx+cn5AadG0g3/1HCWzQdeFl41kY27mMqCkm2RbMvVmGr7KssGnLgwYPksksG4HRwdgUw1+R76
	xAIHNpaYIQvSbAPzlFBi3rLfysTywRgRNrEeZtc1uE2UNxYqmOMkvLfguT+jpViYO+Fkk=
X-Received: by 2002:a53:bb91:0:b0:660:eada:ea0e with SMTP id 956f58d0204a3-66106fe6ed4mr10422864d50.39.1780920426381;
        Mon, 08 Jun 2026 05:07:06 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccd9dfc1sm164019946d6.4.2026.06.08.05.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:07:05 -0700 (PDT)
Date: Mon, 8 Jun 2026 08:06:59 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com,
	unicorn_wang@outlook.com, inochiama@gmail.com,
	daniel.lezcano@linaro.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org,
	chao.wei@sophgo.com, anup@brainfault.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
	hanguidong02@gmail.com, michael.opdenacker@rootcommit.com,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v5 RESEND 4/5] riscv64: dts: sophgo: add SG2000 dtsi
Message-ID: <aiawY8BlHlSFXbSJ@sleek>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-5-josh.milas@gmail.com>
 <DJ10GDDAE672.1N365YARL5KV1@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DJ10GDDAE672.1N365YARL5KV1@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_050707_647886_61C7385C 
X-CRM114-Status: UNSURE (   6.46  )
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

Hi Shuwei,

The 256 MB was not intentional and was a holdover from testing. I updated the
DT to use 512 MB of RAM. The issue was only on the riscv side. This will be
fixed in the next patch.

- Joshua Milas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
