Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208D4C43602
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 06:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTRsj1g1OIW+RsF+vNudYtqsXx/9z70GOEZ2JT6klAw=; b=M1oLuCCnMXveYP
	L1eUJb/fYg80lhU/jbgdhPV4I6GhS5eigbKpt44CO7jtd1n3O6qUF+0QzFe4BTPo8tRLa21eoRMRy
	pDvkyiyZxce3ODolpw57GrjvIDPULtvmyWiM3s/zNqwAC2C6KKJ/FbtEsfGjeyTM0aQTrMjVPqbwq
	GgNrceaXk2vMO3Pf5FXiNbAvz0cnHq8pWhn9tRVONRTRBFv/MaNB9j2okMS486oibS7gFwBmNt1ZT
	0z5yBDo8oxFZ97cdflGnOrkrR5AwSHdQ8yPG+t9WjBPuPAbMVtewR8m8z16Y5zJPjxTfBwMdsP6mq
	JLjfnjIEdxV9XIKSoDbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgyyt-0000000EAeA-1oLA;
	Tue, 07 Jul 2026 06:08:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgyyr-0000000EAdu-3FDH
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 06:08:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED94261897
	for <linux-riscv@lists.infradead.org>; Tue,  7 Jul 2026 06:08:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67BF1F000E9
	for <linux-riscv@lists.infradead.org>; Tue,  7 Jul 2026 06:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783404508;
	bh=S1aeP97yylgk0q1gm2EoL15Tj+ZSUMdIt7IJmejCISE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=amuusODhUNcpG+aNvo/8nf2PMqoRUdfTxVAKMCJcggdvo2WzppXXp3eYeEY9PeiN4
	 RS+OMp+b994AAy1lqQby6ZeuINcBslTbiP38sVA4mrdQzfPEJ1wmd+An3EnY+fbJtD
	 3GjlabhSM4eZu/4Z1ruyCIsbFsQCWaVeJMsHb2RjqNjHxcAJPafzEmoTKBZj9w2ebO
	 xOVS+yeWYt37gsFuwvTE9Cx+k77hd1NRY8ZCRkqk1FIgupEaAQL6MMMx3OBVuAujJm
	 xexojw9+QQ6ErqjG0kmcHi1m3o+M2M443qd/vnqIGLkc1hqrCNlw+U/c7sTw1YGox5
	 4aBwW86T+6Rag==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8143daf89c7so35558297b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 23:08:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrNtLIuFizdrftlSMxTlzD+zRhmVdjQSQ8KfKejjtdil/BO5U4e+XmAD97/hoqh6EhHeSdmFUkLqP8H2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YziDyNatz9FMI2QPCuLwtuTe+Nc2caeeVk2jcHDLNkG6gddzyVC
	f9ggvFXkIB78Gqhfh/2ig3zdFghHCU6znnV4cKaWKq9zPJn1hZdtlYPRw6ybm5TZZ0GvIRNMR1T
	EiVkvgOpLuSANI0YZz+OFnPPrywbWLZ4=
X-Received: by 2002:a05:690c:c452:b0:7f8:7e11:d023 with SMTP id
 00721157ae682-81be2d7a098mr27493797b3.49.1783404508016; Mon, 06 Jul 2026
 23:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260629140048.733346-1-pulehui@huaweicloud.com>
 <CAJ+HfNhn9eK+3xsd3ewEsG-duCgBeYXeLAtNan=qefas2Ya0dQ@mail.gmail.com>
 <d6647f5eb213d2ece82753285a79f28f600420d7.camel@gmail.com> <b4ca552c-58b6-49dd-bd83-dc27ca49368a@huaweicloud.com>
In-Reply-To: <b4ca552c-58b6-49dd-bd83-dc27ca49368a@huaweicloud.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Tue, 7 Jul 2026 08:08:15 +0200
X-Gmail-Original-Message-ID: <CAJ+HfNiHMzcB6BsW3gER1-2X9EgSDnjzJ4r=ijQuPvKHx2U_FQ@mail.gmail.com>
X-Gm-Features: AVVi8CeF4tOKsvACopP39T59swPHySqB9E_OsWFganTcvFVBHkNmkbvFlwPOfA8
Message-ID: <CAJ+HfNiHMzcB6BsW3gER1-2X9EgSDnjzJ4r=ijQuPvKHx2U_FQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 0/6] Mixing bpf2bpf and tailcalls for RV64
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: Eduard Zingerman <eddyz87@gmail.com>, bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Pu Lehui <pulehui@huawei.com>
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

SGV5IQoKT24gVHVlLCA3IEp1bCAyMDI2IGF0IDAzOjMxLCBQdSBMZWh1aSA8cHVsZWh1aUBodWF3
ZWljbG91ZC5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDIwMjYvNy83IDM6MjksIEVkdWFyZCBaaW5n
ZXJtYW4gd3JvdGU6Cj4gPiBPbiBNb24sIDIwMjYtMDYtMjkgYXQgMTY6MjEgKzAyMDAsIEJqw7Zy
biBUw7ZwZWwgd3JvdGU6Cj4gPgo+ID4gSGkgQmrDtnJuLAo+ID4KPiA+IEknbSB3b3JraW5nIHRo
cm91Z2ggYnBmIHBhdGNoZXMgcXVldWUgYW5kIGhhdmUgYSBxdWVzdGlvbiByZWdhcmRpbmcKPiA+
IHRoaXMgc2VyaWVzLiBXaGF0J3MgeW91ciBzdGFuY2UsIGRvZXMgaXQgbmVlZCBjaGFuZ2VzIG9y
IGNhbiBJIGFwcGx5Cj4gPiBpdCB0byBicGYtbmV4dD8KPgo+IEhpIEVkdWFyZCwKPgo+IEkgbmVl
ZCB0byBzZW5kIG91dCBhIG5ldyB2ZXJzaW9uIHRvIGFkZHJlc3MgdGhlIGlzc3VlIHNhc2hpa28g
bWVudGlvbmVkLgo+IEl0J3MgYWxyZWFkeSBmaXhlZCBsb2NhbGx5LCBhbmQgSSdsbCBzZW5kIGl0
IG91dCBhZnRlciBCasO2cm4ncyByZXZpZXcKPiBmZWVkYmFjay4KCkkgaGFkIGEgbG9vayBhdCB0
aGUgc2VyaWVzLiBJIGhhdmUgbm90aGluZyB0byBhZGQsIG90aGVyIHRoYW4gd2hhdApTYXNoaWtv
IGhhZCwgUGxlYXNlIHNlbmQgb3V0IHRoZSBuZXh0IHZlcnNpb24hCgpOaWNlIHdvcmshCgoKQmrD
tnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
