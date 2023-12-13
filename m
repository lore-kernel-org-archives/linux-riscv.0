Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E3BC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 06:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRkGeQJCwTiZCVEXRmBRc4wJfvb6w8uBdUh2LkOU7Ag=; b=ps06rBS2nmtts4
	20ZStxCXlSJNhjofyPcMSbXnX9jwhDGLLX9bgtCi63hPOrAJg1osw1J7mfcjr1AkWuX6MfpSVBUq0
	8FEMNHA65gQgp890wCx0K1Ig/fuMtFpzF6curiaohwX6dO+2gaBRsWJ8XkcyzzjsehHH57S4Jp56a
	TDxba0fYl9gufVZ1Wbz+vfL4lAlnkwZNlKGPHTb3m7A06zVuRAvHxHynscLNU7vCv0z92IBXJQt49
	dYkiqCFp2WDjWqWfFMv4NgRbvAJghn4IhCZZJCEIwTf74JOkUZoMArY+p6pmb6bBrcUVC+6wzSbcM
	KQMnU8+m0UIblQZ+05Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDIXv-00Dkjn-0L;
	Wed, 13 Dec 2023 06:16:39 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDIXr-00DkhY-2K
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 06:16:37 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c9f7fe6623so82631301fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 22:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702448192; x=1703052992; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCLT5UxX3ic1D8SnaFGchw7AZpD/VDB8rMNC+FjYo/c=;
        b=clpk0NhwYYq5oOKJ/02VrkFB9XpWMssWcim3wqXVE0vzLe4hAWUkYNON4/sfsGzoEG
         OihrwhF4jpiZv0CrOA1VaeebN1cOH0wh/NBosknHufx4mohH4C/CRJyFTa9QbcXRJx/Y
         FypDhVnF3Gd9Q9hqcEO5jBwFjzrKFG4TYHe/azSRjBknJ96EV/OGA/VeoXZnSwBbYfC+
         4RKD1W0h/soehaL+nsN5N+afYbwn3tmJhbCq1TA6iTTU9w/Al/08B5msyTA4cACJszFJ
         /fDVsPkEf2TZTb2+K/wlii3KeQzk5HEF+/K3B4fF0vxOXHSlEgGMQhh0V/RCQAWwJW0m
         LSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702448192; x=1703052992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCLT5UxX3ic1D8SnaFGchw7AZpD/VDB8rMNC+FjYo/c=;
        b=UqO3Exly1L0nYTSfqTD95FwkGsEciyX3eXieB9zkIS6ia9Q2SgtjwnPjdnrerOY73Z
         TQj7ePShF7zCcvJj8wDBI8rAgjjhGRrX1w2NnbT7eX5AXKHmk4iFigw8en1R0lI/xQWi
         eN6S8lveldFB30uEPQURf6Awvwv6yLEl46FhA/VkM3gXKjcyV+Hcv4kCvphjCjTUHj7+
         5Ke135DBFhyw/1kY25Ss4ntjhU6j4mVD7y8aD3ErKQOBj1KwjqD8pDTfKbKp4/lVZDYs
         iMkQF0kgayYs7Mv5NJnl9/EzO5DJgavybHPqfY4t90mVHXkdFd27K8EgYbRUEQBC2NTx
         PeuA==
X-Gm-Message-State: AOJu0YyvFoZ+32FpzSxSR0PQn6yROG8JzJ5o75F1l6/SmsHr/e31nFuH
	W9uN5lc1MnO07VbVbDgP6KuYxAq0j1P+iPcB7/tWeQ==
X-Google-Smtp-Source: AGHT+IGyghldClfn31V0MQMWGLZzCGALUHqlVVAMFgcmDYeLOD49X5FAOoL1dW4PLVS+GqzsYn0uP2igPy0TYL4nAIk=
X-Received: by 2002:a19:f717:0:b0:50b:e576:ea2b with SMTP id
 z23-20020a19f717000000b0050be576ea2bmr2067249lfe.126.1702448191950; Tue, 12
 Dec 2023 22:16:31 -0800 (PST)
MIME-Version: 1.0
References: <20231024132655.730417-1-cleger@rivosinc.com> <20231024132655.730417-5-cleger@rivosinc.com>
In-Reply-To: <20231024132655.730417-5-cleger@rivosinc.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 13 Dec 2023 11:46:19 +0530
Message-ID: <CAK9=C2WJv4PX5FAAPUcttK4UDDNWdyNWmLG_zXwx60WrMgXO8Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] riscv: kvm: Use SYM_*() assembly macros instead of
 deprecated ones
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_221635_761361_FEBAB43F 
X-CRM114-Status: GOOD (  15.98  )
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

T24gVHVlLCBPY3QgMjQsIDIwMjMgYXQgNjo1OOKAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBFTlRSWSgpL0VORCgpL1dFQUsoKSBtYWNyb3MgYXJl
IGRlcHJlY2F0ZWQgYW5kIHdlIHNob3VsZCBtYWtlIHVzZSBvZiB0aGUKPiBuZXcgU1lNXyooKSBt
YWNyb3MgWzFdIGZvciBiZXR0ZXIgYW5ub3RhdGlvbiBvZiBzeW1ib2xzLiBSZXBsYWNlIHRoZQo+
IGRlcHJlY2F0ZWQgb25lcyB3aXRoIHRoZSBuZXcgb25lcyBhbmQgZml4IHdyb25nIHVzYWdlIG9m
IEVORCgpL0VORFBST0MoKQo+IHRvIGNvcnJlY3RseSBkZXNjcmliZSB0aGUgc3ltYm9scy4KPgo+
IFsxXSBodHRwczovL2RvY3Mua2VybmVsLm9yZy9jb3JlLWFwaS9hc20tYW5ub3RhdGlvbnMuaHRt
bAo+Cj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29t
Pgo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgoK
UXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYuOAoKVGhhbmtzLApBbnVwCgoKPiAtLS0KPiAg
YXJjaC9yaXNjdi9rdm0vdmNwdV9zd2l0Y2guUyB8IDI4ICsrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc3dpdGNoLlMgYi9hcmNoL3Jp
c2N2L2t2bS92Y3B1X3N3aXRjaC5TCj4gaW5kZXggZDc0ZGY4ZWI0ZDcxLi44YjE4NDczNzgwYWMg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zd2l0Y2guUwo+ICsrKyBiL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfc3dpdGNoLlMKPiBAQCAtMTUsNyArMTUsNyBAQAo+ICAgICAgICAgLmFs
dG1hY3JvCj4gICAgICAgICAub3B0aW9uIG5vcmVsYXgKPgo+IC1FTlRSWShfX2t2bV9yaXNjdl9z
d2l0Y2hfdG8pCj4gK1NZTV9GVU5DX1NUQVJUKF9fa3ZtX3Jpc2N2X3N3aXRjaF90bykKPiAgICAg
ICAgIC8qIFNhdmUgSG9zdCBHUFJzIChleGNlcHQgQTAgYW5kIFQwLVQ2KSAqLwo+ICAgICAgICAg
UkVHX1MgICByYSwgKEtWTV9BUkNIX0hPU1RfUkEpKGEwKQo+ICAgICAgICAgUkVHX1MgICBzcCwg
KEtWTV9BUkNIX0hPU1RfU1ApKGEwKQo+IEBAIC0yMDgsOSArMjA4LDkgQEAgX19rdm1fc3dpdGNo
X3JldHVybjoKPgo+ICAgICAgICAgLyogUmV0dXJuIHRvIEMgY29kZSAqLwo+ICAgICAgICAgcmV0
Cj4gLUVORFBST0MoX19rdm1fcmlzY3Zfc3dpdGNoX3RvKQo+ICtTWU1fRlVOQ19FTkQoX19rdm1f
cmlzY3Zfc3dpdGNoX3RvKQo+Cj4gLUVOVFJZKF9fa3ZtX3Jpc2N2X3VucHJpdl90cmFwKQo+ICtT
WU1fQ09ERV9TVEFSVChfX2t2bV9yaXNjdl91bnByaXZfdHJhcCkKPiAgICAgICAgIC8qCj4gICAg
ICAgICAgKiBXZSBhc3N1bWUgdGhhdCBmYXVsdGluZyB1bnByaXYgbG9hZC9zdG9yZSBpbnN0cnVj
dGlvbiBpcwo+ICAgICAgICAgICogNC1ieXRlIGxvbmcgYW5kIGJsaW5kbHkgaW5jcmVtZW50IFNF
UEMgYnkgNC4KPiBAQCAtMjMxLDEyICsyMzEsMTAgQEAgRU5UUlkoX19rdm1fcmlzY3ZfdW5wcml2
X3RyYXApCj4gICAgICAgICBjc3JyICAgIGExLCBDU1JfSFRJTlNUCj4gICAgICAgICBSRUdfUyAg
IGExLCAoS1ZNX0FSQ0hfVFJBUF9IVElOU1QpKGEwKQo+ICAgICAgICAgc3JldAo+IC1FTkRQUk9D
KF9fa3ZtX3Jpc2N2X3VucHJpdl90cmFwKQo+ICtTWU1fQ09ERV9FTkQoX19rdm1fcmlzY3ZfdW5w
cml2X3RyYXApCj4KPiAgI2lmZGVmIENPTkZJR19GUFUKPiAtICAgICAgIC5hbGlnbiAzCj4gLSAg
ICAgICAuZ2xvYmFsIF9fa3ZtX3Jpc2N2X2ZwX2Zfc2F2ZQo+IC1fX2t2bV9yaXNjdl9mcF9mX3Nh
dmU6Cj4gK1NZTV9GVU5DX1NUQVJUKF9fa3ZtX3Jpc2N2X2ZwX2Zfc2F2ZSkKPiAgICAgICAgIGNz
cnIgdDIsIENTUl9TU1RBVFVTCj4gICAgICAgICBsaSB0MSwgU1JfRlMKPiAgICAgICAgIGNzcnMg
Q1NSX1NTVEFUVVMsIHQxCj4gQEAgLTI3NiwxMCArMjc0LDkgQEAgX19rdm1fcmlzY3ZfZnBfZl9z
YXZlOgo+ICAgICAgICAgc3cgdDAsIEtWTV9BUkNIX0ZQX0ZfRkNTUihhMCkKPiAgICAgICAgIGNz
cncgQ1NSX1NTVEFUVVMsIHQyCj4gICAgICAgICByZXQKPiArU1lNX0ZVTkNfRU5EKF9fa3ZtX3Jp
c2N2X2ZwX2Zfc2F2ZSkKPgo+IC0gICAgICAgLmFsaWduIDMKPiAtICAgICAgIC5nbG9iYWwgX19r
dm1fcmlzY3ZfZnBfZF9zYXZlCj4gLV9fa3ZtX3Jpc2N2X2ZwX2Rfc2F2ZToKPiArU1lNX0ZVTkNf
U1RBUlQoX19rdm1fcmlzY3ZfZnBfZF9zYXZlKQo+ICAgICAgICAgY3NyciB0MiwgQ1NSX1NTVEFU
VVMKPiAgICAgICAgIGxpIHQxLCBTUl9GUwo+ICAgICAgICAgY3NycyBDU1JfU1NUQVRVUywgdDEK
PiBAQCAtMzE5LDEwICszMTYsOSBAQCBfX2t2bV9yaXNjdl9mcF9kX3NhdmU6Cj4gICAgICAgICBz
dyB0MCwgS1ZNX0FSQ0hfRlBfRF9GQ1NSKGEwKQo+ICAgICAgICAgY3NydyBDU1JfU1NUQVRVUywg
dDIKPiAgICAgICAgIHJldAo+ICtTWU1fRlVOQ19FTkQoX19rdm1fcmlzY3ZfZnBfZF9zYXZlKQo+
Cj4gLSAgICAgICAuYWxpZ24gMwo+IC0gICAgICAgLmdsb2JhbCBfX2t2bV9yaXNjdl9mcF9mX3Jl
c3RvcmUKPiAtX19rdm1fcmlzY3ZfZnBfZl9yZXN0b3JlOgo+ICtTWU1fRlVOQ19TVEFSVChfX2t2
bV9yaXNjdl9mcF9mX3Jlc3RvcmUpCj4gICAgICAgICBjc3JyIHQyLCBDU1JfU1NUQVRVUwo+ICAg
ICAgICAgbGkgdDEsIFNSX0ZTCj4gICAgICAgICBsdyB0MCwgS1ZNX0FSQ0hfRlBfRl9GQ1NSKGEw
KQo+IEBAIC0zNjIsMTAgKzM1OCw5IEBAIF9fa3ZtX3Jpc2N2X2ZwX2ZfcmVzdG9yZToKPiAgICAg
ICAgIGZzY3NyIHQwCj4gICAgICAgICBjc3J3IENTUl9TU1RBVFVTLCB0Mgo+ICAgICAgICAgcmV0
Cj4gK1NZTV9GVU5DX0VORChfX2t2bV9yaXNjdl9mcF9mX3Jlc3RvcmUpCj4KPiAtICAgICAgIC5h
bGlnbiAzCj4gLSAgICAgICAuZ2xvYmFsIF9fa3ZtX3Jpc2N2X2ZwX2RfcmVzdG9yZQo+IC1fX2t2
bV9yaXNjdl9mcF9kX3Jlc3RvcmU6Cj4gK1NZTV9GVU5DX1NUQVJUKF9fa3ZtX3Jpc2N2X2ZwX2Rf
cmVzdG9yZSkKPiAgICAgICAgIGNzcnIgdDIsIENTUl9TU1RBVFVTCj4gICAgICAgICBsaSB0MSwg
U1JfRlMKPiAgICAgICAgIGx3IHQwLCBLVk1fQVJDSF9GUF9EX0ZDU1IoYTApCj4gQEAgLTQwNSw0
ICs0MDAsNSBAQCBfX2t2bV9yaXNjdl9mcF9kX3Jlc3RvcmU6Cj4gICAgICAgICBmc2NzciB0MAo+
ICAgICAgICAgY3NydyBDU1JfU1NUQVRVUywgdDIKPiAgICAgICAgIHJldAo+ICtTWU1fRlVOQ19F
TkQoX19rdm1fcmlzY3ZfZnBfZF9yZXN0b3JlKQo+ICAjZW5kaWYKPiAtLQo+IDIuNDIuMAo+Cj4K
PiAtLQo+IGt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKPiBrdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJp
c2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
