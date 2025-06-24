Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C269C77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 12:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eAjNAwlrKaoAmkbEEL/KGP+zYVO2nXlktF1eTz7C+A=; b=oATCXIQEWjttZj
	y6L+PIEMjo9Fk443boDgBF4RlKP8flFVeAOwTM5gjdRvXzBmmljhNd7FiWCVWTcryVteISHX2uKxf
	8sryUIsyD355yeE7YnFnckpMmCqXJqNoi/v3WSRYirmKcCwSxOEuf7MsPW8sgGhjcJoQRSRJKlkPo
	RvuG3DstTz2XU/71YnPc1wC1vrmiZnxAvP72wuDvGhOFZmwmCgASvNeGesnB6Og5UVzMceoph9V8j
	8VpZwPcZbPGgFXxuvVM+dvNAeXxUHkfDuogZ4iFmDcovX/RX05pOC9b2i9wFQThlG3e76YSh6K1JW
	dn09nHW31ueebaPRPoIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2Nj-00000005UeR-3u5j;
	Tue, 24 Jun 2025 12:04:07 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1W2-00000005Ocs-3PvU
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 11:08:39 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-32b43cce9efso41885351fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 04:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryptogams.org; s=gmail; t=1750763317; x=1751368117; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ivy1EjkVwPLS1G0ny1Hn6BgOuucNPs/UtRGt2ZEu/Us=;
        b=AbEoNLIkzXDNT8uj/PmvuCa8LePzm6wkOizb+57/hsYBsG1NHm33kpYk+tfXz8NS23
         2m8UnSU6rzkE95eJJgeNQFNRneORMyKXVSPnIkMumym7LlI/x0f8FRdF57wE3FFtHw2n
         XPpzktPB0Gw1LcR9pk08es23YFPegALeOBgRa0ihjLeNgzjVbmUR6hFGUCNpa/g3BF39
         Zzmt4PpDVyKs6NJITBI2nvob6onzBITsN6q53WLX0rJ7fGSKZwJuwGPaA8RiA49m5sFF
         Yb2aCnr8F1DvlErzsRpSb42BFEqp0FvmbgAMBGsGR0JIlWJWLOgRzNf45boLZbaJe3Xl
         E7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750763317; x=1751368117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ivy1EjkVwPLS1G0ny1Hn6BgOuucNPs/UtRGt2ZEu/Us=;
        b=G/qVIO4uzimlrBl0qfSuP3NhSY1B0Yytu1a2EHB277XKpUPVNpQuxFtt6fhtlrIbgz
         BDJsr86f3B72lIHyvwcxaRDxDQsrae/nHvyWCH9hzoGKDkKUqDdD6YxBR1e+OHz8a9F+
         dwi4T/45WGLZjoLq3RrFfyzM8nz1TG2dcAi/BeqnKn1mY/GgqTTar8RuOpM45IahX6hr
         6qs8C4GMmYIdlgDBNYwQmYBMqyYE9bLffaUjE+NqNZyUS+8DxAPFvPw94eKrbHTARaca
         0Xfxw5zcEWWhV1+t207UVgGPeFCTUIa5UMMYAuFKVgFbD2a0VV/QnONuJsdA1sgZIQBQ
         778g==
X-Forwarded-Encrypted: i=1; AJvYcCU1L9HIkQ+8d1uUB9Hn3VBNV6/eF2ENWR9R+q6PDA3eairqt56CUe8AdoXomZmbkG5zEjem0hUm38+pKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRV+nxw4ZTlWz0LfPLoLrkjSe8SqQREwHiuTpijN+DcXTWH/TR
	c5Z1Rh7LEfjxECwRkltgT/37kEvD+7yj7hsGfXTChtrgzf5Lrn1g1KZ89Q0/Ue4jays=
X-Gm-Gg: ASbGncthQeUarqdiCjmkWOHG44Ll4kYkjbiiOPrk00IvZCnD1X4/L9TLtLthDtgDl5K
	Vh9hPysT3gclivoyQ24X7SBQ7dT/04Vq0EIRPFcTsQwWnW6hUIS9RTl1DNdKGva7/nlzhvWzWMV
	wS0p4BMb9jD4j6xOsJA+sRxuzw4LDpuybWhDYfVK4zuLS6lv/uDsvnCZKyyJuiJkCZJJTcYGwsP
	V749ANsT/vn0RyAjwZdZXiAVOIei4YIEzPUvIRXuq/u73Hh9I5dszqbOmMnLR0YF4FdWLKkGXgb
	fZd9Svdq4+Th2V1Hv2dCzuxXN3VxqzSwsCsMgO0O3MGxozLKnx1l4k5W/nxTBsTGoX2tjv6QN7Q
	fLW3bTvM3Z445J4dAbWi/81WEU6xeDg==
X-Google-Smtp-Source: AGHT+IFkaVfe9A5q4PCpQMJnAeMmaLJMc+uasJr+tOkMohX7Kkj/gdRv7dSPCWDdO6DpJMYWCcZcOQ==
X-Received: by 2002:a2e:ae11:0:b0:32b:7356:94d4 with SMTP id 38308e7fff4ca-32b994d9700mr32922951fa.41.1750763316774;
        Tue, 24 Jun 2025 04:08:36 -0700 (PDT)
Received: from [10.0.1.129] (c-92-32-242-43.bbcust.telenor.se. [92.32.242.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97fd6e58sm16229431fa.50.2025.06.24.04.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 04:08:36 -0700 (PDT)
Message-ID: <c61d1163-df80-4cbb-af13-3fcab8f6b9dc@cryptogams.org>
Date: Tue, 24 Jun 2025 13:08:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS
 implementation
To: Eric Biggers <ebiggers@kernel.org>,
 Zhihang Shao <zhihang.shao.iscas@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
 herbert@gondor.apana.org.au, paul.walmsley@sifive.com, alex@ghiti.fr,
 zhang.lyra@gmail.com
References: <20250611033150.396172-2-zhihang.shao.iscas@gmail.com>
 <20250624035057.GD7127@sol>
Content-Language: en-US
From: Andy Polyakov <appro@cryptogams.org>
In-Reply-To: <20250624035057.GD7127@sol>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_040838_862546_B7953E1C 
X-CRM114-Status: GOOD (  13.01  )
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

>> +#ifndef	__CHERI_PURE_CAPABILITY__
>> +	andi	$tmp0,$inp,7		# $inp % 8
>> +	andi	$inp,$inp,-8		# align $inp
>> +	slli	$tmp0,$tmp0,3		# byte to bit offset
>> +#endif
>> +	ld	$in0,0($inp)
>> +	ld	$in1,8($inp)
>> +#ifndef	__CHERI_PURE_CAPABILITY__
>> +	beqz	$tmp0,.Laligned_key
>> +
>> +	ld	$tmp2,16($inp)
>> +	neg	$tmp1,$tmp0		# implicit &63 in sll
>> +	srl	$in0,$in0,$tmp0
>> +	sll	$tmp3,$in1,$tmp1
>> +	srl	$in1,$in1,$tmp0
>> +	sll	$tmp2,$tmp2,$tmp1
>> +	or	$in0,$in0,$tmp3
>> +	or	$in1,$in1,$tmp2
>> +
>> +.Laligned_key:
> 
> This code is going through a lot of trouble to work on RISC-V CPUs that don't
> support efficient misaligned memory accesses.  That includes issuing loads of
> memory outside the bounds of the given buffer, which is questionable (even if
> it's guaranteed to not cross a page boundary).
> 
> Is there any chance we can just make the RISC-V Poly1305 code be conditional on
> CONFIG_RISCV_EFFICIENT_UNALIGNED_ACCESS=y?  Or do people not actually use that?

For reference. The penalties for handling unaligned data as above on a 
processor that can handle unaligned load efficiently are arguably 
tolerable. For example on Spacemit X60 it's meager ~7%. However, since 
poly1305 is always used with chacha20 and is faster than chacha20 the 
difference would be "masked" and rendered marginal. If anything, it 
makes more sense to utilize this option for chacha20 where the 
difference is way more significant, a tad less than 20%.

Cheers.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
