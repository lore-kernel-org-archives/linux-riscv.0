Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2D8C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 12:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JT+ZnsVhq4UmdO1n8sjfhnNJpkDv57hBzB2Pcv6aGB0=; b=T0lztnqroYwRIU
	fbOiF8xzbMYWBr62ROS63Fr5z5IiNuBT0MMra+/8BCk7RsPr+1d7AP7BHer1hKmIoBYlQulvkMzx9
	j+MVy5r5Wa6Q4jlaUdpHvEm4pYphZNh6Zq/9CQqdp3Cj/8/ESUkpq0vIuDqPMIigJlvS79CUUHFr0
	O8ahkC+lUH4IN6HPJqb+rBmQHJKZKtvfInF40mux302pSKU6wjAcT4FbH0vtbjxLHk/Zx/spzwUAk
	IAcI9jjzqmKQ/lGf3L4qXA2nI3SNS8MEWJJTGkZVBiFmlI24Je8yeMhPeC7ErPbvmqRWaG17X/m80
	2TxY2yu8+pEcL8YRwESA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndtUo-009249-4M; Mon, 11 Apr 2022 12:50:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndtUl-00923d-Pf
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 12:50:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7F036B815BB
 for <linux-riscv@lists.infradead.org>; Mon, 11 Apr 2022 12:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523F0C385A9
 for <linux-riscv@lists.infradead.org>; Mon, 11 Apr 2022 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649681412;
 bh=dUzLlQ/ZP4JOlwkxabVbYohZa7/xE4mVkwe8Av49ND8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FRaZXIaInIBQVGu2hjSFsez3w2wJw5uWhpq3EQQFwBJYULTIWHMDtwhHAzLJjL+pG
 OyFvgSKrBWux+5kEjoLByjMZ4hAYu+ZwpGG9uETsvppzQ3w+xHFBeINvso9qN7mzbk
 IEaxtCSkt1aS4asnRU8nGWPsp1+AxXJHAqK0R/4k5JZdXuZMs3D6eya119JVqSD7t6
 u5aaD5RbtUEugsv+QsYC1zwW9hZOeOqiKv7OCaS4i6hBJV2Ze9zea7+Od/9T4rWOBm
 O/meuynmHpRc09iedhinKgNSG+cKQnqoNxCweo8039EPcpY2sxoceYpz0IvWd6cFZW
 FwSz/6dedp96A==
Received: by mail-wr1-f43.google.com with SMTP id r13so22828882wrr.9
 for <linux-riscv@lists.infradead.org>; Mon, 11 Apr 2022 05:50:12 -0700 (PDT)
X-Gm-Message-State: AOAM533KKGzrGV3ObbzuXCX4R9tu73MXe92353SJMr2KOflkA8YmDP41
 /5qS8fFkzMu3d1zp9apoGzKz7CPejGUGvktArxY=
X-Google-Smtp-Source: ABdhPJy1K2xOrHfwDw26te0LKpYibGXf0wkirVPf3evW6NGryoDVre34N/2Fa7zJeboTRE157pU9XkaGG0Lbxu+mOLU=
X-Received: by 2002:a05:6000:1868:b0:204:1e4f:7f9a with SMTP id
 d8-20020a056000186800b002041e4f7f9amr25010406wri.106.1649681410549; Mon, 11
 Apr 2022 05:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220410101246.232875-1-pulehui@huawei.com>
In-Reply-To: <20220410101246.232875-1-pulehui@huawei.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Mon, 11 Apr 2022 14:49:58 +0200
X-Gmail-Original-Message-ID: <CAJ+HfNg0zsf7sRfPiQCNDvVKARbQq0kO9ya9rk=fAh92cvpHHw@mail.gmail.com>
Message-ID: <CAJ+HfNg0zsf7sRfPiQCNDvVKARbQq0kO9ya9rk=fAh92cvpHHw@mail.gmail.com>
Subject: Re: [PATCH bpf-next] riscv,
 bpf: Implement more atomic operations for RV64
To: Pu Lehui <pulehui@huawei.com>
Cc: bpf <bpf@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>,
 Xi Wang <xi.wang@gmail.com>, 
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_055016_006667_5CBA1581 
X-CRM114-Status: GOOD (  10.19  )
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

T24gU3VuLCAxMCBBcHIgMjAyMiBhdCAxMTo0MywgUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNv
bT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGltcGxlbWVudCBtb3JlIGJwZiBhdG9taWMgb3BlcmF0
aW9ucyBmb3IgUlY2NC4KPiBUaGUgYWRkZWQgb3BlcmF0aW9ucyBhcmUgc2hvd24gYmVsb3c6Cj4K
PiBhdG9taWNbNjRdX1tmZXRjaF9dYWRkCj4gYXRvbWljWzY0XV9bZmV0Y2hfXWFuZAo+IGF0b21p
Y1s2NF1fW2ZldGNoX11vcgo+IGF0b21pY1s2NF1feGNoZwo+IGF0b21pY1s2NF1fY21weGNoZwo+
Cj4gU2luY2UgcmlzY3Ygc3BlY2lmaWNhdGlvbiBkb2VzIG5vdCBwcm92aWRlIEFNTyBpbnN0cnVj
dGlvbiBmb3IKPiBDQVMgb3BlcmF0aW9uLCB3ZSB1c2UgbHIvc2MgaW5zdHJ1Y3Rpb24gZm9yIGNt
cHhjaGcgb3BlcmF0aW9uLAo+IGFuZCBBTU8gaW5zdHJ1Y3Rpb25zIGZvciB0aGUgcmVzdCBvcHMu
IFRlc3RzICJ0ZXN0X2JwZi5rbyIgYW5kCj4gInRlc3RfcHJvZ3MgLXQgYXRvbWljIiBoYXZlIHBh
c3NlZCwgYXMgd2VsbCBhcyAidGVzdF92ZXJpZmllciIKPiB3aXRoIG5vIG5ldyBmYWlsdXJlIGNl
c2VzLgo+Cj4gU2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KClRo
YW5rIHlvdSBmb3IgaW1wbGVtZW50aW5nIHRoaXMhIEl0J3MgYmVlbiBsb25nIG92ZXJkdWUuCgpB
Y2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
