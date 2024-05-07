Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9CAC19F4F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 22:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ND16QbeIY3S/HKDQcr3Bwa8v9+X6A9fpiKO6dkGc1Vg=; b=4hqfvMRVHD41gg
	J3uH4cDiDfHVXt7a4JVgHaWowllKJZQQJpRHc51NG++rTWe0W83s1qKH7oECFBb5Qv5ylHzQQbJSX
	ZnBYxJvX3yVtQT+QIC8m1gP1sRirbJNOqD5QbBI2OGn+CxYg/EPYqFzKAMsbOlo9zNMa6zdTU/NRh
	NJVqglY0l27vaj6JIQzCUOlg7KZbVSOXSi5AsS38QLHVnZR00CF2XO4jRxqLpXXftrYS+1Qa3IfL5
	Eobmhqeo2E3elHLyAY6kcFWx3Id6C7lOBKK3v7Cn3qF8EYdhQTAf16lPZhjAtilNE7mVXWIxz0SWJ
	JKsq6VbhmGm9LNgLizwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4TQm-0000000D3k1-3jWw;
	Tue, 07 May 2024 22:37:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4TQg-0000000D3g1-1EMd;
	Tue, 07 May 2024 22:37:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 40CACCE16B2;
	Tue,  7 May 2024 22:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C46C2BBFC;
	Tue,  7 May 2024 22:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715121414;
	bh=vZu8367hXU7oiXYTGuAa3tCsrA1jmnR/kKUKbwIWO24=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=XEs0nlupa/YeV6+Z2Gc+n7c3pIBOkGGmDoCoT6KyVsBYgtXLiIdHulLvrs4YEs/4a
	 bPdoHs+8QRtFMZ/4gzAHp2vZ0me4r7CzqR/hvFNO1xvIqVWhc36VAXCAZWPLsUhnmu
	 P4pKvBUvUOxuyv/wka2jPIQy0lQGEB6ym4TAHzN/Nghm7jV2qsTTbggxdx1RLCjLZm
	 PEwPiir/nrivlQ45L+0JuHP+dxk8rfLOJyq24TPvS3+5GqucsW6YLdcPP8OrUDtb08
	 EqYSgXFs8+vnP+dGERNlOoRnLFhtM1eiU22yUWrF67SuFuyh5tALynyPQtKp1PEzgM
	 6xKlBBkuDjhWQ==
Mime-Version: 1.0
Date: Wed, 08 May 2024 01:36:35 +0300
Message-Id: <D13RSJRDTUQO.UA22FQGU3839@kernel.org>
To: "Edward Liaw" <edliaw@google.com>, <shuah@kernel.org>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Nhat Pham" <nphamcs@gmail.com>, "Johannes
 Weiner" <hannes@cmpxchg.org>, "Christian Brauner" <brauner@kernel.org>,
 "Eric Biederman" <ebiederm@xmission.com>, "Kees Cook"
 <keescook@chromium.org>, "OGAWA Hirofumi" <hirofumi@mail.parknet.co.jp>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Peter Zijlstra" <peterz@infradead.org>, "Darren Hart"
 <dvhart@infradead.org>, "Davidlohr Bueso" <dave@stgolabs.net>,
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, "Jiri Kosina"
 <jikos@kernel.org>, "Benjamin Tissoires" <bentiss@kernel.org>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, "Kevin Tian" <kevin.tian@intel.com>, "Andy
 Lutomirski" <luto@amacapital.net>, "Will Drewry" <wad@chromium.org>, "Marc
 Zyngier" <maz@kernel.org>, "Oliver Upton" <oliver.upton@linux.dev>, "James
 Morse" <james.morse@arm.com>, "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Zenghui Yu" <yuzenghui@huawei.com>, "Paolo Bonzini" <pbonzini@redhat.com>,
 "Sean Christopherson" <seanjc@google.com>, "Anup Patel"
 <anup@brainfault.org>, "Atish Patra" <atishp@atishpatra.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Christian
 Borntraeger" <borntraeger@linux.ibm.com>, "Janosch Frank"
 <frankja@linux.ibm.com>, "Claudio Imbrenda" <imbrenda@linux.ibm.com>,
 "David Hildenbrand" <david@redhat.com>,
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, "Paul Moore"
 <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>, "Serge E.
 Hallyn" <serge@hallyn.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Seth Forshee" <sforshee@kernel.org>, "Bongsu Jeon"
 <bongsu.jeon@samsung.com>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Steffen Klassert"
 <steffen.klassert@secunet.com>, "Herbert Xu" <herbert@gondor.apana.org.au>,
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, "Manivannan Sadhasivam"
 <manivannan.sadhasivam@linaro.org>, "Matthieu Baerts" <matttbe@kernel.org>,
 "Mat Martineau" <martineau@kernel.org>, "Geliang Tang"
 <geliang@kernel.org>, "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>,
 "Fenghua Yu" <fenghua.yu@intel.com>, "Reinette Chatre"
 <reinette.chatre@intel.com>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "Muhammad Usama Anjum"
 <usama.anjum@collabora.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <kernel-team@android.com>, <linux-sound@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
 <linux-input@vger.kernel.org>, <iommu@lists.linux.dev>,
 <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 <linux-security-module@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-actions@lists.infradead.org>,
 <mptcp@lists.linux.dev>, <linux-rtc@vger.kernel.org>,
 <linux-sgx@vger.kernel.org>, <bpf@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] selftests: Include KHDR_INCLUDES in Makefile
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240507214254.2787305-1-edliaw@google.com>
 <20240507214254.2787305-4-edliaw@google.com>
In-Reply-To: <20240507214254.2787305-4-edliaw@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_153658_712595_8F122003 
X-CRM114-Status: UNSURE (   6.27  )
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

On Wed May 8, 2024 at 12:38 AM EEST, Edward Liaw wrote:
> Add KHDR_INCLUDES to CFLAGS to pull in the kselftest harness
> dependencies (-D_GNU_SOURCE).
>
> Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
> Signed-off-by: Edward Liaw <edliaw@google.com>

Oops, this is not for this patch but for SGX. Pressed D by mistake
in aerch, so for SGX one:

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
