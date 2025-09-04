Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFB7CA1012
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 02:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Y82HclI0qrW8jS8wTB2mJ/JTuX3Z47BwWqHRWp8UjI=; b=p0uIA4taaJ4IAsGDZtCqB6BjhX
	NXqnt+5ImxIBTn2VS9V6ZTpMbANrvDIeqYAawn2NqTHKfjTM6FP3eoRLp7AdAMuNwZU8sgx9y9dtN
	y68IawXk32HWiAzO5izWB8B5OD5XOrva0rRhAn4TN6EwQnhuFDOxhukTseUFT3+59si/Dk5Adw9UE
	w+PurfcrNz29GGBJfAPUkyox2gQjxyXZ1niQUoAnllXLk0IAcnd5WAakXVAzzVX1kXa3zYLn5ljCO
	xIg6deQp4IqS/ZnOToCDqPoCDil7UoGno8PYroGyflF2ds+pi96ARPa7f/WViU6ECnRgsaqcu/TlY
	hEB4KCBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6P-0000000G5QZ-0hW2;
	Fri, 05 Sep 2025 02:23:01 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuJ3E-0000000F2iw-0eq9
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 23:07:33 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e9c50598296so1480693276.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Sep 2025 16:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757027251; x=1757632051; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o24FwX+ITQGiICc7H45rzmOTTaSz7A38dkMoC4FIPcs=;
        b=QmcpUbPsTuoJWsMVX61pY0lu9MobUybIdmhTqSz+XQIgAIb8vKDjS/ue2nimHiSNlU
         LT5E4bwYTNNddlCFgd4lQxl6BAnHiIhtOYAEy9tD1U7bTOFTACDZtbpXV1cjX5mqZdNU
         vXlnozB0YQ6Sc/wCobAJrfFj+RkxVSc6uxiJgSlRWMHxh0+rZ/25Ye28+I7EMUU6t/kj
         tW/eFvOXhD4aKPPgY2jClHjWRUbf9gUuKgy+as1ZvY2YdoxOZIz2UEa/7LxsZeWQjiBJ
         7uZWGlnW2Uo9ZRuvpoGVnWgTIf8Np9CnPzNon28IMDE9U7TfdmD4Nf5bTxNtFvO1mQlu
         bOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757027251; x=1757632051;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o24FwX+ITQGiICc7H45rzmOTTaSz7A38dkMoC4FIPcs=;
        b=sSBQ3t9itbAODjd1dSCLeWTm/K+ot7fthz1YI67wEjBhPpDDWlaXM/2aqwkoHKnQCH
         5CF5gWjWfTx2RtGNOnhHtNPL19Et3ZrfIPPEmhsebKnMAuO3O7wZNXCYm8F1GaavyLbz
         Z1rujSPhi3gtPCpNrflOQyLbLjpZrSxrXGwQjOmDMzp8ytx4ZUvJY/xvKs82QcbDRyO+
         /N+0qeJkgslwn0+rHTa+EhZb145DfA/EPfeXeCcfbp+5JrfihM4qH3TjneUWJ7uS0V9w
         LD6rBgWEA20uvbE7Mhfvuard0M16KxtBItPnHEpR7RTHUENY3wwhNj+FBbhGF8+2prss
         jETw==
X-Forwarded-Encrypted: i=1; AJvYcCXiJNbJydIKNFrsYvLpWLnD3SJDyMbDlpDb7HlbM6/De0BqF/QM9B9TOmxCnhZUf2DhZItBwbM3Oh/x6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUrM2aYnDqdecpOoiCdlIpWLAnSeyeKF7ysPilm/dPPcaDgG9n
	Fih8yX8yGyw1naMjCP0lNMUksODlavUiwIfLdoZHFpTU7ZK5LWn1xxX9
X-Gm-Gg: ASbGncv88OCxYkRS54rkOKbmqjmlyX8dxTbQaJRBm116TyYI7H+RXDH4/oMwKSwEahf
	17XVHTcWrDfO+2C0HNS4KWzFi8fUMxEJf9kXTzdQQW1qA29VkjGmcYwD/to+A88/W8okwHIWRAG
	2HJuysv+48YJ5oo5XeCBwVz7ySpLzsLg2Ko1imCz0wM80VngevlAMxPXVhcV2HktcdZDDMuiC03
	mrhSuB04KctvJ/k9AH4nY8f81hErKPHooVVlNqNw3vZ81yD4/iQ2GRSQGpnrbT6bIUMHX0iWUK3
	3+F1yTgLJoj6i7BCnDiOtrxR3Oqq/O030hJYLo5nzgCPywoNwN1xuXiK4fK+fo8BFNkOUsQ/Yrv
	q5uQIsBlpC27aJsn4pC7LOjvhbJhqQUpeKc2G7ID5KYrE4kppFT0m
X-Google-Smtp-Source: AGHT+IGO63MDek7I3AGn3ywdxwapbr9b/z6cKhhBv8np4smj4FEq4Y1WEYTgKI9LUqLR9fGRnNNxPw==
X-Received: by 2002:a05:690e:4282:20b0:5f3:317c:cb99 with SMTP id 956f58d0204a3-601780cd7e9mr4605585d50.26.1757027250697;
        Thu, 04 Sep 2025 16:07:30 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a8510229sm24951187b3.37.2025.09.04.16.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 16:07:30 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <1b95b2f0-e916-4a86-a274-da2ff7f9d516@gmail.com>
Date: Fri, 5 Sep 2025 07:07:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] RISC-V: re-enable gcc + rust builds
To: Conor Dooley <conor@kernel.org>
Cc: Jason Montleon <jmontleo@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
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
 rust-for-linux@vger.kernel.org
References: <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250903190806.2604757-1-SpriteOvO@gmail.com>
 <20250903190806.2604757-2-SpriteOvO@gmail.com>
 <20250904-sterilize-swagger-c7999b124e83@spud>
 <f7434b76-49d0-4ef3-8c77-c1642dc211cd@gmail.com>
Content-Language: en-US
In-Reply-To: <f7434b76-49d0-4ef3-8c77-c1642dc211cd@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_160732_201751_2334CEA6 
X-CRM114-Status: UNSURE (   4.78  )
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

CC rust-for-linux list, I missed it in copying from get_maintainer.pl, 
the thread is a bit of a mess now :(

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
