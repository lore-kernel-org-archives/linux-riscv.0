Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F79FD59D7F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 00:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ii7Oz465GH4YoucRAZ8zk+Ov1S7fadbZLew0yU3YjB8=; b=Iejvfxl70TpwbL3ZyqxPkj+n5E
	v1SQoMkGTJgPHQPwwL9FJ1tvgpLC+OLp8DHxJupRJSxljqamNgxDMM1xBUtVuJd7ec1BfOwI2vsdU
	2QMuGcQopAYLkwwqt5HSyMRFQbDsOt4xMqC8VEWnwxAUiRTcfSv550dgOOnoWBp8HWKe4x1mnQ/g3
	6ROLAXN7eRsu3OCLlPUZxX7BrT8G3DBugtUO5lm4EJkp+CfpM8GxUnR8oP9NuSPmh5+vLdTirJzBQ
	FmZMf+OV2Yc49SoPfWNoWHClS7EC7ihjeb58LWQdcL0GRmSTPiJ9zpOVHZrajf2FjJZHUFvrYgVub
	XEbkCNOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFj83-00000009LDq-28VG;
	Tue, 26 Nov 2024 00:08:31 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFj7z-00000009LDP-41MO
	for linux-riscv@lists.infradead.org;
	Tue, 26 Nov 2024 00:08:29 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-724d8422f37so3627650b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 Nov 2024 16:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732579706; x=1733184506; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zh1TgMvheeVr/BG655bBpDMUthEZKkR99De/4VnyTA4=;
        b=pVbggqpuwg8lVhPVCeC/VFsa9nXjUmWAa01Ac2iwCmRyHvUH+8OGkQMT0ab/b0QfoO
         VnAQjCR4XCj8vP46HGLrPe4niJfbcGTdpwyZ7HPLNgxORtvzW+Tk2iXl43qjV1uxBT5Z
         pMU4kZBE/5EI4ld6DH4UXvtoBAiVlZc+T7Uz0F+NgIi1jdBl77g9mPLkxROLh7lvhgbu
         c9Y3FTJL8Fc78/klmhgYKoJKf7x8eqfUrNiDduaM0HrWg3U454AogPmO1jVlq5me03SH
         Pse8r/2+1nbrISrnRkkFxopIYvsXaM1h6gPfJx6a2p/gz2eZ0wXB2fo4vX2gQFtQMAok
         w1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732579706; x=1733184506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zh1TgMvheeVr/BG655bBpDMUthEZKkR99De/4VnyTA4=;
        b=nQuBE1h4vLFSm69fenCZSUahOfXzy4L87ifUCJRMKOcRY0tVXuDN9vSgu+nGNXIzzo
         Ya+S9A7pycrKRPACIZqLvR4yDAngvV8jtfGVzp0WW79P71jmsFNyJFgS/OOuV746Z7St
         Q3JIjrl45z0EioSRaa6h+XyhuoiiRhhIKUBwOQzSpwWUtZxcRENHeU0I9grVvJXStOc5
         TmyOUhE1rQKAyquqnQl339s1LkmwGalkP4pUirMIhy/EobbkDuV9zEMzt92dayJAb8/7
         7cpdlwG8umMy7ipgNKEBzB4MdINzHQkm40XypGYXuWtmwcTHqwRLsbvXCPYAL1LyrMZt
         iJOg==
X-Forwarded-Encrypted: i=1; AJvYcCVHh+HEt3H8KzckcQYXGyHS5Lcjs5xwsN/d+pRzwFd1pEy0SBbsIuzyl7unR1y5IaZJ8pWmeM5fM7al/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtGEm4bRlwaAMUQ9kl192sl8Tn+4O0wQ7dTMZZUIR6cQBEb7iA
	qB29hi3KjBbQlpUrv1wQCiJLZWeuYm/d09Dllwad0F3Cs6+aLpJYoE/nlAjSR1E=
X-Gm-Gg: ASbGncv7h8nwzJbRrt9gN8hahlsjPW7KwzDp2WXezysOOrxUSQfapg6C835bxaEKTMA
	hml+nbpxHU9uBts3vXm/3A0PszXqnFKw9Ey2qCEQSWyNFxKwp5BW8EcdMTj4zZqUQNEYOQpsC2r
	oNvWDY3GP/sVgAaKLLv86yArM3bhlIiuQfxaqoYDOV55/WT3s9ydjz5JfgtDyU0xIfPG3quoSyF
	G5HotQ088d1fM2FJUe/8d45cLjT+VO5kTBEqJmNl97pACYrfx0ZxZT9BuYN
X-Google-Smtp-Source: AGHT+IG8ozr347scOy5JQuieWGflhyN5051oqzpPFJ8B9W47XT0S3F43TqSpqc/XUJ1CnmDY/mroig==
X-Received: by 2002:a17:902:e5c3:b0:20d:cb6:11e with SMTP id d9443c01a7336-2129f797c7amr185807305ad.26.1732579706280;
        Mon, 25 Nov 2024 16:08:26 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc12917sm71433345ad.185.2024.11.25.16.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 16:08:25 -0800 (PST)
Date: Mon, 25 Nov 2024 16:08:23 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Clement Leger <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] riscv: convert bottom half of exception handling
 to C
Message-ID: <Z0URd1oF6FnJGXa8@debug.ba.rivosinc.com>
References: <20240720171232.1753-1-jszhang@kernel.org>
 <20240720171232.1753-4-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240720171232.1753-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_160828_260161_0789473E 
X-CRM114-Status: GOOD (  12.76  )
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

On Sun, Jul 21, 2024 at 01:12:28AM +0800, Jisheng Zhang wrote:
>For readability, maintainability and future scalability, convert the
>bottom half of the exception handling to C.
>
>Mostly the assembly code is converted to C in a relatively
>straightforward manner.
>
>However, there are two modifications I need to mention:
>
>1. the cause I.E the CSR_CAUSE value is passed to do_traps() via. 2nd
>param, do_traps() doesn't get it from pt_regs because this way an extra
>memory load is needed, the exception handling sits in hot code path,
>every instruction matters.
>
>2.To cope with SIFIVE_CIP_453 errata, it looks like we don't need
>alternative mechanism any more after the asm->c conversion. Just
>replace the excp_vect_table two entries.
>
>Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>---
> arch/riscv/errata/sifive/errata.c       | 25 ++++++++---
> arch/riscv/include/asm/asm-prototypes.h |  1 +
> arch/riscv/include/asm/errata_list.h    |  5 +--
> arch/riscv/kernel/entry.S               | 57 +------------------------
> arch/riscv/kernel/traps.c               | 37 ++++++++++++++++
> 5 files changed, 61 insertions(+), 64 deletions(-)
>
Sorry for noticing it so late. And thanks to Bjorn for pointing it out.
lgtm.

Reviewed-by: Deepak Gupta <debug@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
