Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A3EEB3625
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 17:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NyfBtpwkWnPzhnvGrCT2eJAvr0vXPvJ/fStqEMzTyZg=; b=lzH9egro77FZnp
	lzG/21Os5Y8OVbUzuW808Ga5JMOl6hwS61oWu/sNq41cCLaJ9+cAD8j8GioaFEjnLrdFV5t8pCzGM
	W3wHuaqfAqpMI1y+LPRl2GnFLezef9pkKqtixdViMg9RqmGgZQcDTlG13++SrHhRPEsmXmmxEpG1B
	59stNknUNHvF5sqcqPldFjM02qIyTpvSbH6Je8dNE4O/Xb7JKRHHUThUH7gXy1pjIXeAX7mH0vaoo
	zjfGLwFxsornI0hvRca9aN9DgIPBKk1vqDTg7Tmbe6ckKtnaJ8khatTDGWN5rz84x9u6G2pM74OUs
	9pWb4o1Z49Of0KImy3Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx79i-0000000DbiB-2wsz;
	Mon, 02 Mar 2026 17:34:06 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx79g-0000000Dbhq-0mnb
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 17:34:05 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b9359c0ec47so501868366b.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 09:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772472842; x=1773077642; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NhM0U/KytZp1XoP7N4M9fAB7JNIxjdmFkfjBUQb/l8Q=;
        b=CbTTgnVA/ePkVJqdJJTaFewvOe093EO7ojnCvtLEcVnnOA6ovDXzNYvN5eIIBNdnaZ
         TZC/lMZ1lxu7MzRs+ifMPOkSfhpHiCATicB5w2hpEKri2KyT8//XWl9kCCMApRQUTKs+
         F/WQZ6ppvg2JR2epywSw0xp04i6EluJeTLlYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772472842; x=1773077642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhM0U/KytZp1XoP7N4M9fAB7JNIxjdmFkfjBUQb/l8Q=;
        b=RpOTRxqtSKefpXhQApgafr/umXx3M91Ph1SeUNR78PIVuomMItBUlT79rD9nBE2ZpL
         kSSWXrDU8vgJlafCl1zrT5kORhF2liz6kjmlXvvCerSmWp+4JVGKjESLIPaEbewwZL9+
         EXbR4LS7jclLcJvhTEOO/Vwlb70pXJGAl92eaK9yA+purRGBjm618Rn4lYwLHSwm7rw9
         sQvY4HopWxSGIyKDXE0nLtWyDj1zgZqeG73CsB/QZ5PxEAexKrzsmBR6zzRF7VRZzn7a
         Qt8Xgyc5KKr/So/Knr/R78cntLBoujTmvwPd0PZmNfxmggn+JUGz2pfcfsnEJsolrqKg
         ORGw==
X-Forwarded-Encrypted: i=1; AJvYcCX8B8Z2nFWrsytJwAN/M8x6r3qCYl3AZK4fubZOc7B+ETaJrC8C48oVvIf9GxkP31aptQr39zXZp93SKw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy0W+XsdWoQugVjY0H69XCiRUeMrXVRfSAqJnUlEIn3FLnv5es
	LYMBmAgGt7M7VRLcobigjLqRw6C/+p2juWTCFa8iuqARsFiVWp0hRLZ/F0qDdfIz7iJ58d5Bm2o
	TBkMlbhfxWg==
X-Gm-Gg: ATEYQzw/GQVrHYEgBL4ovNjhpqNnNQXrqruBUYVYi+INh/bHmD8Kx2l+RCDi6wdJ+Xw
	PW39TPbJbiEr52iwHkGzgmXfwVcfjuJG64Yg2uGVmUIlndrflsKQHpGa6J24VGDK5hafqnKOtUB
	he3HT0Yuf+2D21NJG2E07cBe0LfWbvRQRYOuuGaUblmm59UyCdEJlpgCAkKhTe65PrGrgjl9z6R
	M1mdjOGoIG5uUIIiw2wCTI5fyncSCQB0Z/OZC77WeVR/D8oKDOULpHkm2Zrofq59sDZv6yG7ayo
	l4Nv2jHqYyIZHggWudVprgEXZ1RrPU3WclFTzJLmMc8NknfvA8awIeckXTYLo3xii+hps7Plnzn
	SRlExTkl/eabH+hpuawsElxRm+R7wdI9D89t8jaWSRx8zTPvgCJ891CHdn4Pugvt8Dpr/XNO3Ot
	3eVyWrr/5SyHAexqmA0r2+DxZefoMxpvMP9fmQV3ymN36R0aI0KgRSRZK+ygGsHR6Gj2Zolhd6
X-Received: by 2002:a17:907:9628:b0:b90:8016:cfe4 with SMTP id a640c23a62f3a-b93763615f5mr833466066b.10.1772472841998;
        Mon, 02 Mar 2026 09:34:01 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab13540sm476065966b.11.2026.03.02.09.34.01
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 09:34:01 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-480706554beso54443975e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 09:34:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXok9LKH+1RXXKzXR37eFlTr6RUNZD7eJsC8DWgQXjokI98XfrFLd9tMyDUru5JjkgCk0EJcpbsunO1iA==@lists.infradead.org
X-Received: by 2002:a17:906:6a17:b0:b83:1326:7d45 with SMTP id
 a640c23a62f3a-b937b42886emr757779066b.32.1772472407269; Mon, 02 Mar 2026
 09:26:47 -0800 (PST)
MIME-Version: 1.0
References: <20260302132755.1475451-1-david.laight.linux@gmail.com>
 <20260302132755.1475451-2-david.laight.linux@gmail.com> <e8a688b3-97e1-4523-9a82-8d9dd16e3d90@kernel.org>
In-Reply-To: <e8a688b3-97e1-4523-9a82-8d9dd16e3d90@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Mar 2026 09:26:31 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjKWi=j_xcMBAi2Hkuut6aNeqXTwOFoMGkHfDA+3WXsgg@mail.gmail.com>
X-Gm-Features: AaiRm52zcwSKl-2ZFc2XJ2K-Xgcl3ar6vYfBBv7z9Nop6yBvMYBvRXM6loWQHmg
Message-ID: <CAHk-=wjKWi=j_xcMBAi2Hkuut6aNeqXTwOFoMGkHfDA+3WXsgg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] uaccess: Fix scoped_user_read_access() for
 'pointer to const'
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: david.laight.linux@gmail.com, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andre Almeida <andrealmeid@igalia.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Christian Brauner <brauner@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Heiko Carstens <hca@linux.ibm.com>, Jan Kara <jack@suse.cz>, 
	Julia Lawall <Julia.Lawall@inria.fr>, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, 
	Kees Cook <kees@kernel.org>, akpm@linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_093404_236881_C12CEDBD 
X-CRM114-Status: GOOD (  11.06  )
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

On Mon, 2 Mar 2026 at 06:59, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
> Can we get this fix merged in 7.0-rc3 so that we can start building 7.1
> on top of it ?

Applied this first patch. I'm not so convinced about the others in the
series, although people can always try to argue for them..

              Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
