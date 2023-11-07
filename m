Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01388C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 08:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:
	Date:In-Reply-To:From:Subject:Mime-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6pJ3y1uq/KhPOFA1PzbpnlFp+e+t6EJYGiFDBKqStvM=; b=aZCnRgAVK6rYI+
	KaEwccJF4/Q30a+3OO8RSoaCx8H6vOi8nQXnaz3ogXKxMG6NkDYsZE4GzA2PzP6HEeqSh/Vd+V4jG
	qcEtx/PD9LhbVZmyeE/XUSyqAuLRCv5f8n5LmigoSwPc3Mk+aIii5bplpkfjhkWMDpB+O4LMnQU1c
	ByIBKnVZXBErDNuVhTY1vwnmNGpYUjdBpVxaWHDefPQK2s58zwO4F0fMV6rB367KUDgoBmV0nF66M
	n9dkbm+YK820pCGnywB5HeM9Y1F/1x0i4Dbq2oyq9ASS/YzsDJ1SfDT5Yj0EeLuQBPOVIZxxhb47I
	mgdFfUUEKyil60I3WrxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Hpt-000rY0-0E;
	Tue, 07 Nov 2023 08:53:25 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Hpq-000rXF-2h
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 08:53:24 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c9b7c234a7so49394485ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 00:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1699347199; x=1699951999; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mp3uon/3Fyp4maghAodzXPtq76RuAivTg8nwoG+3C0c=;
        b=cjqvjfwFJlKe5VX5MDRsMFAimZ8vddTC6dV6W82hahtE1vgcQeYTDogATf22PsV8DW
         QBEXqb6XRqO9aisu6tE7SB4vSN2g/2OA6q6hypE94eB54T/bx8nOztLnG9udUcL8awGW
         L0F4BBB9170rLPkWGg8cm1TUfIH06NZMGbfTHwLefw7Vg4DLbSxclIu5+8BiEEA8RgIJ
         swrgucuOWu0jIOdf5PTnJ2j0IhoUNu+RVBWmlH8HxRd4T4plnzqneJtnYbY4lTmdrlfZ
         ZUXa9iXvDnRNWWLN0QV9f2E6gd29aCL5qNDGBsAipgxeNcEWrTCYfIdzhX2qyJLSne9K
         LXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699347199; x=1699951999;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mp3uon/3Fyp4maghAodzXPtq76RuAivTg8nwoG+3C0c=;
        b=Sd0qG5+Oklrvflv7E9v9tMYuobGk6MzfKXAJxkN3E5JEn9doXb7p6J7TZuqytnHzaQ
         /t6oSThYs6aYW6cIe7n1GNsKG6J0UHt2ZgcAXg+aeGsOQMiZeSvRuIz1tZ8VADZAJpO4
         U2RSnJ9mTj4i/M4DNcr4kX2dkKykeoo4Ay/jgGmP/x6T5r9ighr09ErwHeP0OzyElQrP
         uhO2t5MOoCe124qv5Bg9F86FP9O3Do/63MRNYqL8CwkL7dK5ePtbMAYjU8HuARTs8nww
         +AEgN3XEFLcv7KA0T2wktaY+7RKBsM7jQw49HTzZjOVqhneiO1eiojSCcgATTsy0D2/o
         vIfQ==
X-Gm-Message-State: AOJu0YwxBn3ezfgDHsMTDh4gmkc8/TWnOGeMmrlyPmc1i3tHzMKOyJPc
	SMU3x5Ggz39fogJipYkOzuIs/Q==
X-Google-Smtp-Source: AGHT+IHL7EnzEs9/TsQ0th1iANW9oVAkCWSJCyHyWJvnKsiTXsDOfMf5GeqEirhaJ/X//VBTrJhfPA==
X-Received: by 2002:a17:902:f392:b0:1cc:64bc:ecf3 with SMTP id f18-20020a170902f39200b001cc64bcecf3mr17796493ple.34.1699347199308;
        Tue, 07 Nov 2023 00:53:19 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:8d0c:a813:4d0:7247:8a5e? ([2402:7500:4ce:8d0c:a813:4d0:7247:8a5e])
        by smtp.gmail.com with ESMTPSA id g23-20020a1709029f9700b001c625d6ffccsm7136099plq.129.2023.11.07.00.53.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Nov 2023 00:53:18 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH 06/12] RISC-V: crypto: add accelerated AES-CBC/CTR/ECB/XTS
 implementations
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231102051639.GF1498@sol.localdomain>
Date: Tue, 7 Nov 2023 16:53:13 +0800
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
Message-Id: <39126F19-8FEB-4E18-B61D-4494B59C43A1@sifive.com>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-7-jerry.shih@sifive.com>
 <20231102051639.GF1498@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_005322_889312_15A0A694 
X-CRM114-Status: GOOD (  14.88  )
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
Reply-To: 20231102051639.GF1498@sol.localdomain
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Nov 2, 2023, at 13:16, Eric Biggers <ebiggers@kernel.org> wrote:
> On Thu, Oct 26, 2023 at 02:36:38AM +0800, Jerry Shih wrote:
>> +static int ecb_encrypt(struct skcipher_request *req)
>> +{
>> +	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
>> +	const struct riscv64_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
>> +	struct skcipher_walk walk;
>> +	unsigned int nbytes;
>> +	int err;
>> +
>> +	/* If we have error here, the `nbytes` will be zero. */
>> +	err = skcipher_walk_virt(&walk, req, false);
>> +	while ((nbytes = walk.nbytes)) {
>> +		kernel_vector_begin();
>> +		rv64i_zvkned_ecb_encrypt(walk.src.virt.addr, walk.dst.virt.addr,
>> +					 nbytes & AES_BLOCK_VALID_SIZE_MASK,
>> +					 &ctx->key);
>> +		kernel_vector_end();
>> +		err = skcipher_walk_done(
>> +			&walk, nbytes & AES_BLOCK_REMAINING_SIZE_MASK);
>> +	}
>> +
>> +	return err;
>> +}
> 
> There's no fallback for !crypto_simd_usable() here.  I really like it this way.
> However, for it to work (for skciphers and aeads), RISC-V needs to allow the
> vector registers to be used in softirq context.  Is that already the case?

The kernel-mode-vector could be enabled in softirq, but we don't have nesting
vector contexts. Will we have the case that kernel needs to jump to softirq for
encryptions during the regular crypto function? If yes, we need to have fallbacks
for all algorithms.

-Jerry
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
