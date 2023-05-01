Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D34C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 03:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gsz/a7NZinw1nzyurgEjnz4VoSQONbEwUfSUWgqdafA=; b=xp72zQBjW+az0F
	vefQMigiJMExO7eXHPDKSR2yIKw8rtUXbKJezomjH6BlInbs9CGfLzdPYmcRe1uWsw1wqV+CklSlh
	gCGCA8EtX3GdE2eHfUtx+bUZo1b0G/kTTkk7KND4S4EpjmtermP8jrpmkEHHeKDTW7LM2VpCx5oTn
	rLmb+PBBOXxxBu1OrqlBNEL14WYWhO/J7e3du9B9+kb9TSetq1R93iJ7lzgcDCHNRQ/m0eCVWDPyy
	6a/GZiSyXKC5Mf+Ty7SL51jqv92sPeiKyu4milUmtDeUh/A6TCL7CbhQk1EqpfyCeSwlj1ol942vJ
	l2KGyEBkNH3f0DNdG8AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptgsQ-00Hb57-2e;
	Tue, 02 May 2023 03:40:30 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptgsP-00Hb4q-2b
	for linux-riscv@bombadil.infradead.org;
	Tue, 02 May 2023 03:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:From:Cc:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xim+YwtJ3hVeEuFvAqTRFSvTuubExAeyqWhYkDSWX+8=; b=KrZB+w7pLoHMNa+bpWqIkaQQsG
	+aoDjL5elQ5ZF3rkKgTccGIbmoKyQifgYv4wIDdDRWJK2SiNzaNaV7d1aeOx1h2wUkvR+gK3nVNPN
	o/v0rbRHGeIHh0N3skHnWkDW6cjvvA+eWttgiMk1k5kw+Y09NI62IDWxT9WdnsU27vaTAWOdxzvSp
	g/vwVkDj+ojSy30PzIOOrF4Cn0Rub6wnvjNPK0EiLhlzf9+kiGGJk1MEabH4+dWvjnr/Ngu6HZULC
	Orv65KoyynlFxd4EG/Cl6gbuVtRWRbSsZ3H48VOm3hjYbIny57r8APlSQ+5JqKVsYRUCsrnUZJNp9
	5duxD0HQ==;
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pteSI-00F4w6-1C
	for linux-riscv@lists.infradead.org;
	Tue, 02 May 2023 01:05:28 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-52079a12451so2091241a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 18:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682989517; x=1685581517;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xim+YwtJ3hVeEuFvAqTRFSvTuubExAeyqWhYkDSWX+8=;
        b=a/VwioxRWKBGGfo8+D948pg43L9SyAzP+Kn3Xe0BSFRdFAGDZEpGXaFIEuIguKXJFB
         j8r9GUUyREniRVoJhMVQrhPMsP7yKFgV8azbI+FdCWCkwM5jksQi4gM8JLMhylYe12aO
         Rt5xLnmxlUp6KuG0Bfnw33CLWqlL0190BXjbdbFzOciElgd637oM4rBU0RTGz0w8g8R1
         ty00ErVAGlBB5Myk/5lau+8uyG5x2I94kzUGbfEwhgZh2uTzlvP9NIVMsa4Z1Ye4endP
         mmHVFUhgjc39scrwsFJsbnhO8sYsVhK7x6HzLDkGeKxRECcamJ2p6xFADlFmtpzXNd1W
         OrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682989517; x=1685581517;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xim+YwtJ3hVeEuFvAqTRFSvTuubExAeyqWhYkDSWX+8=;
        b=ienCD9PsMg4r6D+2fMHr5wn1lDlkYkwZHgv3kaVuCXLeUnhPzsY8jsFf+V7eR3zRSq
         zrK41A1dVjzSfoDAbCdPH62hdZRQlnzKy6/gXc4ej94y01hrs0uTS5AX0mmnspwTuRBt
         yb0cnM5nul+cpDDfftflvlOtEKZ3R+Mcaa60W2nF/oYRX5QQc7OEbl21q70AtoenM/Bb
         ALzff9zFMoUAxN80dM3cvxRb/flTbQEu8DnYMyS+QKso04MgRj69RKDuDtb2SofcHN3l
         iCcJKrKP9TfZJtj7Z8IZ1mk8UNujbdO6BaS24xTdafFvROWsTKsTK41raZXyrSc/Z6wF
         PkaQ==
X-Gm-Message-State: AC+VfDwiD+U32t1SsxHVo+26F9jIiFSIcJfkJyklYVK7RgBfG8VX4Wxd
	XzJbXixdQkSsuWmDDI3170bqjw==
X-Google-Smtp-Source: ACHHUZ7QRiUqR/YyO0uBuaJQ2kl6f0vyFPeyTZXoz9H5OVSxK2osli3MlSK7xqDSR5NswkoP2NWxrA==
X-Received: by 2002:a05:6a20:1581:b0:e7:56ad:5a40 with SMTP id h1-20020a056a20158100b000e756ad5a40mr17323425pzj.36.1682989516918;
        Mon, 01 May 2023 18:05:16 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q22-20020aa79616000000b0063f1a1e3003sm18684466pfg.166.2023.05.01.18.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 18:05:16 -0700 (PDT)
In-Reply-To: <20230501223353.2833899-1-dfustini@baylibre.com>
References: <20230501223353.2833899-1-dfustini@baylibre.com>
Subject: Re: [PATCH] riscv: compat_syscall_table: Fixup compile warning
Message-Id: <168298107624.32296.3849079211902567638.b4-ty@rivosinc.com>
Date: Mon, 01 May 2023 15:44:36 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Conor Dooley <conor.dooley@microchip.com>, kernel test robot <lkp@intel.com>,
  Guo Ren <guoren@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Li Zhengyu <lizhengyu3@huawei.com>,
  =C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, Liao Chang <liaochang1@huawei.com>,
  Masahiro Yamada <masahiroy@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>,
  Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Drew Fustini <dfustini@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_020525_853274_BC6AF908 
X-CRM114-Status: UNSURE (   6.76  )
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


On Mon, 01 May 2023 15:33:54 -0700, Drew Fustini wrote:
> ../arch/riscv/kernel/compat_syscall_table.c:12:41: warning: initialized
> field overwritten [-Woverride-init]
>    12 | #define __SYSCALL(nr, call)      [nr] = (call),
>       |                                         ^
> ../include/uapi/asm-generic/unistd.h:567:1: note: in expansion of macro
> '__SYSCALL'
>   567 | __SYSCALL(__NR_semget, sys_semget)
> 
> [...]

Applied, thanks!

[1/1] riscv: compat_syscall_table: Fixup compile warning
      https://git.kernel.org/palmer/c/f9c4bbddece7

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
