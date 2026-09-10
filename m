Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D246C79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 12:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJC+Dblp6l63kqtO5dPN04jG0G5yN08zqPQTr2hjHFw=; b=qJ3TjhNCyaq6J/
	UtMDXtSDOLBhwUwXP6ZH3iK+4TtSwacPyBHqphxJHh6Hw4JGGyrxCJKcMTeKquOa/9aLj8Fb00GnS
	mLCksrjZOOE5uvrl6kuM4xnAgHVoymXZeTUaoacUHCKhr/ww/IpAsAbfeyNGdV5UhDsnVG7FsKdEV
	pMnJogP/9broEQcz0//zBe0d2y6Pr0cOlb4dx43mnuSEM9TVEx6lPnj8XGdnGuguN7wRJS+4KugHt
	PCTIbtqNSfjsw2IczWXnKjLm4gglK11L6i6eNURH2did7riQCqveO1HS2ZB1PKBNX7h8lMG9PvPzx
	T7uzuVlV2Z5HKoGuJCCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eGv-0000000ENjV-0hUE;
	Thu, 10 Sep 2026 12:52:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eGt-0000000ENie-02KK
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 12:52:56 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4957eefd361so55447365e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 05:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789044773; x=1789649573; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ei/562soKHFJqkSdXuQm6X1dYNc/yFpT8LphVTPsPBs=;
        b=NuXWSKnjXp42acgkMe+BFTQN1PEDMjkW4z9KxXivCV4xxcCfqafQJxc0cdw37J6k49
         9KUL/+fl05lcSQPjGEY/YB81ReqHLhRVl9WuEAlvV2Q9A/D6XC21DlIGG69fjYOsLu+A
         pB5I+/BhmbDNExQtIKhS+8CWK2kfzVO+T9x7+fRKZUaA6UXp7osMxA4o7uKnQKo286Uw
         +POOj7HQYmryT2O8bS1mNdfmoX4QkPfHACA9VME1R3a7Ri2rmqKTCrxTADwJxmWlprO9
         q1C4qCy2RM2k8MZmY432qVwqTrjLnEodonPWnJahsS/OXH54pJAqYx5uD8Xf5ss85Gqy
         ePPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044773; x=1789649573;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ei/562soKHFJqkSdXuQm6X1dYNc/yFpT8LphVTPsPBs=;
        b=WbSO1cd9dw0FlBghnUPgUeidTz6Hu1EMSgukRCasV6qsx4zCDhyI7mDo48bmAEFZj7
         PrVLECOCcAx04fDWj1TBQU0dtG9EPeCq9ZQQEsn8gmggLtrts9C+VADmlWVnja/xFmh2
         hqNoRQOrg6cXB6WGgRCzqEHrUUv23FF1afZks2fHjW6n+h9SwYj21O3nNKaExP9QP52O
         5Taq03R8DCSqjuKzqj6f7FhUAIlR8NDwoo6mHisrDXKFDYVQmvYqWBcOBqRlgkm5nTKQ
         jZYXSBhtKqxMHacT8FBw+YEOndQjGDmdqImmCHS34lCIhcpfdUp3B24eBc7rVrIGntrw
         AQDg==
X-Forwarded-Encrypted: i=1; AKwUvBzYRKSs6iKwxzT5/wLfCdn2n9kb57B/DdeDw5LWRP078NHVjEyVx3PM41RpBMhyGLPDk1p2z8VnMvxLmQ==@lists.infradead.org
X-Gm-Message-State: AFuF++khp3bLNNoRr6KOK7niQKVIh9DlLK/M7Zcb6UG5zbbq+gofu2bs
	nQ/1OYx6akuYzR+70e6MDgaPPld/WBUBRltCF07AhCMKGS0MnZgQNDot5sn7gbe8cbk=
X-Gm-Gg: AYBFou0KbEgsVACc4wQyNhqC4xO8DwCBVoxGauDOrtOkz7HukkleTuAQGPeW4EIyTqC
	ux25HHNnGaKCElJkPtAzCzkeUWtqDPL6qMEhCn0xFZUSNi+dCbpp51qXy//cqsJdSWBeLQu+m62
	MgWadtiLjkL1B+VmmijmiZKa1yw7SYXBN3cT58FtHRRfBdSa2PCB9DKv4Jt2MFAL0V2z6KiFOKq
	aNaESPZoPb39VoimVy0Mz2TQiqoAbd+LXAvG4rUjDozyp8IHh7BDHhC2xIluvovYp9dcQ+n6kIO
	wXCPZLEYaywEMQKlzF++ics50Pww3Xq/dHYpWpM+SE+PLYB4iHOZHK1U+FSIjBzsfhEk3yjqv7B
	gvv1EiAYUXHPw0I9u9F93zj0swRvwgbzY/ozXF0+7X97EIOujiy17lfTDkDy808Tz6rwSmqk+PD
	XeleVnjGBdwGoD2jlbthKv/ZpNA6O/poNSdLn+SErqUYA7MZiExU6JW7Kqt5whxOPWyXTmV7V7F
	120ModERzLdddevss1ReY+7eY1w1p/rl8Q=
X-Received: by 2002:a05:600c:620d:b0:49c:fc6e:a3d6 with SMTP id 5b1f17b1804b1-49cfc6ea731mr404244015e9.21.1789044772934;
        Thu, 10 Sep 2026 05:52:52 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm286173185e9.4.2026.09.10.05.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 05:52:52 -0700 (PDT)
Message-ID: <434a7a10-d83e-4402-be91-816bbbc15bb7@suse.com>
Date: Thu, 10 Sep 2026 14:52:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/23] modpost: hash module source per-file, not per-byte
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-13-5dc1ac01672d@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260908-build-speedup-v1-13-5dc1ac01672d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_055255_068546_6FA709B4 
X-CRM114-Status: GOOD (  13.79  )
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

On 9/8/26 10:55 PM, Lorenzo Stoakes (ARM) wrote:
> modpost spends a long time md4 hashing module source at a per-byte
> granularity.
> 
> Fix this by doing this hashing per-file instead by accumulating a per-file
> buffer in parse_file().
> 
> All 11,189 .mod.c files and Module.symvers were confirmed to be identical
> with this change applied.
> 
> This is especially impactful for allmodconfig incremental builds (where
> CONFIG_MODULE_SRCVERSION_ALL is set).
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 allmodconfig, touch mm/vma.c, gcc    40.6s    38.2s     -2.4s (-6%)
>   x86 allmodconfig, touch mm/vma.c, clang  36.2s    35.0s     -1.2s (-3%)
> 
> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  scripts/mod/sumversion.c | 56 +++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 44 insertions(+), 12 deletions(-)

Support for the module srcversion is being removed in "module: remove
MODULE_VERSION() and srcversion" [1] and scripts/mod/sumversion.c should
be gone completely.

[1] https://lore.kernel.org/linux-modules/20260731-module_ver_remove-v2-0-c9163858f382@linuxfoundation.org/

-- 
Thanks,
Petr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
