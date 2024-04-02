Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0683C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 14:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5MkngAbWC+pMV0AvCUxYDg4pSj7Srlmulm52t67DDA=; b=RvlLUWSUsDqJ0aFrii5CvjPODJ
	eTp0q/vhyA3YsXidjfnWmk5xWCtNovL7L2tkOZWOC2gaESOW1nHlotrJ52fB/TVuhNyEFza5M2q1k
	qwdIb/B58tXsSfmeSlpvZl/np2fApd17fcQfZUO3s8T/EFby+9pHvp9AcR50s4VWYuqxkOmXG1oAv
	l0Jfk+XsLHUOxmLnvlKNq00rA3n1hFusa6NrTbnT8uAGDDOFLT9KW6uqYLfg9cpvYM26xHaKLyODO
	8rvvDRgqvW1H8Hyekibi/uFt0NuGZKqqQpjV/Uo0lzcxAThKAkHJyDKSfXv9t/H/hbf/XNZJglrh7
	Spo7xhMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rreiW-0000000BUGx-1yZ3;
	Tue, 02 Apr 2024 14:02:24 +0000
Received: from www62.your-server.de ([213.133.104.62])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rreiT-0000000BUDa-2s9V
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 14:02:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=sDKSBKctIHDpPvXzGMLCuAyCRKl5uTk+wKlRRmtyYU8=; b=CPtOGAR4IzTp1fXZss506ooEAh
	61WURTi40li+u+jDmEa2wooqXUZTNEm1PkmZFeqN48swERppVnyqRhInsf3ExyJBJ7RemR1SSTvTL
	I/WY6e/RbmANMoB7LMyiT0IyN+gQMNTOrR4NDfUgBA6XGKJzYeUu9gUpF1g+1yo1N8q68jQy9Yj4+
	1Xb2oRGPbig7E5Ts0kZ7pgbpHE3VhvdBBgy19P3z56xnHqgJrD6372tlzjo32n7p/K+drreEMRYG1
	SJsT02XTfZaeYZD1We0RtoOkIvudvKgIKO3yvKfUvmIVDeFYaUobxZiyZnDFtFYJR7EbceJ+HeYxv
	+IREPgLQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1rreiE-000C7B-Cn; Tue, 02 Apr 2024 16:02:06 +0200
Received: from [178.197.248.12] (helo=linux.home)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <daniel@iogearbox.net>)
	id 1rreiD-00Er11-12;
	Tue, 02 Apr 2024 16:02:05 +0200
Subject: Re: [PATCH bpf-next 2/2] selftests/bpf: Add testcase where 7th
 argment is struct
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Pu Lehui <pulehui@huawei.com>
References: <20240331092405.822571-1-pulehui@huaweicloud.com>
 <20240331092405.822571-3-pulehui@huaweicloud.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <967f996f-f660-4615-696e-95c5db0542ad@iogearbox.net>
Date: Tue, 2 Apr 2024 16:02:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20240331092405.822571-3-pulehui@huaweicloud.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.10/27233/Tue Apr  2 10:26:21 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_070221_797394_30812A2C 
X-CRM114-Status: UNSURE (   9.08  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/31/24 11:24 AM, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> Add testcase where 7th argument is struct for architectures with 8
> argument registers, and increase the complexity of the struct.
> 
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>   .../selftests/bpf/bpf_testmod/bpf_testmod.c   | 19 ++++++++++
>   .../selftests/bpf/prog_tests/tracing_struct.c | 13 +++++++
>   .../selftests/bpf/progs/tracing_struct.c      | 35 +++++++++++++++++++
>   3 files changed, 67 insertions(+)

The last test from this patch fails BPF CI, ptal :

https://github.com/kernel-patches/bpf/actions/runs/8497262674/job/23275690303
https://github.com/kernel-patches/bpf/actions/runs/8497262674/job/23275690364

Notice: Success: 519/3592, Skipped: 53, Failed: 1
Error: #391 tracing_struct
   Error: #391 tracing_struct
   test_fentry:PASS:tracing_struct__open_and_load 0 nsec
   libbpf: prog 'test_struct_arg_16': failed to attach: ERROR: strerror_r(-524)=22
   libbpf: prog 'test_struct_arg_16': failed to auto-attach: -524
   test_fentry:FAIL:tracing_struct__attach unexpected error: -524 (errno 524)
Test Results:
              bpftool: PASS
           test_progs: FAIL (returned 1)
Error: Process completed with exit code 1.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
