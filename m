Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59CE606A31D
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 11:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZGd1SxgF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=liihGbK/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aPteF0ccbccSabebMaFce6NunbEmgC8OyDGUVhooll8=; b=ZGd1SxgFuOd5XG7jec1fb9QvVj
	ejS6Nqwc+auG+01VflSOygmg5V2YAYwRaz41c1loaRg1M2pg87lzi5p6mrSC2T+zizFrMpprotMwR
	mnctc2YxejnhPlS/emkdUqWpy6+kLZnOGdvEl/iBtVmTpZNTOhyaChU0q9F3efdM/QHaFnedWtVjF
	4K6tciEEj/WtLHxJXsVJswrRHp+BY/6Gwzi0PknomalI8rtm/hwj1VCVDftPhkQk37WuUmH2aujN6
	3YJr4xU7YXz6quc5pXc9brsqGBprNCkLomAcD1xeOnn0dF4yP7+zJ3h/cOr/hZeJcOOAhAXgFBERs
	caYEiV+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN7El-0000000DG3Q-1Ufi;
	Sat, 31 Oct 2026 11:27:03 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN7Ei-0000000DG30-3JFh
	for linux-riscv@lists.infradead.org;
	Sat, 31 Oct 2026 11:27:02 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so883753a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 31 Oct 2026 04:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793446019; x=1794050819; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eBAqeg3P7IjkzEoe4Ha0kzpqAxzRiyS3drMdSnkFfrg=;
        b=liihGbK/HL1WlbrVZ/m29wSyYP36t40gTojse3FqhnXXf0Sr3G0QuqU2tANDbK4vfq
         Fa5H0GGdlz8pJe0oPbkGG1uzNWn3DdF8KaANbp8dzPXz9ZA2RMM9x23XNa00SxFgO5ST
         hSVBS07s/7GD8QFpea4LLFW0Slykjnm+mHSAYFe7BasdeX6tfMQNPRaiVJwVUX1pEWJt
         4mvheG06HVNNEypE8no4SqQMicYyux5fv9jM1PCPRPYVXQJ4Rw/MFH+tNnnuCs+agMDv
         5tZ2MUN86jG1eA+Q7ZNVkj3/XP/K2kQhbPiYefGfGM838Tv5t9MdD/TzI0W7pnOMdVHk
         lG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793446019; x=1794050819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eBAqeg3P7IjkzEoe4Ha0kzpqAxzRiyS3drMdSnkFfrg=;
        b=yl0lnDm+SaqkiETNNhpJ0NC8dSdsGs1nSyJbmX8Rmzbq6OBEj1NIzs6JJLIsW0Oif7
         Rg4vZdwyhw9YSxaWn/njtGm+K0RfNRE/iCy3Vrhcw5I+VlQFblTMjv7/0ZD722Cl7l58
         lWvfhGxlDtZaleTtoGBZxFGcOqa05W30VxGeAD0rf7sLx0qcUyKJoLIx5byyji99DmOv
         jrNL7yLHCGMxC025B1sz7vj3SCL/rnMRzCGfxjK43VFc0y9hyE2m/cwdzQCf2ezjOkLu
         DTMxiRKIWHqtF91v2QG+xpDDraXGqi9nXrSpHF+XYaLgG/DtjMdrTbmX2bx48stErITr
         1Jhg==
X-Forwarded-Encrypted: i=1; AKwUvByF/BSYrwj8SD2Anok2VIKJl17sV2sFSyMnxxp8yfT7Q2Yh8GwkREJJQybI9dhLQnjCesj0gzFf4C72XQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLPmVVv3nYrP+rmSdGJEUu9jpMPFRzu2Jeu62jX4A8Qh8AvDw9J
	6tsWGmOtilEsZZgSpkj4btvpvncqjjKTwjKJjxMo0D3NduIobdfSBsAk
X-Gm-Gg: AYBFou1Ot2fJ5ChNaFaynIqT079XXYr/vbBM3xSPESuTyOPHDReSaS+dPoDuzcHByCR
	zujiK3ZF9R1fJy85Bs//NdibPvFQ3vvsesKUyvQefY0g/KJJiHvSKHjroYnj2ISIYlIFjx3zhXS
	T6ho/DVmdZvgbAsUQJ93T9UB8BUYqlyxxl+hhf3l0/U6ySFwzJr6oan1/LOjRQOKwd1SELQXOSL
	J4BRJxZcLH49m62p2nnpuuONlCQ5wuahZNLa3FwwAGtEqGs0GrUckBR7UhzXNLoZpBI9edUtlW+
	6davxUbx34wfHXitWJFKCNg3pSrjMgyKaWf7fW6Dk372R88UEMuXdEVHxvOn3hk2yMbCMk+RL3+
	IR/ZtjSvMAd9BkKckm+lz4zrqg5u41UcyyyA0+pVdCCrPSywNOcqgYtQLxihaG2aaZrmkQBphNB
	vsqnSJVl43y/kjxLezgM+ttvCOcahEmMffrmhVHAKk0znCTzvk7G45s1OHZ5HoNEkS5HUbLZsUX
	rS5PSEBawvewg4jlmGuOL7Vt4q0gT5OVCwcxEgyfp4d/ING7dSmBUqcZM5LKvkSkbwSfIJKpbPj
	5/wKRcGAeCPlqjchkKP07A==
X-Received: by 2002:a17:90a:e7cd:b0:3a0:8050:2ec9 with SMTP id 98e67ed59e1d1-3ae897ccf9dmr3920644a91.16.1793446018866;
        Sat, 31 Oct 2026 04:26:58 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fb2fesm11638646a91.4.2026.10.31.04.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:26:58 -0700 (PDT)
Date: Sat, 31 Oct 2026 07:26:33 -0400
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
Message-ID: <auXQaY25XfYzxEb1@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
 <20261029-spyglass-evasion-772697094cb9@spud>
 <20261029-amuser-savior-6a6ab062f471@spud>
 <auSDJH9V31wmbrYv@debian>
 <20261030-slider-finished-360b10521e0b@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261030-slider-finished-360b10521e0b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_042700_831785_DDD440FC 
X-CRM114-Status: UNSURE (   8.25  )
X-CRM114-Notice: Please train this message.
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

 
> Okay, that's good - but that's more of a response to my comment down
> below about splitting the entry, not a response to what I was asking
> here about the lack of a git tree. Are you going to send the SoC
> maintainers PRs for this platform or were you expecting someone else to
> apply the patches for this platform (IOW, me).

Thanks for clarifying.

Could you take the BL808 platform patches through your tree once they
are ready? (If that you okay with this way)

Best regards,
Kwang.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
