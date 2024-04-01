Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA8BCD128A
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2024 02:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5J63CKAmS5wWDQGN9rGw25UO8SETHrUllk0twZ22ji0=; b=p5vuN7tvSG97uZ
	9RTuNeSf40z9EAMDRt0Wyh429tp3DWUuzVDV3vIK6s8BNdl59dTim10BB7m0VFg9Azxfp8gZchiCv
	+wVysr23z7RfttAAmvBvSoP4M2IE0HFfY5Fht4Bl19M+va7b4qGypDQSTj6eORLll7ZNYhrpT0VEz
	tN1OeYYFRuR8QlABMd6F+Eus7YymmhjSOr+ZC/QkccFFXdPIxq2FMJfj+FIKcjRBzdeZKFfEwM6Fr
	37Pah8Eo/AocR8rpu7oCEuN9T2IPbAQrZqo6nWqQAbsqLDZxVpSQIVYNtcAf0bBZx1LDBLoUx0NQD
	/bhdJSuc2fIPva4SSC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rr7PZ-00000006guG-3XAX;
	Mon, 01 Apr 2024 02:28:37 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rr7PV-00000006gs1-2iPe
	for linux-riscv@lists.infradead.org;
	Mon, 01 Apr 2024 02:28:35 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so2713149a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 31 Mar 2024 19:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1711938509; x=1712543309; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXMeLoImPZ33R4zJ3SWpn56WCPhsxXC6Los6ajh1i8M=;
        b=MhbXiK72FZ77naYb9ojUUtWovFCqkrVL5Ows3asBWx9UqOsPFDgBJ3KEu5DUQSDs5x
         E/efF0GPN8IpSc0ssQYP03C6DnRaGtll/D/qymC3IW/a+VSh7xcq5ZuyTKkDgZ7rkiyN
         2GtndXuXNuEt/FoPlS7nOCwRKzKLiNtOKmD1alyRhLJTlI2lw0Yk7PI94gbB7EYlK/7c
         vV6+uIwwjyKy0ECtBMa0lv/SEerCytbv/e3a7H1J6O7JLI7T73L94VCkJTdAHIOE5jtA
         7UT7tb9luD3NI+HeoF7iCo4SeOnu/HXTEsYceNsq2xOysFjL2aryqDoNY3JRh6D3SkOx
         zDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711938509; x=1712543309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXMeLoImPZ33R4zJ3SWpn56WCPhsxXC6Los6ajh1i8M=;
        b=aI3iTSvwRo0zA1JyUGpT7IJjPs3yBg9MweKqvPmVs8QXoH6oSgpNWoMRZR3XfTW9qF
         p4cjyxJNtRSdr9Mi6TPPLX5L5aHT2UDk/peNyYE7mZfVtgMF0miYIqzMP+4kFh+W5Xbf
         4DmBRfQ2su9jdQbBNdVG31U1Rohx41GT6VW1u6U/AlziF6gPaJXr8/jjYVPSOMGn6IFY
         RNLCxJw5dwoXlYVD3l7mJzLXNcrkGJE6qmYNq9IWsq48wJ8jbgmfIk+2/Pp1A6XuBRHX
         IyA1Vq5Or7LCwn7L9s+wp66Woa3xoN4BDSff9i/leMbgRH0mVDAnCRLYKrX1dZ5b/u+3
         kVRw==
X-Forwarded-Encrypted: i=1; AJvYcCVXnUHCE4Xjg1cmpWJhLm7itNFGpZgd6RK0uLj2Z5mSZ+rL7XatuObweZQhZfZ9HSXLRabboEF5CzMMh9uVi3sQKTLUGjQTz4tnvsEn4voK
X-Gm-Message-State: AOJu0Yym0gYa8h+F+8sv30RP1x24xG/UAHfhmQQIni8z6JTDGCn/p3y6
	95SrFbXdVy/lwvN6p1K4ffECbvaSI2D8pwJB0bZM5utlREJ/hphRDJOqroQ+oH9I0UbWUjORWyq
	2MZJrl0GtG+QRRLLv+QTY2bxIas4Yp2vTdaL1vw==
X-Google-Smtp-Source: AGHT+IGzGQQaneP5xALvw57pZKTHGiCwen67uykrwqg6rWGJrnO4HP/K70Vm6Xhliw5Ne2x0YoSn10U7kH5Lflzm9D8=
X-Received: by 2002:a05:6a20:550a:b0:1a3:6a74:2e6a with SMTP id
 ko10-20020a056a20550a00b001a36a742e6amr8586402pzb.14.1711938508724; Sun, 31
 Mar 2024 19:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-2-dongmenglong.8@bytedance.com> <CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
 <CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
 <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
 <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
 <CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
 <CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com>
 <CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
 <CALz3k9g-U8ih=ycJPRbyU9x_9cp00fNkU3PGQ6jP0WJ+=uKmqQ@mail.gmail.com>
 <CALz3k9jG5Jrqw=BGjt05yMkEF-1u909GbBYrV-02W0dQtm6KQQ@mail.gmail.com>
 <20240328111330.194dcbe5@gandalf.local.home> <CALz3k9idLX10+Gh18xWepwtgvp4VZ3zQfY4aoNXn0gCh8Fs_fA@mail.gmail.com>
 <20240330153722.65104301@gandalf.local.home>
In-Reply-To: <20240330153722.65104301@gandalf.local.home>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Mon, 1 Apr 2024 10:28:17 +0800
Message-ID: <CALz3k9j_RGqSMdN+GvbHEjRqMWYe4R9VNZRANG7jbfL_jVpoVg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH bpf-next v2 1/9] bpf: tracing: add support
 to record and check the accessed args
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Jiri Olsa <jolsa@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	X86 ML <x86@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Quentin Monnet <quentin@isovalent.com>, bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_192834_010160_EA8840D2 
X-CRM114-Status: GOOD (  20.41  )
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

T24gU3VuLCBNYXIgMzEsIDIwMjQgYXQgMzozNOKAr0FNIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0
QGdvb2RtaXMub3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgMzAgTWFyIDIwMjQgMTE6MTg6MjkgKzA4
MDAKPiDmoqbpvpnokaMgPGRvbmdtZW5nbG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4g
PiA+IElmIHlvdSByZWFsbHkgd2FudCB0byBoYXZlIHRob3VzYW5kcyBvZiBmdW5jdGlvbnMsIHdo
eSBub3QganVzdCByZWdpc3RlciBpdAo+ID4gPiB3aXRoIGZ0cmFjZSBpdHNlbGYuIEl0IHdpbGwg
Z2l2ZSB5b3UgdGhlIGFyZ3VtZW50cyB2aWEgdGhlIGZ0cmFjZV9yZWdzCj4gPiA+IHN0cnVjdHVy
ZS4gQ2FuJ3QgeW91IGp1c3QgcmVnaXN0ZXIgYSBwcm9ncmFtIGFzIHRoZSBjYWxsYmFjaz8KPiA+
ID4KPiA+Cj4gPiBFbm5uLi4uSSBkb24ndCB1bmRlcnN0YW5kLiBUaGUgbWFpbiBwdXJwb3NlIGZv
cgo+ID4gbWUgdG8gdXNlIFRSQUNJTkcgaXM6Cj4gPgo+ID4gMS4gd2UgY2FuIGRpcmVjdGx5IGFj
Y2VzcyB0aGUgbWVtb3J5LCB3aGljaCBpcyBtb3JlCj4gPiAgICBlZmZpY2llbnQuCj4KPiBJJ20g
bm90IHN1cmUgd2hhdCB5b3UgbWVhbiBieSB0aGUgYWJvdmUuIEFjY2VzcyB3aGF0IG1lbW9yeT8K
PgoKV2UgbmVlZCB0byB1c2UgdGhlIGhlbHBlciBvZiBicGZfcHJvYmVfcmVhZF9rZXJuZWwKd2hl
biB3ZSByZWFkICJza2ItPnNrIiBpbiBrcHJvYmUsIGFuZCB0aGUgInNrYiIgaXMgdGhlCjFzdCBh
cmcgaW4gaXBfcmN2KCkuIEFuZCB3ZSBjYW4gZGlyZWN0bHkgcmVhZCAic2tiLT5zayIKaW4gdHJh
Y2luZywgd2hpY2ggaXMgbW9yZSBlZmZpY2llbnQuIElzbid0IGl0PwoKPiA+IDIuIHdlIGNhbiBv
YnRhaW4gdGhlIGZ1bmN0aW9uIGFyZ3MgaW4gRkVYSVQsIHdoaWNoCj4gPiAgICAga3JldHByb2Jl
IGNhbid0IGRvIGl0LiBBbmQgdGhpcyBpcyB0aGUgbWFpbiByZWFzb24uCj4KPiBJIGRpZG4ndCBt
ZW50aW9uIGtyZXRwcm9iZS4gSWYgeW91IG5lZWQgYWNjZXNzIHRvIHRoZSBleGl0IG9mIHRoZSBm
dW5jdGlvbiwKPiB5b3UgY2FuIHVzZSBNYXNhbWkncyBmZ3JhcGggdXBkYXRlLgo+Cj4gIGZlbnRy
eSAtPiBmdHJhY2VfdHJhbXBvbGluZSAtPiB5b3VyX2NvZGUKPgo+IEZvciBmZ3JhcGg6Cj4KPiAg
ZmVudHJ5IC0+IGZ0cmFjZV90cmFtcG9saW5lIC0+IGZncmFwaCBbc2V0cyB1cCByZXR1cm4gY2Fs
bF0gLT4geW91cl9lbnRyeV9jb2RlCj4KPiAgZnVuY3Rpb24gcmV0IC0+IGZncmFwaF9yZXRfaGFu
ZGxlciAtPiB5b3VyX2V4aXRfY29kZQo+Cj4gQW5kIHlvdSB3aWxsIGJlIGFibGUgdG8gcGFzcyBk
YXRhIGZyb20gdGhlIGVudHJ5IHRvIHRoZSBleGl0IGNvZGUsCj4gaW5jbHVkaW5nIHBhcmFtZXRl
cnMuCgpZZWFoLCB0aGUgZmdyYXBoIHNvdW5kcyBsaWtlIGEgbmljZSBzb2x1dGlvbiB0byBteSBw
cm9ibGVtLgpJJ2xsIGhhdmUgYSB0cnkgb24gaXQuCgpUaGFua3MhCk1lbmdsb25nIERvbmcKCj4K
PiAtLSBTdGV2ZQo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
