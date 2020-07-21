Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C71CC433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 12:18:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD81621702
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 12:18:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YeYupbgr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1bGCE8E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD81621702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OJxX/bGOE6A57DYFTi31zJNqMgaUqWIT32j2SpqKuHw=; b=YeYupbgror1YcT23ENVhjoTZW
	eJx5oSb357/cHSUwWEZgtd4ETQiARuRPqjQa8fbQ0cizEJKkDsbag0FBEB3ZyxIQbzC6pc+QA0MKQ
	TRTxry0ZSKrwHVlUFLRFg+Shfew6NJskCbE3lFZz+ACZbY6TgwCqEHWUHVIFSg84qDMepRsb5Wujs
	fc3f9c/q1MgwLnjyfufdBDNmrlrgR3nhJZqQjlWxOG6MAmTVyltBuULddzvXtClYSTOuhz16yqOgJ
	uuPJaiwhHGHdVKQXBT/geyZxLoH5H/xldqNB56xKr5yEs1rLsazkPTtF4lq8OpbjRVQ14rjhZTRmV
	JTtgPg5jA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxrDi-0002b4-Ms; Tue, 21 Jul 2020 12:18:06 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxrDf-0002Zr-WF
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 12:18:04 +0000
Received: by mail-qv1-xf43.google.com with SMTP id t7so9175567qvl.8
 for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2020 05:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bXPYZoz1OZvFJbxoCWlNL9817NOB+zxWWBK3hJr5qF0=;
 b=q1bGCE8EcEkb1VR8sk6YW4pGfBsPhbbNXM39cJ/a8oyNHDSzyC5IIgzzr1p9F/bUU6
 Ss70SU+nK1LAxIv5y0ilgsQGGUiOKY8IczcGMPdWyzM8gf3SpFQc9T0l+yVsrUw3RhuF
 NbEa1LdB6i7768zAYEPTE/W8Imh2VDNsQQf+5w70nCKP8wyVLZidby3MjIfYjurQ8lng
 xv0leU8swMonzqB+wQqkBmGYxQDeSCwRnFfk9IG7i1SfrMAEdceoP5VNu/1vwR9ZOxyS
 VCMxuOOXGwDFXZ/bZR9OB1H3DMvVUFoetXGW9Ok9IvfTgEpNbV5oqQnvRGi3znMie2Iy
 DCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bXPYZoz1OZvFJbxoCWlNL9817NOB+zxWWBK3hJr5qF0=;
 b=rKKYHKjtqekQorzX/cdQepDGGxT8Jk4YJvCeq8mESNrNKfQoxhv2oQqwwd9qe46qrb
 EfcjGMTV5gJG7j1n4tF8iscXuw48b8XrwuvaRZLTokSgI5o6304Htscz3n3vjpsyzpHb
 Vfps6yozT89hgda7prcNdP87lov0MfKAcvvQ/32lRNY5QUqaJzDzU08gMTqaE5B2Qznc
 GSmJ/wi+Q/jZWosldvbsIJp3GKax7AQzA85hNDloH13n8t7UJy6a7+nzF9Dbt85TgNce
 Egmc0wEzjxRroFcamyJhZeN1152PZFEsNi78yqzSJbTTDraw7s1dWvZ5zF70cEt23K/K
 NMTQ==
X-Gm-Message-State: AOAM533fUZGJpe3u4OliNsLQNYDL8YF4YRoNvRs3K1FB/bsa8hTqTJoJ
 024aOTH7uPj9ccl+DBytudk=
X-Google-Smtp-Source: ABdhPJyg2qSJU16N5LW7VVnZ8y/kne9TdZ7vhlLgF/dUSXi0dI55cSFhFxUmyfR71XwFyOPnfUGc6A==
X-Received: by 2002:a0c:8643:: with SMTP id p61mr26743630qva.43.1595333881577; 
 Tue, 21 Jul 2020 05:18:01 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id t35sm24309428qth.79.2020.07.21.05.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 05:18:00 -0700 (PDT)
Subject: Re: [PATCH v4 4/4] dt-bindings: timer: Add CLINT bindings
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>
References: <20200717075101.263332-1-anup.patel@wdc.com>
 <20200717075101.263332-5-anup.patel@wdc.com>
 <CAOnJCULcffij3-d-TsQixj5TZdatBdUcC-y73L=W-+5h41ytKQ@mail.gmail.com>
 <CAAhSdy1cbKA9iwBPYMX5xaYFe_BxnB2Sm_ftHPPDq+96SeKbnA@mail.gmail.com>
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
 w8jpXnbEPQN3A2ZJCbeMuQENBF0/k2UBCADhvSlHblNc/aRAWtCFDblCJJMN/8Sd7S9u4ZRS
 w1wIB4tTF7caxc8yfCHa+FjMFeVu34QPtMOvd/gfHz0mr+t0PiTAdDSbd6o7tj+g5ylm+FhT
 OTUtJQ6mx6L9GzMmIDEbLxJMB9RfJaL2mT5JkujKxEst6nlHGV/lEQ54xBl5ImrPvuR5Dbnr
 zWQYlafb1IC5ZFwSMpBeSfhS7/kGPtFY3NkpLrii/CF+ME0DYYWxlkDIycqF3fsUGGfb3HIq
 z2l95OB45+mCs9DrIDZXRT6mFjLcl35UzuEErNIskCl9NKlbvAMAl+gbDH275SnE44ocC4qu
 0tMe7Z5jpOy6J8nNABEBAAGJATwEGAEKACYWIQSQYR1bzo1I0gPoYCg+6I/stKEQbgUCXT+T
 ZQIbDAUJAeEzgAAKCRA+6I/stKEQbjAGB/4mYRqZTTEFmcS+f+8zsmjt2CfWvm38kR+sJFWB
 vz82pFiUWbUM5xvcuOQhz698WQnIazbDGSYaOipyVNS52YiuYJDqMszzgw++DrcSuu0oRYWN
 EWCkJjxMqjGg8uY0OZ6FJG+gYRN5wMFErGfV1OqQ7l00FYA9OzpOEuW9PzPZEutFnAbbh77i
 zvxbQtT7IJCL24A4KutNYKmWg98im4mCzQcJCxE86Bv69ErLVPUyYbp4doLadScilXlvkkjL
 iq1wOt3rRzOuw+qnWVgWGBPxdDftz0Wck941tYF9XE0aMgkf4o1sGoDZFUFPCQdfEYPzzV7O
 S5hN3/mP5UeooFHb
Message-ID: <b2d7b1d6-db33-7b40-9511-95de991e9ad6@gmail.com>
Date: Tue, 21 Jul 2020 08:17:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy1cbKA9iwBPYMX5xaYFe_BxnB2Sm_ftHPPDq+96SeKbnA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_081804_053308_7D097432 
X-CRM114-Status: GOOD (  18.59  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Emil Renner Berhing <kernel@esmil.dk>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/20/20 9:15 PM, Atish Patra wrote:
> On Fri, Jul 17, 2020 at 12:52 AM Anup Patel <anup.patel@wdc.com> wrote:
>>
>> We add DT bindings documentation for CLINT device.
>>
>> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> Tested-by: Emil Renner Berhing <kernel@esmil.dk>
>> ---
>>  .../bindings/timer/sifive,clint.yaml          | 58 +++++++++++++++++++
>>  1 file changed, 58 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> new file mode 100644
>> index 000000000000..8ad115611860
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/timer/sifive,clint.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: SiFive Core Local Interruptor
>> +
>> +maintainers:
>> +  - Palmer Dabbelt <palmer@dabbelt.com>
>> +  - Anup Patel <anup.patel@wdc.com>
>> +
>> +description:
>> +  SiFive (and other RISC-V) SOCs include an implementation of the SiFive
>> +  Core Local Interruptor (CLINT) for M-mode timer and M-mode inter-processor
>> +  interrupts. It directly connects to the timer and inter-processor interrupt
>> +  lines of various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local
>> +  interrupt controller is the parent interrupt controller for CLINT device.
>> +  The clock frequency of CLINT is specified via "timebase-frequency" DT
>> +  property of "/cpus" DT node. The "timebase-frequency" DT property is
>> +  described in Documentation/devicetree/bindings/riscv/cpus.yaml
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: sifive,clint0
>> +      - const: sifive,fu540-c000-clint
>> +
>> +    description:
>> +      Should be "sifive,<chip>-clint" and "sifive,clint<version>".
>> +      Supported compatible strings are -
>> +      "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
>> +      onto the SiFive FU540 chip, and "sifive,clint0" for the SiFive
>> +      CLINT v0 IP block with no chip integration tweaks.
>> +      Please refer to sifive-blocks-ip-versioning.txt for details
>> +
> 
> As the DT binding suggests that the clint device should be named as "sifive,**",
> I think we should change the DT property in kendryte dts as well.

The kendryte device is based on Rocket Chip, not any SiFive IP/device.
If anything, the general binding should be "chipsalliance,clint" and the
specific bindings should be "sifive,clint" and "kendryte,clint" (or
"canaan,clint").

--Sean

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
