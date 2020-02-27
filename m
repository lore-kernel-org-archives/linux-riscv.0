Return-Path: <SRS0=0+L8=4P=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1909C11D3D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2020 19:43:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C381E24691
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2020 19:43:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CawoO1T6";
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POwsT56/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C381E24691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PgJHcVldZYe0ihjMCHMM6SMuh47kdOLu6dpCbpHogu0=; b=CawoO1T6d/g1XC
	n6n0YAGCrr8413czWKfbA7rg+uGLdeA8SRr+IER8uIHB2C8kv3hntdjUxBq5aJduLYEfFC7pQ1kZ6
	juep9fPi6bVUh1wtZRMkNeq6oGCWK+9Rx7Z3kIToR4XY+95uojBJX/+eEE14pHhvo+8OzReTg7NHy
	afw3rGnprc70yHsFnGW5Q1DqiZ5CBRXLybYcdiKlmMPh8kxHAx76EY0EhChfq6rISIdG+UPjxd8kW
	knRBZXRUslsQOdHOnLK7cBKWdzbroUE5/dJJ6NZthtVgdoU3L0ACAPJr6RvHTgwaIqGyGXnq2XxlT
	wmBSI1o7ilqdQJ4Yu8Dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7P4Q-00076x-VD; Thu, 27 Feb 2020 19:43:42 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7P4O-00076W-0A
 for linux-riscv@lists.infradead.org; Thu, 27 Feb 2020 19:43:41 +0000
Received: by mail-qk1-x741.google.com with SMTP id 145so626479qkl.2
 for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2020 11:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PgJHcVldZYe0ihjMCHMM6SMuh47kdOLu6dpCbpHogu0=;
 b=POwsT56/FTfrOW9R194KO+S/qAfloxLhcXLTg5jBMiZT6AWKbQPen9SXZMtAYAwzGo
 VMSoyhnnGPrROMStCU0T4xNLywMQHIv/nbtNjYVVcXKAYpQvUM1lyJZK/MEoFl/JGPUg
 U6lMpza4LTQfngSYwY2vVrP9WZOtNtR4Bz3GwyMOd4a6veC08MF1hHWEBSLKRjI0SYBH
 9sU1Ghlyy660ehTAzI8xX7zwG6BBGHm5NixszeDsdVvqurChT6RT2CV7fd02pEpnhPv8
 aFP0WWh3Lu++gfcAqoxvO9WU+ly8cIyValjJjgXlOkYUhO5DV4L6faV2timByVluHgig
 /2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PgJHcVldZYe0ihjMCHMM6SMuh47kdOLu6dpCbpHogu0=;
 b=DfpE/2jGjrYzkwtqyjCH8mp2BmextVmIsN6lirmUpqNrUr88VDkirVUZQqOImcuLS8
 t85MvAhlYFqt9XSMHLSc5LZfUC2kOiDuWWhxgqOAkzHt1N4t7qg+8ru6TR9C3FFHIdIY
 fMNSieD0ZMWLzzZsfoS64K0deuj3g6Jkti+NMArCgWd8yS3jHjFYnrvux1qX6ceY7Hai
 ou+1PwX/Serf/zhJeUyoSQhyNnNVZlNSzIzDtlRPPIAr8wsDZSNjiTdwXSjhIa8eg0tV
 Xf+fra+ogljeg9DaBGmrg9yJVQajK1l5Tmh8ITBt4e91FlLOZ+/R46Xb8xhn50k4DrZ1
 sd0Q==
X-Gm-Message-State: APjAAAUZQNMwMO6gaOKsdzSdaL8MWZvW0UJP/5yLKg2NHytpPIB6m46m
 rqsIbBjzlDQjUj9umdrdbnQ=
X-Google-Smtp-Source: APXvYqzDqWbm4QchjC//XIOXkTcV659JoG2mAJzoGQV82IFqU5oTUQ3zKeheuc78b7L+88Y38Uu87g==
X-Received: by 2002:ae9:e202:: with SMTP id c2mr1096997qkc.224.1582832616263; 
 Thu, 27 Feb 2020 11:43:36 -0800 (PST)
Received: from [192.168.1.117] ([75.102.135.197])
 by smtp.googlemail.com with ESMTPSA id a17sm2031517qtj.48.2020.02.27.11.43.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 11:43:35 -0800 (PST)
Subject: Re: [PATCH 08/10] riscv: Add Kendryte K210 device tree
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20200212103432.660256-1-damien.lemoal@wdc.com>
 <20200212103432.660256-9-damien.lemoal@wdc.com>
 <48e10b3d-12f3-a65c-8017-99c780c63040@gmail.com>
 <BYAPR04MB581671F46D3FE67FD3C8B2B7E7140@BYAPR04MB5816.namprd04.prod.outlook.com>
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
Message-ID: <cb91a53d-412f-119b-e8a3-329162749572@gmail.com>
Date: Thu, 27 Feb 2020 14:43:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB581671F46D3FE67FD3C8B2B7E7140@BYAPR04MB5816.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_114340_044880_B6E957F9 
X-CRM114-Status: GOOD (  11.21  )
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
Cc: Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/14/20 9:34 PM, Damien Le Moal wrote:
> On 2020/02/15 5:51, Sean Anderson wrote:
>> On 2/12/20 5:34 AM, Damien Le Moal wrote:
>>> +	soc {
>>> +		#address-cells = <1>;
>>> +		#size-cells = <1>;
>>> +		compatible = "kendryte,k210-soc", "simple-bus";
>>
>> Should the -soc suffix be here? I saw it was absent from the fu540
>> device tree.
> 
> Yes, I guess it can be removed.

Actually, I think it is removed from the fu540 bits beccause sifive has
different names for the cores (rocket, U54, etc.) and the SoC (FU540).
Since for this chip there is no separate name, we should probably keep
the SoC suffix.

--Sean

