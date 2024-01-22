Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88E5C46CD2
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 23:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4QpI+Jh+mxy2jU1ZqWTSKyxhsmagSSTx1HPgd+WHEIA=; b=L9Uufo7UNG3cks
	f6WZHRkEueqDWs6A/u15UG7rs/XGxDz0LdDY70HjshpCDsZuQmfO01QcQD5T2/7sNsw94Qm/Ul2VT
	PAF6p9ilQsjaXLE3Fim2BrE1A9NZenS+7Pnv5eQJFquXp2LZVh3Y+uR4SzHKL/AnLgr6mfNaJv0Xr
	1VewVMCIHVH8Juei/zgkvPEew9u/yVWoPYO5K4DFjfavD3mJjkK3Izm2hIsKVOqtUJvNpyITJGgme
	hkEG2volRqwjR8V5SYdLy9+RjB+2etDQAkLLBvqCNXara+bipHbyAxvN56E30Lb7CB/1DUUBh3FU0
	P8PvYMdUq79YC96UtruQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS48R-00ESv5-2a;
	Mon, 22 Jan 2024 23:55:23 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS48L-00ESsL-1G
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 23:55:21 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d51ba18e1bso33443885ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 15:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705967713; x=1706572513; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RGk235mHGOuLFyUX2ZxszOcar+oRQLJEt08BYqJiusU=;
        b=rv5WmL6hGCX7DlPUWWOWHV7j+JFJi1RA9ixz3OY1OKSeoE7Tbb7RwPSTk5hp+8/nJt
         /fYWPBcHcvWu0UKDm+tCdgfmsZXFQtmkigsZLyIeP4iXqzUSdNTK0vz6M53DsmJ35rIO
         CahZiY6AVsAdw+RYay7DGiIIykTCGKzHbh2inEo5mafW6bo36RHcajZCp+RB/1uwOJu6
         OYF5sSrjEOvJ8IoYqxRHHDOh5HHF4qHRjemB37v1c/r/8OYv9PbzYBZdN4TOBdK9cXtR
         K2GfQNbhn+jgs06Vv9teFZ6xx2J/CvdbzFBt0Qlw2ZbVP0hyUzqcZ21y5XBVaCUK0wm9
         g/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705967713; x=1706572513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGk235mHGOuLFyUX2ZxszOcar+oRQLJEt08BYqJiusU=;
        b=rFWXmbzzYvmNTfUDHHpZTSiapsthstAHfA+xQrBUMEN5TTTB4hxCnodUvd1FmGAH5m
         NWm89xb7RpMLGSAla89PM+oZGceSIJnofGXYAtXm/XTpHzwVZBCb+dNbfT51N34Kij6H
         16hrm0bHCJOVsA1OZsr2l41LVRpHD9SHo0i3ilgG5RDOM9grkpSzPaD2SNuGcvS/hmqz
         GcEHxHNyNMaC++t1xSTv3NBrFC7XNfeyhqelTtQHw70kjHseyB8d6D+YdrSmGjYaNjtx
         S6wv3xo3GI5kpr+lLnkW5T1msoRolkXTQpS7+2BSqZ1S9TSiVdfaA9QXqc0XFNnlf5ko
         lc2w==
X-Gm-Message-State: AOJu0YxFz+wO7/IA3rmMGkyO1L7ggW6WlbPK2SGLqZS2jvnERAKpudOV
	cU/2jMcxk/KWa4d6HlKuaiaLEX5C/Tq11nM4zHMnTnn8E9DU+jrfQxFbOMy1ftU=
X-Google-Smtp-Source: AGHT+IGlfX9GLJ1dnOiKn3TDuB3TFlx7HAkf+GG7l4UHuUlr4oOT5ppL6HIemKoYEiunX/cBMMzKrg==
X-Received: by 2002:a17:903:228c:b0:1d5:4df7:17d6 with SMTP id b12-20020a170903228c00b001d54df717d6mr5807722plh.95.1705967713277;
        Mon, 22 Jan 2024 15:55:13 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id y11-20020a170902e18b00b001d7283bc6c6sm5038148pla.61.2024.01.22.15.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 15:55:12 -0800 (PST)
Date: Mon, 22 Jan 2024 15:55:10 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: David.Laight@aculab.com, linux@roeck-us.net,
	Conor Dooley <conor@kernel.org>, samuel.holland@sifive.com,
	xiao.w.wang@intel.com, Evan Green <evan@rivosinc.com>,
	guoren@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v15 5/5] kunit: Add tests for csum_ipv6_magic and
 ip_fast_csum
Message-ID: <Za8AXnKCm4cPyVbp@ghost>
References: <be959a4bb660466faba5ade7976485c8@AcuMS.aculab.com>
 <mhng-b5f26a34-7632-4423-9f07-3224170bae9f@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-b5f26a34-7632-4423-9f07-3224170bae9f@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_155518_423201_1F2E0540 
X-CRM114-Status: GOOD (  46.78  )
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

On Mon, Jan 22, 2024 at 03:39:16PM -0800, Palmer Dabbelt wrote:
> On Mon, 22 Jan 2024 13:41:48 PST (-0800), David.Laight@ACULAB.COM wrote:
> > From: Guenter Roeck
> > > Sent: 22 January 2024 17:16
> > > 
> > > On 1/22/24 08:52, David Laight wrote:
> > > > From: Guenter Roeck
> > > >> Sent: 22 January 2024 16:40
> > > >>
> > > >> Hi,
> > > >>
> > > >> On Mon, Jan 08, 2024 at 03:57:06PM -0800, Charlie Jenkins wrote:
> > > >>> Supplement existing checksum tests with tests for csum_ipv6_magic and
> > > >>> ip_fast_csum.
> > > >>>
> > > >>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > >>> ---
> > > >>
> > > >> With this patch in the tree, the arm:mps2-an385 qemu emulation gets a bad hiccup.
> > > >>
> > > >> [    1.839556] Unhandled exception: IPSR = 00000006 LR = fffffff1
> > > >> [    1.839804] CPU: 0 PID: 164 Comm: kunit_try_catch Tainted: G                 N 6.8.0-rc1 #1
> > > >> [    1.839948] Hardware name: Generic DT based system
> > > >> [    1.840062] PC is at __csum_ipv6_magic+0x8/0xb4
> > > >> [    1.840408] LR is at test_csum_ipv6_magic+0x3d/0xa4
> > > >> [    1.840493] pc : [<21212f34>]    lr : [<21117fd5>]    psr: 0100020b
> > > >> [    1.840586] sp : 2180bebc  ip : 46c7f0d2  fp : 21275b38
> > > >> [    1.840664] r10: 21276b60  r9 : 21275b28  r8 : 21465cfc
> > > >> [    1.840751] r7 : 00003085  r6 : 21275b4e  r5 : 2138702c  r4 : 00000001
> > > >> [    1.840847] r3 : 2c000000  r2 : 1ac7f0d2  r1 : 21275b39  r0 : 21275b29
> > > >> [    1.840942] xPSR: 0100020b
> > > >>
> > > >> This translates to:
> > > >>
> > > >> PC is at __csum_ipv6_magic (arch/arm/lib/csumipv6.S:15)
> > > >> LR is at test_csum_ipv6_magic (./arch/arm/include/asm/checksum.h:60
> > > >> ./arch/arm/include/asm/checksum.h:163 lib/checksum_kunit.c:617)
> > > >>
> > > >> Obviously I can not say if this is a problem with qemu or a problem with
> > > >> the Linux kernel. Given that, and the presumably low interest in
> > > >> running mps2-an385 with Linux, I'll simply disable that test. Just take
> > > >> it as a heads up that there _may_ be a problem with this on arm
> > > >> nommu systems.
> > > >
> > > > Can you drop in a disassembly of __csum_ipv6_magic ?
> > > > Actually I think it is:
> > > 
> > > It is, as per the PC pointer above. I don't know anything about arm assembler,
> > > much less about its behavior with THUMB code.
> > 
> > Doesn't look like thumb to me (offset 8 is two 4-byte instructions) and
> > the code I found looks like arm to me.
> > (I haven't written any arm asm since before they invented thumb!)
> > 
> > > > ENTRY(__csum_ipv6_magic)
> > > > 		str	lr, [sp, #-4]!
> > > > 		adds	ip, r2, r3
> > > > 		ldmia	r1, {r1 - r3, lr}
> > > >
> > > > So the fault is (probably) a misaligned ldmia ?
> > > > Are they ever supported?
> > > >
> > > 
> > > Good question. My primary guess is that this never worked. As I said,
> > > this was just intended to be informational, (probably) no reason to bother.
> > > 
> > > Of course one might ask if it makes sense to even keep the arm nommu code
> > > in the kernel, but that is of course a different question. I do wonder though
> > > if anyone but me is running it.
> > 
> > If it is an alignment fault it isn't a 'nommu' bug.
> > 
> > And traditionally arm didn't support misaligned transfers (well not
> > in anyway any other cpu did!).
> > It might be that the kernel assumes that all ethernet packets are
> > aligned, but the test suite isn't aligning the buffer.
> > Which would make it a test suite bug.
> 
> From talking to Evan and Vineet, I think you're right and this is a test
> suite bug: specifically the tests weren't respecting NET_IP_ALIGN.  That
> didn't crop up for ip_fast_csum() as it just uses ldr which supports
> misaligned accesses on the M3 (at least as far as I can tell).
> 
> So I think the right fix is something like
> 
>    diff --git a/lib/checksum_kunit.c b/lib/checksum_kunit.c
>    index 225bb7701460..2dd282e27dd4 100644
>    --- a/lib/checksum_kunit.c
>    +++ b/lib/checksum_kunit.c
>    @@ -5,6 +5,7 @@
>     #include <kunit/test.h>
>     #include <asm/checksum.h>
>    +#include <asm/checksum.h>
>     #include <net/ip6_checksum.h>
>     #define MAX_LEN 512
>    @@ -15,6 +16,7 @@
>     #define IPv4_MAX_WORDS 15
>     #define NUM_IPv6_TESTS 200
>     #define NUM_IP_FAST_CSUM_TESTS 181
>    +#define SUPPORTED_ALIGNMENT (1 << NET_IP_ALIGN)
>     /* Values for a little endian CPU. Byte swap each half on big endian CPU. */
>     static const u32 random_init_sum = 0x2847aab;
>    @@ -486,7 +488,7 @@ static void test_csum_fixed_random_inputs(struct kunit *test)
>     	__sum16 result, expec;
>     	assert_setup_correct(test);
>    -	for (align = 0; align < TEST_BUFLEN; ++align) {
>    +	for (align = 0; align < TEST_BUFLEN; align += SUPPORTED_ALIGNMENT) {
>     		memcpy(&tmp_buf[align], random_buf,
>     		       min(MAX_LEN, TEST_BUFLEN - align));
>     		for (len = 0; len < MAX_LEN && (align + len) < TEST_BUFLEN;
>    @@ -513,7 +515,7 @@ static void test_csum_all_carry_inputs(struct kunit *test)
>     	assert_setup_correct(test);
>     	memset(tmp_buf, 0xff, TEST_BUFLEN);
>    -	for (align = 0; align < TEST_BUFLEN; ++align) {
>    +	for (align = 0; align < TEST_BUFLEN; align += SUPPORTED_ALIGNMENT) {
>     		for (len = 0; len < MAX_LEN && (align + len) < TEST_BUFLEN;
>     		     ++len) {
>     			/*
>    @@ -553,7 +555,7 @@ static void test_csum_no_carry_inputs(struct kunit *test)
>     	assert_setup_correct(test);
>     	memset(tmp_buf, 0x4, TEST_BUFLEN);
>    -	for (align = 0; align < TEST_BUFLEN; ++align) {
>    +	for (align = 0; align < TEST_BUFLEN; align += SUPPORTED_ALIGNMENT) {
>     		for (len = 0; len < MAX_LEN && (align + len) < TEST_BUFLEN;
>     		     ++len) {
>     			/*
> 
> but I haven't even build tested it...

This doesn't fix the test_csum_ipv6_magic test case that was causing the
initial problem, but the same trick can be done in that test.

- Charlie

> 
> > 
> > 	David
> > 
> > -
> > Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> > Registration No: 1397386 (Wales)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
