Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57A0E7719E
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 09:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PXHLGj+UF6cWpWJg1ltWaHMWBgBWK1Li7+sDn/4jwPc=; b=P7JdXly6NygxpU
	jQ4mg54gb5Mje4wsPpcEel8WyBuyq4Titk4b/6YhhY3hvoECeFeS/wXelwNfld8L6+D3Z3xkkkeQT
	GzcgH7I1w+pI84PDaL+wHFOaf8iDLsTjyeopAx+9tbeGgFZU57C4cEKeEVRupXQwoN06dnRugXCzS
	cC9QFAW53S2Gzkq4la4+H8Vo3GEMvCKRMc4UETIN4i6oBKLCvOO0l+ugygWyfEN4NLd+23CoioIU+
	HbeYNRUcWAg5IlaV/LZkxPBEI2tlOZQSZb/Do5mBElpyRs3Q86sh5tatm1OlOo8VOBHqnxGvyDgEf
	YMby/xyKWu2WgZuZc7EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGg5-00000004ahW-3lzr;
	Mon, 13 Jan 2025 09:24:09 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGaJ-00000004ZXc-2znj
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 09:18:12 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d90a5581fcso6788311a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 01:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736759890; x=1737364690; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i7ow4LmK8LAIX2pz+FFCl7mzerfRukfRpE2elRTOITM=;
        b=MmNoR+nbAp//j93a1PVPZrvyDFekYEMsLy2Q7iyEzCZqLiaL85pUh90mHXMgGSHItf
         bpJTYqVnZmv/waJe3nRkteOdoSEbk/AvvKpsG/TojY2Z2+0GIpyqe0ovK6ECkiKIXc2z
         R+qan0g7MMQ+jJ8f1PQJPDUpP8799GBG90kNOL2PtEFlx4KOPXzHRmKnoFPBuV+ClI4d
         B2H40GhVrCHMPGJUEjlmAlfYTvmSmiNUdK970RD6D5sfPozvwxK/5RQl1/4BECXZSPbY
         5GgQyAqJh7/bOYHsTfPbbVlYOm5jWzpWxbzhptm+bxOg0KxTS96mdzyQ3fBDqCXc6aGq
         XMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736759890; x=1737364690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7ow4LmK8LAIX2pz+FFCl7mzerfRukfRpE2elRTOITM=;
        b=XXGSXObTcfFpaa++JRQINKygwFei7LdHtmLCMJHSvkxXci7xsM/2bmmHPU+cUIfIuw
         cpgP+MKb3HqIHdoYLb4C/5xGl2pbhiPXuDGs/Rpxq/+BYSpInA1R8herkdnWve4bz8wZ
         bJlFbAnDUIavkbEG/Yt++xRK9QxxZSMr0Iu5JTGHk6FDNGYhSY30QBjPQivVlMFZDCLp
         QDR7RQSx0JFnKJb2wRz1NL13eu8xWZql3NIM+1798n96bq7ZAVVc7NAF6b6OAWF0SWF8
         NhHgbPzQn78TVrUhwzgqAyqd3Q13xDP494sl4CsGL/CELNJWvGm0x3HPABRXwx/23pLe
         Qc+w==
X-Forwarded-Encrypted: i=1; AJvYcCUmjkHpF+AtIGvhKGjh6g2gvUWvYHUSISfIFwd/zMT9TjKCDHP4UjEifzR+9KGxgWIh4zGrrzOhVp54lQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYldGRbHg6xd45lsYwFibwSspCBqHjJHJj6HbxOkxqgs4eNU9v
	irdfP4xblEj3f6CKV35gjZaTLtfceHTxi8Rqw0YVwGJQCsWW1q4Kpiyvqn7YVSU=
X-Gm-Gg: ASbGncudvsufgolbaHLHAOGZokB24fZH+ckTZK6Jw5wawCP8lWVGi6n+2BhAQjUC7Z3
	DIjvIGT9FXzajff5kHXmYOUuT11iZKDu9Hzl6HW32b0qCLtzdcCnnnQips28ol0XBpfJyr2UUCJ
	EFC358bKnNuxwrd7kBtg5Gejf3nPZl2axcP2cCVGHz/4mA70cNdgVcHfyhDm6D8vFT0ezol8bVG
	Iz+Y+BJWxJQK0165oY/uEJq/cPB4wQur35qwb2BebqXeUkAx76uWxL1Hij6M//wWUWBQmXgdeDD
	feeB9JLktg0JdGDewDZth6uJfZ91t8TOuKqmPme3Pg==
X-Google-Smtp-Source: AGHT+IH1rRhvK49925uTYwm7NvAMhca9Bp5YhadD93H9N4IOJBblIVLz1qkvp3f0hmehiooacU8gIg==
X-Received: by 2002:a05:6402:3225:b0:5d3:bab1:513f with SMTP id 4fb4d7f45d1cf-5d972e178cbmr21227303a12.18.1736759889858;
        Mon, 13 Jan 2025 01:18:09 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d98fe8f68csm4683842a12.0.2025.01.13.01.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:18:08 -0800 (PST)
Date: Mon, 13 Jan 2025 10:18:07 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	samuel.holland@sifive.com, shuah@kernel.org
Subject: Re: [PATCH v3 3/3] RISC-V: selftests: Add TEST_ZICBOM into CBO tests
Message-ID: <20250113-cb08bcb35bc8b6213fe89ecd@orel>
References: <20250113083635.73826-1-cuiyunhui@bytedance.com>
 <20250113083635.73826-3-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250113083635.73826-3-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_011811_758074_D23B9200 
X-CRM114-Status: GOOD (  25.67  )
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

On Mon, Jan 13, 2025 at 04:36:35PM +0800, Yunhui Cui wrote:
> Add test for Zicbom and its block size into CBO tests, when
> Zicbom is present, test that cbo.clean/flush may be issued and works.
> As the software can't verify the clean/flush functions, we just judged
> that cbo.clean/flush isn't executed illegally.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  tools/testing/selftests/riscv/hwprobe/cbo.c | 49 ++++++++++++++++++---
>  1 file changed, 43 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
> index a40541bb7c7d..b63e23f95e08 100644
> --- a/tools/testing/selftests/riscv/hwprobe/cbo.c
> +++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
> @@ -81,6 +81,30 @@ static bool is_power_of_2(__u64 n)
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
> @@ -129,7 +153,7 @@ static void test_zicboz(void *arg)
>  	ksft_test_result_pass("cbo.zero check\n");
>  }
>  
> -static void check_no_zicboz_cpus(cpu_set_t *cpus)
> +static void check_no_zicbo_cpus(cpu_set_t *cpus, __u64 cbo)
>  {
>  	struct riscv_hwprobe pair = {
>  		.key = RISCV_HWPROBE_KEY_IMA_EXT_0,
> @@ -137,6 +161,7 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
>  	cpu_set_t one_cpu;
>  	int i = 0, c = 0;
>  	long rc;
> +	char *cbostr;
>  
>  	while (i++ < CPU_COUNT(cpus)) {
>  		while (!CPU_ISSET(c, cpus))
> @@ -148,10 +173,13 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
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
> @@ -159,6 +187,7 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
>  enum {
>  	TEST_ZICBOZ,
>  	TEST_NO_ZICBOZ,
> +	TEST_ZICBOM,
>  	TEST_NO_ZICBOM,
>  };
>  
> @@ -169,6 +198,7 @@ static struct test_info {
>  } tests[] = {
>  	[TEST_ZICBOZ]		= { .nr_tests = 3, test_zicboz },
>  	[TEST_NO_ZICBOZ]	= { .nr_tests = 1, test_no_zicboz },
> +	[TEST_ZICBOM]		= { .nr_tests = 3, test_zicbom },
>  	[TEST_NO_ZICBOM]	= { .nr_tests = 3, test_no_zicbom },
>  };
>  
> @@ -206,7 +236,14 @@ int main(int argc, char **argv)
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

The test_no_zicbom() test needs to have the illegal instruction SIGILL
test for cbo.inval moved out into its own test. So, even when we have
zicbom we still test that cbo.inval generates a SIGILL.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
