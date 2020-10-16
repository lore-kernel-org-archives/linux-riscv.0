Return-Path: <SRS0=aLlD=DX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCC8C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2020 14:18:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEF3B20874
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2020 14:18:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sq+pbv/i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rS/jD8JM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEF3B20874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NF3wzgPp/3UhhYg35QUQgtDtfzTJrQJEvL0xkna60yk=; b=Sq+pbv/i2Q0h2GOubqIbjnk5sI
	uuMk8T1+JrTlefXC1rHjXUMsSNgq6NQGJrdK2qctXXDELdedHjXArzj8TL67CwduFzPpFPKYUSv8G
	oOV9aV8PswvjqxYShrtcRDLzm97Ph2zcVpo23trCE6xyihWL5NX9CVhJHplHfkaV22ZuqEiISzkgw
	3v6nAr/IkHDV7K5ZjCfIehOz++hMOz/yfpEx5dbzi/MhsNHS7HxuY0NFGQPjRAzmu/DFq5+Tl8pqt
	UNIfWtJ8XGpeVsZjyi9Pr8ytZbyTBBpuSb43U8iEJeq4SrXgBjJvY5iTHpqGTfDGVvv6H7Dpl7vfh
	fmHuOC/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTQYJ-0005Us-An; Fri, 16 Oct 2020 14:17:51 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTQYH-0005UD-Ha
 for linux-riscv@lists.infradead.org; Fri, 16 Oct 2020 14:17:50 +0000
Received: by mail-qk1-x744.google.com with SMTP id s14so2007720qkg.11
 for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2020 07:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y2N9Ts5N7CVt9wr/ePD+KSf8C8M4q1OtWt2aeh5wg8c=;
 b=rS/jD8JMDzk/CgwwjSLV20MjwHgI1Uj3Et/bRjSP1Lw3GOCzh7bJun5b8O02chx2Mo
 O9/r+jPj0iki9GZ6z4HDf6SMMZ0Vm8EYHkmncqiC2/tvwi+OBGLuL/CFF8KOU/PcTCHJ
 8SsmxpfqgHWX68ROIVJkaxo+o6HwaSY4c6Zc5E3jNwk/c7CXVZ20kTtvXmdPa3rLWenW
 5WbWN5x/oHDlOtuHYu6DpTfQ3PGSYA4nIBFtW71I6SJXydES3FnsmU8ryD4vWInWckju
 2YxzyLhZp9YJ3tmuyB3SnuhLzYnQs+0ARCUQu1FnkFh29qUa/E6TgBvcWbui+cbR+oiO
 AVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y2N9Ts5N7CVt9wr/ePD+KSf8C8M4q1OtWt2aeh5wg8c=;
 b=o1UlWGyG9T9/aR3HhXRV1jX5GXg/n8lpDG6xz4tfKdbFB8lsNQsrR3O3DjT2pwA0hI
 CcU+eWHlKnajmftwxa1R5Oi5QExDVOOc5WC0qQdXmKI9L92G4mtIVbIQxAPO3NX2xrLF
 e8IrB81+84xu6NQRPw8z8JeuYAGcUbARZH0Uk3YKR70UoXP4oANeoMsj1tYWb6vYybGT
 AVVmzDyYpt0IpHa5dPgjg7c0QDJPicPE9Ko5syVCt/o4i42tmcOJKSDrhl1I4yEHrwnW
 9X1SPojAQA4/fcwoafPOe4iObn6bIVtbwR4Alvs50wzmxEB/BqloDUZMIl+qTjF7B2St
 xAsg==
X-Gm-Message-State: AOAM531Y16kcZx/BnJgrqF7kkxzFetEFF6v+pxup1lLdbkd8ZXzEuwLt
 nIAjS48oEpa2hWaBdqiL1qYfaM4WU5uPKg==
X-Google-Smtp-Source: ABdhPJz5G8Tza/D8Encg3kY9Xb3jwdS2iwgKlNCDyfpMMg3WySO1kAPX0r7PHPGeDRZwfQmuPWrZRw==
X-Received: by 2002:a05:620a:66d:: with SMTP id
 a13mr3973446qkh.301.1602857865155; 
 Fri, 16 Oct 2020 07:17:45 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id n2sm1044448qtr.6.2020.10.16.07.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 07:17:44 -0700 (PDT)
Subject: Re: [PATCH 0/4] clk: add driver for the SiFive FU740
To: Zong Li <zong.li@sifive.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, mturquette@baylibre.com,
 sboyd@kernel.org, yash.shah@sifive.com, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
References: <cover.1602838910.git.zong.li@sifive.com>
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
Message-ID: <d0627c5b-1007-bca0-e6d6-0a3740eaf6a7@gmail.com>
Date: Fri, 16 Oct 2020 10:17:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cover.1602838910.git.zong.li@sifive.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_101749_593221_C875D167 
X-CRM114-Status: GOOD (  15.62  )
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

On 10/16/20 5:18 AM, Zong Li wrote:
> Add a driver for the SiFive FU740 PRCI IP block, which handles more
> clocks than FU540. These patches also refactor the original
> implementation by spliting the dependent-code of fu540 and fu740
> respectively.
> 
> Zong Li (4):
>   clk: sifive: Extract prci core to common base

I don't see this patch, and it isn't listed on the web archive. Was it
not CC'd to this list?

	--Sean

>   clk: sifive: Use common name for prci configuration
>   clk: sifive: Add a driver for the SiFive FU740 PRCI IP block
>   clk: sifive: Refactor __prci_clock array by using macro
> 
>  arch/riscv/Kconfig.socs                       |   2 +-
>  drivers/clk/sifive/Kconfig                    |   8 +-
>  drivers/clk/sifive/Makefile                   |   5 +-
>  drivers/clk/sifive/fu540-prci.c               | 618 +-----------------
>  drivers/clk/sifive/fu540-prci.h               |  21 +
>  drivers/clk/sifive/fu740-prci.c               | 102 +++
>  drivers/clk/sifive/fu740-prci.h               |  21 +
>  drivers/clk/sifive/sifive-prci.c              | 529 +++++++++++++++
>  drivers/clk/sifive/sifive-prci.h              | 297 +++++++++
>  include/dt-bindings/clock/sifive-fu740-prci.h |  23 +
>  10 files changed, 1032 insertions(+), 594 deletions(-)
>  create mode 100644 drivers/clk/sifive/fu540-prci.h
>  create mode 100644 drivers/clk/sifive/fu740-prci.c
>  create mode 100644 drivers/clk/sifive/fu740-prci.h
>  create mode 100644 drivers/clk/sifive/sifive-prci.c
>  create mode 100644 drivers/clk/sifive/sifive-prci.h
>  create mode 100644 include/dt-bindings/clock/sifive-fu740-prci.h
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
