Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB0CC88E50
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 11:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCeBNtm9HUObTt9iIuZ6m6Zr1I0uHSVrqKk914oe3+8=; b=ggFGEC2s0I9P6J
	hKgiRCSDmsjv5qWgZ59x/jY8y5hJHQqj8LM9kyQH81bi4rOXody8vxs3xl2ico3Y2l1oxGDStvh8f
	Eze1fSlnDN7XmbT/mzhf77nNRtsYSekhu28j2jkl64zPLNqFl1Go1iA2fvjP0UnwIsE3+Lup1zWxa
	vBxx3QFUBtn03ersGlurPXMeuuL21M0l3UMPP6GFTw4l3e3Q5rLEX2midUUPhQOCy3HwQvVLqqA3n
	Io4+X9vI0ly/oabeasfwMU7lBCRcbJpQKKRrAbc7fH2oHqFK2waTPLKqeydEUvwhk+hFHCdfZcEzl
	eq6h84dD2nzIpIqB+ebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zt1-0000000GYdE-0oWF;
	Fri, 11 Sep 2026 11:57:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zsw-0000000GYbV-1hst
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 11:57:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4956869750eso7577755e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 04:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789127856; x=1789732656; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wr7n2cO3L1gr9+vq7aPZsfQwfFiNJgEahYqoxuJotBY=;
        b=T6Gy/HaSNtJ9nTyHM2dBDjh6GlS4hS1yVCv1ggPF1Kf7wpCRTbFgO93Ut1msRW14CH
         hPg/1Gs3VeecqBv4dygMv1MwqGdHh1ESV7ChPsXqW8e1NDGYUPr1KHdXVffIkAXsf0sD
         nZfqnhRQYetlzW8x0AQAm1gGb3gBrZzXdDJMsj4HvP5MXzKacf1T1dXKCa/x6Gwqs2Hd
         rCtMPQ7kAxW3376yc2bXQznAwLxIm8J9yEbLBEODnfd1lHEHfcIWNWTtVoUleZNWuOew
         YT3yCRl8u9JQaxVKf/5ftjLFQRk7ykkRt89L/NX8I2XuazPH6+A7/V2kOfpixSav5hPL
         fWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789127856; x=1789732656;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wr7n2cO3L1gr9+vq7aPZsfQwfFiNJgEahYqoxuJotBY=;
        b=qFIZn3V3iZCn8n8hjdM012UPgac482omDunlTfijRiPwE/D6Et2v/f+efmZ14X8zoT
         LbIIMfTUu3PA78ZXKPZnHZYSJ+sdC57LhHCcSFXaarpeSC+oz95qMTKe2Dl8axNyPrT3
         AULrPCJNzgfoDEAkP3UZxmxqqHhZhtBXswkHrDjjK0i7GciVbBlm6rDQtV6FoCII8/Ub
         zr42Vm7nQ0+C44uGetB8Jo6qh97Tuw6VSTQ6NDfK+++5LjxfCJoVMl6A5YyULVPBB5J5
         9+ASTUJJKZsPrv7MkvTNy5Jw4T+7FfH7jVc6S4wHqVfHHMItc5ZLEMP65JsowOFxuWeq
         msvw==
X-Forwarded-Encrypted: i=1; AKwUvBzdSh0sYsotWPGeSAn1Bepj3wtcXeT1PVvwDxN2rf9OSAODX+tFYGnAGf7DQ7cUICcz1lFx3hvzNat9mg==@lists.infradead.org
X-Gm-Message-State: AFuF++nVQqsUU87CWOnj+FR2nIgpxlP49pywDKrPp+ZhwdsPDwSVOs+Q
	gqK5csI+9OwXR7DIDhVrKx44NvBA28DmxGVyATU8Dg3z62BDJkaLTick/x/higgRx8g=
X-Gm-Gg: AYBFou0UCxHXyRF3PTSzqssPPbt2Oyc1lf3byORM3RXhd4CFXPPl5jgM2qTTkgUL+6Z
	3YM9YaiyQfvqzGoDiS1FtjP1Y+n9tNDKaylI1evSb4PdaVhJuwmXTdKdy5bWsRT6148JspOzzNc
	GM3xP2QSzmLMvdYkMHcK9Y6z1Qe6zh7tRPQy2XF2WQ5DdnnsN34K2uNYe4rk3KOocNWrm9iKDhi
	bcFRyzeIH81lsvnHZmOnlTb5H/lmWx7joK9rvwXiYm6C6ZlTQ0yUAL4KZhbWbHgE7dE3VI/xYqr
	kso6jp3zQqN9cttKFhalh7si+3IhXT39SO04//MasX10R2iW0cH6uFAiukG/VLNCglL62qxYvch
	OG0TFOd+FsSk8XABQz8iPF9Ov0Uw6jmondD9Ytmhb6zxXhhTDkMdfy6ESQaEUAlx+Ci6tSAI+oo
	yrrxzkrBm8MrHSdZGWveh6L/FqgAvlAkVQyFPNYOL8h12PzYLOZFF+x36x/WPeybmSqdX43UIob
	MARx5NGGKGKMl5IbcAoNHfZe/QIGsgjvix8
X-Received: by 2002:a05:600d:8496:20b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-49e6199234amr30006585e9.14.1789127856324;
        Fri, 11 Sep 2026 04:57:36 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c300e2sm164777985e9.8.2026.09.11.04.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 04:57:35 -0700 (PDT)
Message-ID: <f24ddba6-b7fa-434a-8a2c-9f04af6969e6@suse.com>
Date: Fri, 11 Sep 2026 13:57:34 +0200
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
 <434a7a10-d83e-4402-be91-816bbbc15bb7@suse.com> <aqPYvKR_eRsFlEd-@gremlin>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <aqPYvKR_eRsFlEd-@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_045738_484264_81D2C960 
X-CRM114-Status: GOOD (  18.13  )
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

On 9/11/26 12:41 PM, Lorenzo Stoakes (ARM) wrote:
> On Thu, Sep 10, 2026 at 02:52:50PM +0200, Petr Pavlu wrote:
>> On 9/8/26 10:55 PM, Lorenzo Stoakes (ARM) wrote:
>>> modpost spends a long time md4 hashing module source at a per-byte
>>> granularity.
>>>
>>> Fix this by doing this hashing per-file instead by accumulating a per-file
>>> buffer in parse_file().
>>>
>>> All 11,189 .mod.c files and Module.symvers were confirmed to be identical
>>> with this change applied.
>>>
>>> This is especially impactful for allmodconfig incremental builds (where
>>> CONFIG_MODULE_SRCVERSION_ALL is set).
>>>
>>> Whole build, 128-thread Threadripper 9980X, best of N runs:
>>>
>>>                                          before   after     delta
>>>                                          -------------------------------
>>>   x86 allmodconfig, touch mm/vma.c, gcc    40.6s    38.2s     -2.4s (-6%)
>>>   x86 allmodconfig, touch mm/vma.c, clang  36.2s    35.0s     -1.2s (-3%)
>>>
>>> Assisted-by: LLM
>>> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>>> ---
>>>  scripts/mod/sumversion.c | 56 +++++++++++++++++++++++++++++++++++++-----------
>>>  1 file changed, 44 insertions(+), 12 deletions(-)
>>
>> Support for the module srcversion is being removed in "module: remove
>> MODULE_VERSION() and srcversion" [1] and scripts/mod/sumversion.c should
>> be gone completely.
> 
> Hmm, that series doesn't remove the script though, is that planned as a follow up?

My reply to that series [1] notes that it should also remove
scripts/mod/sumversion.c. It should be done in the next version.

> 
> I guess I can drop this patch from the series then :) Also patch 17 I think?

I agree. The module srcversion is no longer needed since build IDs are
nowadays the standard mechanism for providing effectively the same
functionality. While I'm not sure when the mentioned removal will land,
reviewing and polishing this patch and patch 17 would IMO be wasteful at
this point.

[1] https://lore.kernel.org/linux-modules/4e321525-708c-4964-9937-d94ea27e8d85@suse.com/

-- 
Thanks,
Petr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
