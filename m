Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A657BCCD1A5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 13:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17TngGaU03zWNErJjkED/6aMEOggk7DEh/U9cqYjpmQ=; b=ok1uhUZyhzfflx
	FR8mon7m9JksC+a6LL7sL+KbtQOgR9CC6yCceAhOtQrBED7gOJF9CsziH9Hv+0g9LNupd9l89gAky
	Pem+MWDJZvf091307QIcSzKLAJtSfkOqFYVEnbnheHhaquMx7/qQIX+YWsTr7IqfSevfchfGdQDyY
	7UHxJFOvqAvh0yDwegKuvu6ds5w494L367QxSH6u1L5gcGrjq1QWk0Ve/BFm0Xt6DZR2zCwzJhyy3
	nAn4UtEbRk8nxQmOacIeEphoUVEaN1snqkiQ3u3NsUkeJ3vmYECFSsSHpYMdipLkOKTFG7UVf+J0Z
	vEhBq2L9VuOAccBJKBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqv42-00000008NQe-0xsU;
	Wed, 18 Sep 2024 13:49:50 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqv3y-00000008NLW-3nOG
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 13:49:48 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8BF103F5A2
	for <linux-riscv@lists.infradead.org>; Wed, 18 Sep 2024 13:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1726667382;
	bh=DRPOUgnzyEYA3nZ43EginjRlwFYjkpOPaT3U4/1W7+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=YLI0UQKNiJa/qfTntn0CBtmd+9YK/g075paVLKDNJiUvMHqs5o/HYFSC7y70BkEtQ
	 j6fb8M/XksFMQdbh+/537lb44Z4KxbOQwywFjuhvOANfSl3BSDeMxxVM+LD1sHIWDv
	 D3wDEYReUgTwL4nzsEPVM4mx7Dv2/iIXOse+dm2dxsXmMVglGSLvxKZlHs99OFdS8x
	 Lc/3+tInkdgVhI5ViGEvP4CwwHqHIYQnRkHB2l2YlYcqU6wlvmT2KNiv/JZ2B4GaXD
	 mtOouyzoBbp6HsCiJwMgirowJpXE+X1qyVZl91qr8/VQTcWsHh7CcccBT/f385rJlV
	 +X1PjL/FYl9xw==
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42cb830ea86so48392755e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Sep 2024 06:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726667382; x=1727272182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRPOUgnzyEYA3nZ43EginjRlwFYjkpOPaT3U4/1W7+E=;
        b=PAkPeoiNXeSAeEB2lg9cAz6lYBpcBvwwsNyYBXpvjjspYzWPCZJAwfHQY3n3UBsbF+
         f7nKO2qon5pCEgCEPEhpArMV7tm0kPzzOY0flVP5zYVFkJBufz/PbfnVaeWOyyEWdnRA
         KVOb1IO6P+w2p1Kw/On/ItcKvH7D2XduFoN/Dj+yYpNwTfQPQOVdW2l2mSrLMVbax/wP
         1Cy+H0aDSh0ZkCbaMwGh0iLSVji/TWz/I0GzbwXHyBiyRg4MRQGBU8dXF8Xy3iXw4Dx6
         cn0QIEnVl+1g3a3xG7DxG6lQHFdsDUS8T25TeypF/+LUfQogyg0Z9OQTB3DfHBh7hSNx
         H0XA==
X-Forwarded-Encrypted: i=1; AJvYcCWeV3hFlffD5p91XPMPwwYntzNYbM0DFBhacrPjrtafO9KxGZHOSPqWHK2zse3PJyoAtd4qdp8giRrX2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhbKMRRjtnUycQUkKEjWa0N80wJEARznM8J1i7NTQv4nnawlil
	QYRwt4OSZn6sHitbreVoCuW0xX+ooOC9I8B6xLYShm20fATtYIOSlrKO5J8Ql0OXLhhSKRKzfUY
	FbGoWbU1IdU7Pndxn/5S+yWu83vCNpK1znbPnhDo9jKnu3qA2gYO47LSIlXxbeQFQI6gOy8bHTg
	M5q2lITQ==
X-Received: by 2002:a05:600c:251:b0:42c:b1f0:f67 with SMTP id 5b1f17b1804b1-42cdb66c968mr131499315e9.27.1726667382035;
        Wed, 18 Sep 2024 06:49:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBOsqcqK7DIjaRwTLHJ9k04jg0yeHQj80Lyu8/abqW0i9TY/peT/h53jDVVzNmlDEM5SNbxg==
X-Received: by 2002:a05:600c:251:b0:42c:b1f0:f67 with SMTP id 5b1f17b1804b1-42cdb66c968mr131499145e9.27.1726667381488;
        Wed, 18 Sep 2024 06:49:41 -0700 (PDT)
Received: from [192.168.103.101] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7053856esm17475835e9.33.2024.09.18.06.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 06:49:41 -0700 (PDT)
Message-ID: <f1e41b95-c499-4e06-91cb-006dcd9d29e6@canonical.com>
Date: Wed, 18 Sep 2024 15:49:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] target/riscv: enable floating point unit
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20240916181633.366449-1-heinrich.schuchardt@canonical.com>
 <20240917-f45624310204491aede04703@orel>
 <15c359a4-b3c1-4cb0-be2e-d5ca5537bc5b@canonical.com>
 <20240917-b13c51d41030029c70aab785@orel>
 <8b24728f-8b6e-4c79-91f6-7cbb79494550@canonical.com>
 <20240918-039d1e3bebf2231bd452a5ad@orel>
 <CAFEAcA-Yg9=5naRVVCwma0Ug0vFZfikqc6_YiRQTrfBpoz9Bjw@mail.gmail.com>
 <bab7a5ce-74b6-49ae-b610-9a0f624addc0@canonical.com>
 <CAFEAcA-L7sQfK6MNt1ZbZqUMk+TJor=uD3Jj-Pc6Vy9j9JHhYQ@mail.gmail.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAFEAcA-L7sQfK6MNt1ZbZqUMk+TJor=uD3Jj-Pc6Vy9j9JHhYQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_064947_088574_8DCB8E58 
X-CRM114-Status: GOOD (  18.26  )
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

On 18.09.24 15:12, Peter Maydell wrote:
> On Wed, 18 Sept 2024 at 14:06, Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>> Thanks Peter for looking into this.
>>
>> QEMU's cpu_synchronize_all_post_init() and
>> do_kvm_cpu_synchronize_post_reset() both end up in
>> kvm_arch_put_registers() and that is long after Linux
>> kvm_arch_vcpu_create() has been setting some FPU state. See the output
>> below.
>>
>> kvm_arch_put_registers() copies the CSRs by calling
>> kvm_riscv_put_regs_csr(). Here we can find:
>>
>>       KVM_RISCV_SET_CSR(cs, env, sstatus, env->mstatus);
>>
>> This call enables or disables the FPU according to the value of
>> env->mstatus.
>>
>> So we need to set the desired state of the floating point unit in QEMU.
>> And this is what the current patch does both for TCG and KVM.
> 
> If it does this for both TCG and KVM then I don't understand
> this bit from the commit message:
> 
> # Without this patch EDK II with TLS enabled crashes when hitting the first
> # floating point instruction while running QEMU with --accel kvm and runs
> # fine with --accel tcg.
> 
> Shouldn't this guest crash the same way with both KVM and TCG without
> this patch, because the FPU state is the same for both?
> 
> -- PMM

By default `qemu-system-riscv64 --accel tcg` runs OpenSBI as firmware 
which enables the FPU.

If you would choose a different SBI implementation which does not enable 
the FPU you could experience the same crash.

Best regards

Heinrich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
