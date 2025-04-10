Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA35C3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 14:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f4U8IIUP52JphSa/CK/MT/YseHfxeHka5tjWChLSqy0=; b=rCrMbaohqc55+W
	lsjFYMpAEp27N16pJiuRlsCxJqDt1EgUvG2q/3nFIdhFzOpPSp8Jdi7qruSS7xEsunugD+j13mseP
	rdn81HLXxXD0O5Oiws9I6YirSOovsP11b612oLNa8Ou7IaCzdK3QBMpThs108Vf26XCUqyARi095s
	R488jxOBxPr9e/R1AwKZlXi0t+sv3IwJFfmoK6d2po+6nDJVlqJRNjgBifDLJq6k7vGxdkadvbacW
	qQDz+m/p9aiZ5HG/Zhm0RWREWfUImwdW8+zPassU1nJgQMjNXxw/AUJbEnOG2kTL82J5CLpimlNpe
	WC55CmmtvjWdL41c4m4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2skM-0000000AoxN-2ftI;
	Thu, 10 Apr 2025 14:19:14 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2skK-0000000AowF-0I4w
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 14:19:13 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-30384072398so756376a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744294751; x=1744899551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pg20oY4fk1g4YTuTud9xw6LT1kx/bgpyeNN+Nb2KPyM=;
        b=mTRCMI5B0Qoi9xpjSL9p3lfq7PlJqnsbuBJv6p6IqjbaWN99Y4//VZwGF80RLTeO1x
         jl7xh0ZLDJRMCjLQ0jiMedtUcg91omGed27YOec4x5nUVISzxWVpmewnthngdLJGiIlW
         7hfOmmAc2JfenVF6LYz/QR8sO13AooxPJKfdNP4aD2uEBanbd12Pb6ib43iomEXoPwpC
         IGQ5UYZMTET3c3QfQrX6V9cb3MNoBW8OxhiWCf2Ki+9uFojHA5/RWXKNXm9YkefkoGoi
         HGucyqPMHFl519ygiA7rckn49ynkgS/VkvmGxnTxo3+kKVcuDqXNSrI0Mdc71RPbTvkO
         4RsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294751; x=1744899551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pg20oY4fk1g4YTuTud9xw6LT1kx/bgpyeNN+Nb2KPyM=;
        b=YCJy/PAoE4qaOPR0RrjNipcMF16GRFx0oqgpqW/NNRmE35F6Lt2aT1Emc3qjThqk3a
         J5dggQTPrKI/vCsYAyaFsvqJK6LOBexJ5PBiY2knZk1WGhqOfF4rFmSLqVteeWkEMvE4
         EHsYe9NuTFWkxlcArGP9xiydNFfsczMLIL5n7xJO5qhQ/1RHrO/7L2IjYuaocNwnt69r
         0aJ4sHfiSTqcaXdI9pMsPGce1nUCWqn2YMJR7jI2sg4n0X6MA1Kpke2svvSZZK2pve1t
         Yt0Ppq7oRLKqdhsGbxMMZUuXmapowfldtu6ntNfIIOAahgfdFzekA5tpoZ8Hl6is95QS
         BKcw==
X-Forwarded-Encrypted: i=1; AJvYcCUdEmbchlTH6EeDCrwvkcF66LIiVWykwBwyV1QI4SGjOyVA/BVds4rvhxmPT1KosnNBV+s0A89ZdFYnCA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn7/OFFxiE/vcx4Mfe7SP0N67/3EvrhMiBJZAcd6MOezGg9SaI
	eyq6KWf4Tza9I9KBfiZPpu/kCli8ElabiF3/CC3lsVVGsIQrQWur
X-Gm-Gg: ASbGncvkBHZCWXEp+7aEEvndKaryf+gy9zLrpNK+pFBo5TZd+Ccwb4hVe10USTVvxjE
	1H6TYOuL1KvpbDso4sOTGceo8D7etPbpVKNP8xArIX4nbT3mpyFH6V3GyG6a8Dvp405x1U5ZgdP
	/MmcLVHluWLHUGC31cSlMiIeHwT+ET8sOaHdnNm93Hp4onkgwMZDHkq8ymf2nGww2++08saZrIb
	FwN1m6e23IJTKnKL8vg94ad80+3OJhPX7P3jtKHGdU49d8CpryuNhsBAGTDG+R4B8WurbKzYGkM
	XcULyw5hDoBoE/iVvK/+GpbHhGTX7fwS5it2XcBkF2KCNzHL9Vxw6uHQLSq6sTcvjthKc0RHPhN
	aDxrWKVE7nR2ExVDujCzD4N5ILhTt6j4MYDsb3Q==
X-Google-Smtp-Source: AGHT+IHGSOe7rLWE6APRJd8oB/Q1p/06cytILMQ3d0nlRQ+N/y5HEXtyxiKwmIZjLfr75eK0oW+JWA==
X-Received: by 2002:a17:90b:5147:b0:2ee:aed2:c15c with SMTP id 98e67ed59e1d1-3072ba0e83amr4340866a91.28.1744294750880;
        Thu, 10 Apr 2025 07:19:10 -0700 (PDT)
Received: from DESKTOP-NBGHJ1C.flets-east.jp (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e6c8sm3716464a91.14.2025.04.10.07.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:19:10 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: pmladek@suse.com
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
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	ryotkkr98@gmail.com,
	samuel.holland@sifive.com,
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v2] serial: sifive: Switch to nbcon console
Date: Thu, 10 Apr 2025 23:19:04 +0900
Message-Id: <20250410141904.4750-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Z_e5rWcJKUh7eozw@pathway.suse.cz>
References: <Z_e5rWcJKUh7eozw@pathway.suse.cz>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_071912_113527_89190522 
X-CRM114-Status: UNSURE (   9.91  )
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

Hi Petr!

On Thu, 10 Apr 2025 14:29:33 +0200, Petr Mladek wrote:
>On Sat 2025-04-05 23:59:15, Ryo Takakura wrote:
>> Add the necessary callbacks(write_atomic, write_thread, device_lock
>> and device_unlock) and CON_NBCON flag to switch the sifive console
>> driver to perform as nbcon console.
>> 
>> Both ->write_atomic() and ->write_thread() will check for console
>> ownership whenever they are accessing registers.
>> 
>> The ->device_lock()/unlock() will provide the additional serilization
>> necessary for ->write_thread() which is called from dedicated printing
>> thread.
>> 
>> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
>> Reviewed-by: John Ogness <john.ogness@linutronix.de>
>
>I do not have the hardware around so I could not test it.
>But the code looks good. With the added comment (reported
>by the robot):
>
>Reviewed-by: Petr Mladek <pmladek@suse.com>

Thanks for reviewing, I appreciate it!
I'll add your Reviewed-by with the comment for v3.

Sincerely,
Ryo Takakura

>Best Regards,
>Petr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
