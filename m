Return-Path: <SRS0=4eYz=VC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B517C5B57D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2019 22:01:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5B0820856
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2019 22:01:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mZLBDhQa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5B0820856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iogearbox.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TtcsuHK9uGNmWmAVasCQkdijf8hdpPtZReRRSKjfATo=; b=mZLBDhQa+cFEoQ
	wNRE8bheznpP8mxTuqImjh0doyIbEcDXPmqcM+NOsqbgQecIL6SHte8aB80C4zp1MEj4HgkLeNOPw
	nvhy6hFOaUYay71y30c4zYyneyMNokHiCscHK2G3JqJgBbFODejed1Y2BP4OfC3fhqGm3XaZlj8qB
	vTuXQq11eaMMB5w8JgwpxqTM438t4o1MpLEM3OlvlmlA3+TRyia1BOneNAYq3zFv1q1Sfn4cv6jXd
	+jaTu6H0LIEwZZBWIHgciO0AaFOusVbJZfQNinN3W33iD0gFwsMlTHv+avEoA4E+/sz/VMTQ+0lsW
	rXQAhPUBB70ckBp7mNZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hjWGz-00027l-DV; Fri, 05 Jul 2019 22:01:41 +0000
Received: from www62.your-server.de ([213.133.104.62])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjWGw-00026c-H3
 for linux-riscv@lists.infradead.org; Fri, 05 Jul 2019 22:01:39 +0000
Received: from [88.198.220.130] (helo=sslproxy01.your-server.de)
 by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <daniel@iogearbox.net>)
 id 1hjWGZ-0003Tn-0E; Sat, 06 Jul 2019 00:01:15 +0200
Received: from [178.193.45.231] (helo=linux.home)
 by sslproxy01.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <daniel@iogearbox.net>)
 id 1hjWGY-0004Kx-MV; Sat, 06 Jul 2019 00:01:14 +0200
Subject: Re: [PATCH bpf-next] Enable zext optimization for more RV64G ALU ops
To: Luke Nelson <lukenels@cs.washington.edu>, linux-kernel@vger.kernel.org
References: <20190705001803.30094-1-luke.r.nels@gmail.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <fbd0a41a-2d45-7b25-b417-f325d31c0074@iogearbox.net>
Date: Sat, 6 Jul 2019 00:01:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20190705001803.30094-1-luke.r.nels@gmail.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.100.3/25501/Fri Jul  5 10:01:52 2019)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190705_150138_566064_0B16373B 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
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
Cc: Song Liu <songliubraving@fb.com>, Albert Ou <aou@eecs.berkeley.edu>,
 bpf@vger.kernel.org, Luke Nelson <luke.r.nels@gmail.com>,
 Jiong Wang <jiong.wang@netronome.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, Song Liu <liu.song.a23@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, netdev@vger.kernel.org,
 Yonghong Song <yhs@fb.com>, linux-riscv@lists.infradead.org,
 Martin KaFai Lau <kafai@fb.com>, Xi Wang <xi.wang@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 07/05/2019 02:18 AM, Luke Nelson wrote:
> commit 66d0d5a854a6 ("riscv: bpf: eliminate zero extension code-gen")
> added the new zero-extension optimization for some BPF ALU operations.
> 
> Since then, bugs in the JIT that have been fixed in the bpf tree require
> this optimization to be added to other operations: commit 1e692f09e091
> ("bpf, riscv: clear high 32 bits for ALU32 add/sub/neg/lsh/rsh/arsh"),
> and commit fe121ee531d1 ("bpf, riscv: clear target register high 32-bits
> for and/or/xor on ALU32")
> 
> Now that these have been merged to bpf-next, the zext optimization can
> be enabled for the fixed operations.
> 
> Cc: Song Liu <liu.song.a23@gmail.com>
> Cc: Jiong Wang <jiong.wang@netronome.com>
> Cc: Xi Wang <xi.wang@gmail.com>
> Signed-off-by: Luke Nelson <luke.r.nels@gmail.com>

Applied, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
