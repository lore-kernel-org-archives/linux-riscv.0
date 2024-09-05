Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E813CD4F4A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 00:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hLvRgvu8xESg0Hem9hysSM5N1Hy1Q6W/23hZEnWahWE=; b=FpU/vvt1i7UNV0
	Zf8/jjFWaXo5cZVKr+kQzymi/pe/zcK87D+Z24lzmkm+P6mmYvaPQTnI6RCTYrqG9ITLHTGDr7AfD
	xxUMKr4afaSMnTf7terGQNNUU5ICl5lCmO76XWJXcH/d7E6paew4fssNAh0OWn92RmQpycOinAsPl
	ib89eCD03EM7gK2HoNpPJXPanou7TN3flxDFmfFNMOJJQzIwn07Y0NSiVWne1Uw6jGcBRviyP2Q4h
	LNGCYaIH3CYcopj1orrh4oDZaKPz4/9ITLfFq0ftMTL8jVvzwV2FOcM+OW6a+7AHV3uGd9w/7n0WV
	xLxeHlecLJgTz9fv0U4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzyR-00000006RY5-2qbe;
	Thu, 05 Sep 2024 00:03:43 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzyO-00000006RXi-0jM6
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 00:03:41 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2d8f06c2459so116488a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2024 17:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725494619; x=1726099419; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Pp5XlYCZbKVyNu+taRdigNsqhXnKoDENO/bwZGJUkU=;
        b=Qoo+3IwI+9bBpWmk2zScKeVBykoRzKQj83u2N1lKjZ24i5NMGhpTUM8nFGSnu+dFQE
         ZMa2AoxGUjgewPX90YD8xdfsyHqgqhbBhXh/TFh7GiMQ3QTRho2XyRJPsi7L3N2Viacs
         5P73my+sMJaiHdCikKrSPUfsLT1ZhCzcYrCIFoThX1FUPpDWbKKJ0gCljbwgYgU+Fdne
         ZR13xS8d+oSIDB1ygEMkVeS1i5Sw7WqbtPh4K5BQ7O7bg4k2bYy1WDwSB0P4h8on+/Sh
         G6nESpn2fFt93huMb9mrVLEYfJ6pDLHpkujkRAmdg8PDyLMq7JNouYdr0baH0oYXXXK7
         iwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725494619; x=1726099419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Pp5XlYCZbKVyNu+taRdigNsqhXnKoDENO/bwZGJUkU=;
        b=Ak+xl5flQ8IzFwMgp9OYasj0cqOK8RORkHVULo2Q8ueZidPStVWieFi+aby7gkWf30
         MRfbQzkgyTaqaGd0/yNla5jJUcOhz7py3d5wVGv911YfLDloWI2p4WJFdGTTTV+6idr/
         OuKJ031aWMqL5vo4nagoBE6WKtZ19XOJva7Xq89Rpy/lZKNymGWGwcXFBz3QiwYiPs8R
         PWCyG3ErGI4n+xdXN14q05tUyGmOuMZyXEmTgiyV+PTU4KkS51DKF3uZrbsZqahkUrQ7
         ta/x7O89MVu7SLchAiNdqUtXpE+WqRvh3l/XEpBGlviQab0NfHJIGJ7w1rEvs8cIHhRi
         /FAg==
X-Forwarded-Encrypted: i=1; AJvYcCU5zvCBBHqTJlpkBh6CkSljDjC0QeyBLkqcNFRhmU2pAwN8xaAiGQHFzeUT/C9e9uf0QjXZPwJKK1dq4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrxY0S7B2qGzENkcSXLhe6kwPmvxOgXD+rfrO03Kph9Qa9MUBc
	wlnJParEfi3ZpoQXtbj4Ram6Ts5O9WfKSDVPD7FeLUE02lA+k8lH/ulNvUs/xNk5zZ8I1d5YqeE
	hUkvjPLLr/BcrVGpnjcMKmET8oEA=
X-Google-Smtp-Source: AGHT+IFBpYTti429OSnNnQQ+QN6FQO6CvlS7tcnhLxLRhP/UPmJKgFeYjE++SyoFnDaw1HzAKVP4OrSpsTvrVJ1N8JM=
X-Received: by 2002:a17:90a:e2c3:b0:2d8:9a0c:36c0 with SMTP id
 98e67ed59e1d1-2da55924370mr8617709a91.8.1725494619043; Wed, 04 Sep 2024
 17:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240831041934.1629216-1-pulehui@huaweicloud.com>
 <172548183128.1158691.9881712792582282151.git-patchwork-notify@kernel.org> <CAEf4BzayV1ihbfSg4fv0AqSazVycXqCJp4dTq1pwRt5hmx7X4g@mail.gmail.com>
In-Reply-To: <CAEf4BzayV1ihbfSg4fv0AqSazVycXqCJp4dTq1pwRt5hmx7X4g@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 4 Sep 2024 17:03:26 -0700
Message-ID: <CAEf4Bza5i+MFqeOs8w+Zhw4e6vt7KMgVwjNaEOTz33P8T6Ldsg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/4] Fix accessing first syscall argument on RV64
To: patchwork-bot+netdevbpf@kernel.org
Cc: Pu Lehui <pulehui@huaweicloud.com>, bpf <bpf@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Networking <netdev@vger.kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, john fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Pu Lehui <pulehui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_170340_273033_AF0248C2 
X-CRM114-Status: GOOD (  20.93  )
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

T24gV2VkLCBTZXAgNCwgMjAyNCBhdCAzOjQ04oCvUE0gQW5kcmlpIE5ha3J5aWtvCjxhbmRyaWku
bmFrcnlpa29AZ21haWwuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiBXZWQsIFNlcCA0LCAyMDI0IGF0
IDE6MzDigK9QTSA8cGF0Y2h3b3JrLWJvdCtuZXRkZXZicGZAa2VybmVsLm9yZz4gd3JvdGU6Cj4g
Pgo+ID4gSGVsbG86Cj4gPgo+ID4gVGhpcyBzZXJpZXMgd2FzIGFwcGxpZWQgdG8gYnBmL2JwZi1u
ZXh0LmdpdCAobWFzdGVyKQo+ID4gYnkgQW5kcmlpIE5ha3J5aWtvIDxhbmRyaWlAa2VybmVsLm9y
Zz46Cj4gPgo+ID4gT24gU2F0LCAzMSBBdWcgMjAyNCAwNDoxOTozMCArMDAwMCB5b3Ugd3JvdGU6
Cj4gPiA+IE9uIFJWNjQsIGFzIElseWEgbWVudGlvbmVkIGJlZm9yZSBbMF0sIHRoZSBmaXJzdCBz
eXNjYWxsIHBhcmFtZXRlciBzaG91bGQgYmUKPiA+ID4gYWNjZXNzZWQgdGhyb3VnaCBvcmlnX2Ew
IChzZWUgYXJjaC9yaXNjdjY0L2luY2x1ZGUvYXNtL3N5c2NhbGwuaCksCj4gPiA+IG90aGVyd2lz
ZSBpdCB3aWxsIGNhdXNlIHNlbGZ0ZXN0cyBsaWtlIGJwZl9zeXNjYWxsX21hY3JvLCB2bWxpbnV4
LAo+ID4gPiB0ZXN0X2xzbSwgZXRjLiB0byBmYWlsIG9uIFJWNjQuCj4gPiA+Cj4gPiA+IExpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi8yMDIyMDIwOTAyMTc0NS4yMjE1NDUyLTEtaWlp
QGxpbnV4LmlibS5jb20gWzBdCj4gPiA+Cj4gPiA+IFsuLi5dCj4gPgo+ID4gSGVyZSBpcyB0aGUg
c3VtbWFyeSB3aXRoIGxpbmtzOgo+ID4gICAtIFticGYtbmV4dCx2MywxLzRdIGxpYmJwZjogQWNj
ZXNzIGZpcnN0IHN5c2NhbGwgYXJndW1lbnQgd2l0aCBDTy1SRSBkaXJlY3QgcmVhZCBvbiBzMzkw
Cj4gPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9icGYvYnBmLW5leHQvYy82NWVlMTFkOWM4
MjIKPiA+ICAgLSBbYnBmLW5leHQsdjMsMi80XSBsaWJicGY6IEFjY2VzcyBmaXJzdCBzeXNjYWxs
IGFyZ3VtZW50IHdpdGggQ08tUkUgZGlyZWN0IHJlYWQgb24gYXJtNjQKPiA+ICAgICBodHRwczov
L2dpdC5rZXJuZWwub3JnL2JwZi9icGYtbmV4dC9jL2ViZDhhZDQ3NDg4OAo+ID4gICAtIFticGYt
bmV4dCx2MywzLzRdIHNlbGZ0ZXN0cy9icGY6IEVuYWJsZSB0ZXN0X2JwZl9zeXNjYWxsX21hY3Jv
OnN5c2NhbGxfYXJnMSBvbiBzMzkwIGFuZCBhcm02NAo+ID4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvYnBmL2JwZi1uZXh0L2MvM2E5MTNjNGQ2MmUxCj4gPiAgIC0gW2JwZi1uZXh0LHYzLDQv
NF0gbGliYnBmOiBGaXggYWNjZXNzaW5nIGZpcnN0IHN5c2NhbGwgYXJndW1lbnQgb24gUlY2NAo+
ID4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvYnBmL2JwZi1uZXh0L2MvMTMxNDNjNTgxNmJj
Cj4gPgo+Cj4gT2ssIEkgaGFkIHRvICJ1bmFwcGx5IiB0aGVzZSBwYXRjaGVzLCBhcyBzMzkweCBz
ZWxmdGVzdCAoYnBmX3N5c2NhbGxfbWFjcm8pIHN0YXJ0ZWQgZmFpbGluZyAoYXJtNjQgaXMgZmlu
ZSwgc28gSSB0aGluayBpdCdzIHByb2JhYmx5IGR1ZSB0byBwYXRjaCAjMyB0aGF0IGNoYW5nZXMg
c2VsZnRlc3RzIGl0c2VsZikuCj4KPiBQdSwgY2FuIHlvdSBwbGVhc2UgdGFrZSBhIGxvb2sgYXQg
dGhhdCAoZS5nLiwgc2VlIFswXSk/IEl0J3MgYSBiaXQgc3RyYW5nZSwgYXMgb3JpZ2luYWxseSBu
byBlcnJvciB3YXMgcmVwb3J0ZWQsIHNvIG5vdCBzdXJlIHdoYXQgY2hhbmdlZC4gUGxlYXNlIGFs
c28gc2VlIHRoZSB0aGluZ3MgSSB3YXMgZml4aW5nIHVwIHdoaWxlIGFwcGx5aW5nLCBzbyBJIGRv
bid0IGhhdmUgdG8gZG8gaXQgYWdhaW4gOikKPgo+ICAgWzBdIGh0dHBzOi8vZ2l0aHViLmNvbS9r
ZXJuZWwtcGF0Y2hlcy9icGYvYWN0aW9ucy9ydW5zLzEwNzA5MDI0NzU1L2pvYi8yOTY5MzA1NjU1
MCNzdGVwOjU6ODc0NgoKT2gsIEkgZmlndXJlZCBpdCBvdXQhIFRoYXQgdG1wIGlzIHRoZXJlIGZv
ciBhIHJlYXNvbiEgV2UKYnBmX3Byb2JlX3JlYWRfa2VybmVsKCkgOCBieXRlcywgYnV0IHN5c2Nh
bGwncyAxc3QgYXJndW1lbnQgaXRzZWxmIGlzCjQgYnl0ZSBsb25nLCBzbyB3ZSBuZWVkIHRvIGNh
c3QgdTY0IHRvIHUzMi4gQW5kIHMzOTB4IGJlaW5nIHRoZSBiaWcKZW5kaWFuIGFyY2hpdGVjdHVy
ZSBkZXRlY3RlZCB0aGlzIHByb2JsZW0sIHdoaWxlIGZvciBhcm02NCB3ZSB3ZXJlCmx1Y2t5LgoK
U28gbmV2ZXIgbWluZCwgSSdsbCBhcHBseSB5b3VyIHBhdGNoZXMgd2l0aCBmaXggdXBzIGluIHRo
ZQpicGZfdHJhY2luZy5oIGhlYWRlciwgYnV0IEkgd29uJ3QgdG91Y2ggcGF0Y2ggIzMuCgo+Cj4g
PiBZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKPiA+IC0tCj4gPiBEZWV0LWRvb3QtZG90LCBJ
IGFtIGEgYm90Lgo+ID4gaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsvcHdi
b3QuaHRtbAo+ID4KPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
