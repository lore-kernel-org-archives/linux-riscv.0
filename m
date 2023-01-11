Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F36C5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 12:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWfJc57y+/wsgQw5bf3RLyuXmHjZd/koFCpFitdoZx0=; b=Mvkgj/IMir9AX7
	f7mgJf6tu2tdc8c+BFL7DxRaKsqkfDGE7Qa2rzrM8VEBKTGguq5QjDaNzVKBaQi5UlDFAQTlW9Dmy
	4m8gWlv7qSPhGUzNkZ1/dwci1uYtvxYOcFk1ykOVQAdW5trxLgkF15E7YiDjgkikLYirtR5Qtt5Gg
	ZKz3rTxo3l8npH0Vd7Lvl35gEN0JVoZVReNRJgH0Ywuyq0VTL1mgQhhr9oC6Ogs87cvNovkh8Xh+J
	QrzSv/+0JFGZcb0y1MZExyU8vKtz7q8b8pwgPu1OoccGeGUWKkkdrD4KIinxWwd5V1vg2C6Wb9UwT
	26HcAHFEyRrC58Rd/NPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFZzE-00BDba-QF; Wed, 11 Jan 2023 12:13:44 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFZzC-00BDa7-Az
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 12:13:43 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-4bf16baa865so191603407b3.13
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 04:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2eLCnFo5WAOi1V93XjmE/yKkSvLN6YHbovMr6JQ0/io=;
        b=BQAgwaBZ3ujz1M2gINIXqsMMbT57HdlvYSPoaRS7+CaQie/jpgsX28QafhYktDCudS
         Fi+d506rGuaWT171VGRE4MpExUM1yutYvbMomncGvdeYhdmNpO2jjiwCtedc3Hbk+Bia
         A3A4eaUPPuHvJMc1mhvURmMNSwmotcKFFr7+75HX653tgFdpJsk9eFXtTP7hGyW2DA7a
         bEHHKfd62O5/EyeJf2LuTvFnBFxQ64ByB2VJjASOgiunOjRUf8mNbB6UND6rksUrhYRz
         YL7Z0WviW82vx5PLgwCAg+eTBaoWCJ/LjR4rQtx6iStHKgXSA3LWmaf7ecc8B2pTj0Fs
         bAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2eLCnFo5WAOi1V93XjmE/yKkSvLN6YHbovMr6JQ0/io=;
        b=WW4SI5kl6D4ReewnC2/qViFBsNfA00VVVIozono7KC8ObHSVhl5QKyoFLBeE4QbOcc
         P+wgv4Fvtw1XD0ovq1lRgl3sDq43iGli8gLWgZbGn7aT6nNS3U4r+Mc8aNfo5RD/jWO/
         Cd18cW2T/+iDr7PimbRjK8qDhfW+YKw3xgj99vSnbyVpZZwVReQJORukiv13JJCu/EZl
         JAG16w+h8KTdwYCeF3mdSxkU4dHXUoOylTZ2AASBj0mZSN4ira8i5AOMabr7axW/hETK
         IypnF8OzaUETc6JbvjNuIOGtAynU88RnfmL8bxgmbAeLjfOKCDvrlcnt0m5CwFW/87FJ
         UwOg==
X-Gm-Message-State: AFqh2kr41ZEMZKAzoGoT1ZwLWqcuj1JQRUqYTPUV5AcDpPb3/198l4ry
	A4Cyov2D73ksxjAKHHS+EeTfLPmIqpmqTKGTz5Ik6g==
X-Google-Smtp-Source: AMrXdXu7Ut7WlNDMv4JZWKxWFnPjtR7Cq3lERI8kfLNmmkFvmFOq5USdq0TsOvVNyYk9lZvLEM/JEE8wBjCqm++4DPY=
X-Received: by 2002:a81:5558:0:b0:4d5:6812:d8a7 with SMTP id
 j85-20020a815558000000b004d56812d8a7mr262076ywb.176.1673439218434; Wed, 11
 Jan 2023 04:13:38 -0800 (PST)
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
 <e2a2ef3a-bb5e-0bda-20e5-a2344e7c4cef@ventanamicro.com> <CABgGipUCoykzeS5B1wSQxcxumCweRi2RDTKdD8u6ON63DV3EnQ@mail.gmail.com>
In-Reply-To: <CABgGipUCoykzeS5B1wSQxcxumCweRi2RDTKdD8u6ON63DV3EnQ@mail.gmail.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 11 Jan 2023 20:13:27 +0800
Message-ID: <CABgGipVE3RnrNy1=8nsXUvW0w4XopHQuAzufQ66z6OWvU7wbwA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230111_041342_430140_A3AE9C04 
X-CRM114-Status: GOOD (  19.23  )
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

On Wed, Jan 11, 2023 at 5:28 PM Andy Chiu <andy.chiu@sifive.com> wrote:
>
> On Wed, Jan 11, 2023 at 2:20 PM Jeff Law <jlaw@ventanamicro.com> wrote:
> > Fault on first use is well understood and has been implemented on many
> > architectures through the decades, even with its warts.
>
> Unfortunately, we don't have a direct way of acknowledging if an
> illegal instruction is caused by illegitimate use of V instructions.
> Unlike ARM64, where reading ESR_EL1.EC is enough to distinguish the
> fault, we may have to perform a sw decode on the faulting instruction.
> Then see if it is the first-use fault, or a more general illegal
> instruction fault.
After taking more considerations, I think this could be minor. The
first V-instruction of a valid program that uses Vector is limited to
vset{i}vl{i}, vl<nf>r, or vs<nf>r. And perhaps some r/w of
vector-specific CSRs. Decoding these instructions should be relatively
constraint and easy. And we need this decoding only once for each
process since we don't have to do lazy save/restore.
>
> Yes, we may just enable V for a process whenever we find an OP-V major
> opcode, or a LOAD/STORE-FP with vector-encoded width on illegal
> instruction. But it could be kind of messy, IF, later extensions would
> also like to be enabled at first-use-fault. (e.g. ARM has SME followed
> by SVE). And implementing this decoding logic in sw just seems
> redundant to me because hw has already done that for us.
Let's limit our discussion to the scope of VS enablement for now.
>
> Besides, ARM64 has individual mappings of traps for the use of
> FP-related units in EL1 and EL0. So SIMD running in kernel mode would
> not take additional instruction to enable the unit. I assume these
> kinds of CSR-controlling instructions would have to flush hw internal
> buffers to some extent. And doing these takes additional latencies.
We already do some VS/FS settings on the entry of kernel code. So this
should be minor as well.

Anyway, I agree that faulting on first-uses is a better way to make
per-process control of VS feasible. Sorry for disturbing the list.

Thanks,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
