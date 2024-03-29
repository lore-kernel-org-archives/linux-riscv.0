Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596CCC6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 19:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4O7JkuDCIUd0h9da0D5hIw9u5Y/EAOIs1TKSpBtIT0=; b=g90nT0/Iymmx0Z
	JrlSc3wYLfUHK0al5Bh/BMQn8YDffOW0WyHl9Jj+keOEE5UXl4Di8++Yhu3QMFPv6LoCCCjmrVkCu
	voGmRjOPb6rS68CMJ+ZpoUj0xkhr7l0g+8or0UXRsKNg+qeDiV2E6vl0ayg38/KLRlYbXMdxvKliY
	ZmVQjQyLUQQZV6GKwCEsz5QDYuoyizbh2/IDy6pXwF8EvBad3yldLkAGTBDf8JYyXqoeZGXA9+2xM
	B3xhV8jenfR06w0+QPy1iu6FvUBey5Bkspbgtfi6NzIAZTf9bKYNJp7ujRKxOcO79J27QYTNPRI5m
	cOLoYKRK9Lz0/G84dWHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqIBR-00000001o8t-0jyQ;
	Fri, 29 Mar 2024 19:46:37 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqIBO-00000001o84-0UR9
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 19:46:35 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-56c2c41cbdaso1291369a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 12:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711741592; x=1712346392; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iRbhTuKdGVdgcCtOxKjPCp9tzZ0RXndz1gW7/Urj2f8=;
        b=Q6bBjBdUqR8h3k9SpmXRim0IuNyDVhmOcAzfa/5Ue5GuMg5YCEesvhGZz7mt9t8MCX
         R5e1ka5EDJmKjOBXh7zWJ6xHdDc11M9gnpYouZciuG2uDZkOoHt0sYL1f3uPolClGDat
         2DClW4WFNbM/ttsaSHGGNGQqhX3pE3dkeRCxcgPRFN/O4dUr4oEk5blxOdGDTf6CDGkL
         etakVDKFEktNwCtXT2xUFGIFDYFOYmvu/mxYF/0LtAhXB5fdP8F4WYMdRoPYvOx10auQ
         caHarIOCRP75aTs3mQlsEgt/y9/vqi1EqoTGguOZwhXW5xES9ABHM1Rk6aG0zeOYAFJo
         fvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711741592; x=1712346392;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iRbhTuKdGVdgcCtOxKjPCp9tzZ0RXndz1gW7/Urj2f8=;
        b=Mlh1f1QD4u0WjlPLaCJ4EFFiTEmOl33ar9tAHGOyNWxbvOr9cxpp0Rj4qXLdYhnf5/
         u9rSpOOnYe+CpcUwovLaX2UDfLlsqGWevNduXyVTCxokS6SBS71Up2cenqKMhQx0UZF3
         5pg9C/irJjfEHHEwUjcKuqMWomDW7rUDd22XuZtjg3qq4acL1+IGMKCWVYO/r9twABQg
         I1XgxDZIb2EE0DjsWHmvN/Ccp5XFZim6l6Zy10Q7VwTNTrpZXKerzWT5bWkDS8qPcFdO
         dylaBDVL7OkHHCoYOQOOZ9UUxH+yonoEwyF5CfzLzXGG3JP79a813YfuaQNNT9kuSAgB
         rU7A==
X-Forwarded-Encrypted: i=1; AJvYcCXKk4TlQGYsZKIC4z1J9zH50S2SQL70FoEvg+oGyKhh6MdUUVXHeAf/cV6smmlyF75H4KQwkIV4B0u6evaik+LB7nVZr3Q54KnUpP24y/RR
X-Gm-Message-State: AOJu0Yx5/3EjZ0IkMVz4HT73vmjbzZ6bLYnF7DHFsfee1S2g5IEo5WjD
	XHKok9PkgIgZf5PQR0HNCiecQ3Y65iDZkS9TJyRFeQu1pKA+n1BB
X-Google-Smtp-Source: AGHT+IFeoi9VX0eigQunOE3+7oIKVGDHZNovNgU3K34137TXC0OWeeil7vlqVFwtH1vghv5nVyPSMA==
X-Received: by 2002:a05:6402:13d6:b0:56c:5a7b:5dbf with SMTP id a22-20020a05640213d600b0056c5a7b5dbfmr3477343edx.2.1711741591953;
        Fri, 29 Mar 2024 12:46:31 -0700 (PDT)
Received: from ?IPv6:2a00:1858:1027:8084:dcff:fef3:4040:e18d? ([2a00:1858:1027:8084:dcff:fef3:4040:e18d])
        by smtp.gmail.com with ESMTPSA id l2-20020a056402124200b0056c4ca20d48sm2386458edw.49.2024.03.29.12.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 12:46:31 -0700 (PDT)
Message-ID: <f91237f311f183d57c4620bc2e6099df8aefccb0.camel@gmail.com>
Subject: Re: [PATCH bpf-next 0/5] Support local vmtest for riscv64
From: Eduard Zingerman <eddyz87@gmail.com>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>,  Mykola Lysenko <mykolal@fb.com>, Manu Bretelle
 <chantr4@gmail.com>, Pu Lehui <pulehui@huawei.com>
Date: Fri, 29 Mar 2024 21:46:14 +0200
In-Reply-To: <e995a1f1-0b48-4ce3-a061-5cbe68beb6dd@huaweicloud.com>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
	 <32b3358903bf8ba408812a2636f39a275493eb91.camel@gmail.com>
	 <e995a1f1-0b48-4ce3-a061-5cbe68beb6dd@huaweicloud.com>
Autocrypt: addr=eddyz87@gmail.com; prefer-encrypt=mutual; keydata=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
User-Agent: Evolution 3.50.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_124634_185472_6DC2A6DA 
X-CRM114-Status: GOOD (  12.10  )
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

On Fri, 2024-03-29 at 18:10 +0800, Pu Lehui wrote:
[...]

> > Apparently jammy does not have binaries built for riscv64, or I'm failing to find correct mirror.
> > Could you please provide some instructions on how to prepare rootfs?
> 
> Hi Eduard, We need the mirror repository of ubuntu-ports, you could try 
> http://de.ports.ubuntu.com/.

Hi Pu, thank you this mirrorm it works.

Unfortunately my local setup is still not good enough.
I've installed cross-riscv64-gcc14 but it seems that a few more
libraries are necessary, as I get the following compilation errors:

  $ PLATFORM=riscv64 CROSS_COMPILE=riscv64-suse-linux- ./vmtest.sh -- ./test_verifier
  ... kernel compiles ok ...
  ../../../../scripts/sign-file.c:25:10: fatal error: openssl/opensslv.h: No such file or directory
     25 | #include <openssl/opensslv.h>
        |          ^~~~~~~~~~~~~~~~~~~~
  compilation terminated.
    CC      /home/eddy/work/bpf-next/tools/testing/selftests/bpf/tools/build/host/libbpf/sharedobjs/bpf.o
  In file included from nlattr.c:14:
  libbpf_internal.h:19:10: fatal error: libelf.h: No such file or directory
     19 | #include <libelf.h>
  ...

Looks like I won't be able to test this patch-set, unless you have
some writeup on how to create a riscv64 dev environment at hand.
Sorry for the noise.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
