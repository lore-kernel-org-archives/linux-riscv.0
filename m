Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E02C3601E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 13:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/0TsHaJoYOFrXz7c24v6EACOxLCa7SUSlsscd/wYPww=; b=b99dfEEnaSicU0
	gi6gQ8/+32qhTAmbP1kDpwG5gfa6FsTO9pQkbb2IM0EFFcVFuxXuLEp0MQ0NxenhpwdP2FLQ3CoqA
	torZ6kLJCifTRgwbXAYj1uSKCI272a9JXGguVFQ09T+QDZ8nv+31OnhTQJ0hDebX3lZ/ngBan/RHY
	7MAwBOKlFwtSKCzqIRG3Y0WknVApnVE9+lN0GCUbxhqnzoomXNAq6jixOi8WKvGSr2N1Gpkfp9GJn
	dPMROLYAjzH+OfwR4+pI8zSYq3elqMACPfws62F8w73stJmgtq3itHZbE4gXVrlh/BpJJvhfZdNzB
	StfSpNiETsA87H/68gXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1m7t-00000000Oiy-1NMZ;
	Mon, 07 Apr 2025 13:02:57 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1llC-00000000JFa-1GvY
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 12:39:31 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22409077c06so51499415ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 05:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744029569; x=1744634369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqcszFjiY+Y27P7zL5H3ARQuOUut/C9C9Lyd9JHvtz8=;
        b=flxmV1uubkMhGbSimMktejaYHluuNwvLoZNy2cXnTh6VpzFwBMOEZLyV1DIskLBAfR
         I1USSGdxSJkevqGpIJirDQnSHk3Lwl9ExEO88uOkJ3l1Vu0XmjqK60Rt0wC68w+DwVz2
         L7+oGcF9+WSXgHd0sjOfCwCVc3SrAU8rxp1K0cuh+Eecj70ITZdIqVmnGe4RYo5uEJzQ
         HFRUEisqhUccYjFlFZqDbvAZ1ituJcw2DYEYSk0yrvAl9bPDiMCIwEPAL0VbmYK/zEpV
         iERvy/0JMADpazMlLCizAl+q234QPjyXGjjs1auK0jUibXcww0Qvv5vpsSJKgQyr08Fe
         BrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744029569; x=1744634369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqcszFjiY+Y27P7zL5H3ARQuOUut/C9C9Lyd9JHvtz8=;
        b=KM2hbaEo0zePEeFNcq0Ox/S9NMz9tCfS9lH0ANbO0UwgtgPu/SgRxcPPWCcfNrY8KT
         3hI2tQlpWDN/+JEYrT/61LTul/376RZVo25UDadiX8ZRcWXThQE/pmtvdcrFJewdFxxI
         O7VxS3D6yRA9pJFKA08/bN/EqsLCsxmuVg/hGe1N8rXUHXSfX3AE55s1C6p09mbkFcKB
         EMSQaldGJEUMnCEY9KNniLcpGxLvCHy+3UuHxaaCwESB6iEKLaeuiFQN79O8mrr/7G3e
         wzWMk8/ixgXaLEbyaH0eK6qULxGjY3FxO3mkeacGMHaJQrmdNB7syk02lw5HzL2QwLsD
         T53Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7Ew4IUz1k4ZFcMHuL29Fql+7OK5sQAoVBQD2PkgOdtQFU+pp7MH213rbyvBaTnbpGmGT2V8BrckraPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTrumlHWwPg5vF9lW1g4gFn3SZNLUuOV6rGz53FQjzmRy4q3Va
	05v08fbmMsdH+caHwCfhNeJOMpKW8eZE7DtV0H1hkUGblMmKX4Oh
X-Gm-Gg: ASbGncuOUpaXX4fl4S5dcb5VIr+9HnGrLzLt06K0rs23PBXDO482QeyNOomfhZf1CxN
	O6dClDV2Q0ji6yeeR3oFnsHNl8fAyMRykG8T7XO1LOerg6jWzXs62OskMF7wo1Rz4J9ahU24ELB
	vIzLF4ceGSJiHOdQB/KhLqfUr+Wd2KvOfPB7Qqdw5I1xapVqQ7c4iYTIiMgW7DmfSlmUQz1aanN
	W+57q5wjydqoozICFuAME8aZIlcCCgoaXcXR9e2lna+/ribe4IoUP64gCYsrHOb98gX4YDaTQUi
	B+eu0Y+T3gULVG4D49FrrNcnjwspJfp2WdbgRw3GvfOXvnD13/vRo4g030lyc151q8WGdjbETWX
	5Gdcrdn2wrfIa4WkTTUGZAudj1L1q4o3NoyP0WrlrUIuItIQn62Sx
X-Google-Smtp-Source: AGHT+IFEVGUSoYS1JmDqtU019RQE7MA11l/maqzFklmFLnc6Zt4IppcP3qxlg0IP1WUL3SYihQNhrw==
X-Received: by 2002:a17:902:e541:b0:224:24d5:f20a with SMTP id d9443c01a7336-22a8a8d3173mr178795425ad.48.1744029569090;
        Mon, 07 Apr 2025 05:39:29 -0700 (PDT)
Received: from DESKTOP-NBGHJ1C.flets-east.jp (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978777259sm79456365ad.251.2025.04.07.05.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:39:28 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: lkp@intel.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bigeasy@linutronix.de,
	conor.dooley@microchip.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pmladek@suse.com,
	ryotkkr98@gmail.com,
	samuel.holland@sifive.com,
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v2] serial: sifive: Switch to nbcon console
Date: Mon,  7 Apr 2025 21:39:20 +0900
Message-Id: <20250407123920.14443-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202504060816.EWk91sJS-lkp@intel.com>
References: <202504060816.EWk91sJS-lkp@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_053930_342243_5F92D199 
X-CRM114-Status: GOOD (  10.98  )
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

On Sun, 6 Apr 2025 08:48:12 +0800, kernel test robot wrote:
>kernel test robot noticed the following build warnings:
>
>[auto build test WARNING on tty/tty-testing]
>[also build test WARNING on tty/tty-next tty/tty-linus linus/master v6.14 next-20250404]
>[If your patch is applied to the wrong git tree, kindly drop us a note.
>And when submitting patch, we suggest to use '--base' as documented in
>https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Ryo-Takakura/serial-sifive-Switch-to-nbcon-console/20250405-230051
>base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
>patch link:    https://lore.kernel.org/r/20250405145915.493173-1-ryotkkr98%40gmail.com
>patch subject: [PATCH v2] serial: sifive: Switch to nbcon console
>config: arm-randconfig-002-20250406 (https://download.01.org/0day-ci/archive/20250406/202504060816.EWk91sJS-lkp@intel.com/config)
>compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
>reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504060816.EWk91sJS-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202504060816.EWk91sJS-lkp@intel.com/
>
>All warnings (new ones prefixed by >>):
>
>>> drivers/tty/serial/sifive.c:155: warning: Function parameter or struct member 'console_line_ended' not described in 'sifive_serial_port'

Thank you for reporting.
I overlooked this... I'll add a description for it.

Sincerely,
Ryo Takakura

>vim +155 drivers/tty/serial/sifive.c
>
>45c054d0815b15 Paul Walmsley 2019-04-12  131  
>45c054d0815b15 Paul Walmsley 2019-04-12  132  /*
>45c054d0815b15 Paul Walmsley 2019-04-12  133   *
>45c054d0815b15 Paul Walmsley 2019-04-12  134   */
>45c054d0815b15 Paul Walmsley 2019-04-12  135  
>45c054d0815b15 Paul Walmsley 2019-04-12  136  /**
>180bb243de730c Lee Jones     2020-11-04  137   * struct sifive_serial_port - driver-specific data extension to struct uart_port
>45c054d0815b15 Paul Walmsley 2019-04-12  138   * @port: struct uart_port embedded in this struct
>45c054d0815b15 Paul Walmsley 2019-04-12  139   * @dev: struct device *
>45c054d0815b15 Paul Walmsley 2019-04-12  140   * @ier: shadowed copy of the interrupt enable register
>45c054d0815b15 Paul Walmsley 2019-04-12  141   * @baud_rate: UART serial line rate (e.g., 115200 baud)
>180bb243de730c Lee Jones     2020-11-04  142   * @clk: reference to this device's clock
>45c054d0815b15 Paul Walmsley 2019-04-12  143   * @clk_notifier: clock rate change notifier for upstream clock changes
>45c054d0815b15 Paul Walmsley 2019-04-12  144   *
>45c054d0815b15 Paul Walmsley 2019-04-12  145   * Configuration data specific to this SiFive UART.
>45c054d0815b15 Paul Walmsley 2019-04-12  146   */
>45c054d0815b15 Paul Walmsley 2019-04-12  147  struct sifive_serial_port {
>45c054d0815b15 Paul Walmsley 2019-04-12  148  	struct uart_port	port;
>45c054d0815b15 Paul Walmsley 2019-04-12  149  	struct device		*dev;
>45c054d0815b15 Paul Walmsley 2019-04-12  150  	unsigned char		ier;
>45c054d0815b15 Paul Walmsley 2019-04-12  151  	unsigned long		baud_rate;
>45c054d0815b15 Paul Walmsley 2019-04-12  152  	struct clk		*clk;
>45c054d0815b15 Paul Walmsley 2019-04-12  153  	struct notifier_block	clk_notifier;
>328ee9dbff3941 Ryo Takakura  2025-04-05  154  	bool			console_line_ended;
>45c054d0815b15 Paul Walmsley 2019-04-12 @155  };
>45c054d0815b15 Paul Walmsley 2019-04-12  156  
>
>-- 
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
