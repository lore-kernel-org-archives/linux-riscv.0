Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5221C19F4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Qvce6kfW7460V0pZtq0Q9kk94ymXWKp+EvCxCyWl6IY=; b=u20MXikzhgaViBJ+3T6nSvMahF
	e6e9wEYhjwr33eEumcXJX3wE3JUX1JyW+4hac1Hmwhh7ZdKd2c5EbqGlOIFFt3BEuWTMQf4XyxgOv
	0J27slLkxewHf0c764mNj4M8JGx6G5oy2ybEA5LlOgWdrqqhCLQm1cKJDkbS7jg2yW9POLDYObOME
	yNw6siLN9B7YnRw66EKGZ55E/u6gESIQ3zKWynoam6t6Jp4k5V0V2MyhTHZNOyP1bb46l/EgUEPUN
	XIXciQWt4NqbU6x8KbTcfbXwbL79yCD6agJvegVRwUVqLQVpwmjd+7iUu5ph6IdeA/EExeAXv8cXc
	UPyQmStQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4hdh-0000000FigK-42zi;
	Wed, 08 May 2024 13:47:21 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4hdV-0000000FiWf-2O05
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 13:47:19 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2a49440f7b5so3643568a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 06:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715176025; x=1715780825; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Cy96MEbs4JLv+XlnJDrNT2CJ2qEQRDaH5Qu53Pf8ZU=;
        b=wVPeTmSR+VVWxyue8G8XTPakFUPO54I43cOZ6U91MaEsx/3ivk/R6HuUF4017o/vz8
         njfZANPmNCMVPrz5EAk8KV0lzvnQ5/7VICaczsMia0IZv7bC7422gUXafafgXFC75agd
         a3fz2Vu4Xc6ymOwD7rqhE60vwDwFpiB3LSbIbidiaRGNhLHwW+wisATJFQGKV2HRf2f7
         Mo3sJmKUGk+HwPuNBUcYtTowazR8BaSAMzqE5Ih7eax8lYfV4XA/kQOp7FXFxx0ta46a
         FJDbAAtchgQoFm5rodNYFOTIaULk/PHvTFHnLbqPHDfWVGSZuBJvkb2MBTCfoFW2vUyG
         J/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715176025; x=1715780825;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Cy96MEbs4JLv+XlnJDrNT2CJ2qEQRDaH5Qu53Pf8ZU=;
        b=kcrzQ/T9/JfWl6GMezGPiUWIr2Eg6i3RrBUNTWzvslCtjwWkC/qx4qhmYmO5QODSFx
         DtAqz/HCaUFOqwS/RmcyFgICvkTHMVKBPjsoGYpJOEEuwIoh3enWRn4dUcJiy6/zsFg6
         c5U+aUPjIMAJGTfgVybkoG4xiOSntRzkpovgT8IwUEY0npEbxLKGW0ncGpydK1fsrAJS
         6t+DqFirP6+krPL98arQKkj5Amjwqd4mjgoiokcKdFzmti0OiIyI1zU7IUxCevzQccfO
         HNrEILxPWBpcPZjw8n4sc2o0Y0qEU9qxdGbT0i56W6vV81EcQsmrmDy7i8q5vLviUXHm
         xEQw==
X-Forwarded-Encrypted: i=1; AJvYcCUkammeKxWJ0QC+cX2EVQWmHyBWh6K7eqpCyA/VdJq+8fL3hQNA1gQuw43bQKoEdH0uaNktsUI3kTE0kLypVEgLMTbmdNrtBrxZlalNQLdC
X-Gm-Message-State: AOJu0YymHiaLJgBarNGkFC0z9Xxo3L6HG8pYxd/gC8Uo5ENSB0F6E3UN
	86wviuEvJk8gP0OBGwO5qez+B8QGemniAxzVxqTRbs3kzIf35oQ/AKUy6YenKfQDeUX5UTmDGnP
	Z2w==
X-Google-Smtp-Source: AGHT+IGkEzt3rrLCYEAc2MIkDJ4rSudkNPJV/ZI7YDr6FjDNwR59XbPWzyPuXmQfxq7n/1Jp45z9S3futCA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:128d:b0:2b4:32ae:483e with SMTP id
 98e67ed59e1d1-2b61638c780mr8658a91.2.1715176024465; Wed, 08 May 2024 06:47:04
 -0700 (PDT)
Date: Wed, 8 May 2024 06:47:03 -0700
In-Reply-To: <20240507214254.2787305-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240507214254.2787305-1-edliaw@google.com>
Message-ID: <ZjuA3aY_iHkjP7bQ@google.com>
Subject: Re: [PATCH v2 0/5] Define _GNU_SOURCE for sources using
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
X-CRM114-CacheID: sfid-20240508_064709_705758_774A8E25 
X-CRM114-Status: GOOD (  15.77  )
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
> 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
> asprintf into kselftest_harness.h, which is a GNU extension and needs
> _GNU_SOURCE to either be defined prior to including headers or with the
> -D_GNU_SOURCE flag passed to the compiler.
> 
> v1: https://lore.kernel.org/linux-kselftest/20240430235057.1351993-1-edliaw@google.com/
> v2: add -D_GNU_SOURCE to KHDR_INCLUDES so that it is in a single
> location.  Remove #define _GNU_SOURCE from source code to resolve
> redefinition warnings.
> 
> Edward Liaw (5):
>   selftests: Compile kselftest headers with -D_GNU_SOURCE
>   selftests/sgx: Include KHDR_INCLUDES in Makefile
>   selftests: Include KHDR_INCLUDES in Makefile
>   selftests: Drop define _GNU_SOURCE
>   selftests: Drop duplicate -D_GNU_SOURCE

Can you rebase this on top of linux-next?  I have a conflicting fix[*] for the
KVM selftests queued for 6.10, and I would prefer not to drop that commit at
this stage as it would require a rebase of a pile of other commits.

And I doubt KVM is the only subsystem that has a targeted fix for the _GNU_SOURCE
mess.

If we want/need to get a fix into 6.9, then IMO we should just revert 809216233555
("selftests/harness: remove use of LINE_MAX"), as that came in quite late in the
6.9 cycle, and I don't think it's feasible to be 100% confident that globally
defining _GNU_SOURCE works for all selftests, i.e. we really should have a full
cycle for folks to test.

[*] https://github.com/kvm-x86/linux/commit/730cfa45b5f4

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
