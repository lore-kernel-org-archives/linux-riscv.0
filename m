Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDB9C5B552
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 16:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHXnBzgi9rnyiqeaQkSfXddNPOvaKrEJJhJGp7DINt8=; b=zqpE/YZ4hMy3jZ
	rH1GkRfD4frLhe41aeBvwlu6xvVY5GVa86sO2fwJqaL+bYxcNmJ8zsXMsOoZDmQzToDVIk2h8omwY
	1+xcobZ1iD8CGhXNmHkcD/cGX/jvdWcjEsydKIZSgLiXnk+2MUMsonkgTG3QnykJmsCCqdLou57Oc
	gW6u1AxNPgO3cO6pSWLo2hPazmJQS07hGytmT9RsaCA/U+bPNON6C48i4KrMudGVOdUA5hosfuS4S
	pB0f5YlpLuFDn/6Yfij288HH0Me4jwdqgwcExhsCLdTBFxr2kVKmNCoblnuDbs2nrLYNx1saWC2M3
	UNJUVvtxo/MFsZGPg05g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOJLZ-00000002o3e-0ngi;
	Sun, 08 Jun 2025 16:58:13 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOJLW-00000002o3J-2WXK
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 16:58:12 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-235a3dd4f0dso24518595ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 09:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1749401889; x=1750006689; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nuldK7MCvX30cQFzWuI0PzalznhEarc6NW9MP8uHyXE=;
        b=GlS8kc3gCxg6UZkFyfXKZ96sCbeCesQcbBZriWARVEmqzbSVpYPX1x24rv0BaOe9+H
         4SgEgsgoqIpXdEcycLMNr0MnpYhgTU9icVf+OBnQ9qx8Jsl6Z6ZLapz2b/jS5XMV3F3E
         R2VRG4rclORlmhX1s6qjhxMxUN5mn6SpnWhG1scAhyGEnMf1JRUEN1gL4tMTuUpLZlpf
         54URjBVbwklxgxj4pMGtomSHwLdiIUtnkVb4ADDQ+N1n0vCJ/uROELf2INPWa1fbKRq+
         +jUb1/7HT31D7TuTO9VIvwSf2jxZ83QbeyTqIDFfNstqhgmZoFOlDWEX2b4KKeyM3JgU
         y/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749401889; x=1750006689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuldK7MCvX30cQFzWuI0PzalznhEarc6NW9MP8uHyXE=;
        b=e2M2B+tp8G4v5PQcmYvNHbxoM0scQW6xAxxBIAEdGABxttyg+l+AfmIEBUCg7bJDJf
         IW1AwAeO7zLGblLPOy6xvJKJRCjPmXRRXBjo6LRFPizbCvMG4YIgZcL3nhhh4m1w4qE8
         5+8TDr4i6XmHY/5tccCYXz5dk1oBrmboJJWXuMolEt9LKHXn4SkN8JZYe+D5ZVerMZCf
         vTT0Yp39AQ3dtSwNaMcRuNvzXxPKAQgm+Ht6ptS/7HZCQIwyB2nyQA6/WatYuXeeWxeR
         s/46Xuef5Z/GwDvyATd/FWvJa471A5umIH8aCiSWHumC7763fMzV6K9kGNcaljG3UiLR
         75vA==
X-Forwarded-Encrypted: i=1; AJvYcCUxiyHmivTe+uxPrJBgqBxbvY2jrCBD/qDSU3Z5G4xf+42SGyIfMn9NKXNpemLIDGlUYXO4qKLCZDLABA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzChdJ1wR5AlLHU6NbugJvRUmd/+eRLSUt/uzQb/ywuRMTXgtcw
	UNc7RzWOiVwn8Dc7k05W0QbbpULkPmUYo4ffFtJD9OWeI2mdsvAgzkNfGKV/4wkxiVk=
X-Gm-Gg: ASbGncul4stdhxo2QeyHN9VozTuEElMSoY/vKAl13/1rCYg8OKdJ8bwbCy+o2osNplh
	7WihBH09JMGen6zhqQWS/hl7tumS5W/63XSOA65LGfGdU/0cE2k8ITZo2mfRqcO5PXu/GZe+SpY
	aCHU7CzGuAK7YyKdWpxVi02WrUbI8SHu20XMlltxlg7Z1sOaD15Ip4cu9S5+6Qj1cCKmAkbvzzw
	Cp7zyGkqk52AJbmicC/kJ69B6yoKXuuAdQ9xu7cWKbSDD/IBJJadShbgbUh/SqJL98USo1hijjS
	5hmShbnEgfteCh5D9HkXGX9+TwqCVRe4E6148RKeAwHn0KdL417jUw==
X-Google-Smtp-Source: AGHT+IHP9TwOiQS18SeLvT6WZ+KAoJi7YVDOIp4T0wyLfQJcuq/fKfkoNHs572ijakJZtNeFSPJvBA==
X-Received: by 2002:a17:902:cf01:b0:234:ef42:5d6d with SMTP id d9443c01a7336-23601e78185mr142424575ad.23.1749401889406;
        Sun, 08 Jun 2025 09:58:09 -0700 (PDT)
Received: from x1 ([97.120.245.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056f8sm40902275ad.161.2025.06.08.09.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 09:58:08 -0700 (PDT)
Date: Sun, 8 Jun 2025 09:58:07 -0700
From: Drew Fustini <drew@pdp7.com>
To: Benno Lossin <lossin@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 0/6] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Message-ID: <aEXBH5r05FkTxpV+@x1>
References: <CGME20250524211519eucas1p218997c69b98b14d3af2eb6bf4e9d3187@eucas1p2.samsung.com>
 <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
 <aDJGgLZ9tITwGBxq@x1>
 <b5f4af17-05ef-453d-8f04-283590ae5b87@samsung.com>
 <DA5YY0YF28GO.3DONTQDLY6VBD@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DA5YY0YF28GO.3DONTQDLY6VBD@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_095810_750258_3C071561 
X-CRM114-Status: GOOD (  22.19  )
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

On Mon, May 26, 2025 at 11:01:58AM +0200, Benno Lossin wrote:
> On Mon May 26, 2025 at 10:22 AM CEST, Michal Wilczynski wrote:
> > On 5/25/25 00:21, Drew Fustini wrote:
> >> Thanks for the patch series. It will be great to have PWM working
> >> upstream.
> >> 
> >> I've not built Linux with Rust before, so I'm going through the quick
> >> start [1]. I've also never built Linux with LLVM before but clang seems
> >> like the best compiler to use for Rust. Are you using LLVM?
> >
> > Hi Drew,
> > You're correct, Clang is the way to go for Rust in the kernel. I also
> > followed the official quick start guide. To answer your question
> > directly: yes, I'm using LLVM.
> 
> Just to let you know, there is an effort to get rustc to work with a gcc
> backend rustc_gcc_codegen [1]. And there also is the gccrs project [2]
> trying to create a gnu Rust compiler.
> 
> [1]: https://rust-for-linux.com/rustc_codegen_gcc
> [2]: https://rust-for-linux.com/gccrs
> 
> They have made a lot of progress over the last year, so we're hopeful
> that they become usable in the near future. But for the moment,
> Clang/LLVM is the way to go.
> 
> Hope this helps!
> 
> ---
> Cheers,
> Benno

Thanks for letting me know about gccrs.

I was able to build linux okay with clang:

make LLVM=1 ARCH=riscv -j16

It booted okay on the lpi4a:

Linux version 6.15.0-next-20250606 (pdp7@thelio) (Ubuntu clang version 18.1.3 (1ubuntu1), Ubuntu LLD 18.1.3) 

I installed rust with:

 rustup default beta
 rustup component add rust-src

 $ make LLVM=1 rustavailable
 ***
 *** Rust bindings generator 'bindgen' versions 0.66.0 and 0.66.1 may not
 *** work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2567),
 *** unless patched (like Debian's).
 ***   Your version:     0.66.1
 ***
 ***
 *** Please see Documentation/rust/quick-start.rst for details
 *** on how to set up the Rust support.
 ***
 Rust is available!

I'm not sure if that bindgen warning matters?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
