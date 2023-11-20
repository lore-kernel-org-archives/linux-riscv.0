Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6C5C072A2
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 02:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEPsPOvcv9I9Wq+7UJ0bKhqmEMDuLbmms49n0wfr3Yc=; b=byQC6DxCNDVl5c
	g3PGXtHRoq3azhwpPK5opWMKaqPPuRKOM5PlLhYiO4rMqiZbFMPJTbIVWSwRH3rJnxSR0LwVlE4A3
	nuVUZxvK/wONGorPqXVAX3jNMme3LQVrSws6yIqXyHvbig95IgJMuyZauOwPt6zUupIZIRAk4T1Nm
	KjxidMdbvaOxvf+9hOonHmrhyos/4uQ4hg7HRYb+/tSKdJlAley/Pg9oN9V7zQHjKWt2VSJySK0dz
	wW+9OiX6M37/lOnEncFRAoJ6/PS9FMFJzr6gwgSxvlP//a1aZLQvWJU1Nd7M3lyWIJFJIsIJJv5lT
	lMEHoxm3XI7KjrJyftnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4uRy-00AzCu-04;
	Mon, 20 Nov 2023 02:55:50 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4uRv-00AzBP-2c
	for linux-riscv@lists.infradead.org;
	Mon, 20 Nov 2023 02:55:49 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5c186f027cfso2167356a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 19 Nov 2023 18:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700448946; x=1701053746; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQLpISrSuWQBWBAvuQbodwZBDAWI6iXmTyJBLfM/8EA=;
        b=DxjsA6dpeu42u0eA7AkS+EExQuIEdxSQvp+Licgx/XN2Akm2codDOwL3Ctjc9mMGXK
         N4e0hfWs/2VWf0P5gZYgnMVvtIDWm517PrrDfS/kETQTwGEN8CWnrFTawwUFyiyFLyyC
         UTi07suhMJsh65AwS0vE+AVjtmNDVFYIfOxpsfoxiHdQiMrujLRBUwjdxyovDvnL8u2g
         brShBokMH/RiEVy5Yizfdxu3lyBKFzkpWNzfMu6YxDAFdnmxRxha2tEDL1bpzOO+jVcl
         5hpWCwvmrEG2ZKMui9cAH8WxyktsTX6Gxbxuzg8nqSBkzEgflnGB6SL+vr9lt8T0NMON
         ixhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700448946; x=1701053746;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQLpISrSuWQBWBAvuQbodwZBDAWI6iXmTyJBLfM/8EA=;
        b=T+UYXlQRPQjnoO5y1c6nQLLQY1ZLOyYrnoC2vuNQ9XIBtjA4+Ynut2NKQbujJKtF92
         OkBqOlWc18Yc8q246HwVevLS4RV7niSlzKBCDIgQtTqfIVVz8NuDrGed6aio6CplL61s
         +BElk47gWrRfd6tkSydQILy4XSyTa2pQe31i4BZh5HqRmLbRl54Ar4FJ3H6ZJFksgNTm
         384qqS3ZK4/NhJ5TXfziVNYcSg1G1yj1jqruil1rvLK4akvTogBoVWN6/iKb4iw+aUCB
         8T0iAvBbM60AbP/zD4964muuOsPWoeSx/LKcsRgGZMxRt7+nsy3viazl75BB0gcQPkAh
         2NWA==
X-Gm-Message-State: AOJu0Yz2JWGRDTRVtTcr8ZJyPOAf4Yttdm7PpnmuXRJdwJk7/6KJh6YC
	xXnABDVn7Fo8G2OY3/37EFwDeg==
X-Google-Smtp-Source: AGHT+IEw6BVjKQe+wHImLyjUr3AymFfea4UwO2aOMC/OMRsrnoV+SV3vD2csl5EOmm9ds1wLTdzCfQ==
X-Received: by 2002:a05:6a20:2d1e:b0:187:a119:909d with SMTP id g30-20020a056a202d1e00b00187a119909dmr4195928pzl.13.1700448945925;
        Sun, 19 Nov 2023 18:55:45 -0800 (PST)
Received: from ?IPv6:2402:7500:5d5:bc21:3420:fefa:20d4:2a2f? ([2402:7500:5d5:bc21:3420:fefa:20d4:2a2f])
        by smtp.gmail.com with ESMTPSA id y12-20020a170902ed4c00b001cc256ce1besm4928265plb.138.2023.11.19.18.55.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Nov 2023 18:55:45 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH 10/12] RISC-V: crypto: add Zvksed accelerated SM4
 implementation
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231102055848.GI1498@sol.localdomain>
Date: Mon, 20 Nov 2023 10:55:41 +0800
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
Message-Id: <078F58E9-7CCF-4A59-BD29-8E87F9EE434B@sifive.com>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-11-jerry.shih@sifive.com>
 <20231102055848.GI1498@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_185547_850225_61872728 
X-CRM114-Status: UNSURE (   8.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Nov 2, 2023, at 13:58, Eric Biggers <ebiggers@kernel.org> wrote:
> On Thu, Oct 26, 2023 at 02:36:42AM +0800, Jerry Shih wrote:
>> +struct crypto_alg riscv64_sm4_zvksed_alg = {
>> +	.cra_name = "sm4",
>> +	.cra_driver_name = "sm4-riscv64-zvkb-zvksed",
>> +	.cra_module = THIS_MODULE,
>> +	.cra_priority = 300,
>> +	.cra_flags = CRYPTO_ALG_TYPE_CIPHER,
>> +	.cra_blocksize = SM4_BLOCK_SIZE,
>> +	.cra_ctxsize = sizeof(struct sm4_ctx),
>> +	.cra_cipher = {
>> +		.cia_min_keysize = SM4_KEY_SIZE,
>> +		.cia_max_keysize = SM4_KEY_SIZE,
>> +		.cia_setkey = riscv64_sm4_setkey_zvksed,
>> +		.cia_encrypt = riscv64_sm4_encrypt_zvksed,
>> +		.cia_decrypt = riscv64_sm4_decrypt_zvksed,
>> +	},
>> +};
> 
> This should be 'static'.
> 
> - Eric

Thx.
Fixed.


-Jerry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
