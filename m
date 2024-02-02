Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38833C4828E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 10:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jrmY+K4c5/D8UVZThgUGuu5mB0dqsymkvnuQa7uKHho=; b=LseRPTx2lsfkAr
	VuAy/wJPS6unMSegP0UNeUfz75BYEaEzOVVbWRn1FNp7cE4lGl06WkAXq/SRlPb2VKnpwUMF97iHn
	uxg1Vo5tR8gyxDBgjrCZshXQsq1LJrUx2541zSLAqcZI+F5a994pomJpNCs02+wb1EX/O3fCI5xN1
	NLCI4bWVhy+Hg2d95kRCftvZ0psDWWXQkJB6609MZuVSYNDol+6nUYsW9J2rGKDco6M8rUWfWZn3L
	mTK0DhQS3RTYK1hPV7PZuKWmtsAMuT53sFlgOLDEXyAOi45b/JueIIOeEOesWJ5C00+A89Z06x9As
	UhnUBVUC9dO+Hy6Pu0vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVqrM-0000000BAMQ-27su;
	Fri, 02 Feb 2024 10:33:24 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVqrJ-0000000BALj-496n
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 10:33:23 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d97d086756so128245ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 02:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706870001; x=1707474801; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T8iHE479YVvdQnvL1fZ7V63tnI2/lAPeZVx8YhIJp00=;
        b=LKstQkhTnifu/I2Tk3kbWoijO3uLjAnxA9OD4PeqToX8ziMDCJ2Av+z4df6ZnThiez
         zMSkeZmMX/eIBM9PqKQTKEc319CQR+BoVNm02stzZiylGLIeAXonTIqh8KfAxti3JJot
         OhmxNc2eFfhk7sXZJLJoNM+N+tCWTM/joPDZueyhNUdn/rNjg7X257om23+Z4sXSNbDv
         80NtFgRpfxZGxNVrmQAnLy19RO1LpeYLy3y/KpelEOb3D/z1LwIjyeVVxNr7hQ9vJGhn
         kquKdZYIpNrzIx4xR+huO98TO+G5W1JksAtJMIu29dv6IcoW4bNI+6qB87BxGlfGvCHI
         eZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706870001; x=1707474801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T8iHE479YVvdQnvL1fZ7V63tnI2/lAPeZVx8YhIJp00=;
        b=TZvfw6bIhCdEGBPkY92q6tALELNUJb3e9H9zXoqqAeKOHX/8f4vs8alzZgHXGhALrQ
         A7vNr4Fo673LUu6J4ABvXFrNY0pVz+6sSKi2fU8mWKOAXtPHNQykedBsgi5lp2MBMUjX
         QOt0fr9nUqopWl7rgeAG/9siOepeENUseXHwpGN4esk8G4+HDUhR7qHbpzlQdoFxXDe4
         Cm3RZnKP/sVywQ85WhXIqea53FuNPFFxdIMGuslO7MQmQ/08Uf2raEX5/KvPbHNPm0iW
         25nHPzQj3JK44tj+dsXD0/Hzi1D/rgcyKm5Khf2CqFxuzbMXv+ON4fnfDm/Jz1GuLnyW
         yRaw==
X-Gm-Message-State: AOJu0YwJTlTbH5z4zfZhytWS7XL5WdShAn43TqQU/6W+DFmm4Ss7yCX4
	clH4FIjvRxhx9Ll1L+M0SSgsl6azhIXb+D3E8yOzWlOZO9EvvHz9sQu0IVND7uo=
X-Google-Smtp-Source: AGHT+IF6Vbai2YBU7cb51y8R4IB03FxPQx+BBkX/tfJTtHIPiA0XBZiwJtgRNHGa4tUQp7qa7GJeHQ==
X-Received: by 2002:a05:6a20:7486:b0:19c:9c10:fa27 with SMTP id p6-20020a056a20748600b0019c9c10fa27mr5462240pzd.4.1706870000941;
        Fri, 02 Feb 2024 02:33:20 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUE4ny+RfqFrQN3ryErdIfcptjtiUDXiAnUOdO8oSK4hhFsFYWe37sJfIbcmbdh+n9iSFjmgJOylcGTuWgAnnJg8Ck/toMJwjx3Ha9RnlqV0ti/2dFnQVZ4XXCGAStK0s2Bkkj1LHDNHM6CSubetnEajPBYkxC9xYe/G2BeVKyhgcaF6HhrN9qRhNvnyt5NjRqcXjz3sZdsydpAemlP78SDJi21qiUfnV29zoyoqabPyCl2nt0H0NYH35uo6WJrrCjbLgTKxjk6x1J6HbmZpTnQEPVhPZmKYb1gqK2wJKCZc4D+XUbi0NdKaStXWC6Vu4NHC+Hz4pUUyObRAR3LxOueT3GnzfZoxQOZZGec1yObxzzYUR8awfMF6wo67wFXPDV6hG5v/4uxm0ip6MUS7ITWAjHGGRMBU2GPGgj2yov3Ln5fyYNe98r7y1G06yaZnA6A0ow5DAu4sxD2sZn2YJVJmrMLRIQCuGgI+YsviiAkLZ4MGpbDyMQZfXjvqhKzSoaG3+OaLdOeywYmOwTtFwAxgHgh8APY6t9bD7HG4EoJLE/rjmHWih00OTsF9hVw6ayr/q6SEo2XzVwHOt20RQ==
Received: from ?IPV6:2a01:e0a:999:a3a0:6d51:959f:bb28:92? ([2a01:e0a:999:a3a0:6d51:959f:bb28:92])
        by smtp.gmail.com with ESMTPSA id mj10-20020a17090b368a00b002963e682f6fsm1111059pjb.57.2024.02.02.02.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Feb 2024 02:33:20 -0800 (PST)
Message-ID: <f2e5fdbf-971c-4f73-af07-3c3a04bd0069@rivosinc.com>
Date: Fri, 2 Feb 2024 11:33:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 22/25] irqchip: Add RISC-V advanced PLIC driver for
 direct-mode
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Frank Rowand <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>,
 Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <20240127161753.114685-23-apatel@ventanamicro.com>
 <eed1ee03-923b-41e8-b99a-accc1278da6b@rivosinc.com>
 <CAK9=C2U5_Ho0XUvEXRgASDKrGaVvPX68+UV2+=Z4k=cUaM3=6A@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAK9=C2U5_Ho0XUvEXRgASDKrGaVvPX68+UV2+=Z4k=cUaM3=6A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_023322_270104_D6EA0895 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAwMi8wMi8yMDI0IDExOjMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+Pj4gK2ludCBhcGxpY19z
ZXR1cF9wcml2KHN0cnVjdCBhcGxpY19wcml2ICpwcml2LCBzdHJ1Y3QgZGV2aWNlICpkZXYsCj4+
PiArICAgICAgICAgICAgICAgICAgdm9pZCBfX2lvbWVtICpyZWdzKQo+Pj4gK3sKPj4+ICsgICAg
IHN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgcGFyZW50Owo+Pj4gKyAgICAgaW50IHJjOwo+Pj4gKwo+
Pj4gKyAgICAgLyoKPj4+ICsgICAgICAqIEN1cnJlbnRseSwgb25seSBPRiBmd25vZGUgaXMgc3Vw
cG9ydGVkIHNvIGV4dGVuZCB0aGlzCj4+PiArICAgICAgKiBmdW5jdGlvbiBmb3IgQUNQSSBzdXBw
b3J0Lgo+Pj4gKyAgICAgICovCj4+PiArICAgICBpZiAoIWlzX29mX25vZGUoZGV2LT5md25vZGUp
KQo+Pj4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+ICsKPj4+ICsgICAgIC8qIFNh
dmUgZGV2aWNlIHBvaW50ZXIgYW5kIHJlZ2lzdGVyIGJhc2UgKi8KPj4+ICsgICAgIHByaXYtPmRl
diA9IGRldjsKPj4+ICsgICAgIHByaXYtPnJlZ3MgPSByZWdzOwo+Pj4gKwo+Pj4gKyAgICAgLyog
RmluZCBvdXQgbnVtYmVyIG9mIGludGVycnVwdCBzb3VyY2VzICovCj4+PiArICAgICByYyA9IG9m
X3Byb3BlcnR5X3JlYWRfdTMyKHRvX29mX25vZGUoZGV2LT5md25vZGUpLAo+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJyaXNjdixudW0tc291cmNlcyIsCj4+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnByaXYtPm5yX2ly
cXMpOwo+Pgo+PiBVc2UgZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMyKCkgd2hpY2ggd29ya3MgZm9y
IGJvdGggQUNQSSBhbmQgT0YuCj4gCj4gSW4gdGhlIHByZXZpb3VzIHZlcnNpb25zLCB3ZSBkaWQg
dHJ5IHRvIHVuaWZ5IHByb3BlcnR5IHJlYWRpbmcgZm9yCj4gYm90aCBBQ1BJIGFuZCBPRiBidXQg
TWFyY1ogc3VnZ2VzdGVkIHRvIGtlZXAgdGggQUNQSSBhbmQKPiBPRiBwcm9iZSBwYXRocyB0b3Rh
bGx5IHNlcGFyYXRlIGhlbmNlIHdlIHVzZSBPRiBBUElzIG92ZXIKPiBoZXJlIGJlY2F1c2Ugd2Ug
c2hvdWxkIHJlYWNoIGhlcmUgb25seSBmb3IgT0YgcHJvYmluZy4KCk9rLCBpbmRlZWQgaXQgbWFr
ZXMgc2Vuc2UuIERpc2NhcmQgdGhhdCBjb21tZW50IHRoZW4gIQoKVGhhbmtzLAoKQ2zDqW1lbnQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
