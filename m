Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57247C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 20:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xwSiNpda4tczQqK4f7qLVQ3Y0gVCW/vUm4PH/IIApww=; b=RreMj2BhhB6zzw
	AZKLrvlKtwGnKif1U7csx84GfebYomS/ZzNj23Dz5cEPq5vLx7JNQEczTo8X/eSY65TKAAlX3UWio
	cAHCUqNwig3uXAJWZpkKxsfVFaaJSHDOWDxoS7BbUKzhqNMcj81ZYdwC4mRfD1cegYFIdoaogTN+V
	tzUJPdzDCfiVKWkN3Vc3f+5M+WsT5W8dmUbJE/2HBE24i2jIM3DR8BINpYpnPiM8t/FvOE/8Ls66c
	dpO+dmHVa529SObR8QJ3FixUlUYzsBLqemU9/IzNuvg8/O2RdrnHmFf1wSBtS7roYKb9C43hGvEK+
	43vzSzPKVp6A+IOI5Hvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxv0j-00644f-2d;
	Tue, 31 Oct 2023 20:06:49 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxv0g-00643i-2t
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 20:06:48 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6b20577ef7bso5357684b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 13:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698782804; x=1699387604; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lWGVGD/v1823PvN5lw+9ZoRQkBLtbriYZcZfAadSLGo=;
        b=DgQeI3PE0iCY1FgSL9PhW1qnuKRpmok6rKA7VSGeIUO3wTkYusHRo14yyREnfepbBM
         cB3GQTNK9UwlRRpzNtaiPY3KpOCyuKRTZ5HwcchxS+/OQjCnzGX1KzSQcMu38QuTXeRE
         DQOxvVdFTt59I9b2cpMtJROopWK2FoHDpPgwCiyV8s1vo6BR0erbwtPX/mJNsaamv+Es
         kIMBjqlzJf5iMqNavd++43aIbHn0O2xhHAkGgrb1QlnnzUF3fm5Gx/epvzok1dwmlytN
         rqiEpsRzCmS2dqz9rXQobUHuTIfPrwGc3pc54x9DqqhavGudwkEp4Qkz68ISgs9mXDiM
         PgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698782804; x=1699387604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWGVGD/v1823PvN5lw+9ZoRQkBLtbriYZcZfAadSLGo=;
        b=Y7Scm8bvqN7SxQo9Lzy6UkagNL5k/1pAfkOILqFv+JjnKeNpxgrAtHyzzGDa9MOhel
         TDzLm2+1e+xPV6bUfiW0OE8yhuCbGnCuvH/EnQdU8TGoayVCNOMmyshtCY8y1sPdqQCW
         dY5QKDNHv7zQY5CXK58LKLYmJwrL8MD9XHExgTIGTlI8Jke7IgoT/mwVkuDUY+3YKdak
         qAjQL4W4LC9b6rTEJ2Mr5pmg0CC/60Q/EMTORTdmj8mDNlVAp9eDvAFez6di5h09JeaS
         AKDiex8z0HrlMWZgQXxVLfIv//kv/ZV9oJSnYqmcJRCnnDggRDXAn1RM+uYOVskHpbV4
         FmHg==
X-Gm-Message-State: AOJu0YyE/i5iAlTOAhSjRKxZ9UtSWsUW1WwYMKEfrnc8fE4/eKD0q76t
	ZJ2UW6t1BQjU78BebOstU1DF7g==
X-Google-Smtp-Source: AGHT+IFB177CiEPUJCGzRzwkcnZ+y4NsBpO9de+GvXzBwzuPMcsZqkPWsTreDvgjfnlKEr9qBU4eyg==
X-Received: by 2002:a05:6a20:3d82:b0:17b:689e:c751 with SMTP id s2-20020a056a203d8200b0017b689ec751mr12075501pzi.5.1698782804089;
        Tue, 31 Oct 2023 13:06:44 -0700 (PDT)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id t15-20020aa7938f000000b006c2d53e3fb3sm30549pfe.78.2023.10.31.13.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 13:06:43 -0700 (PDT)
Date: Tue, 31 Oct 2023 13:06:39 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nelson Chu <nelson@rivosinc.com>,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH v7 1/3] riscv: Avoid unaligned access when relocating
 modules
Message-ID: <ZUFeTzStw1qaM0m+@ghost>
References: <20231031-module_relocations-v7-0-6f4719b64bf7@rivosinc.com>
 <20231031-module_relocations-v7-1-6f4719b64bf7@rivosinc.com>
 <CAJM55Z-v0EwrZp876DdLSzad2u55nJV_uBs_+MUJDqFW5MTPkA@mail.gmail.com>
 <878r7iiwb6.fsf@igel.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878r7iiwb6.fsf@igel.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_130647_150988_05606660 
X-CRM114-Status: GOOD (  13.10  )
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

On Tue, Oct 31, 2023 at 05:35:57PM +0100, Andreas Schwab wrote:
> On Okt 31 2023, Emil Renner Berthing wrote:
> 
> >> +static int riscv_insn_rmw(void *location, u32 keep, u32 set)
> >> +{
> >> +	u16 *parcel = location;
> >> +	u32 insn = (u32)le16_to_cpu(parcel[0]) | (u32)le16_to_cpu(parcel[1]) << 16;
> >> +
> >> +	insn &= keep;
> >> +	insn |= set;
> >> +
> >> +	parcel[0] = cpu_to_le32(insn);
> >
> > Why cpu_to_le32(insn)? Unless I've misunderstood something downcasting unsigned
> > to unsigned values in C (eg. from u32 to u16) is defined to always discard the
> > most signifcant bits, so cpu_to_le16(insn) should be fine.
> 
> cpu_to_le32(insn) can't be right here anyway, since it also swaps the
> two u16 halves and would be the same as cpu_to_le16(insn >> 16) on big
> endian.

Yes, not sure why I did that... I will fix that up.

- Charlie

> 
> -- 
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
