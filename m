Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5655BC46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 01:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2w2QdKhqQbz/gEMipkhZlt+LuErkOdUWYHFsDPfJKKU=; b=Ir5u8uj8S9piXT
	wFgPQfSuf5+WVE5YV5oPn0jBjaCcnyc0gNPoTm88ZUvPb86VDxDbg5+HvR6Z57FZvrUEpCdXEwRij
	7Qo8H0tJ4wRYT+/PnrfUfi84d7gmQwBAFTTBx8zDda48qicnPVcAwJK2oSmG5Owb0/ZACBpWDTU+W
	NIX9m78nRBHuTjvrxXCIg5vgN09lmL7f1Cs5daaJySBMdXBZaBvONnkn5F+id5atRovBT/9cQynvE
	3YBJxVsy/PycQmnKqNKWJOVHAjwH/Cnx+nw0vtL06pd41RylVszdojGvjUJ6NCqDw8exVTUQQ8Sdl
	c8cTgLAeZK6WxhAlzs9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFPpH-0097Pz-LJ; Wed, 11 Jan 2023 01:22:47 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFPpE-0097PL-Gp
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 01:22:45 +0000
Received: by mail-pl1-x634.google.com with SMTP id s8so6808284plk.5
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 17:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hTL/z7TYLmenYRsL7oKxA3VtgR9zwFc2T1cHpmtPgHA=;
        b=vkStbrjZ8vNbtsrCtY9AdIhEdxVfGWDNaE/s13iPOdleVehk75vl3bfa8rCZMj9dT9
         rT8B6K755LektbTBOiYUObJ0QUMGUIQh1BNh3KiKHvlYifnoSp8ftsLJwhX29YZxtiRT
         dY8Nd0iiakDbmAeHizUUR5VlCvvV+u1wEXbvvgDJBmXtk7INBF+USMNcmjzArZYBWC6v
         k+cdCSGuCewXLjFbLz3pbfR4sqIrq5Ciw1cvKUfxMvD2AW8xxkxgs8lM0sH8wLUDJfI9
         aymt3PfHRbYkO82foArxZrR+Z6kGMF/zSD7aGiOaDboQfkeeVM4JEGmXuWxMKDd5hB4x
         rFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hTL/z7TYLmenYRsL7oKxA3VtgR9zwFc2T1cHpmtPgHA=;
        b=RgWcuxni+/B9KcG12aLlHqLuhB/tmSFJfxLHa4NzzRgUNGUd9U8NE4RffkRqVmGBdb
         nW8KDjC4nyz2g2ioTsIKOrjKvNbi0WqbB54rXtn9icww1FMz+l0B6B+JWceAhUso48AT
         J7mODCnxgjDP7Ig99I07vDznW2iEt7/pyw9tWOykFuwa404VDIG/YTEXaoNh5eE6RAyX
         A8iZ/wngHU/wQUSYKfqSs73Z2syx6qKBCyOaEFJf6JF7Kdvnqz3pc8xzMjkul6g5CqvG
         pyqyAAMLtokcjWHxB+uZeDmqGdGkTSMtmPSVSSn7n7LYwoHklbs0P1M3eebopUnWjOLT
         p/ZA==
X-Gm-Message-State: AFqh2kpe949Wx5JrCdwBzzq/RAAVJbFYvuP70YsmZ8vCgLHEvBfPlWyF
	ZVvg57VnDF9PoaP8CrMxFfV1VA==
X-Google-Smtp-Source: AMrXdXvbL7c7Q6mjTqDlD18bK+d9ngDorZ7YFFQsEzv3N2nzE8B1b1qAziM2zmlBz2aZlWvRJN1vMA==
X-Received: by 2002:a05:6a20:3955:b0:b5:ee36:59a8 with SMTP id r21-20020a056a20395500b000b5ee3659a8mr9571480pzg.2.1673400162098;
        Tue, 10 Jan 2023 17:22:42 -0800 (PST)
Received: from [192.168.0.115] (63-157-97-90.dia.static.qwest.net. [63.157.97.90])
        by smtp.gmail.com with ESMTPSA id ik9-20020a170902ab0900b00189743ed3b6sm8801912plb.64.2023.01.10.17.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 17:22:41 -0800 (PST)
Message-ID: <3923eeee-e4dc-0911-40bf-84c34aee962d@linaro.org>
Date: Tue, 10 Jan 2023 17:22:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Auto-enabling V unit and/or use of elf attributes (was Re: Adding
 V-ext regs to signal context w/o expanding kernel struct sigcontext to avoid
 glibc ABI break)
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
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com>
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
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b440aeaf-03e6-aa4e-9636-adbf3f841b40@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_172244_618811_8266D450 
X-CRM114-Status: GOOD (  11.98  )
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

On 1/10/23 10:07, Vineet Gupta wrote:
> Yes bulk of glibc might not have vector code, but those V ifunc routines do and IMO this 
> information needs to be recorded somewhere in the elf. Case in point being the current 
> issue with how to enable V unit. Community wants a per-process enable, using an explicit 
> prctl from userspace (since RV doesn't have fault-on-first use hardware mechanism unlike 
> some of the other arches). But how does the glibc loader know to invoke prctl. We can't 
> just rely on user env GLIBC_TUNABLE etc since that might not be accurate. It needs 
> somethign concrete which IMO can come from elf attributes. If not, do you have suggestions 
> on how to solve this issue ?

Why not just fault on first use to enable?  That's vastly less complicated than trying to 
plumb anything through elf resulting in a prctl.

You might say "but the fault could fail to allocate memory", but honestly, the prctl isn't 
able to fail either -- if it doesn't work, the process must exit.  And, surely, there's 
some minimal vector configuration for which the allocation must succeed.


r~

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
