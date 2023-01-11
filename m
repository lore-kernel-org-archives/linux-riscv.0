Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C7EC5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 05:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s7pRlCylDmMofoG3faMb3ra2AvlEal1AS4dhYwUUjQ8=; b=RgGHKuheaA5CSG
	PiAx5dT2onRIiahjQa5FYRB7YHILfct0B2tkijTWqiZfw27BScJLLBr9Z8FjL9Cf5b8Nr7bdzqR5R
	ua8L0JcQuuObXW4b12ThxdjDhVV+/NO9zDvwLQ48GWEBXVo3pMppqc07/08RQguZ+8cwub7yPVSFG
	c39HdDyD7DBHiH4//wugr0TgfUo/jgh8JVwcfbFoUDfNMziUVZoOSQDQF5y6UvigRy0LSo7jhIp1g
	kgmDaoyeQSQ4seqGy8p+Z0aHz3hgcsoIicnM4v6uplcYdHpG3G3AQRhYtydMgTvnCMwFHpsXkBCoj
	m7HiRbbSdjalxBlK9JqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFTaL-009gtq-50; Wed, 11 Jan 2023 05:23:37 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFTaI-009gt1-FB
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 05:23:36 +0000
Received: by mail-pj1-x1034.google.com with SMTP id cp9-20020a17090afb8900b00226a934e0e5so2833042pjb.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 21:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dLEMd7QAY4302pYCJydmN63jL1CYA20WH052aEzhWR0=;
        b=fLYKGUC5znSxDfn0OnnQSZ/5ztBbfA+Le2MpM4rB34uKUUMqPXZQu9fVLXkYVzzXIS
         MOYJhqvKTVFFUcBZ+toMkVZ/Vi98NoorTIg28Hq/f+l9yI7ggdsDn7aq14FV+iWHPbR5
         sVg03ZtHUlm3nQAcsvgSWOAJo+tw9+e5co3p2Hmv/8k8RKzL1T3/iP1ufR5E4Zl8ccv3
         1UkA4/Hjuo4VWrBm2n9ZRztLi7w/CFzPAZ+2NSSSmt0Oh3d0nt7pI1oQsiguWT8xOh9g
         s6AfBUgFbuI5qaOHLVFuq0Oy4yW2F1o/iYTJxN4IdbmVSpJA56BZa9cV7I4mysHKcNeN
         VK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dLEMd7QAY4302pYCJydmN63jL1CYA20WH052aEzhWR0=;
        b=mLKl38DKmP4pv8/7KJ6K6R+K/sGHUap4+Qufxz8ioGUsvSzfOJAwmH6PQdrq47ABqp
         dxPZrw8UViyRPukb9BT4LQKDoy2DbiZZQP0t2IQXzgbQX+8vOT/qGVpz6PZEs64LwkgG
         BFiwMS0VEUThWGvFVJaykY/0dxZQtlLulPEM73bornAcXnMftTKXTB43KPwfajKZD/gc
         B0gi4vkmItypzAHJ7TAE9rNTQRKGKIhq9OcDI8r+AQmzdNCo+qQLozEWGQK6vglFqBN5
         UY5dRgZ1FC6DgAV+XmlLBQinWdit/n2bNuN3vqPNyJgUQ/8vbdExbs2malqwpTHo7fxe
         DPNQ==
X-Gm-Message-State: AFqh2kpqCoVU5aGwJEHrCY+U4p4U396m3/arWx8pYreKZmAejcPer1JM
	1Oc1FU4VO1VvfcWSX0oauqD1RA==
X-Google-Smtp-Source: AMrXdXvZ5UXOtRkwWfFGQ2a9WqyW282LsBwpBiYNAn9QXmlCALa5AX4hUcW5DwokL+x0UkuvodiZBg==
X-Received: by 2002:a05:6a20:b29e:b0:b6:40af:3721 with SMTP id ei30-20020a056a20b29e00b000b640af3721mr1287678pzb.54.1673414611246;
        Tue, 10 Jan 2023 21:23:31 -0800 (PST)
Received: from [192.168.0.115] (63-157-97-90.dia.static.qwest.net. [63.157.97.90])
        by smtp.gmail.com with ESMTPSA id y12-20020aa78f2c000000b00581dd94be3asm9023586pfr.61.2023.01.10.21.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 21:23:30 -0800 (PST)
Message-ID: <b34f9455-e89b-4972-0913-2ab307843f3c@linaro.org>
Date: Tue, 10 Jan 2023 21:23:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Auto-enabling V unit and/or use of elf attributes (was Re: Adding
 V-ext regs to signal context w/o expanding kernel struct sigcontext to avoid
 glibc ABI break)
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Vineet Gupta <vineetg@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Andy Chiu <andy.chiu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>,
 Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>,
 Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>,
 davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, Greentime Hu
 <greentime.hu@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>,
 Andrew de los Reyes <adlr@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org>
 <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
 <91ef3c45-165f-d2b3-7c77-322c01802c41@rivosinc.com>
 <CABgGipXqEkasz2HTC4y6otCP6pFMmyEdYabA+OkUruUOfwypHg@mail.gmail.com>
 <18465ca3-934f-5b3e-170c-1ff0edea3a89@rivosinc.com>
 <CABgGipW66rdMnC99-h9ccuR+E+7fnaMfmzt=1ehGZnvxO34PwQ@mail.gmail.com>
 <a559e7dc-83fa-fac1-5811-95d37c6e662a@rivosinc.com>
 <CAAeLtUCPLD8if+-xikbjD78G=N_bEyMLh3WcZzyJR4Zt2LWz7Q@mail.gmail.com>
 <1f8f1d21-4a19-54fe-8b29-bf9e2a8501d7@rivosinc.com>
 <CALLt3ThickhyW5gX6LNjHXza484Xb5Cg8t7OUYH6hoA3V3GpAg@mail.gmail.com>
 <3a838afe-974b-60bb-a0e5-83e366ec652e@rivosinc.com>
 <CALLt3ThJyH3yihiwq-ZDeP1v5UgQZEsUWNwxOewZBeuocciRJg@mail.gmail.com>
 <b440aeaf-03e6-aa4e-9636-adbf3f841b40@rivosinc.com>
 <3923eeee-e4dc-0911-40bf-84c34aee962d@linaro.org>
In-Reply-To: <3923eeee-e4dc-0911-40bf-84c34aee962d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_212334_546874_73DC2BE7 
X-CRM114-Status: UNSURE (   8.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/10/23 17:22, Richard Henderson wrote:
> And, surely, there's some minimal vector configuration for which the allocation must succeed.

To answer my own question here, no, there does not seem to be a way to cap VLMAX in the OS 
or the hypervisor -- vsetvli rd, r0, e8 will always set VL to the VLMAX for which the cpu 
is configured.

(ARM SVE can artificially limit the vector length.  Linux chooses the default vector 
length so that state fits within the existing 4k signal stack frame.  This is good enough 
for the vector usage within e.g. strlen.  In order to take advantage of any larger vector 
length the hardware may support, one must use a prctl.)


r~

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
