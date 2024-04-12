Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51373C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 06:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=txj2FiYgTj9n4pmaxhvotRxmAOFLwZ65r0eQSur90ug=; b=BJ/toFg0mkfWQt
	Du2o9Ou/oeQRYuabUyiNAMisEo4e4aRlu0NNV3bk1i5ceqf1LYnBfi9XHT3P9Z2+2mS3PfuFDcayt
	q4HoBH7VfS9cvuZ6sVGVJaHyqX+Om5I0igrfl9iW4UyuWcE7IOsMUWXsD+PCgCosWCv3AQfiRpQOO
	2pHKfvvAlVVTya7BbpaeLQ6scp95pNoop+jfpCk0+oFKjqNHvUTC/ukIZpN3Q5jxEDGJWaadlFFER
	XNCBB7ICXQfvz0nfwj9yLCfX9t4KwkwksLsDgnLTobtm24TQv35KrYnHVZWUhTbd2u6TO8oiqxKDE
	a+HpIDUrBFn16taoaDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA73-0000000FW5R-0mUz;
	Fri, 12 Apr 2024 06:10:13 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA6y-0000000FW3S-3uV9;
	Fri, 12 Apr 2024 06:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712902187; bh=RCpuUG8Y6qQzCbQ/bfUjCb8eAFDKLZHys2TWAmXqEP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=roV5U5VOLfFFuSA66RHFtd7DlpW3fjYMRUPDqFI4aOTdWqGNrZmfcg+iP+kqcYPgK
	 cqvz9pn0atBRzLHYoRMhzQDWoHZzVYmYZZPKbtb7OjkXAlhZdP65CGaIJE8Z0CFZQX
	 ExGcMlD8wmaHdaiDpWKLKNy91li4bIYIreA0kzVc=
Received: from Yangyus-MBP-2.lan ([219.141.235.82])
	by newxmesmtplogicsvrszb9-1.qq.com (NewEsmtp) with SMTP
	id 26A92058; Fri, 12 Apr 2024 14:09:42 +0800
X-QQ-mid: xmsmtpt1712902182tfspx6bgu
Message-ID: <tencent_29B81A312921AB8D9D7C3C8292DAAB8EF608@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNzn35bFmb+L32haCejewhnm0tL5u10kQJA0x4jKl0RKQqRqKkkeFJ
	 Fg4gmNCDe9dtErpMNgMglLVMZeDwgKhv10ZTSliNR+2NMa8JAbCF0xv12hwnluevmQ4Ge7phRXsZ
	 /2rYdrKJI/DEc0yHHFHhQ4moVMMw/wmXOX1ZrHs5hhs8SdJUzEWIz+PNwA4RhF2zwVnfjAKS7KnO
	 Z0n6//9rIarmviIB3JOPsBb7dSVuQlk6FtbMV6XIJC8vypa/q3gleY5sb+DH1pRgA2KWpaVN8j77
	 aBkOdU4T5xXQj5Etw0BQqVrDOxGSKN3fYR78BBIU84T1gRqgMugeE72Go1rOberoZ37eQ7uIdmKz
	 N9SQs7tJfFtF7k/f+nKcpSnDFaCEWEf97tMvT+jjd5TJeSuoT6gl6CDLUGGhi1ccdTttrtvXW+Qt
	 CfoTK9dBQnVuxRDicMrlZ/S9aOuc9f1IrJLUpBGyPz+bTPK/pb2x0x91ucYqyesit/RY33Ng3yFn
	 /c2bMA6gXgPAluy0foT7SdgFNAySkZB5Nl5bsSPPh14TpWNC1UgcasoG9QX9d9IDMawfWupZPOfl
	 zr9dUwduoqBmqBDGccZGBEwUExeo6roCmbf5QGL48QabybjdZZmCaeJmmBGoZLBafqWcrqdBff26
	 XIlamWmtbC3OxqHc6ZLHiKnAuI/HMvHhUTXXY2DeEzDPq+T4z8LWYb1S0kFUximiTerLFZHk1scS
	 3cSwnU8EGT0lD6fbVSk4m8ps24y7TMDp7jlunjfICDXdxYBXZ3gL9s/nR7cx/FtnrVsvgV2V83qq
	 zEgGEfC8uoYZi12qJ3TD2FNOFtAzu4YRevGxh5eJkbBS6ImpuWw3kgZvRwB3hU2ZkeOqrnX8PG9u
	 FfYmxxe4PKvsoAC8DnnDXmFi73XXOuwc3JlOqSWxrJgHKYlGyk+jsNwguo5ClA6+RV9X/FR0eGdg
	 L5SDlkNDyREWq6BKtawErREgOUpddUKcm5wxCKYO0Bq99DzZHYZTs1Fwv7hfXnRWUIQZ6JOFbUdq
	 WxhJqAcpgZVYYEiBVl
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Yangyu Chen <cyy@cyyself.name>
To: dqfext@gmail.com
Cc: ajones@ventanamicro.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atishp@atishpatra.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	mark.rutland@arm.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	will@kernel.org,
	guoren@kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH] perf: RISC-V: fix IRQ detection on T-Head C908
Date: Fri, 12 Apr 2024 14:09:32 +0800
X-OQ-MSGID: <20240412060932.54327-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240311063018.1886757-1-dqfext@gmail.com>
References: <20240311063018.1886757-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_231009_654112_727BE821 
X-CRM114-Status: GOOD (  18.38  )
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

On 2024/3/11 14:30, Qingfang Deng wrote:
> T-Head C908 has the same IRQ num and CSR as previous C9xx cores, but
> reports non-zero marchid and mimpid. Remove the ID checks.
> 
> Fixes: 65e9fb081877 ("drivers/perf: riscv_pmu_sbi: add support for PMU variant on T-Head C9xx cores")
> Signed-off-by: Qingfang Deng<dqfext@gmail.com>
> ---
>   arch/riscv/errata/thead/errata.c | 4 ----
>   drivers/perf/riscv_pmu_sbi.c     | 4 +---
>   2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index b1c410bbc1ae..49ccad5b21bb 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -125,10 +125,6 @@ static bool errata_probe_pmu(unsigned int stage,
>   	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_PMU))
>   		return false;
>   
> -	/* target-c9xx cores report arch_id and impid as 0 */
> -	if (arch_id != 0 || impid != 0)
> -		return false;
> -
>   	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
>   		return false;
>   
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 452aab49db1e..87b83184383a 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -811,9 +811,7 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
>   		riscv_pmu_irq_num = RV_IRQ_PMU;
>   		riscv_pmu_use_irq = true;
>   	} else if (IS_ENABLED(CONFIG_ERRATA_THEAD_PMU) &&
> -		   riscv_cached_mvendorid(0) == THEAD_VENDOR_ID &&
> -		   riscv_cached_marchid(0) == 0 &&
> -		   riscv_cached_mimpid(0) == 0) {
> +		   riscv_cached_mvendorid(0) == THEAD_VENDOR_ID) {
>   		riscv_pmu_irq_num = THEAD_C9XX_RV_IRQ_PMU;
>   		riscv_pmu_use_irq = true;
>   	}
> -- 2.34.1

Tested-by: Yangyu Chen <cyy@cyyself.name>

With this patch and T-Head C908 PMU being probed by OpenSBI, I can now use
the perf record to profile RVV 1.0 software on Canaan Kendryte K230. This
will speed up many RVV 1.0 software developments now and even for better
performance.

However, as Inochi said, the newer version, C908 may support Sccofpmf. We
should ask Guo Ren to clarify this so we can have the cleanest way to
probe what to use between THEAD_PMU and Sscofpmu.

I added CC to Guo Ren. Please clarify about this.

Some off-topic things:

I need this feature recently since I am implementing a pure RVV chacha20
algorithm. I have already sent PR to openssl to speed up the crypto
performance on RVV without Zvkb support and maybe ported to kernel crypto
sometimes. To speed up TLS or other applications for many chips that may
come this year with RVV 1.0 but without Zvkb.

Link: https://github.com/openssl/openssl/pull/24069

However, the performance evaluation on K230 is not well compared to pure C
implementation. I will need this PMU driver to do some profiling.

Thanks,
Yangyu Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
