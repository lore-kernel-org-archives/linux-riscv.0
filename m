Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2CCCA1012
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 02:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uji5djn5TBQvWRpbF7hmj6NEHJ6NWaYhbLkAiWcxsCU=; b=TSF7yPlZoWW1JwhLEa0tkjb0Ta
	w76YhQ8kDgTcaBKpVb/RMfAlFQFO/MHEehfmLjQwxx/aSqovgiDAHEhtmrAfMCasUfVjnKLPhuvza
	EhQOAmKnUkZp0qPqAkhtrrMIZo9eedUDeTZaO1uHIFSB7LFvuOxUsp283Bg0F8eW958v1UMWZnHCS
	XK1DISziweaVa6iqmdduj9iZIuem5Th9epSyGL5MgzdxstpKmvDt73qBaL0YcF/HHWMTm+7tWfIRO
	jxZ/qMm+eJFJuY1EjWzfJexXu7WAugV/BOEuR6o5C+E1YjrKuyGgLVEaMu0ZN+O4EeofeMpHF3y/9
	FdKTOimw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6T-0000000G5YY-2XHE;
	Fri, 05 Sep 2025 02:23:05 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuJCd-0000000F5wd-3ibP
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 23:17:17 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e94d678e116so1765289276.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Sep 2025 16:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757027835; x=1757632635; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=44c7GuplR7w23bz2/uE3YIyn+u8WzZUsTx1xHnP0MOM=;
        b=Yfp+UXr8Hllmm4RIwlgJR0JVB2e4Du9Q+Cdg+TXjm0pl8qtxSRz+h3gfS0EWS2WHnI
         2CqtkFmeYpjmV6YaRLskIbCsEAYnRal9yvXZQe5NhgCwhnEwG8J5iGtCOOtP5mhN223n
         VXJ/w6f0AXf6dfGsUZp7LuVm2ik9wWn2kVt0gEerrNUBfQgVdzqPno7X/xqYPCdHpnV2
         S2hMK2dec1J33NmF2rNcUajh+8sCyqqF1I6ZXwC2+dwydGqYAc9MqllzoN5/gnnshUyj
         yGQ+ECi0nM0s37L48yHq1E24OqlEdM9vSd+NFMEFl6g7va9nTzko4Irf6Fzo+NKQbE71
         WvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757027835; x=1757632635;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44c7GuplR7w23bz2/uE3YIyn+u8WzZUsTx1xHnP0MOM=;
        b=qU8TQ5I8rN0Hng+nuyDcwoTh1BSeT9G+odtE4mJqS0/mU3UFMG9nZehkjn+7Mo0UVB
         Yxi5U1MI1B2QyL16U4HpvyV64AZI8+AVYruwBjhrYepplRDFK+xmh9L98uhG2R3gmGBg
         EgQtViSxJNBoqsP0d/EFqpIngIyRztVw1WIbDs2AafmxAyNGJgYYq1IKFZOcEKJTQVty
         r9hkCDTvla4SbYbPnWXGHvnUOJ5GadMsQ3LWYE4IdJyYpRU3AoQL0iAVnGqTH530bcnb
         hNa0/ZDZhvnpobk2UB9krdTt+32/xENLhPJZ3t3mWQ8Lm4A6Hmx3XCvgIuFLKc4szn9N
         Bdww==
X-Forwarded-Encrypted: i=1; AJvYcCVb48RpJQMRe4OBsHf418+GuoN+OY6qHTm++iGd+JLwMDX4UCagdwRAmOPTFaY/tH1PtyS7PKE7SfW7Pw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXoeblYO+p7Is8tljArvWrH+XtX2f06QJ0lrOgHsIMW/YssVNQ
	xXSe4OGB2veDDOIgJKRf9QONeNFGVqpY1sQP3OM+L6DrJGUR5S6hUC4b
X-Gm-Gg: ASbGnctzRKQw70YcboB5U1y2YDsrUDp7oUMv9a8YAjxhdNCYD+fwJhzsvkD2y4V423i
	myzuSYvnwRdQ9k7KXf+y65SXmTZxus2MOWPs0szLyH/deh3ei5F6T7kkB9X8orjvz82LPp8FU5/
	rvyY/RMFLn/k7SPU7zj3C9srP+aSNYqtZ/Z4giBltJXtCPkMfBf2Zrj/GYgQpu7DssReVACMJ0/
	RqjeIkgrUdlUfKoJHTSb0q40w0RDSt4huUWKrl2uhjO9wa97ZWjBammV8xCUx2EBcpmIVVaRvIT
	rmgRA2003i1RtfEu5aMeFBItSA2/K8dpr7PMI7HjS+s8RrjRINBDFwXUc+MGlku+GVf0T89PSkf
	qRPG5cHSgsisDdP8YvQ3fqWY6fmnSC5SRypnzO6uXlfO19j9mVShMWSfR6KZ8E5aw72Xj+zt42g
	==
X-Google-Smtp-Source: AGHT+IG5rC/L+YgDnZCQ1gLq4F9L2loshi3GG0alOQkkWDK4IDT94yEI8uFHJeAzvHVBTi2SzWU91Q==
X-Received: by 2002:a05:690e:23c3:b0:5f3:317e:2eb2 with SMTP id 956f58d0204a3-601782cde5bmr3513128d50.28.1757027834471;
        Thu, 04 Sep 2025 16:17:14 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a8511f0asm24570997b3.34.2025.09.04.16.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 16:17:14 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <b0f83328-5df9-4280-a357-7fc4d48fd0cb@gmail.com>
Date: Fri, 5 Sep 2025 07:17:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] RISC-V: re-enable gcc + rust builds
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Tejun Heo <tj@kernel.org>, Kees Cook <kees@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Matthew Maurer <mmaurer@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Shakeel Butt <shakeel.butt@linux.dev>,
 Jan Hendrik Farr <kernel@jfarr.cc>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Christian Brauner <brauner@kernel.org>,
 Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
 rust-for-linux <rust-for-linux@vger.kernel.org>
References: <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250903190806.2604757-1-SpriteOvO@gmail.com>
 <20250903190806.2604757-2-SpriteOvO@gmail.com>
 <CANiq72=FJSRwOPNG4ZFeoex3MssTjmhozp5Xd++PTCCSJaJ3hA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72=FJSRwOPNG4ZFeoex3MssTjmhozp5Xd++PTCCSJaJ3hA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_161715_945982_6E719F4F 
X-CRM114-Status: UNSURE (   7.48  )
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

On 9/4/25 7:27 AM, Miguel Ojeda wrote:
> I think the commit message should try to explain each the changes here
> (or to split them).
>
> e.g. it doesn't mention the other config symbols added, nor the extra
> flag skipped, nor the `error` call.
Yes, the commit message is worth being more detailed, I'll improve it in 
the v2 patch.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
