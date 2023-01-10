Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D99EC46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 18:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6RGpYGZ90LJFKoOP/prze7rjU0N2kbWXUuR8hgY4T0=; b=bDJnGQDH1thOIg
	v0j6P5QS60KSM/ny3uZHB1ixA/1wzw9DgUTrvhyePNfTxUuxUP8KOsoMKcePBzO1jmLd3kB+hIRdr
	Y5Ur9ccRs+yu9HIRxmVMq9y174V54xwEvoG47B2y6OeR/WD2JfO2Ea4DTrN1gMkMALMsl/yamoAJZ
	t6cbNDaD5BXjSc8sIXz1jafGL1a5IYE/bDFk/mDXAAwIDrT2nvItCWYQwyijH5zos8EfKEpkTBQpl
	GFS1orZ+aGFclpvsUo/Su6EzyEwVBY4Qw/OuXnmkGTTUVgTkdE0LXWMsz6E28URLAyvzjsCMjw+gA
	T/ELZdjzHBRUJ622l1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFJ2O-0086k3-Gl; Tue, 10 Jan 2023 18:07:52 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFJ2K-0086jF-Ah
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 18:07:50 +0000
Received: by mail-pj1-x1034.google.com with SMTP id l1-20020a17090a384100b00226f05b9595so12357189pjf.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 10:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k1oYIZUpjUTlOPTFNNXkKi2LbJfMrj3YNY+VpoU4zMM=;
        b=mbqwk8GcxBUP7bioTWXbBA8JxfvsMrLmUaZgEh8UcuXysZ86H6T7ko3O3EZCApQReq
         GMKfuWbqwJ5rv9L2nhRRec08ORtrGAeyYbBNkVYB4gBNC9mXSLUrdTEQNCwXWBfl/BCD
         dj315ca8VWLyVl4GKm/fV+rmWuzw/70gNiwwK/Kt7vyQLf33XAyLIBOovL03qPjOrJ1q
         WACadJZu7IBkEzU6OLT+e28R5HsPZNsV0LXBsm/ehq4j9xvSdH5pY/Tgf6AAuZauRLEP
         /gLCHJmvFZgd9irlbg8owfRHvDja5FUKqtRIkWk7qbXNJm/Slc/GtI6q31Kcx0rKLoKI
         TRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k1oYIZUpjUTlOPTFNNXkKi2LbJfMrj3YNY+VpoU4zMM=;
        b=ptJeZDIjkJ+tOOWUrWB7zWXsK9/IIEOVGZ3zC1G+YLZTim+GYWWKBSD3Nvzta3NS08
         kXDxfbjugwQ8KZUu/F+UkrRQEAZ8QVFJk6wRsD0WUkee5P1KLNiDHgpUcHmLcH9KClyO
         xFTxipnDLL12ciya6B1/ezcsCv83xn23K+VsdN++BmWcJa2F0nljBU4u7Geyl9rp6z7h
         4LUVG5meV4TMG8W8yS+j1BWCj2UgeBcCzfQJbHK/AhJBNkFbZrNnVrf+hh28CD7a3jT8
         RJj5soPioTPJAM/1PcQOF3yrCbPdeQ+ZB0ffPhM3xfqvpjPOED/sNHF+VGEykX9qagPA
         B1KQ==
X-Gm-Message-State: AFqh2kpSoXltErlzHxcnQo8AYkRbkIOUdj1KNWohOnYRA60xcBu597/h
	4iB4hGNr+jUYzEoQitcu1DOoxg==
X-Google-Smtp-Source: AMrXdXs9AvXlmDlRU2QLRSHdBj3XjEIJcmmMN18gQw/tbBFvGoEXPqqWBDl/UmE33CAVdUOXKZSkiA==
X-Received: by 2002:a17:902:b414:b0:186:748e:9383 with SMTP id x20-20020a170902b41400b00186748e9383mr64638172plr.46.1673374065721;
        Tue, 10 Jan 2023 10:07:45 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id o10-20020a1709026b0a00b001898ee9f723sm8488664plk.2.2023.01.10.10.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 10:07:45 -0800 (PST)
Message-ID: <b440aeaf-03e6-aa4e-9636-adbf3f841b40@rivosinc.com>
Date: Tue, 10 Jan 2023 10:07:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Auto-enabling V unit and/or use of elf attributes (was Re: Adding
 V-ext regs to signal context w/o expanding kernel struct sigcontext to avoid
 glibc ABI break)
Content-Language: en-US
To: Kito Cheng <kito.cheng@sifive.com>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Andy Chiu <andy.chiu@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Chen <vincent.chen@sifive.com>, Florian Weimer <fweimer@redhat.com>,
 Rich Felker <dalias@libc.org>, Andrew Waterman <andrew@sifive.com>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>,
 davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, Greentime Hu
 <greentime.hu@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>,
 Andrew de los Reyes <adlr@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
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
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <CALLt3ThJyH3yihiwq-ZDeP1v5UgQZEsUWNwxOewZBeuocciRJg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_100748_588782_E071699F 
X-CRM114-Status: GOOD (  22.04  )
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

Hi Kito,

On 1/10/23 05:21, Kito Cheng wrote:
> Hi Vineet:
>
>
>> But you are not suggesting that there is a scenario with executable
>> built somehow with V instructions (even .byte encoded) but not have that
>> info encoded in RV_ATTR_TAG_arch string. And I'd argue that it is user
>> error, they need to make sure that -march had 'v' passed to compiler
>> and/or assembler.
>
> The concept of Tag_RISCV_arch attribute is minimal execution
> environment requirement of the executable or shared libraries; use
> glibc as an example, we can compile glibc with rv64gc only and then it
> can contain vector optimized routines like memcpy and memcpy, and
> those function are resolved by ifunc, which means only use those
> routines when vector extension are available, so the Tag_RISCV_arch
> for the glibc is rv64gc, not rv64gcv since V is not minimal execution
> environment requirement.

I understand where you are coming from. This "minimal" info can be used 
in a "compile-once-used-multiple" kind of a paradigm where a glibc with 
V enabled ifunc can still run on non-V hardware.


> My expectation is most distro will still distribute with rv64gc for a
> while and then optimize function with vector extension for some
> libraries, and those vector code will guarded with some runtime check
> mechanism maybe IFUNC, so Tag_RISCV_arch for those libraries won't
> contain V.

Yes bulk of glibc might not have vector code, but those V ifunc routines 
do and IMO this information needs to be recorded somewhere in the elf. 
Case in point being the current issue with how to enable V unit. 
Community wants a per-process enable, using an explicit prctl from 
userspace (since RV doesn't have fault-on-first use hardware mechanism 
unlike some of the other arches). But how does the glibc loader know to 
invoke prctl. We can't just rely on user env GLIBC_TUNABLE etc since 
that might not be accurate. It needs somethign concrete which IMO can 
come from elf attributes. If not, do you have suggestions on how to 
solve this issue ?

Granted the case of executable itself using V insns directly is less 
likely than the linked/dlopen dso, so we can punt this being done in 
kernel elf loader and do it in the glibc loader for the DT_NEEDED dsos.

> It's not clear in psABI spec, but intend to fix in future:
> https://github.com/riscv-non-isa/riscv-elf-psabi-doc/pull/292

Please don't change the semantics of Tag_RISCV_arch itself. Keep the 
minimum if you want, but also have something which reflects the absolute 
-march used to build. If nothing it can be used to annotate binaries how 
they were built.

Thx,
-Vineet

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
