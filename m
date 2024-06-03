Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5315C25B75
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 17:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Pm+KQRFIhofvb8k2w2uuEAP1BbMpfPhoDeTynSCK7gk=; b=jXdMoLpMZwRHoELbc/RMy8xU3T
	0EUrxnOvBojxCJjXt/L9K9lJVWGlR5usYMR/Xnwu7unmJyKlP0wbfAQedARd2349oJpszatgConFg
	UL7qOJdgFuuztxRjC4L7f1BbfwFCbE3isImP5CEYpm3XV07pt3vJn1x4Yh+24Y51gPlRwCoVzXPVL
	Fu3oiDPjCLX/jaVeAYGOm+2shmoTnvTg1VAHKmLO3Un8vpfA2ZWOkixfEgRgJp2Vnex9cJq2akN6Q
	yfOgmSF8Q6ctLTG6dYGEmNY1TkO1LMpzvMY3TUh0j5Jvkn5nmG99BiuOo6r/Jy8A8asn/9z26tf+g
	fixmIJAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEBw3-0000000HZ15-3IJ0;
	Mon, 03 Jun 2024 17:57:31 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEBw0-0000000HZ0g-1rO1
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 17:57:30 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-701ae8698d8so3553708b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jun 2024 10:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1717437445; x=1718042245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AfdW5qoP/0PIY+SC/1psi3LxiYm3n/ljuaAM9YxX4M=;
        b=CR3Shy8oFP0rw00KFN9X1EoYUCHHqeyQGC5QsDr4fz6tLxflfjL2GGhDtqi/UmLD1A
         CRag2U6H9Rc3NBJdrPpFgd9ynEelHVa7yNLDWe1wt+bRDilSHi3PqOXYbsHBdwY4dGQQ
         CBA1/uykc1KNSleDUgx8Gn4gjD11dwy0o6WsfJz6YJKnzceTlLP7htZsDnouGCY4uNjq
         6XHNmUVpWMUfdariyXlekqepjT1oFifY1PYeWBQj22920YRzCiQC5zyUla0v0GdtBRwt
         agBFIFAnzYHayOydiJwIdMJO6UJENN6A90lCRWTE/WNhNxrzw9zPxPHPEvS/ayLjQ53e
         f46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717437445; x=1718042245;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AfdW5qoP/0PIY+SC/1psi3LxiYm3n/ljuaAM9YxX4M=;
        b=rWcvN5R45R+NZCbk2h2RX2nbvtVCmaAGzxulMoiyo8/01+iwxILZj01L7+1O3dPNLj
         DRmtcCX0r7R3W4HKRceQe4tjopThl21UGVIg79XBeEYHkKOPvMnU5XzS0di5vKubgYVc
         T6NYQDdhYpZkLJKY+2uzWUKoZv15oW7JrvZtgJPQaYDqrxo4UA5JJCgasizFm1hfCp84
         J73h7yJaxZ7UoD9gnAqDifHP23A11k0yhZ83sJcxod6Idvp6nsja0XIDf3TzscacEll/
         GFWJb6XMrm6zT4FfAC6nHsct6alxxustnKkjJvK6GbIFh0Z9iBi3NY17FycRmaqN0LSJ
         L/gw==
X-Forwarded-Encrypted: i=1; AJvYcCWMMaZj7JnDvKvu7bSj75+B03ZXeJiMNCbmi+OZYNmDM/hhv7jE2pRhRemdn8/8nYbpf+DRBwsBsv/vilURJn8RvwuyoeE2Xw96ORULyffK
X-Gm-Message-State: AOJu0YxrgixN1AmKaCVGd/h5AG1cKwOXhr5HqvDsmu59P5K99Ao+wlbF
	9htylie42jyY8lSTDt8iN0laRG3xZBQmgF5KScjlaimFXefEw8bOvc89bOKmWoI=
X-Google-Smtp-Source: AGHT+IHjqwamL2Li7UNo0vbbf3pvHjHTMgtLxIt2g57XM15Bv2yYajt08yUZOGxWAa5WYK73aQGQ+A==
X-Received: by 2002:a05:6a20:320d:b0:1b1:f7a1:df91 with SMTP id adf61e73a8af0-1b26f296e46mr8189210637.61.1717437445325;
        Mon, 03 Jun 2024 10:57:25 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423cb712sm5756476b3a.22.2024.06.03.10.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 10:57:21 -0700 (PDT)
Date: Mon, 03 Jun 2024 10:57:21 -0700 (PDT)
X-Google-Original-Date: Mon, 03 Jun 2024 10:57:19 PDT (-0700)
Subject: Re: [PATCH] RISC-V: hwprobe: Add MISALIGNED_PERF key
In-Reply-To: <tencent_C5BBD6F106D73F662084BD91904F54504805@qq.com>
CC: Evan Green <evan@rivosinc.com>, aou@eecs.berkeley.edu, ajones@ventanamicro.com,
  andy.chiu@sifive.com, cleger@rivosinc.com, Conor Dooley <conor.dooley@microchip.com>,
  costa.shul@redhat.com, corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
  samitolvanen@google.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: cyy@cyyself.name
Message-ID: <mhng-d3cf0bb4-4881-4f71-b1d1-6bb756d5c4ef@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_105728_513790_BE0B30F5 
X-CRM114-Status: GOOD (  36.75  )
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

On Wed, 29 May 2024 20:36:45 PDT (-0700), cyy@cyyself.name wrote:
> On 2024/5/30 02:26, Evan Green wrote:
>> RISCV_HWPROBE_KEY_CPUPERF_0 was mistakenly flagged as a bitmask in
>> hwprobe_key_is_bitmask(), when in reality it was an enum value. This
>> causes problems when used in conjunction with RISCV_HWPROBE_WHICH_CPUS,
>> since SLOW, FAST, and EMULATED have values whose bits overlap with
>> each other. If the caller asked for the set of CPUs that was SLOW or
>> EMULATED, the returned set would also include CPUs that were FAST.
>> 
>> Introduce a new hwprobe key, RISCV_HWPROBE_KEY_MISALIGNED_PERF, which
>> returns the same values in response to a direct query (with no flags),
>> but is properly handled as an enumerated value. As a result, SLOW,
>> FAST, and EMULATED are all correctly treated as distinct values under
>> the new key when queried with the WHICH_CPUS flag.
>> 
>> Leave the old key in place to avoid disturbing applications which may
>> have already come to rely on the broken behavior.
>> 
>> Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")
>> Signed-off-by: Evan Green <evan@rivosinc.com>
>> 
>> ---
>> 
>> 
>> Note: Yangyu also has a fix out for this issue at [1]. That fix is much
>> tidier, but comes with the slight risk that some very broken userspace
>> application may break now that FAST cpus are not included for the query
>> of which cpus are SLOW or EMULATED.
>
> Indeed. Since the value of FAST is 0b11, the SLOW and EMULATED are 0b10 and
> 0b01 respectively.
>
> When this key is treated as a bitmask and query with
> RISCV_HWPROBE_WHICH_CPUS if a CPU has a superset bitmask of the requested
> value on the requested key, it will remain in the CPU mask. Otherwise, the
> CPU will be clear in the CPU mask. But when a key is treated as a value, we
> will just do a comparison. if it is not equal, then the CPU will be clear
> in the CPU. That's why FAST cpus are included when querying with SLOW or
> EMULATED with RISCV_HWPROBE_KEY_CPUPERF_0 key now.
>
> For me, deprecating the original hwprobe key and introducing a new key
> would be a better solution than changing the behavior as my patch did.

OK.  I don't have a strong feeling either way: if someone has code that 
tries to read this as a btimask then it'd be broken, but it would 
technically be following the docs.

That said, we're relying on this as a pretty core userspace portability 
construct.  So maybe the right answer here is to just be really strict 
about compatibility and eat the pain when we make a mistake, just to 
make sure we set the right example about not breaking stuff.

So unless anyone's opposed, I'll pick this up for 6.11.

>> I wanted to get this fix out so that
>> we have both as options, and can discuss. These fixes are mutually
>> exclusive, don't take both.
>
> It's better to note this strange behavior on
> Documentation/arch/riscv/hwprobe.rst so users can quickly understand the
> differences on the behavior of these two keys.
>
> The C code part looks good to me.
>
>> 
>> [1] https://lore.kernel.org/linux-riscv/tencent_01F8E0050FB4B11CC170C3639E43F41A1709@qq.com/
>> 
>> ---
>> Documentation/arch/riscv/hwprobe.rst | 8 ++++++--
>> arch/riscv/include/asm/hwprobe.h | 2 +-
>> arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>> arch/riscv/kernel/sys_hwprobe.c | 1 +
>> 4 files changed, 9 insertions(+), 3 deletions(-)
>> 
>> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
>> index 204cd4433af5..616ee372adaf 100644
>> --- a/Documentation/arch/riscv/hwprobe.rst
>> +++ b/Documentation/arch/riscv/hwprobe.rst
>> @@ -192,8 +192,12 @@ The following keys are defined:
>> supported as defined in the RISC-V ISA manual starting from commit
>> d8ab5c78c207 ("Zihintpause is ratified").
>> 
>> -* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
>> - information about the selected set of processors.
>> +* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated. Returns similar values to
>> + :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`, but the key was mistakenly
>> + classified as a bitmask rather than a value.
>> +
>> +* :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`: An enum value describing the
>> + performance of misaligned scalar accesses on the selected set of processors.
>> 
>> * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
>> accesses is unknown.
>> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
>> index 630507dff5ea..150a9877b0af 100644
>> --- a/arch/riscv/include/asm/hwprobe.h
>> +++ b/arch/riscv/include/asm/hwprobe.h
>> @@ -8,7 +8,7 @@
>> 
>> #include <uapi/asm/hwprobe.h>
>> 
>> -#define RISCV_HWPROBE_MAX_KEY 6
>> +#define RISCV_HWPROBE_MAX_KEY 7
>> 
>> static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>> {
>> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
>> index dda76a05420b..bc34e33fef23 100644
>> --- a/arch/riscv/include/uapi/asm/hwprobe.h
>> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
>> @@ -68,6 +68,7 @@ struct riscv_hwprobe {
>> #define RISCV_HWPROBE_MISALIGNED_UNSUPPORTED (4 << 0)
>> #define RISCV_HWPROBE_MISALIGNED_MASK (7 << 0)
>> #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE 6
>> +#define RISCV_HWPROBE_KEY_MISALIGNED_PERF 7
>> /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>> 
>> /* Flags */
>> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
>> index 969ef3d59dbe..c8b7d57eb55e 100644
>> --- a/arch/riscv/kernel/sys_hwprobe.c
>> +++ b/arch/riscv/kernel/sys_hwprobe.c
>> @@ -208,6 +208,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>> break;
>> 
>> case RISCV_HWPROBE_KEY_CPUPERF_0:
>> + case RISCV_HWPROBE_KEY_MISALIGNED_PERF:
>> pair->value = hwprobe_misaligned(cpus);
>> break;
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
