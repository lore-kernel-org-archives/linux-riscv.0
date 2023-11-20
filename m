Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA71C5ACB3
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 02:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTl4dP5vxmDtXebzGbKLFUB2QoUr7w++Oflmnv9GyVg=; b=HQWd5xWJOAHKe5
	O7DitpOpu1uoEqF+XMcfKM0tDhPApdtTEhfPPN1IIUzgnYgk1VaoP0Q7oFs6WLElnkNRGj6SurQTY
	ozPidInavCJBXWqmH/U528i8j1oLoWFA3r7xyFyPaGlDkfqkeCJcBwMXF05QmvUmJYXI614cFbhGQ
	KM3NO1gDypgyDWMup/NBJaFvZuzirmuwo+/I7ME5VSDAjjxPRvFZGSNgIJCoh2iE0t3pM57VsQa08
	ACH3vE7wrLQmN3pf4d0pSwQRdQJa8mi4HPN0lpK0KStavRmLx+0hB1P8JXDW7HCBOmIGGQLXny3/s
	ohnCXYXl/9ubvSjfJVag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4u9c-00Axcp-2t;
	Mon, 20 Nov 2023 02:36:52 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4u9Z-00Axc8-0W
	for linux-riscv@lists.infradead.org;
	Mon, 20 Nov 2023 02:36:50 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cc9b626a96so28098785ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 19 Nov 2023 18:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700447807; x=1701052607; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Zq4RPXM6eCo+MpwtSfj3ACqp+KpQugLsNlxVZl0DlA=;
        b=Qe4EvdORQnQ44N8TFfz5dYdcyNH7qSmuZdOAxKeWqQxTJzcDkPiOGDXbeK/roHQ1GE
         roTTJR8krSwOKQ1/BgI3sVDPnQGtnrVo/EQq1paYHeRTqvGyADNTtQaFZ7L4pDkznW+E
         cJE0bD1XHKzmYBx1IqXPGUGdVtRpCGQjlaf4hA7bX2bdkYWKwx+94333n3hGl5/cvTxv
         kenMFnfd1hC4O87kjWy8fS17c503sQaZeBe1yoqBUBd7IRKWyyyn14wnz48Q95TUO3+l
         +MpLxgEPWJhw15D9zojGTmPYc7hStItBeNfuswuF5YhDN/ec6qhjRu+ws1/Mda1uQzk+
         vxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700447807; x=1701052607;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Zq4RPXM6eCo+MpwtSfj3ACqp+KpQugLsNlxVZl0DlA=;
        b=E/42xap5dBqU6SQpYLJGkyB5adDk78QM1pbR3Oyx8Zu4L4nh82y5tyhSsAoY+QrmQG
         L9bx+lhHSal8MNVXmlCfRAgnJPcS+eFMDMoqgYZo2KMnI5bRrZJQvrdbcjbe1BHkapjJ
         Cxg+vQW/qlFBuwLzvDII3xTCzjvrwRk4zpNc1IQJZ3K6quWHB3aoSmiOMo2QUOhRfXW+
         jB7fTsBpbSle2umIU8dMf8KZC/zkWY+3bf18SaNYUqBmwTQWdX9MaQ2YheLkWW40353P
         6b0Qexl/Lobsq+ruSC4+nTPUCfTClEaB020PjkGVRjSpeP6UlgW3Bgx9goyrIZGktFBH
         9HZA==
X-Gm-Message-State: AOJu0Yzwf6Zr/0Ku0BlvXPgbHOA8q0Jf/9bdVpnvZEAbJ5i4+YYQSRJr
	DpGt84ZaIpwQDGKhoIQf5kxb6w==
X-Google-Smtp-Source: AGHT+IEKO8u8O27bTQGYqNJmwiQ/UY61Ih/6GCQAtHUfSm8QYLvQjd6X/hM7S5g2BeKD4AKKFk1lQw==
X-Received: by 2002:a17:902:a5c9:b0:1cc:60ca:8f24 with SMTP id t9-20020a170902a5c900b001cc60ca8f24mr4758601plq.45.1700447806758;
        Sun, 19 Nov 2023 18:36:46 -0800 (PST)
Received: from [192.168.244.11] ([49.216.222.216])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902eec600b001bb1f0605b2sm4939926plb.214.2023.11.19.18.36.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Nov 2023 18:36:46 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH 06/12] RISC-V: crypto: add accelerated AES-CBC/CTR/ECB/XTS
 implementations
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <CF7F714A-CAC1-41C4-A43A-DA1273111492@sifive.com>
Date: Mon, 20 Nov 2023 10:36:19 +0800
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 palmer@dabbelt.com,
 Albert Ou <aou@eecs.berkeley.edu>,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 andy.chiu@sifive.com,
 greentime.hu@sifive.com,
 conor.dooley@microchip.com,
 guoren@kernel.org,
 bjorn@rivosinc.com,
 heiko@sntech.de,
 ardb@kernel.org,
 phoebe.chen@sifive.com,
 hongrong.hsu@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Message-Id: <B4290995-3983-41D8-991E-ABA2213656B1@sifive.com>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-7-jerry.shih@sifive.com>
 <20231109080549.GC1245@sol.localdomain>
 <CF7F714A-CAC1-41C4-A43A-DA1273111492@sifive.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_183649_233647_44AE518B 
X-CRM114-Status: GOOD (  12.34  )
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

On Nov 10, 2023, at 12:06, Jerry Shih <jerry.shih@sifive.com> wrote:
> On Nov 9, 2023, at 16:05, Eric Biggers <ebiggers@kernel.org> wrote:
>> On Thu, Oct 26, 2023 at 02:36:38AM +0800, Jerry Shih wrote:
>>> +# prepare input data(v24), iv(v28), bit-reversed-iv(v16), bit-reversed-iv-multiplier(v20)
>>> +sub init_first_round {
>>> ....
>>> +    # Prepare GF(2^128) multiplier [1, x, x^2, x^3, ...] in v8.
>>> +    slli $T0, $LEN32, 2
>>> +    @{[vsetvli "zero", $T0, "e32", "m1", "ta", "ma"]}
>>> +    # v2: [`1`, `1`, `1`, `1`, ...]
>>> +    @{[vmv_v_i $V2, 1]}
>>> +    # v3: [`0`, `1`, `2`, `3`, ...]
>>> +    @{[vid_v $V3]}
>>> +    @{[vsetvli "zero", $T0, "e64", "m2", "ta", "ma"]}
>>> +    # v4: [`1`, 0, `1`, 0, `1`, 0, `1`, 0, ...]
>>> +    @{[vzext_vf2 $V4, $V2]}
>>> +    # v6: [`0`, 0, `1`, 0, `2`, 0, `3`, 0, ...]
>>> +    @{[vzext_vf2 $V6, $V3]}
>>> +    slli $T0, $LEN32, 1
>>> +    @{[vsetvli "zero", $T0, "e32", "m2", "ta", "ma"]}
>>> +    # v8: [1<<0=1, 0, 0, 0, 1<<1=x, 0, 0, 0, 1<<2=x^2, 0, 0, 0, ...]
>>> +    @{[vwsll_vv $V8, $V4, $V6]}
>> 
>> This code assumes that '1 << i' fits in 64 bits, for 0 <= i < vl.
>> 
>> I think that works out to an implicit assumption that VLEN <= 2048.  I.e.,
>> AES-XTS encryption/decryption would produce the wrong result on RISC-V
>> implementations with VLEN > 2048.
>> 
>> Perhaps it should be explicitly checked that VLEN <= 2048?
>> 
>> - Eric
> 
> Yes, we could just have the simple checking like:
> 
>  riscv_vector_vlen() >= 128 || riscv_vector_vlen() <=2048
> 
> We could also truncate the VL inside for VLEN>2048 case.
> Let me think more about these two approaches. 
> 
> -Jerry

I use the simplest solution. Setup the check for vlen:
	riscv_vector_vlen() >= 128 || riscv_vector_vlen() <=2048
It will have a situation that we will not enable accelerated aes-xts for `vlen>2048`.
I would like to make a `todo` task to fix that in the future.

-Jerry
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
