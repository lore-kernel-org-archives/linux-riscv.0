Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531EFCA5FA7
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 16:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	From:Subject:Cc:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDxySH/lPUN5vtFMV3+zF2+6gG2rYRSrHM+3U9WEW28=; b=x4zNsj84tBjY9w
	kv1C3U73EIaiZwl2WiR1JvpKmEw4pRkmnOXQ5seDGqyExSwQT/3U4HQRnK2e8W4XYMtXftHQuBNNV
	eu6ByKIb/uPy11CcF2ryabXBaSj+Ej31QmU88wrLEKy+OvmhCANQjTz1IlNnBWc1PwMBUb4w80CGC
	nvvvZYZi9gPVKvBKPp1+DhDuGIaKiPhLYg1vy9ZhQl1HYKZO4IYfKm/9opLSyEr256440PumuSk9i
	SKZbr/BPgL+ONWmhb63BzIbTFNt8QFClfGCdgrfAyC7+LToAXz/6yOLCDF+jN0Vc1bEzBDaTm8xC/
	lG5OTqk73I94HgbNOROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBahY-000000043Gw-3zjB;
	Tue, 29 Sep 2026 16:29:08 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBahX-000000043Fl-0ZB1
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 16:29:08 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccafb751so2118820a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 09:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699346; x=1791304146; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gczGrvEptEHhycke4/gymHjEMbqsLy4UXX26l0bR3OM=;
        b=SdfKElOOeMbl56mnxk6dxSAufZj/KwOpoYvcgPQxNfE5ayQo3mfwsVgh34htqRh72u
         IhQlPIU0KXGolLM7kouCdphUrEB1+tampCRZQw7jXKb50qydxfnleLehSebMlE+uKb5q
         4/JR3AqGbOO2Ekm9nSFfsTiBkZ6s7yMf6sZAo2Lx8amkp6ZrvS5OQObfeGSfrHMdDgKa
         7UspQw0hv4y3FFniK2scDGtfwY+LPvl4tlupVkTy55Xxk22in64EURI31iqHchLSq9Jz
         enG99QRxWxc9HrhwIAyAE5sBn62Gk6CnmmK7xlCPeDWL4zDGdbqrXFZg7CHyogrCGCPq
         u/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699346; x=1791304146;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gczGrvEptEHhycke4/gymHjEMbqsLy4UXX26l0bR3OM=;
        b=EqSZnR5X7OT3o2bwvlJ4nH4Wf+SvNTGDdKdL9l4tPVs4q0bFl4RD958egbj3XietD9
         7dXZvGm4FtsBZ6HYwuKeADjZzNAa8KNLxVbx+OEaNE4coFJSkNR7WXXhF787ZOj1yyDc
         PNiGlQ+XT5RARGYex6mxV7L8Xdzhar+yPTvWhCC1nFJkQOcKCjCbUGB/8TJbkacZikw1
         a4S3KqAH7g6RsyGGCqgTvnvayf1n8XELyquDtj7UsrEri9ZGKhPWK2F61au2HHY6sGK9
         2RJVzyUyOxTENja6WPj6nXKj5FLEJ95Mzp0PfgkP5ditr+gfA25eNvvstShMOoTV4b1u
         IaeA==
X-Forwarded-Encrypted: i=1; AKwUvBxaY8aayh0ir2tvdrjBXQwEjKXq1JZUoplhHjk7xqYIiAcTTYVPGvc0jsNJY5JNb9MUKHPgTmF05G195w==@lists.infradead.org
X-Gm-Message-State: AFq9FYJFQklsj6TjlOpcbTnddQfsktIvV0ZBZL/u95YsozpZvuwjtF8E
	C6NsIsgbhfb7WxSQS7CN5nQ3gHIOlC4u9Y7X9+5fnmkc2UGp2Y7OPH1od7WhJDvw
X-Gm-Gg: AYBFou0tX/YMZn6dhLULznlb4uUrnbSFG6dk05450XtKJcZqUvDvxaENpIInE0VtHxu
	2UWRXioFw38lpcahC+RNX69Ho9VpWCVnJKUWejTiXmHaDkT8x0edzr+VEXO5ZIm7LIyXXk5Qt7t
	XWmcytFCWT+r4cTbR7npZ+LDPnEenVVHKiUyIyC30/M4EiANNUQhGi9YoVngtMBkGyHxvW4HtYY
	V6aCwUmRSKvBvmijHI50vfED9XrBpC3Kk+0UwMJyGFK1uZ7JvFcH4zZj+O34eCXw2TY5d+Q2f4m
	IwX3g0d+nXY8w6Z3hl5Jd+ZqM0IlMbPBenn0oHIEq5hpjQvLncVgd+Sy/dRNGTkDlrKe3QCs5YS
	O6jf8vVS5jnYR2v7cWRQhtCBoWUtpYnq+0H3qHfSFF2lBaoOPeWa6rMj7DP2oqPqsLVmUO5b604
	L9g+qWHEfo/XrhFTRACMvzAvPVXLTh6Voz2i1HL0jsRRdMbVEFp3HN7MHblJb7c7dTUTQuTyJFy
	cY9f3fZfC6AzYxERZoyPfEQr19NiejhoiWZAPnc1bVLoA92yvvqaKkwGI3phzk1W4uX67i2su/m
	xrEA
X-Received: by 2002:a17:90b:582c:b0:3a2:b70b:9cd4 with SMTP id 98e67ed59e1d1-3a2b70bb0a5mr3996708a91.12.1790699345913;
        Tue, 29 Sep 2026 09:29:05 -0700 (PDT)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49803d745sm6413747a91.11.2026.09.29.09.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:29:05 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:29:04 +0000
Message-Id: <DLRXXU68JZ5F.2FG7G4UY1DX7F@gmail.com>
To: "Pu Lehui" <pulehui@huaweicloud.com>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>, <bpf@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Puranjay Mohan" <puranjay@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Pu Lehui" <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 2/5] selftests/bpf: Set CONFIG_HZ_100 for
 riscv64
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20260929083924.1851840-3-pulehui@huaweicloud.com>
References: <20260929083924.1851840-1-pulehui@huaweicloud.com> <20260929083924.1851840-3-pulehui@huaweicloud.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_092907_172264_B538136B 
X-CRM114-Status: UNSURE (   6.70  )
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

On Tue, Sep 29, 2026 at 08:39 AM Pu Lehui <pulehui@huaweicloud.com> wrote:
> Let's set CONFIG_HZ_100=y in config.riscv64 to align with other archs
> and fix this issue.

x86 has HZ_1000 and config.ppc64el doesn't set HZ at all.
The test fails with HZ=250 on any arch.
Change 30000 to 40000 in progs/setget_sockopt.c instead ?
It converts without loss with HZ=100, 250 and 1000.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
