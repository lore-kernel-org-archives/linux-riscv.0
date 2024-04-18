Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F72C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 22:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jw/6HUaSNX8Hb9ep5U/0Bw/L+D3CIQw4HpB7KNMbok4=; b=GcSkLhTRbNer0f
	RNDZ5gG383E2vIY50iz0XrWWb7Wj6GpaBqMk3LBdgNVqeBwCKxkcss80wjtMI5hA/38BgBvncI7DO
	eeAQAXdf1IPKnyYGViBg7ybJKbCv4on8Tr9rPUMMPmBEv5/qBNuW9Tg1snwUcIVzBRjaKLxDXOH+P
	NGyq+0upaRzx39LZE9+ycd6+UhtlXGQEKR/J5O45heJ8aR/15bBXlL4i2+6K5bDL/7P5Mxvc8XRLc
	rc73vh0BBDlUwu8lIsIFGnUMlqq7HLgEfNiZ/V8Rha+FQgNxBQj+f+Rap7AJXJ6Bcl46X+Sxijrdj
	kDm9fJIYXgeWbcjKN/MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxaBA-00000003qM0-25Gb;
	Thu, 18 Apr 2024 22:24:28 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxaB7-00000003qLJ-1lmP
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 22:24:27 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2a614b0391dso1207356a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 15:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713479064; x=1714083864; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deUJvXeVY3838w4CjTqAEiIczD57MmjPpFzLc8yadh4=;
        b=cY3co5CEGjoyRLqttp8vuvSuEjdj1jKOzq3OVy8XJNGgtD4lXQGa34bOXGvFH/XCXL
         OehDCTYCilXClKriUCyb64VsvsocyOAxYgQo8vwtv3qkFe9e6ywuBIUhGwxKH602w0wr
         vq3+FA1ktaiSbpplY0Qgb1AFW7c5zRIsNQ5SGKe2IIs4c/e3kRrW4QK+oggc+t7F7S9n
         F0/JXUfsLGcwGqSjER488/FzCUA3YdJTdIwbyfIKW7v1kPLAxPqLgRH5UO715AYNbL0H
         ZbY+ZA+ccSw73AhJtqr9By79cCQNsLLangvghlFT7Zcu0Dfswhx2FmTCJlVb7jtp5fnx
         4yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713479064; x=1714083864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deUJvXeVY3838w4CjTqAEiIczD57MmjPpFzLc8yadh4=;
        b=NRzfNUr5IpW/1jZ4alVoMem4S+9KwtnivtbNcQk4ipBSwtOz85uYbh2QN74wuupKZt
         id4ZcOsOHxSkao/GAEQ8QlLOFRvPRWQpVi6zUON0If3xU/2ZTFBKbGMrqiyljmFeeQjP
         xYtRUcW82K5XH+nsqgHNzoPKXcli1/R8G7c+hbC3HbWnvPQvsWN2zweISr3cGSud2Mct
         w9r8qitf87nIMjciZJyq5IXCTVk2T7wE/B4naAfTuTZZhA59u7LoL6o41SAYIJ41XSm/
         Q3xTXlsQzY0BwiAOrtXIIEawbrkv4lVOFDi3X0Jl4/tI7uCWJM7jrtTbZhDAOnkDOSQW
         1xXg==
X-Forwarded-Encrypted: i=1; AJvYcCUc1kP++wCDxVaqxVSaLkeNRVSmBhVaMJ9Z9n3r/IiZjN+bcDLC1RBRVJ1+NywdgUWGX2tiRY0pdV43t74d7oKb1LPQC2x+iRr/+UYJiM/a
X-Gm-Message-State: AOJu0Yy0K3y3dk9OBac9kI1Q+IhBrSlqQL9moAQzdrvOaAC2iSjy10D+
	au3PuGRNEmkBmmlfzvX6qkUV5mdDAAyFRZDJ96CGfSdfuaaubYzmKEOv1qUgOum6HoLiS5igLOV
	fIAxN+V0v6aRRE6TWjOJTcXnLaAc=
X-Google-Smtp-Source: AGHT+IFVkNK2HKAQnoLco34pMJP8gkECXKggNPuoeOQagYF3NGXKTKpy/uzP/lCl0KuENwUqAaSFPNGh1aHg6OzXk/M=
X-Received: by 2002:a05:6a21:2b13:b0:1a9:c3ac:c6d4 with SMTP id
 ss19-20020a056a212b1300b001a9c3acc6d4mr467473pzb.62.1713479064034; Thu, 18
 Apr 2024 15:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240405124348.27644-1-puranjay12@gmail.com> <CAEf4BzZ2Tz5-GwbQKYg7KoGwqN8ewPBakmghHaH20MfoATe74g@mail.gmail.com>
 <87cyr0uwsg.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87cyr0uwsg.fsf@all.your.base.are.belong.to.us>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 18 Apr 2024 15:24:11 -0700
Message-ID: <CAEf4BzahfDssv6SgKYmay+CxQ7GAY9TD5LPG8D9NjGrzMBY28Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next] riscv, bpf: add internal-only MOV instruction to
 resolve per-CPU addrs
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Puranjay Mohan <puranjay12@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pu Lehui <pulehui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_152425_576273_425505E5 
X-CRM114-Status: GOOD (  26.16  )
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

T24gTW9uLCBBcHIgOCwgMjAyNCBhdCAxMjo0MOKAr0FNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQW5kcmlpIE5ha3J5aWtvIDxhbmRyaWkubmFrcnlpa29AZ21h
aWwuY29tPiB3cml0ZXM6Cj4KPiA+IE9uIEZyaSwgQXByIDUsIDIwMjQgYXQgNTo0NOKAr0FNIFB1
cmFuamF5IE1vaGFuIDxwdXJhbmpheTEyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBTdXBw
b3J0IGFuIGluc3RydWN0aW9uIGZvciByZXNvbHZpbmcgYWJzb2x1dGUgYWRkcmVzc2VzIG9mIHBl
ci1DUFUKPiA+PiBkYXRhIGZyb20gdGhlaXIgcGVyLUNQVSBvZmZzZXRzLiBUaGlzIGluc3RydWN0
aW9uIGlzIGludGVybmFsLW9ubHkgYW5kCj4gPj4gdXNlcnMgYXJlIG5vdCBhbGxvd2VkIHRvIHVz
ZSB0aGVtIGRpcmVjdGx5LiBUaGV5IHdpbGwgb25seSBiZSB1c2VkIGZvcgo+ID4+IGludGVybmFs
IGlubGluaW5nIG9wdGltaXphdGlvbnMgZm9yIG5vdyBiZXR3ZWVuIEJQRiB2ZXJpZmllciBhbmQg
QlBGCj4gPj4gSklUcy4KPiA+Pgo+ID4+IFJJU0MtViB1c2VzIGdlbmVyaWMgcGVyLWNwdSBpbXBs
ZW1lbnRhdGlvbiB3aGVyZSB0aGUgb2Zmc2V0cyBmb3IgQ1BVcwo+ID4+IGFyZSBrZXB0IGluIGFu
IGFycmF5IGNhbGxlZCBfX3Blcl9jcHVfb2Zmc2V0W2NwdV9udW1iZXJdLiBSSVNDViBzdG9yZXMK
PiA+PiB0aGUgYWRkcmVzcyBvZiB0aGUgdGFza19zdHJ1Y3QgaW4gVFAgcmVnaXN0ZXIuIFRoZSBm
aXJzdCBlbGVtZW50IGluCj4gPj4gdGFzdF9zdHJ1Y3QgaXMgc3RydWN0IHRocmVhZF9pbmZvLCBh
bmQgd2UgY2FuIGdldCB0aGUgY3B1IG51bWJlciBieQo+ID4+IHJlYWRpbmcgZnJvbSB0aGUgVFAg
cmVnaXN0ZXIgKyBvZmZzZXRvZihzdHJ1Y3QgdGhyZWFkX2luZm8sIGNwdSkuCj4gPj4KPiA+PiBP
bmNlIHdlIGhhdmUgdGhlIGNwdSBudW1iZXIgaW4gYSByZWdpc3RlciB3ZSByZWFkIHRoZSBvZmZz
ZXQgZm9yIHRoYXQKPiA+PiBjcHUgZnJvbSBhZGRyZXNzOiAmX19wZXJfY3B1X29mZnNldCArIGNw
dV9udW1iZXIgPDwgMy4gVGhlbiB3ZSBhZGQgdGhpcwo+ID4+IG9mZnNldCB0byB0aGUgZGVzdGlu
YXRpb24gcmVnaXN0ZXIuCj4gPj4KPiA+PiBUbyBtZWFzdXJlIHRoZSBpbXByb3ZlbWVudCBmcm9t
IHRoaXMgY2hhbmdlLCB0aGUgYmVuY2htYXJrIGluIFsxXSB3YXMKPiA+PiB1c2VkIG9uIFFlbXU6
Cj4gPj4KPiA+PiBCZWZvcmU6Cj4gPj4gZ2xvYi1hcnItaW5jICAgOiAgICAxLjEyNyDCsSAwLjAx
M00vcwo+ID4+IGFyci1pbmMgICAgICAgIDogICAgMS4xMjEgwrEgMC4wMDRNL3MKPiA+PiBoYXNo
LWluYyAgICAgICA6ICAgIDAuNjgxIMKxIDAuMDUyTS9zCj4gPj4KPiA+PiBBZnRlcjoKPiA+PiBn
bG9iLWFyci1pbmMgICA6ICAgIDEuMTM4IMKxIDAuMDExTS9zCj4gPj4gYXJyLWluYyAgICAgICAg
OiAgICAxLjM2NiDCsSAwLjAwNk0vcwo+ID4+IGhhc2gtaW5jICAgICAgIDogICAgMC42NzYgwrEg
MC4wMDFNL3MKPiA+Cj4gPiBUQkgsIEkgZG9uJ3QgdHJ1c3QgYmVuY2htYXJrcyBkb25lIGluc2lk
ZSBRRU1VLiBDYW4geW91IHRyeSBydW5uaW5nCj4gPiB0aGlzIG9uIHNvbWUgcmVhbCBoYXJkd2Fy
ZT8KPgo+IEkganVzdCByYW4gaXQgb24gYSAiVmlzaW9uRml2ZTIiIFNCQzoKPgo+IEJFRk9SRQo+
ID09PT09PQo+IGdsb2ItYXJyLWluYyAgIDogICAxMS41ODYgwrEgMC4wMjFNL3MKPiBhcnItaW5j
ICAgICAgICA6ICAgMTAuODkyIMKxIDAuMDA1TS9zCj4gaGFzaC1pbmMgICAgICAgOiAgICAxLjUx
NyDCsSAwLjAwMU0vcwo+Cj4gQUZURVIKPiA9PT09PQo+IGdsb2ItYXJyLWluYyAgIDogICAxMS44
OTMgwrEgMC4wMTdNL3MgICgrMi42JSkKPiBhcnItaW5jICAgICAgICA6ICAgMTEuNjMwIMKxIDAu
MDIwTS9zICAoKzYuOCUpCj4gaGFzaC1pbmMgICAgICAgOiAgICAxLjU0MyDCsSAwLjAwMk0vcyAg
KCsxLjclKQo+CgpOaWNlLCBsb29rcyBwcmV0dHkgcmVhc29uYWJsZSAoYW5kIGVzcGVjaWFsbHkg
aWYKYnBmX3NtcF9nZXRfY3VycmVudF9pZCgpIGdldHMgaW5saW5lZCBhcyB3ZWxsLCB0aGUgbnVt
YmVycyBzaG91bGQgYmUKZXZlbiBiZXR0ZXIpCgoKPiAoSXQncyBlYXJseSwgYW5kIHRoZSBjb2Zm
ZWUgaGF2ZW4ndCBraWNrZWQgaW4sIHNvIEkgaG9wZSB0aGUKPiBjYWxjdWxhdGlvbnMgYXJlIGNv
cnJlY3QuLi4pCj4KPiA+Pgo+ID4+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vYW5ha3J5aWtvL2xp
bnV4L2NvbW1pdC84ZGVjOTAwOTc1ZWYKPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFB1cmFuamF5
IE1vaGFuIDxwdXJhbmpheTEyQGdtYWlsLmNvbT4KPiA+PiAtLS0KPiA+PiAgYXJjaC9yaXNjdi9u
ZXQvYnBmX2ppdF9jb21wNjQuYyB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ID4+ICAx
IGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2Nv
bXA2NC5jCj4gPj4gaW5kZXggMTVlNDgyZjJjNjU3Li5lOTViZDFkNDU5YTQgMTAwNjQ0Cj4gPj4g
LS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+ID4+ICsrKyBiL2FyY2gvcmlz
Y3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiA+PiBAQCAtMTIsNiArMTIsNyBAQAo+ID4+ICAjaW5j
bHVkZSA8bGludXgvc3RvcF9tYWNoaW5lLmg+Cj4gPj4gICNpbmNsdWRlIDxhc20vcGF0Y2guaD4K
PiA+PiAgI2luY2x1ZGUgPGFzbS9jZmkuaD4KPiA+PiArI2luY2x1ZGUgPGFzbS9wZXJjcHUuaD4K
PiA+PiAgI2luY2x1ZGUgImJwZl9qaXQuaCIKPiA+Pgo+ID4+ICAjZGVmaW5lIFJWX0ZFTlRSWV9O
SU5TTlMgMgo+ID4+IEBAIC0xMDg5LDYgKzEwOTAsMjQgQEAgaW50IGJwZl9qaXRfZW1pdF9pbnNu
KGNvbnN0IHN0cnVjdCBicGZfaW5zbiAqaW5zbiwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgs
Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgZW1pdF9vcihSVl9SRUdfVDEsIHJkLCBSVl9S
RUdfVDEsIGN0eCk7Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgZW1pdF9tdihyZCwgUlZf
UkVHX1QxLCBjdHgpOwo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4+ICsg
ICAgICAgICAgICAgICB9IGVsc2UgaWYgKGluc25faXNfbW92X3BlcmNwdV9hZGRyKGluc24pKSB7
Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJkICE9IHJzKQo+ID4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZW1pdF9tdihyZCwgcnMsIGN0eCk7Cj4gPgo+ID4gSXMg
dGhpcyBhbiB1bmNvbmRpdGlvbmFsIG1vdmUgaW5zdHJ1Y3Rpb24/IGluIHg4Ni02NCwgRU1JVF9t
b3YgY2hlY2tzCj4gPiB3aGV0aGVyIHNvdXJjZSBhbmQgZGVzdGluYXRpb24gcmVnaXN0ZXJzIGFy
ZSB0aGUgc2FtZSBhbmQgZG9lc24ndCBlbWl0Cj4gPiBhbnl0aGluZyBpZiB0aGV5IG1hdGNoICh3
aGljaCBtYWtlcyBzZW5zZSwgcmlnaHQpPwo+Cj4gWWVhaCwgaXQgaXMuIEZvbGRpbmcgdGhlIGNo
ZWNrIGludG8gdGhlIGVtaXQgc291bmRzIGxpa2UgYSBnb29kIGlkZWEuCj4KCmdyZWF0Cgo+Cj4g
QmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
