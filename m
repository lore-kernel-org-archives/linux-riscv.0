Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE4BC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 01:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9sSlo9ke0/9re2j6yq5SKnMMrGu+cGlMtQcEQTrHec=; b=o/P5Fo+62xTRhi
	VtHz5+rivTRID6+6Ouv5pqmFmnkQLdeHobRI2q9PtZjRXGverrb0NSUPC/G2ODRpgoncRbqXqWccW
	0nCJdAUzYSd0GiTU36OmKczSMxXIgDCwph1S9uJ8x/bwVUwNE0ZeLkU7CvKWrWp5pkMrm7fUPohRx
	Ik9gWUbrH36yS/0HZEgztC+HI2p0I8q17nxEv5uROF/Gq0OS1tO/8LQPzGL7NeYRfw3V8hTe2G7up
	yr0AdiEHEjkH2medrlSRCGIv3vaDtv3Ooo8M5FxLPI7DlXmCdXlGCZ9YxvehgbvAima3qGNIXn9q3
	U5lb7na2kfNwkiAklSIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rF2dY-008o8Q-1q;
	Mon, 18 Dec 2023 01:41:40 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rF2dU-008o7y-2L
	for linux-riscv@lists.infradead.org;
	Mon, 18 Dec 2023 01:41:38 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-336601b92d3so146622f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Dec 2023 17:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702863694; x=1703468494; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QP9cKKdIu0D7eMF95Nv/b4ZXZfvmBhOKtxAVx99xG5k=;
        b=foLmEmajc6LgDlfJBTvvcGBmbfSKDrIBo6CmOCtH7vgsl/OelQ5ScqApt1a/w23I+4
         A7AroNk2lNF7Nw7hHOkxFgbNcJdEMrKTOGHAZGElcr8qYOX+Tzoa5Otm2sii+TTUoZ0p
         tnvNcC8uddb2yaH+/qND6TOoP5BBQMRe1MEYd4bkncbVdTg5mHzrbPc268ewhdzH4Bff
         3AVbaGBCIBMLEQnPRvm51ENUIuYtj4nvP+nKT45RXDb+TAHeS+W4Q296BmC7IKYis8DA
         9pDYUCgp7QS5FZPqfXc1xsTO553N9N4ab/a32lOoj3XUV4iqiAo2tdYVW7Fw63R4TxoD
         aUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702863694; x=1703468494;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QP9cKKdIu0D7eMF95Nv/b4ZXZfvmBhOKtxAVx99xG5k=;
        b=l5aeIyXyE+g64BNU9XVqCMewkIBFI/vq/iBhN5R/Jzf1QpbtWW8ktLLcG3HRnNQZrX
         024SMGU4zjnxbBWXtOZho286PBh1HrnlNijfY9EzLZLvISNnKAR5A6Xz1LshlGGaWiHi
         QyYpImxTnRxl+xFTO7SMOGefKKL1fcbtuQv5d9vUAIYyOrtB9TNFY8Xeonw+tKUAx1ZI
         LoBqqgi8sA9xscS9/w74tICrfvVSxygvmuvKRzNVkKd2fjvfOMPU+0/7vPwwT1sWMF6t
         oyKdmMj3bNKb/eYYYN1JDvOWvC/n3TI+dwPv2HktY2KCiNXDHKpPEOSUOZlPEV9ANqmd
         X2kQ==
X-Gm-Message-State: AOJu0YzF654xo+o7cgFP8QKW2x7lwnm6R4mQ6iasDlZHcU9ihM3M/3Md
	Syic4etQI4Ae200kAReC0Qw=
X-Google-Smtp-Source: AGHT+IE7HTSQXD+eITvRHickGBmH36WAGaciRLnf2AicKyuRSQSP+rduYd3qrZ7c3be5KqEoyS3QCg==
X-Received: by 2002:a7b:c411:0:b0:40b:4f49:4a33 with SMTP id k17-20020a7bc411000000b0040b4f494a33mr18727176wmi.4.1702863694258;
        Sun, 17 Dec 2023 17:41:34 -0800 (PST)
Received: from ?IPV6:2a01:4b00:d20e:7300:c482:b9a:a1b4:9bfa? ([2a01:4b00:d20e:7300:c482:b9a:a1b4:9bfa])
        by smtp.gmail.com with ESMTPSA id fs27-20020a05600c3f9b00b0040b36050f1bsm38786231wmb.44.2023.12.17.17.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Dec 2023 17:41:33 -0800 (PST)
Message-ID: <de80b4c7-1ffb-478e-9117-9d5b829470bd@gmail.com>
Date: Mon, 18 Dec 2023 01:41:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: lib: Optimize 'strlen' function
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Cc: "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
 "ajones@ventanamicro.com" <ajones@ventanamicro.com>,
 "samuel@sholland.org" <samuel@sholland.org>,
 "alexghiti@rivosinc.com" <alexghiti@rivosinc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>
References: <20231213154530.1970216-1-ivan.orlov0322@gmail.com>
 <86d3947bce1f49c395224998e7d65dc2@AcuMS.aculab.com>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <86d3947bce1f49c395224998e7d65dc2@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_174136_877314_2420DF48 
X-CRM114-Status: GOOD (  10.88  )
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

On 12/17/23 17:00, David Laight wrote:
> I'd also guess that pretty much all the calls in-kernel are short.
> You might try counting as: histogram[ilog2(strlen_result)]++
> and seeing what it shows for some workload.
> I bet you (a beer if I see you!) that you won't see many over 1k.

Hi David,

Here is the statistics for strlen result:

[  223.169575] Calls count for 2^0: 6150
[  223.173293] Calls count for 2^1: 184852
[  223.177142] Calls count for 2^2: 313896
[  223.180990] Calls count for 2^3: 185844
[  223.184881] Calls count for 2^4: 87868
[  223.188660] Calls count for 2^5: 9916
[  223.192368] Calls count for 2^6: 1865
[  223.196062] Calls count for 2^7: 0
[  223.199483] Calls count for 2^8: 0
[  223.202952] Calls count for 2^9: 0
...

Looks like I've just lost a beer :)

Considering this statistics, I'd say implementing the word-oriented 
strlen is an overcomplication - we wouldn't get any performance gain and 
it just doesn't worth it.

I simplified your code a little bit, it looks like the alignment there 
is unnecessary: QEMU test shows the same performance independently from 
alignment. Tests on the board gave the same result (perhaps because the 
CPU on the board has 2 DDR channels?)

	mv t0, a0
1:
	lbu t1, 0(a0)
	lbu t2, 1(a0)
	addi a0, a0, 2
	beqz t1, 2f
	bnez t2, 1b
	addi a0, a0, 1
2:
	addi a0, a0, -2
	sub a0, a0, t0
	ret

If it looks good to you, would you mind if I send the patch with it? 
Could I add you to suggested-by tag?

-- 
Kind regards,
Ivan Orlov


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
