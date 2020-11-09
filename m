Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF94CC388F7
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:49:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 325D920853
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:49:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uni4m0CS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e694j70u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 325D920853
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GqnehpKf4mVirgjLuojcdmgS61f3rWcXWzDGFi7t4yM=; b=Uni4m0CS41P19jojZA1v6mJSf
	jc1Z8WsHLJMylOK9ie2fQ3mtEoWtEX4N932y9tCuY1/4jkpE2DndunXXyHk9wH9Ir0gu9Ts1StygD
	g/whG47xCuc5UiHG8RJBmaj/xlUOPN6O33YqTTPD2QrhnUpjqRF6MhLdcSWyEtGWs+N6qF4praMzs
	IyxLzS0av4gb5YFFKpPnSkCDotnNbH8pWC9K0vbKW/VGILwASzx6qN1IKJF4UQe92uJmg3CD0WpLL
	h+2igXhbU1eqoHidMC1RwTT7BAzT0R8j/DzFfUWrUSm6VMx06BEiYgIHj2RHprQe1Gg03Vox0L8pB
	lZbXs9geA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc8U0-00081l-Ib; Mon, 09 Nov 2020 14:49:24 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc8Ty-000816-AQ
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 14:49:23 +0000
Received: by mail-qt1-x841.google.com with SMTP id v11so5714918qtq.12
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 06:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l2UTPfjMOy4W/99qQHXOpF1Lpnf53K1hsAMO22jvIkY=;
 b=e694j70uTcmP3PIO7aPqHeFYsM6YllddqDAzZr1cXTDGdP5GV31JlqTiGFOGK7WwXJ
 yVZ2bkJ4fZkdLuj2ZcIfqRVTQrjvtriS+Cv+6CuOS8y4MfJtoPRFXdKe1lwjw3CiM/2x
 z+mkAv0KcHb391bjam54gdM2ODfWH6qVZisIQXTLuNB71Yz9ouCRIHCN3AGi5Unj97YU
 LKnusTZeQFNoDADrnNx5attcaYoj6GMheflr3Ml4io48C/Jn41V/falwIU+Dnq8L6n5R
 rMoa73GTwWypCkxL1QPG7PHsPRVjjcKb66vQ2hf9U3zmncgGH/6N/RgsE3BFmKRYUDo9
 p2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=l2UTPfjMOy4W/99qQHXOpF1Lpnf53K1hsAMO22jvIkY=;
 b=N9XcyAk32b+mdRIH+iIlfz+Y2THUWkTHr4zTR3e/lpx8rR5RvsMxjyoJRfnsBikm1O
 bIkYUsB/YkR7ZbYr5T4LvN/V3PYzKQH9C0eyvNhRaKCF1bv2cd3mjQ6ZGIccSDrPnv64
 BYqBxHEb8YMrzbqaC5khunn3CNNO9+oHlUGl7ERMQ5WoinGLT5WC3KCSn9q9eRebddig
 QuSYqYjOtZrXxcIsHkSSCql9oNLAx5jTmP8uXjKklXWEBPgc+4naorOavRbkz8zNTRR7
 78h9FuMLaJQyy84AeqRBBAovkn2LlDVKL14Wg2S9MMFQReL86S8butfvW6N7jo36Yahd
 gwTA==
X-Gm-Message-State: AOAM532dKxM65MvBVTnx45CK4o6NOKxiyr1mVj+DlcworeS7sX4gK4kj
 Q1lt4iyag4s2qGxBxg6qRM8=
X-Google-Smtp-Source: ABdhPJwudeu3VY4+R4JvfKhFzFtuA6XAa0PXz5m/Acmue+Jt3OltUI7YziPpbKc1TVe9+di/2uPvlA==
X-Received: by 2002:ac8:3499:: with SMTP id w25mr13388711qtb.44.1604933360938; 
 Mon, 09 Nov 2020 06:49:20 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id q20sm5956338qtn.80.2020.11.09.06.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 06:49:20 -0800 (PST)
Subject: Re: [PATCH 02/32] spi: dw: Add support for 32-bits ctrlr0 layout
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-3-damien.lemoal@wdc.com>
 <20201109142529.tt5ojjyn36vd3ohe@mobilestation>
 <6dc6d52e-a39d-c351-5280-71b9e8eafe37@gmail.com>
 <CAHp75VejtoTRAM1JmGib3OaJwzuw9Bb-qb08+XhdZUOuzTGUKw@mail.gmail.com>
 <CAHp75Vc+h5PCqBUnyFshw8RE4zWusE+zdvKKSxBxfFw1_5k0vQ@mail.gmail.com>
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
Message-ID: <7e8bba71-763e-2e09-88d2-d736a56a6920@gmail.com>
Date: Mon, 9 Nov 2020 09:49:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc+h5PCqBUnyFshw8RE4zWusE+zdvKKSxBxfFw1_5k0vQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_094922_403930_A9B0540F 
X-CRM114-Status: GOOD (  19.65  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, Stephen Boyd <sboyd@kernel.org>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 Frank Rowand <frowand.list@gmail.com>, linux-clk <linux-clk@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/9/20 9:41 AM, Andy Shevchenko wrote:
> On Mon, Nov 9, 2020 at 4:40 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>>
>> On Mon, Nov 9, 2020 at 4:34 PM Sean Anderson <seanga2@gmail.com> wrote:
>>> On 11/9/20 9:25 AM, Serge Semin wrote:
>>>> On Sat, Nov 07, 2020 at 05:13:50PM +0900, Damien Le Moal wrote:
>>
>> ...
>>
>>>> Are you sure they have been moved from [0, 3] to [16, 20]? I don't have the
>>>> manual for the 4.0x version of the core, but according to this patch:
>>>> https://patchwork.kernel.org/project/spi-devel-general/patch/1575907443-26377-7-git-send-email-wan.ahmad.zainie.wan.mohamad@intel.com/
>>>> it has been ok to use the lowest four bits for DFS setting. Is the commit
>>>> message misleading there?
>>>
>>> This commit message is a truncated version of [1].
>>
>> I don't see how they are related.

I think this commit message is specifically taken from v3 of that patch
[2]. However, I had not gotten a chance to have a look at the datasheet
at that point, so it is a bit misleading (e.g. showing dfs for devices
with SSI_MAX_XFER_SIZE=32, even though it is all zeros for those
devices). In any case, the diagram is taken from that patch.

[2] https://patchwork.ozlabs.org/project/uboot/patch/20200914153503.91983-7-seanga2@gmail.com/

> 
> For DW_ssi v1.x DFS is always for transfers up to 32-bit.

Do you mean DWC_ssi?

> 
>>> Importantly, DFS is
>>> valid when SSI_MAX_XFER_SIZE=16. When it =32, then DFS_32 must be used
>>> (since DFS is constant 0xF). Since SSI_MAX_XFER_SIZE is a synthesis
>>> parameter, there exist devices where DFS must be used, and also where
>>> DFS_32 must be used.
>>>
>>> [1] https://patchwork.ozlabs.org/project/uboot/patch/20201016225755.302659-10-seanga2@gmail.com/
> 
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
