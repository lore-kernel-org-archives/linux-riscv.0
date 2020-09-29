Return-Path: <SRS0=aBv4=DG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD759C4727D
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 23:41:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DBF020773
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 23:41:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qB3XOlK9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r8Kk76kH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DBF020773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zM3aB1N2jXpZ7XYu7Kh629FemYMyIT68Gji6nDwLzqc=; b=qB3XOlK9XreW7OXAjO8vog94T
	quU1Hw42sGDNjW5gtCNO3mNkbZnWxOz6aHYucm15e3uYg+KTYH2py/5ik+tOD6e5CHWaPaFqeH6P7
	IqUn2FLwiryO1HzkXA7mL8ndI/B37MkX335FxBejIIGhxF04fOhNQr5y14hxaJ2UkXuEJEAUjTXnC
	WycQN9S5vUWqmIlaaHrOp4RkK8bj0WG+C5jLoqVUmpmQ1ChzENritOf4aGFtpAkSwh5zYHj+24hy2
	AXlYi5pX5q2/6nswo8cSIhDOuWdP3PdJtDeKNNPTQRpE+Q6ynx5hRH6+C0KdkDJPRqW41Ry7qX9bG
	1UtZgm7HA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNPFZ-0000PE-QN; Tue, 29 Sep 2020 23:41:37 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNPFX-0000OC-VG
 for linux-riscv@lists.infradead.org; Tue, 29 Sep 2020 23:41:36 +0000
Received: by mail-qk1-x732.google.com with SMTP id v123so6307098qkd.9
 for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2020 16:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/2x+Nv+LMDCWbkwUtqQX+PXyNJILMvyCaXoXl5TbSy4=;
 b=r8Kk76kH41bXKK3qlyid6hBIpbcs6ogGcEx5KtZxfow8+w3MaAizsFZKuRGiPaGmfx
 34Kze1bbu2WPjFKbpPLnPgYp+u3tSxUKz2men8ZF5itr4MTD7bzE32XC9gSBcjw1XO4I
 HxEqbjK1NaF/Pij2FEbw/WUD7Hvok1Q8yyAbQVXn19+qe0v448NA/xIhGlQFDxnoCEnh
 Y4L1m0ZQY2ZJz6/xOKw6xdGt8azSodGkX9RU/oqxTFc7rnNnZAkAU2a37/P53blnSi+A
 lEyD39557HR2KRmqURbnLyFvdfxQuwgWYCGKqSH33DkiQv7n8PGYkJJBKSL5fnxJuorE
 iW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/2x+Nv+LMDCWbkwUtqQX+PXyNJILMvyCaXoXl5TbSy4=;
 b=onOU8y+9ra7a4pMeCmIC8FmQSCE2zRT6rPywkmNbW1uSv7LOLdzrPIaJb9Y/TQT+34
 noIv9xVzbO8rTEG4d71beIOk5+qHXczD0Sw2hRJe+0r3P/1O6li3AiIxNz5nEk6o9dVh
 pTWmue2rowuw7vE3QdorysOmboY0N2+au+bxRNmUIDRJSDNj2/o9/opZDqKFsFnNJG7h
 YFBKxXNLBuJ6MnSDEoqMS2G0pEcJNnrLDqyjxD24ZSY0WGngqm/x3ap+zpwq1dwuXzQ1
 5EJFKtC9BeWQ75E9hxFwTUEtG4qy7cQXQZ1oCpkadJoh/Fm53R1kXfGzESr1rcktAFce
 wWiw==
X-Gm-Message-State: AOAM532FlpUm9LQzCDupZqZWd+2kjM2w+ter9HVZ7ZXg9YbCRPXyf+cX
 0fRlSR6eTzodCfmcCOBoDtoUpodj1S4Qiw==
X-Google-Smtp-Source: ABdhPJwgz273CEcFYjWtn3jycMida/YTfWZBzDtJwOQIj+m4a9hU3ZuPQ3Wn/mA60E9nPrsaePJWQg==
X-Received: by 2002:a37:314:: with SMTP id 20mr83168qkd.274.1601422891994;
 Tue, 29 Sep 2020 16:41:31 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id c1sm35105qta.86.2020.09.29.16.41.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2020 16:41:31 -0700 (PDT)
Subject: Re: RISC-V testing needs on HW?
To: Mohammed Billoo <mab@mab-labs.com>
References: <CALkjhPrHDHRsFDh9n864xvK4DKU2GW68_TcA-Tz17udsOWjbFg@mail.gmail.com>
 <883c0f38-e002-ce16-d196-933a8b700776@gmail.com>
 <CALkjhPr-wXSROT_bB2DA4N1jJT9B64_g9Q9xOHvckmeZYWm5Ng@mail.gmail.com>
 <ac581b64-601a-9766-2a9e-21d877407780@gmail.com>
 <CALkjhPodUMo0xHgGwwPq-75T_DcNJGe54OCWmE3VrqRWa2Fhhg@mail.gmail.com>
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
Message-ID: <9062ff02-6f93-5204-bc71-63e49134cadd@gmail.com>
Date: Tue, 29 Sep 2020 19:41:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CALkjhPodUMo0xHgGwwPq-75T_DcNJGe54OCWmE3VrqRWa2Fhhg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_194136_045404_BB85E00F 
X-CRM114-Status: GOOD (  16.90  )
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

On 9/1/20 5:08 PM, Mohammed Billoo wrote:
> I can access the memory regions without any issues. This is the output
> of a program I slapped together:
> 
> BusyBox v1.32.0.git (2020-09-01 14:37:15 EDT) hush - the humble shell
> Enter 'help' for a list of built-in commands.
> 
> / # memory_access
> Hello World
> Successfully opened /dev/mem
> 0x80700000: 0x0
> 0x80700001: 0x0
> 0x80700002: 0x0
> 0x80700003: 0x0
> 0x80700004: 0x0
> 0x40700000: 0x0
> 0x40700001: 0x0
> 0x40700002: 0x0
> 0x40700003: 0x0
> 0x40700004: 0x0
> 0x50440000: 0xff

Thanks for testing this. I eventually determined the cause of the bug
was due to not setting K210_PLL_EN.

> Looks like syscon is all 1s.

Hm, that's strange. I'll have to try that out myself.

> Is there some documentation on the K210 that has the register
> definitions?

There is no documentation of register definitions besides the SDK.

--Sean

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
