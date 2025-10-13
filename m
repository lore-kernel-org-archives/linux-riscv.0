Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87EECCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 05:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQNa5hW1+GHbavA28Rm5Zc+VbQTqSRcmodK2vH4gB3Q=; b=Y4yMI64WBGmCm5
	qx4FgInaDzHxL+L0eDZiblXZmFFx+zIRWvjoX00Ge2xU0zYrv+nPI8uyY0nCP1blbwLZP/h5CPzb6
	D07eFM1Sks51MyF+3vYPzHZOlFy8bTjajc9SVUwh++DzpdYz1im2zkmQ0+Yz8uYbh9memot9j1fKw
	Z5NQsvQTb8k05B2+OzU/DWVUHw2w9qhIar7DAHTu4wLMi+7HT7Qj6sbi/z76w2iar6njo+lsLSURh
	3fo+1KadOvKQeBnoDCGp3e8BICrXcSsapjgFLUIGnLwnJmuGZSXanO45Omc2jECeUWUvk1AdEpLKl
	e3KPPTp005IvOt1ZNdEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Auc-0000000CEMh-2BlW;
	Mon, 13 Oct 2025 05:15:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8AuW-0000000CEMC-2TqZ
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 05:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760332548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=COGg+i2yWCaVH5Pe+jyOQ0yVolTjfIQ8BpLZsuPuqqk=;
	b=Z011ukz3O4yc5ggqnuyV5AsiFK+95WTAgdDtMp3u+dRutC4CDNHsvgmjpn/gsfIWosnUG1
	oj7+P3GILp2nFpJBw1q75k1E3AwJ01HdG3q54dwpop0Mx7Vl/UjhFAiE4sI4tqkjoQLobV
	uyB18rruMM5keC0Uhm5NNEnWI+JUVBg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-HVzq1aGfOcGY2oS_wjNYbA-1; Mon, 13 Oct 2025 01:15:47 -0400
X-MC-Unique: HVzq1aGfOcGY2oS_wjNYbA-1
X-Mimecast-MFC-AGG-ID: HVzq1aGfOcGY2oS_wjNYbA_1760332546
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b3afaf5defdso454511466b.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Oct 2025 22:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760332546; x=1760937346;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COGg+i2yWCaVH5Pe+jyOQ0yVolTjfIQ8BpLZsuPuqqk=;
        b=fSKOnUJi0OSM0WtHlWzj/8QSPoViMbkgQy3ggF1m9mN0VPVC9uKPqqT3ZmwgdQK5d2
         0O5kD4hAORQ6kZqewVAmZOgBygVTs5EnrdihSEsT/+BD/Q/NGgYA5MApbYp12jZ5opDe
         8Pyrjr7kjHBsrdwuPjDKWlSv2F7XqGrpVDDYxYp9U8AKDpFYbAMJTNsfaegWhhC8Xmo5
         Mvv3AKFojqDu/qxTiNZCFH7PGqVMWs1xqKiu/xRDQ+sKy9zPjnI8NVqaCWuIAItTpALc
         lQ6LyFuoh9L6xJ8m7jEOPScrSizMQ6h7LfCqJeZdi8aAiK/BCp8ZpuzDw672xz1LwjNa
         fdVw==
X-Forwarded-Encrypted: i=1; AJvYcCUwxskaUX1utMFae1IFNwtnT9zZ/hDFLvu7hexTshuqaEtfbC7nuLk0f95tkDl63IbzAFqsrANcGeQEUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyT9Qo8lc3flgxXue6w52UST/Ml5ehtsMuTm6t04PYO0t9KaUQP
	jDj3CXXndwP2O+eh3cXunBgJgPmkElkZY9w5xKyBXIGmkSHxc7MBQNUaKZVa8Xc2mlKd6BqGnSp
	G26j7xWX2JnJQXB8mTGpTCBnc6ty/aH8zekWUWTiQWtCs0DIegvwtJABUx1RILnvX3CNfGA==
X-Gm-Gg: ASbGncuzYgN/3bc4RaWvr0NkCAhDr57VUzNqSS2q7npxbtZotaLsHPo0Mb7XhjPjfTp
	dFzq3jZDxvvwygo7pwB27BdQAaA/TJRcNK/kd8TryN71aA+/bwyuvPOQQ+Bu14lz3xYqqBEgjGS
	O/79SAdtfVul0yQRJdgSCf7hRa2KPLfte1w2NZ41Fvu047wl8LrLDMsBOayYLfmaZxliyco9oxI
	iU1EYmGInoS2ACz+ZdZOALc3Bh/WJxqyN+W2hXhSG8Bj9p/c5Vhfp9LEj/WMKR/NkSX50fNH5Nr
	CsWegJLQs4ixgZGP7cyeO5jq3V6E4jpQQ+2mMdvJNFrsFb1gZdvsxx6fGQ6S962QtDjRtq6WiKM
	IQFK4
X-Received: by 2002:a17:907:3e26:b0:b30:c9d5:3adc with SMTP id a640c23a62f3a-b50ac0cb60emr2029700466b.49.1760332545807;
        Sun, 12 Oct 2025 22:15:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0BLL5ym10+7IOS/4ADPAE3xmIWwOixiOSvRuUXHeG5IWZoopu52WXdAPSV83jHZhbSNAz4Q==
X-Received: by 2002:a17:907:3e26:b0:b30:c9d5:3adc with SMTP id a640c23a62f3a-b50ac0cb60emr2029699366b.49.1760332545369;
        Sun, 12 Oct 2025 22:15:45 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-112-083.pools.arcor-ip.net. [47.64.112.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d69d1576sm842992066b.39.2025.10.12.22.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Oct 2025 22:15:44 -0700 (PDT)
Message-ID: <2a5b4da0-e13f-4188-bb21-9e0afe7d40e8@redhat.com>
Date: Mon, 13 Oct 2025 07:15:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: Add kprobes KUnit test
To: Paul Walmsley <pjw@kernel.org>, Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250513151631.3520793-1-namcao@linutronix.de>
 <16b74b63-f223-4f0b-b6e5-31cea5e620b4@redhat.com>
 <87frc9h0lo.fsf@yellow.woof> <87v7l17e8g.fsf@yellow.woof>
 <e905cf0e-3ac3-46b3-5f9e-1356f8d2a222@kernel.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <e905cf0e-3ac3-46b3-5f9e-1356f8d2a222@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JfgV_qeykWQIFeGKc_zdo3Ytx75KsG8xkQWTb8JuiBg_1760332546
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_221553_058465_6B2F33AA 
X-CRM114-Status: GOOD (  23.92  )
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

On 11/10/2025 00.03, Paul Walmsley wrote:
> On Mon, 29 Sep 2025, Nam Cao wrote:
> 
>> Nam Cao <namcao@linutronix.de> writes:
>>> Thomas Huth <thuth@redhat.com> writes:
>>>> Could you maybe change that into "__ASSEMBLER__" instead of "__ASSEMBLY__" ?
>>>> I'm currently trying to get rid of the latter in the kernel sources, see:
>>>> https://lore.kernel.org/all/20250606070952.498274-1-thuth@redhat.com/
>>>
>>> It's been applied, it's up to riscv's maintainers how we should do this.
>>>
>>> I can send v3, or a follow-up patch.
>>>
>>> Or riscv maintainers can also squash that change into this patch, or
>>> into your patch.
>>>
>>> I'm fine with any options.
>>
>> Riscv pull request is already created. A follow-up patch it is then.
> 
> I've queued the following for v6.18-rc.

Thanks a lot!

> Thomas: have you considered updating checkpatch to scan for instances of
> __ASSEMBLY__?  Might preempt these sorts of manual fixes going forward.

I hope to get in the final patches soon ... so once that's done, 
__ASSEMBLY__ won't get defined anymore, so using it by accident will then 
cause a build error in assembly code - I hope that's obvious enough that we 
don't need a (temporary) patch for checkpatch.pl.

  Thomas


> 
> From: Paul Walmsley <pjw@kernel.org>
> Date: Fri, 10 Oct 2025 15:50:24 -0600
> Subject: [PATCH] riscv: kprobes: convert one final __ASSEMBLY__ to
>   __ASSEMBLER__
> 
> Per the reasoning in commit f811f58597ac ("riscv: Replace __ASSEMBLY__
> with __ASSEMBLER__ in non-uapi headers"), convert one last remaining
> instance of __ASSEMBLY__ in the arch/riscv kprobes code.  This entered
> the tree from patches that were sent before Thomas' changes; and when
> I reviewed the kprobes patches before queuing them, I missed this
> instance.
> 
> Cc: Nam Cao <namcao@linutronix.dev>
> Cc: Thomas Huth <thuth@redhat.com>
> Link: https://lore.kernel.org/linux-riscv/16b74b63-f223-4f0b-b6e5-31cea5e620b4@redhat.com/
> Link: https://lore.kernel.org/linux-riscv/20250606070952.498274-1-thuth@redhat.com/
> Signed-off-by: Paul Walmsley <pjw@kernel.org>
> ---
>   arch/riscv/kernel/tests/kprobes/test-kprobes.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.h b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
> index 3886ab491ecb..537f44aa9d3f 100644
> --- a/arch/riscv/kernel/tests/kprobes/test-kprobes.h
> +++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
> @@ -11,7 +11,7 @@
>   #define KPROBE_TEST_MAGIC_LOWER    0x0000babe
>   #define KPROBE_TEST_MAGIC_UPPER    0xcafe0000
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   /* array of addresses to install kprobes */
>   extern void *test_kprobes_addresses[];
> @@ -19,6 +19,6 @@ extern void *test_kprobes_addresses[];
>   /* array of functions that return KPROBE_TEST_MAGIC */
>   extern long (*test_kprobes_functions[])(void);
>   
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>   
>   #endif /* TEST_KPROBES_H */


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
