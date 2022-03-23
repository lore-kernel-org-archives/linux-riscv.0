Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72C3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Mar 2022 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjDdMvJW3/Mz84ZLC3oC2IKd2TkXDsfOf2wwiP0MwZc=; b=u5bclgDY7p4L5L
	mX8fmEU4lEFtR5uigWdJAYcqfIJ0QwI/WdMtc8HRsAyqxJ+OW7+qd8FBHkkiye8mqPKvfwjxjJSXO
	8zhgs1xUhKUyXukpvLaYy9UbtRNbcVDt8+xdPRdYSLSVGFSDdvN8Twb9GaGPBlbb6flvJTA5aOar1
	dH5VVRunhekOXEkKfGG6/FzLShxZ3g/iCQg9LnHUXuqihVSZ3DBZcwYBW+3E3l99stxhJqDRPZcV2
	EJB98an72G/xg9EZkO5xou+wWnwVzym8LbKMt33WirrXLyWHs2GB3CCDGWZ1qQEkMcvdyfjDklIJS
	wFedMDU/Kwy8plPdTWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX5pg-00EaPj-5c; Wed, 23 Mar 2022 18:35:44 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX5pd-00EaNo-7J
 for linux-riscv@lists.infradead.org; Wed, 23 Mar 2022 18:35:42 +0000
Received: by mail-ej1-x62a.google.com with SMTP id j15so4605446eje.9
 for <linux-riscv@lists.infradead.org>; Wed, 23 Mar 2022 11:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tK9niD9zkQNKvxp511CYkJeHeDOwwCyGPfpIMRzpbn8=;
 b=ILnVSpcvcMvyYeY4ROSboPGgS/ta0E1CBAGTw7IUPxpVOCKagtB2L6w4QyfvColzts
 lKoTTSAc3A59SaIQTrXgzUbBbPhDY+NCo+0THzukfmHGxObAO+MTE33aiSbzLaylxIR5
 vu3hdy/bc4BJMa2tF3nPWOM9mpVJRd5WMaZWC3ZxPK7t7PJ+kUHzdIPzkXeIYmbpy4iE
 WPKmOMjscxczUZmAkqdVQZvSP+uk9oWRXLbENpPVazMvVKH4AnAipdRqWqKxBI1AJP0c
 Hmsm2+SzQmRxOwEJr544YYtaT9z5K1U6741acmsivUDCh/MrQtFM6M+3sq7CDOm8e1vj
 gsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tK9niD9zkQNKvxp511CYkJeHeDOwwCyGPfpIMRzpbn8=;
 b=TVMlBn/vLfwbE4fBpUAu6asjGHuhsCoMCSrBLzJiH0rYfLSfyIlb72UwnGhAtUAUFj
 Gv8R+h1blRGADdgzoHbeeKqli9RCplVKo1jz5GQATBZsHcElh3zUDt4gfbzBmgakxFIH
 r81A9e0jZSWNQdb/zwT81K+WvTxbznF3nB9+asvoUKAAfEZvA/RlLjIspYvwikUg9DwX
 iFLrL99QPuKIjDnan6BfuXZ4x6eSawjUx/bMydjTtn1tK83Zk7Sa/GZgX1YBri4XxumP
 JD4tBEci9s0dIXF3epGrtLXslZK8DWRFMkM8pm6T2DG9WEYrWRo2gF7cTeCgXBW/QEow
 x14Q==
X-Gm-Message-State: AOAM531MVB1+yE0G4T9OdPG04r6UL2yoM6BafCxMS+jIe4Hv3UO08XuX
 yW9Zi+Y/WQF5gAccHwmubpnA7JSjzJJVWmWUYyhN6g==
X-Google-Smtp-Source: ABdhPJynp0FgSmnyck4PsURixg/OTxCJavw7joUGhNiXNB6NbDfppEQUPlJBg17McZnwMAATMWS5QwvimHiFUe6i1us=
X-Received: by 2002:a17:907:1c96:b0:6db:57e5:3e2f with SMTP id
 nb22-20020a1709071c9600b006db57e53e2fmr1506594ejc.705.1648060539244; Wed, 23
 Mar 2022 11:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220322144447.3563146-1-tongtiangen@huawei.com>
 <20220322144447.3563146-4-tongtiangen@huawei.com>
In-Reply-To: <20220322144447.3563146-4-tongtiangen@huawei.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 23 Mar 2022 14:35:02 -0400
Message-ID: <CA+CK2bC4oXrxUqG4K16+Qu9D=SBZcJSso+Fe3-8AFtuYOAeg0w@mail.gmail.com>
Subject: Re: [PATCH -next v2 3/4] arm64: mm: add support for page table check
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_113541_378966_79511B80 
X-CRM114-Status: UNSURE (   8.58  )
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

On Tue, Mar 22, 2022 at 10:25 AM Tong Tiangen <tongtiangen@huawei.com> wrote:
>
> From: Kefeng Wang <wangkefeng.wang@huawei.com>
>
> As commit d283d422c6c4 ("x86: mm: add x86_64 support for page table
> check"), add some necessary page table check hooks into routines that
> modify user page tables.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
