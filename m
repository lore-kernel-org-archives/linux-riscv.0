Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3BCC25B4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 07:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IBnPBT6MCyCwJZYInmKwH4kZ9MZDaCKEqfhgQhtbldA=; b=U29rf07QhacxlC
	OmO/CrBGMJecgyj/dITpAIRBWMcsaMqKD9+WOM2ufg0j8noAd1/plvhP8ZzIn9m42p3hRckxZXiBx
	s2Jm0TKS7y4Ih3yAkA8cGE8sZoPlgMTZVkaOlpuTVRSZMMOEnfHi2MEzz8Qew8hBgiosdl7ZFW77r
	IZBl6c6tlS8NqHoPpuVg7YuTGtsxD+a+BIUtDsj7CjzZYGNS2JTjteq0gSv89nUVsfuPrg9H8J1cr
	Emm9kzit4SXfxMdq5BE2SFFPwpVOYFkYolgoDYm4Eykq9lFZAr7SPXLlKsafQRHLZhdbK67G+F0r2
	tl+AJult4ElJ3SN6ONxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4c3D-0000000ETbP-0S7Z;
	Wed, 08 May 2024 07:49:19 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4c34-0000000ETUt-1VD8;
	Wed, 08 May 2024 07:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715154544;
	bh=MofcZIwCP6uQfQVp6EE9HurxL3czn6diXGm18p/OF50=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=MbV/DHwtYAujOpXoDCW0s0KB5riHG/p4OMQuvDB00Pz7/gzHkZrQVMbWFe8RMvmKa
	 E7/eZm+J0KkW6WdglkC3NhaZhrrqLwrLM/rN6pAvFjHBThsazg6zRLYCYBJKWtjUwR
	 eLafdjBQjRl8tFVMXaPf7ETS5Spz1U0TN2/pXHhbkRMUKnerr3EUzBLw1LELesDSjx
	 ww1UwcyShSZE5MdiI2h1EXPosoRI0u6sJbDL1yLfBCglfBakx0ihDdtGsu1uPdwGRy
	 epZ0TaGCSSjrbxIQaccEYwAzomyOHcnd+TiIXNmGJ4FavJjakZ9om8hZy1/HJ08OvK
	 /vO//iWp1Vbsw==
Received: from [10.193.1.1] (broslavsky.collaboradmins.com [68.183.210.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C668C378107C;
	Wed,  8 May 2024 07:48:36 +0000 (UTC)
Message-ID: <546aaaa7-d796-46af-8805-1612759aaaa5@collabora.com>
Date: Wed, 8 May 2024 12:48:57 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@android.com, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-input@vger.kernel.org, iommu@lists.linux.dev, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org,
 linux-actions@lists.infradead.org, mptcp@lists.linux.dev,
 linux-rtc@vger.kernel.org, linux-sgx@vger.kernel.org, bpf@vger.kernel.org,
 kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH v2 1/5] selftests: Compile kselftest headers with
 -D_GNU_SOURCE
To: Edward Liaw <edliaw@google.com>, shuah@kernel.org,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Christian Brauner
 <brauner@kernel.org>, Eric Biederman <ebiederm@xmission.com>,
 Kees Cook <keescook@chromium.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Andy Lutomirski <luto@amacapital.net>,
 Will Drewry <wad@chromium.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?=
 <mic@digikod.net>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Andrew Morton <akpm@linux-foundation.org>, Seth Forshee
 <sforshee@kernel.org>, Bongsu Jeon <bongsu.jeon@samsung.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Matthieu Baerts <matttbe@kernel.org>,
 Mat Martineau <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Fenghua Yu <fenghua.yu@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20240507214254.2787305-1-edliaw@google.com>
 <20240507214254.2787305-2-edliaw@google.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20240507214254.2787305-2-edliaw@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_004910_557828_B160B6E8 
X-CRM114-Status: GOOD (  19.08  )
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

Thanks for patches

On 5/8/24 2:38 AM, Edward Liaw wrote:
> Add the -D_GNU_SOURCE flag to KHDR_INCLUDES so that it is defined in a
> central location.
> 
> 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
> asprintf into kselftest_harness.h, which is a GNU extension and needs
> _GNU_SOURCE to either be defined prior to including headers or with the
> -D_GNU_SOURCE flag passed to the compiler.
> 
> Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202404301040.3bea5782-oliver.sang@intel.com
> Signed-off-by: Edward Liaw <edliaw@google.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

> ---
>  tools/testing/selftests/Makefile            | 4 ++--
>  tools/testing/selftests/kselftest_harness.h | 2 +-
>  tools/testing/selftests/lib.mk              | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index e1504833654d..ed012a7f0786 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -161,11 +161,11 @@ ifneq ($(KBUILD_OUTPUT),)
>    # $(realpath ...) resolves symlinks
>    abs_objtree := $(realpath $(abs_objtree))
>    BUILD := $(abs_objtree)/kselftest
> -  KHDR_INCLUDES := -isystem ${abs_objtree}/usr/include
> +  KHDR_INCLUDES := -D_GNU_SOURCE -isystem ${abs_objtree}/usr/include
>  else
>    BUILD := $(CURDIR)
>    abs_srctree := $(shell cd $(top_srcdir) && pwd)
> -  KHDR_INCLUDES := -isystem ${abs_srctree}/usr/include
> +  KHDR_INCLUDES := -D_GNU_SOURCE -isystem ${abs_srctree}/usr/include
>    DEFAULT_INSTALL_HDR_PATH := 1
>  endif
>  
> diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
> index d98702b6955d..b2a1b6343896 100644
> --- a/tools/testing/selftests/kselftest_harness.h
> +++ b/tools/testing/selftests/kselftest_harness.h
> @@ -51,7 +51,7 @@
>  #define __KSELFTEST_HARNESS_H
>  
>  #ifndef _GNU_SOURCE
> -#define _GNU_SOURCE
> +static_assert(0, "kselftest harness requires _GNU_SOURCE to be defined");
>  #endif
>  #include <asm/types.h>
>  #include <ctype.h>
> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
> index da2cade3bab0..2503dc732b4d 100644
> --- a/tools/testing/selftests/lib.mk
> +++ b/tools/testing/selftests/lib.mk
> @@ -45,7 +45,7 @@ selfdir = $(realpath $(dir $(filter %/lib.mk,$(MAKEFILE_LIST))))
>  top_srcdir = $(selfdir)/../../..
>  
>  ifeq ($(KHDR_INCLUDES),)
> -KHDR_INCLUDES := -isystem $(top_srcdir)/usr/include
> +KHDR_INCLUDES := -D_GNU_SOURCE -isystem $(top_srcdir)/usr/include
>  endif
>  
>  # The following are built by lib.mk common compile rules.

-- 
BR,
Muhammad Usama Anjum

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
