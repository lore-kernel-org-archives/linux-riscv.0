Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA08C27C76
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jan 2023 11:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EKa81C7SrReKUlXD63BRjC+jOlgTbhDhDmK8WNZ7DGE=; b=Poq0BAKen6QxGJ
	a2DFDEQ1IL7R0bO2uF5UWN4+HasfbB1Egg07eO48TQzN1dy18bo8pApie3dPhlJPqT8cOqdcdsXZH
	2lNbeIOMd/X4A8+vMvsg0pzJQz3pQDX/Ozp/6u1CZkLHgUmlmejrkx1nqbsFT1HSQOsrgY7R4mhLr
	1MZOVLqK1hq/bXdIdC05Zdgpv4qG2hOcS2wdk6uTilINACxVUZKHkKvRyO+Lm8GZ/8kyQjQdLxCSM
	85HUEGWn3gI5FIlQuKRyx9zembg0d6JPEg/QjQoO9PcX+ROCMfnT8ocW3Fl7X2hcaL57HogZQszsI
	RQ6cYYfSFVLdC0nxbvWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJYzI-00FGaU-TD; Sun, 22 Jan 2023 11:58:16 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJYzF-00FGZW-Cj
	for linux-riscv@lists.infradead.org; Sun, 22 Jan 2023 11:58:14 +0000
Received: by mail-wm1-x32b.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so8773221wmb.2
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jan 2023 03:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YjGs/N459uaRgS5yJ3WFfESguZ4NHWx9awwoiEeB780=;
        b=RLa/BKWA8cCsFwOonds12wldvySF169J5xS3g1ZjPouXbBwg8nfDLWmWirXdCeITBU
         JtxN07A1N9YTmSjdTqk69MmJEpCDGKsTc8PGV1JapOqPfZipKYIgUID+ocuZtC1YJbIc
         CvIffWSaZOZXF4bb6gHjgaCjI1TcGvc0yfNNiFmjbhGo1nbZS+GLGdhLVrZqRKv6ZJKT
         0R2jibeRxSxBa/ZobR7DcntMpt7XQrQWRGm5M4XEE/1v92ryG/PrXn4cN1IFRzsddNIe
         fj2LW7ED9Xg7L0NXTAqnircEmI6Sxni0pP6pu3K6YaM7JEYEyj0r+5ovDanE7hInQqTq
         obPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YjGs/N459uaRgS5yJ3WFfESguZ4NHWx9awwoiEeB780=;
        b=QONb4xaLW8O8byGmbD53uTRP1+5jhpiBH08MODhAizWnN3gbBxQei96pYkes1lOg6E
         vXH02kHvdjl5NxEIAsNTB71v9PM9/Cu8EnyqYE7d1WdYILuodlZh+cUwW8+zOu2jGkB/
         tUpJU4one52Nik5o6nz6XtnasvD4Y/oCdPkQ9TtEFXu9sz9KON5R0H8TMCj1r9LI4xwt
         4RcQtibmTSJZHXnfZwekaihI0CKom5tNTrN7IBrg6VCke2hPTLj2CwkRJsw/FkV1C5dh
         r7xBoiU7tqJ/7dUoKlH1Cb/uDm4ipkxSGFJ+NScaYY3fy2/YrzYbI1XKAKdPXEEjAswU
         3S7Q==
X-Gm-Message-State: AFqh2kpqoR6+VBQZTKX/DANp3BwF7i6B6yjnHt5hJmBO6YVenyq0+tRi
	DuS0QwOaAC+WXG2lkVmHEDHDHQ==
X-Google-Smtp-Source: AMrXdXtq5Rph9UIfC3hB2PBgU4uL+k5CyKLEV85gy72Xc9vXVhqLaj7EC+pHgTHApG8hI/7ahj3Ing==
X-Received: by 2002:a05:600c:540d:b0:3d9:fb59:c16b with SMTP id he13-20020a05600c540d00b003d9fb59c16bmr17056417wmb.36.1674388691612;
        Sun, 22 Jan 2023 03:58:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i22-20020a05600c355600b003a84375d0d1sm8262888wmq.44.2023.01.22.03.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 03:58:11 -0800 (PST)
Message-ID: <9becf3e0-19cc-8924-6da9-8f62f8f8636c@linaro.org>
Date: Sun, 22 Jan 2023 12:58:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 27/31] kvx: Add kvx default config file
Content-Language: en-US
To: Yann Sionneau <ysionneau@kalray.eu>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Oleg Nesterov <oleg@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>,
 Christian Brauner <brauner@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jules Maselbas <jmaselbas@kalray.eu>,
 Guillaume Thouvenin <gthouvenin@kalray.eu>,
 Clement Leger <clement@clement-leger.fr>,
 Vincent Chardon <vincent.chardon@elsys-design.com>,
 =?UTF-8?Q?Marc_Poulhi=c3=a8s?= <dkm@kataplop.net>,
 Julian Vetter <jvetter@kalray.eu>, Samuel Jones <sjones@kalray.eu>,
 Ashley Lesdalons <alesdalons@kalray.eu>, Thomas Costis <tcostis@kalray.eu>,
 Marius Gligor <mgligor@kalray.eu>, Jonathan Borne <jborne@kalray.eu>,
 Julien Villette <jvillette@kalray.eu>, Luc Michel <lmichel@kalray.eu>,
 Louis Morhet <lmorhet@kalray.eu>, Julien Hascoet <jhascoet@kalray.eu>,
 Jean-Christophe Pince <jcpince@gmail.com>,
 Guillaume Missonnier <gmissonnier@kalray.eu>, Alex Michon
 <amichon@kalray.eu>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <git@xen0n.name>, Shaokun Zhang <zhangshaokun@hisilicon.com>,
 John Garry <john.garry@huawei.com>,
 Guangbin Huang <huangguangbin2@huawei.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Bibo Mao <maobibo@loongson.cn>,
 Atish Patra <atishp@atishpatra.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Qi Liu <liuqi115@huawei.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>,
 Janosch Frank <frankja@linux.ibm.com>, Alexey Dobriyan <adobriyan@gmail.com>
Cc: Benjamin Mugnier <mugnier.benjamin@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mm@kvack.org, linux-arch@vger.kernel.org, linux-audit@redhat.com,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-28-ysionneau@kalray.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120141002.2442-28-ysionneau@kalray.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_035813_482370_F66904B0 
X-CRM114-Status: GOOD (  15.11  )
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

On 20/01/2023 15:09, Yann Sionneau wrote:
> Add a default config file for kvx based Coolidge SoC.
> 
> Co-developed-by: Ashley Lesdalons <alesdalons@kalray.eu>
> Signed-off-by: Ashley Lesdalons <alesdalons@kalray.eu>
> Co-developed-by: Benjamin Mugnier <mugnier.benjamin@gmail.com>
> Signed-off-by: Benjamin Mugnier <mugnier.benjamin@gmail.com>
> Co-developed-by: Clement Leger <clement@clement-leger.fr>
> Signed-off-by: Clement Leger <clement@clement-leger.fr>
> Co-developed-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
> Signed-off-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
> Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> Co-developed-by: Julian Vetter <jvetter@kalray.eu>
> Signed-off-by: Julian Vetter <jvetter@kalray.eu>
> Co-developed-by: Samuel Jones <sjones@kalray.eu>
> Signed-off-by: Samuel Jones <sjones@kalray.eu>
> Co-developed-by: Thomas Costis <tcostis@kalray.eu>
> Signed-off-by: Thomas Costis <tcostis@kalray.eu>
> Co-developed-by: Vincent Chardon <vincent.chardon@elsys-design.com>
> Signed-off-by: Vincent Chardon <vincent.chardon@elsys-design.com>
> Co-developed-by: Yann Sionneau <ysionneau@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
> 
> Notes:
>     V1 -> V2: default_defconfig renamed to defconfig
> 
>  arch/kvx/configs/defconfig | 127 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 arch/kvx/configs/defconfig
> 
> diff --git a/arch/kvx/configs/defconfig b/arch/kvx/configs/defconfig
> new file mode 100644
> index 000000000000..960784da0b1b
> --- /dev/null
> +++ b/arch/kvx/configs/defconfig
> @@ -0,0 +1,127 @@
> +CONFIG_DEFAULT_HOSTNAME="KVXlinux"
> +CONFIG_SERIAL_KVX_SCALL_COMM=y
> +CONFIG_CONFIGFS_FS=y
> +CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_INFO=y
> +CONFIG_DEBUG_INFO_DWARF4=y
> +CONFIG_PRINTK_TIME=y
> +CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
> +CONFIG_MESSAGE_LOGLEVEL_DEFAULT=7
> +CONFIG_PANIC_TIMEOUT=-1
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_GDB_SCRIPTS=y
> +CONFIG_FRAME_POINTER=y
> +CONFIG_HZ_100=y
> +CONFIG_SERIAL_EARLYCON=y
> +CONFIG_HOTPLUG_PCI_PCIE=y
> +CONFIG_PCIEAER=y
> +CONFIG_PCIE_DPC=y
> +CONFIG_HOTPLUG_PCI=y
> +CONFIG_SERIAL_8250=y

Are you sure this is the result of savedefconfig? Order looks a bit odd
in several places, so I want to double check.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
