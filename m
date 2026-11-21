Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A4F606A32A
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FQF2ps68;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XN4UNEce
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kXbZV+F1z/yHa2BfbR6YM701BZwzM32DEcG+iQ09I1o=; b=FQF2ps68SlxfYAP67D1hxs3fJb
	HMKo6aR1jrrDmSxxSlgDsChjE7SsPPBi9D4fMf/g8lE6BJPaLIulrOazRvXFnwrfjaG06YdDSg2bo
	72FX/YVREboNAuR+/GYE2Q95uzlcshXLGOqTk7nKoTkI9vKoHhMpzFCRUV9BE/bNvv4C8Xttxl0w3
	5uCIP+U9NJVU7haqj+mwOb1C7ErbmI3e+jmYnnPLo4yx5y0VrAgl3CojVQJy2CaK1UH1UfNjV7xiK
	Tw4OxMoL7rOp0S93NUavGWWjtP1qRWj5WlFY/Q4puuV/9Ozyx4ADIrXFtxuVOrOLqiy6VFmOOFz94
	5hS92GGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUmOi-0000000HMUL-1szs;
	Sat, 21 Nov 2026 14:49:00 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUmOf-0000000HMTG-3wjQ
	for linux-riscv@lists.infradead.org;
	Sat, 21 Nov 2026 14:48:59 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8ca6a12efd9so123903b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 21 Nov 2026 06:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795272536; x=1795877336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdCe+8kSe9PjEo1XndTkJdrgn2vsntTF1WvbXrRZYxs=;
        b=XN4UNEceWJDRzKV+0+kmBV/Gp1AXdj4qu34agHqHt6LAINTKesbKFpZWBZiGfL6zoC
         4dFu/yFwo1ROudryF2RLtBMVTt4JpZ7Pjr0mOzIrqabJHc8DRC7IsOjZq3kWw+0DKg5e
         Ak2PeU1FeRoOEh5ssMDE2yZyIoVup67Qca9H/ubyzcMS2Qr4K6YvCdWqGeISyHVe1R3V
         CG5JF91dzm6g+WLFzIwAPOPoz9r8igoXCWzUu/JD53iY2TeX7xVM1IHrZYUKdhpOyZfr
         mPYoH9rIopclJ5B/nMGAerTQT9/rEhpP2nQWyNKdjJ2pkJn4LgCY11rUX4/crMAYxw/T
         Tu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795272536; x=1795877336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EdCe+8kSe9PjEo1XndTkJdrgn2vsntTF1WvbXrRZYxs=;
        b=ILgUlvylY1qeFOsq5qlnJ753JDVrML84xpl0VCmpaNZ+obuObG9TNPOWJSJbvIoGWl
         eGqB3UxYkeWA+pMVv40V+gP2QAx6qKbHqPGwaQ8rbEVWymejQ6Z7MklYfFI8MaeKP4eH
         mRRqX6Xhj74rUYH7YCdgVuLpOSdCYNhXQAAQb1MnBhJw4DYZESw/HC9+FzHmO3dVjsvv
         cxD1Z5vGq+i/MwadlnKFM96NwdATvcghGemsZPUjcmmFnnPlsIIx+ucGQoA95ZibPPKC
         d4dO3/az2si68FJbentcbCt+oSUrsGBtVxPER62V+4zNhpHecaBjLdW1MFhe6Ch/dgdX
         1cNg==
X-Forwarded-Encrypted: i=1; AL+hErHoqKxVy67sp9olJUUdeXQa67l3uGPALPYP0qCvgrsmA5LVNqR8zp1rIxsNBIevxTynDtSDhkyH+bSJlA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9VY06+8n6gcdIWBZrTut/++PQdXtSRhP1adwn440MB4/D0MHHB
	ftIOwA6SPvRvQnEoqnbGb5ujlD/4IGHdEwveqtA86QupdYO1tVhQJNPE
X-Gm-Gg: AZFdTZdMB56AcsAl4aeSRZYnbzhMBpqTRUgaOahXs1ke8HbnqPdWw99XeJkVBeL2aYE
	iI7GmjTS8yPA9N+qGr2+x3fvYY0qGrgzJhQ1zM5LjlRShIPSP3sIQNgm3IOsuoUwYg2U2a8ypPK
	x67mOFd6dH38WJO546/BbEAigYWyKKC4EDwRRBAnIV0T/Gf6ffYpQdejCVcHIMJOKGNcuGAGCK0
	HXCxcTe2+4XSjb5UNUyxSQ2F9EoNLnThSD+4n4hRy4list7JTuX8wut0Ia6KkK9jtBnG00X0295
	i/A3o0X0xg6KeD/Nb37a2ygf7Nm0WUttS79eR44cI0QZ5HiXbu4maxcDwPXJ6N8sXzH7tL7MGb6
	uB0zqqrtseDRYgNJMtZulPKiTuKEynLApuXx2IJfAceERviE3px6MHAp9LxGDNUHQ2VV2hwIW4v
	CdpXhDM5fCoruhYsXG/2G4KF2p1XBdsQbqL63Ppw1Q5hWMpQNsXcvw3xYzGkabrIhaFDlZqI3y7
	tEmGg8b9fBa1qkmt1cWHzgrPLUEzadfev9z/adciGQ2oZyNJXOOzaPhY/I0mUvLJlPQLtxfTs3z
	a2evFDcZcWHK4P+mfTdyfnYyaH2jlJDvW3h1NAm4fewOTt2TKgHDfqczdw==
X-Received: by 2002:a05:6a20:244b:b0:3ed:bbab:9386 with SMTP id adf61e73a8af0-4014d35ab9cmr6017467637.42.1795272536129;
        Sat, 21 Nov 2026 06:48:56 -0800 (PST)
Received: from localhost ([2.27.148.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm3048343b3a.36.2026.11.21.06.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 06:48:55 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: "Ard Biesheuvel" <ardb@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	gaohan@iscas.ac.cn,
	"Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
	"Paul Walmsley" <pjw@kernel.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>,
	"Atish Patra" <atish.patra@linux.dev>,
	"Stephen Boyd" <sboyd@kernel.org>,
	"Brian Masney" <bmasney+clk@redhat.com>,
	"Jerome Brunet" <jbrunet+clk@baylibre.com>,
	"Chen Wang" <chen.wang@linux.dev>,
	"Inochi Amaoto" <inochiama@gmail.com>,
	linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: efi: Map runtime MMIO with device attributes
Date: Sat, 21 Nov 2026 22:48:45 +0800
Message-ID: <20261121144848.1277368-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <bb39f961-0589-4a3e-b649-888cf5edd3a1@app.fastmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_064857_982332_6EDDBA3B 
X-CRM114-Status: GOOD (  20.14  )
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 21 Nov 2026 13:42:20 +0100 "Ard Biesheuvel" <ardb@kernel.org> wrote:

> 
> 
> On Sat, 21 Nov 2026, at 11:38, Han Gao via B4 Relay wrote:
> > From: Han Gao <gaohan@iscas.ac.cn>
> >
> > EFI_MEMORY_MAPPED_IO regions are mapped with PAGE_KERNEL, so device
> > registers end up mapped as normal memory.
> >
> > On Milk-V Pioneer, GetTime() reads the clock controller registers and
> > faults:
> >
> >   Oops - load access fault [#1]
> >   Workqueue: efi_runtime efi_call_rts
> >   status: 0000000200000120 badaddr: 0000007030012000 cause: 0000000000000005
> >
> > Use PAGE_KERNEL_IO for these regions.
> >
> > Fixes: b91540d52a08 ("RISC-V: Add EFI runtime services")
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  arch/riscv/kernel/efi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> 
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> 
> I can take this as a fix via the EFI tree if you like.

Yes, please take it through the EFI tree. Thanks!

> 
> 
> > diff --git a/arch/riscv/kernel/efi.c b/arch/riscv/kernel/efi.c
> > index 2d3cc57b4535..11e85d0ebc91 100644
> > --- a/arch/riscv/kernel/efi.c
> > +++ b/arch/riscv/kernel/efi.c
> > @@ -22,7 +22,7 @@ static __init pgprot_t 
> > efimem_to_pgprot_map(efi_memory_desc_t *md)
> >  	u32 type = md->type;
> > 
> >  	if (type == EFI_MEMORY_MAPPED_IO)
> > -		return PAGE_KERNEL;
> > +		return PAGE_KERNEL_IO;
> > 
> >  	/* R-- */
> >  	if ((attr & (EFI_MEMORY_XP | EFI_MEMORY_RO)) ==
> >
> > -- 
> > 2.55.0
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Sent using hkml (https://github.com/sjp38/hackermail)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
