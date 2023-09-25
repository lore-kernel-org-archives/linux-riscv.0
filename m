Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AADCE7A94
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 11:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=UP9JBr/3yqxGyX5++edJ1tq8QpqR9Z8qHbFVtHlbqqM=; b=yr1SX10Xpf5+FhGGR83CKb7jY2
	Pzlmwyt03Hw0FatT1aP5b9yZZH2djxWVqod6pQ4VzXEIjF1oYl9AHSlzllcs0mfaouYqWttYlfZeh
	8kk8HPdGBuqtzmZYMnfwp2TdVv+nsEDWGjlY0B33WvHuJ0/kFSVA3uhlWMeDseV28yl84/0ZGupbX
	g7I2HEiajKUkZFy3m22WJmXUWvbzxgyEK8I2gm+Ik7kHtFe0WkX0OJUDONGjZsfvBdJgCucDSvU/d
	8hxEGbPewNg0xNMgmjhWoc3GAeg8IzoxnTbxyNdmTKKxo6JjoTeBSjbAuuBRWbge07cmtj4BuTvXS
	RkqdQGbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjgc-00E9sU-0c;
	Mon, 25 Sep 2023 11:23:34 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjgY-00E9rT-05
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 11:23:31 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-690fe10b6a4so5608746b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 04:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1695641006; x=1696245806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnMu+ts1wzzN6mNtfB5kBm3FUOkQgpm8CL3z/Z8SQfo=;
        b=Eutqg2HL0Yb5h685XnJ/X+MJmYmn09o000u4IGqcR00jAUXoNUHtlcQGseJmKNLwyr
         qI/LRmI0GnHimvim6jdcw86w6l69I12qH7ksbMIt3UWNebsbGxqFJXuRV3MnRFlovJau
         IAqYETsf49M39j8F0LCsYsdZm0/8AHlnoBbcxJmUlPdddWW3zlULZ9DnrA2R30oDeCtX
         Rwf4YmzdXAFq3Wy/bXQF8wML03oqazt7SUf0/7SzeQpwUIEWK/ITVZeIgdoCKvGQAPH7
         7BcIEhnXWaru8aPTpKpaNretY0FnU6DTLu2H1EXmlmW9ADC3arQVSe0W4rEcPeJzoXK2
         OzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695641006; x=1696245806;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnMu+ts1wzzN6mNtfB5kBm3FUOkQgpm8CL3z/Z8SQfo=;
        b=Y5nNrN8JrfYPUj9xzi2f24DgUXRHQKNKHL7ObUzrYRsx1gwISR9UjPO8ICybj9L+q9
         Y/I9eJp5TS1SN235VFUZjAEsLbU7aijqcxU0eh9d6fL3WZs63CKQkhzbxNmSjaHIR3Fp
         sjNLauGa8gtroGAyA9fPUzdFW/tODVmifPtO8AVYMicTVAN6jtiYJv+mif12+lFYIVPv
         K9MaaWiOtcnQL+aihuwCm3yIIxdP9bAurEC6s0r0+viZqoStlQ/LGexZXHaOmMFbwtr+
         iko32gmGfqNzLPmMbkG2BY343k2jB83v/vs/XzxX9fk2boRPV5t9T/BPfq55HUlvKrUm
         xbTA==
X-Gm-Message-State: AOJu0YwtO6xlTDPyFbDyaNg5QLvnk0RaPGMoSd7eiLflIE69bx6TXh4l
	iYE7m59ZqHqTlr2Kh/IQThMKXjgusovqJn+LIQBUXQ==
X-Google-Smtp-Source: AGHT+IGnF3HQ0L/904BSoqm3N98UkQqXhwVklC5XLmvcX53VgnU0l18SRWV76dftxyGoGhM7RFuyWw==
X-Received: by 2002:a05:6a00:b89:b0:68c:d6f:212b with SMTP id g9-20020a056a000b8900b0068c0d6f212bmr9055759pfj.19.1695641006499;
        Mon, 25 Sep 2023 04:23:26 -0700 (PDT)
Received: from localhost ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id fn3-20020a056a002fc300b0068bbe3073b6sm991196pfb.181.2023.09.25.04.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 04:23:25 -0700 (PDT)
Date: Mon, 25 Sep 2023 04:23:25 -0700 (PDT)
X-Google-Original-Date: Mon, 25 Sep 2023 04:13:35 PDT (-0700)
Subject: Re: [RFC PATCH 2/5] RISC-V: selftests: Replace cpu_count with cpusetsize
In-Reply-To: <20230921125518.175428-9-ajones@ventanamicro.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Evan Green <evan@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
  apatel@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-dc79f414-dcb9-4424-924f-2a1aab56db94@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_042330_062974_59AE5B2F 
X-CRM114-Status: GOOD (  16.90  )
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

On Thu, 21 Sep 2023 05:55:21 PDT (-0700), ajones@ventanamicro.com wrote:
> Use 'cpusetsize' instead of 'cpu_count' for the size of the cpu
> set parameter of the hwprobe syscall.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  tools/testing/selftests/riscv/hwprobe/hwprobe.c     | 2 +-
>  tools/testing/selftests/riscv/hwprobe/hwprobe.h     | 2 +-
>  tools/testing/selftests/riscv/vector/vstate_prctl.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.c b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
> index c474891df307..d53e0889b59e 100644
> --- a/tools/testing/selftests/riscv/hwprobe/hwprobe.c
> +++ b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
> @@ -47,7 +47,7 @@ int main(int argc, char **argv)
>  	ksft_test_result(out != 0, "Bad CPU set\n");
>
>  	out = riscv_hwprobe(pairs, 8, 1, 0, 0);
> -	ksft_test_result(out != 0, "NULL CPU set with non-zero count\n");
> +	ksft_test_result(out != 0, "NULL CPU set with non-zero size\n");
>
>  	pairs[0].key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR;
>  	out = riscv_hwprobe(pairs, 1, 1, &cpus, 0);
> diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.h b/tools/testing/selftests/riscv/hwprobe/hwprobe.h
> index 721b0ce73a56..e3fccb390c4d 100644
> --- a/tools/testing/selftests/riscv/hwprobe/hwprobe.h
> +++ b/tools/testing/selftests/riscv/hwprobe/hwprobe.h
> @@ -10,6 +10,6 @@
>   * contain the call.
>   */
>  long riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
> -		   size_t cpu_count, unsigned long *cpus, unsigned int flags);
> +		   size_t cpusetsize, unsigned long *cpus, unsigned int flags);
>
>  #endif
> diff --git a/tools/testing/selftests/riscv/vector/vstate_prctl.c b/tools/testing/selftests/riscv/vector/vstate_prctl.c
> index b348b475be57..540fe588e78f 100644
> --- a/tools/testing/selftests/riscv/vector/vstate_prctl.c
> +++ b/tools/testing/selftests/riscv/vector/vstate_prctl.c
> @@ -13,7 +13,7 @@
>   * contain the call.
>   */
>  long riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
> -		   size_t cpu_count, unsigned long *cpus, unsigned int flags);
> +		   size_t cpusetsize, unsigned long *cpus, unsigned int flags);
>
>  #define NEXT_PROGRAM "./vstate_exec_nolibc"
>  static int launch_test(int test_inherit)

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
