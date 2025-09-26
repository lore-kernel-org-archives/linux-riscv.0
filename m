Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBA2CAC5BB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 20:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHHDikyoBxW1+tx3VSoEEzmV8re4ZTnU3L0ubBB1jpw=; b=m1J91uJ4WwB7vkdYPczto1aRau
	QGRvTVI9ZEI9Z99/0vaYe5E2ueFrh12NGGPKnFmokLfZPp9UVlJv2LONwOZ/hwQSQlDa+cYi4PxeL
	+EnI0BvQl1RtmWDna235q6oTnhiNQz8jWdRD10IID7C2/uAfq0+NJ9aCyu5s6cXM5hXKX+Qi0o1Nl
	FqbD+6fe8/8RZrbHFwqxtTPTEPs+jXG9jvT4PrY9Lg7FoqzZJlMN+kEsep2yw3q1042SakS1hsjGB
	URPD+s2xKyFlCQPag/t7rY6gqeKcqCMddCRuFPS6HJXm8PVseLgAraC1pbUO4VaSJl9owZtvoeN5D
	w5gU1XQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Efd-00000004A61-0zBa;
	Fri, 26 Sep 2025 20:03:58 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Efa-00000004A40-2LSQ
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 20:03:56 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-271d1305ad7so36400875ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Sep 2025 13:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1758917034; x=1759521834; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2JzK9TdtNq0q6HuoPTI7S0mcgrs1VMBW3yQfWD8QK0g=;
        b=LbAknX6iXlX0/+Jmn0lDNsn6pJsw/MGKCiPV0yyLo9qTiJqRUdOdGoPNuYuvwinKBR
         RbUodM09I8HtLTU5Thuzxa4sx2WVbsEd9XWmKcfkCLXvvzVCgg9lF0EDA3xxGDRdzxma
         JenSVuvI1xIRJvAXl4KgmrnPnotyXDlwl5Ype0ZxtfLU0EAovHHUYK4ovl7TpftLda7O
         EHtbVws0y7rx+jwqiIxaXXX/XEiM5rywkCwTHwLgMhdWX7OMAlzjZZMk/lrrmaPDqOPH
         cbx22tN0ToJg/pdz44/vEMiEPWaZps9XIwG442b/cwtw0pmhwC3/veF2ABRfbSscrRbB
         7VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758917034; x=1759521834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2JzK9TdtNq0q6HuoPTI7S0mcgrs1VMBW3yQfWD8QK0g=;
        b=ZfNoqiqp1UhUkn6hsLeO8P11cWKcZkID4EUbZMEfPG66BrDh4AELtWKE+1mUuYmHMG
         NfXWdy9xxWBzTnybfNwXF5DVEP8pKQcbrPGAJYF5iK1NgIgusMIPMFKcyFrfOyxiJoDJ
         vbjY3TO4Ecd/lDbL0j++EhbkdBYg49IO0F+wNQMTOgauozc6BdBK6iwP+kqtmEXZAnOY
         atys2eTZCHBhACYm5QyUDPBp87KLO/LbYNmKNcaZpOHZmTe++yY9QRf5h9jMgjkv6+BF
         NyNv6o4VV0GgxmRUteOzaOOzIZPRedQ4uTIbWKKdJbs01XT3OCCt1pMRPAWigYDnnCrL
         PACw==
X-Forwarded-Encrypted: i=1; AJvYcCUpaa+GDnScQ+CBRNaZJ/TKCt7Z02QB5vQEFJAqw3TgTBt3E/y1NV/jvf8WWVGxziUeI54x9yemZ/PIPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcPyrvSGRj5kecrEF66nU6FfMO9SLPH0HG9ZadXw892TPHhNHD
	+tV5KQ09nyQHvtIgQEto4MteBLr3DuQOwKZJjgSEcfowc5qmjgaiIn3B3niP1nMwV8k=
X-Gm-Gg: ASbGncvjLqF3v7kRaAfglfnbvwFvVNm6qGfQuVbLS5f0q7pzhVNSEW1yt5hIsjJx76R
	/zjOwMWa0px24Ep5qKCCa4KuLXUyMjMVlECAfeZGujLES5irLa8Pla5wkS/PjzmTFnhSZL3ovwn
	OXuQ+UKEqIA4BqdesV0RluwWkSV+Q6CYmfMC1FOe+cD+rxZKFh78Q4JndUT0m3piqdBO+QxAitb
	npezHboINYaOC9UamCLpanSvgcqu+phvVHrjHTWfJdUKWt/sdH6APUmv4shFm/ROnFtQYu1cfLM
	Pf30PwQlDZTC9cIE50MpwMgvbYr1p3dRMjEOaK3TOy/40E/V5IWOFlaOBBnvVvUBdTTK1Y91Hp/
	1z8Tk/+deHhVhqZGn5Yexozvzi4AoTVwP
X-Google-Smtp-Source: AGHT+IEqlWQwd3Eq3xfSDG4ZoiAYivk9596CJNNVWWuT8jIb87TOCzT2mxQOQP9H5ZgZVw/+ZQZZqA==
X-Received: by 2002:a17:902:d052:b0:27d:69de:edd3 with SMTP id d9443c01a7336-27ed49d2c63mr75874405ad.20.1758917033572;
        Fri, 26 Sep 2025 13:03:53 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69b0685sm61092355ad.116.2025.09.26.13.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 13:03:52 -0700 (PDT)
Date: Fri, 26 Sep 2025 13:03:49 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Charles Mirabile <cmirabil@redhat.com>
Cc: Liam.Howlett@oracle.com, a.hindborg@kernel.org,
	akpm@linux-foundation.org, alex.gaynor@gmail.com,
	alexghiti@rivosinc.com, aliceryhl@google.com,
	alistair.francis@wdc.com, andybnac@gmail.com, aou@eecs.berkeley.edu,
	arnd@arndb.de, atishp@rivosinc.com, bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com, bp@alien8.de, brauner@kernel.org,
	broonie@kernel.org, charlie@rivosinc.com, cleger@rivosinc.com,
	conor+dt@kernel.org, conor@kernel.org, corbet@lwn.net,
	dave.hansen@linux.intel.com, david@redhat.com,
	devicetree@vger.kernel.org, ebiederm@xmission.com,
	evan@rivosinc.com, gary@garyguo.net, hpa@zytor.com,
	jannh@google.com, jim.shu@sifive.com, kees@kernel.org,
	kito.cheng@sifive.com, krzk+dt@kernel.org,
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
	lossin@kernel.org, mingo@redhat.com, ojeda@kernel.org,
	oleg@redhat.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
	peterz@infradead.org, pjw@kernel.org, richard.henderson@linaro.org,
	rick.p.edgecombe@intel.com, robh@kernel.org,
	rust-for-linux@vger.kernel.org, samitolvanen@google.com,
	shuah@kernel.org, tglx@linutronix.de, tmgross@umich.edu,
	vbabka@suse.cz, x86@kernel.org, zong.li@sifive.com
Subject: Re: [PATCH v19 00/27] riscv control-flow integrity for usermode
Message-ID: <aNbxpVddsTXL7F6T@debug.ba.rivosinc.com>
References: <20250926192919.349578-1-cmirabil@redhat.com>
 <20250926195224.351862-1-cmirabil@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250926195224.351862-1-cmirabil@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_130354_607916_C2CBC9B2 
X-CRM114-Status: GOOD (  38.62  )
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

On Fri, Sep 26, 2025 at 03:52:24PM -0400, Charles Mirabile wrote:
>Hi -
>
>Sorry for my previous email, I realized I was mistaken...
>
>On Fri, Sep 26, 2025 at 03:29:19PM -0400, Charles Mirabile wrote:
>> Hi -
>>
>> Hoping that I got everything right with git-send-email so that this is
>> delivered alright...
>>
>> Wanted to jump in to head off a potential talking past one another /
>> miscommunication situation I see here.
>>
>> On Wed, Sep 24, 2025 at 08:36:11AM -0600, Paul Walmsley wrote:
>> > Hi,
>> >
>> > On Thu, 31 Jul 2025, Deepak Gupta wrote:
>> >
>> > [ ... ]
>> >
>> > > vDSO related Opens (in the flux)
>> > > =================================
>> > >
>> > > I am listing these opens for laying out plan and what to expect in future
>> > > patch sets. And of course for the sake of discussion.
>> > >
>> >
>> > [ ... ]
>> >
>> > > How many vDSOs
>> > > ---------------
>> > > Shadow stack instructions are carved out of zimop (may be operations) and if CPU
>> > > doesn't implement zimop, they're illegal instructions. Kernel could be running on
>> > > a CPU which may or may not implement zimop. And thus kernel will have to carry 2
>> > > different vDSOs and expose the appropriate one depending on whether CPU implements
>> > > zimop or not.
>> >
>> > If we merge this series without this, then when CFI is enabled in the
>> > Kconfig, we'll wind up with a non-portable kernel that won't run on older
>> > hardware.  We go to great lengths to enable kernel binary portability
>> > across the presence or absence of other RISC-V extensions, and I think
>> > these CFI extensions should be no different.
>>
>> That is not true, this series does not contain the VDSO changes so it can
>> be merged as is.
>
>Oops... no sorry, it looks like it does. See 19/27. I was misled by the
>cover letter which said to pick that patch separately. I completely agree
>that that needs to not be included if this is to be merged.

Yes I sent another email.

>
>>
>> >
>> > So before considering this for merging, I'd like to see at least an
>> > attempt to implement the dual-vDSO approach (or something equivalent)
>> > where the same kernel binary with CFI enabled can run on both pre-Zimop
>> > and post-Zimop hardware, with the existing userspaces that are common
>> > today.
>>
>> I agree that when the VDSO patches are submitted for inclusion they should
>> be written in a way that avoids limiting the entire kernel to either
>> pre-Zimop or post-Zimop hardware based on the config, but I think it
>> should be quite possible to perform e.g. runtime patching of the VDSO
>> to replace the Zimop instructions with nops if the config is enabled but
>> the hardware does not support Zimop.
>>
>> However, that concern should not hold up this patch series. Raise it again
>> when the VDSO patches are posted.
>
>@Deepak, would it be possible to just resend this without the VDSO patch?

No we can't do that because if cfi is opted yes and user enables it then an
indirect jump to vDSO function will result in a trap to supervisor and then
SIGSEGV.

We can compile vDSO without shadow stack option. That leaves vDSO as the only
object in address space of program open to code re-use gadgets because return
path is not protected with shadow stack (thus dilutes security properties)

>
>Or to rework as I had alluded to to check for the presense of the extension
>and remove the instructions from the VDSO at boot if it is not found?

I have responded to your earlier e-mail on this. TLDR is

If kernel is required to carry two different libraries with a need of patching
it in runtime, while rest of the userspace can't be  patched in runtime. Is it
worth the complexity to enforce on kernel? Because we then will be doing this
for every future extension which takes encodings form zimop space while rest
of the userspace really can't do that.


>
>>
>> >
>> > thanks Deepak,
>> >
>> > - Paul
>>
>> Best - Charlie
>>
>
>Best - Charlie
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
