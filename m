Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FABC46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 09:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0eL7EyxYRONd3lXbOjGG4Aclgu0QhZthrbhGoHRlZiU=; b=NmO4/bVtGI9UuL
	7E5VaVaW7RHxABoiq3GCEJAPgzdSAjN4VxWq2CvTylSqq4GS4FtdfzFV+w7skhcRegop/6hoY+cus
	QJVTxewfroc30MZpA2jZcZx8yK1fW6z85o6LboO66vk/JPTcQlmp9zkdVGgjYG1DTo35KZ3DoS0Pi
	OK74rIm8D2mhRQu5hB7dzOZPs67ZICSlCwa58bOjTycszkwzNMj4oEBHdIcqO6ZZPR7xl/LKapNTC
	/pFDCUyMXsc2WVm9LpH5XQJN9kG7abItZsh8v7hvnLkVsAqFhvzI6tMPiRC54TsqyG/eLIHX4jbPb
	UVikdzOETNP23L65Wb6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFXPf-00AXdq-4N; Wed, 11 Jan 2023 09:28:51 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFXPd-00AXdJ-C8
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 09:28:50 +0000
Received: by mail-yb1-xb36.google.com with SMTP id e76so14391685ybh.11
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 01:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=60qMMO89h4muTLztEtNP/1yuauDlgSOdC37Qf6SptXg=;
        b=JQG7nOeF63RzFQeP7m2uH9hntY44/3xwtypJrOuvSSLC0FnV5h0qH/Ad9dkP4z7uSk
         bV+KiqVAFwbfzRKMT9O55erFaL7dJ0ethq0SKNlscljM66BWdUhUV3wBRaOyZNTeYu5D
         lbuBsSu8sAs7vP2snXtuu4MPHGP3NSX/ov8GXdvcxoivHA4khQWOdEWTOOaEKx4UIucI
         RBwX7xOw4uHJ6T/ienRYiFlaKul/ahMS5g34/cDedw4IEd6T3d2chlGNcR0p2FQ1o4xa
         3ZchBW/8Hvcc3/30v6T+/5mxpRVq0XWtFhwv5rYdib3xMbnIrz/LSVy8av6fvbKzgdZk
         1yZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60qMMO89h4muTLztEtNP/1yuauDlgSOdC37Qf6SptXg=;
        b=FRsEeg2i82tnRQ8X749n9hZqapydL88XsWnPLn0bgVK7hA14TfZcr4eHqKrJ8lk+Dd
         pt8dSRalAGBSdaifL7RU/V9aZXnQa07pxt3U9TqPalKTsrNTvqI4wbEVeKbV7uMuLhck
         mUL3qPJhXyYbFW4uFNTu6bdKOOyFkQilW5+UvjC0UoUTZ5xAIuJeIltKA6Bte4oAFLls
         BVhfcu95p99UI0ETG6t7dlZrGDI2K1Hs50uNSZhAh4kVSAvsmFuk8u8TUGM7DU51XpyR
         kv9f2Smpch98yW5BhKmUklzRef9iLnCcziLEi7tmgMg+AnKzaQyiUwICVcICMItCeUpK
         KL4Q==
X-Gm-Message-State: AFqh2koZi5B503rv9UsPBvpwnfuR4cXy2UoWBvkZ7hK/EKBajPXHSEQY
	1XkJwyKwNwR4IPWMsJKUnY8lQOJr2twZ+mYLvpgqyA==
X-Google-Smtp-Source: AMrXdXv1ApXxkKay1FDbnD1m8SEcp6U67jOh9F+lgYjIyw+DOzIv5oEtntnlu2MoyYHrJzNbipmekFNpQ/7q0rIU4CA=
X-Received: by 2002:a25:392:0:b0:7bb:2f07:448d with SMTP id
 140-20020a250392000000b007bb2f07448dmr1503730ybd.32.1673429327336; Wed, 11
 Jan 2023 01:28:47 -0800 (PST)
MIME-Version: 1.0
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <CABgGipXqEkasz2HTC4y6otCP6pFMmyEdYabA+OkUruUOfwypHg@mail.gmail.com>
 <18465ca3-934f-5b3e-170c-1ff0edea3a89@rivosinc.com> <CABgGipW66rdMnC99-h9ccuR+E+7fnaMfmzt=1ehGZnvxO34PwQ@mail.gmail.com>
 <a559e7dc-83fa-fac1-5811-95d37c6e662a@rivosinc.com> <CAAeLtUCPLD8if+-xikbjD78G=N_bEyMLh3WcZzyJR4Zt2LWz7Q@mail.gmail.com>
 <1f8f1d21-4a19-54fe-8b29-bf9e2a8501d7@rivosinc.com> <CALLt3ThickhyW5gX6LNjHXza484Xb5Cg8t7OUYH6hoA3V3GpAg@mail.gmail.com>
 <3a838afe-974b-60bb-a0e5-83e366ec652e@rivosinc.com> <CALLt3ThJyH3yihiwq-ZDeP1v5UgQZEsUWNwxOewZBeuocciRJg@mail.gmail.com>
 <b440aeaf-03e6-aa4e-9636-adbf3f841b40@rivosinc.com> <3923eeee-e4dc-0911-40bf-84c34aee962d@linaro.org>
 <119da65f-e976-f382-3fe1-1585be738352@ventanamicro.com> <8be4d673-f435-429e-9a61-bb49e7820529@linaro.org>
 <6d13e63f-69b3-6e48-b811-bbfcf3ffb3af@ventanamicro.com> <CABgGipUAhZNt3gaxEx7mPm20Xw7WNVVppRZ4fxZX-XswA5VG2g@mail.gmail.com>
 <e2a2ef3a-bb5e-0bda-20e5-a2344e7c4cef@ventanamicro.com>
In-Reply-To: <e2a2ef3a-bb5e-0bda-20e5-a2344e7c4cef@ventanamicro.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 11 Jan 2023 17:28:36 +0800
Message-ID: <CABgGipUCoykzeS5B1wSQxcxumCweRi2RDTKdD8u6ON63DV3EnQ@mail.gmail.com>
Subject: Re: Auto-enabling V unit and/or use of elf attributes (was Re: Adding
 V-ext regs to signal context w/o expanding kernel struct sigcontext to avoid
 glibc ABI break)
To: Jeff Law <jlaw@ventanamicro.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Vineet Gupta <vineetg@rivosinc.com>, 
	Kito Cheng <kito.cheng@sifive.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Vincent Chen <vincent.chen@sifive.com>, Florian Weimer <fweimer@redhat.com>, 
	Rich Felker <dalias@libc.org>, Andrew Waterman <andrew@sifive.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Szabolcs Nagy <szabolcs.nagy@arm.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Aaron Durbin <adurbin@rivosinc.com>, Andrew de los Reyes <adlr@rivosinc.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, GNU C Library <libc-alpha@sourceware.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_012849_445953_05B5CC6A 
X-CRM114-Status: UNSURE (   9.82  )
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

On Wed, Jan 11, 2023 at 2:20 PM Jeff Law <jlaw@ventanamicro.com> wrote:
> Fault on first use is well understood and has been implemented on many
> architectures through the decades, even with its warts.

Unfortunately, we don't have a direct way of acknowledging if an
illegal instruction is caused by illegitimate use of V instructions.
Unlike ARM64, where reading ESR_EL1.EC is enough to distinguish the
fault, we may have to perform a sw decode on the faulting instruction.
Then see if it is the first-use fault, or a more general illegal
instruction fault.

Yes, we may just enable V for a process whenever we find an OP-V major
opcode, or a LOAD/STORE-FP with vector-encoded width on illegal
instruction. But it could be kind of messy, IF, later extensions would
also like to be enabled at first-use-fault. (e.g. ARM has SME followed
by SVE). And implementing this decoding logic in sw just seems
redundant to me because hw has already done that for us.

Besides, ARM64 has individual mappings of traps for the use of
FP-related units in EL1 and EL0. So SIMD running in kernel mode would
not take additional instruction to enable the unit. I assume these
kinds of CSR-controlling instructions would have to flush hw internal
buffers to some extent. And doing these takes additional latencies.

Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
