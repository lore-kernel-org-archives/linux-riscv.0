Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7297EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 11:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2v1LYBaBqyxCmJ7DiQD6+NgRzKfMt2IBKbS5oPBApG8=; b=QsgTkJodY9BQAY
	IlBWB2dK55KEyVyC0hzDY+5MBzMuEYkXhs8enpxJnxzb4rqQosVDUFkEXKO+yTKZn1tQCEB9BexQB
	yB2xCyRWahu9SI5iKDxXegiIcrkcJf2BVdCznkdpjcGofgD5KNZ/sFGr3jbQlgk+xtPsj3bOeWVvX
	xav/OW+HYDY7xwMJlvUe7bEnYMbXgriBenfrdReG2Zk52m39w3QJ7abadxIhAEauZDL6SiG2Z+cBF
	Z2P78nURgPI2/LwldULbG3jGm9clXsrpWsxdN9poxTUq+J+qYo4cM8kuGOzEE9wawwBNgA8+AtCo+
	rHYur4IF+27OsqtlvqmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuqq-00394U-22;
	Thu, 13 Jul 2023 11:51:16 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuqn-00392g-0K
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 11:51:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5DC2FF80D;
	Thu, 13 Jul 2023 11:51:02 +0000 (UTC)
Message-ID: <f903634d-851f-af64-8d9a-6b13d813587c@ghiti.fr>
Date: Thu, 13 Jul 2023 13:51:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] selftests/riscv: fix potential build failure during the
 "emit_tests" step
Content-Language: en-US
To: John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>, Andy Chiu <andy.chiu@sifive.com>,
 Evan Green <evan@rivosinc.com>, Hugh Dickins <hughd@google.com>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Qinglin Pan <panqinglin2020@iscas.ac.cn>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20230712193514.740033-1-jhubbard@nvidia.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230712193514.740033-1-jhubbard@nvidia.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_045113_293839_BA63C1FE 
X-CRM114-Status: GOOD (  21.24  )
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

Hi John,


On 12/07/2023 21:35, John Hubbard wrote:
> The riscv selftests (which were modeled after the arm64 selftests) are
> improperly declaring the "emit_tests" target to depend upon the "all"
> target. This approach, when combined with commit 9fc96c7c19df
> ("selftests: error out if kernel header files are not yet built"), has
> caused build failures [1] on arm64, and is likely to cause similar
> failures for riscv.
>
> To fix this, simply remove the unnecessary "all" dependency from the
> emit_tests target. The dependency is still effectively honored, because
> again, invocation is via "install", which also depends upon "all".
>
> An alternative approach would be to harden the emit_tests target so that
> it can depend upon "all", but that's a lot more complicated and hard to
> get right, and doesn't seem worth it, especially given that emit_tests
> should probably not be overridden at all.
>
> [1] https://lore.kernel.org/20230710-kselftest-fix-arm64-v1-1-48e872844f25@kernel.org
>
> Fixes: 9fc96c7c19df ("selftests: error out if kernel header files are not yet built")
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>
> Andrew,
>
> With this, and with my arm64 fix [2] that you've already put into
> mm-unstable, you should be able to safely drop commit 819187ab8741
> ("selftests: fix arm64 test installation").
>
> [2] https://lore.kernel.org/20230711005629.2547838-1-jhubbard@nvidia.com
>
> thanks,
> John Hubbard
>
>
>   tools/testing/selftests/riscv/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/riscv/Makefile b/tools/testing/selftests/riscv/Makefile
> index 9dd629cc86aa..f4b3d5c9af5b 100644
> --- a/tools/testing/selftests/riscv/Makefile
> +++ b/tools/testing/selftests/riscv/Makefile
> @@ -43,7 +43,7 @@ run_tests: all
>   	done
>   
>   # Avoid any output on non riscv on emit_tests
> -emit_tests: all
> +emit_tests:
>   	@for DIR in $(RISCV_SUBTARGETS); do				\
>   		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
>   		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
>
> base-commit: 3f01e9fed8454dcd89727016c3e5b2fbb8f8e50c
> prerequisite-patch-id: 37c92f7425689ff069fb83996a25cd98e78d7242


Perfect timing, I have just encountered this failure this morning:

make[5]: *** [../../lib.mk:81: kernel_header_files] Error 1

that your patch fixed :) So you can add:

Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thank you!

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
