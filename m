Return-Path: <SRS0=cKew=DB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63137C4363D
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2020 13:50:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D7E206B2
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2020 13:50:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j63BpcNU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPfURQzn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7D7E206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zyHSdAd2fICLUZXz52LhReOzUKZ/1scGWJTVA1NzG94=; b=j63BpcNUapu1UBNam+LMkhRrnL
	jMzXpaLUPrevzRLn7P877s8D9P7+CSv56kkf9kSzhI8mS2Goo5PFmR10fKfXpMG6rvsNPTCDOv0/a
	OoTadEYSlhsXBygGm35iNoyNIhA2oSRQ4Gci2MF1uxkvS1nr2Cnp1tuuPFrdbTU94h/EXyd7nfiPb
	dLHsyF5sKMLN5JYhIamTHNWto3rtzoRy1l9ylJxql2vr9/8be25DDeCLdDDB3jJB70WD2yRMDMV0n
	ZxuV6lN1/tD3NBgEW8/9G5Ljxljk2a1OsRAat3+yNsJ9WWeHv8xReZxS2a6tfrsvgiBAX9ufdr92f
	T+zketZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLRdq-0000Vt-Fk; Thu, 24 Sep 2020 13:50:34 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLRdl-0000Si-0Y; Thu, 24 Sep 2020 13:50:29 +0000
Received: by mail-oi1-x243.google.com with SMTP id t76so3701975oif.7;
 Thu, 24 Sep 2020 06:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to:cc;
 bh=wL0LIGpBgsROOKg0cQ18bWeg7cLHfTfL2bP6kCHNnGk=;
 b=jPfURQzn1/RwPgOLLUMsEbewe78lussA/XIB/WjGJqwgPTKy65BHc7Hjm6CqQP2NDp
 Bi/ZQiwCLq5SKnMB7UaJEPHn/yyd7tlrP923UOqzaDAjsA0/XQvXqQrDfoR6o6nn/wOp
 32HKty/cRkYkOSqRGMqF/tTtFauAEI6Yzxc1n7iLrfEOAzeF2EPQyFRrMnIdf8Orr98p
 8KQm7JkI5ywS69gKBmMAfuhMoLdEwVixmX/ZpZM9/Bu1qUbd6OMS2AvtJo7Gn6X8pdz0
 5C/PGHPpkGO67Lz3TOJcRh9nWqrXShOdmhM5S5L8TKLGR8kpcxE5TNA+t1bLAOr5Fhmq
 B6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to:cc;
 bh=wL0LIGpBgsROOKg0cQ18bWeg7cLHfTfL2bP6kCHNnGk=;
 b=RfQnT7a7TZiOdqsYDFBiYtaEvckztftbNiFzOI4XtHNz3G26fba5muq2CdESWvGN4f
 kaHmMNwZoanVdqrgOEEou/YHFA6YP3dX2KYn22ySJ/Wphsw2B/IbOdi4gwTfWkXSHzb8
 DzC+zdWLW1sHpXc8K5kfqjNs8b4HxST8Ok/HuKrlhsqHMsNXyXeCy4w0YxAFvKmN9i3K
 Pme8LmlnbAq/WxOIrlfceWwq3kApePY0Tln45mew2YerZ5YatoxIHvBiL0umBGpTxb0M
 zHP1dq4Jian6dVXSPuhmSPbS2OEE9HWH321ezWl9R/QYp52hlq6lR6FqFS4ZosQoAyeZ
 hjPw==
X-Gm-Message-State: AOAM533ExBDuVo3/szih3HyhoZNw6tasb6sm60tu4UsTUZbtidFNoKo2
 I6Y2Lvc8aTXypdMrldqtmzeCqHnby5zGlvDaOIg=
X-Google-Smtp-Source: ABdhPJxWSx3js4JIJytEMhCdDZZXBKrFuQsJLM+aEKuvpYqfcZ4NT/WistOQLrEJryBzw+V83sj1e5z5ORCTAyBidB0=
X-Received: by 2002:aca:d409:: with SMTP id l9mr2379815oig.70.1600955425693;
 Thu, 24 Sep 2020 06:50:25 -0700 (PDT)
MIME-Version: 1.0
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 24 Sep 2020 15:50:14 +0200
Message-ID: <CA+icZUX+AX4GAG0z2PAnvJSEmKozYLa7oHjxGkjv2_9Rcs0J7A@mail.gmail.com>
Subject: [PATCH] kbuild: explicitly specify the build id style
To: Bill Wendling <morbo@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_095029_132006_C636584F 
X-CRM114-Status: UNSURE (   6.86  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: sedat.dilek@gmail.com
Cc: linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Michal Marek <michal.lkml@markovi.net>, bpf@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, netdev@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Sami Tolvanen <samitolvanen@google.com>,
 Andy Lutomirski <luto@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

[ Please CC me I am not subscribed to all MLs ]
[ CC Sami ]

Hi Bill,

I have tested your patch on top of Sami's latest clang-cfi Git branch.

Feel free to add...

Tested-by: Sedat Dilek <sedat.dilek@gmail.com> # LLVM toolchain
version 11.0.0-rc3 on x86-64

Thanks for the patch.

Regards,
- Sedat -

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
