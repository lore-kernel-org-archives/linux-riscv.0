Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB68BC25B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 12:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOMIUIT5MTmauK2MfZfy52Gtmx4ASt9Lz2e1EbsGyM0=; b=OlVxO5AfYXp9pm
	lIx65fELpx/6mNFOhaNfL8E7HeZMHgAM9k8hFsl5U1kgeYvs7inC0+CaeyZw4LMmjlPjrx3erVb/q
	SlFHgIWxf++tj3Uhxpp//tXaLnc8xCSG4RQNU8XcpOtj2Tgi095YOQWMQQsE3VaDK5mDrdSJhxVEx
	ToRNhM4JimxxdMdoxIS3TtmDlj75xwhT9DWd4fMhIZ77s+pbQTtBHadqunTYT/BI881E9Grbq+EFI
	+uB/Fz78UG0gCLdVLrN9L3o+TzinZLYHyk6b4eQj5KDz80GJS93tbD3tYT1uvsRQtIHSKQKHqclEk
	VXFRvmdxf/6AV4quCFFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9kfy-00000002rGz-0PEJ;
	Wed, 22 May 2024 12:02:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9kfu-00000002rFa-1Jvd
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 12:02:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9CB02CE11A1;
	Wed, 22 May 2024 12:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85904C2BD11;
	Wed, 22 May 2024 12:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716379346;
	bh=EMJVT5ZakDgrWxq+Pzu18YJ1rO0NK5CfLgZ0nMojMYU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=nelYOGVGN6SeA/MqZPRrHYH3CNr81B6sLCq+x2diVvbQ/bjR2LAKWPe2UjlLFI76V
	 4BxzcsJbNXwbJH1mUzNt8/c6ww8iujAX9repqNTCFMl3o1cD32xzBOfID9S5hd2SQY
	 hIpgm23AwqT4s+QO23a9cDRtMBEexa2UpkCc77kEhq6n/uwRJGmm/EeUOQHBLOT8FC
	 hHGbvNvdVWZoDhGwLf2cn+lSmMOrwqxQ49xatAopsHB9N7gDGIOeL60WEp/oAlLnoS
	 x5WGOuEzlh9k18P8tsZYMm8H9toKZ/NnCe/KmhseHzTPiIkNGHqXtgpaf+2ibeR04N
	 c+17AzCNNwi2A==
Mime-Version: 1.0
Date: Wed, 22 May 2024 15:02:19 +0300
Message-Id: <D1G5P3B6BWGG.3EOYXHHI5MYPZ@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <kernel-team@android.com>, <linux-security-module@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <bpf@vger.kernel.org>, "kernel test robot" <oliver.sang@intel.com>,
 <linux-sgx@vger.kernel.org>
Subject: Re: [PATCH v5 57/68] selftests/sgx: Compile with -D_GNU_SOURCE
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Edward Liaw" <edliaw@google.com>, <shuah@kernel.org>,
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, "Christian Brauner"
 <brauner@kernel.org>, "Richard Cochran" <richardcochran@gmail.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexei
 Starovoitov" <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "David S. Miller" <davem@davemloft.net>, "Jakub Kicinski"
 <kuba@kernel.org>, "Jesper Dangaard Brouer" <hawk@kernel.org>, "John
 Fastabend" <john.fastabend@gmail.com>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Muhammad Usama Anjum" <usama.anjum@collabora.com>
X-Mailer: aerc 0.17.0
References: <20240522005913.3540131-1-edliaw@google.com>
 <20240522005913.3540131-58-edliaw@google.com>
In-Reply-To: <20240522005913.3540131-58-edliaw@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_050230_765789_5506AF89 
X-CRM114-Status: GOOD (  10.08  )
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

On Wed May 22, 2024 at 3:57 AM EEST, Edward Liaw wrote:
> Add -D_GNU_SOURCE to HOST_CFLAGS and remove #define _GNU_SOURCE.
>
> Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202404301040.3bea5782-oliver.sang@intel.com
> Signed-off-by: Edward Liaw <edliaw@google.com>
> ---
>  tools/testing/selftests/sgx/Makefile    | 2 +-
>  tools/testing/selftests/sgx/sigstruct.c | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/sgx/Makefile b/tools/testing/selftests/sgx/Makefile
> index 867f88ce2570..272da790d9ae 100644
> --- a/tools/testing/selftests/sgx/Makefile
> +++ b/tools/testing/selftests/sgx/Makefile
> @@ -12,7 +12,7 @@ OBJCOPY := $(CROSS_COMPILE)objcopy
>  endif
>  
>  INCLUDES := -I$(top_srcdir)/tools/include
> -HOST_CFLAGS := -Wall -Werror -g $(INCLUDES) -fPIC
> +HOST_CFLAGS := -Wall -Werror -g $(INCLUDES) -fPIC -D_GNU_SOURCE
>  HOST_LDFLAGS := -z noexecstack -lcrypto
>  ENCL_CFLAGS += -Wall -Werror -static-pie -nostdlib -ffreestanding -fPIE \
>  	       -fno-stack-protector -mrdrnd $(INCLUDES)
> diff --git a/tools/testing/selftests/sgx/sigstruct.c b/tools/testing/selftests/sgx/sigstruct.c
> index d73b29becf5b..200034a0fee5 100644
> --- a/tools/testing/selftests/sgx/sigstruct.c
> +++ b/tools/testing/selftests/sgx/sigstruct.c
> @@ -1,7 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*  Copyright(c) 2016-20 Intel Corporation. */
>  
> -#define _GNU_SOURCE
>  #include <assert.h>
>  #include <getopt.h>
>  #include <stdbool.h>

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
