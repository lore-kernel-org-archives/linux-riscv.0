Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CC0C47DD9
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 16:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVvgoNT25XJLKPnEeI+BhBHNA8RUAxZkMRt24/FBn+Y=; b=mOMa6c+zOZJuLg
	4No9Kwwc55KqBWYcOcKEbGWASmfcLdXgCwgDJxieQPjJauN+FzZCi1WJ5YjI1pYiQ8Nh6sh+tO3OU
	kqjqq6lCkAVD4wBDlM9qOGSVLzj1TbdIfA8FdcGWtADlDwix/JxEoLzMZ2EDtUbfwUC7lGuJKBO9f
	JU1AxiQ8lEYXqMEZgi6+/6gZaWPXczjey3DcQ0rUrr/533daTDCuG5ZaBMsri4S9bfFuOd/co+vDj
	8oqiv82vMS3gDrNM1BevZNIrVXMAf5A6401zU7ttrAs32CuMZOP+jKZHmCfmX59bSozslE6QS3Qfn
	zQkjF1mt6dE/0u+S83Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRxLf-00D1ow-2z;
	Mon, 22 Jan 2024 16:40:35 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRxLd-00D1nf-0V
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 16:40:34 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d71207524dso10516165ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 08:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705941628; x=1706546428; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFXUPIGtXHy0u88aXaZUxzjzqMNiU8mnTcB9U06vRXQ=;
        b=DGhpRFU/8lzv8k9cUwWGeZnaSbBJ0sjEuEu62CjeXr3Fi0aljdsR6ZWsNZlthuIw+D
         XMyx7ZHY5wwJAzMiahFTZ5jhBAfZg78FYCqyPPiB8GxbPI8sdrhENW+iCXrtnQE8jmfF
         oWWMuCj+Thgz0azgFy0Dp2ricbWhoVQIKDC2oJIj5GUM9HRugeUikjcfd9aquiOdB1U9
         TODfii9UHM1kt8kNUkFkYL4jj8DMgFlpXYdoyoh9/HquWcIEWRN2sW2A8mvA1RsHh5hs
         5U0jraYbBwFzcgQYnD62ryva0tycC+g7VUgYFnY/h781v6TaojEVj/8f6M/E6bHhRQRU
         RRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705941628; x=1706546428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFXUPIGtXHy0u88aXaZUxzjzqMNiU8mnTcB9U06vRXQ=;
        b=Lj4KjTBM23crSZnEHKdz2xpVSF1H2IJuNZyrAQD/hGatZjx7Bdo+uqJYfxtMIHepMa
         N4f3uSr/Htz8sfLTyL4wzh/gtZ3sp62MbDIgpqNuHbNq21dt6HcxxXqSl3jGQw02qjBC
         jb8rd9lsdSRoEUeoU9d++PNRMaAdSCErJneoY74PNRG8tPjqm3OZCBfIi4i5NCrAOfz3
         3wslNoSsgQYQMVm5ShwT7RNcPQSbZb1OycsO6FDAdLnYq+zO0UhehYkgNQZQ/AFFO0NG
         /MG/jgXuNdqEjH3MjodaxKVssX4bGQ+bPxy4D1Yjjpw2DpCkMnrn9P9Jc2GefqW3tfWr
         iM3g==
X-Gm-Message-State: AOJu0YxmUNWEFy+7xS4a93YZc/n5I2j2CbT65tfz6XeZABsEZBMUkhDH
	Ti6zLulNkITb89nJF9quWaPZttOguowYCGHw1dQa6SAGqDUYjqr0
X-Google-Smtp-Source: AGHT+IE14W6lGJOfsRlhYN6PdnAYVB+1RuPNpPAkweQS2ExEHuVOV7aGlwLBsCqZlWLnei3zJiIEtg==
X-Received: by 2002:a17:902:b788:b0:1d7:297b:854f with SMTP id e8-20020a170902b78800b001d7297b854fmr2168214pls.54.1705941627649;
        Mon, 22 Jan 2024 08:40:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ks5-20020a056a004b8500b006db3358a0bdsm9868297pfb.193.2024.01.22.08.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 08:40:26 -0800 (PST)
Date: Mon, 22 Jan 2024 08:40:25 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	David Laight <David.Laight@aculab.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Evan Green <evan@rivosinc.com>,
	Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v15 5/5] kunit: Add tests for csum_ipv6_magic and
 ip_fast_csum
Message-ID: <2c8e98b6-336e-4bc7-81ba-5a4d35ac868a@roeck-us.net>
References: <20240108-optimize_checksum-v15-0-1c50de5f2167@rivosinc.com>
 <20240108-optimize_checksum-v15-5-1c50de5f2167@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240108-optimize_checksum-v15-5-1c50de5f2167@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_084033_197012_F916233B 
X-CRM114-Status: GOOD (  11.66  )
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

Hi,

On Mon, Jan 08, 2024 at 03:57:06PM -0800, Charlie Jenkins wrote:
> Supplement existing checksum tests with tests for csum_ipv6_magic and
> ip_fast_csum.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---

With this patch in the tree, the arm:mps2-an385 qemu emulation gets a bad hiccup.

[    1.839556] Unhandled exception: IPSR = 00000006 LR = fffffff1
[    1.839804] CPU: 0 PID: 164 Comm: kunit_try_catch Tainted: G                 N 6.8.0-rc1 #1
[    1.839948] Hardware name: Generic DT based system
[    1.840062] PC is at __csum_ipv6_magic+0x8/0xb4
[    1.840408] LR is at test_csum_ipv6_magic+0x3d/0xa4
[    1.840493] pc : [<21212f34>]    lr : [<21117fd5>]    psr: 0100020b
[    1.840586] sp : 2180bebc  ip : 46c7f0d2  fp : 21275b38
[    1.840664] r10: 21276b60  r9 : 21275b28  r8 : 21465cfc
[    1.840751] r7 : 00003085  r6 : 21275b4e  r5 : 2138702c  r4 : 00000001
[    1.840847] r3 : 2c000000  r2 : 1ac7f0d2  r1 : 21275b39  r0 : 21275b29
[    1.840942] xPSR: 0100020b

This translates to:

PC is at __csum_ipv6_magic (arch/arm/lib/csumipv6.S:15)
LR is at test_csum_ipv6_magic (./arch/arm/include/asm/checksum.h:60 ./arch/arm/include/asm/checksum.h:163 lib/checksum_kunit.c:617)

Obviously I can not say if this is a problem with qemu or a problem with
the Linux kernel. Given that, and the presumably low interest in
running mps2-an385 with Linux, I'll simply disable that test. Just take
it as a heads up that there _may_ be a problem with this on arm
nommu systems.

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
