Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1555C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 05:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YdD9MPO4gu5e1dF6ENAj1ZETS3RZuyGK7e8Lx8tdgsA=; b=HvUhi2CCTCsve1
	b/BMlPSYAeZzQd/9DsxtrPr93hcJ7j12wG2DCV+9MIpRa8E16e9rsej931byzE7LSadbI1EvdbDWB
	GEBOAD49ioPlZR7zxZhAJ9EMAFiDaExoTZJXxpk4m9T7of9UZkKoJIgbA2pvJgtnh9gEzHVXJGpoE
	ZFtgQRy2X/pIl4AuXovTqFuOK028PZyd7GGy8yqzroV4A1U0ndJUBh27NfnLmWJOvl69+d27TlHNu
	/j3asQSQVAlY5vQcBnlsn3jMPIyxdXlTfl34TzYTmzStNmoVuHR7JglHHPKds8I5JDmK7c8Y5gq4s
	DU1XEUURP1l83EqIlwOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGYIb-0050ol-0F;
	Fri, 22 Dec 2023 05:42:17 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGYIY-0050nh-0H
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 05:42:15 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5c6839373f8so1063319a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 21:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703223729; x=1703828529; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tshARWagRRHxlEAjYIN29OCOP9SHjMXaawfRGNvVCMk=;
        b=oJKH3PNR3yxjP7ZggnwKFhwHXo1BtyKHddjt3PGFAGc7iFAMHT0jeZEhFdO17ZstWg
         E4tSAiWRPwaKUelEpWaYKtmcilJPw3lc8Ot8KoS/uUrCqE8Sk9ZYOZ71Abz5QCj7Koti
         +NVDweDIQS8hlK8uC6BcF/O3nqsJFY7SOoCemP6NSorbmci7yZq+tAGYprqUEH0nzgMP
         Po9ACh4UP26tGw2cLcsxEsrWKDaF9zVPyXrizk5WqtVaKmDpMTGlddeeQqcP/xIiQF1O
         4t72wg9yuQrbSWjYe14IzufT5CjsRdliEklbMVn4Pxdn00kJ4B8itj7AbfnJqqOluZg6
         O95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703223729; x=1703828529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tshARWagRRHxlEAjYIN29OCOP9SHjMXaawfRGNvVCMk=;
        b=ofXnFwIw7G6AoQtKnlkUror7vwlNOjfvr/21FIQJT3iUw3lIRJBQKFtn7cYUf1/D3S
         DxBKRJnaPlXXj9VNbNRscQuoulpLYDVbKxOh+tV5q+8+KpRcG4KbncaV4A2iQqwr2Aud
         qI+RqzR0q9t8m/Q6wn0bEq7yQ8yuikrFjR04Otx52RiB+KFUpyGj6S7cdIClR4Scyq/g
         xlaYUzzL9+6M3M5wnQYl4gY0CRjGVOZOl6LMTTcnaqG+WDZl3zSmY4kLeJU3xk4cNdUn
         JNTwVlBUbsj4rQCtvOV0AEHPFHWhz3nCgC/WaqpMQbJOTzdEUmEEwG0/0ha9uH+1EJrj
         EfWw==
X-Gm-Message-State: AOJu0YxqnU56PPlCtbexQl/1F1aUzQLIuUJxWE5CdbNabx9hAArFmMmZ
	C0p/PqQcecaHvjnx4vruultSeyWPab8xQg==
X-Google-Smtp-Source: AGHT+IFPYN93FpZrSP6JEuX0E8+Rz/2HUmp3SPiiY3k73uCyVJqHwo4hbyYd5MYmWGrJPBD7tMIC/A==
X-Received: by 2002:a05:6a20:8404:b0:194:7c07:5f55 with SMTP id c4-20020a056a20840400b001947c075f55mr958883pzd.54.1703223729146;
        Thu, 21 Dec 2023 21:42:09 -0800 (PST)
Received: from ghost ([2601:647:5700:6860:f06:7450:7dd4:fc1d])
        by smtp.gmail.com with ESMTPSA id j26-20020aa78d1a000000b006d974fe1b0esm2127879pfe.7.2023.12.21.21.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 21:42:08 -0800 (PST)
Date: Thu, 21 Dec 2023 21:42:05 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: guoren@kernel.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	alexghiti@rivosinc.com, xiao.w.wang@intel.com, david@redhat.com,
	panqinglin2020@iscas.ac.cn, rick.p.edgecombe@intel.com,
	willy@infradead.org, bjorn@rivosinc.com, conor.dooley@microchip.com,
	cleger@rivosinc.com, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>, stable@vger.kernel.org
Subject: Re: [PATCH V2 2/4] riscv: mm: Fixup compat arch_get_mmap_end
Message-ID: <ZYUhrTaXMqyRchyP@ghost>
References: <20231221154702.2267684-1-guoren@kernel.org>
 <20231221154702.2267684-3-guoren@kernel.org>
 <ZYUD4C1aXWt2oFJo@LeoBras>
 <ZYUK2zUHjYBL0zO7@ghost>
 <ZYUPQIJ070BYDzJJ@LeoBras>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZYUPQIJ070BYDzJJ@LeoBras>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_214214_124458_43ADD06D 
X-CRM114-Status: GOOD (  43.74  )
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

On Fri, Dec 22, 2023 at 01:23:29AM -0300, Leonardo Bras wrote:
> On Thu, Dec 21, 2023 at 08:04:43PM -0800, Charlie Jenkins wrote:
> > On Fri, Dec 22, 2023 at 12:34:56AM -0300, Leonardo Bras wrote:
> > > On Thu, Dec 21, 2023 at 10:46:59AM -0500, guoren@kernel.org wrote:
> > > > From: Guo Ren <guoren@linux.alibaba.com>
> > > > 
> > > > When the task is in COMPAT mode, the arch_get_mmap_end should be 2GB,
> > > > not TASK_SIZE_64. The TASK_SIZE has contained is_compat_mode()
> > > > detection, so change the definition of STACK_TOP_MAX to TASK_SIZE
> > > > directly.
> > > 
> > > ok
> > > 
> > > > 
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
> > > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > > Signed-off-by: Guo Ren <guoren@kernel.org>
> > > > ---
> > > >  arch/riscv/include/asm/processor.h | 6 ++----
> > > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> > > > index f19f861cda54..1f538fc4448d 100644
> > > > --- a/arch/riscv/include/asm/processor.h
> > > > +++ b/arch/riscv/include/asm/processor.h
> > > > @@ -16,15 +16,13 @@
> > > >  
> > > >  #ifdef CONFIG_64BIT
> > > >  #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
> > > > -#define STACK_TOP_MAX		TASK_SIZE_64
> > > > +#define STACK_TOP_MAX		TASK_SIZE
> > > 
> > > It means STACK_TOP_MAX will be in 64BIT:
> > > - TASK_SIZE_32 if compat_mode=y
> > > - TASK_SIZE_64 if compat_mode=n
> > > 
> > > Makes sense for me.
> > > 
> > > >  
> > > >  #define arch_get_mmap_end(addr, len, flags)			\
> > > >  ({								\
> > > >  	unsigned long mmap_end;					\
> > > >  	typeof(addr) _addr = (addr);				\
> > > > -	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
> > > > -		mmap_end = STACK_TOP_MAX;			\
> > > > -	else if ((_addr) >= VA_USER_SV57)			\
> > > > +	if ((_addr) == 0 || (_addr) >= VA_USER_SV57)		\
> > > >  		mmap_end = STACK_TOP_MAX;			\
> > > >  	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
> > > >  		mmap_end = VA_USER_SV48;			\
> > > 
> > > 
> > > I don't think I got this change, or how it's connected to the commit msg.
> > > 
> > > Before:
> > > - addr == 0, or addr > 2^57, or compat: mmap_end = STACK_TOP_MAX
> > > - 2^48 < addr < 2^57: mmap_end = 2^48
> > > - 0 < addr < 2^48 : mmap_end = 2^39
> > > 
> > > Now:
> > > - addr == 0, or addr > 2^57: mmap_end = STACK_TOP_MAX
> > > - 2^48 < addr < 2^57: mmap_end = 2^48
> > > - 0 < addr < 2^48 : mmap_end = 2^39
> > > 
> > > IIUC compat mode addr will be < 2^32, so will always have mmap_end = 2^39 
> > > if addr != 0. Is that desireable? 
> > > (if not, above change is unneeded)
> > 
> > I agree, this change does not make sense for compat mode. Compat mode
> > should never return an address that is greater than 2^32, but this
> > change allows that.
> > 
> > > 
> > > Also, unrelated to the change:
> > > - 2^48 < addr < 2^57: mmap_end = 2^48
> > > Is the above correct?
> > > It looks like it should be 2^57 instead, and a new if clause for 
> > > 2^32 < addr < 2^48 should have mmap_end = 2^48.
> > 
> > That is not the case. I documented this behavior and reasoning in
> > Documentation/arch/riscv/vm-layout.rst in the "Userspace VAs" section.
> > 
> > I can reiterate here though. The hint address to mmap (defined here as
> > "addr") is the maximum userspace address that mmap should provide. What
> > you are describing is a minimum. The purpose of this change was to allow
> > applications that are not compatible with a larger virtual address (such
> > as applications like Java that use the upper bits of the VA to store
> > data) to have a consistent way of specifying how many bits they would
> > like to be left free in the VA. This requires to take the next lowest
> > address space to guaruntee that all of the most-significant bits left
> > clear in hint address do not end up populated in the virtual address
> > returned by mmap.
> > 
> > - Charlie
> 
> Hello Charlie, thank you for helping me understand!
> 
> Ok, that does make sense now! The addr value hints "don't allocate > addr"
> and thus:
> 
> - 0 < addr < 2^48 : mmap_end = 2^39
> - 2^48 < addr < 2^57: mmap_end = 2^48
> 
> Ok, but then
> - addr > 2^57: mmap_end = 2^57
> right?
> 
> I mean, probably STACK_TOP_MAX in non-compat mode means 2^57 already, but 
> having it explicitly like:
> 
>  else if ((_addr) >= VA_USER_SV57)                       \
>          mmap_end = VA_USER_SV57;                        \
> 
> would not be better for a future full 64-bit addressing?
> (since it's already on a different if clause)

I agree, that does make more sense.

> 
> I could add comment on top of the macro with a short version on your addr 
> hint description above. Would that be ok?

Sure :)

- Charlie

> 
> Thanks!
> Leo
> 
> 
> 
> 
> 
> > 
> > > 
> > > Do I get it wrong?
> > > 
> > > (I will send an RFC 'fixing' the code the way I am whinking it should look 
> > > like)
> > > 
> > > Thanks, 
> > > Leo
> > > 
> > > 
> > > 
> > > 
> > > 
> > > > -- 
> > > > 2.40.1
> > > > 
> > > 
> > 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
