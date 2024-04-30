Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED8DC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 18:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9KD6fkSLaPm8lDj1VLi8wjXLCxeCiU8k67/OtZtWjU=; b=IexQHH8Ra0v/W9
	EjSEZbibyQ0I6FPJ0UplU3wpg3W7NiK1lz3gvPeGXERZUbU+j7c/3qD7ZVlp2mexjkY5kImyS59gw
	XW/RNrP+jvU0a7kA32ZGKiHWjSgwExgqQLlqvMSTVXaeTbqI5tPgk/9kYEQbQhA6QhUxELYQRmLQy
	+F3vRjUVDZnQUUHWG2xVT/rNIXEoqkHfZUG5K1kAuvi0UuQhZNzTbQ/7mpUv0fudY+lp/EcVh5I5E
	WRk3MF+zOi7WCjD1TyRFQGzp6jTcAs/3iSx3+BRDuyiWBE//aRKZDN3aakb9TSc8ULII4m+iD5dwd
	6W2S/kEGqyoJSADEXQHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1sNT-00000007bTy-2YKY;
	Tue, 30 Apr 2024 18:38:55 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1sMs-00000007b8l-3qDK
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 18:38:22 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6ed9fc77bbfso4771733b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2024 11:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714502296; x=1715107096; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+xFFNyvJRBStVKiZvJgpzL4WEEIzaE/N0wvWYH0AAbU=;
        b=EIkpqfDPEf2aKwUmJG40gx4ueMl8peGKuG3tL1OJEzOF6a+GxQL9TnrF4QzcJpZqLJ
         m6dJGQXpghi5xpWaEQNa+8pmgKmr53+zVRckLYu0Xft5G6508eZZwbGqoPykQFDqbLTq
         tNK6go6Q1E4hRvVuje3jUn6eOQ9rjdXiSyJRH47EtP9VPt4kbSRhWyllBARmhcGbB5O5
         dYnDazchwLS7JoUQ5+3bS+gQBI6Se3JZE0VAfWelaW1vkZyIQbX4p9t7F9t4ru8aXhMo
         jMDoGykBGOqDeXGLX65QapvXFfuLYfAhJjIgaNBTSJkWoUDSsDNs+FAIBF/OEAbns8Mk
         pclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714502296; x=1715107096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xFFNyvJRBStVKiZvJgpzL4WEEIzaE/N0wvWYH0AAbU=;
        b=f0LDjjTA66XDe44incTTH38lQWKl9Wzlc3MbckOCPvg0MFdMEjyj96BwTxLBZp2XLC
         N9oib9skrcA5K2Dwd4VUcKD5M1Q4DHwwh2e627Et+jZtmHfYW5Pduy9eCu5bY7fH+o6I
         4KesEG+Q2QPqGphboi5I6PWZc1jDHtgrNK+74v/ANm0M61vjRunnHhs/443l3dnGDDnO
         WBUyKCgm1q+rz4D+PWoyJv82ufFDqDLtwTBPKG3ngUsSObUU5ieLXAEw+av3FL1Gcxbe
         e2j/eMGWyltzXAA/IXpDLyGfiLtu5PW6bUy1AWeCXhHmLsnFjORXZSd+CFNA92p6JE1A
         k10Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHvYWc91wAdXqduRGuZI75vWgfFiljoB9qkgMEJTGLWvV+XCpLHHufVSS0tK1yG7phUYqxjSgeUtjYxNkSYFtGwjBdXBi3Sf1+MBQ3cnzJ
X-Gm-Message-State: AOJu0YwAESKfAyYceg+1NxPAJbbqtm8NJZN7yfuMBWaM/Oc0vZJ5LsVk
	Z8/WwQFkxXTSZ80xg2wZfb0VZr4YEz8T2cvpeohj7n9SvAdx9erjutd9gcm96/8=
X-Google-Smtp-Source: AGHT+IEAb8YNwNMBc7V5kulQjE/hD4v1bwrN1gT1wqu/osrvWEeW+ChqYczlkXqTDwcnz+KuEOG2gw==
X-Received: by 2002:a05:6a20:3d8c:b0:1a9:c4cc:721d with SMTP id s12-20020a056a203d8c00b001a9c4cc721dmr879056pzi.57.1714502296448;
        Tue, 30 Apr 2024 11:38:16 -0700 (PDT)
Received: from ghost (mobile-166-137-160-039.mycingular.net. [166.137.160.39])
        by smtp.gmail.com with ESMTPSA id r16-20020a056a00217000b006ed87983f95sm21338288pff.52.2024.04.30.11.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 11:38:15 -0700 (PDT)
Date: Tue, 30 Apr 2024 11:38:12 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <ZjE6lAMy/6+HAB4X@ghost>
References: <20240429-cpufeature_fixes-v3-0-6aa11dde513b@rivosinc.com>
 <20240429-cpufeature_fixes-v3-1-6aa11dde513b@rivosinc.com>
 <20240430-6781cbaa0a929246cb77dafd@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240430-6781cbaa0a929246cb77dafd@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_113819_354403_6456F719 
X-CRM114-Status: GOOD (  17.32  )
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

On Tue, Apr 30, 2024 at 12:07:26PM +0200, Andrew Jones wrote:
> On Mon, Apr 29, 2024 at 03:29:51PM GMT, Charlie Jenkins wrote:
> ...
> > +		 *
> > +		 * Disable vector if the boot hart has a T-Head mvendorid and an marchid of 0.
> 
> I probably would have added the 'why' to this comment, i.e. T-Head doesn't
> have standard V so things will break if we try to use it, or whatever. The
> 'what' alone is just putting the easy to read condition below into
> English, making it an unnecessary comment.

The 'why' is directly above this comment. I'll just get rid of this
addition.

- Charlie

> 
> Thanks,
> drew
> 
> >  		 */
> > -		if (acpi_disabled && riscv_cached_mvendorid(cpu) == THEAD_VENDOR_ID &&
> > -		    riscv_cached_marchid(cpu) == 0x0) {
> > +		if (acpi_disabled && boot_vendorid == THEAD_VENDOR_ID && boot_archid == 0x0) {
> >  			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
> >  			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
> >  		}
> > 
> > -- 
> > 2.44.0
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
