Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFC6C5475B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 02:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fh82ph1cYnb6CpU0Sy1UccIosAYY/UYUHA2zIOstMBk=; b=H1s1TUSsUQ9gTf
	jnwSvy9zFOp5spMTMXgRfdWiaG1Ctc+kUZaoTyUs46XeZw5BZ3Dd3XeT5ellg25yq6JK8yAtBeQWI
	XJ2x+VxoPlhfrfOgycYT5IoquckwnvY10aI4NhNUv4kzCSvzMGM2znTCiijNExWTPdY/lRLS6Ix+d
	m/nAp+gadHDSBb/76qLZf2zIhgFPv4bdPy+/E5pvcaf4FkWejftmTSkdmvdMwpJCMpXZt80JZj5W6
	y6nK8t7IrjRb7tXxFARg0QQW3mD+yVTc69idsqEHxTnabALpnjvqd8oxR+YtrVeemwuC8C5ePS80R
	wewIudyJrZQlDDXE1q/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjsJg-000000044OI-20sD;
	Tue, 12 Mar 2024 02:56:36 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjsJd-000000044MT-1Nle
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 02:56:35 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-29b7b9a4908so2250018a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 19:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1710212192; x=1710816992; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8duYlw7yiLaMQiEjvPs64/nXpWh4xT1l7do/uy0Ifvk=;
        b=EykbBrcQ0kpTSHODGpgm+jn4uXccnRLUcdRuKOUCCLbk50sIGUI167nDCJ1M5kNT8A
         5Bnt20sZCL9CHEfZGqZzMa8mSrwnOn+skok8HviJuXnVW0xpfCyN3uPaTJ+GyoWTagtc
         wzMWaYUA+Vx1jz8LN3yetJjfST7v40Yq/dWd6Z1qEAoDtaxOWaYiqQ8c68/dV/BfrzkK
         QQQb1zBGXycRVYrtCCjTRrUJjHnCehROMcb71E5mAXtiXybQRyBpYJkSf96oTQmW0DvQ
         PKIkKlvjo6XFzs0mCQrV/qExHbmMDl8AwKNIviuLvOn4jiTDqWhzKGL9/RbxOd2mriyn
         6CVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710212192; x=1710816992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8duYlw7yiLaMQiEjvPs64/nXpWh4xT1l7do/uy0Ifvk=;
        b=EbbOzThyRoHJ/s3UbujFIIEtXKysCz4Sj7crFEg4n13ZeW5NEfG+BN9K9BoFO3xzl7
         imBgDbBdZ8D1ACRHPFV8j791h+csDvTHft9WlzyThibmVWxbILIRT/3kj3bGDEgB2W6v
         RHsNtcrwbh0U9/hpOwkBCT9o1wHQFt0eVgDCJzgrR7xfsYj9rgS/BRD/sxyodlTC/uqN
         r4PWQQeAEJ8POenWNS+wqzAGLccE9CcVs9KlMpb+uqsqCTWQQUIvkglH0jI4mqtv9WpD
         LA4Tu5Dcp7q2SdEI2p8IaLQtcrjCSKntCtT5rqVyjrNr/Wm80/lC1L3RWWVQ1jTJn0e4
         +fhg==
X-Forwarded-Encrypted: i=1; AJvYcCWyuGnMqnHeaYCJFQlZi7tgYBgl3SVrzOPU314OUqX1s/p0szQTQzPVCXpwpQHSk95GARO9HCeRLoPgWZxJNBpUcGKC7NVzmXk+nlkDfNZC
X-Gm-Message-State: AOJu0YzYFbUBfLezvhZVACFZJdwG0rLorWeKiTkeS8VKxs4edVe7ygim
	SYRBcLttNUyQnpWof1GoDaw822nXk5EzR6X48voICZqqom5+1SGlffYIQjEUN3hA6zegLbvSPJ4
	aAmfEJ8GA4nDS3Bs+4PQuBl1wzJ52VUjLSlbM3g==
X-Google-Smtp-Source: AGHT+IEEbNdZpfvWrZfgFQVH2ecv7uQ4oHjBsb6d+e9PBZQkR1FkO3HlcgN1IPWibJVLKEs+f74flvYnRRAAWujNw0M=
X-Received: by 2002:a17:90a:f305:b0:299:63fe:3a27 with SMTP id
 ca5-20020a17090af30500b0029963fe3a27mr5454778pjb.19.1710212192599; Mon, 11
 Mar 2024 19:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-8-dongmenglong.8@bytedance.com> <CAADnVQK4tdefa3s=sim69Sc+ztd-hHohPEDXaUNVTU-mLNYUiw@mail.gmail.com>
 <CALz3k9iabeOwHSrPb9mkfCuOebanh3+bAfi7xh3kBBN0DzHC3A@mail.gmail.com> <CAADnVQKsrLB-2bD53R4ZdzUVdx1aqkgom1rzGCGKK0M3Uc+csQ@mail.gmail.com>
In-Reply-To: <CAADnVQKsrLB-2bD53R4ZdzUVdx1aqkgom1rzGCGKK0M3Uc+csQ@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Tue, 12 Mar 2024 10:56:21 +0800
Message-ID: <CALz3k9jJtxVRmgGM4F-33m1wp=aCShnqdaX+7pZ9UmHwntFgXw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH bpf-next v2 7/9] libbpf: don't free btf if
 program of multi-link tracing existing
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
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
X-CRM114-CacheID: sfid-20240311_195633_590039_AE420383 
X-CRM114-Status: GOOD (  18.34  )
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgMTA6MTPigK9BTSBBbGV4ZWkgU3Rhcm92b2l0b3YKPGFs
ZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXIgMTEsIDIw
MjQgYXQgNzowNeKAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gPiA+Cj4gPiA+ID4gK0xJQkJQRl9BUEkgdm9pZCBicGZfb2JqZWN0X19m
cmVlX2J0ZnMoc3RydWN0IGJwZl9vYmplY3QgKm9iaik7Cj4gPiA+ID4gKwo+ID4gPgo+ID4gPiBJ
dCBzaG91bGRuJ3QgYmUgZXhwb3J0ZWQuCj4gPiA+IGxpYmJwZiBzaG91bGQgY2xlYW4gaXQgdXAg
d2hlbiBicGZfb2JqZWN0IGlzIGZyZWVkLgo+ID4KPiA+IFllcywgbGliYnBmIHdpbGwgY2xlYW4g
dXAgdGhlIGJ0ZnMgd2hlbiBicGZfb2JqZWN0IGlzIGZyZWVkIGluCj4gPiB0aGlzIGNvbW1pdC4g
QW5kIEknbSB0cnlpbmcgdG8gb2ZmZXIgYSB3YXkgdG8gZWFybHkgZnJlZSB0aGUgYnRmcwo+ID4g
YnkgdGhlIHVzZXJzIG1hbnVhbCB0byByZWR1Y2UgdGhlIG1lbW9yeSB1c2FnZS4gT3IsIHRoZQo+
ID4gYnRmcyB0aGF0IHdlIG9wZW5lZCB3aWxsIGtlZXAgZXhpc3RpbmcgdW50aWwgd2UgY2xvc2Ug
dGhlCj4gPiBicGZfb2JqZWN0Lgo+ID4KPiA+IFRoaXMgaXMgb3B0aW9uYWwsIEkgY2FuIHJlbW92
ZSBpdCBpZiB5b3UgcHJlZmVyLgo+Cj4gTGV0J3Mgbm90IGV4dGVuZCBsaWJicGYgYXBpIHVubGVz
cyB3ZSByZWFsbHkgbmVlZCB0by4KPiBicGZfcHJvZ3JhbV9fYXR0YWNoX3RyYWNlX211bHRpX29w
dHMoKSBhbmQKPiAqc2tlbCpfX2F0dGFjaCgpIGNhbiBwcm9iYWJseSBmcmVlIHRoZW0uCgpUaGF0
J3MgYSBnb29kIGlkZWEhIFNob3VsZCB3ZSBhZGQgYSAiYm9vbCBmcmVlX2J0ZiIgZmllbGQKdG8g
c3RydWN0IGJwZl90cmFjZV9tdWx0aV9vcHRzPyBicGZfcHJvZ3JhbV9fYXR0YWNoX3RyYWNlX211
bHRpX29wdHMoKQpjYW4gYmUgY2FsbGVkIG11bHRpIHRpbWVzIGZvciBhIGJwZl9vYmplY3QsIHdo
aWNoIGhhcyBtdWx0aSBicGYKcHJvZ3JhbSBvZiB0eXBlIHRyYWNpbmcgbXVsdGktbGluay4gT3Is
IGNhbiB3ZSBmcmVlIHRoZSBidGZzCmF1dG9tYXRpY2FsbHkgaWYgd2UgZm91bmQgYWxsIHRyYWNp
bmcgbXVsdGktbGluayBwcm9ncmFtcyBhcmUgYXR0YWNoZWQ/CgpUaGFua3MhCk1lbmdsb25nIERv
bmcKCj4gSSBkb24ndCBzZWUgYSB1c2UgY2FzZSB3aGVyZSB5b3UnZCB3YW50IHRvIGtlZXAgdGhl
bSBhZnRlcndhcmRzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
