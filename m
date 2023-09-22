Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF875CD4850
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 18:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zCi00sfr6eaCVuaNHq3DYXGtYLJDi4aawXZQnnaklOQ=; b=e8A/V9OcY09aKz
	LYlNJFZXQjH9HvM2/v/rVnQY+S8uVu4g+ZG2XkfytuTI0UHrfOUpRusPYd6wAQhpIMv0p5kvUH9PG
	aaLJNSxOWjyLtyUbi72pUWYAI5eAtejYK9wlYMPXZNQ8gxUdw6eHysVheCNHVSSWCj3qPRLAl0D+0
	DjisZljfAtVZlwKGpABIuQSMd3hEI0+T+/7p7HxI//mcK384zSlWEpovYo6KyrIPLlWgGROV4Uxo+
	PgggY8pd2HFCzbYLkwDPprSgvMNiCEcC04XBKVIIAmPuZfpxnBcjJsXFoStJxe2/bZCZmHaTJw65N
	hsaWUpz79thAW1iEEQZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjl7r-009egv-2I;
	Fri, 22 Sep 2023 18:43:39 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjl7o-009egV-1r
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 18:43:38 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1c5c91bece9so22481335ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 11:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695408215; x=1696013015; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mGwEs4lwD/Q6PpJtqh3vxLJbwSG8QN19oMXykCTRdOU=;
        b=ai6CKaFPW7HkMBw1kM1YfAKul4U30MsGYQ1dHJ7hx5UrD+nvww0YntHmZgxqOJgvWw
         szGLB17BeVv03LMn4RtrkPUVYHP9lSguIEjSdRtjSoo06jF8b4c3F5GjHiKzP1qmVUD4
         SDKHIgVnp2Cus+oXNU++K0xRkHa5B+Se38PLfMiTviH7VKQRhHPRkwQ23XN1Q3djMNCX
         e20i6fSVE0XRDL08in6pVBBWY/WY6tywM9FUc/Pxs7UnegogdI4+EitCa9S87oZvFY8J
         3C/9zdN7BPCeijYnLsRiIG7JoY/7bJlvPgfMK28mnSyeGiMO6c6juYqnNoNS7fqN9rEu
         mI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695408215; x=1696013015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGwEs4lwD/Q6PpJtqh3vxLJbwSG8QN19oMXykCTRdOU=;
        b=d22WBrZILaYZiGI4cpbzCIkUO4ttE6BJDJbBXcDeecE5DmWvcOhBkdstuGiOfB54i7
         dIXYzH9QfmEZidlAITUmHUDZEWvUuRVwaHpFMWAzzynCDQ0ukYkeBU2H6xEOY4jGNDFa
         +ShMazPSWeEjaIz6KzHFaTV9av2MmpMiC0/x52gKDpJ8vg7TG2nNLfz1iBSj4aIAVvBK
         3hoRWnnYyjx3M1auM7FYJh7KDIS8SobL/3X12VuK2V6+QZzIG6ONKt7iERYvaWcsgyhZ
         1E4GnQCqBjTSvKtD9EWuANWlo0iqH31j8AdyZoeo+GXYh4PnSleLuFq/8IaRKxZHcXWf
         L5yw==
X-Gm-Message-State: AOJu0YzYDrywKj5pjOHJ1DLCi0K1vH4kjLMFIQ51uLtCU0SzDpPxWWU6
	xHSvyXaPUHrET8bIcrvQA7I=
X-Google-Smtp-Source: AGHT+IGfnwzfn6fy1YyhVOl95t1Ws+pb3Tna3+/4OEDy7OO3vLRjz0evZlUYL3YRd7eQLtVtwWYQTw==
X-Received: by 2002:a17:902:e74f:b0:1c4:e69:42c3 with SMTP id p15-20020a170902e74f00b001c40e6942c3mr372887plf.43.1695408214726;
        Fri, 22 Sep 2023 11:43:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c20-20020a170902c1d400b001b03a1a3151sm3842793plc.70.2023.09.22.11.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 11:43:33 -0700 (PDT)
Date: Fri, 22 Sep 2023 11:43:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hou Tao <houtao@huaweicloud.com>
Cc: bpf@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>,
	Hao Luo <haoluo@google.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Daniel Borkmann <daniel@iogearbox.net>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	houtao1@huawei.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH bpf 3/4] bpf: Ensure unit_size is matched with slab cache
 object size
Message-ID: <97b0615e-a541-4856-ba70-be39bdcd8a8f@roeck-us.net>
References: <20230908133923.2675053-1-houtao@huaweicloud.com>
 <20230908133923.2675053-4-houtao@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230908133923.2675053-4-houtao@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_114336_639993_5E336533 
X-CRM114-Status: GOOD (  11.72  )
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

Hi,

On Fri, Sep 08, 2023 at 09:39:22PM +0800, Hou Tao wrote:
> From: Hou Tao <houtao1@huawei.com>
> 
> Add extra check in bpf_mem_alloc_init() to ensure the unit_size of
> bpf_mem_cache is matched with the object_size of underlying slab cache.
> If these two sizes are unmatched, print a warning once and return
> -EINVAL in bpf_mem_alloc_init(), so the mismatch can be found early and
> the potential issue can be prevented.
> 
> Suggested-by: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Hou Tao <houtao1@huawei.com>

With this patch in place, I see the following backtrace on riscv systems.

[    2.953088] bpf_mem_cache[0]: unexpected object size 128, expect 96
[    2.953481] WARNING: CPU: 0 PID: 1 at kernel/bpf/memalloc.c:507 bpf_mem_alloc_init+0x326/0x32e
[    2.953645] Modules linked in:
[    2.953736] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.6.0-rc2-00244-g27bbf45eae9c #1
[    2.953790] Hardware name: riscv-virtio,qemu (DT)
[    2.953855] epc : bpf_mem_alloc_init+0x326/0x32e
[    2.953891]  ra : bpf_mem_alloc_init+0x326/0x32e
[    2.953909] epc : ffffffff8016cbd2 ra : ffffffff8016cbd2 sp : ff2000000000bd20
[    2.953920]  gp : ffffffff81c39298 tp : ff60000002e80040 t0 : 0000000000000000
[    2.953930]  t1 : ffffffffbbbabbc3 t2 : 635f6d656d5f6670 s0 : ff2000000000bdc0
[    2.953940]  s1 : ffffffff8121c7da a0 : 0000000000000037 a1 : ffffffff81a93048
[    2.953949]  a2 : 0000000000000010 a3 : 0000000000000001 a4 : 0000000000000000
[    2.953959]  a5 : 0000000000000000 a6 : ffffffff81c4fe08 a7 : 0000000000000000
[    2.953968]  s2 : 000000000000000b s3 : 0000000000000000 s4 : 0000000000000000
[    2.953977]  s5 : 0000000000000000 s6 : 0000000000000100 s7 : ff5ffffffffd3128
[    2.953986]  s8 : ffffffff81c3d1f8 s9 : 0000000000000060 s10: 0000000000000000
[    2.953996]  s11: 0000000000000060 t3 : 0000000065a61b33 t4 : 0000000000000009
[    2.954005]  t5 : ffffffffde180000 t6 : ff2000000000bb08
[    2.954014] status: 0000000200000120 badaddr: 0000000000000000 cause: 0000000000000003
[    2.954047] [<ffffffff8016cbd2>] bpf_mem_alloc_init+0x326/0x32e
[    2.954087] [<ffffffff80e11426>] bpf_global_ma_init+0x1c/0x30
[    2.954097] [<ffffffff8000285e>] do_one_initcall+0x5c/0x238
[    2.954105] [<ffffffff80e011ae>] kernel_init_freeable+0x29a/0x30e
[    2.954115] [<ffffffff80c0312c>] kernel_init+0x1e/0x112
[    2.954124] [<ffffffff80003d82>] ret_from_fork+0xa/0x1c

Copying riscv maintainers and mailing list for feedback / comments.

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
