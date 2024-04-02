Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09981CD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 23:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Urx+rMdxgH+To24ocTQXLgeRRgoB/ez6BtjhDVl/l98=; b=tLVm/kmY0MxR5Q
	02/pEiydDSFjJ6s/nRy+KD37Bau5jMLPr+SlKQqU8lYzj7Kpcor3KvFZy8nlJ89EGISoLMiH97iE3
	2+MJ25hz8Ce5+I1dqgLKJXCwpACPYEd6ROAkyDrlNiUiw39arwf6yNDb4INWMbqSLdHEtvFy7QY69
	VWWYg5VmTQNmeMgnu6E3RMSU3Yz1f1rMALVE738rajt+QvMYXm0NJVzwgVo/+QfrNqCxjC6K5tc8w
	dc9cOMim7Gb18qYwgWrtDSt5wIKoIlD2+KvvHeveglNKrteqGjGSu8IKTdEdQpL9d4geUZSNLTGMk
	6T2z3UweIJCfViKv+jfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrnjz-0000000DDXF-40x4;
	Tue, 02 Apr 2024 23:40:32 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrnjx-0000000DDV1-0K8m
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 23:40:30 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-56845954ffeso8441262a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 16:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712101222; x=1712706022; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=loPuGZvFw7w7LRVaWYgctsCo+62m5RzROUBjXyR2dwA=;
        b=g4aSAW1AdC0EWAmRP1pfafa1muq3KQ2LCmQ3QdvQNQTRtMDg0dJKtbGARxMggSLPlS
         mXf2FbqEvFW0gLQj65G2FS35kH3P3ffX6GOX+hApyTmMNwgm41xWHkRaUCRwIVrjd7AE
         oJsIxl+y5Nv87D1oZB2pkYdcsBXJNIFKM7unV7PQ5EUOj6wt0FhJOVhvMOMTePny6BYt
         wmA6WMUuTveFLo/e0NJtRAnFZHv39pyCfzOyjHZdonMVrSPEYtQ6qSzjuQawSlF3K7Ml
         re4VKHz1ri4xmm2NhMpOZBewHhss0X3jmqZSEGzj6jjcoHjHLSSc9TUtTyLemLaCbrfi
         7SGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712101222; x=1712706022;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=loPuGZvFw7w7LRVaWYgctsCo+62m5RzROUBjXyR2dwA=;
        b=UkyWrsAvzE/RwwQO2xSxDL2Qw61scUFYs/1RlJ8dbNr8RsWnkF3QTBom4qo+hhPwFF
         lzrq5u92FbqQBgdnuf4D41a4/W2gWRyPLE6vWc0ClM4xOx8soaDpiw0UOFQ4zDhgiFhT
         FVVF+6Yjk8nVuJG80Liv4+IoeeU33t+k57YFzt7cSqvAfrGs95saUT/OQn0HHc2/6h7W
         ttsD89YLVGMPHPoloCRDWlfJU4QNhQjgPvgo3Es+2DTgHQ/ca6rhAr4DDBOZQUulaD7Q
         9tMKdne9nC0CGwBlqKoFsEyUcs8IgY6SS5IU6hZSi9lMUaJTU6+rV+AEuh2wJZt0eT7T
         fvSw==
X-Forwarded-Encrypted: i=1; AJvYcCXNog8gCE4gte+WI2se9AiChDPVHYg80BI1CiqlnYQt20oFo4NBsXaYOXA1wsmRLn909R6enhc0s3HRCp/9XpLUJoMeMnPH6p9EdR47J3tr
X-Gm-Message-State: AOJu0YzZr0zKuHSv4rc0TQ6PCsTy74vyeVdy8lkiSAHAdsyQy+g4xhrv
	MMOAZzSzY/f9oSlkgPYxFglyd/wYZi50c0MtqHIbfaY3WbkLz9SB
X-Google-Smtp-Source: AGHT+IE4IvdVSybvfrO0pA7dyCkt2gquEU61qYsV7TNGj5+LUts+YXpDVQv9SuIOKyWehdTwysjT6Q==
X-Received: by 2002:a17:906:e202:b0:a47:5182:3b83 with SMTP id gf2-20020a170906e20200b00a4751823b83mr7710360ejb.61.1712101222329;
        Tue, 02 Apr 2024 16:40:22 -0700 (PDT)
Received: from [192.168.100.206] ([89.28.99.140])
        by smtp.gmail.com with ESMTPSA id gc9-20020a170906c8c900b00a4e440989f5sm5056824ejb.159.2024.04.02.16.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 16:40:21 -0700 (PDT)
Message-ID: <f20d1e2a2f5fa10f29bf1fddbaf99c3f185e8530.camel@gmail.com>
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
Date: Wed, 03 Apr 2024 02:40:19 +0300
In-Reply-To: <52117f9c-b691-409f-ad2a-a25f53a9433d@huaweicloud.com>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
	 <32b3358903bf8ba408812a2636f39a275493eb91.camel@gmail.com>
	 <e995a1f1-0b48-4ce3-a061-5cbe68beb6dd@huaweicloud.com>
	 <f91237f311f183d57c4620bc2e6099df8aefccb0.camel@gmail.com>
	 <52117f9c-b691-409f-ad2a-a25f53a9433d@huaweicloud.com>
Autocrypt: addr=eddyz87@gmail.com; prefer-encrypt=mutual; keydata=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
User-Agent: Evolution 3.50.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_164029_146806_97026F07 
X-CRM114-Status: GOOD (  20.98  )
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

On Sat, 2024-03-30 at 18:12 +0800, Pu Lehui wrote:
[...]

> > Looks like I won't be able to test this patch-set, unless you have
> > some writeup on how to create a riscv64 dev environment at hand.
> > Sorry for the noise
> 
> Yeah, environmental issues are indeed a developer's nightmare. I will 
> try to do something for the newcomers of riscv64 bpf. At present, I have 
> simply built a docker local vmtest environment [0] based on Bjorn's 
> riscv-cross-builder. We can directly run vmtest within this environment. 
> Hopefully it will help.
> 
> Link: https://github.com/pulehui/riscv-cross-builder/tree/vmtest [0]

Hi Pu,

Thank you for sharing the docker file, I've managed to run the tests
using it. In order to avoid creating files with root permissions I had
to add the following lines at the end of the Dockerfile:

+ RUN useradd --no-create-home --uid 1000 eddy
+ RUN passwd -d eddy
+ RUN echo 'eddy ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
+ # vmtest.sh does 'mount -o loop',
+ # ensure there is a loop device in the container
+ RUN mknod /dev/loop0 b 7 20

Where 'eddy' is my local user with UID 1000.
Probably this should be made more generic.
I used the following command to start the container:

docker run -ti -u 1000:1000 \
    --rm -v <path-to-kernel-dir>:/workspace \
    -v <path-to-rootfs-image-dir>:/rootfs \
    --privileged ubuntu-vmtest:latest /bin/bash

Also, I had to add '-d /rootfs/bpf_selftests' option for vmtest.sh in
order to avoid polluting user directory inside the container.
Maybe OUTPUT_DIR for vmtest.sh should be mounted as a separate volume.

I agree with Daniel, it would be great to document all of this
somewhere in the repo (or even scripted somehow).

Using the specified DENYLIST I get the following stats for test_progs:

  #3/2     arena_htab/arena_htab_asm:FAIL
  #3       arena_htab:FAIL
  #95      get_branch_snapshot:FAIL
  #172/1   perf_branches/perf_branches_hw:FAIL
  #172     perf_branches:FAIL
  #434/3   verifier_arena/basic_alloc3:FAIL
  #434     verifier_arena:FAIL
  Summary: 531/3581 PASSED, 64 SKIPPED, 4 FAILED

Tested-by: Eduard Zingerman <eddyz87@gmail.com>

> PS: Since the current rootfs of riscv64 is not in the INDEX, I simply 
> modified vmtest.sh to support local rootfs.

Could you please add this change to the patch-set?

[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
