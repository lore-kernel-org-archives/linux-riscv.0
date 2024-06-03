Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BF8C25B75
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 15:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FqIO5+bs3grDSh3jyNrY52qjYsnf4d04uL+o3AD33CI=; b=rhY6G36afNStHs
	6Gchu2QOC5Agp7WhpyP63TjoqIQuZpwBCrXOfJ7HLXSD1VhpGuA8uPllRTjRZJ+ZOqixZAILTMetH
	dBczW3Bz4cLJeqX8sZKmU4z+nRVIJ22j5LfA+XTyuB5amoW+cVXTbimOFDUqxkWBSh3sEwmieZ2dO
	0M9pKT44hs6L+SQPlBHKcOkR3DlidhV84glJFhi95ux62LDo+Ju3zvGMCcDwRO11xX3o3yNV8Y/VN
	/VgvuwqP2u2kf051E8Lppx79/dt7mjqs1gQMBHWw55nDWKb9IGHGooROC+w1UlOfo+TQvyKPTBMJT
	fHnVzvyOwg6HOrfWdWuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE9f4-0000000HEqy-1RoH;
	Mon, 03 Jun 2024 15:31:50 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE9f1-0000000HEqE-1X1r
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 15:31:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EA2820008;
	Mon,  3 Jun 2024 15:31:41 +0000 (UTC)
Message-ID: <f00b1928-3d91-4900-a588-c12c4933c870@ghiti.fr>
Date: Mon, 3 Jun 2024 17:31:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] riscv: Implement cmpxchg8/16() using Zabha
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
 Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, llvm@lists.linux.dev
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-3-alexghiti@rivosinc.com>
 <20240528193110.GA2196855@thelio-3990X>
 <CAHVXubjYVjOH8RKaF1h=iogO3xBM6k+xrGwkPnc-md2oRxbxrQ@mail.gmail.com>
 <20240529155749.GA1339768@thelio-3990X>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240529155749.GA1339768@thelio-3990X>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_083147_674230_880DC23A 
X-CRM114-Status: GOOD (  25.12  )
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

Hi Conor, Nathan,

On 29/05/2024 17:57, Nathan Chancellor wrote:
> On Wed, May 29, 2024 at 02:49:58PM +0200, Alexandre Ghiti wrote:
>> Then I missed that, I should have checked the generated code. Is the
>> extension version "1p0" in '-march=' only required for experimental
>> extensions?
> I think so, if my understanding of the message is correct.
>
>> But from Conor comment here [1], we should not enable extensions that
>> are only experimental. In that case, we should be good with this.
>>
>> [1] https://lore.kernel.org/linux-riscv/20240528151052.313031-1-alexghiti@rivosinc.com/T/#mefb283477bce852f3713cbbb4ff002252281c9d5
> Yeah, I tend to agree with Conor on that front. I had not noticed that
> part of the message when I was looking at other parts of this thread. I
> could see an argument for allowing experimental extensions for
> qualification purposes but I think it does create a bit of a support
> nightmare, especially when there are breaking changes across revisions.
>
>>> config EXPERIMENTAL_EXTENSIONS
>>>      bool
>>>
>>> config TOOLCHAIN_HAS_ZABHA
>>>      def_bool y
>>>      select EXPERIMENTAL_EXETNSIONS if CC_IS_CLANG
>>>      ...
>>>
>>> config TOOLCHAIN_HAS_ZACAS
>>>      def_bool_y
>>>      # ZACAS was experimental until Clang 19: https://github.com/llvm/llvm-project/commit/95aab69c109adf29e183090c25dc95c773215746
>>>      select EXPERIMENTAL_EXETNSIONS if CC_IS_CLANG && CLANG_VERSION < 190000
>>>      ...
>>>
>>> Then in the Makefile:
>>>
>>> ifdef CONFIG_EXPERIMENTAL_EXTENSIONS
>>> KBUILD_AFLAGS += -menable-experimental-extensions
>>> KBUILD_CFLAGS += -menable-experimental-extensions
>>> endif
> Perhaps with that in mind, maybe EXPERIMENTAL_EXTENSIONS (or whatever)
> should be a user selectable option and the TOOLCHAIN values depend on it
> when the user has a clang version that does not support the ratified
> version.
>
>> That's a good idea to me, let's see what Conor thinks [2]
>>
>> [2] https://lore.kernel.org/linux-riscv/20240528151052.313031-1-alexghiti@rivosinc.com/T/#m1d798dfc4c27e5b6d9e14117d81b577ace123322
> FWIW, I think your plan of removing support for the experimental version
> of the extension and pushing to remove the experimental status in LLVM
> (especially since it seems like it is ratified like zacas?
> https://jira.riscv.org/browse/RVS-1685) is probably the best thing going
> forward. If the LLVM folks are made aware soon, it should be easy to get
> that change into clang-19, which is branching at the end of July I
> believe.


FYI, it was just merged https://github.com/llvm/llvm-project/pull/93831

Thanks again,

Alex


>
>> Thanks for your thorough review!
> Thanks for taking LLVM support into consideration :)
>
> Cheers,
> Nathan
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
