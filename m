Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3774ECE7A94
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 11:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=uOtQ2QBgYCbi46a68l1Zb2RvpuGGifIngvN5kG9A3kI=; b=nWC+FKlnEvelW+Y0xQwCPucBus
	vbK71nDvE2mCLMwXDpFqY2t0rUfS7Cu64OhpIsEs5poUOtV3pX68WKD333rcXIhZw+kmU/+dY6PyO
	5ILLaIqWrUGyWWmZHp4vtz8SxX0/1O3yrfXrllotvAJk3R58PO7bC+jezmS71yW66yFHM8MbEwiDM
	AwHtGDFygAPrLVvlIc6jHaqVIceOMfFO3EpARLJHnX+KaH0Wnd6UTUfE3dOduLTw8luQWqNw3BeG0
	ymDTACDUEZf28DilUu8CDbN0oLeqVbjrXTp/hScR8MhqELQQc/LuD9hk9oM+kBafwwpT5d08WE8nv
	Y0t2uh+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjgm-00E9vH-2N;
	Mon, 25 Sep 2023 11:23:44 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjgi-00E9u2-1X
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 11:23:41 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-690b7cb71aeso4587744b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 04:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1695641019; x=1696245819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBcXHDYM8xpdaW/sXt+ZbCawYl4+c3eaPtYcQOZuHo0=;
        b=jN/g4qpx60FeE9qrtei1KFAXKljtRnk0hSRZJiZq7wnCbIu4Uh5lTPF9D7MSUCkeYP
         yjMPi6m4ridhulOPuJgdRrjSXed8EUv3BjyCM+NRQPqFmgE/ZR49uv0vpgBuy0tI4GNy
         7tdRqCROXwPrx2Wat+7MrhBQHpf/nZNnIWL2FnVmdrSZno8YYpWf+x/qpw0y6c5ObA6l
         FLXh4Yf9tTLWTuBfv7u+zz04HLuMJtGXW7VzPKN3N7L65oHV8ddRf0RUzkyS9wSIwITS
         ErjMBwxbHV9y0v++ZN5Mt5dK/vRV52v2+jtsDe9GkjzRZLlQl3uirbcxn/PEaRmqN40s
         oVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695641019; x=1696245819;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBcXHDYM8xpdaW/sXt+ZbCawYl4+c3eaPtYcQOZuHo0=;
        b=E6AfJPOWNXfbfkh5KF9HUjc6xtB8TtZ0RfJ6wFRI+KdUoQRhYQ1MQIFd1d7CwxiYOu
         efSMJNxcDmfYYDamiG4V4DNRJNztbBH1FS1SQr4hVe/JqlHs0n9wr2lVUdQ6p3v6PdFN
         BjsE13apNCnkeFO9E20BRSLbauLIfZ3XIZY04mpSTcb7A+loIXKSAwj8eY3TtDQDByOd
         P3Oi+4QlAQbktD9HANwqGIkeYzphOS5eS1ejkFlDwYwsnvV2cUuGnWm5zDvmPXbvfJZ1
         ZOrPPf0hJj7jOFKoqBUzaSrCR5A9ywwXbprpZuYaaxeVPjOYl8IIhZoXwZsgP/YrftcW
         +UKA==
X-Gm-Message-State: AOJu0YzXFP5XWVFUKJ1Sxr+Z7sYINJq6gF0AI2cU8uXtXTJ5ObPKk8AY
	L49XLcfDonEufnHdMODXEO2G8wdifgElg56uqLaARQ==
X-Google-Smtp-Source: AGHT+IFmALqno5JCqdu6vveiz5mb8lFnPo69LvHSvFpj4JIoGv6GxqMlQHu0/aRrK/tGPd/qYyqBwg==
X-Received: by 2002:a05:6a20:3d23:b0:140:d536:d434 with SMTP id y35-20020a056a203d2300b00140d536d434mr10349611pzi.10.1695641019452;
        Mon, 25 Sep 2023 04:23:39 -0700 (PDT)
Received: from localhost ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id a26-20020aa7865a000000b0068bbf578694sm8123506pfo.18.2023.09.25.04.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 04:23:38 -0700 (PDT)
Date: Mon, 25 Sep 2023 04:23:38 -0700 (PDT)
X-Google-Original-Date: Mon, 25 Sep 2023 04:23:11 PDT (-0700)
Subject: Re: [RFC PATCH 5/5] RISC-V: selftests: Apply which-cpus flag to CBO hwprobe test
In-Reply-To: <20230921125518.175428-12-ajones@ventanamicro.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Evan Green <evan@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
  apatel@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-2672ebc7-622b-4d38-aaed-5321807550ad@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_042340_514459_B1332241 
X-CRM114-Status: GOOD (  20.35  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 21 Sep 2023 05:55:24 PDT (-0700), ajones@ventanamicro.com wrote:
> Now that we can efficiently clear cpus from a cpu set that do
> not meet a key-value criteria, apply it to the cpus used in
> the CBO hwprobe selftest, instead of looping over hwprobe.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  tools/testing/selftests/riscv/hwprobe/cbo.c | 26 +++++++--------------
>  1 file changed, 9 insertions(+), 17 deletions(-)
>
> diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
> index 50a2cc8aef38..375a343bc2c6 100644
> --- a/tools/testing/selftests/riscv/hwprobe/cbo.c
> +++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
> @@ -135,27 +135,19 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
>  {
>  	struct riscv_hwprobe pair = {
>  		.key = RISCV_HWPROBE_KEY_IMA_EXT_0,
> +		.value = RISCV_HWPROBE_EXT_ZICBOZ,
>  	};
> -	cpu_set_t one_cpu;
> -	int i = 0, c = 0;
> +	cpu_set_t tmp;
>  	long rc;
>
> -	while (i++ < CPU_COUNT(cpus)) {
> -		while (!CPU_ISSET(c, cpus))
> -			++c;
> -
> -		CPU_ZERO(&one_cpu);
> -		CPU_SET(c, &one_cpu);
> -
> -		rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)&one_cpu, 0);
> -		assert(rc == 0 && pair.key == RISCV_HWPROBE_KEY_IMA_EXT_0);
> +	memcpy(&tmp, cpus, sizeof(cpu_set_t));
> +	rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)&tmp, RISCV_HWPROBE_WHICH_CPUS);
> +	assert(rc == 0 && pair.key == RISCV_HWPROBE_KEY_IMA_EXT_0);
>
> -		if (pair.value & RISCV_HWPROBE_EXT_ZICBOZ)
> -			ksft_exit_fail_msg("Zicboz is only present on a subset of harts.\n"
> -					   "Use taskset to select a set of harts where Zicboz\n"
> -					   "presence (present or not) is consistent for each hart\n");
> -		++c;
> -	}
> +	if (CPU_COUNT(&tmp))
> +		ksft_exit_fail_msg("Zicboz is only present on a subset of harts.\n"
> +				   "Use taskset to select a set of harts where Zicboz\n"
> +				   "presence (present or not) is consistent for each hart\n");
>  }
>
>  enum {

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
