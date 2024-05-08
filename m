Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3A8C04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 13:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SaLDEF4F7+GXyjGlj+aghEJLbkFziMVbmQUh6aBMfHk=; b=WxOLwklgtUJl1fiEYbOTKWtjac
	trcMv3vq33c4SPpP2P/rjD67vrOidAbQjgEuespg4L6XOL3gZuwdA6qw36wgPDQZPOViGmubB7978
	V/FsYi6OO1OBJI0mkcwY03Jm8Nm8pROnSNB11z/X4j3CytiJLQZrl744lzuRddKXsyMhoPMu8AAQd
	c67hOCvOM6u82yOVuPYkfqK3q6myTidL5xbTEM9JqCc45Jmsr5jfC0gBztBjNRVsclA7cDutG+UHJ
	BAfDezvmz9TL6427H8s+y3OsPZyChzVuZDkco0LBnP/Qo9Fbz8Sod/IWLorVQ9BBoxfR5CaFgv8u2
	fwYWqSkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4hl9-0000000Fktb-24wI;
	Wed, 08 May 2024 13:55:03 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4hkx-0000000Fkka-2q48
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 13:55:01 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-de5a8638579so8165213276.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715176482; x=1715781282; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qrxifLi18HwIXN/paZijnWPdESXfJJzxe/+u8UtVff4=;
        b=hGMqGgXl0hiqffOFLMKvE3VVf/qCjgXoxcNJQSLknEjN1dvAwsonVbMGL4KytxkXTN
         990Qzm6upRaMQahb3oFEGVHOGV44yEzb8Pahx1+CP21jVGSlzX/aUoCEidA6yBZ9kkZX
         9dcElm//rUaeU2xw1l7eQ2JtMpCxM4TW8T5EuuC4smRiORS893kPTPLVxEcJGx74Jstv
         lZsJIJYjjHf0mNnbSBwaXOh0DjOzQxzx/aHPg1rZleJp2FSfKeDTEaEmqaANrUYjhfv9
         TiAkhSMbCLJ0ac3BuZzwR2lPwWoBzvZqbXDi70MR3p8eZBBOUg8gG1mm5cYtbaaD0Nqr
         Dckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715176482; x=1715781282;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrxifLi18HwIXN/paZijnWPdESXfJJzxe/+u8UtVff4=;
        b=h7r8C/O0X56PRb40oW4ZaXEhe9mdSveBJOvYQw4wGHECnP31/OTA3oSnh2esrVz435
         8b3K2bm52ElzzyeUdnS72DQGHBAI2fq9vhrq+JJVuDQx3CdHf4XQpSg1mkY9lk9upDef
         TWZKNk8SfdbvMdl6hodfEUI6/e8QkNHhowac69qqUyOG5pJ1lR6/IsLwIXjMktbXYOwM
         CzskRx8+RfoGDyfmUaFjsGW8ixl3V6UKjDFsLJFEOZtPVh1Mw4Lu46mgRJLgWp/hDy0N
         YuOdaPklYGjcfN54UqvgiQEwmne7LXs1AO+cZHQpVOwm9Utwp3elfJGE9koW3BLa8TWx
         Xwzg==
X-Forwarded-Encrypted: i=1; AJvYcCWA0aQ3H6jo+Ia2s/KtcfncyuY1+h4ELzrh1OlnYEaDK7vqrsPCAhXY0rEGhDHxjUX3PyDBzFaEuAtkbkr/BbY1AO3pycyzLYaWK+II9S+Q
X-Gm-Message-State: AOJu0YzW9zNsrx2GN5Mr0ph4ZigOwKBuoJKZGLOS8ZJxx9bDdmwv7cNy
	6lffpikMaZXN36c7iwTQlqA6ab9nEH62hhHND4foYzH6YX81x3moG8oVjkL+mKZRmAaoK4ijBdT
	M+w==
X-Google-Smtp-Source: AGHT+IGJRBi1UvMX9yVwIeeKPJ5i4MXrMA7fvNEnU0sh0JI0w6+2/9z2FlMIObyx5JUsUOMhiA6kQPpm0zI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:18c8:b0:dd9:2789:17fb with SMTP id
 3f1490d57ef6-debb9cfd19bmr223701276.3.1715176481930; Wed, 08 May 2024
 06:54:41 -0700 (PDT)
Date: Wed, 8 May 2024 06:54:40 -0700
In-Reply-To: <20240507214254.2787305-5-edliaw@google.com>
Mime-Version: 1.0
References: <20240507214254.2787305-1-edliaw@google.com> <20240507214254.2787305-5-edliaw@google.com>
Message-ID: <ZjuEILj0SZRuTL9I@google.com>
Subject: Re: [PATCH v2 4/5] selftests: Drop define _GNU_SOURCE
From: Sean Christopherson <seanjc@google.com>
To: Edward Liaw <edliaw@google.com>
Cc: shuah@kernel.org, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Christian Brauner <brauner@kernel.org>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, "=?utf-8?B?QW5kcsOp?= Almeida" <andrealmeid@igalia.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Kevin Tian <kevin.tian@intel.com>, Andy Lutomirski <luto@amacapital.net>, 
	Will Drewry <wad@chromium.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	David Hildenbrand <david@redhat.com>, "=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Seth Forshee <sforshee@kernel.org>, 
	Bongsu Jeon <bongsu.jeon@samsung.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"Andreas =?utf-8?Q?F=C3=A4rber?=" <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-input@vger.kernel.org, iommu@lists.linux.dev, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-actions@lists.infradead.org, mptcp@lists.linux.dev, 
	linux-rtc@vger.kernel.org, linux-sgx@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_065451_784712_0C608044 
X-CRM114-Status: GOOD (  15.20  )
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

On Tue, May 07, 2024, Edward Liaw wrote:
> _GNU_SOURCE is provided by KHDR_INCLUDES, so it should be dropped to
> prevent _GNU_SOURCE redefined warnings.

...

> diff --git a/tools/testing/selftests/x86/test_syscall_vdso.c b/tools/testing/selftests/x86/test_syscall_vdso.c
> index 8965c311bd65..5cd13279bba5 100644
> --- a/tools/testing/selftests/x86/test_syscall_vdso.c
> +++ b/tools/testing/selftests/x86/test_syscall_vdso.c
> @@ -8,10 +8,6 @@
>   * Can be built statically:
>   * gcc -Os -Wall -static -m32 test_syscall_vdso.c thunks_32.S
>   */
> -#undef _GNU_SOURCE
> -#define _GNU_SOURCE 1
> -#undef __USE_GNU
> -#define __USE_GNU 1

AFAICT, manually defining __USE_GNU is frowned upon, so I'm guessing the __USE_GNU
stuff is just the result of misguided copy+paste.  But it would be nice to get
confirmation that this test isn't doing something clever.  Or at the very least,
explain the removal of __USE_GNU in the changelog.

>  #include <unistd.h>
>  #include <stdlib.h>
>  #include <string.h>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
