Return-Path: <SRS0=vikP=Z7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DBCC43603
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2019 21:27:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25DC52071E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2019 21:27:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LpCDT85H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25DC52071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iogearbox.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RbccvPMtgp1BXBORi/UlWmI/75PCwGKVgiYrmgfH/Jo=; b=LpCDT85HjjCtUn
	+weVaFeQ4C5dDhyJkYa30ANEH9G1UEeOoN+Ti+76G7zNOcjWMXxj16FZ5G96oC+XCG6zCC1GgHaxJ
	XXb3YfxEl+437FLR9wILUqNjLH/7xJCgNkF55vG5DaVGpOIMdC3vZT0QXK1LrkisQVs4uO4NaCXBl
	5q9X3S4P2whmLUwY7nqwF2sh+Rj2+NngssallxOdvGGY/jBuIYmeUfdBC6BBAYiSAmyH/31kvWNZ9
	e9mOa70FHLH+NmjX93x0W+crqDWV+QiUrzEzCL/2vHMg6/7H9MkQx2bgt5bsslnRfrYMQcFdI1Z6U
	myjk0Ct80vMJxm6+W7Eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieQZE-00007x-Bt; Mon, 09 Dec 2019 21:27:44 +0000
Received: from www62.your-server.de ([213.133.104.62])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieQZC-0008UB-4R
 for linux-riscv@lists.infradead.org; Mon, 09 Dec 2019 21:27:43 +0000
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <daniel@iogearbox.net>)
 id 1ieQYz-0005UU-5g; Mon, 09 Dec 2019 22:27:29 +0100
Received: from [178.197.249.52] (helo=pc-9.home)
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1ieQYy-000RvL-Qi; Mon, 09 Dec 2019 22:27:28 +0100
Subject: Re: [PATCH bpf-next 2/8] riscv, bpf: add support for far branching
To: Luke Nelson <lukenels@cs.washington.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
References: <20191209173136.29615-1-bjorn.topel@gmail.com>
 <20191209173136.29615-3-bjorn.topel@gmail.com>
 <CADasFoDOyJA0nDVCyA6EY78dHSSxxV+EXS=xUyLDW4_VhJvBkQ@mail.gmail.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <2d5d1f2d-d4ab-2449-37c6-e5b319a778d6@iogearbox.net>
Date: Mon, 9 Dec 2019 22:27:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CADasFoDOyJA0nDVCyA6EY78dHSSxxV+EXS=xUyLDW4_VhJvBkQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.101.4/25658/Mon Dec  9 10:47:26 2019)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_132742_172019_063E7E1B 
X-CRM114-Status: GOOD (  14.88  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Netdev <netdev@vger.kernel.org>, linux-riscv@lists.infradead.org,
 bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Xi Wang <xi.wang@gmail.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/9/19 10:08 PM, Luke Nelson wrote:
[...]
> We have been developing a formal verification tool for BPF JIT
> compilers, which we have used in the past to find bugs in the RV64
> and x32 BPF JITs:
> 
> https://unsat.cs.washington.edu/projects/serval/
> 
> Recently I added support for verifying the JIT for branch and jump
> instructions, and thought it a good opportunity to verify these
> patches that add support for far jumps and branching.
> 
> I ported these patches to our tool and ran verification, which
> didn't find any bugs according to our specification of BPF and
> RISC-V.
> 
> The tool and code are publicly available, and you can read a more
> detailed writeup of the results here:
> 
> https://github.com/uw-unsat/bpf-jit-verif/tree/far-jump-review
> 
> Currently the tool works on a manually translated version of the
> JIT from C to Rosette, but we are experimenting with ways of making
> this process more automated.

This is awesome work! Did you also check for other architectures aside
from riscv and x86-32, e.g. x86-64 or arm64?

It would be great if we could add such verification tool under tools/bpf/
which would then take the in-tree JIT-code as-is for its analysis and
potentially even trigger a run out of BPF selftests. Any thoughts whether
such path would be feasible wrt serval?

> Reviewed-by: Luke Nelson <lukenels@cs.washington.edu>
> Cc: Xi Wang <xi.wang@gmail.com>

Thanks,
Daniel

