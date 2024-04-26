Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67908C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 07:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TVEZndgQlar7r+S81fy7WWFIBdlTur2t9taB90BRZ4=; b=qajnhaAu0LmwJb
	D791y6quONDG3938m9NIJFLcZqz7MxYleMlgSdnSblR0GIDZbLzsA9Ys5I/YwZyt4WUSSUCeDLqVZ
	+uooY7gEqr6fwKm3GGPkRzbce7yV6YsVqXKq9EukxR5h/XPka/1EZVFI8pK+gG7Xwr8rFohiBsvO7
	EV7a+RVRcTRK4Uf4TJastFwHYD/ZZTIe1L/q3JCmYuwCnbtcIOmr4a1uv5Kn9IEk8RSswuBRPQKT0
	vRv4SCOGIIQ06eaoSSm9XItMB6wePGB5yI4gb+hhDO91FVAUE+CtwCg7/lexVI1W1D13FVQyKhtoB
	J0slGFZGsUZFjumO19Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0G5v-0000000BU05-0Pzg;
	Fri, 26 Apr 2024 07:34:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0G5r-0000000BTy2-1NtW;
	Fri, 26 Apr 2024 07:34:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 08B2561FCB;
	Fri, 26 Apr 2024 07:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A6EC113CD;
	Fri, 26 Apr 2024 07:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714116839;
	bh=gksl38yx9eZzDHDXbUKTYhZmDGqlaFTVA8MzoHCjPSQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=r6EVUWWWwqWuB2/4TPNdaGpUi5w/svatLiUkQPW7jg/Kqfz+v9PjTsqhHX0V5+EAd
	 O9Q7MLhBBw+u+yC3YJdVVaI93yGyVAyg60gYgQw+aYYn1jycUg0XiChWp0Iu1VFKMv
	 DwPywl0dLcmeXRt7ZEBqHGpgzLkfbaLNMsfQI9WfrWSOqgHI+raXZsInlkpmvx5zN2
	 Aw4iSz/F3PrrMtthz0B2wb3NwCnmeHWiHSYEJZOSeSYq9iQITvYdPXRUZEGz3Zp6OT
	 dsVslJOA6lLCpSJkkdCeyvYqDh4fWotWkzTVM/CVN72PQmXal5hJg3KuZB1fRSHKNY
	 lVwcEZNrXTKCg==
Mime-Version: 1.0
Date: Fri, 26 Apr 2024 10:33:40 +0300
Message-Id: <D0TVP8ILJMO0.HERRWR4PA7N6@kernel.org>
Cc: "Dan Carpenter" <dan.carpenter@linaro.org>, "Shuah Khan"
 <shuah@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Paolo Bonzini" <pbonzini@redhat.com>, "Marc Zyngier" <maz@kernel.org>,
 "Oliver Upton" <oliver.upton@linux.dev>, "Huacai Chen"
 <chenhuacai@kernel.org>, "Michael Ellerman" <mpe@ellerman.id.au>, "Anup
 Patel" <anup@brainfault.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>, "Christian Brauner"
 <brauner@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, <kvm@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
 <linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, "Xiaoyao Li" <xiaoyao.li@intel.com>, "Xu
 Yilun" <yilun.xu@intel.com>, "Chao Peng" <chao.p.peng@linux.intel.com>,
 "Fuad Tabba" <tabba@google.com>, "Anish Moorthy" <amoorthy@google.com>,
 "David Matlack" <dmatlack@google.com>, "Yu Zhang"
 <yu.c.zhang@linux.intel.com>, "Isaku Yamahata" <isaku.yamahata@intel.com>,
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, "Vlastimil Babka"
 <vbabka@suse.cz>, "Vishal Annapurve" <vannapurve@google.com>, "Ackerley
 Tng" <ackerleytng@google.com>, "Maciej Szmigiero"
 <mail@maciej.szmigiero.name>, "David Hildenbrand" <david@redhat.com>,
 "Quentin Perret" <qperret@google.com>, "Michael Roth"
 <michael.roth@amd.com>, "Wang" <wei.w.wang@intel.com>, "Liam Merwick"
 <liam.merwick@oracle.com>, "Isaku Yamahata" <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, "Naresh Kamboju"
 <naresh.kamboju@linaro.org>, "Anders Roxell" <anders.roxell@linaro.org>,
 "Benjamin Copeland" <ben.copeland@linaro.org>
Subject: Re: [PATCH v13 25/35] KVM: selftests: Convert lib's mem regions to
 KVM_SET_USER_MEMORY_REGION2
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Sean Christopherson" <seanjc@google.com>, "Shuah Khan"
 <skhan@linuxfoundation.org>
X-Mailer: aerc 0.17.0
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-26-seanjc@google.com>
 <69ae0694-8ca3-402c-b864-99b500b24f5d@moroto.mountain>
 <3848a9ad-07aa-48da-a2b7-264c4a990b5b@linuxfoundation.org>
 <ZipyPYR8Nv_usoU4@google.com>
In-Reply-To: <ZipyPYR8Nv_usoU4@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_003403_418677_CC198FF8 
X-CRM114-Status: UNSURE (   3.49  )
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

On Thu Apr 25, 2024 at 6:09 PM EEST, Sean Christopherson wrote:
> +       __TEST_REQUIRE(kvm_has_cap(KVM_CAP_USER_MEMORY2),
> +                      "KVM selftests from v6.8+ require KVM_SET_USER_MEMORY_REGION2");

This would work also for casual (but not seasoned) visitor in KVM code
as additionl documentation.

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
