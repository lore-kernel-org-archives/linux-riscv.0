Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E80ED6A224
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 18:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUGGKE1rTkihQVC9HsQNEQXe6EXVTbz5/Zh5RQlz3TI=; b=j3mkdhASG3TEt5
	6ZkP6gxJ2i77k5a+FPDejdD6VC+IWm/QjppcukxajwHu/J36qCBfBgEusfzenMpv53GDszhelfolr
	XAJRB2kx1K0j1K8vJ2zKV393y0u9qq+FqztuhYUV8HyzD6dLCLGz98lIfKSUSG7FMoUPwVp8rJX3c
	tCKiQrjigGtsdrnZTW5ghbEbXK8I7B8NUK3Krd3c68s96u77r1GB1r7v9FX2CN6MW7lxj/+h3/TPS
	ObpVn+P85J96wzL978InxyfOeSlfG4niYWd5gSsNW0y3qPzqn6yZo+H5vqZcX+sukKw/qhlMStUIJ
	TFyo1HAwIX8kQJ+APbVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBede-00000000UcG-1WR5;
	Thu, 14 Nov 2024 18:32:18 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBecf-00000000UNf-2n9P
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 18:31:18 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3a745f61654so10905ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 10:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731609075; x=1732213875; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPgttRKqIwbel5Escl1oq0suAUqJ6hGmn2l42WFD7Wk=;
        b=G+S11FxEz6VR8n7TvTn9KNUV/XsYXMTF7F0KT2PFF8MPwSTYkTLFgx/q3bCrnrk7a5
         RJDHQDSCkHTrNTh+4ZgFMxkRxh5+CNm7PDVxyjxn5bZAbOURQUQb7qAnuQlVrOzq7flf
         DOvd4u4YKsYGkgkfvTfRhn97C6Mn4TblZrmTDddQf/7y0xknIwpKnwZj2fL8hibQAm74
         kGiaqRnwbBpoUU6lIN3CZ4FfgQTJexTNSbKyqfq7pZWA08Veev5ZcbrZVaYFJ83cHfHU
         hxDkbYIMNb89a6XviZCi9VxAc9eF2Ai6GH8yqo3fB+WmmIVHi7P6p7idQ7pDV3twGMKD
         Q8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731609075; x=1732213875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPgttRKqIwbel5Escl1oq0suAUqJ6hGmn2l42WFD7Wk=;
        b=tWGfzuX/3MnnLAi/vMQrP2IMbCRwTi6hSqjb5ux0Sdj5AFlVncTKTq508nAB4cjv4S
         Um5ZITLWmm25KVekqokFTwnlGqvU3hbeDjTPZETgkODiaPbtLdj+0iZiiIN1fPHsotCg
         VKlF/bce0q5u+Ts4IWBxqbNyo7YZbL+CBwH3LdXzBLPtJiuQudR3albfkPp80ghR8qWa
         YdiaMVp8G19fJYc4Ytrm0hameb6mB3tjC8kcuKkD7gzRM9lU9CIVecI+8KaVnHZbIoS0
         oG35IRf+CLXuSpy3uTUCW1o7H3Esen1Sfa/FnQ/tL9LnCSGbjE+Wa2xFUZMf5O6HZikt
         qtvw==
X-Forwarded-Encrypted: i=1; AJvYcCVUJ7BiGsdvtDFfXdegYdzy7lS61s64tl4TwnVahoIgUzOwNTM1ZyipL/7IwLQouY1a0zEPFYNEcy6ITg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9yKHRmm/KRsGdLHS5Idz9juX3VqXsb17HluaALvprX/zUfxC3
	vdrJsZa82JgGFhU8ZQxkojw56uc8WKipLAfouJn+J9sJr5ALykWBZFBd2gzVpFl0uh9tOq34j0g
	zDZD48w2FT8L4H1J+9uE2nhef5y7fNL7zouJu
X-Gm-Gg: ASbGncvRqcFzxsjUcZ3ZBnDvAtkqhcPTL6xv6HhP5XLIcxF1juahhCl6rYKyK+8WnhC
	1xHrfmJRaGHgzr3iL6LWNXmIzU9i1eC6K3Fdlsib8GT3AGiUtdtqre0wCMHMAFaA=
X-Google-Smtp-Source: AGHT+IHbt2clAsvEm2GCWE3HZL8c9XYanWoYZmP6qTNs/eamsLOQaZgatLIMPvRuQ3+hmYVnmRaUTEoaA8PTfGw6NT4=
X-Received: by 2002:a05:6e02:1a4e:b0:3a6:af68:668a with SMTP id
 e9e14a558f8ab-3a71e7a2d67mr5483705ab.18.1731609075190; Thu, 14 Nov 2024
 10:31:15 -0800 (PST)
MIME-Version: 1.0
References: <20241107162035.52206-1-irogers@google.com> <20241108025535.wfhke3btch5af4fu@hippo>
In-Reply-To: <20241108025535.wfhke3btch5af4fu@hippo>
From: Ian Rogers <irogers@google.com>
Date: Thu, 14 Nov 2024 10:31:04 -0800
Message-ID: <CAP-5=fW=RXz-A=xndhs8wkXaKCz-qXB=PemAMvbZpUagvObUoA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Refactor cpuid and metric table lookup code
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, 
	Bibo Mao <maobibo@loongson.cn>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Ben Zong-You Xie <ben717@andestech.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Sandipan Das <sandipan.das@amd.com>, Benjamin Gray <bgray@linux.ibm.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Dima Kogan <dima@secretsauce.net>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_103117_696640_0E108C03 
X-CRM114-Status: GOOD (  13.25  )
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

T24gVGh1LCBOb3YgNywgMjAyNCBhdCA2OjU34oCvUE0gWHUgWWFuZyA8eHUueWFuZ18yQG54cC5j
b20+IHdyb3RlOgo+Cj4gT24gVGh1LCBOb3YgMDcsIDIwMjQgYXQgMDg6MjA6MjdBTSAtMDgwMCwg
SWFuIFJvZ2VycyB3cm90ZToKPiA+IFh1IFlhbmcgPHh1LnlhbmdfMkBueHAuY29tPiByZXBvcnRl
ZCBpc3N1ZXMgd2l0aCB0aGUgc3lzdGVtIG1ldHJpYwo+ID4gbG9va3VwOgo+ID4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcGVyZi11c2Vycy8yMDI0MTEwNjA4NTQ0MS4zOTQ1NTAyLTEt
eHUueWFuZ18yQG54cC5jb20vCj4gPiBUaGVzZSBwYXRjaGVzIHJlbW92ZSBhIGxvdCBvZiB0aGUg
bG9naWMgcmVsYXRpbmcgQ1BVSURzIHRvIFBNVXMgc28KPiA+IHRoYXQgdGhlIFBNVSBpc24ndCBw
YXJ0IG9mIHRoZSBxdWVzdGlvbiB3aGVuIGZpbmRpbmcgYSBtZXRyaWMgdGFibGUuCj4gPiBGb3Ig
dGltZSByZWFzb25zLCBpdCBkb2Vzbid0IGdvIGFzIGZhciBhcyBhbGxvd2luZyBzeXN0ZW0gbWV0
cmljcwo+ID4gd2l0aG91dCBhIG1ldHJpYyB0YWJsZSBhcyBhIG1ldHJpYyB0YWJsZSBpcyBuZWVk
ZWQgZm9yIG1ldHJpY3MgdG8KPiA+IHJlZmVyIHRvIG90aGVyIG1ldHJpY3MsIGFuZCB0aGUgcmVm
YWN0b3Jpbmcgb2YgdGhhdCByZXNvbHV0aW9uIGlzIGEKPiA+IGhhc3NsZS4KPgo+IEZvciB0aGlz
IHBhdGNoc2V0Ogo+IFRlc3RlZC1ieTogWHUgWWFuZyA8eHUueWFuZ18yQG54cC5jb20+CgpQaW5n
LiBXb3VsZCBiZSBuaWNlIGZvciB0aGlzIHRvIGxhbmQgZ2l2ZW4gdGhlIEFSTSBmaXggYW5kIGdl
bmVyYWwgY2xlYW51cC4KClRoYW5rcywKSWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
