Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75B2C54EBC
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 13:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/zoeu9m73BO09RWuub70oVa3i03ZvpVIB4bejWR33M=; b=dlX8iVgcSFclkk
	emD4WJL1r+J1lsDDcRtt40gW9z06z80ntfE3Byq6zyuwSCo4ZTRCZRpDiSBTaI6noHY3upQEh3gJv
	XYUCS8xAw10ff59LlPCyLAW9bFGnHbDx0rLUCgrw+mP15Li4zDGU2iAuP0RIwjrBYUXcIsnkPxX9U
	XHsId7GrroLxxAfjyVuOD7RiVWZiRh6rPvVCESht2bC3geS6fdhf70/olpvTxPKXmihxh+WzkmyTi
	H0GtRy0AYmVj5P0v9Lh5MSIgHCQ21gKNvmcVZByvla2qSR3W477axF52bt04njLhuBoJhEtRqJXqp
	B5Wb7Xv5vgC6Nubxj6/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFEZE-0072EW-8w; Tue, 10 Jan 2023 13:21:28 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFEZA-0072Cb-5Y
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 13:21:25 +0000
Received: by mail-lf1-x130.google.com with SMTP id y25so18375145lfa.9
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 05:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/7DX4cR7GkSUNX63YNydNm6Ja2cyOA44pZfMjHXejtQ=;
        b=Xbwxwe/QU5YGbWLA+WKhKVBa5Bq/wjuODipMTxshUbBhQT4RBVDn38Xmu2+8Z91iw+
         qEspOp1tnnjB223+CGcElMkxZSKs1fGE1fSXv/MI1EuV3REDVN08FInxGwxWfLcNhHI4
         eviRBEq6T2TyaJD/qpxKtGgu5QqJGLwnqWFBLb5NomCqSllyWPXlZ0nUc23Pmktq+GeO
         gzy8Y+E0WkOnROyXHidusYm+YB6O4X8w0mwtl0HS1apLwzI7SfhFCieIcksRMPqiixKX
         FlQtrOxAWZDE599r+DfYdJe9nFa625ctj1LURBwGTz+5MMz1dLCFFPbPbJZR+ejtuVRL
         76kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7DX4cR7GkSUNX63YNydNm6Ja2cyOA44pZfMjHXejtQ=;
        b=Wd8EygViwVFH1bs5lO338FToFjhg2im7iMv6SgW/yMDvMeWe8WPQfg4hcDpetWNMbN
         kGJ86YQD1Bn5/U3e9hqPulTgpLkjAXu6rNPbw5I2310M3s7Jyi4mtZs9N5RHTUmoBWzV
         XyMwaQkLALO2wgzacUpcIX02WTpQAxtoR4HA9/4e1EkLGT9FCfnTs662vkYW1Tszosa/
         9JGhRcGCtmJvHbtmQVEOoi9GdBMupsrVIGYA1XMqAgzRgkQ5AnpOP18/HllhQbhFIUfe
         gg3IT+JxZJDRqYrLN6HDfVFfuCGzR4YSO8ENnDWii3nnFYutEtkIzwDhxpOpuXMFGAQo
         Rlxw==
X-Gm-Message-State: AFqh2kqfWqhq5iOhguzYyN78Xt4E6r4YGXXcqwbIVk4pRwkRlSKKxWdZ
	PjiuLbyUVuSq2oXOT5PzRMx3lxIqRSBrzctcIPffOQ==
X-Google-Smtp-Source: AMrXdXv5UFhRRgFnetOXg7pX7CBVg65T/r3IRZiF6DosVeMDqZrLw9C2LKGn7xNXyEEMh574sKl8CDn29vi4cZM4l6g=
X-Received: by 2002:a05:6512:e97:b0:4b5:79c9:bf85 with SMTP id
 bi23-20020a0565120e9700b004b579c9bf85mr2822548lfb.541.1673356875751; Tue, 10
 Jan 2023 05:21:15 -0800 (PST)
MIME-Version: 1.0
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com> <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com> <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org> <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
 <91ef3c45-165f-d2b3-7c77-322c01802c41@rivosinc.com> <CABgGipXqEkasz2HTC4y6otCP6pFMmyEdYabA+OkUruUOfwypHg@mail.gmail.com>
 <18465ca3-934f-5b3e-170c-1ff0edea3a89@rivosinc.com> <CABgGipW66rdMnC99-h9ccuR+E+7fnaMfmzt=1ehGZnvxO34PwQ@mail.gmail.com>
 <a559e7dc-83fa-fac1-5811-95d37c6e662a@rivosinc.com> <CAAeLtUCPLD8if+-xikbjD78G=N_bEyMLh3WcZzyJR4Zt2LWz7Q@mail.gmail.com>
 <1f8f1d21-4a19-54fe-8b29-bf9e2a8501d7@rivosinc.com> <CALLt3ThickhyW5gX6LNjHXza484Xb5Cg8t7OUYH6hoA3V3GpAg@mail.gmail.com>
 <3a838afe-974b-60bb-a0e5-83e366ec652e@rivosinc.com>
In-Reply-To: <3a838afe-974b-60bb-a0e5-83e366ec652e@rivosinc.com>
From: Kito Cheng <kito.cheng@sifive.com>
Date: Tue, 10 Jan 2023 21:21:04 +0800
Message-ID: <CALLt3ThJyH3yihiwq-ZDeP1v5UgQZEsUWNwxOewZBeuocciRJg@mail.gmail.com>
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>, Andy Chiu <andy.chiu@sifive.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Vincent Chen <vincent.chen@sifive.com>, 
	Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>, 
	Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	=?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Szabolcs Nagy <szabolcs.nagy@arm.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Aaron Durbin <adurbin@rivosinc.com>, Andrew de los Reyes <adlr@rivosinc.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, GNU C Library <libc-alpha@sourceware.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_052124_295408_3E977F3D 
X-CRM114-Status: UNSURE (   8.46  )
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

Hi Vineet:


> But you are not suggesting that there is a scenario with executable
> built somehow with V instructions (even .byte encoded) but not have that
> info encoded in RV_ATTR_TAG_arch string. And I'd argue that it is user
> error, they need to make sure that -march had 'v' passed to compiler
> and/or assembler.


The concept of Tag_RISCV_arch attribute is minimal execution
environment requirement of the executable or shared libraries; use
glibc as an example, we can compile glibc with rv64gc only and then it
can contain vector optimized routines like memcpy and memcpy, and
those function are resolved by ifunc, which means only use those
routines when vector extension are available, so the Tag_RISCV_arch
for the glibc is rv64gc, not rv64gcv since V is not minimal execution
environment requirement.

My expectation is most distro will still distribute with rv64gc for a
while and then optimize function with vector extension for some
libraries, and those vector code will guarded with some runtime check
mechanism maybe IFUNC, so Tag_RISCV_arch for those libraries won't
contain V.

It's not clear in psABI spec, but intend to fix in future:
https://github.com/riscv-non-isa/riscv-elf-psabi-doc/pull/292

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
