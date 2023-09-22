Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800CCE7D0BC
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 01:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+N5Vn0/mJ2gzautso27Za3CtvXDPyRNqw8CFZBHyzxg=; b=eMdNu7urE/zRNL
	1tS12LNrctBVbcGnADCKC0XunSVW5mz8aPvqjBbzT3v2rhflcsJq/xyat5ajohMAQr6z3wYKFRaXw
	CIuLU4WCtS06uQFjH+JIFD52d3AN1AIj+j5cYZoIVwPz+P/oYsDNWU0iq4swswV8p9rVui1FtcYud
	HYHXalYTkZDSr+XY4UOZ5rFx13F2yBZUjQDlYv1PZoESnJFREddK2HUe5QTXAWU3LxJtEzZxM1Fyh
	9ppoShhP582BLu7B4UZmST1+CkQ/PEc3j71f5Dg7Vbb/MqMTZ6kS3LZjzLWRpXZTzsecWNSL+DWE4
	1E3CFoAusr1qWfuU9uDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjUmC-007XCx-0Q;
	Fri, 22 Sep 2023 01:16:12 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjTci-007Qwk-0U
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 00:02:22 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-690bfd4f3ebso1344559b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 17:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695340938; x=1695945738; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIlWllockWVHn+USccr9bcIlaTuabHf1MxHz684jmAo=;
        b=TtZBRS3TCcdh/vyouuwjwMrrEaZHjlxW53N7nC2seItnSrrPSW8LbW+e3SNKY2agkq
         SIHqrMxvCi6T15RvLDJR4CPi8wIZQApsNGWPEO0+izv0C/2fVcXbRfvmXJHeZskTdYOD
         cDwy/I4yW9W8JrLHrvW5tHGXhw5ieXHp7X3ARaOWtaHUZAG1h/v0MbLc7/xDJIDEgPPa
         8AKqutETVc6Rw4IdV9AmKXIOyZWdppHloRCJP3dByr8EUJUgnjbPBJB4p2Mt4lGYwCfF
         qaBF4XOk7sksKI0ljwDD7WmwRsuq4wVQMeAtzjqeSTMO1KEux3m9D+6WuJATYE/x6/En
         eMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695340938; x=1695945738;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lIlWllockWVHn+USccr9bcIlaTuabHf1MxHz684jmAo=;
        b=sH3cseq3137sIPXo83deV2o/cIXZ6Hg0TtDYHgwhliC6DYBQGk72eituVvCP5dzd1B
         ktxE4BvFQhXK/cKaniKfiz88euKpgKkhWq/FFIz0UB5LlUNirirPbODNV7HHMbPVY3pB
         mojHkvw37sECdc9FqmSVlT1HJW/btY3uQttOyy0At9CzNFf4aFjCWRkmFZlcpqm+168Y
         V/AHc6tt/PtyO2LQoS9FLgWl8OrMKXFa6WrAPwIleIo2gAafgMy2IV33maqXV4Jif7QN
         zlWgj6YEMr46itwiZTeNmlro77fYJEIK3Bvg5ieWXf9hKo99SwyzDHOVhHlfxmIpuMXJ
         jgyA==
X-Gm-Message-State: AOJu0Yyi67tEsnswXz0EIC67xkfBT7YHGfWwXxX2DuBRRACWwkS4kg62
	4Ipm45/jDVWKmLPLKfxa1So=
X-Google-Smtp-Source: AGHT+IFYHBSesDnJjmWGQ1ZQ0T9N+LxNIP5SZuAef88AoxvyO2avFf//tfqoENhODbAU8Q+z2mKUZQ==
X-Received: by 2002:a05:6a20:324c:b0:10c:7c72:bdf9 with SMTP id hm12-20020a056a20324c00b0010c7c72bdf9mr5869719pzc.29.1695340938184;
        Thu, 21 Sep 2023 17:02:18 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id z13-20020a170903018d00b001c0a414695dsm2136863plg.62.2023.09.21.17.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 17:02:17 -0700 (PDT)
Message-ID: <49a92f24-bd70-483c-aaaa-49d00c339b12@gmail.com>
Date: Fri, 22 Sep 2023 07:02:09 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Greentime Hu <greentime.hu@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>, Vineet Gupta <vineetg@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andy Chiu <andy.chiu@sifive.com>, Conor Dooley <conor.dooley@microchip.com>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 matoro <matoro_bugzilla_kernel@matoro.tk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux RISC-V <linux-riscv@lists.infradead.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: [bisected][regression] rustc userspace crashes on riscv in
 kernel 6.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_170220_211477_F0CAD889 
X-CRM114-Status: UNSURE (   9.69  )
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

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:


> Since this commit:
> 
> commit 8ee0b41898fa26f66e32237f179b6989c65600d6
> Author: Greentime Hu <greentime.hu@sifive.com>
> Date:   Mon Jun 5 11:07:11 2023 +0000
> 
>     riscv: signal: Add sigcontext save/restore for vector
> 
> running rustc on riscv produces output like this:
> 
> $ rustc test.rs
> /usr/lib/rust/lib/librustc_driver-f0248bec779deb29.so(+0xe8ebdc)[0x3f8dc8ebdc]
> linux-vdso.so.1(__vdso_rt_sigreturn+0x0)[0x3f8fb91800]
> /lib64/libc.so.6(syscall+0x16)[0x3f8cbfacbe]
> /usr/lib/rust/lib/libstd-985e4b663b8154c3.so(_ZN3std3sys4unix5locks13futex_condvar7Condvar4wait17h4e3b669d2690824dE+0x64)[0x3f8cd45f68]
> /usr/lib/rust/lib/librustc_driver-f0248bec779deb29.so(+0x715ab6)[0x3f8d515ab6]
> /usr/lib/rust/lib/librustc_driver-f0248bec779deb29.so(+0x7159ce)[0x3f8d5159ce]
> /usr/lib/rust/lib/librustc_driver-f0248bec779deb29.so(+0x6b64f6)[0x3f8d4b64f6]
> /usr/lib/rust/lib/librustc_driver-f0248bec779deb29.so(+0x715534)[0x3f8d515534]
> /usr/lib/rust/lib/libstd-985e4b663b8154c3.so(rust_metadata_std_9e9c65f710e3ce43+0xaba32)[0x3f8cd44a32]
> /lib64/libc.so.6(+0x6a8e4)[0x3f8cbab8e4]
> /lib64/libc.so.6(+0xbb49c)[0x3f8cbfc49c]
> 
> even for a simple hello world program.  The output being present does not necessarily mean that the compilation failed, in fact often it will still return 0 and produce a working binary despite the output, but often it does not, frequently enough that it's impossible to build large rust packages.  See the attached log for an example of a real build which fails partway through (despite the fact that all compilation lines emit the traceback).

See Bugzilla for the full thread and attached rust build log.

The reporter (Cc'ed) confirms that this regression occurs on all rust toolchain
distributions (both from the distro and from rustup (maybe?)).

Anyway, I'm adding it to regzbot:

#regzbot introduced: 8ee0b41898fa26 https://bugzilla.kernel.org/show_bug.cgi?id=217923

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217923

-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
