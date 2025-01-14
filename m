Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D1BE77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 08:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xgDikRbM7w/1Wr2CkfWG+Zfb1S5MS+8hIeKsgCB7BI=; b=emQ2gAXf6vzsVF
	sbj0sX5d8r9mVShHBxCu7EpRVp77B7d2FCJZ2fM6rWxIGsqZWqOVbk1Mi+1k3+hCnqc/ZzA07632q
	m/UGPUp0jdEjCNjUidW4vFzWGUQJT/X9ace2zbhHaB0BD9Eo0BouTvGSbmUBbEN8D7vO+qO5YWxt7
	8aDJpUXsXjTe6W13Kjj8/9FzofWX4t67oNA5wxoIazObvSx4D1v77nrRxBmYRLz0wassoj3Wa7Qca
	QCFNvKoA+V1nBiWX4jAWziCBFcy1AgZWn0ORsV6gAb1IdR4YB5bGkrL6HwsSnW0VP+o7NQxYzS0zF
	HNMQXbbltc6l/MZG51kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXc8W-00000007nYN-0z1t;
	Tue, 14 Jan 2025 08:18:56 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXc8T-00000007nXX-2DOY
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 08:18:54 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ab2e308a99bso135006266b.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 00:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736842732; x=1737447532; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=919mq0lvhQt4eDMddsUOvRjvpMDPaCDvxvPkUhR1Wjk=;
        b=I7c1kyA0mQfXYXyXK3+MhpO81LZzqsKIyJo4sJU2XM4aePd+E2v3U7Qs0EQUbtjCYp
         h4SRWs/GLlmSo+eiWu10dO+0InNfm0EVygtyMQSeY64/Fla0JyQkI70vR9lstKbnYG7F
         9mDNGXbamuPDzSdiwCdrKyaws7Dyj4waSdnLvEu+vnEpw67rW2SZm33d9ta0XstAHk4G
         ws3vzLA9oiAW4O/s8KCDepTDjxFttYt6Mdq/3sw6jhpgGmgIaegWPWBWWpvh/Lg4sA6U
         vP/4ngQKSXJh5Iwh7n/N+Wej6cpuc0oGe9kkD/gkC313nPk7HyUWq8srpu0nan9vGjOX
         iPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736842732; x=1737447532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=919mq0lvhQt4eDMddsUOvRjvpMDPaCDvxvPkUhR1Wjk=;
        b=NwcqSIy65YHwGgwBN/4PVg1dFU2cVCFGxh34nIma4pCKBZT9aYr7PIYgLfx5onBg8h
         AjPxDJ3GZhCoOAWOmqgNNd1KKS5bv3QoW793QOnkIjHOosG0iDR5BiO2Xi3v4OMqBGYy
         2BHMIzo3f/iu3wv3w0AweWfeYpssFfNANBG/256FRJK7S7kQoQIlSu2AM3MptOa0aEpx
         unhIfFr//QKmUaMA2S+emcXhu8w7r9F48orq4AdBesoS7Xi0zTk4l0g08spQXpwOS8Va
         Zt1MvFA8+CszWZDsZX9JsYEzcZuTtp/Tf8DWcUWKK/fmzxAIjc1dUX1QrOHZvBfbItfK
         STrg==
X-Forwarded-Encrypted: i=1; AJvYcCXdgUVurb4JNvMHPj5W4T6r5/melyGmD6XGw2Lvd0jTfrMRdqs1RM+Uu2uQILXBM/vj1wAn8gqgnBz9Lw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8VXxAmi4kEfTENaCvEKrh48yOt03wfrCU8DthF+3VdzT4LlCK
	1gb+t/dS9SMcaotzPnLfMb9OgotAK/Nm9nU5i8XZ53sF7eTYdEmVBFXM2yQvIrE=
X-Gm-Gg: ASbGncuKUliNjPrWQDlnRv5IEh1xtlaGD2p4sTT4LAT7GJqNHVIPAiRjcYaxhSwNFAy
	CCLgfbMS4ybwioQqVej4qalEiKTv1vZdkENoSU/uWXx7GlGUfHBnm9C1WGeljHLlPMVFadRg//0
	+eDclvO7sOczVREhnyBuGoKrwpV62TnglbdEe3MkSga0+iY75JWlJuMxJtQ7bP7SXWGDSi+LcoM
	XuJ7qdJBgt0bQsE772V6a+Ih3lQ7iYej3zTB7treaWXSqfd0cAqggD8vNCtno6O3cdnHFtJDAs3
	Vrko+FgVhzTGvbNiU27F0KpVCD+sHaXsefNQMtK4Vw==
X-Google-Smtp-Source: AGHT+IFKx1euNh7eZXgY8ADD17X9tMwi3Ip5exxpfz1uFMj+6SCvgp55q/e2kn/pYQTg+l9juFf97w==
X-Received: by 2002:a17:907:94d2:b0:aae:f029:c2ec with SMTP id a640c23a62f3a-ab2c3c8288amr1583403466b.12.1736842731745;
        Tue, 14 Jan 2025 00:18:51 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90e8888sm596883166b.80.2025.01.14.00.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 00:18:51 -0800 (PST)
Date: Tue, 14 Jan 2025 09:18:50 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	samuel.holland@sifive.com, shuah@kernel.org
Subject: Re: [PATCH v4 3/3] RISC-V: selftests: Add TEST_ZICBOM into CBO tests
Message-ID: <20250114-675adccdafd17f716f345b1e@orel>
References: <20250114021936.17234-1-cuiyunhui@bytedance.com>
 <20250114021936.17234-4-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250114021936.17234-4-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_001853_571869_ACB9E077 
X-CRM114-Status: GOOD (  25.89  )
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

On Tue, Jan 14, 2025 at 10:19:36AM +0800, Yunhui Cui wrote:
> Add test for Zicbom and its block size into CBO tests, when
> Zicbom is present, test that cbo.clean/flush may be issued and works.
> As the software can't verify the clean/flush functions, we just judged
> that cbo.clean/flush isn't executed illegally.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  tools/testing/selftests/riscv/hwprobe/cbo.c | 66 +++++++++++++++++----
>  1 file changed, 55 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
> index a40541bb7c7d..dec510291ab8 100644
> --- a/tools/testing/selftests/riscv/hwprobe/cbo.c
> +++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
> @@ -50,6 +50,14 @@ static void cbo_clean(char *base) { cbo_insn(base, 1); }
>  static void cbo_flush(char *base) { cbo_insn(base, 2); }
>  static void cbo_zero(char *base)  { cbo_insn(base, 4); }
>  
> +static void test_no_cbo_inval(void *arg)
> +{
> +	ksft_print_msg("Testing cbo.inval instruction remain privileged\n");
> +	illegal_insn = false;
> +	cbo_inval(&mem[0]);
> +	ksft_test_result(illegal_insn, "No cbo.inval\n");
> +}
> +
>  static void test_no_zicbom(void *arg)
>  {
>  	ksft_print_msg("Testing Zicbom instructions remain privileged\n");
> @@ -61,10 +69,6 @@ static void test_no_zicbom(void *arg)
>  	illegal_insn = false;
>  	cbo_flush(&mem[0]);
>  	ksft_test_result(illegal_insn, "No cbo.flush\n");
> -
> -	illegal_insn = false;
> -	cbo_inval(&mem[0]);
> -	ksft_test_result(illegal_insn, "No cbo.inval\n");
>  }
>  
>  static void test_no_zicboz(void *arg)
> @@ -81,6 +85,30 @@ static bool is_power_of_2(__u64 n)
>  	return n != 0 && (n & (n - 1)) == 0;
>  }
>  
> +static void test_zicbom(void *arg)
> +{
> +	struct riscv_hwprobe pair = {
> +		.key = RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE,
> +	};
> +	cpu_set_t *cpus = (cpu_set_t *)arg;
> +	__u64 block_size;
> +	long rc;
> +
> +	rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)cpus, 0);
> +	block_size = pair.value;
> +	ksft_test_result(rc == 0 && pair.key == RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE &&
> +			 is_power_of_2(block_size), "Zicbom block size\n");
> +	ksft_print_msg("Zicbom block size: %llu\n", block_size);
> +
> +	illegal_insn = false;
> +	cbo_clean(&mem[block_size]);
> +	ksft_test_result(!illegal_insn, "cbo.clean\n");
> +
> +	illegal_insn = false;
> +	cbo_flush(&mem[block_size]);
> +	ksft_test_result(!illegal_insn, "cbo.flush\n");
> +}
> +
>  static void test_zicboz(void *arg)
>  {
>  	struct riscv_hwprobe pair = {
> @@ -129,7 +157,7 @@ static void test_zicboz(void *arg)
>  	ksft_test_result_pass("cbo.zero check\n");
>  }
>  
> -static void check_no_zicboz_cpus(cpu_set_t *cpus)
> +static void check_no_zicbo_cpus(cpu_set_t *cpus, __u64 cbo)
>  {
>  	struct riscv_hwprobe pair = {
>  		.key = RISCV_HWPROBE_KEY_IMA_EXT_0,
> @@ -137,6 +165,7 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
>  	cpu_set_t one_cpu;
>  	int i = 0, c = 0;
>  	long rc;
> +	char *cbostr;
>  
>  	while (i++ < CPU_COUNT(cpus)) {
>  		while (!CPU_ISSET(c, cpus))
> @@ -148,10 +177,13 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
>  		rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)&one_cpu, 0);
>  		assert(rc == 0 && pair.key == RISCV_HWPROBE_KEY_IMA_EXT_0);
>  
> -		if (pair.value & RISCV_HWPROBE_EXT_ZICBOZ)
> -			ksft_exit_fail_msg("Zicboz is only present on a subset of harts.\n"
> -					   "Use taskset to select a set of harts where Zicboz\n"
> -					   "presence (present or not) is consistent for each hart\n");
> +		cbostr = cbo == RISCV_HWPROBE_EXT_ZICBOZ ? "Zicboz" : "Zicbom";
> +
> +		if (pair.value & cbo)
> +			ksft_exit_fail_msg("%s is only present on a subset of harts.\n"
> +					   "Use taskset to select a set of harts where %s\n"
> +					   "presence (present or not) is consistent for each hart\n",
> +					   cbostr, cbostr);
>  		++c;
>  	}
>  }
> @@ -159,7 +191,9 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
>  enum {
>  	TEST_ZICBOZ,
>  	TEST_NO_ZICBOZ,
> +	TEST_ZICBOM,
>  	TEST_NO_ZICBOM,
> +	TEST_NO_ZICBOINVAL,

nit: TEST_NO_CBO_INVAL would be a better name.

>  };
>  
>  static struct test_info {
> @@ -169,7 +203,9 @@ static struct test_info {
>  } tests[] = {
>  	[TEST_ZICBOZ]		= { .nr_tests = 3, test_zicboz },
>  	[TEST_NO_ZICBOZ]	= { .nr_tests = 1, test_no_zicboz },
> -	[TEST_NO_ZICBOM]	= { .nr_tests = 3, test_no_zicbom },
> +	[TEST_ZICBOM]		= { .nr_tests = 3, test_zicbom },
> +	[TEST_NO_ZICBOM]	= { .nr_tests = 2, test_no_zicbom },
> +	[TEST_NO_ZICBOINVAL]	= { .nr_tests = 1, test_no_cbo_inval },
>  };
>  
>  int main(int argc, char **argv)
> @@ -189,6 +225,7 @@ int main(int argc, char **argv)
>  		assert(rc == 0);
>  		tests[TEST_NO_ZICBOZ].enabled = true;
>  		tests[TEST_NO_ZICBOM].enabled = true;
> +		tests[TEST_NO_ZICBOINVAL].enabled = true;
>  	}
>  
>  	rc = sched_getaffinity(0, sizeof(cpu_set_t), &cpus);
> @@ -206,7 +243,14 @@ int main(int argc, char **argv)
>  		tests[TEST_ZICBOZ].enabled = true;
>  		tests[TEST_NO_ZICBOZ].enabled = false;
>  	} else {
> -		check_no_zicboz_cpus(&cpus);
> +		check_no_zicbo_cpus(&cpus, RISCV_HWPROBE_EXT_ZICBOZ);
> +	}
> +
> +	if (pair.value & RISCV_HWPROBE_EXT_ZICBOM) {
> +		tests[TEST_ZICBOM].enabled = true;
> +		tests[TEST_NO_ZICBOM].enabled = false;
> +	} else {
> +		check_no_zicbo_cpus(&cpus, RISCV_HWPROBE_EXT_ZICBOM);
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(tests); ++i)
> -- 
> 2.39.2
>

Besides the nit,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
