Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8423CC87FD2
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 08:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EP7idG1xiVyIG90QP7wBtrwtfrk1SNttguAaYL2hXWg=; b=PuvBYX7L7bQ2ReA1/H7iEHXdnx
	p+87vVCTSf4baF9oJrOSpPHvm/cCyBWWo0SkAajXvCwq4zd3qMIGUKFAeYbPBr/5/j/cvII9rCHVU
	1+KD496yv7HjEolRPMoHAkwE28CdSuPPy0Usl5M2/lnSli7XpjWPyBQ2yMNo5cz3mCFHUYYJyDLDr
	nWXROzVuhelhJnNh9Fzi+GHHgAL+cwKTLDxQdadtfTjLpyvN+xeiWlswIyE6XirBfuOv2d0BSPE+Z
	+DeLVfTNZSDpJ/So2Qm580zdzzkUmA1hBZj03/a10XYaT5Mk58FG7DIvDnU/tXbI3NBS5VdqVa+/T
	7hagtXZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukIj9-00000002Ltu-2JPl;
	Fri, 08 Aug 2025 08:45:27 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukINk-00000002JiR-1GDl
	for linux-riscv@lists.infradead.org;
	Fri, 08 Aug 2025 08:23:21 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2403df11a2aso13379925ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Aug 2025 01:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1754641399; x=1755246199; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rqclBjlpReb8Zh2xzaAy1Tthw4Ak4Apujt4wspR+yjo=;
        b=OWKdl5NudKPTdyZ3VjmncniJzUz0UtitUpXH11ZZ/hL5UdFZv5Y0X0IIFomxzYjq96
         l8LahTOCuq1Axa7/yavMoAszuFEfcmZtoJdhR3bjos7Mc7SisBOULtNeK8kLOozXi08R
         Tgl7oL0XNRCDkvA8lqSqxlnx6azOICVUwzdd/gurmFC0TKxW0HON1zIVd5OViI6XKSRP
         DNRdBW5TMFfN6AAnNCwfEvAVjR0teFP7hrnKVWVtqYAJeaIG84sNm8jOL7EKtL6lX565
         XUwTsTMl+qIZJlODMg2H3lJb2bmXHnrIm8MtXmtV958Sig/4dn0yuPJ5JAwFMrToL3sg
         vZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754641399; x=1755246199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqclBjlpReb8Zh2xzaAy1Tthw4Ak4Apujt4wspR+yjo=;
        b=IjepQhR+jhl1KeZcB9Y47gi3N46m0LE4IZf0MJfDIi0PmaALfPnnR4ihvvBs682v4Q
         j2xFcCaD8K6xMVpA2HcAo1wjRFAK/nUPeA9bhwB5yNtnyAXb6MfbehMH350DDiaQruc+
         tCm0DJg0xJlQex1fTb/QnwNX4J8oA7Nw36hl5UmpFOV7PE6rh7rzkMpboC8p1G7zrMJX
         mK+gJaigh20sT/QuVe3WJRkeHiHI81q6+XuYloQetmxM5zvc4ig2G+qRpH4p8P8087Ss
         iB4R0D0EFdfqPs2zO8qq8sesdXSn3EtFGTtXiFVm3hPE6UaD5LgMxh6/iaXLQb7hl+Go
         gLbA==
X-Forwarded-Encrypted: i=1; AJvYcCUtq90BekCBolvT51ks869SkqznmXej2WkuEYZUCkOHvr7SXvQfEV01lzRJS48ah2JvExasf3zgxcH24w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYjB2Cw9EK2LVh+Y2te2MuQcexZG1HXmAtuJhMME32eizO9nom
	NYz80pA6HfGkr0nzm6SxPbOVwRaSFoWyCGX0zw1KgzUL//UziJjAaWaSag6ObiCF/IYwOW6EsCl
	vacwX
X-Gm-Gg: ASbGncv17skABW4u8dlB9Lm4oq4HUV1eF5nnj+ryVGjp1Bhz4oj5UcJdDU51ZifcIfB
	bCXcz1771MWSr99rGTHnJIdoKtMor0AI3li2BGdi6a+PbL/FND0xSQXKnlZPz149+H2i2NpsNwS
	YGp2LiynfC2P8/SsWHQYvMm4ErWv2yR80Uy8P7Zf7EpxKThGAEBSQmaJINArWNRjzAQYShTiQkN
	wGlETsFEdhkSHcw5IALOF6iNf4/eGAkw9nSVU8KoTtx6oy5n97GV++3kz2I3JrCfe3kB029dxwp
	KncJAl75OQqdodmVlaEbxBL2r52ioPQGtiNtflv9kbgZ+1wywbKcW+gfwdgJGc/qvYZrl+wnhQw
	RFsL56MwTScy0fUPlvX19yq/Bff4tbTXDGvqRCk2BGSY=
X-Google-Smtp-Source: AGHT+IFzkjQpJ+CBSP5FDKaUMlIyJFyzXkrgnGdlTX6xXb/Zh2Ht/mDaf4SC0H4gKEAF5ZgXVLVJMA==
X-Received: by 2002:a17:903:1207:b0:23f:f6ca:6a3 with SMTP id d9443c01a7336-242c2245139mr30852795ad.43.1754641399054;
        Fri, 08 Aug 2025 01:23:19 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef5934sm202807465ad.21.2025.08.08.01.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:23:18 -0700 (PDT)
Date: Fri, 8 Aug 2025 01:23:15 -0700
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
Message-ID: <aJWz82F21pVTSVJi@debug.ba.rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
 <175450053775.2863135.11568399057706626223.git-patchwork-notify@kernel.org>
 <db4eb976-693c-426c-a867-66cadd3dd7d8@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db4eb976-693c-426c-a867-66cadd3dd7d8@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_012320_487170_E7DB1FC7 
X-CRM114-Status: UNSURE (   9.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Aug 07, 2025 at 01:28:36PM +0100, Mark Brown wrote:
>On Wed, Aug 06, 2025 at 05:15:37PM +0000, patchwork-bot+linux-riscv@kernel.org wrote:
>
>> This series was applied to riscv/linux.git (for-next)
>> by Alexandre Ghiti <alexghiti@rivosinc.com>:
>
>>   - [v19,11/27] riscv/shstk: If needed allocate a new shadow stack on clone
>>     https://git.kernel.org/riscv/c/9c72a71321a6
>>   - [v19,12/27] riscv: Implements arch agnostic shadow stack prctls
>>     https://git.kernel.org/riscv/c/52eff0ab5f8e
>
>Congratulations Deepak!  

Thank you. Happy that its going in.

> Do you have an update for my clone3() shadow
No I don't.

>stack series that I could roll in for when I repost that after the merge
>window, and/or instructions for how to run this stuff for RISC-V on some
>emulated platform?
I would want to write-up instructions. But I don't want you to go through
a lot of hassle of building toolchain and bunch of other stuff.
Let me see how I can make it easy for you. Will report back.

-Deepak



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
