Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3BBC369A8
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 09:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:From:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18DA0mSDOYzMSkeiB8bFo10gNn1whJmt5ZxE/Unysms=; b=whrjwvuq1OrJD7
	dv7IKyCNir9nP2P3F1WtYqwP0Cb5wPjm4MT7N/0t2JHHYHV7PcatoXOlg0k8XGw4ueYbZVktn3iIA
	eolJVNnCIFOMxX2HIbvnkUBPushr8UE9Ot8OkDYhuf1vqwUnxYccKjc28dOJF+gmkTRbSWyzP6m3Y
	hS2D1BGFKWTQfX847+FaL0webBR7+GYAnxUO1lc0ckOIDhMJdKaXMdBJhQ4ZPL4cKNxyrGDjN3zP2
	pVoGRmX5BE4EXo5ZILdyc9+bj5tlTREH+LxkE4os5dSBFWcJKtUvn9UnwcJwpKh7czc8ZIOFDQXnc
	jISWvQoOJnwDqfU98AzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nov-00000009rPi-094r;
	Thu, 10 Apr 2025 09:03:37 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nbL-00000009oEO-3Hxa
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 08:49:36 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cf861f936so898255e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 01:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744274973; x=1744879773; darn=lists.infradead.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEwPf3cBEf9ZFD3zZhCOLbWBp0B51DbgggktH5J+y1E=;
        b=mH2faK8jAmQoB7CoS0D+ZRatex4B58NYGMBoaE3YWrCoC2iLfl4zRBRSj7DeQ/btmj
         OdYZfsL7UUO9KezoJDnxhMftCVUvrum9FZ2q9OJlg8/MQdsjrkL2olgEIV4gc+jUmNuG
         ipAsfaSMG5Oa0dGTg6pSFGjb+PevFFO70VNpNfTa3k+Gstw67pDTcnMRD6uWIlG5X0Df
         vlwNDypsDJmQC+WNwQEAYbtA29DkXQ4gPo+F/fyHFK0YykucReMyJPyQRUnm1AHKQSRc
         wVI66TdmWk63J3YY3cK5XwZDUy3ccZughBuDe0j9tKmvaMzUMkbkmWSYIM35RRjLcaX+
         J5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744274973; x=1744879773;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IEwPf3cBEf9ZFD3zZhCOLbWBp0B51DbgggktH5J+y1E=;
        b=XqDLmnQRPaWGdCHFXwUnB0tIfrJ2CYmcgXmlhpT3zFlRlYaxS/l5BW64biKITuEO7/
         /d+ddizmMi5FRCYVWLpLqwCiCz9SFJJKEtvRCJNTIXYKvSQM9YDU4Lf/Rkqji/3FLjuV
         w6Sg5VQylNOYg2MRcd0qQTILrxQv0XWJ6Qp2C01oWKgV75kSVpPay2dv9WK7UTfYFit5
         SV5b5Ul2CTdNLsD7N1sNoqYsKabHRbBOUSbbFQ2a9K3WZC5CwOUHcYD3svEiIpaPJgVh
         S+LnQGUCEjA89PI8Ex2zLNwEhvrq9ZnmgJYzPGZB/p/PShKWYXdwFxsZJKK9CHQWCGaz
         Apag==
X-Forwarded-Encrypted: i=1; AJvYcCXfYpxvMD5fUR0p0A9HX4TycInsebvjf43EK2iFZ1fD/8NYLJha99d5UzBuOtJMY8Wgk9uDVbu3TKMhhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBXDgJCZ6dpb47MH8NL8kegDleSqUSDnNeZiW6hfBiv5AbcMQg
	hbKpMhgd7kF4x3+rKUtjMypxGCTB88N7TRDSpDAMud+qsS99xzsDu3jlHGhis6U=
X-Gm-Gg: ASbGncu0bseXAEkaHBbZKT6D06yqhSsnxO276d/yfbBMSAa3iuv4McrvXyU6INTXxYt
	W6W0Zk0QWI9dLKfFt0wgatg3RfNqYvFevpx2KPuuPgE5UanUwNHopI2ibXfoW/rWO788qWOgbUr
	FA65SH/b7cfEnQ9XdouAj7TO0eMcgu+G2uLsJJdYryMkGzTQHRwgu8sDsnCo8tTL9OuLWM70Kkt
	VtEZhnxEN+YpUnoOEs/i6kpbKzV9r/LqrnvkSvyntxDRUASrGLky1mzhLobjHXq4teUz9uZ+SvQ
	vZZtkbKJQ5APQH1ifFM2HGuEHkokLo/85h0UobYMWo2MJ2IS5I4jJYGgiu4=
X-Google-Smtp-Source: AGHT+IGXp6uVqxTmSQMdMVt3uEBGD0ZfsrbyUn6XrfTKoToYQ6belt1Wh1Dck02/rxvTlH6EUyAxZw==
X-Received: by 2002:a05:600c:c87:b0:439:94f8:fc7b with SMTP id 5b1f17b1804b1-43f1eae40f4mr19787055e9.0.1744274973504;
        Thu, 10 Apr 2025 01:49:33 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:7d22:13bb:e539:15ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d069sm47866185e9.17.2025.04.10.01.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 01:49:33 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 10 Apr 2025 10:49:32 +0200
Message-Id: <D92TVG7AWGLG.1GO0C83SS7M9G@ventanamicro.com>
To: "Deepak Gupta" <debug@rivosinc.com>, "Thomas Gleixner"
 <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov"
 <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Arnd Bergmann"
 <arnd@arndb.de>, "Christian Brauner" <brauner@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Oleg Nesterov" <oleg@redhat.com>, "Eric Biederman"
 <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>, "Jann Horn"
 <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v12 17/28] riscv/signal: save and restore of shadow
 stack for signal
Cc: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-17-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-17-e51202b53138@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_014935_819382_25D8AB82 
X-CRM114-Status: UNSURE (   7.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

2025-03-14T14:39:36-07:00, Deepak Gupta <debug@rivosinc.com>:
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> @@ -140,6 +142,62 @@ static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
>  	return copy_from_user(current->thread.vstate.datap, datap, riscv_v_vsize);
>  }
>  
> +static long save_cfiss_state(struct pt_regs *regs, void __user *sc_cfi)
> +{
> +	struct __sc_riscv_cfi_state __user *state = sc_cfi;
> +	unsigned long ss_ptr = 0;
> +	long err = 0;
> +
> +	if (!IS_ENABLED(CONFIG_RISCV_USER_CFI) || !is_shstk_enabled(current))

!is_shstk_enabled() should be enough here.

[The rest looks fine, but I'll need more time to think about it.
 I'll return to this patch in v13.]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
