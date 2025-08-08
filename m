Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C29FC87FDA
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 17:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8YfyZWJQtj7fRoLDf5uGSOcR+KqEZg+DDxIhipaEDo=; b=CmsaWoSZLaZJeYhL1XsyHsn6jE
	dP1rZj+SlNRPj63g+bWv+2ytXoNSm3NSXsbufm7wif7nIK+D1jcioV5SmWi+9GlXVhW7wMHCQkovs
	26VAI7BRAH3TEV9CGsyWcE1JUGs7IPhTpDCbzpGPIW38lZTuIYmI8mbhKtenYSQ7LAB8t5OZ2S1zP
	fPiQFlBAagZvTneUQTk2DZOf2VAH+zUb1Tyu/bF0TDwoEZgYMtMQI1D48S5/+BOR+1HcHTIIvXlLS
	3QQ1l8wtLZiRMJHarIlPTR9MZAFMHRLx4hdj0iE07f0m3eVzZRGa6RdVH6/wQLqpXZl4DALCLJbTL
	PWGA4QEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukQlV-00000003OHm-084k;
	Fri, 08 Aug 2025 17:20:25 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukQlT-00000003OGk-0trB
	for linux-riscv@lists.infradead.org;
	Fri, 08 Aug 2025 17:20:24 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-76bdce2ee10so2156997b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 08 Aug 2025 10:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1754673622; x=1755278422; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e5KtmNZscqY46KvhQCHs24ev6RrXWd+1XTPfyk6qu6o=;
        b=MCHuqdu/LylPdjDkiy/ce7PEkUXXiGg8XnOCFNGKkDABC/3aq0vEwW6tWYlO5TgbBA
         41hzSkG0n/NuHsTE72F3ufYIGsC1vIEvo6K01dpVVdGj2xtMF012LxJ5OFBpWuqLaZRt
         lB1K5hb5pajmbeN/tg0FHe+4/yLHjWv01GUNhY+OXjjpBHQKPM2p9rFHniXZdybuQXjM
         RKViIrcIxr4JfKuSgW5RsKz85RQjd1lcPoJOYwUU2qB4sLFOebD8CCQEIHdOLbJk++Yf
         sNPdedtuRkVhGaf2orq1u3hofTpAOTy9jBn+0dOx6veAcLpGyY5enj53gk9kwqbLxB2V
         04PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754673622; x=1755278422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5KtmNZscqY46KvhQCHs24ev6RrXWd+1XTPfyk6qu6o=;
        b=a2yjPcj0iarNIKjWdu+r3ikyHVWeQcxOM4zWNymKHYBo0CBSKsCaODHrIghVMpAe6D
         pn5xUI+QhXkuwf23/AeLqbQKFP4aGHqz3vBESpK+k3tV/2P4W1Yfzv/4EDxWdtfv9+Tb
         XeS9iyi5SCzOrEF7I9f+SNjm3wZ2cSNzLFlt/2lIT10tMTKCZaFSQ6OTVhiINtB0kEoh
         ZEnjTftzcotvCN07pkBXLhX1cK++h9PIgTtR1mFFiI3cExOl0ivqIDeiAnbyABFRKaUm
         wimkUAqCZf0X4E/qPpVMmVHq3kBWaU1nJzE5Ezvmzl1k0UN4HfgGslpVohZn3jy1LE6c
         rZMA==
X-Forwarded-Encrypted: i=1; AJvYcCU/vbrIRz0A9Fmg587LMae0DdQT4spcj8vN3Cm+OKdyC4OvZVSg9xpeqB+mWoPb75bwcmwj8QC/u2qG7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YysGART98Djb2PO+QO7mPQMKTaBLmXOkdy548JdM4ii9gWD2n9F
	D232kZNGY5JD6+4+Jwkgch/R5W9d0XkRvXj8W8L86HEnl1JJ0UbcMDHq3aFoozWssaE=
X-Gm-Gg: ASbGnctqg4FwLThOiSc3MH5zXqqhVDSb3hygCVMwK22427Cxe6fLybDmknhRz6HbFO5
	E6pu4P3sJ1XmKJvWoqM/+55PujFoFGGJAYIeMwygLezh2g6oPgUj7xEVH3HqgR+V51V+XubAZ/d
	H+T7KGC2gR8VsnEHOMV3vy9Hr+FEeUUci6ascL1P2Wx9yiMMTnUOWOIqTPrQgT04feXUfjSarhr
	j7wbd9yPTBuociRTzJRcVDyXFgbiBQeU1P6sYV3B0kxnHN2yfas2PXSTl9DWFZXwezMQa/VJe0S
	cHaEGBImZKUqpgAycY6tIS3hycewjDS/lE6Xs0SUVwsjn+Aiq/EV3aq4boWsrYICV1CmDfcaNyB
	EO4yA9WdkriAmYiAbNZKj64XnIm5zCt9Nz7Xok+Vnxvw=
X-Google-Smtp-Source: AGHT+IEbXOfCcMMF+EKLeMi8xU3SNI8Lg4qkWBu83GI5zB4sNqf//XXj2WJssysLa22zlDPxSEkl6g==
X-Received: by 2002:a17:902:da82:b0:240:c678:c1ee with SMTP id d9443c01a7336-242c1ffb211mr57743355ad.11.1754673622272;
        Fri, 08 Aug 2025 10:20:22 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aafa77sm213263625ad.174.2025.08.08.10.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 10:20:21 -0700 (PDT)
Date: Fri, 8 Aug 2025 10:20:17 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: patchwork-bot+linux-riscv@kernel.org, linux-riscv@lists.infradead.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
	lorenzo.stoakes@oracle.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, conor@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, arnd@arndb.de,
	brauner@kernel.org, peterz@infradead.org, oleg@redhat.com,
	ebiederm@xmission.com, kees@kernel.org, corbet@lwn.net,
	shuah@kernel.org, jannh@google.com, conor+dt@kernel.org,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, lossin@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com,
	richard.henderson@linaro.org, jim.shu@sifive.com,
	andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
	atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
	alexghiti@rivosinc.com, samitolvanen@google.com,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
	zong.li@sifive.com, david@redhat.com
Subject: Re: [PATCH v19 00/27] riscv control-flow integrity for usermode
Message-ID: <aJYx0Yi3rQcdY6se@debug.ba.rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
 <175450053775.2863135.11568399057706626223.git-patchwork-notify@kernel.org>
 <db4eb976-693c-426c-a867-66cadd3dd7d8@sirena.org.uk>
 <aJWz82F21pVTSVJi@debug.ba.rivosinc.com>
 <09081487-89ac-4f8d-b9fc-e563f09726d2@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09081487-89ac-4f8d-b9fc-e563f09726d2@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_102023_259145_EC900421 
X-CRM114-Status: GOOD (  13.87  )
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

On Fri, Aug 08, 2025 at 12:48:31PM +0100, Mark Brown wrote:
>On Fri, Aug 08, 2025 at 01:23:15AM -0700, Deepak Gupta wrote:
>> On Thu, Aug 07, 2025 at 01:28:36PM +0100, Mark Brown wrote:
>
>> > Do you have an update for my clone3() shadow
>
>> No I don't.
>
>> > stack series that I could roll in for when I repost that after the merge
>> > window, and/or instructions for how to run this stuff for RISC-V on some
>> > emulated platform?
>
>> I would want to write-up instructions. But I don't want you to go through
>> a lot of hassle of building toolchain and bunch of other stuff.
>> Let me see how I can make it easy for you. Will report back.
>
>Thanks.  FWIW I should already be sorted for the kernel build, unless
>there's a super new or specialist toolchain required for this feature

Unlike x86 shadow stack and arm's GCS, push on RISC-V shadow stack is done
using dedicated `sspush` instruction and pop is done using instruction
`sspopchk`. RISC-V vDSO has certain `C` files and they would need shadow stack
push and pop (along with landing pad on them). So that's why kernel compile
would require the toolchain. I'll point you to it.

>(I'd guess I should be fine for the shadow stacks bit?) - it's userspace
>and emulation for the extension I'm missing.

Qemu changes are upstream. I'll provide the command line option.
On userspace, I'll point you to something pre-compiled rootfs.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
