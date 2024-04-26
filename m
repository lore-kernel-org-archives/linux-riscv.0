Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9BAC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 15:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R5vbZ6oyozXPFMm4coC6owyd5QfVhyILz/uFyq9TpZY=; b=QzL3/oTvk9LgEA
	EjhGOI6H5Fdxn2edeXtzyL71EOAspG0pttFyAP88hRs8ylO+FRKkqgbP5N9hPXZSAz+kwlcrLlvLE
	HOXXlq93UUzRON1KiUN8p8JxUC2Hp4VLQmOj14PUEDGoaRnJvuBpgSux3XWBkepER85MmzuzAJzfU
	3kWezFFT1rVCCMC2yGbtBPreAjYJ9rBtsQV4AYza9r65Yd8baMYr9UzBppTcSUyHQ5hoBDnuLd2JJ
	VE70QJ6NQKlaAqaN79eH8tXu12MkOUlN2Vf4+wqjDbP0S+lNvqE4SOYSAuDxTGXCUXtjUF/6WjAsh
	kzWiLXO43Gn196zmHySA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0NfJ-0000000D5kn-0oQn;
	Fri, 26 Apr 2024 15:39:09 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0NfG-0000000D5jS-2JxF
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 15:39:08 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-4dac4791267so699153e0c.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 08:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714145943; x=1714750743; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0fHzKICB2TUzI9lFroSAOrJgYaGtzTHDOl9oxitpToo=;
        b=BsJTiZWJvItYrRDRBPHUqZGc5DknJStzbGOCDur9D4N8xJ44x8gTNctCgYFfOp0xm/
         aazdyXYnp7pgHL6dj/pwCDXtda7f++fdCTVSo1V4jNUKwVm7P5cE8TWS0bNgXXnENR6n
         IKyw10mDC3EmeQmmj/ffEyFp6gDDW3tZycExLYzKO4y8kLuGS0P/P5TIfk8CEvoGeTg0
         C0yOohJAk0g0iCF/kYis+91FFUqswMkdNrv2ZX2CzGXLiHmtGVJ/nxvWJMpxR9S7B9o+
         y1PidCiNfrmLZRArwuvymnJdWDHqP8WO75wQ1/KzMs6pOSRroeREdrl/4iZiM0+zL/IL
         HnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714145943; x=1714750743;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0fHzKICB2TUzI9lFroSAOrJgYaGtzTHDOl9oxitpToo=;
        b=eW3D1UEP8tX+DU+FHdUaEO/niTTpvC2noyk/fzCsuUlnUD3CevrsLRzX6uxAih7CLu
         O+si+GY+8Z60XT1u5zFL62Fat/8yUj73+NvuGlQvfR0iLSyvLZ5SXSAMZOYackQ+afiY
         B3lCz4LXw2z/Ad+iRpLWmRETCFb+i8gjwP9IkWmPeHOfZ3UvLlZPDhj0ppvjNWVgLM4D
         Ceu9RRla+/WCKBVe/mAjZvF0HuQfHfw1h19auzsuXBxhHswNrCnHmsT1yaiw+OeZRBfD
         9yQ7pM3nwSnZy7iJpZK8BlF0Q9QZm394/qLjeqa7VlaCN/y9QxL/8Q/kO1Cc3wgto6bH
         F9IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUVSbWm/fgZuJ/HWQQKZb0zLDCcJYswO5xh6uGJrZhM4eRS57i+MNw1FMlkCvlc4FtwSzIsareVQlF1vr/lEhBdIBFQUAWcL4FTuF+axsb
X-Gm-Message-State: AOJu0YyF/h+DUo1yEQNJ/WNCaDEy/WqiyRaUfFLSrnuAlOp30xVh+2+f
	2QuMmtKnhbHH2zW9M1k5uu6cvwmZyqicOZNIX/PtTZDy07vM8IMiUHb4wl2l6svHoYJshY+pbj6
	0v8aMi/8/UmPmzE8Lp9pB+fSGXjPnDbonXA7G+w==
X-Google-Smtp-Source: AGHT+IE+NCvzne4CcGECeY3GkA4OfEGj5ghhDPxk17Ojz7pXDSDSW3HmPLxFYaVkAQVlixFuEx8/Y06XrCSoUji5M7g=
X-Received: by 2002:a05:6122:4697:b0:4d3:45a2:ae53 with SMTP id
 di23-20020a056122469700b004d345a2ae53mr3142735vkb.16.1714145942808; Fri, 26
 Apr 2024 08:39:02 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 26 Apr 2024 21:08:51 +0530
Message-ID: <CA+G9fYvy+3XKDu+U-V3dXLsUPm1ybR_vn5djNvxXnXr85U9UhQ@mail.gmail.com>
Subject: riscv32: mm/init.c:1495:11: error: use of undeclared identifier 'MODULES_VADDR'
To: open list <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	lkft-triage@lists.linaro.org, linux-riscv <linux-riscv@lists.infradead.org>
Cc: Mike Rapoport <rppt@kernel.org>, =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_083906_621699_93C9F94B 
X-CRM114-Status: UNSURE (   2.77  )
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

The Linux next today's tag next-20240426 riscv32 builds failed due to following
build warnings / errors.

riscv32:
 - rv32-clang-18-defconfig
 - rv32-clang-18-allnoconfig
 - rv32-clang-18-tinyconfig

Build log:
----
arch/riscv/mm/init.c:1495:11: error: use of undeclared identifier
'MODULES_VADDR'
 1495 |                 start = MODULES_VADDR;
      |                         ^
arch/riscv/mm/init.c:1496:9: error: use of undeclared identifier 'MODULES_END'
 1496 |                 end = MODULES_END;
      |                       ^
2 errors generated.

metadata:
 git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
 git_sha: bb7a2467e6beef44a80a17d45ebf2931e7631083
 git_short_log: bb7a2467e6be ("Add linux-next specific files for 20240426")
 git_describe: next-20240426

steps to reproduce:
 # tuxmake --runtime podman --target-arch riscv --toolchain clang-18
--kconfig defconfig --kconfig-add rv32_defconfig LLVM=1

Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2fdCURo2mABucb6hDzrLnPoTWMx/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240426/testrun/23674184/suite/build/test/rv32-clang-18-defconfig/details/

--
Linaro LKFT
https://lkft.linaro.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
