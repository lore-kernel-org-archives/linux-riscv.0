Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4EBC54E58
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 16:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JbCLQheIi6MD1bsxIr1IUxtJLudaPDGT8NS+NByQfSY=; b=OWcBq3aUqLnt8c
	bOHOe9aD0Co7cBe2O7+7B+rSMcHBn965f5pW3nqVmxcseaWOZ8Vo8wGnlzffx00qCH5dW7Fg1muLo
	ASFfCnzJdWwvnZhr7RsB/E+9tYC3/aBIHddTpKO+0aEdRwRXe282bKd686j8ebf1CzELGNQa2u00U
	KMfrnIgbHnQdVaftY8/dW0esyQ3go4bFk4RtmQoN1UEwG1zXK2S8KJGxCFUq2h9mPkf6PLp9hf+D8
	yivyq5JBzZhBqxzAnCGXDLkXG88p4TTqltbg1vHZ3oGKpUMSR0R3MINFORABEFITYPerrWDCw6mZN
	t7YNpC5R939cXsvjWN0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro4ZR-0000000Al61-0Mfn;
	Sat, 23 Mar 2024 16:50:13 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro4ZN-0000000Al4M-2Ow0
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 16:50:11 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2d4a8bddc21so42017871fa.0
        for <linux-riscv@lists.infradead.org>; Sat, 23 Mar 2024 09:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711212602; x=1711817402; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HnA+iaUYbG4Zl+BUkgQEG3RRYKiMKGopzjr/nHZbKKo=;
        b=NIIJkKjo/whOEtzVGjHeDypnNIoLVf7eM/Cs5xvxzKOCiC783d70Serb1aoO8kHRTL
         9K4Si7O08zpge7GJmg679uHTI6R390JjqBfVec9ihp1Q6ZoPGyppA+gW9Fg1KmaBPhFX
         NkDFEWITKv6AliLEwyrJaDa2eKZAv6bnyDrmsTrL9Z9dZAb9cl17SWHJZtGl9tFL4yGH
         xApLDO9H3B9jgewMuMJhFXjjIZ1FJbgYCvYkXuOP1jFz4w4kI2uWrCWfTfuQYoZDP06X
         PuhYLEyx9k4+NWSAx25xyZ6KYAQKLkcTnXruZ04/2QjKy86EmnqPKFjOP0Lwla/VhWSq
         m61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711212602; x=1711817402;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HnA+iaUYbG4Zl+BUkgQEG3RRYKiMKGopzjr/nHZbKKo=;
        b=NlZ8OHoIii5LIWWSNj+E9BjqWM5Xvmx4/t/E21rPx9Y2m7UKkBNmEFEDCkgnFE7gLA
         Csky11FROh/FZ2UqUgSsnlTZbF217gOgDSi7QeeMg8AA27UwlinTSjx6G74PuGYuWGrd
         vBF4WVgHX7d8OgRMgZw7rXyNw50gWGqewfuxNrXw2/nT9pWZjbhaJydGuW/Vb4/6rEG3
         sJtddmfG+632Bq2uxiqCjTGy1PBPuC6Ia05GdZ0A6PttX9q7oJ+CkXpjDl/JUSorkd4/
         qOyp1swcFnWlY3zL7eQvloOqa3c6VzhZD93MqAiBEkisX3u+vs6am3JLnjAzx96moEj1
         o3aA==
X-Forwarded-Encrypted: i=1; AJvYcCXLTKfQyjTAtppkTzySDymvFdH443uZu3zgzjke0fDjVEhFksmDsvCjcESPst6M6jnCF/4JDRWj5fHLVQU3dbyWUuWf0FyVNMW1DsY5nc/f
X-Gm-Message-State: AOJu0Yy4pvaJGcJYzebAh0k0+n6UprjOT2khQkFyphJHXE5TbUfHLhIw
	TngLHOoc/e92OKks0T/y9ETBp8k3RcGIPF8xZbpQzG3ePMALdxC6
X-Google-Smtp-Source: AGHT+IHCcxMTH7762NkjXUWik4Nd9KALd68m94V4NNqeQwzxO1MBq0tT9rOVo2N3NsCmmWY/uvGQkA==
X-Received: by 2002:a05:651c:1042:b0:2d4:764f:8256 with SMTP id x2-20020a05651c104200b002d4764f8256mr1716395ljm.53.1711212601733;
        Sat, 23 Mar 2024 09:50:01 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id fc19-20020a05600c525300b0041401eb021asm2949255wmb.24.2024.03.23.09.50.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 23 Mar 2024 09:50:01 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Pu Lehui <pulehui@huawei.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, "KP
 Singh" <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, =?utf-8?B?QmrDtnJuIFQ=?=
 =?utf-8?B?w7ZwZWw=?=
 <bjorn@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang
 <xi.wang@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next 2/2] bpf,riscv: Implement bpf_addr_space_cast
 instruction
In-Reply-To: <3e07fb21-da08-4183-8bd4-064b519c7ddb@huawei.com>
References: <20240323154652.54572-1-puranjay12@gmail.com>
 <20240323154652.54572-3-puranjay12@gmail.com>
 <3e07fb21-da08-4183-8bd4-064b519c7ddb@huawei.com>
Date: Sat, 23 Mar 2024 16:49:54 +0000
Message-ID: <mb61pjzlslwp9.fsf@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_095009_638936_1B11F429 
X-CRM114-Status: UNSURE (   8.88  )
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

Pu Lehui <pulehui@huawei.com> writes:

> On 2024/3/23 23:46, Puranjay Mohan wrote:
>> LLVM generates bpf_addr_space_cast instruction while translating
> [snip]
>>   
>>   /* Convert from ninsns to bytes. */
>> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
>> index f51b832eafb6..3c389e75cb96 100644
>> --- a/arch/riscv/net/bpf_jit_comp64.c
>> +++ b/arch/riscv/net/bpf_jit_comp64.c
>> @@ -1083,6 +1083,16 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>>   	/* dst = src */
>>   	case BPF_ALU | BPF_MOV | BPF_X:
>>   	case BPF_ALU64 | BPF_MOV | BPF_X:
>> +		if (BPF_CLASS(insn->code) == BPF_ALU64 && insn->off == BPF_ADDR_SPACE_CAST &&
>> +		    insn->imm == 1U << 16) {
>> +			emit_mv(RV_REG_T1, rs, ctx); > +			emit_zextw(RV_REG_T1, RV_REG_T1, ctx);
> combine mv and zextw will be better

Do you suggest doing:

emit_zextw(RV_REG_T1, rs, ctx);

Will do it in next version.

>> +			emit_imm(rd, (ctx->user_vm_start >> 32) << 32, ctx);
>> +			emit(rv_beq(RV_REG_T1, RV_REG_ZERO, 4), ctx);
>> +			emit_or(RV_REG_T1, rd, RV_REG_T1, ctx);
>> +			emit_mv(rd, RV_REG_T1, ctx);
> ditto, but for or and mv

How would we combine or and mv? 
also, we have a beq above and in one case both or and mv should happen,
but in other case only mv should happen.

Thanks,
Puranjay

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
