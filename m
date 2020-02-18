Return-Path: <SRS0=ifY+=4G=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89CBC3403F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2020 14:18:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E35B21D56
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2020 14:18:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U+IjBN6T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZH0aMZij"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E35B21D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vWNUOBjI0ShP+g8MC9NRSX0B/MvXGw2wGtPHtJoi9Qo=; b=U+IjBN6TK1sEwk
	W0ykZMJSGyDbvQXAflWndX5yvOonxIAE9EY8LswK+j/U0W9H9X6GPwIKySVEt8sMnEE1N/Sv3I4Do
	LZNOVbhqh1EFn5kxkxowCOsQGY6IWe8cli6vO62OXhuP9k4gg9cNEIWeanVWF6cUSRBOc2+ZeD+WF
	3EIIXciulaePtgdr+VTdBcgIoXJ5AKc6vfc7YaHfXDyNU4XUKJXgAULCONRbgVQOkvHbcRj3FdTsW
	AHwh1tiz6J+HyulnIVGE3jrB8SBC2xT/s1xyHYr6J3zLFxuLjM//3SEyWJ4xt7ILYd9yxb0Vle/yG
	31AfZmvcqGzvHVfsbHsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j43iC-0001Av-NG; Tue, 18 Feb 2020 14:18:56 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j43i9-0001A9-Qt
 for linux-riscv@lists.infradead.org; Tue, 18 Feb 2020 14:18:55 +0000
Received: by mail-qt1-x842.google.com with SMTP id n17so14573136qtv.2
 for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2020 06:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vWNUOBjI0ShP+g8MC9NRSX0B/MvXGw2wGtPHtJoi9Qo=;
 b=ZH0aMZijBOtjBkaRjI4JbVepDmcH3NLBw4vTXAi6OPOd0n51Kru1jinkjkOhDnFiBV
 hn3pH+qGcgwFih+EBMZ6f/R8RGF7VVWKTwyFdDj+jOX0Ph4HlfYL9iGkEBVqnAJdZ4Yr
 bnEgQ8zYybervXfKzXJZcxJfnv90WkGyW6gJ89jCzdLUroXgWJjA7ApQ3TzyjBhgF8Ey
 1hUXQ6hvBop72uAkzXhqRJAhMSoVjridtOy5NMsTijQWk/UMqeUc4/Z25fNObqeiRmbS
 gmodaqleLkjZSs9llxROMJ4NpPY9qi00rxpGq1OxYH6LBt3DM4DmxU7M3MAjg+5+I74U
 M5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vWNUOBjI0ShP+g8MC9NRSX0B/MvXGw2wGtPHtJoi9Qo=;
 b=olMFdhXODWAH+ccJDqdqurXK7Bo+X9KUdWAws6MC3zLw8d4kYd3s8LR0GjSS/6UQzB
 ho7cgf1LZz9sNiy6Iv4zmOp3bwKSXt9oprr3fRex18thAsuLUsuVDb3o9dF7HzjgKOsS
 YCwrweyFpx/2OAXmQS9zYoDqMYkWinMG2qriraUQBKPT+2iJhnB4nlDjsTIZ6oon/pbh
 O1Hw7s1El6oCV4+fHdl6YyTCN9hM8+DNfSQtSpVASThtjLLb1EE1Nn7VSMfjLd/5p09+
 iqM3oO7Q12t1pyPetStwoIK6UOzzZxBn1UR8htN3/zNSsXZNE4zgaRx28g96mTW7FVwj
 wmGw==
X-Gm-Message-State: APjAAAV7tiTjdrbWNW//07RxMwEji26hmrlI8uByWbdepA3Uf27WD7rs
 GMqQ+lvDB0tMHwvtOwSFeSU=
X-Google-Smtp-Source: APXvYqzVeyrCxez6oxEqaX+aWnWE551URTWrerjZWlPwPblhHbMum1pGSAk+Bjx20K+ph3UtUQpv3A==
X-Received: by 2002:ac8:1c48:: with SMTP id j8mr17654850qtk.67.1582035532033; 
 Tue, 18 Feb 2020 06:18:52 -0800 (PST)
Received: from [192.168.1.117] ([75.102.135.197])
 by smtp.googlemail.com with ESMTPSA id g26sm1940035qkk.68.2020.02.18.06.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2020 06:18:51 -0800 (PST)
Subject: Re: [PATCH 08/10] riscv: Add Kendryte K210 device tree
To: Carlos Eduardo de Paula <me@carlosedp.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>
References: <20200212103432.660256-1-damien.lemoal@wdc.com>
 <20200212103432.660256-9-damien.lemoal@wdc.com>
 <48e10b3d-12f3-a65c-8017-99c780c63040@gmail.com>
 <BYAPR04MB581671F46D3FE67FD3C8B2B7E7140@BYAPR04MB5816.namprd04.prod.outlook.com>
 <bd74c841-2447-2f11-f924-a501230b3927@gmail.com>
 <BYAPR04MB5816ED294439828E562EB085E7140@BYAPR04MB5816.namprd04.prod.outlook.com>
 <CADnnUqe3AbTStJg9LS4qupH-OnBDGjuEFbnX8EXW8MUr4kwoGQ@mail.gmail.com>
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
Message-ID: <19e78a77-4b7f-a057-eb6e-7384f3fc67c1@gmail.com>
Date: Tue, 18 Feb 2020 09:18:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CADnnUqe3AbTStJg9LS4qupH-OnBDGjuEFbnX8EXW8MUr4kwoGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_061853_898632_97BBC7B5 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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
Cc: orionwl@x0f.org,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/18/20 9:12 AM, Carlos Eduardo de Paula wrote:
> Maybe it's a known thing but I found an MMU implementation here:
> https://gist.github.com/44670/0d8c152df7c5b59d17d469aba4dda0e5

Yeah, that's part of the evidence which convinced me to research the vm
capabilities of the k210 after I saw Christoph's series was NOMMU.

> Comes from as fork of the sdk here https://github.com/44670/libk9
> implementing also the LCD and other peripheral support.
> 
> Might help out adding support to it.

Hmm, maybe. I've been wrangling a bit trying to get the SD card slot to
work.

--Sean

