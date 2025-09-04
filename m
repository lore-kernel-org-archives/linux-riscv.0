Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489D7CA1002
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 02:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxunIOB40PQ60YUD2T7XNxFw3YTQneoOt0tJ4ExosEA=; b=aFvsKjluWUu419j4IMUVC8mzZF
	Jmr8AXRjIA7hmFljpL/21r/X2jIHG6F6MDRkl2LulC+czJbXFw89e2rDlr6AfbKfC0WjUcSHRP2iS
	/l6WAMXbT8uMOYquh166O+31v9Pad9DO77e4DP9LCD8HJKN8WQYVbx1KURSnexpJF1QTc1ZMzz8FS
	kJxJ1pG6NMAwVmfmSq2TJN1U/M5GXWfIHW5n3gxaINZzdSnUfEDCFIueKKhs/ZoFhiYoUD6YmWn4B
	P2CCPfkY9D4D55UTdhThItm2zZDHP1IlVM24DarJr89TaxhaiQtxxa8M6ynXeoZDLlfQrs+8MIv4D
	O7SYUVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6Q-0000000G5UJ-3aEe;
	Fri, 05 Sep 2025 02:23:02 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuJAt-0000000F5Cs-2hmd
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 23:15:28 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-71d6083cc69so17197927b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Sep 2025 16:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757027726; x=1757632526; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tpsuh96BYhE6mmizhC+t09E/UhsUORGOygG5WIux6Ag=;
        b=kSF4I+2KMGOOg5C1szjdscqrv4DfiGYuQjgLFdBYBw4tNxH+Xn+6J0usUaIcLAzPKz
         g/+M+/sX/tl02ERXXPyDfAtfjQ4MZmJcTvimr8OrRiT22zssjqhcB+IXxNKkroBhu2br
         a+tTwHVNR8C04Wtfa/N9G+aktnUv5CcQ5aHheSJNrglsuJLy32p2aEJEwp93XoZn6d68
         38Rwb+y5RxzH9BLBQ0bNWJO/HJPQAjVhcBK0JgzUe1Wtdn3HRonOMEjMz/g4jUMiyz0W
         UyoQKJAq1d/PKH8BbgS25IX8J/JzhghnZi6yBTGYQyQ9+plmT7FtI6rblRaVTYt69KzU
         mXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757027726; x=1757632526;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tpsuh96BYhE6mmizhC+t09E/UhsUORGOygG5WIux6Ag=;
        b=KpBn8ZLU4ZvzJoasvr74tvc4aVI1dMdEbGuDx1kqOYZZ59AFE/h/ftLRJfjIvzI4OG
         8Edvx/9eRvkLHZmNWnl8OeHwh+JonkhadvRoTxr4f0/6AOvjB4xtTCZ7d5ouF2gEboL/
         qppr50UBfyahzwt2dllO7dpAo0IlRmPChj90ZxVP/3S3YyV5FQgfOoRyXvucKUU7m3Tu
         nwuLxZGYVLadNZ+cfNrF2x5medorBJYK8O+seCJ4QmJuZdgIYdzRDKWFURYFj/166r9Q
         aapZ2Gi1Y8v3vl8Llvfi7ni7U1MtNwXK6mjdc71X0T+BpOQyKaO57nM4Qfvquck4FF+8
         YneA==
X-Forwarded-Encrypted: i=1; AJvYcCWbRU7QlMcuOuKVim3byH+57P55BhVdLxbJ8uguOkmqPwaML3Zo3QKpf2oA1Ih9FnYXwygTSLlRDLy3DA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjVA6dzJJC3jp0kYFlj4rDAIs9xLOFVopMzou1C7kfOmriMOlh
	gen9U2fGX8Srbwbrw/mM56VWeq0Lvjog7ryPyuLvpUzCfxx4B0yhbqwK
X-Gm-Gg: ASbGnctLPi1ufnFmM70z5ug46+vCS5smvFCONBz0bf0mTPudasdPKfLrfTMrxaDzBlx
	9y20vzF41w2x3+FSM/p/EWSIBgQq+EyHe8lWTMHR60uMmcUzJMVeAqOJ1g9MKia/zkcBDdQt0EA
	rryUNJcLbwHcapsNrBuWtSORfj4kqqoDcAjgsvuNzJQC6BPRPfZmY8BUb6XlBAQ75t9XlJglHKz
	jBceBVNy2jwBMsC/eJ/gGdBa//WrCJb63z95DByrij2EIWqHD2JFkfuu0FR0ox6VXtnSo41Gbvu
	FBqpF4w9W3BxDXpQjxcjHHHeMC8QJuxhZzMkHfKpTdNAUCROT88DMWNJIKgCAXgWgn/cs0lsdv4
	PGaONH8x/rJBZcKmTwyKQZG+lOELv7jtSk/3z5WpK4nYGHI2l/iS/CCGXrU+iSUw=
X-Google-Smtp-Source: AGHT+IHnQqPIbJOAu33e4UiDHC0K7E2hrlF3HKVf3SiLs0oAF7WqPL0Qhjae/HNmcjm8lQ9kydnXvQ==
X-Received: by 2002:a05:690c:630e:b0:71f:e154:7aa2 with SMTP id 00721157ae682-722764d161fmr242712347b3.25.1757027725963;
        Thu, 04 Sep 2025 16:15:25 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a82d6abbsm24968377b3.15.2025.09.04.16.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 16:15:25 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <fb47fe55-7e9c-4d2b-91d2-1c6f29a77f79@gmail.com>
Date: Fri, 5 Sep 2025 07:15:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: get the version of libclang used by bindgen in
 a separate script
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
 Kees Cook <kees@kernel.org>, Tejun Heo <tj@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Matthew Maurer <mmaurer@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Jan Hendrik Farr <kernel@jfarr.cc>,
 Shakeel Butt <shakeel.butt@linux.dev>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Christian Brauner <brauner@kernel.org>,
 Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
 rust-for-linux <rust-for-linux@vger.kernel.org>
References: <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250903190806.2604757-1-SpriteOvO@gmail.com>
 <CANiq72nRA9zHbzroLPa9aNSEzKre=V8Jwmw2Lezy6AHgbm+FcA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72nRA9zHbzroLPa9aNSEzKre=V8Jwmw2Lezy6AHgbm+FcA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_161527_696419_581A7CB8 
X-CRM114-Status: GOOD (  10.63  )
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

On 9/4/25 7:24 AM, Miguel Ojeda wrote:
> Hmm... I am not sure it is a good idea to move that into another
> script. Do we really need to intertwine these two scripts? The rename
> isn't great either.
>
Because of adding a new Kconfig symbol for the Rust bindgen libclang 
version, then we have three places manually calling bindgen for 
rust_is_available_bindgen_libclang.h to get the version. I'd like to 
merge them into one script so that it's easy to maintain in the future. 
But if you prefer not to, I'd also be willing to revert it.

For this approach and naming, I referred to script/cc-version.sh 
rustc-version.sh and rustc-llvm-version.sh.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
