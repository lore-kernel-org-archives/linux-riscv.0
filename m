Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7CDC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 15:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7V7GTpgxJirBNEn6Rms3GPMt/iR+UvA75WLHWK6r9k=; b=nFYWkxW5smk9mN
	UtDMmPAxpD4xnSpk7vMtjimiu4ol9qns99vKpqZhyWr97CX7kKo5udqPquaw6btON6vOU/mRPS7Mc
	tBOdvfZpF1XkiUe4e7/zvACT34O8pGV+b6DTctCCfpQ44XYs6f46LejeX5xLgc+1N7tQGVi6DQ0UO
	8m6FSWRXYhkUwVDPYfOMUFXAlAfEBc1Jg8MZnznhjtnTJx3V1hY7ZtXURrgZ5zGRLEldxNAOdyo2k
	XudYILJmyPeS9+JChRzvRXVztYJ/CARMl5U2P3YaAA5qjQXtyl9Iz9vZOqT4oEN2G7z1WDRuve/vU
	7c22RuSZkZiyyg3y+4aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUs9O-00GdwO-V6; Thu, 17 Mar 2022 15:34:55 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUs9N-00GdvC-3h
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 15:34:54 +0000
Received: by mail-qk1-x72c.google.com with SMTP id q194so4616327qke.5
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 08:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qtliUzkRIUdjqjO0W+fikeYFFq5bQx8hw1n4Uq6lPAg=;
 b=qZRRueAnOHjaHMRHQ+QIIoDnWulYAUxCMJ1f9PLJOiXq+diWU/Nsh3HRXjKTOHUm89
 FdVU4EnrCVLmv+jdu1vwRuH5xMQyCKdw/F0Qk4dOA5DQSO/zfZ7fqVB+ZiP20rwRTgL2
 Tx1no5rGcZqDfFMOdohpUGHQxgvf4P+eQQVo07wTPTbk6zai1gX84K5lqBJB+7ICayuN
 be5wo9BbPg8ZE/axbhzenv08W3Rzfbbd1dZ3GoXVU9f0y3NwzmnLpdrAkYx8ephYpXeP
 05w3fv1bqTdhGsZYxLe1PqWeeUS7hccm0sxAy0O9cbJcJBo1HrIV21wQxYRxMJDyHngu
 3Y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qtliUzkRIUdjqjO0W+fikeYFFq5bQx8hw1n4Uq6lPAg=;
 b=7pRHOR5lSxKM2iQYayn1eTRKYXfD0nm7Y0EavmiTzf3Z4awt2Mlc2fjxektQ3aZgCZ
 ltKPpPhwsVMMdmo7rSQQWLio7NU16U8EBSEmO6/dhaVMfL0HFiCeQgxLxtta9OGUcFZ+
 bKHlzdgW9tPnItSMD8nU8AcRHKzqXe4BtyopLvvDkJpMVHozBiX+CPDZmj4r9SsoqAgB
 73lKsr2rDIGVQJiCc2YCIqx2z/LRIbyPMX5QMKVpNP6wz5J2jKN30KXvGY6UAYFIBTin
 udvGcGoS6/DE43lpFa3prf+dHMkclj4Ub2G/1ehEkVb3u2JyHuhetpZpvqWyJ8EkYaUg
 4FUw==
X-Gm-Message-State: AOAM533LpYmXMNizvDpfJ23h/f/gjb9VIL9PWi+kwKEaqJiqBGabDKpo
 vjsg8NGewTopZjGGK5+Bd7M=
X-Google-Smtp-Source: ABdhPJx8dXv4UXQyiWK4n7wEDfULbNQbnJsKlVOxYDBmUuKOSaCsRNCIvmR7bFavxrrEy4dWi4VA8A==
X-Received: by 2002:a05:620a:28c4:b0:67d:c400:a9d7 with SMTP id
 l4-20020a05620a28c400b0067dc400a9d7mr3231420qkp.369.1647531290494; 
 Thu, 17 Mar 2022 08:34:50 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com.
 [66.111.4.228]) by smtp.gmail.com with ESMTPSA id
 k1-20020ac85fc1000000b002e1c6420790sm3840883qta.40.2022.03.17.08.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 08:34:49 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id C3AFC27C0054;
 Thu, 17 Mar 2022 11:34:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 17 Mar 2022 11:34:48 -0400
X-ME-Sender: <xms:FFUzYvYeHB8UgJLpkpjGoO87Dhu0M5cz9KeoEWrnjVktCEfb1vUgmw>
 <xme:FFUzYuZOiKnmJ9UPGFPz4T8kLq-7OgnWaYZQ3_YQiP4jKERtQl_YhT2meotSV3qM3
 n-PA6boLk5hbLP7wQ>
X-ME-Received: <xmr:FFUzYh-UVM2fTmsTdkWHiKYdFTe43WEYk361olaw-wwkAqtLNKQRGT7kKQ4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefgedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhn
 ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
 htvghrnhepvdelieegudfggeevjefhjeevueevieetjeeikedvgfejfeduheefhffggedv
 geejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsg
 hoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieeg
 qddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigi
 hmvgdrnhgrmhgv
X-ME-Proxy: <xmx:FFUzYlpXjh1DBe_h89xavc8SP5ArO-AFfAUabR_Rm9M1SOFWb5QB5Q>
 <xmx:FFUzYqrRUUeB5Tk3Yl3nSEtpNiuzFix1x61nNAGT5NoGdrxgBJYFvw>
 <xmx:FFUzYrSd0xVQNCjGqzNwy83mxeIizp-GUgA4qMhUkwGPis5Jmoo2Hw>
 <xmx:FVUzYt80E1fXaJ1tXGQtXLBz1Dc4KYT1JWMoG6alobFQJ9QsAHALhS8RthE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Mar 2022 11:34:44 -0400 (EDT)
Date: Thu, 17 Mar 2022 23:34:18 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Waiman Long <longman@redhat.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 peterz@infradead.org, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 mingo@redhat.com, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, jszhang@kernel.org,
 wangkefeng.wang@huawei.com, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 2/5] asm-generic: ticket-lock: New generic ticket-based
 spinlock
Message-ID: <YjNU+tj5YJrYtwtK@boqun-archlinux>
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <20220316232600.20419-3-palmer@rivosinc.com>
 <YjM+P32I4fENIqGV@boqun-archlinux>
 <364c72a9-64ca-592a-510b-d48a963121aa@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <364c72a9-64ca-592a-510b-d48a963121aa@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_083453_188088_0E6B441E 
X-CRM114-Status: GOOD (  16.23  )
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

On Thu, Mar 17, 2022 at 11:03:40AM -0400, Waiman Long wrote:
[...]
> > > + * It also relies on atomic_fetch_add() being safe vs smp_store_release() on a
> > > + * sub-word of the value. This is generally true for anything LL/SC although
> > > + * you'd be hard pressed to find anything useful in architecture specifications
> > > + * about this. If your architecture cannot do this you might be better off with
> > > + * a test-and-set.
> > > + *
> > > + * It further assumes atomic_*_release() + atomic_*_acquire() is RCpc and hence
> > > + * uses atomic_fetch_add() which is SC to create an RCsc lock.
> > > + *
> > Probably it's better to use "fully-ordered" instead of "SC", because our
> > atomic documents never use "SC" or "Sequential Consisteny" to describe
> > the semantics, further I'm not sure our "fully-ordered" is equivalent to
> > SC, better not cause misunderstanding in the future here.
> 
> The terms RCpc, RCsc comes from academia. I believe we can keep this but add

I'm not saying we cannot keep "RCpc" and "RCsc", and we actually use
them to describe the memory ordering attributes of our lock or atomic
primitives. These terms are well defined.

The thing is that instead of "SC" we use "fully-ordered" to describe the
memory ordering semantics of atomics like cmpxchg(), and IIUC the
definition of "SC" isn't equivalent to "fully-ordered", in other words,
there is no "SC" atomic in Linux kernel right now. So using "SC" here
is not quite right. Just say "...which is fully-ordered to create an
RCsc lock."

But yes, maybe I'm wrong, and "SC" can be used exchangably with
"fully-ordered", but at least some reasoning is needed.

Regards,
Boqun

> more comment to elaborate what they are and what do they mean for the
> average kernel engineer.
> 
> Cheers,
> Longman
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
