Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2FBC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Mar 2022 18:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6CEl82NnQGqhZkDWUAfXBR01ISOUEEKXfubXG/WclE=; b=MyKuxayPjWOb5t
	u1WfTkAcNaUkHoIQ8ETJ+NVT7icRM2AVRg1VVDNwlqp7YHhec75oKu/RaiufPPUZnkUq+q8HUpNrB
	vrFIIGRTspNHrA2/V/00M2M3vPR3m53KNXyJ5yoRutqUC/YkQkzuVLwH02dSW3BzUgadQY5rdgr+2
	538+9VwRII0v6zesOxMGtTR2JBILFwHx8ufRiS5KtyhhR/U7ULTr+XCv6nJ0C10r4SdonTDrCpYoK
	wR5eqCUGkfEW6ZHleiOKgvkdDe5W5zqrUuzvusIqYGZWove/2yRNnLCxd/WpKEmInC57UrfB1gpWp
	OsOPuibF5b04RKS/rdmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX5s7-00Eb8L-Ue; Wed, 23 Mar 2022 18:38:15 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX5s5-00Eb6q-3v
 for linux-riscv@lists.infradead.org; Wed, 23 Mar 2022 18:38:14 +0000
Received: by mail-ej1-x62b.google.com with SMTP id dr20so4649867ejc.6
 for <linux-riscv@lists.infradead.org>; Wed, 23 Mar 2022 11:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JsH2SIUTrsYJX8zmjcQSu5hxXE5Ybek62ru5rVjSD7A=;
 b=eZkOyr5ipSOEyIaKi0RWFAaNJ6zbGXp8L0jzeF10aH5B4vhrsB9UpLMn7mQmn+dQn5
 wMkGvPw+1qRPsVxG/Ug6yNmt5/Kepqq3YzzD0RVmt3KPRryxnF0eE6qx6PaQfy3P3n0u
 8WT2X7IgjBlZG112zAKt1B96P4bbzh/u7jBUUIIrC5Wi9Ft23Us/+XHbQGgf6lxb0BCP
 yTqX5wfdvLCBEDKTdGpCT1T85ke+il9XVbUENQHF2kBATRBpOjAMfX6dg70jbIpq9Gps
 wTDzqVolirKFCPH5CLgnzfW/YBzltdd3pS4jviyozQhjcthcAF/nNnOhWlxsJRMm7WDj
 C8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JsH2SIUTrsYJX8zmjcQSu5hxXE5Ybek62ru5rVjSD7A=;
 b=YdV5Nd1s6PU2rk0GLHNGwxOkSeKNSW7lyuR1SjJdhSA5Dzj7jdkys+1QGdxWOVcBvR
 USJglFhwpSqSaiokRnPTWq6U9k1FnXbLch7AOO6bE/LDY6tmCdIdMNgauriVI3gbbqTT
 26tHKi3nZxeMmkUt+uToTr49/nRqPgOSnCXJUIK5sr3x3KbSPy9I0sutEEB9RHywActg
 fNboaY3MAVXE1/h8OdFLAA8LfKf5Piho2Gvhx3xjhuu8A/qkw5RywqlUIo/MNpROQ5BI
 KgPDS3ojXem//yLOtv2CYcUhDfy/c63kVh2IK8LJOkBq1rWOoxWpcIjz99mVHS3ztWAP
 4wZA==
X-Gm-Message-State: AOAM532z9EZtPJInua9Jztipo0fN+dttyd7m8x+/VeznpZNvSlrSfFWw
 o/erT2n+zRb6QJk5cvtgDgxmwt5Zeae/cwihr4eTNA==
X-Google-Smtp-Source: ABdhPJyBBF/hTWA2LGiY86ag+BZL5f9TnZ6rcxh1EVMGytKL9CE/oPbM43JdHk6KoChnnPqBvP/t5NTH6fzCJauVAG4=
X-Received: by 2002:a17:907:9602:b0:6df:e82c:f84 with SMTP id
 gb2-20020a170907960200b006dfe82c0f84mr1587691ejc.590.1648060691197; Wed, 23
 Mar 2022 11:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220322144447.3563146-1-tongtiangen@huawei.com>
 <20220322144447.3563146-5-tongtiangen@huawei.com>
In-Reply-To: <20220322144447.3563146-5-tongtiangen@huawei.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 23 Mar 2022 14:37:34 -0400
Message-ID: <CA+CK2bAUKB0SM3dBM0WauGp1WVKVzouQwOy8Z+a4CD38TZctpQ@mail.gmail.com>
Subject: Re: [PATCH -next v2 4/4] riscv: mm: add support for page table check
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
X-CRM114-CacheID: sfid-20220323_113813_180416_D681E8C9 
X-CRM114-Status: UNSURE (   8.05  )
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

On Tue, Mar 22, 2022 at 10:26 AM Tong Tiangen <tongtiangen@huawei.com> wrote:
>
> As commit d283d422c6c4 ("x86: mm: add x86_64 support for page table
> check"), add some necessary page table check hooks into routines that
> modify user page tables.
>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Thanks,
Pasha

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
