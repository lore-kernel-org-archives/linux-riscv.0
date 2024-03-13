Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595BDC54E5D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 01:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=57aIX4Vjg3ULPk00bb6hgx75CVoDFlosvZjvWDqVM94=; b=Rw+DrDFXQsYdhP
	Y5gw9/NWa1NrKzdCOXDO0jIuN1RXeUSMS5FNTZKZ/XBlfvy4uV+n4gshjmznz0oCswkrqEfDGPFfg
	Z2FWWtJpPnZTVemlUAy5YCnKZE911+x7IsDMgJO3VFThdnJyL5x8ny7A+ubAHHXWHAlHPVri9pksC
	o9XEGPzyQc7N/ZBONUfABu+x7MiuTfq7/bVOnlysxR7R1rVQ4qv24vmyr7ArDmQIgWwN1Teo6Sq11
	n/vcFakbDbbkp0ocl96Hp1omq5yyJMw9mnqnoaItHzGN5NfqDWB8Y3l/NYTwmrwjY/XxyPpdROJA8
	K27FXIz1r5WR/JL/8LVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkDCL-00000008LTj-3nub;
	Wed, 13 Mar 2024 01:14:25 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkDCF-00000008LMh-3hfv
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 01:14:23 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-29aa91e173dso4361893a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 18:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1710292454; x=1710897254; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twMccmPlR7/SShgFg0AONE56vJVPPL3EBuKYw8SPbFI=;
        b=JHHIyWLIgVTveO2+q1JRNkFonfp61+w0oSlZma4W9Uh9OMxIU7F4zgCSUA82L2uJog
         rRWI85kVFIFUcvljwe3QoyljI2jvz9x9lQq5QIWRJ2ss6TtP/pEQ3ELMUDHKRjxf5wLP
         pIxkbbM3fpO6xKFdRhF21zm/nKXjQZfNvunx3EVmtuointsqUp2Sa84xo+y2wWete8dA
         3feCukgIJ9DCzqYbbx9fIA20C2Slc8k5Lzg6ceCfQjRlgdtP2RK5EWrL6vUUVmFN+QwW
         PRlv1v9Pu61Lq5fpk7gwZkxi8ZJL8XTcrUpJXqKHAqD6dnPfbhmAeOt1X+VKFiGg0nfN
         5PkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710292454; x=1710897254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twMccmPlR7/SShgFg0AONE56vJVPPL3EBuKYw8SPbFI=;
        b=mTME0g85VC0Ztq+qztnKnKxVGlE9cKbOtOP7yRa0iIDBimX+S/HUM8p6tAYd7tTNcT
         66cR5qx/POYA85jJuwhB5X1Bf6zBHINNG9wJg1EF6l0V+YTuVQFIWoHDiMlWxngJFFC3
         /vRrev7L6gGhvQyYYO7VK7mo22JUVnFPPt2FQfMjB39xqjMaQUTD2pNL2ZIdaG7tDOxl
         nJc8/u1gk+YgtaL4V73RUArsTKdClNC2G1Rts5ETv5/cJGfpVuU9Od2ZAk1+bjjbComD
         cFktEla2idq7v33ZYYAYN5a/CJoenUh6Kvmofkiupzl80Sl29ijfC3MdBeFdS6XiY0lD
         aSZA==
X-Forwarded-Encrypted: i=1; AJvYcCW48npGT7lF3kYZnKr0FelV0WeQFwKpXjQZRLamO8EsBOa1hPH77nq0HczrVa8UNkqhd3Ok/gM+WzVdXTW8wXxMjP9+yfd1D/5XRe2EILdx
X-Gm-Message-State: AOJu0YxCZ/eodxjeyafQ8GAxR3abQMp8fYoxvOklaUE384Q/xtyWnLzG
	p2qdj+2dCIQV6NE4oj3cjuvtGjE4vIO0vxEr9bmwKP8KOb6mnhM+38ffemb/l/ktZdw0uI8ZgJ1
	jMZa7tqZkEv0rH/lR07vROfAqau3EGRL4iOohPQ==
X-Google-Smtp-Source: AGHT+IFJ2nJztVxlcv7iF1fLo4e+81DiH9lck4a4XLEq2MMi6yrbHR+XGNXNfeaQ8LZdIPeyXdsLEIp10M0upU5dDak=
X-Received: by 2002:a17:90a:bb0d:b0:29c:5ba3:890e with SMTP id
 u13-20020a17090abb0d00b0029c5ba3890emr829001pjr.4.1710292454186; Tue, 12 Mar
 2024 18:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-9-dongmenglong.8@bytedance.com> <CAADnVQK+s3XgSYhpSdh7_9Qhq4DimmSO-D9d5+EsSZQMX4TxxA@mail.gmail.com>
 <CALz3k9hZxsbUGoe5JoWpMEV0URykRwiKWLKZNj4nhvnXg3V=Zg@mail.gmail.com> <CAADnVQJ87Ov6ny2hj-0_WymGB3TeuEZu373EmqmRJqZv-8Ze_Q@mail.gmail.com>
In-Reply-To: <CAADnVQJ87Ov6ny2hj-0_WymGB3TeuEZu373EmqmRJqZv-8Ze_Q@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Wed, 13 Mar 2024 09:14:03 +0800
Message-ID: <CALz3k9jf4Q7KJPes=omx5oBpEmoFNSvc=vp=D0hEa-51i7tc_A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH bpf-next v2 8/9] libbpf: add support for
 the multi-link of tracing
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
X-CRM114-CacheID: sfid-20240312_181420_179954_DA95D7BD 
X-CRM114-Status: GOOD (  13.62  )
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

T24gV2VkLCBNYXIgMTMsIDIwMjQgYXQgMTI6MTLigK9BTSBBbGV4ZWkgU3Rhcm92b2l0b3YKPGFs
ZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXIgMTEsIDIw
MjQgYXQgNzo0NOKAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgOTo1NuKAr0FNIEFsZXhlaSBT
dGFyb3ZvaXRvdgo+ID4gPGFsZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBPbiBNb24sIE1hciAxMSwgMjAyNCBhdCAyOjM14oCvQU0gTWVuZ2xvbmcgRG9uZwo+
ID4gPiA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6ClsuLi5dCj4gPiA+IFBs
cyB1c2UgZ2xvYl9tYXRjaCB0aGUgd2F5IFtrdV1wcm9iZSBtdWx0aSBhcmUgZG9pbmcKPiA+ID4g
aW5zdGVhZCBvZiBleGFjdCBtYXRjaC4KPiA+Cj4gPiBIZWxsbywKPiA+Cj4gPiBJJ20gYSBsaXR0
bGUgc3VzcGVjdGluZyB0aGUgZWZmZWN0IG9mIGdsb2JfbWF0Y2guIEkgc2VsZG9tIGZvdW5kCj4g
PiB0aGUgdXNlIGNhc2UgdGhhdCB0aGUga2VybmVsIGZ1bmN0aW9ucyB3aGljaCB3ZSB3YW50IHRv
IHRyYWNlCj4gPiBoYXZlIHRoZSBzYW1lIG5hbWluZyBwYXR0ZXJuLiBBbmQgdGhlIGV4YWN0IG1h
dGNoIHNlZW1zIG1vcmUKPiA+IHVzZWZ1bC4KPiA+Cj4gPiBDYW4gd2UgdXNlIGJvdGggZXhhY3Qg
YW5kIGdsb2IgbWF0Y2ggaGVyZT8KPgo+IGV4YWN0IGlzIGEgc3Vic2V0IG9mIGdsb2JfbWF0Y2gu
Cj4gUGxzIGZvbGxvdyB0aGUgcGF0dGVybiB0aGF0W2t1XXByb2JlIG11bHRpIGVzdGFibGlzaGVk
Cj4gaW4gdGVybXMgb2YgdXNlciBpbnRlcmZhY2UgZXhwZWN0YXRpb25zLgoKT2theSEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
