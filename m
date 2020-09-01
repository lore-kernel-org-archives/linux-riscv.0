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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC9AC433E2
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2020 10:43:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D30C206FA
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2020 10:43:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X3viOZZg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pYcOSlbN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D30C206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pn6eD/Qc9/qx3tE4a4ngMrEkqna3odZ14dRcU+mVOu8=; b=X3viOZZgNKeRdSTCGTKZG6BmOK
	7tleT6QN2o4ulqr+XgN7OjMb9VCMXcPSAQy9dhNTsPFut8aqDbt4CNtbesgMoVIQ8KgbKMliVCQqi
	wGBGYi2IL9LT2iAELCOsCQgJO07Xtwsg1LILs4NABpUbo+ZcSvfxT2CqTr6hZqLX3aRwazpnrwqY4
	3ezyLvTPjB+lTBSF0yaxZZiOZPievRSggBt4fdCAkIquA71qS1ozMv/Ec8c1vxPCx3rm37FeWabRF
	tskWHBzygBWR0mrLLwlmRmd0jiPjSOxFuWE8GIxF9WV/Kj6UQYIuV2cUZhi2a1/AVgq7WUNMNmv2y
	ePjjR4JQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD3ko-00016C-8z; Tue, 01 Sep 2020 10:43:06 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD3kk-00015U-HJ
 for linux-riscv@lists.infradead.org; Tue, 01 Sep 2020 10:43:03 +0000
Received: by mail-qt1-x836.google.com with SMTP id n10so478114qtv.3
 for <linux-riscv@lists.infradead.org>; Tue, 01 Sep 2020 03:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jbGaTo+FCadGfO2chYnJiWXIwjtp9P28Jw0dXGijHh0=;
 b=pYcOSlbNGMiOPZuHFOVZPpawWxmCniU3qFG+2KLJ1p+9P/AG4DPJ2Q9esJuxB/F+Ir
 S5ttn7CrLbt2PRCRpwzfjTNucTPIkBs7vuBsYuobkJ4XAbGg0htn0Xe8ybQENpNI0NwO
 OpEk21x7ssa0x2M8kPoMYVaowF0QduM9/wWWHp78momLuticlbDaSSp5KwyhcIYDS6uO
 Oa2LAoinsrParqmgcP8K+IKPgrdJ/dgh015J/5hLvu/Ke1E8bxb3BLu8jwFQ2JKSPvrH
 FN/9dBYsqzE02gv0EcSPxcB3C6CCgKm0/+3oapCxuyXhmteP3IxPtuQFS2Pk1KX7j+xd
 lJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jbGaTo+FCadGfO2chYnJiWXIwjtp9P28Jw0dXGijHh0=;
 b=s77SWpc7N9kRNgPwvrD34/PNSZ3DVHvKlONylLnmh+jobczqiDUjccmQNhG7D8OoQN
 8KDRLPQC9pOn+Bcvqhoxal57gzpp025pxJRd5VrqNlkB01lG5if3hE/Xaw1VLf3XQBzh
 DREDpaimK22FlzjTA8wTAmKok+H6fat2AuHJ8P2U+Ay0ROezXSqaHnyNshLv/s8AWn3e
 DI9dH+UYaRqenqfy5GA99ZBuMTZGnTH+p4Mumm6Kqn2HRuUzujhJxcGdMuZouoQSxtat
 UMxFxeDvyuedqy1PM4aR8A+L+hspnwBcOSYPyebOjc/6SsWBBdFHXnL8YHr4LitN9zuj
 AeRw==
X-Gm-Message-State: AOAM532BywGMqkTRKYc3nyX8xcKR4D17PQLPs2/CMT8c/4xPdu4G8pYt
 Ei0pwIGzzk2/PbvSXHAJi5Gmkhp1xMK91A==
X-Google-Smtp-Source: ABdhPJwQUoXcWjjqUXIvzdWTAXrqWQM4g320imT3oXhrG4qzf6xzjaTaIi/JujAZytBvSmWWnqZd6Q==
X-Received: by 2002:ac8:5d10:: with SMTP id f16mr1045463qtx.196.1598956978578; 
 Tue, 01 Sep 2020 03:42:58 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id y9sm1107675qka.0.2020.09.01.03.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 03:42:58 -0700 (PDT)
Subject: Re: RISC-V testing needs on HW?
To: Mohammed Billoo <mab@mab-labs.com>, linux-riscv@lists.infradead.org
References: <CALkjhPrHDHRsFDh9n864xvK4DKU2GW68_TcA-Tz17udsOWjbFg@mail.gmail.com>
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
Message-ID: <883c0f38-e002-ce16-d196-933a8b700776@gmail.com>
Date: Tue, 1 Sep 2020 06:42:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CALkjhPrHDHRsFDh9n864xvK4DKU2GW68_TcA-Tz17udsOWjbFg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_064302_589819_B944F758 
X-CRM114-Status: GOOD (  17.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On 8/24/20 10:20 AM, Mohammed Billoo wrote:
> My Kendryte board should arrive this Thursday. Is there any targeted
> testing that anyone would like done, or should I just build the latest
> 5.9 rc for riscv, load it on the board, and see what happens?
> 
> Thanks
> 

Can you test what happens when accessing ai ram (0x40600000-0x407FFFFF
and 0x80600000-0x807FFFFF)? I have two boards where this appears to lock
up the bus, but I have also heard it reported that accessing this area
of ram works fine. If it works for you, can you please also report what
your clock and reset settings are? Those should be controlled by the
syscon device at 0x50440000.

The ai ram takes up 2M, which is a lot of memory on a board with 8M
total. It would be great to be able to use it when the KPU is not in
use, but I have been unable to access it correctly. I have been testing
mostly with U-Boot, but I experience the same problems when booting
Linux.

--Sean

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
