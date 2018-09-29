Return-Path: <SRS0=lSM2=ML=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA62C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 01:46:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B66472073F
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 01:46:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OscIFnXd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bdgMqlpA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B66472073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=PsQBtnGgT6uV8VSGhu2GJe52xPnWyTdnZ65ngLeEnuQ=; b=OscIFnXdMMNFH8npb+pBiPRII
	QH4qXWUkIi26UegQ6qtgZI8tYP3UFJjDB+RSJB5nXE/ZqDuTO1r/Gg5wLoL5E5n194Zv1QHxNUw7L
	A4fOafyRc2swpfdG8A1olgfmWpGRZkR+Gm14l7vNVDcXg1DVPSDE5cMtBLVoeWk9hI0SpY+UETVdY
	sOJhWCfGT+nGQhIEDHEznz+Gwdu4aghJ4QrA0PEu3txm3QOcCMUCNx7GMJD0J6/e+HSJJPeqL9E8N
	u8Wcms1yrCBs2JCw83Pdt/lfAdQWWQKMd/ZO+rwW1UcHkeVkytudNin+QgAx5vO1t4fLE/diVqD3k
	mWj8M2OeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g64Ku-0003ke-6Z; Sat, 29 Sep 2018 01:46:24 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g64Kr-0003jW-KI
 for linux-riscv@lists.infradead.org; Sat, 29 Sep 2018 01:46:22 +0000
Received: by mail-pg1-x544.google.com with SMTP id r9-v6so1768469pgv.6
 for <linux-riscv@lists.infradead.org>; Fri, 28 Sep 2018 18:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+fuGy+pifrRZFj/cFZF/CSeVl9uFYeegfIF9yaeB2zg=;
 b=bdgMqlpAMNX//TL3q2S0Ijv+ZbJwfamvgvdFpDq/pZM7s6c77h+0vHNv1ZR9SeV7tx
 zFE9M4hI7uCoIbHaBeujmFMk1rtmyPs1R7SAx3z34+erUuV+xOlEqHL+/Y9RpIgCz8l4
 U0SUrfrvs5dc7SN5T0j04RVp1KoNDNIOLJ48cUEElKU22BPToRROZoxPiVEXK/7blfU3
 DL7OCsv9VmBXdhX2BEdcfu8yex07g5ucn9m8q4fePiGMWbhwc5gehkajE9UkMLAFlF+R
 2UJe6b+Q3Rl5O2hmKnv+oshXtcySzcbEQ10XB79+QIfy4ipLa0dI0V5ezWJHrPPsrAgB
 4N9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+fuGy+pifrRZFj/cFZF/CSeVl9uFYeegfIF9yaeB2zg=;
 b=aV4jINF0TWfP7phr2WQUxozvrn69H5arKKFqzc6Pj6X70mP6ieLKOh6ZuXOH2hRi2H
 r4vvDRaQNhlmR7+7Ye4fqS1hffOqNLpD7dA0jwubBsxaitm3bUErfZx5uYQ0+pdEHbDJ
 yBd2uLkacFlR1qj+2LBOoAP4lDgxbEhcOCsHX4Micp/pjUP8MFr6IkSSIwRMXI4fJ6Gc
 PvJ++EkfEHaLfuSSvJ3ex4YjU3ctswcVw7LRO6cuYGw4L9O7kkRdyE13PwieJXS4ga97
 tsfN92hWV8pMmxkihGfHxLhC5fL/GoVhNrkc9gIc26qr24SWxzXSPKEp+5CG4eIIZkvb
 Chvg==
X-Gm-Message-State: ABuFfohxgOiGEatILTwykwJJkNKZMPmFbmOnO8YdkmprfPShD01Xla2S
 t6nWVe1p96JFCjtjKjYSrSn6Qw==
X-Google-Smtp-Source: ACcGV61XpzBFyBsC9g4XWcGC3m8QZKgvbmv7znUK8vG/mJxog+GlSx/C02Y7wNP4NWfMiZeUbPytoA==
X-Received: by 2002:a63:2c01:: with SMTP id
 s1-v6mr1027381pgs.367.1538185571029; 
 Fri, 28 Sep 2018 18:46:11 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id j184-v6sm9432085pge.77.2018.09.28.18.46.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Sep 2018 18:46:09 -0700 (PDT)
Date: Fri, 28 Sep 2018 18:46:09 -0700 (PDT)
X-Google-Original-Date: Fri, 28 Sep 2018 18:44:32 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Show CPU ID and Hart ID separately in
 /proc/cpuinfo
In-Reply-To: <20180912143822.21948-1-anup@brainfault.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-f8bcf381-8d26-4082-876a-781fe87ee721@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180928_184621_667460_EFA30A34 
X-CRM114-Status: GOOD (  14.31  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180929014609.d7T3_Fl0egFCYX_G96-qX2KnwS8rbHz0Vw4yIvZhmGU@z>

On Wed, 12 Sep 2018 07:38:22 PDT (-0700), anup@brainfault.org wrote:
> Currently, /proc/cpuinfo show logical CPU ID as Hart ID which
> is in-correct. This patch shows CPU ID and Hart ID separately
> in /proc/cpuinfo using cpuid_to_hardid_map().
>
> With this patch, contents of /proc/cpuinfo looks as follows:
> cpu	: 0
> hart	: 1
> isa	: rv64imafdcsu
> mmu	: sv48
>
> cpu	: 1
> hart	: 0
> isa	: rv64imafdcsu
> mmu	: sv48
>
> cpu	: 2
> hart	: 3
> isa	: rv64imafdcsu
> mmu	: sv48
>
> cpu	: 3
> hart	: 2
> isa	: rv64imafdcsu
> mmu	: sv48
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/riscv/kernel/cpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index f0f0ec2737b7..7c1342e242e6 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -87,7 +87,8 @@ static int c_show(struct seq_file *m, void *v)
>  						   NULL);
>  	const char *compat, *isa, *mmu;
>
> -	seq_printf(m, "hart\t: %lu\n", cpu_id);
> +	seq_printf(m, "cpu\t: %lu\n", cpu_id);
> +	seq_printf(m, "hart\t: %lu\n", cpuid_to_hardid_map(cpu_id));
>  	if (!of_property_read_string(node, "riscv,isa", &isa)
>  	    && isa[0] == 'r'
>  	    && isa[1] == 'v')

I like this, but it doesn't appear to apply.  Do you mind sending something 
against Linus' master?  Then I should be able to sort it out.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
