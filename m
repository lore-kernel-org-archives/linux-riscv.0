Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3EECD4F25
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 20:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vnqPwSEOYsutLv+xP/QNII5K1WRdkFgahl0plxoEuPQ=; b=c5cp9nEihPhaaJ
	iZgr6UP38zbF5mG5ejDECodppZoaooQZ2brHzWwrZVx9M7ZY5Ejj4e0U+SsTN9/UymCiK8VgJoQBK
	z1A2CNGdNLG2gkIVsXc7aBk8KIF6yBPDicf/6s/pMKw34QoO9fw8hGC05ydk1gYZU5049I721eUly
	ELqcy2Jk22RO1UqXeqo09nt9H1G/U3akYGykqw5a/XqExDOrnPJ8fHOSeslWvMZ1sjjl8uYqWjEC6
	0/BPu6iZ7W+AjaL0n3eLb3iHDE8zD2N155qCzbpO7eerRcIGiXVBNiMNYDWTNbYZvz8U4KDey0yEn
	wSDRmJ4bMnmw1vHd/UCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slwVf-00000005wxG-0sDs;
	Wed, 04 Sep 2024 20:21:47 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slwVc-00000005wwI-3MUg
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 20:21:46 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2d8881850d9so3886906a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2024 13:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725481303; x=1726086103; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khaawNAlNApfnuUFLuoc0b0TKkCbytkfrIkubZTVCdU=;
        b=UxOrH2qh+5+3aBGmI3u9ervJUHG62wuXnBKNmEIPvE2jt4PnsTK/MVWS+EONL+VGb/
         YjN9uuiLoVurXdYAhv+frvsUX2+a/oqERuw+wMCv9lczcuG9ep1G9RFtJ9WJ+7liJb0t
         9iwvdCwxTO1FuCL2Z6gQH+hMy5ZNAskD5o59kGRD9YdafucJt1SPgRibOjUyJ80Qrl3h
         wAQEoV0g8sAYC3AzbS1pJidiVPESNfJFPym5GD0lZKmJ0aFupCUCajU822IJikdwgZS0
         1HFdYekzDA1egLf/8AFDxCWVJgIMSibXydok2eH45ZnpJn6bgYnPecy0uAzRt1wDUnVO
         +UZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725481303; x=1726086103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khaawNAlNApfnuUFLuoc0b0TKkCbytkfrIkubZTVCdU=;
        b=MEQ3Aynp/XvOTeJZB9hRKYqvbA8DolX/6DdmrfxWbLytU47AZVFtn5aol02H6sciXy
         zXjtc8Vw/Tw16Xxu+C+iLsBaTrY5cQirb2P0wb5/qar2DxQa/70GBbu42zQGVVYEGFSK
         6LI4QRz719yJaGeeM4q6YbcMqrBTZQh+5jbQXOZxlJwmkc8H+12kHArjT1lzjEZLWzSp
         xx9/XK4hRaFbqKrxSYhQOybYmnbD0qHXur9JzU1DDeAREFJPmn5pGYM01pPFhaV3twq/
         tXCcw9RXTqCFIHcfB+UDEjAAN9f2jbtLD94FdCZvevBI4IfU4y8722J+1M8/nRTJohl4
         Omvw==
X-Forwarded-Encrypted: i=1; AJvYcCXgcvh2+giPghzwmH3DgXdTGiZrwGvJaf/4TIFDZ+VES5FyrYlztftoGyhKhYnQ/o+L9yUS57ihQhYu7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjZyW3/o439bONDuHd2EZCXIfK/tuHan2RLfNkYt+VLzPNypAa
	zW7WN8+qvGH3brfgB/zzYx7+/qVqBc1554yfCEGTIAVYjH49V8LzMhwsWDQ4G4hVsMABuM+CReL
	TXlfzoNKrXcM7fyDD+39M0SipBHg=
X-Google-Smtp-Source: AGHT+IF9SbM3MOIJjbovhN7aSna5YGP1BzRSyOgc8SIrN2g92tsPxLrKWU2/j+vTpIf1Dn92253znctT3vuuLYUUxhA=
X-Received: by 2002:a17:90a:eb0f:b0:2d8:8138:fa11 with SMTP id
 98e67ed59e1d1-2da6344d3d4mr7316870a91.37.1725481303365; Wed, 04 Sep 2024
 13:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240831041934.1629216-1-pulehui@huaweicloud.com> <20240831041934.1629216-4-pulehui@huaweicloud.com>
In-Reply-To: <20240831041934.1629216-4-pulehui@huaweicloud.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 4 Sep 2024 13:21:31 -0700
Message-ID: <CAEf4BzZ3Sya=OoLhSzoYFif_cPr7sqOchjM7enoLeV4=2PXdGw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/4] selftests/bpf: Enable test_bpf_syscall_macro:syscall_arg1
 on s390 and arm64
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
	netdev@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Pu Lehui <pulehui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_132144_879003_1B6D951C 
X-CRM114-Status: GOOD (  16.73  )
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

T24gRnJpLCBBdWcgMzAsIDIwMjQgYXQgOToxN+KAr1BNIFB1IExlaHVpIDxwdWxlaHVpQGh1YXdl
aWNsb3VkLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29t
Pgo+Cj4gQ29uc2lkZXJpbmcgdGhhdCBDTy1SRSBkaXJlY3QgcmVhZCBhY2Nlc3MgdG8gdGhlIGZp
cnN0IHN5c3RlbSBjYWxsCj4gYXJndW1lbnQgaXMgYWxyZWFkeSBhdmFpbGFibGUgb24gczM5MCBh
bmQgYXJtNjQsIGxldCdzIGVuYWJsZQo+IHRlc3RfYnBmX3N5c2NhbGxfbWFjcm86c3lzY2FsbF9h
cmcxIG9uIHRoZXNlIGFyY2hpdGVjdHVyZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8
cHVsZWh1aUBodWF3ZWkuY29tPgo+IC0tLQo+ICAuLi4vdGVzdGluZy9zZWxmdGVzdHMvYnBmL3By
b2dfdGVzdHMvdGVzdF9icGZfc3lzY2FsbF9tYWNyby5jIHwgNCAtLS0tCj4gIHRvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2JwZi9wcm9ncy9icGZfc3lzY2FsbF9tYWNyby5jICAgICAgICAgfCAyIC0t
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ190ZXN0cy90ZXN0X2JwZl9zeXNjYWxsX21hY3Jv
LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ190ZXN0cy90ZXN0X2JwZl9zeXNj
YWxsX21hY3JvLmMKPiBpbmRleCAyOTAwYzVlOWEwMTYuLjE3NTBjMjliOTRmOCAxMDA2NDQKPiAt
LS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ190ZXN0cy90ZXN0X2JwZl9zeXNj
YWxsX21hY3JvLmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ190ZXN0
cy90ZXN0X2JwZl9zeXNjYWxsX21hY3JvLmMKPiBAQCAtMzgsMTEgKzM4LDcgQEAgdm9pZCB0ZXN0
X2JwZl9zeXNjYWxsX21hY3JvKHZvaWQpCj4gICAgICAgICAvKiBjaGVjayB3aGV0aGVyIGFyZ3Mg
b2Ygc3lzY2FsbCBhcmUgY29waWVkIGNvcnJlY3RseSAqLwo+ICAgICAgICAgcHJjdGwoZXhwX2Fy
ZzEsIGV4cF9hcmcyLCBleHBfYXJnMywgZXhwX2FyZzQsIGV4cF9hcmc1KTsKPgo+IC0jaWYgZGVm
aW5lZChfX2FhcmNoNjRfXykgfHwgZGVmaW5lZChfX3MzOTBfXykKPiAtICAgICAgIEFTU0VSVF9O
RVEoc2tlbC0+YnNzLT5hcmcxLCBleHBfYXJnMSwgInN5c2NhbGxfYXJnMSIpOwo+IC0jZWxzZQo+
ICAgICAgICAgQVNTRVJUX0VRKHNrZWwtPmJzcy0+YXJnMSwgZXhwX2FyZzEsICJzeXNjYWxsX2Fy
ZzEiKTsKPiAtI2VuZGlmCj4gICAgICAgICBBU1NFUlRfRVEoc2tlbC0+YnNzLT5hcmcyLCBleHBf
YXJnMiwgInN5c2NhbGxfYXJnMiIpOwo+ICAgICAgICAgQVNTRVJUX0VRKHNrZWwtPmJzcy0+YXJn
MywgZXhwX2FyZzMsICJzeXNjYWxsX2FyZzMiKTsKPiAgICAgICAgIC8qIGl0IGNhbm5vdCBjb3B5
IGFyZzQgd2hlbiB1c2VzIFBUX1JFR1NfUEFSTTQgb24geDg2XzY0ICovCj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy9icGZfc3lzY2FsbF9tYWNyby5jIGIv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL2JwZl9zeXNjYWxsX21hY3JvLmMKPiBp
bmRleCAxYTQ3NmQ4ZWQzNTQuLjllN2Q5Njc0Y2UyYSAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvYnBmX3N5c2NhbGxfbWFjcm8uYwo+ICsrKyBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy9icGZfc3lzY2FsbF9tYWNyby5jCj4gQEAgLTQz
LDkgKzQzLDcgQEAgaW50IEJQRl9LUFJPQkUoaGFuZGxlX3N5c19wcmN0bCkKPgo+ICAgICAgICAg
LyogdGVzdCBmb3IgUFRfUkVHU19QQVJNICovCj4KPiAtI2lmICFkZWZpbmVkKGJwZl90YXJnZXRf
YXJtNjQpICYmICFkZWZpbmVkKGJwZl90YXJnZXRfczM5MCkKPiAgICAgICAgIGJwZl9wcm9iZV9y
ZWFkX2tlcm5lbCgmdG1wLCBzaXplb2YodG1wKSwgJlBUX1JFR1NfUEFSTTFfU1lTQ0FMTChyZWFs
X3JlZ3MpKTsKPiAtI2VuZGlmCj4gICAgICAgICBhcmcxID0gdG1wOwoKVGhlcmUgaXMgbm8gcG9p
bnQgaW4gaGF2aW5nIHRtcCB2YXJpYWJsZSBub3csIEkgY2xlYW5lZCB0aGF0IHVwIGFzIHdlbGwK
Cgo+ICAgICAgICAgYnBmX3Byb2JlX3JlYWRfa2VybmVsKCZhcmcyLCBzaXplb2YoYXJnMiksICZQ
VF9SRUdTX1BBUk0yX1NZU0NBTEwocmVhbF9yZWdzKSk7Cj4gICAgICAgICBicGZfcHJvYmVfcmVh
ZF9rZXJuZWwoJmFyZzMsIHNpemVvZihhcmczKSwgJlBUX1JFR1NfUEFSTTNfU1lTQ0FMTChyZWFs
X3JlZ3MpKTsKPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
