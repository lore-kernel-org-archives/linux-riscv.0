Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12A5C47DA9
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 21:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPU53YqZAmYUOtuOpIXdPPw7V4WXWVfYex3MUv1DkjA=; b=3w+46+ZZcK0xqa
	a/xDhQaRLxkKKinVlBN0wvomUa9eKC3hL+JakYTm06KA/tu2FdiupW0F1P0iatCHtywIAHa1IA4LG
	Y5g3LaO/WC3Z5Gsn+5pOVlJQ39ML2bmlu8OFO0tB/6hjuVMurm5ltlqNQbnCIemx83Xbe6LYtnkYQ
	FwEhBuu9EXYLvDWIYY7/w7hcZAvbMIcWWJ0fQYs3uVKp75BsiNGXwZkyRB+AIA8YZv191JC5Z5E78
	VlYjOUCBYQcPQStiu7rOyVeEmP7bOIqCACL2r5yM8QhTYFFgrZT98VDIFRCN5UIehYQW6lD3jf7ms
	gI5JaznSWUyZln5W6FmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUZeG-0000000EPqd-2JrE;
	Mon, 29 Jan 2024 21:58:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUZeD-0000000EPoq-08re
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 21:58:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 758306251A
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 21:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F36C43390
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 21:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706565512;
	bh=DiuiMteWjtD0DGA2bnkTTz/tOuGTgdtmyO9VDZPqxk4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fpZIP9mN2Cq7MhgOxCLMF0x4xErZYqZyAXSjFI4ydzUNS2LP0oFaVJc3ZEteEprcr
	 V4nHpc+imoa1hiOfecKxrFcMh2BQGUKUymCpkR+Xfz4rgKcKpWZVoMakqYplYS58Q1
	 sfxhP7gvpBMbap61rfCU/4Uw7pifFJkTCYCBaTqKCzFp6cWZVoas1Io9cMoz7rSTdP
	 7dzGVRNM2mHrxBh/Eq/PBAvmO4uLHfumR4kuQ7OsFDYxXbzmRIKRFS3vCg4418Ym++
	 gANQKqkksz3wlD4zw94FAyEFigMBQFt0FN3sy/2GFWYPfLlkQa8DO8Vk3pzjL8Srp4
	 vak5BNgh0RzZQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51031ae95a1so2759045e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 13:58:32 -0800 (PST)
X-Gm-Message-State: AOJu0Yxxznbz5+Go8MmtTGxOovF/mvuDbmNxavzbXWeQnbVtN0jy8A5k
	PjX1bNc8efxZF3A4ulywr8a1fAJqhblhR+aXTaN/i7I93TvnaMDDVQ/Q0zg3tgUNRhZ9eYrmjUd
	R1MibyinfbnPRuhy1Ag9sZ6YwlJ0=
X-Google-Smtp-Source: AGHT+IGWAKr0Ycgzi/iZcSUte5256AaxVuyAn7qb7eWq9WOFrFNcVCiCcCsIO0JX8cH0WZIawFB//fulwJs6n5tMN7s=
X-Received: by 2002:a19:5f16:0:b0:510:2832:5625 with SMTP id
 t22-20020a195f16000000b0051028325625mr4145906lfb.52.1706565510279; Mon, 29
 Jan 2024 13:58:30 -0800 (PST)
MIME-Version: 1.0
References: <20240123103241.2282122-1-pulehui@huaweicloud.com> <20240123103241.2282122-4-pulehui@huaweicloud.com>
In-Reply-To: <20240123103241.2282122-4-pulehui@huaweicloud.com>
From: Song Liu <song@kernel.org>
Date: Mon, 29 Jan 2024 13:58:18 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4dUK4NN6HqEpw7AMwaWyUwvm1a=KmDPHfQsVZ1DphYtA@mail.gmail.com>
Message-ID: <CAPhsuW4dUK4NN6HqEpw7AMwaWyUwvm1a=KmDPHfQsVZ1DphYtA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 3/3] riscv, bpf: Use bpf_prog_pack for RV64 bpf trampoline
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
	netdev@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Puranjay Mohan <puranjay12@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Luke Nelson <luke.r.nels@gmail.com>, 
	Pu Lehui <pulehui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_135833_132197_F3F5D08C 
X-CRM114-Status: GOOD (  12.49  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgMjozMuKAr0FNIFB1IExlaHVpIDxwdWxlaHVpQGh1YXdl
aWNsb3VkLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29t
Pgo+Cj4gV2UgdXNlZCBicGZfcHJvZ19wYWNrIHRvIGFnZ3JlZ2F0ZSBicGYgcHJvZ3JhbXMgaW50
byBodWdlIHBhZ2UgdG8KPiByZWxpZXZlIHRoZSBpVExCIHByZXNzdXJlIG9uIHRoZSBzeXN0ZW0u
IFdlIGNhbiBhcHBseSBpdCB0byBicGYKPiB0cmFtcG9saW5lLCBhcyBTb25nIGhhZCBiZWVuIGlt
cGxlbWVudGVkIGl0IGluIGNvcmUgYW5kIHg4NiBbMF0uIFRoaXMKPiBwYXRjaCBpcyBnb2luZyB0
byB1c2UgYnBmX3Byb2dfcGFjayB0byBSVjY0IGJwZiB0cmFtcG9saW5lLiBTaW5jZSBTb25nCj4g
YW5kIFB1cmFuamF5IGhhdmUgZG9uZSBhIGxvdCBvZiB3b3JrIGZvciBicGZfcHJvZ19wYWNrIG9u
IFJWNjQsCj4gaW1wbGVtZW50aW5nIHRoaXMgZnVuY3Rpb24gd2lsbCBiZSBlYXN5LiBCdXQgb25l
IHRoaW5nIHRvIG1lbnRpb24gaXMKPiB0aGF0IGVtaXRfY2FsbCBpbiBSVjY0IHdpbGwgZ2VuZXJh
dGUgdGhlIG1heGltdW0gbnVtYmVyIG9mIGluc3RydWN0aW9ucwo+IGR1cmluZyBkcnkgcnVuLCBi
dXQgZHVyaW5nIHJlYWwgcGF0Y2hpbmcgaXQgbWF5IGJlIG9wdGltaXplZCB0byAxCj4gaW5zdHJ1
Y3Rpb24gZHVlIHRvIGRpc3RhbmNlLiBUaGlzIGlzIG5vIHByb2JsZW0gYXMgaXQgZG9lcyBub3Qg
b3ZlcmZsb3cKPiB0aGUgYWxsb2NhdGVkIFJPIGltYWdlLgo+Cj4gTGluazogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjMxMjA2MjI0MDU0LjQ5MjI1MC0xLXNvbmdAa2VybmVsLm9yZyBb
MF0KPiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgoKQWNrZWQt
Ynk6IFNvbmcgTGl1IDxzb25nQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
