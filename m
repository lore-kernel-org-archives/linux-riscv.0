Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B55D59D84
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 18:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9/Vc3wjs7s0j1yTTv5MuG0CIzR/o03dWrvsnmTQi90=; b=UDiyp68cZuT4K596yNziNpyKck
	u6gYPNjAFxcvreDZqomj9z4YOX4foxUTqDOLD7GMBn+op7wC5Zg+sOEIUmCN8gUXte1iyfGe+vS/5
	v1LRUH1wqKXDt6VxwW63XElzxZt8yZZ/NyHJdgNHLMx9HrOi4IwH0g/K2QGMlg/x652hTsKf1VXZO
	CUo2GHPt1l4AFxPg5mvg5SUKO537H6hylwUbfmZIvmXlR8d4lNBdV7isIiMZFW0Zt/ouW8wKXncCW
	dRoVV5k9VloIttiVXDqB/TrLCWifcjeKc+F6e6eqpX+sdQxE2qeFbtvGFfPBhLnXq8dMapQ0srBXt
	T29R1CzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU7xF-00000000wf0-19Iw;
	Fri, 12 Dec 2025 18:33:25 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU7xC-00000000weS-1Luq
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 18:33:23 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2984dfae0acso27883855ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Dec 2025 10:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1765564401; x=1766169201; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eUSGmEJqTzYByGnUlGU1GkRTgZG6xNYZQ+XlXEoFmO0=;
        b=WwjuMkFPhINlzq8K/nVwKT+xfRibUHU6XfGs2FfCe27UJQtstgONhCpYvgmtqLRau/
         thQ1vznHRFGUXovjy02cgV5aBo4tnv+E3y2luasVttHQTZKWozVfgAOmJeKeBfOvC9a0
         MLoRYwaPlREoxXZFhQo6CmmwMsWHcDedub3I2Gq3rF63xKUuETvnnx8xBbdEezliL1Gm
         a5/j4U65bRNxt4AwE6XPpMi5mGTVgdYJ09REvym1vZU6vlnvHAzFCDiJzbFYFczRrJuw
         iWF6kyUfDCD5ky54lg2QGvGhYPpz23CxP27rs3Avu2v8fLOLMgGwfJIlK0usrTe4k5ta
         Uwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765564401; x=1766169201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUSGmEJqTzYByGnUlGU1GkRTgZG6xNYZQ+XlXEoFmO0=;
        b=ASqlSmZ+/jjubjxJSmbXx5LhYzNQKF/Y8v9psxA1odWnhxBxmXq7pQ9lZ8mfkHIdl7
         QgIa5W8lqaQkb8RV2I7W6whLgZFaRfo7XK066g9FCxjZxo+J78demLSmPazwoVnW9eZj
         gSXtIuvywbBVPDX44ICBmK2enfjjv2vcwp5pCcjmV50Lff9wVqeUadLGKEtTQY2VkSkp
         em6DF2Y6/u6vO2swyBAntRQ5rcODXFsLQYM92vBr0d4YWTQjTJdvdZFxFBHDOY7cyrp9
         YttZmNjL30ebMlDsVeEyxDaPs5Qo42YoK/M3r8T4fkrvaxLbR0L2IwgFMhhmbPTo9X6Z
         stKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwR9qihjbV8gAXgUTQmeYk3H50SLiS5tA07fn6wRurXhAVC0zHE9FhcNvo0NBwsxKqBq+r1PEVFe+OTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjsiSybsnz1v+7WzpJrEztp9pdvg4ylsnGwxJEWppo5giLE7gz
	Yx2mW8s0ruo0g26eb+vvDzlvdijqRdiJ6t2b936OyqfVXDUQ/0Gz5cq38vpMhjoAYkI=
X-Gm-Gg: AY/fxX75ftcuUo3/iNCjWlGsfWfmrsIkWfKV2wnow4josG5BGv1dxlzkA4DRTTTgzk5
	+37evt6tIHG7oaEnyj2mVEF6/I93N0P/nZQjs0Pd1Dau0KaxbmU2Wvulo5ZaCa3ISHHvzNzJvL7
	rmqBYUmfp7AdZkZBNvGZPWjO+3evtFv+K7uDYfwqtt4wKl7/QJCllqx7Tl1+vhXwyOwAqvHI2vg
	6aTLi7p050mNbhIcL33PU3xKkDVy88d2QgBOLovvkVqBJZCTFcwcs0nbOnWip6Fo919b3rDki7b
	R1Y5SFowCETDYVTJzmLFWgku91/K36z80A98pquDVg1ux3/pKWIJsL6zhahv/m+cx7Xtwesu3y/
	dSX4ob72x5tMr0J0TPPDyrkVFB8Z1AtvLzuoIwOU7ydKBUi7Vuwm4itGVOALnxsV3VrEs/dwKGj
	tRMkfcMjSXA9dfYwZRb6zE
X-Google-Smtp-Source: AGHT+IFtnl41QfJeu3IJ/uV+L4EiFBX8zP0ux5EampS/J9pJIP4sBjIMESLAF9z1UPcxbBQKr8xzaw==
X-Received: by 2002:a17:903:22cc:b0:29f:2456:8cde with SMTP id d9443c01a7336-29f245690bdmr29337135ad.4.1765564400511;
        Fri, 12 Dec 2025 10:33:20 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea04b7bdsm59970265ad.85.2025.12.12.10.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 10:33:20 -0800 (PST)
Date: Fri, 12 Dec 2025 10:33:16 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com,
	richard.henderson@linaro.org, jim.shu@sifive.com,
	Andy Chiu <andybnac@gmail.com>, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
	Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>,
	Andreas Korb <andreas.korb@aisec.fraunhofer.de>,
	Valentin Haudiquet <valentin.haudiquet@canonical.com>,
	Charles Mirabile <cmirabil@redhat.com>
Subject: Re: [PATCH v26 00/28] riscv control-flow integrity for usermode
Message-ID: <aTxf7IGlkGLgHgI2@debug.ba.rivosinc.com>
References: <20251211-v5_user_cfi_series-v26-0-f0f419e81ac0@rivosinc.com>
 <e052745b-6bf0-c2a3-21b2-5ecd8b04ec70@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e052745b-6bf0-c2a3-21b2-5ecd8b04ec70@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_103322_431644_A5058359 
X-CRM114-Status: GOOD (  17.82  )
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

On Fri, Dec 12, 2025 at 01:30:29AM -0700, Paul Walmsley wrote:
>On Thu, 11 Dec 2025, Deepak Gupta via B4 Relay wrote:
>
>> v26: CONFIG_RISCV_USER_CFI depends on CONFIG_MMU (dependency of shadow stack
>> on MMU). Used b4 to pick tags, apparantly it messed up some tag picks. Fixing it
>
>Deepak: I'm now (at least) the third person to tell you to stop resending
>this entire series over and over again.

To be very honest I also feel very bad doing and DOSing the lists. Sorry to you
and everyone else.

But I have been sitting on this patch series for last 3-4 merge windows with
patches being exactly same/similar. So I have been a little more than desperate
to get it in.

I really haven't had any meaningful feedback on patch series except stalling
just before each merge window for reasons which really shouldn't stall its
merge. Sure that's the nature of open source development and it's maintainer's
call at the end of the day. And I am new to this. I'll improve.

>
>First, a modified version of the CFI v23 series was ALREADY SITTING IN
>LINUX-NEXT.  So there's no reason you should be resending the entire
>series, UNLESS your intention for me is to drop the entire existing series
>and wait for another merge window.
>
>Second: when someone asks you questions about an individual patch, and you
>want to answer those questions, it's NOT GOOD for you to resend the entire
>28 series as the response!  You are DDOSing a bunch of lists and E-mail
>inboxes.  Just answer the question in a single E-mail.  If you want to
>update a single patch, just send that one patch.

Noted. I wasn't sure about it. I'll explicitly ask next time if you want me to
send another one.

>
>If you don't start paying attention to these rules then people are going
>to start ignoring you -- at best! -- and it's going to give the entire
>community a bad reputation.

Even before this, this patch series has been ignored largely. I don't know
how to get attention. All I wanted was either feedback or get it in. And as I
said I've been desparate to get it in. Also as I said, I'll improve.

>
>Please acknowledge that you understand this,

ACKed.

>
>
>- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
