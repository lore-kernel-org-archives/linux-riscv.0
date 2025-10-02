Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCB2CAC5B8
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 16:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Edgkc/VRY7FBbu0p7eBTGk1k/bZ4zGXbp3FDDxnRzWg=; b=i1lFHOsxNXrbqsyXvEMXL9CBog
	6e2H7E8bhIEz8iHwtrus6M0s1mKCYYZPLJcbfjebvso+UR+Aj/xCTB9tmptcb/OGNKkHT4zd3Ea+5
	SyjpNZMn5PNgRe8p7A/vaqJsm7z1+QOFyQ6peugJwdMoIv/9sshyOBZ55hKpR3vrV7Bvgbz8/B7DU
	7tbo1hCivr92xea6aB+qdCZVQbMSazW0v665sw8E2xj0MKggSpG0EbUfrEnIyK8TJqOA8fj2YuOR/
	zWoobYp1ajdm/I9v1KdEtWzOAHummFfM5K/IMFGr8Dpwm8cAYdPYK44Se20+W3yi2W0X9pmCjpx8l
	31plNo1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4MR9-0000000Ar9U-1aN4;
	Thu, 02 Oct 2025 16:45:47 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4MR7-0000000Ar8q-0rzo
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 16:45:46 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-33082aed31dso1486454a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Oct 2025 09:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1759423544; x=1760028344; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1A9QR3g98F/jojxQcsQCrmr26ivi3VklZB9Uaf1MTlU=;
        b=GqFTXhu7ycrzHl1oG8y/b9QshdoxG6dE0jbYae0CDSE219wmTx2Nkls6pI6hGH1ufH
         BwEMbxVG02M6OxFeEofyQO0ZM4tvHYTd2vJMo7Az2auTadj2MmbxS2M9EigMzVcSqzVr
         5n1USE0ODkt+HHbqsxk02IO2gcrXsnIs/Lr7ahAlFkngvp7nQmSQeWtEk75ES5Of7q2q
         vg5gchvuRWSRsoy/UQ5C5wrWWYFowLcga4oL67liRiRQX7dRkdh5BHBmXOIP9ghIUYbH
         b91Nqq/uBbDhJ6+2eEo4TfcNzUdylxOcgdNOGYj3LHWi9gRH78dDfexDAjlyTJSwbIwW
         goDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759423544; x=1760028344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1A9QR3g98F/jojxQcsQCrmr26ivi3VklZB9Uaf1MTlU=;
        b=i23I/yHAMJThNrwLVBU1GQJnVwIfswF5nqZygXof2QVsdKL6DiTG+6mZK9x1vlevHE
         mAX3ImhUSsibsX+grOcr7tVA+hSiYKLC/FZX1LJONvJ+enozQaI8bkbSqhXPDKy9jOR6
         bmfwZFilPuq9hLArOS56AOJbd9OkJOfjNqTeu001nqlek/jkeUPaAPbE0HsUQCDIOWPL
         pgsYNYuz6WV2lrfb3Mxaa4EFfJuaPp8f8wTG53MI1Sv10/FDY15alSkFuAqpZc2xnrqt
         d5HIvVtFEOSpXc4IsZhpHxRn9rlFytuyQS6F7rINv75BjBvUTOrx9fVQFleeHqp6+ws7
         CQvA==
X-Forwarded-Encrypted: i=1; AJvYcCU57JgMsg0WeORZQGWu0dumJlsUr+vkInmLpMx8N9VmEcIwkQt2RV8g0ElRjK1fSKbJdOGSN0O7Pe5FzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjhnEU3RYphJkcyvvpLQYb6VrzaDhbaavHv490PORTmFeqRLLn
	53B/3E+ZmaErpStGkvMOY8SWxfWIWspvooSFWL4TQhJE58cP5SZhec4aGD/nuw7BboA=
X-Gm-Gg: ASbGncst6Fi9LSsn+Y3y9q3Bi40CJs5u4EUJgm/dhq8sWnMy5ek7SPOcihTpxbDwY+e
	xSsmdWHWiz2WGGGRUY0vp/OqGHIjLOL2/5ya2H7R37jWXM13kjwGAoFvyqsYVq3G8QHHth1wdQE
	KllWBTg47cnrd8MGmj1eQB3RFUHLEF2YCAbY6Ao4I65GzBSC6ULLNgvUOPbb5/5oTG+DcepeLQD
	yZwYYKAy5oxFPHzhClSma9c5q3AQkt6S0ZxvlI/W0/jhdWnGbmlH11CQ10Xeg6OOtQUbyCusVxH
	rfvD+QoxsPdW7wkkFsVjhxuPIVf70xF/OZptPJVYBZYrW6NFigLnNp7fXa0JqzRQwuVZka5rODM
	rV/23FKMwmXXfSPc8lgFTLqmMTt8RCiRvqAPgRgcn4qhnmHtObnc8/Jgr
X-Google-Smtp-Source: AGHT+IGOeNAivntNqMaBDACXUIJXINgHBVnHmalDozgA9lIHXQF1UAZCwzUqmrzChLzk9pEqivj7cA==
X-Received: by 2002:a17:90a:e70f:b0:32e:e186:726d with SMTP id 98e67ed59e1d1-339c27a1901mr8380a91.31.1759423544003;
        Thu, 02 Oct 2025 09:45:44 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4f3ceedsm2812742a91.18.2025.10.02.09.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 09:45:43 -0700 (PDT)
Date: Thu, 2 Oct 2025 09:45:40 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Florian Weimer <fweimer@redhat.com>
Cc: Charles Mirabile <cmirabil@redhat.com>, pjw@kernel.org,
	Liam.Howlett@oracle.com, a.hindborg@kernel.org,
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
	peterz@infradead.org, richard.henderson@linaro.org,
	rick.p.edgecombe@intel.com, robh@kernel.org,
	rust-for-linux@vger.kernel.org, samitolvanen@google.com,
	shuah@kernel.org, tglx@linutronix.de, tmgross@umich.edu,
	vbabka@suse.cz, x86@kernel.org, zong.li@sifive.com
Subject: Re: [PATCH v19 00/27] riscv control-flow integrity for usermode
Message-ID: <aN6sNFBzx8NPU3Th@debug.ba.rivosinc.com>
References: <f953ee7b-91b3-f6f5-6955-b4a138f16dbc@kernel.org>
 <20250926192919.349578-1-cmirabil@redhat.com>
 <aNbwNN_st4bxwdwx@debug.ba.rivosinc.com>
 <CABe3_aE4+06Um2x3e1D=M6Z1uX4wX8OjdcT48FueXRp+=KD=-w@mail.gmail.com>
 <aNcAela5tln5KTUI@debug.ba.rivosinc.com>
 <lhu3484i9en.fsf@oldenburg.str.redhat.com>
 <aNxsWYYnj22G5xuX@debug.ba.rivosinc.com>
 <lhuwm5dh6hf.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <lhuwm5dh6hf.fsf@oldenburg.str.redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_094545_396029_D5A01A43 
X-CRM114-Status: GOOD (  12.88  )
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

On Thu, Oct 02, 2025 at 01:45:48PM +0200, Florian Weimer wrote:
>* Deepak Gupta:
>
>> On Tue, Sep 30, 2025 at 11:20:32AM +0200, Florian Weimer wrote:
>>>* Deepak Gupta:
>>>
>>>> In case of shadow stack, it similar situation. If enabled compiler
>>>> decides to insert sspush and sspopchk. They necessarily won't be
>>>> prologue or epilogue but somewhere in function body as deemed fit by
>>>> compiler, thus increasing the complexity of runtime patching.
>>>>
>>>> More so, here are wishing for kernel to do this patching for usermode
>>>> vDSO when there is no guarantee of such of rest of usermode (which if
>>>> was compiled with shadow stack would have faulted before vDSO's
>>>> sspush/sspopchk if ran on pre-zimop hardware)
>>>
>>>I think this capability is desirable so that you can use a distribution
>>>kernel during CFI userspace bringup.
>>
>> I didn't get it, can you elaborate more.
>>
>> Why having kernel carry two vDSO (one with shadow stack and one without) would
>> be required to for CFI userspace bringup?
>>
>> If Distro is compiling for RVA23 CONFIG_RISCV_USERCFI has to be selected yes,
>> kernel can have vDSO with shadow stack. Distro can light this option only when
>> its compiling entire distro for RVA23.
>
>I think it boils down to whether you want CFI bringup contributions from
>people who do not want to or cannot build their own custom RVA23
>kernels.

How will they contribute to CFI bringup without having a CFI compiled usersapce?
If their userspace is compiled with shadow stack instructions and they can't take
this userspace to old hardware else it'll start faulting as soon as control is
given to userspace (first sspush or sspopcheck in userspace).

>
>Another use case would be running container images with CFI on a
>distribution kernel which supports pre-RVA23 hardware.

Container image with CFI will have glibc and ld (and all other userspace) also
compiled with shadow stack instructions in it. As soon as you take this
container image to a pre-RVA23 hardware, you won't even reach vDSO. It'll break
much before that, unless kernel is taking a trap on all sspush/sspopchk
instructions in prologue/epilogue of functions in userspace (glibc, ld, etc)

>
>Thanks,
>Florian
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
