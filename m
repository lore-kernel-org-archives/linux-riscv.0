Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACF9D7236A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 10:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pTO7ylh94o2uVWdNQ4bpRRPwEY8OTAPHBLEscsHjfQw=; b=OJAC8zjiy/xiae
	li7XSH6fdU16id72db6sgLeSUTSj4z0qDlmu+iGGlHBOq5Rw5bkFdm/HB2GRcpImg7TpLbB0Gd422
	UhLB/G/EQQMdz9qlQ48q9uoPpSWFc8UtQIeErX0QFkin6DwZid3CBbN3fYI4aZLnZRYeGFQq5GnwQ
	hY9IzcIgDCwu8psoi4oKWu0uXghE8mRYX1rnJDDUpRNAu8oMZ/HDhHSqVRbXExi/IK+0Mjfvgolp7
	oQarYfW7gKdG0VSFsS+AifM5EwKOLxGiEmlTW2BYDjmOIO3cUQCWVy5HtPce4tsRyq6sLCh7mKTt5
	rRSGcvs8yw2m9N3wX0TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjED7-00000008hk0-2Ktz;
	Fri, 23 Jan 2026 10:16:13 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjED5-00000008hir-0Gel
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 10:16:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so16704835e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jan 2026 02:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769163369; x=1769768169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1766ltHWrMXyfFyRJgUmU5nLz/oknRF8EBvBBxM+APE=;
        b=WoXR6Nn1CAV5g4vw0JK6ZdQQIi42Rxp9PvxMQSNBPdyJkBdQLRhqqGpuE2UN6RT6D7
         pPmUr1rikJC1f05Aewqyhsets4GbDSxqv4O/t0bDW3rE3pn0fJ68KHqjlmmYavI35F+Y
         zVCyqn3tMfnaAv2ymWtZPvlyxVHYTk4fJ9/BAqZidN8FGdLilzdFgFu++VUk24hGiJHl
         6Tz98y+RaJQ5NFaTvI0UuOIJOnQPwM6HPlTV4GGSwpGGH0NC+7T6mWWhb5darzyHbvLk
         xO8L31Sf4Wurwsw6GAsgnchdBQFfuuodgeOjxe0CaLTA+tgOr9LsWRqoOom7kASO299Z
         eu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769163369; x=1769768169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1766ltHWrMXyfFyRJgUmU5nLz/oknRF8EBvBBxM+APE=;
        b=ObLpWJefMMk1kwrz1pBtEGI66ivbVt3K4X5mk/EZNxjFaCav9guDmBB9UNpJ4Rx3zI
         cavhSeNCJDXx2K7MLMAfOjQ43EYMtY7GH/SxIfvbBBavuuT2hsWkMAQA2JG37EfOB9hR
         L531RoDcVEGlbo4KoQPEdD+OxCJsJTn/Ryq8UhGC/cTnJhyjRucTdFLDi8BsnK4VmePw
         UCQeD62rl/Y2HfbaW2gLXEMMCEohBWI0qpOg7Wi9zEuCp1vqJxo1hepQY/Ps5ywYtld6
         ffiEHUjjk0OCUM2Opxo0ZUT/5Xi4nYEW6ad1wUvwkvHAb1WoZs/Dc4zoZ8hMqBVLez0i
         5xag==
X-Forwarded-Encrypted: i=1; AJvYcCX96Cm7BQGamAMZ4bRFVxv8ECvtIQSnIQQWW216KRxbzj2ZjPFLHcsyVXKomZe2YtHd1Qdu2dbgalk4cQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxE+nDEmTF9KIlRUsWVtNL6iLiYriwt7ACTtTbI3sFQEwDZyjLw
	jY8jBP0ng+DHE64k68f8ckEACxWLqMH+B2IqCsJMxmdrMUMflNfriCKZ
X-Gm-Gg: AZuq6aIP+wN/GXqeMdgnYj25H/WRYEsUqPX1/TvNNkPHzR5aMCgxa3T6N99m/CAx5kl
	IblkVE4BFw/a974wgKBbA/NtYtxhn3ozHxIIUJwvY2n+TnjsH/0sGVasxz7H9bv3c2AWlfvbJf+
	d8dVMDAiIlGhst8Wb/dcwY06glgYxAYmWbUDDor7OsGzTTeeivTJHWwc65qEbgE4X3u5O5C7S1v
	0JUMzS61EM34n/+u2uev+ViDmrN46wFYX2yii5CHAoXCdhk5KhLJhv0JAoQL6U34m9MFMO23Bf8
	X5NDLbPI2w7xQ4vGaYdZ65QBF1Y7ujbCLTSgWpbDBVwacPv6BlLBWpMLQNjgLwjE7w0X2Is+yhu
	SXJV4ymbeNJ+Sk2GbHb8E8PXCa6bAqfUACn4JGURVy78WT3YjsSAZqvRLe4uAkqHqKxHnHnPf85
	CUL6P3cTtENQFBIpAapFPweVJicpJnOCZ/8hVeSqJR2it1zOq/LOJ/LRRKNMSbtGk=
X-Received: by 2002:a05:600c:620f:b0:47a:8088:439c with SMTP id 5b1f17b1804b1-4804c9d00f7mr44556815e9.35.1769163368531;
        Fri, 23 Jan 2026 02:16:08 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbbb3c4sm16602415e9.13.2026.01.23.02.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 02:16:08 -0800 (PST)
Date: Fri, 23 Jan 2026 10:16:02 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, akpm@linux-foundation.org,
 kees@kernel.org, andy@kernel.org, ebiggers@kernel.org,
 martin.petersen@oracle.com, ardb@kernel.org, charlie@rivosinc.com,
 conor.dooley@microchip.com, ajones@ventanamicro.com,
 linus.walleij@linaro.org, nathan@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 0/8] riscv: optimize string functions and add kunit
 tests
Message-ID: <20260123101602.111c6210@pumpkin>
In-Reply-To: <26d08954-2826-4c48-a540-6e0857faf5ec@kylinos.cn>
References: <20260120065852.166857-1-jiangfeng@kylinos.cn>
	<aW8whGcAR0x6FSRJ@smile.fi.intel.com>
	<691a0183-6f41-4956-82da-abb69a449919@kylinos.cn>
	<CAHp75Ve_pyVm430FL=aEAw1Cnf-92T3Y23qh7pEOaMYMp9iyvw@mail.gmail.com>
	<20260121105717.04853c5d@pumpkin>
	<26d08954-2826-4c48-a540-6e0857faf5ec@kylinos.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_021611_109462_3FA17F63 
X-CRM114-Status: UNSURE (   7.29  )
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

On Fri, 23 Jan 2026 11:12:00 +0800
Feng Jiang <jiangfeng@kylinos.cn> wrote:

>...
> I am still exploring some of the finer points of these low-level performance
> trade-offs, so your input is very helpful. I will definitely spend some time
> studying this further and experiment with the approaches you mentioned.

You can spend a long time micro-optimising small functions.
I know, I've done it....
Then you need to test on as many cpu variants as you can find.

	David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
