Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3975BC19F4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 16:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFMfacJOh1z2vw4K3rcjiwkdorNz0mjB+pmyL68B144=; b=ySSCTaGbytSejG
	7a35nl8Aw72ajdC8wg2S0CMMGQRgnAv6PzKbBhO0+9tKdj0sgQxIi1KgLR19SXWIiHtVIK3ultsBp
	H/MHEjpyI2fGOW08hi8676MJOr2+AfmfGlASVLYfU7l9RpVBKlPf4ANmaeuvMD/v3D+yGmRP4+IkZ
	o50EQ3BTV0akjGd+smBUO9ryYzneVerqOo1zl4dQWext3YAd0iDCrIxwVw2TZkEGgdQf/HmQsWAF4
	faImVP0ttLD5cES0lCPNy48XLmgmpfvKgbOWE04Ya0GF7vTHLHGc7Q/LB+b0JZ5+S3f3YfLuxAq4h
	W8kjh4cd1kIzn2x93Z7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4kPm-0000000GDsj-2sdr;
	Wed, 08 May 2024 16:45:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4kPd-0000000GDoq-38i9;
	Wed, 08 May 2024 16:45:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E812D61CA5;
	Wed,  8 May 2024 16:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A392AC113CC;
	Wed,  8 May 2024 16:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715186699;
	bh=0vXy5kTUEu7Jx0jxctDNvQbCc0ApL3aWNbp3Y8Ze7FM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=r6T4Vx0y4QOnGwpBQOgFUY2eu34NThzwvqE9iWCIEwfBWxfBXLKwMeMXC2MZkCWgE
	 sSy8eWZ2B09C4cJWuUtyV7pp1xxjYBJcb9dKqRcNcRwWuRWNUhvaX8ZZNACrQ8akj+
	 fVsf0Qgb7/q7++0jy9wmy9zGxZ08j6Zv4QRrw0dL1nzsSXULP5hHSA299xoBM9AD05
	 6riemVsfFd1imBZpGu8mE+0OdEWqZvuhuWPeX4o1a5jHgyaeVks/tD4RoFmGk5XVgC
	 it22dgUxqoUlvZZ7CdgHHzCOiO9So64lLxbdbeLXKuMGmV15xh0wplv/ZWkSBTpDGK
	 EGKaRAElv3B+A==
Mime-Version: 1.0
Date: Wed, 08 May 2024 19:44:40 +0300
Message-Id: <D14EXNEBOKFY.8SJ7SOCABM01@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <kernel-team@android.com>, <linux-sound@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
 <linux-input@vger.kernel.org>, <iommu@lists.linux.dev>,
 <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 <linux-security-module@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-actions@lists.infradead.org>,
 <mptcp@lists.linux.dev>, <linux-rtc@vger.kernel.org>,
 <linux-sgx@vger.kernel.org>, <bpf@vger.kernel.org>, "kernel test robot"
 <oliver.sang@intel.com>
Subject: Re: [PATCH v2 2/5] selftests/sgx: Include KHDR_INCLUDES in Makefile
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Dave Hansen" <dave.hansen@intel.com>, "Edward Liaw"
 <edliaw@google.com>, <shuah@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon"
 <will@kernel.org>, "Nhat Pham" <nphamcs@gmail.com>, "Johannes Weiner"
 <hannes@cmpxchg.org>, "Christian Brauner" <brauner@kernel.org>, "Eric
 Biederman" <ebiederm@xmission.com>, "Kees Cook" <keescook@chromium.org>,
 "OGAWA Hirofumi" <hirofumi@mail.parknet.co.jp>, "Thomas Gleixner"
 <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>, "Peter Zijlstra"
 <peterz@infradead.org>, "Darren Hart" <dvhart@infradead.org>, "Davidlohr
 Bueso" <dave@stgolabs.net>, =?utf-8?q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, "Jiri Kosina" <jikos@kernel.org>, "Benjamin
 Tissoires" <bentiss@kernel.org>, "Jason Gunthorpe" <jgg@ziepe.ca>, "Kevin
 Tian" <kevin.tian@intel.com>, "Andy Lutomirski" <luto@amacapital.net>,
 "Will Drewry" <wad@chromium.org>, "Marc Zyngier" <maz@kernel.org>, "Oliver
 Upton" <oliver.upton@linux.dev>, "James Morse" <james.morse@arm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>, "Zenghui Yu"
 <yuzenghui@huawei.com>, "Paolo Bonzini" <pbonzini@redhat.com>, "Sean
 Christopherson" <seanjc@google.com>, "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Christian Borntraeger"
 <borntraeger@linux.ibm.com>, "Janosch Frank" <frankja@linux.ibm.com>,
 "Claudio Imbrenda" <imbrenda@linux.ibm.com>, "David Hildenbrand"
 <david@redhat.com>, =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 "Paul Moore" <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Seth Forshee" <sforshee@kernel.org>, "Bongsu
 Jeon" <bongsu.jeon@samsung.com>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Steffen Klassert"
 <steffen.klassert@secunet.com>, "Herbert Xu" <herbert@gondor.apana.org.au>,
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, "Manivannan Sadhasivam"
 <manivannan.sadhasivam@linaro.org>, "Matthieu Baerts" <matttbe@kernel.org>,
 "Mat Martineau" <martineau@kernel.org>, "Geliang Tang"
 <geliang@kernel.org>, "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>,
 "Fenghua Yu" <fenghua.yu@intel.com>, "Reinette Chatre"
 <reinette.chatre@intel.com>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Muhammad Usama Anjum"
 <usama.anjum@collabora.com>
X-Mailer: aerc 0.17.0
References: <20240507214254.2787305-1-edliaw@google.com>
 <20240507214254.2787305-3-edliaw@google.com>
 <c3fc5396-bc71-4dee-a3e0-d59dbbc6eda1@intel.com>
In-Reply-To: <c3fc5396-bc71-4dee-a3e0-d59dbbc6eda1@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_094502_162924_E1954FE5 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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

On Wed May 8, 2024 at 6:33 PM EEST, Dave Hansen wrote:
> On 5/7/24 14:38, Edward Liaw wrote:
> > Add KHDR_INCLUDES to the CFLAGS to pull in the kselftest harness
> > dependencies (-D_GNU_SOURCE).
> > 
> > Also, remove redefinitions of _GNU_SOURCE in the source code.
>
> From an x86 and SGX perspective, looks fine.  I assume Shuah is planning
> on taking this pile.
>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>

Yep,

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

I also quickly tested with NUC7 for what it is worth:

Tested-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
