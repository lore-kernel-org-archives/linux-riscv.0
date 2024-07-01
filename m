Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4439CC3065B
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 16:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obQ11ZvmX0MuUqeKMrFF+K3oe/4910W9322APaiv4v4=; b=fSfiEiMS1+LlSoEogLaMOLaz1G
	DMM84zoG5OdheX4CV2DGLWVkk6J1skjep6ZSdw56Dah4hGyNxu+zC9Ex/ZkYw9S40dxaDvOpi4+GR
	K1ZbvS4a3r4bRXwu0WyHr6begUEdBP/BbSgBAw+AaaJ4Tdi5X0OWcG7eNXuMyPa3KPTUMRI96kBL6
	of9MVQ8l+iBYRHNsRXQPBW1AwWDGKq4vb9ZvqyGlb1kNQGX2jPPfteAsw3fkNg2PnNYe70+7ELSEn
	oKpkoTJy+5lJ842wpTd1OgLne6NY4xZpjD/B94SMbF5XirKqVu9Xg2sbLa0xcoPrvjjh5GyXMLBsU
	FhjLCDqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOJeF-000000043p4-3sN2;
	Mon, 01 Jul 2024 16:12:59 +0000
Received: from www62.your-server.de ([213.133.104.62])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOJeC-000000043mV-3nmq
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 16:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=aG2Ey7jvL4aM2MYaJc+dWiRsq9Q1mGDmKGglVh3DZ/M=; b=UtbmvxYo/tWt9oA+GAjyv4gXsJ
	R14zaX7NCHROVjqSJTE/bOO7o2MtqdTsuR7Tq+6CoVJ3w4wZJ1R+P15YPZoPBZIYBlfDoJsge5jBH
	Npwbqd1kJ6y5hYCYdhvl3dPPNyCNDKW3/MNgCzkYpQ3CEEfPwLPyjrvzMkwh2tdVY/73f1Btpgeox
	gsLeC/+vQoygWBWUpmFO3ZHp4yq8EPEo4yXx8CQ/mejT/kYgXnIu8SJC2rGPG5jDiu5csRj7HDJk+
	3X5cjkqeVFWGX0I73YMsU6JEBCcGSwXcbmLSh1Ffa/XN33lgirsV4M7MldRPaScH/rFlv74pLLYb6
	rCiZKW6Q==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1sOJdr-000LNO-VJ; Mon, 01 Jul 2024 18:12:35 +0200
Received: from [178.197.249.41] (helo=linux.home)
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <daniel@iogearbox.net>)
	id 1sOJdq-000Cwd-1i;
	Mon, 01 Jul 2024 18:12:34 +0200
Subject: Re: [PATCH RESEND bpf-next v4 2/3] selftests/bpf: Factor out many
 args tests from tracing_struct
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pu Lehui <pulehui@huawei.com>
References: <20240622022129.3844473-1-pulehui@huaweicloud.com>
 <20240622022129.3844473-3-pulehui@huaweicloud.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <2bbced4a-1022-aace-52b4-e0abe426347b@iogearbox.net>
Date: Mon, 1 Jul 2024 18:12:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20240622022129.3844473-3-pulehui@huaweicloud.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.10/27323/Mon Jul  1 10:40:06 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_091256_967814_1D6F5B0B 
X-CRM114-Status: GOOD (  11.77  )
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

On 6/22/24 4:21 AM, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> Factor out many args tests from tracing_struct and rename some function
> names to make more sense.
> 
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
[...]
> diff --git a/tools/testing/selftests/bpf/progs/tracing_struct_many_args.c b/tools/testing/selftests/bpf/progs/tracing_struct_many_args.c
> new file mode 100644
> index 000000000000..8bd696dc81d9
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/progs/tracing_struct_many_args.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (C) 2024. Huawei Technologies Co., Ltd */

Overall looks good and ready to land, one small request: lets drop the copyright
comment here since this commit is only moving the existing tests out to its own
file which have been added originally via 5e9cf77d81f9 ("selftests/bpf: add testcase
for TRACING with 6+ arguments").

Thanks,
Daniel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
