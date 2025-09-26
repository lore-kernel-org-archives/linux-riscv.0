Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DBDCAC5B8
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 19:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNp6kbTidJX/NBZ/i3rzuLAWwfwnyf2qdiPBMqrTp5M=; b=YwckSRYfFxdkdTNV3o+/hKZmel
	KNGn2gU9+0/guX8wq2gAURkLMfeOrPAxNTUfhbTLRmiMCDjN/eSegiOrXSo6duHMIhFicl0QxHMno
	JU58InHDW2YZ/wH+AZRu9dbevx+lS0caW4a51WuD0CCAqKSd3NHfl84xGHFVQbxaz8pj37v+pEzAC
	iXAVy+Bnrpw+6dLSiuALsFLhASXJsWcEfG/dZeQqxOlpYttZg8S2IGdvZLeWbhxqqm6r6qvz/BuZG
	/hRd+bsAsRI8/ST42sU6SHbh9tMh5KY3Psnz+rD+7q/HZfqT9VxzU51o0xwKSftpRBQOAzvs2tWez
	FYbaELBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2EZf-000000047f3-1n5M;
	Fri, 26 Sep 2025 19:57:47 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2EZd-000000047dY-0NDf
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 19:57:46 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so39718805ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Sep 2025 12:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1758916664; x=1759521464; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zASiJDz4r3vYQO3vYDYkcyVx79ekhPk89WizJj5Iigg=;
        b=TepBNKM2lADNFDSKL7DgDGthpzRQB6yl1JyC1G+B09PlWJ8XuS+LHU+hBCWcczfLhM
         IYakm7t8zQTTotulBztaD/JBNsn/kVfpTk3Hq8o7X/qxL1If9kdCMQSpOzt7covmn/K1
         QWT1SmCjdF1lr8lc2r52/tZo2R7a29Y8I/l+PbtT0JEyIES3j5I1E+fzTiD2vUuXeZDh
         ZKNzpXIiAM3Pbinz41ZXWaiwjM8orrSgPUepe5wjARck70GA9XTMHgCiACaLK5R2H2zl
         aryJVrxpojrR/tGtvn1Y8rKwKYYdIJIwmiBQZENSeK+CBw8+cbpuEazF15wBsiqfImWM
         0/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758916664; x=1759521464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zASiJDz4r3vYQO3vYDYkcyVx79ekhPk89WizJj5Iigg=;
        b=sHg9akiP3M1zrl74Y0cV4tt5nvxCYGsHuBkYb9fTFfTb1aipMDh083a1lh+XQeejmc
         90kapF4Hh4g9n/pKPbzmZna48EJ8YiOIjCB4FHvWaFldnkH5joq+SYkxvvdEbD6PfW2i
         5vhp3efxNiTw+kRrxF1f1ul9RGEBadEyqmIsbuB0q+QSkQezNtD37dYxHk7n/wHoJU7w
         RWWTPhPRt9XxlYptp0Tid/5/RldWp9RPanX0vpXGQk443qLcRho6aI6CmrXOYm4I/5gZ
         EN/SZzyabCymh0pEV/4CZ4WMPDXVFR8wPx9DM9pHmaQCj0qMsvO+WHqD2mGQ3IxlfFP7
         PMFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa4pPfbSF/ZZCzZpF8k+QMWhyb4xSqWi8mPiqjMpCtz3Bqa5Gz/AlAAYDWsxCNiAX8X/S8uB4X6b8KfA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0RK6vfZHf9aTK/qfwCQO4ysxJpyajssfHFEzUayvv5u5DL/3a
	e3a1sKhukYLRGqPo1IYtI8o9tA8fdih+t0crag6HyqDGELps8yJmRcpuBTj3xDG+zHk=
X-Gm-Gg: ASbGncsAVDDWeUbkRbjKRNl82COybvOUlbRv9Hlm54E/bb+nIz0GemsjLYs2AEKI9H5
	SEflV3C0xJZUZAgYFoTjov43x0+ZLxjejzZEdEBB6+p9qrPL5rV0zxUeon+UtVHDM13DjwZlUS7
	MTQfbbx+olvF8YX0LUuTauUgD8OYCxQkHdAQHw7Giz1UinrJHaZ5908u2z4pBRN0jvJ9NlBcJpb
	LLkhSafp7ilOf2TbLRn5NFaXSOe47CbXjTvGMNXFK189c/Y5yZ4h6iAtLuHQ7US6afSYwMbygtd
	7FToiZxdXhxRBSW9+rdyepm+8Gj29nPtmVM3fhpczak7XDNLwajQStMLF895qsm9NlNFqL+MUYJ
	calMbsVVUTh7NhjX2ytTObdXcevoJS8b+APIkKi9fRDaDsRR/g5qSqw==
X-Google-Smtp-Source: AGHT+IHlUtnIvbNYTp+NBwFL5kAnFfogcOgIaJtDWQxwNZ7YmExERR63uIq8FMCY+Zw0lEPHKpWKJg==
X-Received: by 2002:a17:903:28c:b0:26f:f489:bba6 with SMTP id d9443c01a7336-27ed4a5ec62mr76915745ad.50.1758916664000;
        Fri, 26 Sep 2025 12:57:44 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d43ecsm62938985ad.24.2025.09.26.12.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 12:57:43 -0700 (PDT)
Date: Fri, 26 Sep 2025 12:57:40 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Charles Mirabile <cmirabil@redhat.com>
Cc: pjw@kernel.org, Liam.Howlett@oracle.com, a.hindborg@kernel.org,
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
Message-ID: <aNbwNN_st4bxwdwx@debug.ba.rivosinc.com>
References: <f953ee7b-91b3-f6f5-6955-b4a138f16dbc@kernel.org>
 <20250926192919.349578-1-cmirabil@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250926192919.349578-1-cmirabil@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_125745_265051_D8BFD77D 
X-CRM114-Status: GOOD (  30.18  )
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

Hi Charles,

Thanks for response. Rest inline

On Fri, Sep 26, 2025 at 03:29:19PM -0400, Charles Mirabile wrote:
>Hi -
>
>Hoping that I got everything right with git-send-email so that this is
>delivered alright...
>
>Wanted to jump in to head off a potential talking past one another /
>miscommunication situation I see here.
>
>On Wed, Sep 24, 2025 at 08:36:11AM -0600, Paul Walmsley wrote:
>> Hi,
>>
>> On Thu, 31 Jul 2025, Deepak Gupta wrote:
>>
>> [ ... ]
>>
>> > vDSO related Opens (in the flux)
>> > =================================
>> >
>> > I am listing these opens for laying out plan and what to expect in future
>> > patch sets. And of course for the sake of discussion.
>> >
>>
>> [ ... ]
>>
>> > How many vDSOs
>> > ---------------
>> > Shadow stack instructions are carved out of zimop (may be operations) and if CPU
>> > doesn't implement zimop, they're illegal instructions. Kernel could be running on
>> > a CPU which may or may not implement zimop. And thus kernel will have to carry 2
>> > different vDSOs and expose the appropriate one depending on whether CPU implements
>> > zimop or not.
>>
>> If we merge this series without this, then when CFI is enabled in the
>> Kconfig, we'll wind up with a non-portable kernel that won't run on older
>> hardware.  We go to great lengths to enable kernel binary portability
>> across the presence or absence of other RISC-V extensions, and I think
>> these CFI extensions should be no different.
>
>That is not true, this series does not contain the VDSO changes so it can
>be merged as is.

Look at patch 23/27. It does have vDSO change. Although shadow stack
instruction are inserted as compiled flag for vDSO only when cfi config is
selected by user. Right now default is "No". So it won't impact anyone unles
user explicitly says "Yes".

>
>>
>> So before considering this for merging, I'd like to see at least an
>> attempt to implement the dual-vDSO approach (or something equivalent)
>> where the same kernel binary with CFI enabled can run on both pre-Zimop
>> and post-Zimop hardware, with the existing userspaces that are common
>> today.
>
>I agree that when the VDSO patches are submitted for inclusion they should
>be written in a way that avoids limiting the entire kernel to either
>pre-Zimop or post-Zimop hardware based on the config, but I think it
>should be quite possible to perform e.g. runtime patching of the VDSO
>to replace the Zimop instructions with nops if the config is enabled but
>the hardware does not support Zimop.

Why kernel need to do this extra work of carry two binaries and patching it
runtime?

If for instance we do this, and then this allow this kernel to be taken to
pre-Zimop hardware, it is assumed that entire userspace for such hardware
was compiled without shadow stack (thus no zimop). In that case, kernel
should have been compiled without CFI option.

Just for sake of thought exercise, let's say Fedora 43 is first release with
RVA23 compatiblity (zimop and shadow stack), there is no way this and future
release will be able to run on pre-zimop hardware. Unless redhat is going to
start two different binary distribution. One for pre-zimop and one for
post-zimop. If that would be the case, then compiling two different kernel for
such two different hardware would be least of the worry.

Only other usecase is of a seasoned kernel developer or build your own stuff
in embedded environment, those users can anyways are advanced users. But it
forces complexity on rest of kernel. There will be more extensions taking zimop
encodings in future, we will end up patching vDSO and keep this complexity
while rest of the userspace will not be patched and will be separate binary
distribution (if OS distros endup distributing multiple binaries per release)

>
>However, that concern should not hold up this patch series. Raise it again
>when the VDSO patches are posted.

As I said earlier, these changes default cfi config to No. So whenever this
is selected "Yes" by a distro, they can drive such patches (if there is a real
need)

>
>>
>> thanks Deepak,
>>
>> - Paul
>
>Best - Charlie
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
