Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BDCC001DE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 16:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IEjHYUkAKnxygVbxRKHlhK83uB0JSJWfYNJD9qMcPXg=; b=tFX7STHU0UpzM0
	9Q58pzlIUd6KXFVFJbrwYCF7IHRB3f4/NBBbYOEtgTwEITqCnYQ8ibPCEnuu4RrWq6yqBUSlZOZJ+
	gT5r6eDQeHYTLezKrNKxRfe5g8riN9DG+lM+fwxBfnSfjkdSLJfC8g55RbuT5WpMGkJZIn4kGuvxG
	R4epy970wJ50zcB5MBJJsWftRID1Ug7FTxHh48rwTa41ApnDxzdbvwV7HKi0aO1hQWlJgHg188ZRi
	L+Xeghh1SsZa5tpM/tRnvpLR7DvBEKXjbFf/k95cRHlgOqP2ZdnbGaS1moYSL6X6avQkignJ12O8W
	7SW4NEWpGVARbbixa6vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPGT-002uCl-1a;
	Tue, 08 Aug 2023 16:08:57 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPGQ-002uB7-2J
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 16:08:56 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-686fc0d3c92so3965463b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 09:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.washington.edu; s=goo201206; t=1691510929; x=1692115729;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iitn5cuOhlQstNpnubJ9xUVqIDI2aiSTMtUo1rg4ji8=;
        b=UrZYxnPX6wJckLqe+jHS3YavknBWzDGsZVaSQcowb/6drHVG5WTFt/e2c+tnfwi9XI
         WSWbIvmK2HuHalP3bQO/ORywMviWjLTgM/fZLeeWonueuvPNciSz+q0DBP5t7QsKE0nC
         aU571hs+oXkjBZ5hGWq6QJOU7DICgyw4X2reQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510929; x=1692115729;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iitn5cuOhlQstNpnubJ9xUVqIDI2aiSTMtUo1rg4ji8=;
        b=fngvluGLpIojE2i6eC2PgEyHVffAk4Hi0mirZ4kSYPIBCmHRH34T1pxilepdChrBG8
         zHV95nbR5lC5RgInpjg2SYhQjuPsqgCuSxj+vpEABy3I9HlfOk9qU+7P1n237ribU60M
         dtKodsJmcbka7hmH143dei1GNrFCCKMi5FljQZlq/KvDn+nulkp0wlHUiei6u+fdFVFF
         qi8WT7vbF0gxksduYqg8A/bVE7fRIYhX3ADoJv5kgnXzD/zz+WY/pL8+3pD0SRMQ/tPT
         cjLUz7bBj2q1HSnWhqf4sL4RDPG5gXkkIBarpbKh6SFUmdb3lSi3Y0iMdjkzKlbha0W/
         mpNA==
X-Gm-Message-State: AOJu0YyNigqaqF5JAtEJTukKC73QV9551o+5ZnjgEiWiXbqfBtWayGX6
	yPuii48lEnWSnQquI6gim2/9sg==
X-Google-Smtp-Source: AGHT+IH9xX8PBCYOqX2E3rrxg3GkW9lN4OG91y7i8oztvn0MuJt/DKC0is4yyOhgYYOSjd717Yd8Bw==
X-Received: by 2002:a05:6a20:8e0b:b0:13b:1482:261 with SMTP id y11-20020a056a208e0b00b0013b14820261mr13582306pzj.44.1691510929663;
        Tue, 08 Aug 2023 09:08:49 -0700 (PDT)
Received: from smtpclient.apple ([50.234.50.204])
        by smtp.gmail.com with ESMTPSA id n12-20020aa78a4c000000b00682af82a9desm8497446pfa.98.2023.08.08.09.08.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Aug 2023 09:08:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH bpf-next] riscv/bpf: Fix truncated immediate warning in
 rv_s_insn
From: Luke Nelson <lukenels@cs.washington.edu>
In-Reply-To: <b85bcf1d-9467-4df6-da11-8f0b24165ada@huawei.com>
Date: Tue, 8 Aug 2023 09:08:38 -0700
Cc: bpf@vger.kernel.org,
 kernel test robot <lkp@intel.com>,
 Xi Wang <xi.wang@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <CC58CCF3-1994-4C50-B8FC-E1520ED743BF@cs.washington.edu>
References: <20230727024931.17156-1-luke.r.nels@gmail.com>
 <b85bcf1d-9467-4df6-da11-8f0b24165ada@huawei.com>
To: Pu Lehui <pulehui@huawei.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_090854_804278_FC11970E 
X-CRM114-Status: GOOD (  15.37  )
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


>>  static inline u32 rv_s_insn(u16 imm11_0, u8 rs2, u8 rs1, u8 funct3, u8 opcode)
>>  {
>> - u8 imm11_5 = imm11_0 >> 5, imm4_0 = imm11_0 & 0x1f;
>> + u32 imm11_5 = (imm11_0 >> 5) & 0x7f, imm4_0 = imm11_0 & 0x1f;
> 
> Hi Luke,
> 
> keep u8 and add 0x7f explicit mask should work. I ran the repro case and it can silence the warning.
> 
>> 
>>   return (imm11_5 << 25) | (rs2 << 20) | (rs1 << 15) | (funct3 << 12) |
>>   (imm4_0 << 7) | opcode;

That does fix the warning, but I think explicitly declaring imm11_5
as u32 is more clear here than the current code which relies on
implicit promotion of imm11_5 from u8 to signed int in the expression
(imm11_5 << 25).

Because of the promotion to signed int, (imm11_5 << 25) is technically
signed overflow and undefined behavior whenever the shift changes
the value in the sign bit. In practice, this isn't an issue; both
because the kernel is compiled with -fno-strict-overflow, but also
because GCC documentation explicitly states that "GCC does not use
the latitude given in C99 and C11 only to treat certain aspects of
signed '<<' as undefined" [1].

Though it may not be an issue in practice, since I'm touching this
line anyways to fix the warning, I think it makes sense to update
the type of imm11_5 to be u32 at the same time.

> Nit: maybe use "riscv, bpf" for the subject will look nice for the riscv-bpf git log tree.

Sure, I can send out a new revision with an updated subject line.

- Luke


[1]: https://gcc.gnu.org/onlinedocs/gcc/Integers-implementation.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
