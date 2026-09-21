Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00CAC982DE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 03:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m8ovdR2+v2/9wlUxddTVSS8M9Bo+ZBUXih4tT/3VbEY=; b=lSZbgX4kJXpLqO
	NptPd8M6yVd7VwYP18y+VUN3aidSnbhY74aoBgSb62HD1cjhmxHjS0PNk6bT59m2yfHsqO12acbKf
	ICUx3Y/qOnBQFmGu2ZFVsfRsywnpg4zz40Ap6e6XBCBdXxxfyFIYGtdiU4ry6Z1wWNMwa3VFVcsHY
	QuyIaZYcEafw08LVuYJtPbBo9E1+9I71DwarZ99x0R6KIyem9W8BOQETd4ZegSGPlbJU4t+eD5BRl
	gGre5WUHtvIYv6Ee+bmIpk2EAKhs2nT2aYsJM5gptacmCgH+GIGZxUIY2b/VhX5YkPHyiIzMNX3Ed
	GzlALQgvpt4O66jDLkMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8V1Y-00000000mxW-00IR;
	Mon, 21 Sep 2026 03:49:00 +0000
Received: from mail-wm2-x07.google.com ([2a00:1450:4864:31::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8V1U-00000000mwz-1eZ8
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 03:48:58 +0000
Received: by mail-wm2-x07.google.com with SMTP id 5b1f17b1804b1-49e66652cc3so14216585e9.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 20:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789962534; x=1790567334; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1KYgZDmTeWYBCLjsf9i2xkGlcAMywzsXeJh/ZsALZqc=;
        b=fpUFZZluTNMMgWTNSBHuQR9LSEvs9iP1eanH7vdsP4Lf//8ThVvjEhFiR9EGFy9tJj
         ows3qsnxm7bGKD/4RS957uvBry6y//OC/Cf62ac28+N51+OKD9CwgzWduoNtttWgyVC9
         WQX6lUDLjKC0hSEU9Ym7MoHjtcsRLoO7AKvFgl4uT7VTFi4fxo1XtI7MtvyIN9IxsPhT
         yRvBCKuqKNVcThKopSqTLWZF1JbVsINHnnCgTUJIirJhKPFwtqHJTtq5h7u/ji0vTQmg
         HQ35+1wsztJGtLKCgvCrPr2qUImT5+c9l8KCjXqGe/8qWQzOWsPCONryd/ISVOHVsP6y
         373Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789962534; x=1790567334;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1KYgZDmTeWYBCLjsf9i2xkGlcAMywzsXeJh/ZsALZqc=;
        b=16AVbYNGW5l5U6K1bxJv5NmcPGG0wkIEv6f13+uQwAb/ZkUjP6Q3mVukEG+lVf3u7y
         eSxCBaNob89akeuIR3E90U7/mjOv7exrX1AwfSjc49+tNYCYLZLkEE5715EtjJKv55oR
         He7A5qDhpDrhLsgrt2VmB93a7kZaR+RdWJlYJK2XPvtG8hQ0kkPKjzaz+bqMl+qgV4ZM
         osVhZoyznTAHsG6zUANOlKNEDnrZrIa6lOlYMEk6KeeKj1LhvurjNQ0IYPTemhf5WTMV
         4k0MdC1B36yXynexEykSpfrtzMpK9miwN0giPNeYTsPheX43CFmQiOFmuIsv4eNs93v6
         smLg==
X-Forwarded-Encrypted: i=1; AKwUvBzLfyNIruOxgBWH0QeFASQRBfxs8HLGzaG6FU5B+oUZ/rWiVkz+MUm+FDFD1iMxaG7JVbwUgaqlMMyQcw==@lists.infradead.org
X-Gm-Message-State: AFuF++n+a4ab+SYD92PNws3Fa28wShR2nUMl09t+40AZ2EGTzmpgz51b
	5N2gjEh1HHyU0s/UTYzEpHb7PKtaMoJzpJQLBdhLJMQ9qoUCjZlrKYBDs0MieZqc
X-Gm-Gg: AYBFou3KwXbzRdtWSstyNBZVP9nLYB+Z/srq2UKCeDfFtLIRgl0Lt9zovcTIfwgiGwK
	cwsYnS26dd/QBJ5odPkGwN/MQX4Npe8gZjZ32W6/1ZFbeTOb1KD3eyyoLe4A9dTmh4S6D4hmecA
	NdPR7HxsL9ttTuGfxTWOgZ0psjP8hEY1eX1581Q80Vx9QLTfFXEHsXLcP1LYRIN7D5Nr8rZRQ2o
	TcjUZYm0LBNOg0vATY3rjnx1x/zKQ+P0y/syTp90dK8Rh24x7skn95hqO922wYFLOtQEup7eDE5
	GLFkUzXfxeA711tZW1onYkefD1x5MBeO7gQcRODnneYQ5GDc0hRrk1zykbw3IDeQxdqNSg03pVb
	Uf7lycmuNNlypudrNtugOklLea/hJz040FWcaa8ZbX6TxTWLMLJNeOU1PmOD8N5OxF/MgtSJjQH
	JN8nk6MDlE0ZfiDw0s2UQAJqQe9+YCHT9Ch939hBqmJnQ8x662FLAFE7gNo+G+TgsTRnjnheTTj
	EVyyizwbzubPo1zWxqyy7mzIZbr4SBtYd21+24lTHQwc3uqa+P+GJhHd62vgke198v7pHVhwhMn
	CG3S/2dA3NTebVuTNMMOSLzRycHZT9LWC2Exxg==
X-Received: by 2002:a05:600c:46c5:b0:49c:fc6e:8cb4 with SMTP id 5b1f17b1804b1-49fc5743bb7mr125721885e9.24.1789962533860;
        Sun, 20 Sep 2026 20:48:53 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0f8563sm222102405e9.6.2026.09.20.20.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 20:48:53 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 21 Sep 2026 05:48:52 +0200
Message-Id: <DLKORFKGW8D8.XVSVVIH3Q6Q@gmail.com>
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Siddharth Chintamaneni" <sidchintamaneni@gmail.com>,
 <bpf@vger.kernel.org>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Anton Protopopov"
 <a.s.protopopov@gmail.com>, "Puranjay Mohan" <puranjay@kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-s390@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <rlmenge@gmail.com>,
 <hargar@linux.microsoft.com>, <apais@microsoft.com>
Subject: Re: [PATCH bpf-next v1 0/7] Fix timed may_goto with private stacks
X-Mailer: aerc 0.21.0
References: <20260904195132.141068-1-sidchintamaneni@gmail.com>
In-Reply-To: <20260904195132.141068-1-sidchintamaneni@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_204856_472716_D72A8135 
X-CRM114-Status: GOOD (  23.87  )
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

T24gRnJpIFNlcCA0LCAyMDI2IGF0IDk6NTEgUE0gQ0VTVCwgU2lkZGhhcnRoIENoaW50YW1hbmVu
aSB3cm90ZToKPiBKZXJlbXkgcmVwb3J0ZWQgYSBidWdbMV0gd2hpbGUgZXhlY3V0aW5nIGEgQlBG
IHByb2dyYW0gY29udGFpbmluZwo+IHRpbWVkX21heV9nb3RvIGluc3RydWN0aW9ucyB3aXRoIHBy
aXZhdGUgc3RhY2tzLgo+Cj4gdGltZWRfbWF5X2dvdG9bMl0gaXMgYSBydW50aW1lIHNhZmV0eSBt
ZWNoYW5pc20gdGhhdCBhbGxvd3MgQlBGCj4gcHJvZ3JhbXMgdG8gZXhlY3V0ZSBsb25nZXIgbG9v
cHNbM10uIFRoZSBCUEYgdmVyaWZpZXIgcmVwbGFjZXMgZWFjaAo+IG1heV9nb3RvIGluc3RydWN0
aW9uIHdpdGggYSBsb29wIGNvdW50ZXIgaW5pdGlhbGl6ZWQgdG8gMHhmZmZmIGFuZCBhCj4gdGlt
ZXN0YW1wIGNoZWNrWzRdIHRoYXQgdGVybWluYXRlcyB0aGUgbG9vcCBhZnRlciAyNTAgbXMuCj4K
PiBQcml2YXRlIHN0YWNrc1s1XSBhbGxvdyBCUEYgcHJvZ3JhbXMgdG8gdXNlIHBlci1DUFUgbWVt
b3J5IGluc3RlYWQgb2YKPiBjb25zdW1pbmcgbW9yZSBvZiB0aGUgbmF0aXZlIGtlcm5lbCBzdGFj
ayB3aGVuIEJQRiBwcm9ncmFtcyBhcmUgZGVlcGx5Cj4gbmVzdGVkLgo+Cj4gVG8gbWFrZSB0aW1l
ZCBtYXlfZ290byB3b3JrLCB0aGUgQlBGIHByb2dyYW0gcmVzZXJ2ZXMgMTYgYnl0ZXMgb2Ygc3Rh
Y2sKPiBzcGFjZS4gVGhlIGZpcnN0IDggYnl0ZXMgc3RvcmUgdGhlIGxvb3AgY291bnRlciBhbmQg
dGhlIG5leHQgOCBieXRlcwo+IHN0b3JlIHRoZSB0aW1lc3RhbXAuCj4KPiBBZnRlciB0aGUgbG9v
cCBjb3VudGVyIGlzIGV4aGF1c3RlZCwgYXJjaF9icGZfdGltZWRfbWF5X2dvdG8oKSBpcwo+IGNh
bGxlZC4gT24geDg2LCBpdCBhZGRzIHRoZSBjb3VudGVyJ3Mgc3RhY2sgb2Zmc2V0IHRvIFJCUCB0
byBvYnRhaW4gYQo+IHBvaW50ZXIgdG8gdGhlIGNvdW50ZXIgYW5kIHRpbWVzdGFtcFs2XS4gVGhp
cyB3b3JrcyB3aGVuIHRoZSBCUEYKPiBwcm9ncmFtIHVzZXMgdGhlIG5vcm1hbCBzdGFjayBiZWNh
dXNlIFJCUCBpcyBhbHNvIHRoZSBCUEYgZnJhbWUgcG9pbnRlci4KPgo+IFdoZW4gYSBwcml2YXRl
IHN0YWNrIGlzIHVzZWQsIHRoZSB4ODYgSklUIHVzZXMgUjkgYXMgdGhlIEJQRiBmcmFtZSBwb2lu
dGVyLgo+IFRoZSB2ZXJpZmllci1nZW5lcmF0ZWQgbG9hZHMgYW5kIHN0b3JlcyB0aGVyZWZvcmUg
YWNjZXNzIHRoZSBjb3VudGVyIGFuZAo+IHRpbWVzdGFtcCB0aHJvdWdoIFI5LiBIb3dldmVyLCBh
cmNoX2JwZl90aW1lZF9tYXlfZ290bygpIHN0aWxsIGFkZHMgdGhlCj4gb2Zmc2V0IHRvIFJCUCBh
bmQgYWNjZXNzZXMgYW4gdW5yZWxhdGVkIGxvY2F0aW9uIGluIHRoZSBuYXRpdmUgSklUIHN0YWNr
Cj4gZnJhbWUuIFRoaXMgaXMgdGhlIG1pc21hdGNoIEplcmVteSByZXBvcnRlZC4KPgo+IEZpeCB0
aGUgbWlzbWF0Y2ggYnkgcmVzb2x2aW5nIHRoZSBhZGRyZXNzIGluIHRoZSBnZW5lcmF0ZWQgQlBG
Cj4gaW5zdHJ1Y3Rpb25zOgo+Cj4gICAgICAgICBCUEZfUkVHX0FYID0gQlBGX1JFR19GUAo+ICAg
ICAgICAgQlBGX1JFR19BWCArPSBzdGFja19vZmZzZXQKPgo+IFRoZSBKSVQgY2FuIHRoZW4gc2Vs
ZWN0IHRoZSBjb3JyZWN0IEJQRiBmcmFtZSBwb2ludGVyIGJlZm9yZSBjYWxsaW5nCj4gYXJjaF9i
cGZfdGltZWRfbWF5X2dvdG8oKS4gVGhlIGZ1bmN0aW9uIHJlY2VpdmVzIHRoZSByZXNvbHZlZCBw
b2ludGVyCj4gaW5zdGVhZCBvZiByZWNvbnN0cnVjdGluZyBpdCBmcm9tIFJCUC4KPgo+IFRoZSBM
b29uZ0FyY2ggdGltZWQgbWF5X2dvdG8gaW1wbGVtZW50YXRpb24gaXMgY3VycmVudGx5IHF1ZXVl
ZCB0aHJvdWdoCj4gdGhlIGxvb25nYXJjaC1uZXh0IHRyZWVbN10sIHdoaWxlIGl0cyBzZWxmdGVz
dHMgd2VyZSBtZXJnZWQgc2VwYXJhdGVseQo+IHRocm91Z2ggdGhlIGJwZi1uZXh0IHRyZWVbOF0u
IFRoaXMgc2VyaWVzIGlzIGJhc2VkIG9uIGJwZi1uZXh0IGFuZAo+IHRoZXJlZm9yZSBkb2VzIG5v
dCBpbmNsdWRlIHRoZSBMb29uZ0FyY2ggdHJhbXBvbGluZSB1cGRhdGUuCj4KPiBbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwODI0MjEzMTU4LjM3NTU5MzItMi1KZXJlbXkuSmVh
bkBvc3MuY3liZXIuZ291di5mci8KPiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjUwMzA0MDAzMjM5LjIzOTA3NTEtMS1tZW14b3JAZ21haWwuY29tLwo+IFszXSBodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC92Ny4yLjIvc291cmNlL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2JwZi9saWJhcmVuYS9pbmNsdWRlL2JwZl9tYXlfZ290by5oI0w4Cj4gWzRdIGh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y3LjIuMi9zb3VyY2Uva2VybmVsL2JwZi9jb3JlLmMj
TDM0MDcKPiBbNV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmLzIwMjYwNDE3MDM0NjU4LjI2
MjUzNTMtMS15b25naG9uZy5zb25nQGxpbnV4LmRldi8KPiBbNl0gaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjcuMi4yL3NvdXJjZS9hcmNoL3g4Ni9uZXQvYnBmX3RpbWVkX21heV9n
b3RvLlMjTDE4Cj4gWzddIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xvb25nYXJjaC8yMDI2MDgw
NDE1MzkzOC4xNjEyOS0zLWRvbmd0YWkuZ3VvQGxpbnV4LmRldi8KPiBbOF0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYnBmLzIwMjYwODEzMDcwOTA2LjUxNjQtMS15YW5ndGllemh1QGxvb25nc29u
LmNuLwo+CgpJIHRoaW5rIHdlIGNhbiBrZWVwIHRoaXMgZml4IGxvY2FsIHRvIHg4Ni4gV291bGQg
YmUgbGVzcyBjaHVybiBpbiB0aGUgZW5kLgoKVGhlIHByb2JsZW0gaXMgdGhhdCB4ODYgc3dpdGNo
ZXMgdGhlIEJQRiBmcmFtZSBwb2ludGVyIGZyb20gUkJQIHRvIFI5IGZvcgpwcml2YXRlIHN0YWNr
cywgYnV0IHRoZSB0cmFtcG9saW5lIHN0aWxsIHVzZXMgUkJQLiBhcm02NCBhbmQgcG93ZXJwYzY0
IGtlZXAKdXNpbmcgWDI1IGFuZCBSMzEgcmVzcGVjdGl2ZWx5IGZvciBib3RoIHN0YWNrIG1vZGVz
LCBzbyB0aGVpciB0cmFtcG9saW5lcwphbHJlYWR5IHVzZSB0aGUgcmlnaHQgZnJhbWUgcG9pbnRl
ci4KCkluc3RlYWQgb2YgY2hhbmdpbmcgdGhlIGdlbmVyaWMgZml4dXAsIGNhbiB3ZSByZXNvbHZl
IHRoZSBwb2ludGVyIGluIHRoZSB4ODYgSklUCndoZW4gZW1pdHRpbmcgdGhlIGNhbGwgdG8gYXJj
aF9icGZfdGltZWRfbWF5X2dvdG8oKT8gV2UgYWxyZWFkeSBrbm93IHdoZXRoZXIKcHJpdl9mcmFt
ZV9wdHIgaXMgc2V0IHRoZXJlLiBSMTAgY29udGFpbnMgdGhlIG9mZnNldCBwYXNzZWQgdGhyb3Vn
aCBCUEZfUkVHX0FYLApzbyB3ZSBjYW4gZW1pdDoKCi8qIFByaXZhdGUgc3RhY2sgKi8KbGVhcSAo
JXI5LCAlcjEwKSwgJXIxMAoKLyogTm9ybWFsIHN0YWNrICovCmxlYXEgKCVyYnAsICVyMTApLCAl
cjEwCgpUaGVuIHJlbW92ZSB0aGUgTEVBIGZyb20gdGhlIHg4NiB0cmFtcG9saW5lLCBhcyBwYXRj
aCAyIGFscmVhZHkgZG9lcy4KClRoaXMgZ2l2ZXMgYnBmX2NoZWNrX3RpbWVkX21heV9nb3RvKCkg
dGhlIHNhbWUgYWRkcmVzcyB1c2VkIGJ5IHRoZSBnZW5lcmF0ZWQKbG9hZHMgYW5kIHN0b3Jlczog
dGhlIEJQRiBmcmFtZSBwb2ludGVyIHBsdXMgdGhlIGNvdW50ZXLigJlzIHN0YWNrIG9mZnNldC4g
Rm9yCm5vcm1hbCBzdGFja3MsIHdlIGp1c3QgbW92ZSB0aGUgZXhpc3RpbmcgY2FsY3VsYXRpb24g
aW50byB0aGUgSklULiBGb3IgcHJpdmF0ZQpzdGFja3MsIHdlIHVzZSBSOSBpbnN0ZWFkIG9mIFJC
UCwgd2hpY2ggZml4ZXMgdGhlIG1pc21hdGNoLgoKVGhlIGV4aXN0aW5nIHNhdmUvcmVzdG9yZSBv
ZiBSOSBhcm91bmQgdGhlIGNhbGwgc2hvdWxkIHN0YXkuIFdlIGFsc28gbGVhdmUgUkJQCmFsb25l
LCBzaW5jZSBpdCBpcyBzdGlsbCBuZWVkZWQgZm9yIHRoZSBuYXRpdmUgZnJhbWUgY2hhaW4gYW5k
IHVud2luZGluZy4KCkkgaGF2ZW7igJl0IHRlc3RlZCB0aGlzIGFwcHJvYWNoLCBzbyBpdCBzdGls
bCBuZWVkcyBjaGVja2luZyB3aXRoIGJvdGggbm9ybWFsIGFuZApwcml2YXRlIHN0YWNrcy4KCnB3
LWJvdDogY3IKCj4gU2lkZGhhcnRoIENoaW50YW1hbmVuaSAoNyk6Cj4gICBicGY6IEZpeCB0aW1l
ZCBtYXlfZ290byBzdGFjayBwb2ludGVyIGZvciBwcml2YXRlIHN0YWNrcwo+ICAgYnBmLCB4ODY6
IFVzZSByZXNvbHZlZCBwb2ludGVyIGZvciB0aW1lZCBtYXlfZ290bwo+ICAgYnBmLCBhcm02NDog
VXNlIHJlc29sdmVkIHBvaW50ZXIgZm9yIHRpbWVkIG1heV9nb3RvCj4gICBicGYsIHBvd2VycGM2
NDogVXNlIHJlc29sdmVkIHBvaW50ZXIgZm9yIHRpbWVkIG1heV9nb3RvCj4gICBicGYsIHJpc2N2
OiBVc2UgcmVzb2x2ZWQgcG9pbnRlciBmb3IgdGltZWQgbWF5X2dvdG8KPiAgIGJwZiwgczM5MDog
VXNlIHJlc29sdmVkIHBvaW50ZXIgZm9yIHRpbWVkIG1heV9nb3RvCj4gICBzZWxmdGVzdHMvYnBm
OiBUZXN0IHRpbWVkIG1heV9nb3RvIHdpdGggcHJpdmF0ZSBzdGFja3MKPgo+ICBhcmNoL2FybTY0
L25ldC9icGZfdGltZWRfbWF5X2dvdG8uUyAgICAgICAgICAgfCAxMiArKy0tLS0tLQo+ICBhcmNo
L3Bvd2VycGMvbmV0L2JwZl90aW1lZF9tYXlfZ290by5TICAgICAgICAgfCAgOCArKy0tLQo+ICBh
cmNoL3Jpc2N2L25ldC9icGZfdGltZWRfbWF5X2dvdG8uUyAgICAgICAgICAgfCAxMyArKysrLS0t
LQo+ICBhcmNoL3MzOTAvbmV0L2JwZl9qaXRfY29tcC5jICAgICAgICAgICAgICAgICAgfCAgNiAr
Ky0tCj4gIGFyY2gvczM5MC9uZXQvYnBmX3RpbWVkX21heV9nb3RvLlMgICAgICAgICAgICB8ICA4
ICsrLS0tCj4gIGFyY2gveDg2L25ldC9icGZfdGltZWRfbWF5X2dvdG8uUyAgICAgICAgICAgICB8
ICA2IC0tLS0KPiAga2VybmVsL2JwZi9maXh1cHMuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMTkgKysrKysrLS0tLS0tCj4gIC4uLi9icGYvcHJvZ3MvdmVyaWZpZXJfYnBmX2Zhc3RjYWxs
LmMgICAgICAgICB8IDMwICsrKysrKysrKystLS0tLS0tLS0KPiAgLi4uL3NlbGZ0ZXN0cy9icGYv
cHJvZ3MvdmVyaWZpZXJfbWF5X2dvdG9fMS5jIHwgMTcgKysrKysrLS0tLS0KPiAgLi4uL2JwZi9w
cm9ncy92ZXJpZmllcl9wcml2YXRlX3N0YWNrLmMgICAgICAgIHwgMTkgKysrKysrKysrKysrCj4g
IDEwIGZpbGVzIGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKyksIDYzIGRlbGV0aW9ucygtKQo+Cj4K
PiBiYXNlLWNvbW1pdDogZDc2MTkzNGM5NDgzZWNkZTkzZmU5OWQ4NzA1MjgyZjcxNmRmZWU1MAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
