Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3CEC83F22
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Jul 2025 20:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxqNEMlx2HEPv7Yvsbf02cKgNodV1lnpOru9tffSdCs=; b=GbSzVBBadQLSkw
	RNQRvDmbBfiaETM5P0e32hmREhR8QneSQlWXKBbzwCBziUKKnRBMXofE1+KrGdylik9BYXHtuyxcp
	ZnF8sBoNVFQ9SQhg2yHkhrAEEFjvoG3BM+7p3n4WXoPzkcpLrJNWf0UrGfNScCZiXuU4hi95XYWL0
	lddUOzPIbZMxhjfDBRxQayv1zxtaQpWU6QKF0gsEs7Vvf2HJzosZY0pu3T1pQrTrO+y14SbSHKn+W
	8Gm2KcfQwqVH2I95sL1huT49561V3BXY2K/IgZb6DJ0lLeK6OLSLf6MlEQkC00qleeF4sum4CrXxL
	x4dj/PQD86rct3SRiR8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udanG-0000000FhmQ-1nJY;
	Sun, 20 Jul 2025 20:37:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udanE-0000000Fhlh-00fU
	for linux-riscv@lists.infradead.org;
	Sun, 20 Jul 2025 20:37:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 59A37A4C77B
	for <linux-riscv@lists.infradead.org>; Sun, 20 Jul 2025 20:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52C7C4CEF8
	for <linux-riscv@lists.infradead.org>; Sun, 20 Jul 2025 20:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753043873;
	bh=fcbfoAX+qKBBt661MEouZNU/1XPJWU8ldRLY416DlZ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RYKPPXngS9zSJZtbHin0azpivQGjdxDjP/vCJnRdvCoyhZTyYyF9SnZyLUSnHIKbE
	 u1eMGH2Zn4FCkx04xo76rQXA+Lb6D4A7TiDMeAGe9TnurLtRjnacSiP/GB5OLHGOIl
	 Vhi+tEkZjy8W9VEvJf8b0a0SU8MZxW9xeiR3Fc6ySWDPzaMNUai9AjYIhpg1xtarl5
	 Piwx1XTt7j9AFoaotfbbZDt7F/ioxip9Dj7DaLJnfIGjIWsymiZ+GEPOnDq/Yal8my
	 yMDAlsLo2uSBZ2geXJuzGJXLT8UYckJFIxdI+ftImiHJ798wgJNCpuZErh0w/QqHA3
	 UxFC5IkpFZyLg==
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ab8e2c85d7so54436341cf.2
        for <linux-riscv@lists.infradead.org>; Sun, 20 Jul 2025 13:37:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwyXkrG7xWmB38xKWZCFnrdGvK2873sqOWUtis/fXuFn6WXeymWHhQ3NpyxHnJFwy2mHhW5qxIYIGF2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdFunsnq9FSU7/wJfLXJGklBu15AHRKWfwqMKlfVEvttpCYcTS
	5IMnN87Atp5QCHYQEf0lNqidBODVfb4JX552lDHl7T1GBZ2B3HgyBDW8qiaRiOybQXqZJjMrKAR
	aHJka1nyIq23Pvlp818jBfrHuHz3Rshc=
X-Google-Smtp-Source: AGHT+IGdGLwSGpb2nnTN7bsf+wE9IWEjiLxVEzfUAxu8au/YyN6jHDmhSzxg/RZdpGgWflj8cAZ/bbexCqbq2qiRqVE=
X-Received: by 2002:ad4:5b87:0:b0:705:15a6:3eef with SMTP id
 6a1803df08f44-70515a642bfmr132901766d6.47.1753043872933; Sun, 20 Jul 2025
 13:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
In-Reply-To: <20250719091730.2660197-1-pulehui@huaweicloud.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Sun, 20 Jul 2025 22:37:41 +0200
X-Gmail-Original-Message-ID: <CAJ+HfNi-u0aYggUAUS5vc6=6gPjaQ-8fwRfK2peMqjJh+m+ZzA@mail.gmail.com>
X-Gm-Features: Ac12FXyero4-XOs_Gw2Llu9WOI3GJUY3SRh4iDZu0EfaOdRGg2H-wC76MfapgaE
Message-ID: <CAJ+HfNi-u0aYggUAUS5vc6=6gPjaQ-8fwRfK2peMqjJh+m+ZzA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 00/10] Add support arena atomics for RV64
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Pu Lehui <pulehui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_133756_112930_954D2994 
X-CRM114-Status: UNSURE (   8.89  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

TGVodWkhCgpPbiBTYXQsIDE5IEp1bCAyMDI1IGF0IDExOjE0LCBQdSBMZWh1aSA8cHVsZWh1aUBo
dWF3ZWljbG91ZC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2Vp
LmNvbT4KPgo+IHBhdGNoIDEtMyByZWZhY3RvciByZWR1bmRhbnQgbG9hZCBhbmQgc3RvcmUgb3Bl
cmF0aW9ucy4KPiBwYXRjaCA0LTcgYWRkIFphY2FzIGluc3RydWN0aW9ucyBmb3IgY21weGNoZy4K
PiBwYXRjaCA4IG9wdGltaXplcyBleGNlcHRpb24gdGFibGUgaGFuZGxpbmcuCj4gcGF0Y2ggOS0x
MCBhZGQgc3VwcG9ydCBhcmVuYSBhdG9taWNzIGZvciBSVjY0Lgo+Cj4gVGVzdHMgYHRlc3RfcHJv
Z3MgLXQgYXRvbWljLGFyZW5hYCBoYXZlIHBhc3NlZCBhcyBzaG93biBiZWxsb3csCj4gYXMgd2Vs
bCBhcyBgdGVzdF92ZXJpZmllcmAgYW5kIGB0ZXN0X2JwZi5rb2AgaGF2ZSBwYXNzZWQuCgpBd2Vz
b21lLCB0aGFuayB5b3UgZm9yIHdvcmtpbmcgb24gdGhpcyEKCkknbSBvbiB2YWNhdGlvbiB1bnRp
bCA0dGggQXVnLCBidXQgSSdsbCB0cnkgdG8gZG8gYSByZXZpZXcgYmVmb3JlIHRoYXQKLS0gYnV0
IGV4cGVjdCBzb21lIHNsb3duZXNzIQoKClRoYW5rcywKQmrDtnJuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
