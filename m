Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E656C46CD2
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 23:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=OGFPRR1fSf5D6tRFo+GxfGKAQrnJL859EeuJf/P+oVY=; b=3TsTI2kL91k2Z8qUqDNXCLvDYl
	zBgMeyidYuv7Vj5l+w5+KLjCcU9hkLNviWGmU9CC+akhtJOymgH8QmNENY7yNKgudJD79hxH47mgv
	cNi4PnoygfENRj/T6r4MroHUH8MYmVdr+TrIDe/5xiGV0bUwGnVe2MYD9Jlaxu8Ck7e5rBhg2lEK3
	3M7mwK4FiVK6nd+CGmpKr4B+mjgfqvCvV97zfjsVa9eMqVIdJnNF+QnosNrcMQztUWJHMG5aHN4Au
	6QqlXA6mhjZ1JbsyB/RgiYHXxLw9g5ifemtKVLQOXgK5vd6h/2iipZVJW+PUqvpNpuxwy6G4Plm5h
	ZKij+iXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS3sx-00ERKD-1y;
	Mon, 22 Jan 2024 23:39:23 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS3st-00ERJu-1d
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 23:39:22 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so2935640a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 15:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1705966757; x=1706571557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1Z7TMO+jlXXWWyWCZcJYVQVsmcsD5xU6FxCleKovtY=;
        b=sxVl7FDJTuzRzgBnaT7BmmNim4J0O513hdKFqrYpYP0pcx02a3ldpH0DZ7P8SyZEK5
         D4J0gjNjpgey8VTlJzee25LvITePAhQCYJHYmFG2gamSw+W4BAfHmZXSOPNXiX+pPILD
         RJ9SO9Ff4WEdoR/9Ma0nxMcSxGkNWRQ5zkvrQtpvwOuJumGv10iMREyMpeufOX8P6pKG
         50Oc5QVr7oQxG4HaGHizuLx34bOL+OCL92uy+hGIoTP6NoHyyH7DUjYmNVgy+L8pBRx+
         cIbKPf28M83T6fko08ZbTIT9JCMUuAm4/XlvzIcx9qYfLbkg5h1buV+2qk4RtvOEISV+
         1pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705966757; x=1706571557;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1Z7TMO+jlXXWWyWCZcJYVQVsmcsD5xU6FxCleKovtY=;
        b=j7fYWdWpMVJEoQHSBt7wsQdBuNy4WWOFwQCsFeSVuGDDHPCNTqC07kdKbhQeHMVnpK
         bRfHmX16uHiP+Yz2bDntVoMLjkhvYCgrABo9V+Kj5En4FupDsi3/WchRqGf9LEdj8p+W
         9lEBO3wm7CYxG1RGsfOe4rWGy3z/zrk1USdm19yq85VfcB5jKq9uV6NnisNRMwl59AnX
         nbcM4H+e0tyAo0zPZ0ptMOXYH+a3Anpg3XErqL/oYQ46J8cndOl9LS+5ktoFYriNQ7eH
         q8j0gtD32THc5SyfIKaZVoBnkDmeQRPjcv01tUeEKappWN4yJjxg27xbjpAokhpI5Ogd
         DNaQ==
X-Gm-Message-State: AOJu0Yzm5bceRaD2IV6grO8ODUS/cjc/PvqcwHOIRpHHHNmudXRy3LKl
	BxsLHXUaBuVc0KzbS14NeO+pNcWApWhP4LuGJBw1rMKlwBnP3JLlRLa7c9VqXjg=
X-Google-Smtp-Source: AGHT+IHroItpJWznNEfKh19g/GnSygUrkdpTMXX24mBVJc3jFJvJ6LRrEv7NQ8110mvxwpmF/jHprQ==
X-Received: by 2002:a05:6a20:3089:b0:19a:e284:5b21 with SMTP id 9-20020a056a20308900b0019ae2845b21mr4838334pzn.74.1705966757110;
        Mon, 22 Jan 2024 15:39:17 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id v14-20020aa7808e000000b006dbc4cb72ebsm6170406pff.201.2024.01.22.15.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 15:39:16 -0800 (PST)
Date: Mon, 22 Jan 2024 15:39:16 -0800 (PST)
X-Google-Original-Date: Mon, 22 Jan 2024 15:39:05 PST (-0800)
Subject: RE: [PATCH v15 5/5] kunit: Add tests for csum_ipv6_magic and ip_fast_csum
In-Reply-To: <be959a4bb660466faba5ade7976485c8@AcuMS.aculab.com>
CC: linux@roeck-us.net, charlie@rivosinc.com, Conor Dooley <conor@kernel.org>,
  samuel.holland@sifive.com, xiao.w.wang@intel.com, Evan Green <evan@rivosinc.com>, guoren@kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: David.Laight@ACULAB.COM
Message-ID: <mhng-b5f26a34-7632-4423-9f07-3224170bae9f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_153920_548429_A5D2A9EE 
X-CRM114-Status: GOOD (  36.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 22 Jan 2024 13:41:48 PST (-0800), David.Laight@ACULAB.COM wrote:
> From: Guenter Roeck
>> Sent: 22 January 2024 17:16
>> 
>> On 1/22/24 08:52, David Laight wrote:
>> > From: Guenter Roeck
>> >> Sent: 22 January 2024 16:40
>> >>
>> >> Hi,
>> >>
>> >> On Mon, Jan 08, 2024 at 03:57:06PM -0800, Charlie Jenkins wrote:
>> >>> Supplement existing checksum tests with tests for csum_ipv6_magic and
>> >>> ip_fast_csum.
>> >>>
>> >>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>> >>> ---
>> >>
>> >> With this patch in the tree, the arm:mps2-an385 qemu emulation gets a bad hiccup.
>> >>
>> >> [    1.839556] Unhandled exception: IPSR = 00000006 LR = fffffff1
>> >> [    1.839804] CPU: 0 PID: 164 Comm: kunit_try_catch Tainted: G                 N 6.8.0-rc1 #1
>> >> [    1.839948] Hardware name: Generic DT based system
>> >> [    1.840062] PC is at __csum_ipv6_magic+0x8/0xb4
>> >> [    1.840408] LR is at test_csum_ipv6_magic+0x3d/0xa4
>> >> [    1.840493] pc : [<21212f34>]    lr : [<21117fd5>]    psr: 0100020b
>> >> [    1.840586] sp : 2180bebc  ip : 46c7f0d2  fp : 21275b38
>> >> [    1.840664] r10: 21276b60  r9 : 21275b28  r8 : 21465cfc
>> >> [    1.840751] r7 : 00003085  r6 : 21275b4e  r5 : 2138702c  r4 : 00000001
>> >> [    1.840847] r3 : 2c000000  r2 : 1ac7f0d2  r1 : 21275b39  r0 : 21275b29
>> >> [    1.840942] xPSR: 0100020b
>> >>
>> >> This translates to:
>> >>
>> >> PC is at __csum_ipv6_magic (arch/arm/lib/csumipv6.S:15)
>> >> LR is at test_csum_ipv6_magic (./arch/arm/include/asm/checksum.h:60
>> >> ./arch/arm/include/asm/checksum.h:163 lib/checksum_kunit.c:617)
>> >>
>> >> Obviously I can not say if this is a problem with qemu or a problem with
>> >> the Linux kernel. Given that, and the presumably low interest in
>> >> running mps2-an385 with Linux, I'll simply disable that test. Just take
>> >> it as a heads up that there _may_ be a problem with this on arm
>> >> nommu systems.
>> >
>> > Can you drop in a disassembly of __csum_ipv6_magic ?
>> > Actually I think it is:
>> 
>> It is, as per the PC pointer above. I don't know anything about arm assembler,
>> much less about its behavior with THUMB code.
> 
> Doesn't look like thumb to me (offset 8 is two 4-byte instructions) and
> the code I found looks like arm to me.
> (I haven't written any arm asm since before they invented thumb!)
> 
>> > ENTRY(__csum_ipv6_magic)
>> > 		str	lr, [sp, #-4]!
>> > 		adds	ip, r2, r3
>> > 		ldmia	r1, {r1 - r3, lr}
>> >
>> > So the fault is (probably) a misaligned ldmia ?
>> > Are they ever supported?
>> >
>> 
>> Good question. My primary guess is that this never worked. As I said,
>> this was just intended to be informational, (probably) no reason to bother.
>> 
>> Of course one might ask if it makes sense to even keep the arm nommu code
>> in the kernel, but that is of course a different question. I do wonder though
>> if anyone but me is running it.
> 
> If it is an alignment fault it isn't a 'nommu' bug.
> 
> And traditionally arm didn't support misaligned transfers (well not
> in anyway any other cpu did!).
> It might be that the kernel assumes that all ethernet packets are
> aligned, but the test suite isn't aligning the buffer.
> Which would make it a test suite bug.

From talking to Evan and Vineet, I think you're right and this is a test 
suite bug: specifically the tests weren't respecting NET_IP_ALIGN.  That 
didn't crop up for ip_fast_csum() as it just uses ldr which supports 
misaligned accesses on the M3 (at least as far as I can tell).

So I think the right fix is something like

    diff --git a/lib/checksum_kunit.c b/lib/checksum_kunit.c
    index 225bb7701460..2dd282e27dd4 100644
    --- a/lib/checksum_kunit.c
    +++ b/lib/checksum_kunit.c
    @@ -5,6 +5,7 @@
    
     #include <kunit/test.h>
     #include <asm/checksum.h>
    +#include <asm/checksum.h>
     #include <net/ip6_checksum.h>
    
     #define MAX_LEN 512
    @@ -15,6 +16,7 @@
     #define IPv4_MAX_WORDS 15
     #define NUM_IPv6_TESTS 200
     #define NUM_IP_FAST_CSUM_TESTS 181
    +#define SUPPORTED_ALIGNMENT (1 << NET_IP_ALIGN)
    
     /* Values for a little endian CPU. Byte swap each half on big endian CPU. */
     static const u32 random_init_sum = 0x2847aab;
    @@ -486,7 +488,7 @@ static void test_csum_fixed_random_inputs(struct kunit *test)
     	__sum16 result, expec;
    
     	assert_setup_correct(test);
    -	for (align = 0; align < TEST_BUFLEN; ++align) {
    +	for (align = 0; align < TEST_BUFLEN; align += SUPPORTED_ALIGNMENT) {
     		memcpy(&tmp_buf[align], random_buf,
     		       min(MAX_LEN, TEST_BUFLEN - align));
     		for (len = 0; len < MAX_LEN && (align + len) < TEST_BUFLEN;
    @@ -513,7 +515,7 @@ static void test_csum_all_carry_inputs(struct kunit *test)
    
     	assert_setup_correct(test);
     	memset(tmp_buf, 0xff, TEST_BUFLEN);
    -	for (align = 0; align < TEST_BUFLEN; ++align) {
    +	for (align = 0; align < TEST_BUFLEN; align += SUPPORTED_ALIGNMENT) {
     		for (len = 0; len < MAX_LEN && (align + len) < TEST_BUFLEN;
     		     ++len) {
     			/*
    @@ -553,7 +555,7 @@ static void test_csum_no_carry_inputs(struct kunit *test)
    
     	assert_setup_correct(test);
     	memset(tmp_buf, 0x4, TEST_BUFLEN);
    -	for (align = 0; align < TEST_BUFLEN; ++align) {
    +	for (align = 0; align < TEST_BUFLEN; align += SUPPORTED_ALIGNMENT) {
     		for (len = 0; len < MAX_LEN && (align + len) < TEST_BUFLEN;
     		     ++len) {
     			/*

but I haven't even build tested it...

> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
