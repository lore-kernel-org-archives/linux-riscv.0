Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BAEC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 01:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K21IwSN9+mnixj9266v3mAEBt/oitzkNEa+OAAMruw0=; b=ndbbBlInVUw8Ek
	u2/62L0eVy6gwjEOWwh6n2uLwGfoqnMp76CaAISszS55jtAFVe58pNHFFE9g6e/LQAZFJuxAmTund
	SFAKS/AjZuQeBfiqgl2WAO+bSbj3/rSCcivG8UuW7hxGIuNTbO5MM0c4JryqW3zv2r/NZXLuijY6m
	wAL+S/UdO355qQyeSa/fmZA2aZpCo0byU65jHDjyniyFcRm1caDRhGY/jjAYrJFg6GsbJKaA5KnQz
	1HB+BDvmuqHuPzhw0hmeipPx2EypwgEjalLAmg/xgv3UJxnWleq+H+ZmfQQG1X6d8OlO7PQc3tlBU
	BhEywFLa2pCXycL2sBcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS5F4-00Eh5y-24;
	Tue, 23 Jan 2024 01:06:18 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS5F1-00Eh4g-33
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 01:06:17 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d74045c463so10358105ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 17:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705971972; x=1706576772; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Dww+c2ua5vGiOnRP836ljW2S8BcprbVDvaDWfIZ2I50=;
        b=WgyQMbGh0Lqwb0ky2TGkW3hlmTvSOhLwuo2VCiN3rO1vhKfIW/ldwSHz4W5CNm4KIU
         y4hW4mXAMs7fBoi0w+VoXGT1c0p3eYDhceTAKwOxw/aecqCl/M+uBCj8SDYlQnP50bqJ
         M5izRCuCmKJF1MGwLA6wiUe/bjvM7KvCJFnhzPF2udLxtM6kmD2MiOPo7aN1PP4h9Diy
         QX/FpiNdcGK4p/GefO/+4nON3KGPhocoYwP81GhB7M9mClFGtbHmuogFpgD8Fd1ZX0l8
         J6k7SPfrJGXVQibGieVhKWn5QZVfbMdGIa7/YQvZQ9rCetdHA2Lu4ut5yIlADHiNGkD/
         8Y7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705971972; x=1706576772;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dww+c2ua5vGiOnRP836ljW2S8BcprbVDvaDWfIZ2I50=;
        b=rnCItKB0OGc5c2Sb63s9ZtA8Xh7WmwFRfQPi+t3OShkSUly2JSWADMf9x4b7ZKhTCV
         AqHHDhT4CrgH47C3T1wHjmX38yba6w6RNP6CdQNJZRxc6I8pFlqm6/lZ0qNbMdbSr4W8
         CC/CbFr40Gnu0AEeaCrOtS6Eqf00tIn1iVJLzrd2bBkDIK53FKTlhrIIgqOcZqP2uDI6
         ZDIFP20LwV9vxQa2vXS3/1QSxMO1S6O+cwgZby13eae/kSIe6xxP1662xZNKpfZMwyIa
         TSFhEkBFHPtfTJTN1VwhuSF3m1mvfehEe4TnH9XOO0gKOaT+0lPSFT01SfKMko08qERU
         EI9A==
X-Gm-Message-State: AOJu0Yz32oMKwrnrJWBLPIYlbP+uHj/V3D8294g85mRgJlUzF1oje7yp
	/wJ1QWDXbopidy8KWoCLJPYufu7GEXkwLY6sJpzyEb/1+b/pPULA
X-Google-Smtp-Source: AGHT+IH/bOAlBbcgqc0pZiK0H0ofcW2HeJVBCsA8LLR7upvg31tLkkhH156+Hj1H9pzRS3twibcG7w==
X-Received: by 2002:a17:902:e890:b0:1d7:3533:9687 with SMTP id w16-20020a170902e89000b001d735339687mr2217792plg.42.1705971972221;
        Mon, 22 Jan 2024 17:06:12 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o17-20020a170902e29100b001d73228cd99sm4163522plc.99.2024.01.22.17.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 17:06:11 -0800 (PST)
Message-ID: <e548f697-650e-4333-9f39-19a472b7d90a@roeck-us.net>
Date: Mon, 22 Jan 2024 17:06:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 5/5] kunit: Add tests for csum_ipv6_magic and
 ip_fast_csum
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: David.Laight@aculab.com, Conor Dooley <conor@kernel.org>,
 samuel.holland@sifive.com, xiao.w.wang@intel.com,
 Evan Green <evan@rivosinc.com>, guoren@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>
References: <be959a4bb660466faba5ade7976485c8@AcuMS.aculab.com>
 <mhng-b5f26a34-7632-4423-9f07-3224170bae9f@palmer-ri-x1c9>
 <Za8AXnKCm4cPyVbp@ghost>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Za8AXnKCm4cPyVbp@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_170615_984673_887A93A1 
X-CRM114-Status: GOOD (  31.05  )
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

On 1/22/24 15:55, Charlie Jenkins wrote:
> On Mon, Jan 22, 2024 at 03:39:16PM -0800, Palmer Dabbelt wrote:
>> On Mon, 22 Jan 2024 13:41:48 PST (-0800), David.Laight@ACULAB.COM wrote:
>>> From: Guenter Roeck
>>>> Sent: 22 January 2024 17:16
>>>>
>>>> On 1/22/24 08:52, David Laight wrote:
>>>>> From: Guenter Roeck
>>>>>> Sent: 22 January 2024 16:40
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On Mon, Jan 08, 2024 at 03:57:06PM -0800, Charlie Jenkins wrote:
>>>>>>> Supplement existing checksum tests with tests for csum_ipv6_magic and
>>>>>>> ip_fast_csum.
>>>>>>>
>>>>>>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>>>>>>> ---
>>>>>>
>>>>>> With this patch in the tree, the arm:mps2-an385 qemu emulation gets a bad hiccup.
>>>>>>
>>>>>> [    1.839556] Unhandled exception: IPSR = 00000006 LR = fffffff1
>>>>>> [    1.839804] CPU: 0 PID: 164 Comm: kunit_try_catch Tainted: G                 N 6.8.0-rc1 #1
>>>>>> [    1.839948] Hardware name: Generic DT based system
>>>>>> [    1.840062] PC is at __csum_ipv6_magic+0x8/0xb4
>>>>>> [    1.840408] LR is at test_csum_ipv6_magic+0x3d/0xa4
>>>>>> [    1.840493] pc : [<21212f34>]    lr : [<21117fd5>]    psr: 0100020b
>>>>>> [    1.840586] sp : 2180bebc  ip : 46c7f0d2  fp : 21275b38
>>>>>> [    1.840664] r10: 21276b60  r9 : 21275b28  r8 : 21465cfc
>>>>>> [    1.840751] r7 : 00003085  r6 : 21275b4e  r5 : 2138702c  r4 : 00000001
>>>>>> [    1.840847] r3 : 2c000000  r2 : 1ac7f0d2  r1 : 21275b39  r0 : 21275b29
>>>>>> [    1.840942] xPSR: 0100020b
>>>>>>
>>>>>> This translates to:
>>>>>>
>>>>>> PC is at __csum_ipv6_magic (arch/arm/lib/csumipv6.S:15)
>>>>>> LR is at test_csum_ipv6_magic (./arch/arm/include/asm/checksum.h:60
>>>>>> ./arch/arm/include/asm/checksum.h:163 lib/checksum_kunit.c:617)
>>>>>>
>>>>>> Obviously I can not say if this is a problem with qemu or a problem with
>>>>>> the Linux kernel. Given that, and the presumably low interest in
>>>>>> running mps2-an385 with Linux, I'll simply disable that test. Just take
>>>>>> it as a heads up that there _may_ be a problem with this on arm
>>>>>> nommu systems.
>>>>>
>>>>> Can you drop in a disassembly of __csum_ipv6_magic ?
>>>>> Actually I think it is:
>>>>
>>>> It is, as per the PC pointer above. I don't know anything about arm assembler,
>>>> much less about its behavior with THUMB code.
>>>
>>> Doesn't look like thumb to me (offset 8 is two 4-byte instructions) and
>>> the code I found looks like arm to me.
>>> (I haven't written any arm asm since before they invented thumb!)
>>>
>>>>> ENTRY(__csum_ipv6_magic)
>>>>> 		str	lr, [sp, #-4]!
>>>>> 		adds	ip, r2, r3
>>>>> 		ldmia	r1, {r1 - r3, lr}
>>>>>
>>>>> So the fault is (probably) a misaligned ldmia ?
>>>>> Are they ever supported?
>>>>>
>>>>
>>>> Good question. My primary guess is that this never worked. As I said,
>>>> this was just intended to be informational, (probably) no reason to bother.
>>>>
>>>> Of course one might ask if it makes sense to even keep the arm nommu code
>>>> in the kernel, but that is of course a different question. I do wonder though
>>>> if anyone but me is running it.
>>>
>>> If it is an alignment fault it isn't a 'nommu' bug.
>>>
>>> And traditionally arm didn't support misaligned transfers (well not
>>> in anyway any other cpu did!).
>>> It might be that the kernel assumes that all ethernet packets are
>>> aligned, but the test suite isn't aligning the buffer.
>>> Which would make it a test suite bug.
>>
>>  From talking to Evan and Vineet, I think you're right and this is a test
>> suite bug: specifically the tests weren't respecting NET_IP_ALIGN.  That
>> didn't crop up for ip_fast_csum() as it just uses ldr which supports
>> misaligned accesses on the M3 (at least as far as I can tell).
>>
>> So I think the right fix is something like
>>
>>     diff --git a/lib/checksum_kunit.c b/lib/checksum_kunit.c
>>     index 225bb7701460..2dd282e27dd4 100644
>>     --- a/lib/checksum_kunit.c
>>     +++ b/lib/checksum_kunit.c
>>     @@ -5,6 +5,7 @@
>>      #include <kunit/test.h>
>>      #include <asm/checksum.h>
>>     +#include <asm/checksum.h>
>>      #include <net/ip6_checksum.h>
>>      #define MAX_LEN 512
>>     @@ -15,6 +16,7 @@
>>      #define IPv4_MAX_WORDS 15
>>      #define NUM_IPv6_TESTS 200
>>      #define NUM_IP_FAST_CSUM_TESTS 181
>>     +#define SUPPORTED_ALIGNMENT (1 << NET_IP_ALIGN)
>>      /* Values for a little endian CPU. Byte swap each half on big endian CPU. */
>>      static const u32 random_init_sum = 0x2847aab;
>>     @@ -486,7 +488,7 @@ static void test_csum_fixed_random_inputs(struct kunit *test)
>>      	__sum16 result, expec;
>>      	assert_setup_correct(test);
>>     -	for (align = 0; align < TEST_BUFLEN; ++align) {
>>     +	for (align = 0; align < TEST_BUFLEN; align += SUPPORTED_ALIGNMENT) {
>>      		memcpy(&tmp_buf[align], random_buf,
>>      		       min(MAX_LEN, TEST_BUFLEN - align));
>>      		for (len = 0; len < MAX_LEN && (align + len) < TEST_BUFLEN;
>>     @@ -513,7 +515,7 @@ static void test_csum_all_carry_inputs(struct kunit *test)
>>      	assert_setup_correct(test);
>>      	memset(tmp_buf, 0xff, TEST_BUFLEN);
>>     -	for (align = 0; align < TEST_BUFLEN; ++align) {
>>     +	for (align = 0; align < TEST_BUFLEN; align += SUPPORTED_ALIGNMENT) {
>>      		for (len = 0; len < MAX_LEN && (align + len) < TEST_BUFLEN;
>>      		     ++len) {
>>      			/*
>>     @@ -553,7 +555,7 @@ static void test_csum_no_carry_inputs(struct kunit *test)
>>      	assert_setup_correct(test);
>>      	memset(tmp_buf, 0x4, TEST_BUFLEN);
>>     -	for (align = 0; align < TEST_BUFLEN; ++align) {
>>     +	for (align = 0; align < TEST_BUFLEN; align += SUPPORTED_ALIGNMENT) {
>>      		for (len = 0; len < MAX_LEN && (align + len) < TEST_BUFLEN;
>>      		     ++len) {
>>      			/*
>>
>> but I haven't even build tested it...
> 
> This doesn't fix the test_csum_ipv6_magic test case that was causing the
> initial problem, but the same trick can be done in that test.
> 

The above didn't (and still doesn't) fail for me. The following fixes the problem.
So, yes, I guess the problem has to do with alignment. I don't know if NET_IP_ALIGN
would do the trick, though - it works, but it seems to me that the definition of
NET_IP_ALIGN is supposed to address potential performance issues, not mandatory
IP header alignment.

Thanks,
Guenter

---
diff --git a/lib/checksum_kunit.c b/lib/checksum_kunit.c
index 225bb7701460..c8730af2a474 100644
--- a/lib/checksum_kunit.c
+++ b/lib/checksum_kunit.c
@@ -591,6 +591,8 @@ static void test_ip_fast_csum(struct kunit *test)
         }
  }

+#define SUPPORTED_ALIGNMENT (1 << NET_IP_ALIGN)
+
  static void test_csum_ipv6_magic(struct kunit *test)
  {
  #if defined(CONFIG_NET)
@@ -607,7 +609,7 @@ static void test_csum_ipv6_magic(struct kunit *test)
         const int csum_offset = sizeof(struct in6_addr) + sizeof(struct in6_addr) +
                             sizeof(int) + sizeof(char);

-       for (int i = 0; i < NUM_IPv6_TESTS; i++) {
+       for (int i = 0; i < NUM_IPv6_TESTS; i+=SUPPORTED_ALIGNMENT) {
                 saddr = (const struct in6_addr *)(random_buf + i);
                 daddr = (const struct in6_addr *)(random_buf + i +
                                                   daddr_offset);



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
