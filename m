Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3ADC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 04:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Vnsc7wQPLSN8aLSxBR2k85eAOAQpLBJ8p4QDF1fLrc=; b=UKZHwcwgupEdhS
	E1p+Pioe+9wHs45ZDUi1W7aJOqVGvG3ivlq5Nx256tsB33AVOrzjTxA2bMzWqqiT1WYyo8FJp3XiU
	bHTJsNPK8nS+kGCUS4R9Ey3C8SqfzGwJ4k9yu1XyN4ortTb06EXEqp5DC0jO4mc6W/bQbr/VUI2LO
	A7LR6TpxGsAlTrUUV0iz3if+3Xve+dFiUgxmTSlyXkSw83WvVeIp9urtZEoaFD2BfD9kwJTRutl4t
	SyCC3ZcKMBPXcc1rEU+m+gtHxNM9CN53FyqgtrqhKkKpx0ghdJHV4IhPzr7/1tSVsrOPX13mKs4kc
	NEVrGK2zFVjfnlZ7Rq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBSIY-00Ef8V-2c;
	Fri, 08 Dec 2023 04:17:10 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBSIV-00Ef6n-2z
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 04:17:09 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5d8a772157fso14468707b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 20:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702009023; x=1702613823; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f7vp8x0oDP3EbH3U6bJ7KDFrE+BpYL9j1ysozmjTXzU=;
        b=KIlFEpVjCO9+xj41iPN/LmC6PsQStVabqr6lMFSvim13uHrQZjbpKs3EtFc+SCtZoH
         NvfdchV8LuxnrfQppjI5qIqhPrEn9H9EOIv3+dFiJa7TqXvhlUZ+Pifaki3QzSgAE1Sf
         7xgMQtCmkWBLAq3i+Ap66oundSu9sllj3Ov33i2RURjL/8gX9MjJQ2tZx2dsR1EcvUDL
         KEHZ+6IHJeKi1qAyGBKv6BmqxZz8fPgjvG7m6qdIPkTqWfXcTNPgVjeUHZsj1t2sNhxS
         Z/V+9BUR/5nP1ME46DyEfhvpG5lkboXFFbmEFu14SIbAiaKGa1KxJuAlDdmRUApeE0V7
         MF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702009023; x=1702613823;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7vp8x0oDP3EbH3U6bJ7KDFrE+BpYL9j1ysozmjTXzU=;
        b=XKgWi5R06l6DA4PoT/WNG2BvXIr9kKKqGa2XU6XVni2agj5V9ITwqQNg8nKz7uq57d
         MoOkDURTtSokxD/eC3Rgzyj05eUmydFbn2QNobS7KyuZFAkBP0jiBSzX80WfxLskr/Um
         JhGWUyRVbhmy8kgritflTFXoGzM1o1VaPRGg2JQ7pNbiu1MO1Fk1NKJEk5UCsd8NgkzO
         KcfmUwwaOnhctTu6g+PMoAf53Sy9hraxTvfFL44UbivnuiA/xqDhhrwKfm8BMykim7+s
         6L745YlMlPtzIJC3mxbPOEzRPNZgglXC8gZdz2emKLOpjNUDOuxXUhV5wODEnTTHO1Zg
         qCiA==
X-Gm-Message-State: AOJu0YxnhNHUfvTx2P3aRTRrNXHFy2g7NJyukLTxwPNDo+9CuBQ7rvIu
	3Y1sbJpXVWBBCUlfTiVQC01y/g==
X-Google-Smtp-Source: AGHT+IFJ7rl316vQtE3r+S2OEJohJzfcnMzp0IFjlp1x5P7qNhZsNS2qZXmMmO5ixQp4wMXH8QWNgg==
X-Received: by 2002:a0d:e690:0:b0:5d7:1941:abb with SMTP id p138-20020a0de690000000b005d719410abbmr3581208ywe.86.1702009023272;
        Thu, 07 Dec 2023 20:17:03 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:41c5:bf1:860b:1e95? ([2600:1700:2000:b002:41c5:bf1:860b:1e95])
        by smtp.gmail.com with ESMTPSA id q5-20020a0ce9c5000000b0067ac1c30e80sm468893qvo.120.2023.12.07.20.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 20:17:02 -0800 (PST)
Message-ID: <86d857bf-a833-4529-aba9-391c49a3550b@sifive.com>
Date: Thu, 7 Dec 2023 22:17:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] riscv: Add support for kernel-mode FPU
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-2-samuel.holland@sifive.com>
 <ZV283NfE/K5zLXDD@infradead.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZV283NfE/K5zLXDD@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_201707_988476_48D1028B 
X-CRM114-Status: GOOD (  10.89  )
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

Hi Christoph,

On 2023-11-22 2:33 AM, Christoph Hellwig wrote:
> On Tue, Nov 21, 2023 at 07:05:13PM -0800, Samuel Holland wrote:
>> +static inline void kernel_fpu_begin(void)
>> +{
>> +	preempt_disable();
>> +	fstate_save(current, task_pt_regs(current));
>> +	csr_set(CSR_SSTATUS, SR_FS);
>> +}
>> +
>> +static inline void kernel_fpu_end(void)
>> +{
>> +	csr_clear(CSR_SSTATUS, SR_FS);
>> +	fstate_restore(current, task_pt_regs(current));
>> +	preempt_enable();
>> +}
> 
> Is there any critical reason to inline these two?  I'd much rather see
> them out of line and exported instead of the low-level helpers.

No, I will define them out of line in v2.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
