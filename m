Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62237C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 02:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1w1GntLDU4yj6V3+NNm3t3HLvJDKP9TY4y6qtg7hWz0=; b=GR6hoTHimObx50
	GRB71TUwEXWXyXDtbC9xyAG1uSaDCGG41DH1aIj0juqqlpApb4/UZuCrFNzLF3knuQ3Qcc7RcNC76
	f0hlLhdcYAgXPNF5GDdJVHM3pg58JVbxoAWLqBPPe7bV7TGKmNz285AXdeseNXnU1yVLTI+/uL7ys
	ujWp+PZfjW4t4K+O8cJDCbxTO6+mvFWTHbVeZiXOTmwithiugPtZ5xw1g1ldsdyL0KjF4eSG00iM6
	Hnau0v75sokUi0QIfXL+8+SolVqdMMDm57txXYoaSADpjp2JnsPivZ8qMKWNsPCfXYcRTXPeoyO3u
	ZjnKONRhSJpLjpa8ydCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8AUk-006rDw-1d;
	Wed, 29 Nov 2023 02:40:10 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8AUh-006rD5-07
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 02:40:08 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cfcc9b3b5cso26127515ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 18:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701225603; x=1701830403; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5x5B0c437a2X9lDq0UQuEQp64iHtOX/XVWyXOOCW84=;
        b=G5slqg16fq+gyX3L0VAx8Om04L4Gm1bhWuhtTnNg1mP1UIDy1K5+90LyBPRRZZHmNI
         ZNpDYd1ZIqRH8tnSQTGY3W2cG6UtfdjHcdOj91sCG4vZvT1J/SHADZE0MqsPV2PZh36P
         +03znNNgaQhCQNJM/En613LIASIasAldnHRye0oy2G5kiqYjNvHcXalc36J0YwVxe3un
         /pfvD5cZbdtzWZMYZ3rTn4ztm95tb6/nqRV0bbgawV4Htde7livrs9CnHtQVRzfNInaS
         Bn8rPo5SbtcWUuBFjZPL9XwD30hbtlb9mkjvpxRYPh+DFB3qX5je251xieTbxJ9CPrQ/
         S89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701225603; x=1701830403;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5x5B0c437a2X9lDq0UQuEQp64iHtOX/XVWyXOOCW84=;
        b=lnmyhy4zvRjEUyLJiAJyQWQD5OGzZUXmITIV6NOnb96K2+R4JHX4bkx94ItuNAO5eK
         EQv0bBw3N73j3J8ZHLTtIkFh73XrF9IZBWo1PoUr74HlULLeHTnTTqLtad5W1O9ioPlJ
         54PdSWLcAyK+oCufEi3fMJQiAvpXqhW8ReWgG/R3KmZlcEq/v3Vyg0uTOnN+sjseBtLE
         w4sEf0ggS4As3rH9ueNAhhSxhTV1hf88GbupYd7xuwnjkfaRzKVhu6n12E54yaSRQLh1
         eR3yB0Ko+NEmarHWWTyP9psxUeQ1hk/lc8xEHDpoytH9bk+S3pkP1RYVfgcFFvRcm/m/
         83dw==
X-Gm-Message-State: AOJu0Ywvcc4Smmq/YcQo6i6waQr4bbp8hd6hHXGXHaORfZVZTFI63+4U
	z9ussWsXQSsJildwlkXkXaha5Q==
X-Google-Smtp-Source: AGHT+IHciKY2OrzZ9uzKYCblSTprxoTaxuGcqxj9qIEPOv32IWeYHV5K+GkoXvaXcNdlaGNzpGPu9g==
X-Received: by 2002:a17:902:ce84:b0:1cf:b7ea:fea with SMTP id f4-20020a170902ce8400b001cfb7ea0feamr15805442plg.1.1701225602758;
        Tue, 28 Nov 2023 18:40:02 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:5a34:50a0:78b5:5013:4cf4? ([2402:7500:4ce:5a34:50a0:78b5:5013:4cf4])
        by smtp.gmail.com with ESMTPSA id y4-20020a17090322c400b001cfcd4eca11sm4806771plg.114.2023.11.28.18.39.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Nov 2023 18:40:02 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v2 04/13] RISC-V: crypto: add Zvkned accelerated AES
 implementation
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231128201228.GE1148@sol.localdomain>
Date: Wed, 29 Nov 2023 10:39:56 +0800
Cc: Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 conor.dooley@microchip.com,
 ardb@kernel.org,
 heiko@sntech.de,
 phoebe.chen@sifive.com,
 hongrong.hsu@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Message-Id: <E78B3BF9-8E49-417B-A89E-05F72690A92F@sifive.com>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-5-jerry.shih@sifive.com>
 <20231128-await-tipper-2094715466f2@spud>
 <20231128201228.GE1148@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_184007_081240_C77080CE 
X-CRM114-Status: GOOD (  13.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Nov 29, 2023, at 04:12, Eric Biggers <ebiggers@kernel.org> wrote:
> On Tue, Nov 28, 2023 at 05:54:49PM +0000, Conor Dooley wrote:
>>> +static inline bool check_aes_ext(void)
>>> +{
>>> +	return riscv_isa_extension_available(NULL, ZVKNED) &&
>>> +	       riscv_vector_vlen() >= 128;
>>> +}
>> 
>> I'm not keen on this construct, where you are checking vlen greater than
>> 128 and the presence of Zvkned without checking for the presence of V
>> itself. Can you use "has_vector()" in any places where you depend on the
>> presence of vector please?
> 
> Shouldn't both of those things imply vector support already?

The vector crypto extensions imply `V` extension. Should we still need to check
the `V` explicitly?
https://github.com/riscv/riscv-crypto/blob/main/doc/vector/riscv-crypto-spec-vector.adoc#1-extensions-overview

>> Also, there are potentially a lot of places in this drivers where you
>> can replace "riscv_isa_extension_available()" with
>> "riscv_has_extension_likely()". The latter is optimised with
>> alternatives, so in places that are going to be evaluated frequently it
>> may be beneficial for you.
> 
> These extension checks are only executed in module_init functions, so they're
> not performance critical.

All `riscv_isa_extension_available()` calls in crypto drivers are called once
in the module init calls. Should we still need that `riscv_has_extension_likely()`
with a little more code size?

> - Eric


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
