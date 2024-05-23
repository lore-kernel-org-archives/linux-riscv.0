Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E4EC25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 05:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqzKGZ2QX7KUk2bfxHjcU1eoor8SJ00c0gfwauT5ZYw=; b=LYiuLgna/lKQw8
	OJnjoUxsfI0bHpRhAL54O5F1Z6u0Ntq8+85MkzBtm1rM9eTdX3DCR8NGrQAZcRsW2cAC75UDZxS+9
	rpCqGn8Qml+wm81vmADOZvy2q10wAW0mGRI8pchYDMw9M5c6Xvw9tHNlx4mc8qjr0Pz/nibsSeT1z
	WwX2w+AAB43ioSdSuDI//8MsYIBiEhW68EoYHTGZDR1a1bWmOxGlZzKzR2k8opQjhC3FIy18iiocS
	v1G50cLZnnGDxTxvY+/yWdk2LPr3nDdj+qrf934rNhHHa1qU08xdHl4MZaTUrcuuCfAvV7BbZdLc1
	I543IBokSycIfqrw0smA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA0dH-000000053hA-2K2T;
	Thu, 23 May 2024 05:04:51 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA0dD-000000053ez-3byX
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 05:04:50 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6f72b8db7deso677867a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 22:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1716440685; x=1717045485; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n+x4FBKSEOANP/qupXlCyN0LwwGnpzjhK0Y2rkN+K7k=;
        b=GjkHyDnvus2IBEnG1LLej+JSusCaddMLQTwOosrwxGP9mLDSLiYsdwVNyHlqCYn+WL
         uYCjf0p7g/vvBaE30R5vO+AJhpBY1YtZFcgn+SrPP/MgcfzmTTBeNYEcmiYl1UarpjRw
         Z0fbpdE1octTEMzezchFfiAMH4hsL1v0IPivMMyCZsOajo9DBRDi4XLqCoeJaKXOIAW6
         DU10qIKuOCI3ucw/oKpW+5ksGnXo1JVnbdoo99+WqezJ//OT/z/qRqnypKlIV7nud7Th
         JpX8SGnnxqM0k20lSj3nOApfsuP5phAfYqtVwap2l3c8EzFu3TiRnHqi2JNryu9Vvsp1
         w6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716440685; x=1717045485;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+x4FBKSEOANP/qupXlCyN0LwwGnpzjhK0Y2rkN+K7k=;
        b=dPIfjAHMAjQiwQBxoBh5pFoUO84arE9i+Ob9hCbK7wjufRo8Q2LKwL0IIVBxdYWOjY
         CsHZ9Eox0tjaHNnU1foXINyb6sFA4O2i3tJMplFblG11T6x+hsi2c3B+SmLS+8zwbERQ
         rrCreptZuqm77r2qy0oL/6LQ2YDcfNRqJ8GSykt8EFAvC8WryH/RuqO622DfSFXvo5Mk
         b+7Hr7wSA4YebJcorjGhLmXa2nSdumJcR4AsR6EkPKXfS54aiaO517hS9SueMQBBfxjK
         ZD2i719v/kyPc8T1R4Z0+XS8J9CfKN9I25UF5NQ1t0/fkagIo4ACJ4WOUeXeaEJrxBkF
         IZGg==
X-Gm-Message-State: AOJu0YxDlLZOvWhCcO/BfR7fYC9o6tbFIzsFtoSkLJdK2kBH+Q9r18y6
	WFwzOF1FV9hFDdng1v6yB8jiK9b23hpIUriafsA9qmQ7I1JZg0OKWPixTcf9E9KG32boGnrTyfi
	Lzb4eQuHOcZlPAq3C/DDxZU33WDKwzikrTGkn4uiP249jfzSkvqPEGQD8/87YFDrCV9gU+zPD6A
	Yyh7gmZVo1BIBZ6+fp3xA/F7JM808DbKCpnLd121yBan8p3w9jZ5c+xaix
X-Google-Smtp-Source: AGHT+IF8nLUZioFYQcSuDA+N/YT7Giq7BevgUZ0FAdEzHUIMAhEV6Mn4pp4ig43mUH8HxzHIV3KGqA==
X-Received: by 2002:a9d:7609:0:b0:6f1:df3:8886 with SMTP id 46e09a7af769-6f66981b259mr3357293a34.26.1716440684936;
        Wed, 22 May 2024 22:04:44 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.197])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f0f679ca97sm4504117a34.29.2024.05.22.22.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 22:04:44 -0700 (PDT)
Message-ID: <080ecbe4-1ead-4fff-84b6-0ff22ddb9945@sifive.com>
Date: Thu, 23 May 2024 00:04:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: riscv/fixes baseline: 10 runs, 2 regressions
 (v6.9-11078-g0bfbc914d9433)
To: linux-riscv@lists.infradead.org
References: <664eb8a1.170a0220.e085c.2c3a@mx.google.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
Cc: "kernelci.org bot" <bot@kernelci.org>, kernelci-results@groups.io,
 kernel-ci-triage@rivosinc.com
In-Reply-To: <664eb8a1.170a0220.e085c.2c3a@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_220447_954381_A9D4107B 
X-CRM114-Status: UNSURE (   8.92  )
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

On 2024-05-22 10:31 PM, kernelci.org bot wrote:
> riscv/fixes baseline: 10 runs, 2 regressions (v6.9-11078-g0bfbc914d9433)
> 
> This legacy KernelCI providing this report will shutdown sometime
> soon in favor of our new KernelCI infra. Not all tests are being
> migrated.
> If you are still using this report and want us to prioritize your
> usecase in the new system, please let us know at
> kernelci@lists.linux.dev
> 
> Regressions Summary
> -------------------
> 
> platform             | arch  | lab          | compiler | defconfig              | regressions
> ---------------------+-------+--------------+----------+------------------------+------------
> hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig+CONFIG_SMP=n | 1          
> hifive-unleashed-a00 | riscv | lab-baylibre | gcc-10   | defconfig+CONFIG_SMP=n | 1          
> 
>   Details:  https://kernelci.org/test/job/riscv/branch/fixes/kernel/v6.9-11078-g0bfbc914d9433/plan/baseline/
> 
>   Test:     baseline
>   Tree:     riscv
>   Branch:   fixes
>   Describe: v6.9-11078-g0bfbc914d9433
>   URL:      https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
>   SHA:      0bfbc914d9433d8ac2763a9ce99ce7721ee5c8e0 
> 
> 
> Test Regressions
> ---------------- 
> 
> 
> platform             | arch  | lab          | compiler | defconfig              | regressions
> ---------------------+-------+--------------+----------+------------------------+------------
> hifive-unleashed-a00 | riscv | lab-baylibre | clang-16 | defconfig+CONFIG_SMP=n | 1          
> 
>   Details:     https://kernelci.org/test/plan/id/664eb3d258cd55f8bb4c43d4
> 
>   Results:     0 PASS, 1 FAIL, 0 SKIP
>   Full config: defconfig+CONFIG_SMP=n
>   Compiler:    clang-16 (Debian clang version 16.0.6 (15~deb11u2))
>   Plain log:   https://storage.kernelci.org//riscv/fixes/v6.9-11078-g0bfbc914d9433/riscv/defconfig+CONFIG_SMP=n/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.txt
>   HTML log:    https://storage.kernelci.org//riscv/fixes/v6.9-11078-g0bfbc914d9433/riscv/defconfig+CONFIG_SMP=n/clang-16/lab-baylibre/baseline-hifive-unleashed-a00.html
>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20230703.0/riscv/rootfs.cpio.gz 
> 
> 
>   * baseline.login: https://kernelci.org/test/case/id/664eb3d258cd55f8bb4c43d5
>         new failure (last pass: riscv-for-linus-6.9-rc3-10-g6beb6bc5a81e) 
>  
> 
> 
> platform             | arch  | lab          | compiler | defconfig              | regressions
> ---------------------+-------+--------------+----------+------------------------+------------
> hifive-unleashed-a00 | riscv | lab-baylibre | gcc-10   | defconfig+CONFIG_SMP=n | 1          
> 
>   Details:     https://kernelci.org/test/plan/id/664eb26a1ce473fc344c42dc
> 
>   Results:     0 PASS, 1 FAIL, 0 SKIP
>   Full config: defconfig+CONFIG_SMP=n
>   Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>   Plain log:   https://storage.kernelci.org//riscv/fixes/v6.9-11078-g0bfbc914d9433/riscv/defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
>   HTML log:    https://storage.kernelci.org//riscv/fixes/v6.9-11078-g0bfbc914d9433/riscv/defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20230703.0/riscv/rootfs.cpio.gz 
> 
> 
>   * baseline.login: https://kernelci.org/test/case/id/664eb26a1ce473fc344c42dd
>         new failure (last pass: riscv-for-linus-6.9-rc3-10-g6beb6bc5a81e) 

Both of these are due to 8d532528ff6a ("clkdev: report over-sized strings when
creating clkdev entries")[1], and as suggested in that thread, I think the right
thing to do here is remove the call to clk_hw_register_clkdev(). I'll send a patch.

[1]: https://lore.kernel.org/linux-clk/E1rl62V-004UFh-Te@rmk-PC.armlinux.org.uk/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
