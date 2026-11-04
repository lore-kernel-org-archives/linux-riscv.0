Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1187606A31B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 00:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bpVdu/wX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cm2jUn1v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o9UOBy6Ptdd4xeLo8gAnqhFPocFc8BvugSqmEMat49M=; b=bpVdu/wX2ADoRF1pUY2bagj47W
	0/R9gxSGHi1KDLxiKJ/wIaU/8cMUzMLnxFOPt4fx9eZ/2aV1OtVVogoazE2hr+R9HVVKgYWlqng/4
	97FmDhvruxx9nrLHfyZZaSRen2CBRLybXoQW4upuo4MwD3WPSegHY0dyhWwkfsNbVD8CnHNXGDBaQ
	DIjuVtjaJeWde+T/gsH7zZYvM3j7AamBzOmIMIj3GGd2szotv+pvmvGAlPfIJOPsaNRjoGkeB+mGO
	dmoAw6NUY4QNohK7y1wbBsyDrWrLzofqgB4O/aswf9arINlZ+qiwryzpfRmlME6Gbkalo1U6r4L23
	itfs4JCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPK7-0000000422q-3YsF;
	Wed, 04 Nov 2026 00:57:55 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPK6-0000000422P-0Din
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 00:57:55 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1931ff67a29so711065c88.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2026 16:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793753873; x=1794358673; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sk8Hr0fhc3C8eQFrISEupQ4YS+zYJDt+3X6d4EBkWvk=;
        b=Cm2jUn1vjX4wBHL19c5iJmIbU+SNRVw8HeR0pgRkJLLS6UdUp88chToIXFHHSJmxlA
         7mrflt58UZV34A/5OOiFl1yEBU6oEhUvnwSDq4/E70RhRoOgSplfRhI2BTFiWEmA15Ym
         VhfFoq+HYO7iswI3xhUTgDdaoctqv9OzOZvWKht2GUYGH1/CWPWNz93QI4ryMam4Tk+O
         fOseAWf6BudFU3gXY997bENL9IXTM/D80/8JdnyiewXjivOr9ZwpRrbPWe1X7v6nvq8L
         tk6myMAkp2JgD33I5LuWz9mcf1USndVtCKt2+sOmq6ovIQ5gQt2DYZjyTrnitppWWmP+
         4uPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753873; x=1794358673;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sk8Hr0fhc3C8eQFrISEupQ4YS+zYJDt+3X6d4EBkWvk=;
        b=ymPnpe7/B5/eJHocTTvo0HLFyUeV0udNEJ9b/cFly9Y0YVMWAOsH/Mv9MybrwlTTas
         jHqplfS/0wNyTQaoe/+YULxEi49itklH7iRh+p2mNkWgrlmaaZTtqhhp2PrmnK8/NhmA
         vjqlMasfckc2Gf3FCySFSdpIoRvZZSIo6Go8xp72YT/c6CX1HSX8R0EyK9BacFtj2Z//
         3XBqGZdn4WnNbNLhPtSEpnsyJLyYGZ1hQqCPxctwQLVkrMe/z11N8mk2SnLdxBrHe0IB
         gmQwKUgBEw314VX4pP+0OEHAO9L2XuzWLoCM97YYw4Nwlowilcn8sEfbpC6lL4qTAF0l
         Du3A==
X-Forwarded-Encrypted: i=1; AKwUvByJvOOKyES3RCCLo2/kYLxDcqfY1eH2jZOjmHbkoPw7eY5GJuqjslwCkzXPlCx4BGgT0ex+u0SfHWpejg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/MwQ3Rap8FSv6VT5nke5gaiR+xSAUFM9Sk6McnYTxPA+Mps0qw
	0SwRTrut3i64Pl/4FLMmFABqoNFTmWVPWVXyqJAldb+qp8ols42l1ZKQ
X-Gm-Gg: AYBFou2jUlAI6hmBF9u08XUZnUX3a9+zctocTUMtnHnEaF9nX2QeyhlNPTJAYFrj1iV
	I9d9hcWh1DPghWn9MPx660vgV1q4YyeAyRPSywexQcFA3GT0dtoLd9cs4hLi6m6An2yA14/W/05
	Yed+1/tv9c36F9/9pNoyiszzDSN3A1a6OkSdm4XpK/BQArIju1Ffwhqcsgxygd2QJxL1XSIsSWw
	n6hMN++H728dJm7pkgYar8zQHTSnIxnbOSRMyzoYSQIx/zpgDMZwGc5VlPHLcalHSpn5hX1odDJ
	0Iyzm0wDp5TcelRkDhE7ldyEYuCErjzHnAWxhCwRmWiVrrTxoae3IbYpilcXSAiysBYxi19Do2m
	/PcAuKFfjF6SVaMcb4rorX/BqH3Rm91CnrLm4fJ6GmkOSUJa+EM1HJvWRV/8qhSljVcrJalmEhZ
	/1U+5y2xKgyOvmfYt6ViEPItuPmdRwPxIbBJXK8laujpJQyPhcJBMh9WW9XncK/KzJX9nYa6Br6
	l9l6bvkQxKJXtIOSByAfrBMXR8wfKvvnLaJVIrledDFFv/ICIpWTzH1F3gXdhZfljA/nHTFz9/s
	VjVJ35zkcaV04Tpb1AOQ
X-Received: by 2002:a05:7022:1117:b0:195:49ee:94c7 with SMTP id a92af1059eb24-1ac5a0b579emr19552410c88.8.1793753872638;
        Tue, 03 Nov 2026 16:57:52 -0800 (PST)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2c2ddsm2546423c88.10.2026.11.03.16.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:57:52 -0800 (PST)
Date: Tue, 3 Nov 2026 19:57:42 -0500
From: Kwanghoon Son <asdfkwang@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 12/12] MAINTAINERS: Add Bouffalo Lab BL808 support
Message-ID: <auqC9jOIQTyieQUJ@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
 <20261029-spyglass-evasion-772697094cb9@spud>
 <20261029-amuser-savior-6a6ab062f471@spud>
 <auSDJH9V31wmbrYv@debian>
 <20261030-slider-finished-360b10521e0b@spud>
 <auXQaY25XfYzxEb1@debian>
 <20261102-throng-botanical-b244058ecc37@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102-throng-botanical-b244058ecc37@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_165754_095259_2988CB5C 
X-CRM114-Status: GOOD (  12.17  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> I'd rather not really. I shouldn't be the maintainer for platforms I do
> not care about, but I will do it if you're unwilling to - in part
> because I expect that the volume for the platform will be pretty low.
> 
> Please read through Documentation/process/maintainer-soc.rst to see what
> the expectations for a platform maintainer are.
> 
> Cheers,
> Conor.

I'd like to take on BL808 platform maintenance. I'm new to the
maintainer workflow, so I may need some guidance initially, but I'd like
to give it a try.

I'll update on v2.

Best regards,
kwang.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
