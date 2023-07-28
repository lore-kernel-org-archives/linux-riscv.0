Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D869FC001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 17:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xjHtgwG+PMLkvYDJx3VfMEVjxEGeu5Cm3rcuW8x59RY=; b=KqCmgUwfxSiloc
	Ecb7CKW5Rvud4wdIA3Ey/pIvm2zxUaT9rFnRm0cCQgnQG83CdjD8QhgsefdLQQRn+f+aiQsAuOiMj
	7toO9E35jIyUOEjm623JfWP8sJBVS/J2pJVespDN8AKq/SM1SFhJFEw+KiVziTeRchWFsjxDWGo4r
	CRQLMaxTdaI48XuitPWhr2aB7X33UNVSO56wdCxqekXY2vz/rd+gUOBw2jjUZt3g6dokO7NuR1kFG
	1jx14CzdGtqMTBPP/qiksnSrhSLFM/3npDECZRlBIKLfRZIoiKcmGGa/UBKIcUPKPgXUd5x6GRQhE
	X3GvTDAvjkFab11Smt7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPReR-004Kdm-0N;
	Fri, 28 Jul 2023 17:53:19 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPReN-004Kbl-2c
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 17:53:17 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3460770afe2so7165ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 10:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690566791; x=1691171591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsIHLPb5okBWXJf2DtS76Y92BZwwFSzgLVO6RcujWsQ=;
        b=dtdPiasbgn7CaqvxkgS3cosIxhKaD7PdNI4nHup/Mt+FArUPs4kuQQNpIZHJItnBiy
         yOqBDtVdIN0uZpwAh+C6NKhqrAH7nxnm+Bl22M2vUM/p1ubXV4AiSDC9dnIr5AxdTou0
         kzxM5iVxPfYWqxeR1ivufNCcn/nkNGQ0s11RRlmZiqVs53VN9Xrqn1iqGw1eWvrnWycS
         sJgAwtpJ/yhA+254E2CbjGcn4IXCSCg/D72dF4TwHsgnMJxz7kpPK1zeOsFr/vkqkXJo
         ga4i1v6ZpMGL4ECLEcii9uTg2DGiR7/QEA5eLmKR10HGjXkndlW04IAEC8cZyEB0oTbc
         0THw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690566791; x=1691171591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsIHLPb5okBWXJf2DtS76Y92BZwwFSzgLVO6RcujWsQ=;
        b=ked0p0IKjaSmR/oXintnjarc17JLD3F+/lqgM1jHgVZZvLRqf92U9zGDSgJE34MUDx
         D0VNFC40O3sY022Fb0rUJKkHvw2F1+hm9D7p6iYBy2IxZYCurAVVQFya4XsXas5HWItP
         ovcCVjizITr6xl5nPJqwcWzPm9rnFogqGjbc/MrI7QQ5IbObD6MLQYvCoatDZks9QgY3
         g7BtbqfHTzsgZ9hu/GjQy912GFuwYylOJgMXw2GhtKvRGwCBxunbsRYMhMPeUsu3yUld
         QgggTocRveWJos2s/LSjI44oAH3XEsW72rbdMJJNFtRquw8RpZflIfsS/8yuHKGGlUFv
         aDcg==
X-Gm-Message-State: ABy/qLaOe3G1Vi8gmwiw3p0leA14bd1RoJeDudSYvhwsvOpCkavnsLPC
	E08J7nPIuWVkDePr8wBDkM0LR4GcvRmHYpxsYPGJVg==
X-Google-Smtp-Source: APBJJlEDh03sKgpDB0dKs6Z85qIKrMbTr+Ye9aruBFA5yuWJzcNZnvHEOZQeaHI6jnTYkiNFcm6HvFJcJmmT2PwfIAQ=
X-Received: by 2002:a05:6e02:b48:b0:33d:8e80:4c2f with SMTP id
 f8-20020a056e020b4800b0033d8e804c2fmr16633ilu.20.1690566791205; Fri, 28 Jul
 2023 10:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230727141428.962286-1-alexghiti@rivosinc.com> <20230727141428.962286-10-alexghiti@rivosinc.com>
In-Reply-To: <20230727141428.962286-10-alexghiti@rivosinc.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 28 Jul 2023 10:52:59 -0700
Message-ID: <CAP-5=fU5XYXrVnRUidpwjV2LiTsdebfidL43_Qo4Z7TBxMsVGA@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] tools: lib: perf: Implement riscv mmap support
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_105315_845833_66ECF57B 
X-CRM114-Status: GOOD (  19.08  )
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

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgNzoyOOKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiByaXNjdiBub3cgc3VwcG9ydHMgbW1hcGluZyBo
YXJkd2FyZSBjb3VudGVycyBzbyBhZGQgd2hhdCdzIG5lZWRlZCB0bwo+IHRha2UgYWR2YW50YWdl
IG9mIHRoYXQgaW4gbGlicGVyZi4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8
YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4KPiBSZXZpZXdlZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEBy
aXZvc2luYy5jb20+Cj4gLS0tCj4gIHRvb2xzL2xpYi9wZXJmL21tYXAuYyB8IDY1ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDY1
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS90b29scy9saWIvcGVyZi9tbWFwLmMgYi90
b29scy9saWIvcGVyZi9tbWFwLmMKPiBpbmRleCAwZDE2MzRjZWRmNDQuLjM3OGExNjNmMDU1NCAx
MDA2NDQKPiAtLS0gYS90b29scy9saWIvcGVyZi9tbWFwLmMKPiArKysgYi90b29scy9saWIvcGVy
Zi9tbWFwLmMKPiBAQCAtMzkyLDYgKzM5Miw3MSBAQCBzdGF0aWMgdTY0IHJlYWRfcGVyZl9jb3Vu
dGVyKHVuc2lnbmVkIGludCBjb3VudGVyKQo+Cj4gIHN0YXRpYyB1NjQgcmVhZF90aW1lc3RhbXAo
dm9pZCkgeyByZXR1cm4gcmVhZF9zeXNyZWcoY250dmN0X2VsMCk7IH0KPgo+ICsjZWxpZiBfX3Jp
c2N2X3hsZW4gPT0gNjQKClRoaXMgaXMgc29tZXRoaW5nIG9mIGFuIG9kZCBndWFyZCwgcGVyaGFw
czoKI2VsaWYgZGVmaW5lZChfX3Jpc2N2KSAmJiBfX3Jpc2N2X3hsZW4gPT0gNjQKClRoYXQgd2F5
IGl0IGlzIG1vcmUgaW50ZW50aW9uIHJldmVhbGluZyB0aGF0IHRoaXMgaXMgcmlzY3YgY29kZS4g
Q291bGQKeW91IGFkZCBhIGNvbW1lbnQgcmVsYXRpbmcgdG8gdGhlIF9fcmlzY3ZfeGxlbiA/Cgo+
ICsKPiArLyogVE9ETzogaW1wbGVtZW50IHJ2MzIgc3VwcG9ydCAqLwo+ICsKPiArI2RlZmluZSBD
U1JfQ1lDTEUgICAgICAweGMwMAo+ICsjZGVmaW5lIENTUl9USU1FICAgICAgIDB4YzAxCj4gKwo+
ICsjZGVmaW5lIGNzcl9yZWFkKGNzcikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gKyh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIHJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcgX192
OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICBfX2FzbV9f
IF9fdm9sYXRpbGVfXyAoImNzcnIgJTAsICIgI2NzciAgICAgICAgICBcCj4gKyAgICAgICAgICAg
ICAgICA6ICI9ciIgKF9fdikgOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAr
ICAgICAgICAgICAgICAgIDogIm1lbW9yeSIpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAoKVG8gYXZvaWQgdGhlIG1hY3JvIHBhc3RpbmcgdGhhdCBjb3VsZCBwb3RlbnRpYWxs
eSBnbyB3ZWlyZCwgY291bGQgdGhpcyBiZToKCl9fYXNtX18gX192b2xhdGlsZV9fICgiY3NyciAl
MCwgJTEiLAogIDogIj1yIihfX3YpIC8qIG91dHB1dHMgKi8KICA6ICJpIihjc3IpIC8qIGlucHV0
cyAqLwogIDogIm1lbW9yeSIgLyogY2xvYmJlcnMgKi8pCgpBbHNvLCB3aHkgaXMgdGhpcyBjbG9i
YmVyaW5nIG1lbW9yeT8gV29ydGggYWRkaW5nIGEgY29tbWVudC4KClRoYW5rcywKSWFuCgo+ICsg
ICAgICAgICAgICAgICAgX192OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gK30pCj4gKwo+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBjc3JfcmVhZF9udW0oaW50
IGNzcl9udW0pCj4gK3sKPiArI2RlZmluZSBzd2l0Y2hjYXNlX2Nzcl9yZWFkKF9fY3NyX251bSwg
X192YWwpICAgICAgICAgICB7XAo+ICsgICAgICAgY2FzZSBfX2Nzcl9udW06ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICBfX3ZhbCA9IGNzcl9yZWFk
KF9fY3NyX251bSk7ICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICBicmVhazsgfQo+ICsj
ZGVmaW5lIHN3aXRjaGNhc2VfY3NyX3JlYWRfMihfX2Nzcl9udW0sIF9fdmFsKSAgICAgICAgIHtc
Cj4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkKF9fY3NyX251bSArIDAsIF9fdmFsKSAgICAg
ICAgXAo+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZChfX2Nzcl9udW0gKyAxLCBfX3ZhbCl9
Cj4gKyNkZWZpbmUgc3dpdGNoY2FzZV9jc3JfcmVhZF80KF9fY3NyX251bSwgX192YWwpICAgICAg
ICAge1wKPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRfMihfX2Nzcl9udW0gKyAwLCBfX3Zh
bCkgICAgICBcCj4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzIoX19jc3JfbnVtICsgMiwg
X192YWwpfQo+ICsjZGVmaW5lIHN3aXRjaGNhc2VfY3NyX3JlYWRfOChfX2Nzcl9udW0sIF9fdmFs
KSAgICAgICAgIHtcCj4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzQoX19jc3JfbnVtICsg
MCwgX192YWwpICAgICAgXAo+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF80KF9fY3NyX251
bSArIDQsIF9fdmFsKX0KPiArI2RlZmluZSBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzE2KF9fY3NyX251
bSwgX192YWwpICAgICAgICB7XAo+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF84KF9fY3Ny
X251bSArIDAsIF9fdmFsKSAgICAgIFwKPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRfOChf
X2Nzcl9udW0gKyA4LCBfX3ZhbCl9Cj4gKyNkZWZpbmUgc3dpdGNoY2FzZV9jc3JfcmVhZF8zMihf
X2Nzcl9udW0sIF9fdmFsKSAgICAgICAge1wKPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRf
MTYoX19jc3JfbnVtICsgMCwgX192YWwpICAgICBcCj4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9y
ZWFkXzE2KF9fY3NyX251bSArIDE2LCBfX3ZhbCl9Cj4gKwo+ICsgICAgICAgdW5zaWduZWQgbG9u
ZyByZXQgPSAwOwo+ICsKPiArICAgICAgIHN3aXRjaCAoY3NyX251bSkgewo+ICsgICAgICAgc3dp
dGNoY2FzZV9jc3JfcmVhZF8zMihDU1JfQ1lDTEUsIHJldCkKPiArICAgICAgIGRlZmF1bHQ6Cj4g
KyAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVybiBy
ZXQ7Cj4gKyN1bmRlZiBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzMyCj4gKyN1bmRlZiBzd2l0Y2hjYXNl
X2Nzcl9yZWFkXzE2Cj4gKyN1bmRlZiBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzgKPiArI3VuZGVmIHN3
aXRjaGNhc2VfY3NyX3JlYWRfNAo+ICsjdW5kZWYgc3dpdGNoY2FzZV9jc3JfcmVhZF8yCj4gKyN1
bmRlZiBzd2l0Y2hjYXNlX2Nzcl9yZWFkCj4gK30KPiArCj4gK3N0YXRpYyB1NjQgcmVhZF9wZXJm
X2NvdW50ZXIodW5zaWduZWQgaW50IGNvdW50ZXIpCj4gK3sKPiArICAgICAgIHJldHVybiBjc3Jf
cmVhZF9udW0oQ1NSX0NZQ0xFICsgY291bnRlcik7Cj4gK30KPiArCj4gK3N0YXRpYyB1NjQgcmVh
ZF90aW1lc3RhbXAodm9pZCkKPiArewo+ICsgICAgICAgcmV0dXJuIGNzcl9yZWFkX251bShDU1Jf
VElNRSk7Cj4gK30KPiArCj4gICNlbHNlCj4gIHN0YXRpYyB1NjQgcmVhZF9wZXJmX2NvdW50ZXIo
dW5zaWduZWQgaW50IGNvdW50ZXIgX19tYXliZV91bnVzZWQpIHsgcmV0dXJuIDA7IH0KPiAgc3Rh
dGljIHU2NCByZWFkX3RpbWVzdGFtcCh2b2lkKSB7IHJldHVybiAwOyB9Cj4gLS0KPiAyLjM5LjIK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
