Return-Path: <SRS0=nmAS=CK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5931EC433E2
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2020 14:16:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21829206EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2020 14:16:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2IraLpEA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnT1Frza"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21829206EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2zg3wbd4pEgt0dDUV4mNf02aCGa6/+tUClzsWDnD/mw=; b=2IraLpEAqFBk2FnNMIPxpc/KN
	f1Lb00cOGGM8Xe2HYEgfP/ST2ny8dumPMzO/7n2KruaTwNkfzEKnSHfMmTgvFrDW3I5QTW6GYNGMX
	hfiEc3VV1jNVNh4kZ1EpFH9S1e8aho3hVElhbBm05Fi9BhuT0I8vGo1lKzd0lASVwqjWa5ShgNfwv
	/ObkbzX0vjXF2w6f3vwX7PKIbWXXO3fgf9g5zQV+QM/atxB0D3rJAKe/2462VjNNVzCoJssinwprj
	X3OtSd4SPUT4gh5Ns5pHZVrThi7tjIuAvZ4VuCyYz+wkSLJ/Lfe7cRy2zp+nRdTRvpjeEoYOQj1kd
	oYCfxMX5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD74z-0001z5-Da; Tue, 01 Sep 2020 14:16:09 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD74w-0001xo-Gv
 for linux-riscv@lists.infradead.org; Tue, 01 Sep 2020 14:16:07 +0000
Received: by mail-qt1-x842.google.com with SMTP id v54so967301qtj.7
 for <linux-riscv@lists.infradead.org>; Tue, 01 Sep 2020 07:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M3R3R+Ht58yzRtewGBXUF7z4HPQFUyodhCmHSQR4oVA=;
 b=MnT1FrzaMuFcyjnqqzjGEm0CNT4PF652ZjJwIVfC3oocD/l3ouYmpS8dooszPLROvn
 CL49TpUIDSLyHAB+Nnncd2ibmJbbTYX1Lk7SgooM/oeipJSL95LAlJaoDHle0gwTwRqr
 /8Htl7sv5Aa5WEUj9nTf2mSODC6V2gR0IG7mbNeOwonojb+sbyZxFAXXBZop39Rva66A
 eARj/uaqCp+l0Maxd3vNJeUL+u+lhj2icyYf1YL44y2izqrdoif2cVuU/bsjLE/Sh4ue
 fDpo/ORIQKr++LUBDMXkVu06S1hALr1XdU7pLKnEieK4UNscyAHIjfCtPKtQYEtFNWxw
 JdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=M3R3R+Ht58yzRtewGBXUF7z4HPQFUyodhCmHSQR4oVA=;
 b=knGpECqfPSMltn/yJMJ2utHcLFvL/TrOVUZQi1F1eo1GC9zPwvfUlZt3UmZUqO39qZ
 0w5QjATcz5FAoO0QzXi0qdFdf4h0rGJb3fsOtctLrNt5XtsOsQbvC2pb/rPsf72j7Z9p
 nCVczkZ51Jd6bY7jrtUb6JppHCabjpbo4hSnDKLYArIY3qqxpzVPTsFg5Kdz1BUEEMVD
 KMGQ0RPW6vNidJOqxJHGxoezK2glfp2necg4xVcPBTkgMAFIrQXZBQ59SOfXAFa1qr5X
 GlOWejAYZ48UL7UkPaIOT8KOjh41gtGXz9phGIGKQ9GAUYf9CCt6UqbpXJpcv42NVnXK
 tGFg==
X-Gm-Message-State: AOAM530XyxQM9aGcOSSKrraokM+6LXbl7b55FBiLrC0VUrgLeDKsMwNr
 WqtSROfXigX5bjNnZj5VnMTfdsTOrEo0Ng==
X-Google-Smtp-Source: ABdhPJxO93G3mZ4SJM40FqEpyEaLmQ487m6QuL6K1QfihObnxaP0PFRfoJlBti3PAsm41Hcw8v1GNQ==
X-Received: by 2002:ac8:450c:: with SMTP id q12mr2022860qtn.292.1598969764393; 
 Tue, 01 Sep 2020 07:16:04 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id l29sm1614180qtb.77.2020.09.01.07.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 07:16:03 -0700 (PDT)
Subject: Re: RISC-V testing needs on HW?
To: Mohammed Billoo <mab@mab-labs.com>
References: <CALkjhPrHDHRsFDh9n864xvK4DKU2GW68_TcA-Tz17udsOWjbFg@mail.gmail.com>
 <883c0f38-e002-ce16-d196-933a8b700776@gmail.com>
 <CALkjhPr-wXSROT_bB2DA4N1jJT9B64_g9Q9xOHvckmeZYWm5Ng@mail.gmail.com>
From: Sean Anderson <seanga2@gmail.com>
Autocrypt: addr=seanga2@gmail.com; prefer-encrypt=mutual; keydata=
 mQENBFe74PkBCACoLC5Zq2gwrDcCkr+EPGsT14bsxrW07GiYzQhLCgwnPdEpgU95pXltbFhw
 46GfyffABWxHKO2x+3L1S6ZxC5AiKbYXo7lpnTBYjamPWYouz+VJEVjUx9aaSEByBah5kX6a
 lKFZWNbXLAJh+dE1HFaMi3TQXXaInaREc+aO1F7fCa2zNE75ja+6ah8L4TPRFZ2HKQzve0/Y
 GXtoRw97qmnm3U36vKWT/m2AiLF619F4T1mHvlfjyd9hrVwjH5h/2rFyroXVXBZHGA9Aj8eN
 F2si35dWSZlIwXkNu9bXp0/pIu6FD0bI+BEkD5S7aH1G1iAcMFi5Qq2RNa041DfQSDDHABEB
 AAG0K1NlYW4gR2FsbGFnaGVyIEFuZGVyc29uIDxzZWFuZ2EyQGdtYWlsLmNvbT6JAVcEEwEK
 AEECGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4ACGQEWIQSQYR1bzo1I0gPoYCg+6I/stKEQ
 bgUCXT+S2AUJB2TlXwAKCRA+6I/stKEQbhNOB/9ooea0hU9Sgh7PBloU6CgaC5mlqPLB7NTp
 +JkB+nh3Fqhk+qLZwzEynnuDLl6ESpVHIc0Ym1lyF4gT3DsrlGT1h0Gzw7vUwd1+ZfN0CuIx
 Rn861U/dAUjvbtN5kMBqOI4/5ea+0r7MACcIVnKF/wMXBD8eypHsorT2sJTzwZ6DRCNP70C5
 N1ahpqqNmXe0uLdP0pu55JCqhrGw2SinkRMdWyhSxT56uNwIVHGhLTqH7Q4t1N6G1EH626qa
 SvIJsWlNpll6Y3AYLDw2/Spw/hqieS2PQ/Ky3rPZnvJt7/aSNYsKoFGX0yjkH67Uq8Lx0k1L
 w8jpXnbEPQN3A2ZJCbeM
Message-ID: <ac581b64-601a-9766-2a9e-21d877407780@gmail.com>
Date: Tue, 1 Sep 2020 10:16:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CALkjhPr-wXSROT_bB2DA4N1jJT9B64_g9Q9xOHvckmeZYWm5Ng@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_101606_635638_15F2812C 
X-CRM114-Status: GOOD (  18.47  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 9/1/20 10:14 AM, Mohammed Billoo wrote:
> On Tue, Sep 1, 2020 at 6:42 AM Sean Anderson <seanga2@gmail.com> wrote:
>> Can you test what happens when accessing ai ram (0x40600000-0x407FFFFF
>> and 0x80600000-0x807FFFFF)? I have two boards where this appears to lock
>> up the bus, but I have also heard it reported that accessing this area
>> of ram works fine. If it works for you, can you please also report what
>> your clock and reset settings are? Those should be controlled by the
>> syscon device at 0x50440000.
>>
>> The ai ram takes up 2M, which is a lot of memory on a board with 8M
>> total. It would be great to be able to use it when the KPU is not in
>> use, but I have been unable to access it correctly. I have been testing
>> mostly with U-Boot, but I experience the same problems when booting
>> Linux.
>>
>> --Sean
> 
> Sure, is this on the latest master or the 5.8 release?


Doesn't matter to me.

--Sean

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
