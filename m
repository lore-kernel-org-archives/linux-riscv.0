Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ADCC54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 01:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p8++vNZ+Z51mmrkuOQAIp2mFpF6F/icy2FUFMeZxbvU=; b=CvTR5VCZXBiTkl
	Xn14w9d35a5TgrkMKvMurKDfG/t/OzWuvqQeqqQ5y5+evNSYcQEFXuG4qGVn4ACsa+79KLGF9CwIk
	Z5Wc9ROKzRqLKNYco+cZ/hIUb+hK/q7cgs8mgWkpoN/J9eltURyuTWK+K3MwSQ8RPtYY7aJeeO3IC
	seDEBYh05eRlyDdyoM+wYPqdG04D3pPbk33Rp84ihLDvhHKzvW6z0bQB7btSioZb/KvsJ+tLVE7r6
	JYIHV3V/HfPNl5XNYG/TCnozg9naC3/W/8WdZ2IcJsWreuR+BrbNhdSn+mEEfDPdFCwBGu9QwiSDM
	TbYwlkDhUwsiM9plSdgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrNb-00000003uDU-47uW;
	Tue, 12 Mar 2024 01:56:35 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrNY-00000003uBx-0t2c;
	Tue, 12 Mar 2024 01:56:33 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-33e796cc90dso3289746f8f.1;
        Mon, 11 Mar 2024 18:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710208590; x=1710813390; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EfRRhmqpYXn/+hf3x4Zj15gOPBE5rQPEx7SCKgl1o/o=;
        b=TU2+KTBykln4dmMVzR+ToK09KV1sUV16CJc52DnvNEdM1xH1YmyuS6wgpm7LFt5qgQ
         9HqIZgjyyOXFVAl0YbrzbQJHfQoodmupTWwP1zYFRXragtb0lsgmaL5G/EDqjMV6TTha
         vgTb2nXCBj6P442yTZ2L1jZi0arMri0deM3YehHaNmgLAexxRfpNcPr6Bmktr/VySXhv
         qjHgWNwFBJuK6oCrO1bh+3DVfwEszSPljwYubL4EjShHgwS8Q2aZL9xlMUx3sYniZkLB
         2QMu6jxpq6utqlEa8cUk/kQBj/jpyjclijUXBEj2K5WyZtkBt9E8t16+7oCkAfQbX4UN
         OmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710208590; x=1710813390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EfRRhmqpYXn/+hf3x4Zj15gOPBE5rQPEx7SCKgl1o/o=;
        b=od1tDzhBnI6BOHyYM5fVT2GBr6Su94+YYvXVByQq/3Sf0Iz06yzHf5Txo19jl1wbaZ
         amTSIDOPQ3/jnyZEnKXIt+Nceh9Dh84ygy+XaSf8yIks81yGT4+ZNlYAV1T5Ry8hjwuS
         u5D7hYhKPI2X1/RF2UCT7mWExNubkfBbTcdVIpFnAJw/mtA3+8CdQVUB2bfMlVSOg5OH
         OiPVt2WSngq5h0PMfgYOLcAVdueLJsz5vzqtsp+Uk882rEsQZ3kwkusRo4iou3l+CdYE
         w3k8Q+n/j+gs+WocPqM5lGVSzXA85FLfbpDpV2DfxVsoxhPYUHo3DRjt7k0ywZdrJaiH
         bwuA==
X-Forwarded-Encrypted: i=1; AJvYcCVxJsoBLGvxHD6pZ5iJb6h4UMGzuahYbu3O/C9hZ0rhQq7ufGaYzZWDOwPN/0cz90SJXynYC9RWs8jFmWI/uLhp9444QOZdE0Rz+PC83UbwOUCC3nhaZ/inPBDJ102LaKwjYJuBc7souJvLwa4pMxQJRchfQMo=
X-Gm-Message-State: AOJu0Yz9wl11Ijf6f7LW4inrSdf/QP4xnW+Jj7Ds6UPzmJmDjjrFnR+g
	OaF2eJnzql7MCbx/SSDF6V+dmDc91c8kf48UtJMRUxoJPAEphXFRjWVsRyQfHEc91VYUv3g6k/t
	6lRwJQNogQ8Qv0kZWI1HsI7BY6zQ=
X-Google-Smtp-Source: AGHT+IG7xsAdm+wS5oFq5b1jjL8oBRBQgSVipKjCrWRkHMT37wKqdMMIKRlqjVh9M9fPohkxT6A/kQN+ZA/9RtegLYA=
X-Received: by 2002:a5d:498f:0:b0:33e:fd3:8f4e with SMTP id
 r15-20020a5d498f000000b0033e0fd38f4emr5186878wrq.14.1710208589943; Mon, 11
 Mar 2024 18:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com> <20240311093526.1010158-9-dongmenglong.8@bytedance.com>
In-Reply-To: <20240311093526.1010158-9-dongmenglong.8@bytedance.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 11 Mar 2024 18:56:18 -0700
Message-ID: <CAADnVQK+s3XgSYhpSdh7_9Qhq4DimmSO-D9d5+EsSZQMX4TxxA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 8/9] libbpf: add support for the multi-link of tracing
To: Menglong Dong <dongmenglong.8@bytedance.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	X86 ML <x86@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Quentin Monnet <quentin@isovalent.com>, 
	bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_185632_389997_D27D0F61 
X-CRM114-Status: GOOD (  10.82  )
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

T24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgMjozNeKAr0FNIE1lbmdsb25nIERvbmcKPGRvbmdtZW5n
bG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4KPiAtICAgICAgICAgICAgICAgZXJyID0g
bGliYnBmX2ZpbmRfYXR0YWNoX2J0Zl9pZChwcm9nLCBhdHRhY2hfbmFtZSwgJmJ0Zl9vYmpfZmQs
ICZidGZfdHlwZV9pZCk7Cj4gKyAgICAgICAgICAgICAgIG5hbWVfZW5kID0gc3RyY2hyKGF0dGFj
aF9uYW1lLCAnLCcpOwo+ICsgICAgICAgICAgICAgICAvKiBmb3IgbXVsdGktbGluayB0cmFjaW5n
LCB1c2UgdGhlIGZpcnN0IHRhcmdldCBzeW1ib2wgZHVyaW5nCj4gKyAgICAgICAgICAgICAgICAq
IGxvYWRpbmcuCj4gKyAgICAgICAgICAgICAgICAqLwo+ICsgICAgICAgICAgICAgICBpZiAoKGRl
ZiAmIFNFQ19BVFRBQ0hfQlRGX01VTFRJKSAmJiBuYW1lX2VuZCkgewo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGludCBsZW4gPSBuYW1lX2VuZCAtIGF0dGFjaF9uYW1lICsgMTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICBjaGFyICpmaXJzdF90Z3Q7Cj4gKwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGZpcnN0X3RndCA9IG1hbGxvYyhsZW4pOwo+ICsgICAgICAgICAgICAgICAgICAgICAg
IGlmICghZmlyc3RfdGd0KQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FTk9NRU07Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3RybmNweShmaXJzdF90Z3QsIGF0
dGFjaF9uYW1lLCBsZW4pOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGZpcnN0X3RndFtsZW4g
LSAxXSA9ICdcMCc7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gbGliYnBmX2ZpbmRf
YXR0YWNoX2J0Zl9pZChwcm9nLCBmaXJzdF90Z3QsICZidGZfb2JqX2ZkLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmJ0Zl90eXBlX2lk
KTsKPiArICAgICAgICAgICAgICAgICAgICAgICBmcmVlKGZpcnN0X3RndCk7Cj4gKyAgICAgICAg
ICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gbGliYnBmX2Zp
bmRfYXR0YWNoX2J0Zl9pZChwcm9nLCBhdHRhY2hfbmFtZSwgJmJ0Zl9vYmpfZmQsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYnRmX3R5
cGVfaWQpOwo+ICsgICAgICAgICAgICAgICB9CgpQbHMgdXNlIGdsb2JfbWF0Y2ggdGhlIHdheSBb
a3VdcHJvYmUgbXVsdGkgYXJlIGRvaW5nCmluc3RlYWQgb2YgZXhhY3QgbWF0Y2guCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
