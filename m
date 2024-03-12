Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A247C5475B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 01:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gc6F4M+miI0uFJAIX8Mfn+A9i5TzXtrOLwFi1/R4r2s=; b=WXLoC0aaRZS8aD
	JALA/de5WPzOTWC1XCm+lvXUzFaZNufeFZAZizymL1lcNZzI/MnSIfkJmSupYJ51BZKr4JSYGdB+I
	tP5D1tlV+cpvXhwUlhrZVQx30ecdLW2Sx2Th0kELDJ4BDWs18Lumo61hOcPxMBSJeZaFZzWXsxGUp
	u8CfInuviNJNEO6Wq/AZjKtNaYIb2JWW85creQl6O9bh49eiJwJT6BUalo9SgnBrOSAcP/XWHSjXD
	8g79mJ2T225BBXl/TkRkzaAzJtjljYt2cK3118RYTNWD7tqOuPSRFVFndLk1Th562C+RxEkkdnbMA
	dak5JnPPDQCIiOMBbljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrIx-00000003t4h-1BBN;
	Tue, 12 Mar 2024 01:51:47 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrIt-00000003t2w-2RVS;
	Tue, 12 Mar 2024 01:51:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-33e162b1b71so4744788f8f.1;
        Mon, 11 Mar 2024 18:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710208302; x=1710813102; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKvBVych6YCWus4gRNHRR8iBtRNOaryODuyFk+IiwIg=;
        b=H40TJfaouJrEpuSg/rVGCG6Pr+WfENZAn1TgwKCGWFOT/shy1ch9IKpelC96ICbKNW
         afb9D5Q/SDZVUpWSav0aiJ58ZpZEBocOrdiBcvOAwpqH7OTc2oouZ8vkJ9sjNPmWJx9Z
         6SOCmUq61XaSZ+awL4LBEMaiFce1oNnKR8DNf/1ChaAD+2x+dyYgDplsXM62VejcnMFb
         OOPvAODvQoDVVj7c4/Usia9EEv85ZnLXZrTyaqGfKpRW8h9Iylq9AJULiPj2zCxeNKGV
         m0yMgRQTTqdhXLKMDz7N3aFolG/jpfRKevYFPhjm1LfsgvyaEp1CIWcnHTglaln0j592
         nd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710208302; x=1710813102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKvBVych6YCWus4gRNHRR8iBtRNOaryODuyFk+IiwIg=;
        b=ofCnFw5UXbuyVW64pbXLevDD5wNUPxWtG0/66whx27zgISB0sk2uMWA4qXJMnvOVWm
         WxrHq1tlZFi09l1PGMi4dk3I3iaoZljwmeLGSQlB2OvCi3AntzBvVSZAE1mUzP5Fme35
         aQoL3i734BXMPDngHyU2fVaDLZNZP663FdHIl+yvXVlXDxjoakEsOd5roBS9WSsOd8aW
         JV2ou2LaO+Xxpse+g6tUJP30G06bngoeCG9QEIv+7Lt5HWFvayLMvThsFBnAI4Gdsu+6
         T88QzIxESFZO466d13i7j6XVCF/3vjwgJSLYG3UA5qjr9abLq16FfOgGpPu+gfvLCEZX
         VW+w==
X-Forwarded-Encrypted: i=1; AJvYcCVhjG6ynnpfUAgmV5NVyhgL1RU/5/QscZ8hKqAYbkyTWix9Ap69MRTiVO2pRXxD4wOIAV7ZuWdHS2GHN5wr5NpLsgbYeIt/N5fuqP7ev9j1/EzEucMMViLiOSIT8toU3IcQPew5UEkhzP2bs2e2hPIdeK7vs80=
X-Gm-Message-State: AOJu0YyeMoP9mozISDT+6IzObZsZ5caBMoJdVkoZS9pQ5iXpmOK7zlb9
	htO5OCV8suQabSdqbcFrq+zOTTTHPHRz3YYYeTRp2k1fcUT6uHso7q42pgo61hWyIQ0sQfpsMAv
	wKvmYNg2Ti3p1fWsw2ooTC//wtVg=
X-Google-Smtp-Source: AGHT+IEB/YPizRPdSM8g0e75qq4Trwgwdg1LF6SZVgxJUmKpI+Q9QIjihr7HmFgR5GDbRJDy4Pav6rzymzHVBMyXxJg=
X-Received: by 2002:adf:ea06:0:b0:33e:48f9:169d with SMTP id
 q6-20020adfea06000000b0033e48f9169dmr403840wrm.31.1710208301974; Mon, 11 Mar
 2024 18:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com> <20240311093526.1010158-6-dongmenglong.8@bytedance.com>
In-Reply-To: <20240311093526.1010158-6-dongmenglong.8@bytedance.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 11 Mar 2024 18:51:30 -0700
Message-ID: <CAADnVQKw4HUbwvivysVBQPpA2MC2e56MwrvJy89qs8rx_ixOnw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 5/9] bpf: verifier: add btf to the function
 args of bpf_check_attach_target
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
X-CRM114-CacheID: sfid-20240311_185143_660710_BBCB6C41 
X-CRM114-Status: GOOD (  18.31  )
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
bG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gQWRkIHRhcmdldCBidGYgdG8gdGhlIGZ1
bmN0aW9uIGFyZ3Mgb2YgYnBmX2NoZWNrX2F0dGFjaF90YXJnZXQoKSwgdGhlbgo+IHRoZSBjYWxs
ZXIgY2FuIHNwZWNpZnkgdGhlIGJ0ZiB0byBjaGVjay4KPgo+IFNpZ25lZC1vZmYtYnk6IE1lbmds
b25nIERvbmcgPGRvbmdtZW5nbG9uZy44QGJ5dGVkYW5jZS5jb20+Cj4gLS0tCj4gIGluY2x1ZGUv
bGludXgvYnBmX3ZlcmlmaWVyLmggfCAxICsKPiAga2VybmVsL2JwZi9zeXNjYWxsLmMgICAgICAg
ICB8IDYgKysrKy0tCj4gIGtlcm5lbC9icGYvdHJhbXBvbGluZS5jICAgICAgfCAxICsKPiAga2Vy
bmVsL2JwZi92ZXJpZmllci5jICAgICAgICB8IDggKysrKystLS0KPiAgNCBmaWxlcyBjaGFuZ2Vk
LCAxMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvYnBmX3ZlcmlmaWVyLmggYi9pbmNsdWRlL2xpbnV4L2JwZl92ZXJpZmllci5oCj4g
aW5kZXggNGIwZjY2MDBlNDk5Li42Y2IyMGVmY2ZhYzMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9s
aW51eC9icGZfdmVyaWZpZXIuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvYnBmX3ZlcmlmaWVyLmgK
PiBAQCAtODExLDYgKzgxMSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBicGZfdHJhbXBvbGluZV91
bnBhY2tfa2V5KHU2NCBrZXksIHUzMiAqb2JqX2lkLCB1MzIgKmJ0Zl9pZCkKPiAgaW50IGJwZl9j
aGVja19hdHRhY2hfdGFyZ2V0KHN0cnVjdCBicGZfdmVyaWZpZXJfbG9nICpsb2csCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBicGZfcHJvZyAqcHJvZywKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGJwZl9wcm9nICp0Z3RfcHJvZywK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGJ0ZiAqYnRmLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1MzIgYnRmX2lkLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgYnBmX2F0dGFjaF90YXJnZXRfaW5mbyAqdGd0X2luZm8pOwo+ICB2b2lkIGJw
Zl9mcmVlX2tmdW5jX2J0Zl90YWIoc3RydWN0IGJwZl9rZnVuY19idGZfdGFiICp0YWIpOwo+IGRp
ZmYgLS1naXQgYS9rZXJuZWwvYnBmL3N5c2NhbGwuYyBiL2tlcm5lbC9icGYvc3lzY2FsbC5jCj4g
aW5kZXggZDFjZDY0NWVmOWFjLi42MTI4YzMxMzExNDEgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2Jw
Zi9zeXNjYWxsLmMKPiArKysgYi9rZXJuZWwvYnBmL3N5c2NhbGwuYwo+IEBAIC0zNDAxLDkgKzM0
MDEsMTEgQEAgc3RhdGljIGludCBicGZfdHJhY2luZ19wcm9nX2F0dGFjaChzdHJ1Y3QgYnBmX3By
b2cgKnByb2csCj4gICAgICAgICAgICAgICAgICAqIG5lZWQgYSBuZXcgdHJhbXBvbGluZSBhbmQg
YSBjaGVjayBmb3IgY29tcGF0aWJpbGl0eQo+ICAgICAgICAgICAgICAgICAgKi8KPiAgICAgICAg
ICAgICAgICAgc3RydWN0IGJwZl9hdHRhY2hfdGFyZ2V0X2luZm8gdGd0X2luZm8gPSB7fTsKPiAr
ICAgICAgICAgICAgICAgc3RydWN0IGJ0ZiAqYnRmOwo+Cj4gLSAgICAgICAgICAgICAgIGVyciA9
IGJwZl9jaGVja19hdHRhY2hfdGFyZ2V0KE5VTEwsIHByb2csIHRndF9wcm9nLCBidGZfaWQsCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZ0Z3RfaW5mbyk7
Cj4gKyAgICAgICAgICAgICAgIGJ0ZiA9IHRndF9wcm9nID8gdGd0X3Byb2ctPmF1eC0+YnRmIDog
cHJvZy0+YXV4LT5hdHRhY2hfYnRmOwoKSSB0aGluayBpdCdzIGJldHRlciB0byBrZWVwIHRoaXMg
Yml0IGluc2lkZSBicGZfY2hlY2tfYXR0YWNoX3RhcmdldCgpLApzaW5jZSBhIGxvdCBvZiBvdGhl
ciBjb2RlIGluIHRoZXJlIGlzIHdvcmtpbmcgd2l0aCBpZiAodGd0X3Byb2cpIC4uLgpzbyBpZiB0
aGUgY2FsbGVyIG1lc3NlcyB1cCBwYXNzaW5nIHRndF9wcm9nLT5hdXgtPmJ0ZiB3aXRoIHRndF9w
cm9nCnRoZSBidWcgd2lsbCBiZSBkaWZmaWN1bHQgdG8gZGVidWcuCgo+ICsgICAgICAgICAgICAg
ICBlcnIgPSBicGZfY2hlY2tfYXR0YWNoX3RhcmdldChOVUxMLCBwcm9nLCB0Z3RfcHJvZywgYnRm
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBidGZfaWQs
ICZ0Z3RfaW5mbyk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
