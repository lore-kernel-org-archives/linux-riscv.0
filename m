Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2E0EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 19:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ntGLXHG84y8jKwRdIjWcWh22g44mlqBnFfOVW84Jnmg=; b=FZ+DBjJ65WEZ6o
	eTq8nfni6D8xxMwRLUVXQLKkDSbY0Zu75lqiESAxSat1QT0Na4+cdrCe3fi0S/xs+x+b2yWgy7fF7
	4tg60pG8eKqjCKGijipdwaPuelxqWDtw66dqcledHLIItTimYgqGWOt45BNSQ0UtbP85JF1bCmQtX
	mgnSPIQwN/+78Rh+B1+uXLVsSLe7guDZzumeOoQsVspJhIQpCwNsTYpqJ+5eFYsi35JDm2zGCDC+i
	gWYj6W5l9EqyKMBUfuDJGKt+P/+2mbosVyZarvaIUjGexcF2VS89tTfcp3RoKnunQv4GDY3yYBWIJ
	c8dea3K2W25PAdsXl/lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBKBO-009H38-1O;
	Mon, 19 Jun 2023 19:04:58 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBKBL-009H1N-1G
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 19:04:56 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b45d7ec066so38916651fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 12:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1687201492; x=1689793492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzpzSXcJNt2GDsK+43ZK/uSItcMyByB0gXZwcs2zWL8=;
        b=J+1cLliv98rSFofa+UWME4RIq3zdyYTQID1sx8+kCq375XpPJUIxBmH3CQmHSo5//J
         AXopCQue+A08F1XKUy2fqH+FNllGbTBqChD63/ZpHSBbldtk/a12adQjMkLqUXJ/Sqtg
         4TW9AD4/AZeM6efGebdhSVVz6pM7uYPUwaUnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687201492; x=1689793492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzpzSXcJNt2GDsK+43ZK/uSItcMyByB0gXZwcs2zWL8=;
        b=Lf9jigobX0i1K3/GVG8nKrwRbNDfzG9yRhYFZb9tiotT4iGHdU3QgaENF077wLmJdv
         bx8k9wdmY5WkqOj7iwjlhsvjO8PVJiQ3v0LCtkV0kbGzh5s7iQtb7InrdtIfUv7OEvzJ
         cjKGm0DM9xrsJfzduRW8RCfIvoHykbHicGFillrOhGAoYB0xN65Ssmeh6ARn+mrXZj0J
         PqpF86UQTjY2b54PUZmWnjjROWaBb2/cmPe5d0WJYL9pUu5FnbxbUd5FESsXBmJLU2WU
         TIyunrq2CnqhJnRk9ziddLUYFZO8M+JLYuBMYYjdUGMOI1O07/JgZwe7Tm8/bcEkWlOM
         eZsw==
X-Gm-Message-State: AC+VfDz1sUB7bdw/mndZRJCfH0Qbcg2exrdW1YFlXW14tBSYSh0aLmCM
	qdVOe52aI8GgsGPK+b2kKQbZHPLZEDJn5zBn326j
X-Google-Smtp-Source: ACHHUZ7mHJJ87PwuPguZaHHd3DMLuZqOQ6pWQ+agtvn/ioD9AatxkbRT2bjyFtLUK8knzNEhF5INROqnVrw3kM/Wp3M=
X-Received: by 2002:a2e:8e2b:0:b0:2b4:5d74:d760 with SMTP id
 r11-20020a2e8e2b000000b002b45d74d760mr2474899ljk.25.1687201492189; Mon, 19
 Jun 2023 12:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-10-alexghiti@rivosinc.com> <CAOnJCU+n0O9oQmd1Vs3kimaBai7vbaf5RiMRFyvphCCLCGMB1A@mail.gmail.com>
 <CAHVXubgGqRLN3cb=eEW8zXHto6ZqJGg4LoFi=rEnuBCztYtV=w@mail.gmail.com>
In-Reply-To: <CAHVXubgGqRLN3cb=eEW8zXHto6ZqJGg4LoFi=rEnuBCztYtV=w@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 19 Jun 2023 12:04:40 -0700
Message-ID: <CAOnJCUKCMRrj6HQbj5XGTKRsu8pwcg3Yg5zwGw6mPwMS_q-U8A@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] tools: lib: perf: Implement riscv mmap support
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_120455_427088_22C403C2 
X-CRM114-Status: GOOD (  25.05  )
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

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgMjowNuKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAxNiwgMjAyMyBhdCAxMDo0
M+KAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRpc2hwYXRyYS5vcmc+IHdyb3RlOgo+ID4KPiA+
IE9uIEZyaSwgTWF5IDEyLCAyMDIzIGF0IDI6MDPigK9BTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhn
aGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiByaXNjdiBub3cgc3VwcG9ydCBt
bWFwaW5nIGhhcmR3YXJlIGNvdW50ZXJzIHNvIGFkZCB3aGF0J3MgbmVlZGVkIHRvCj4gPiA+IHRh
a2UgYWR2YW50YWdlIG9mIHRoYXQgaW4gbGlicGVyZi4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1i
eTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+ID4gPiAtLS0KPiA+
ID4gIHRvb2xzL2xpYi9wZXJmL21tYXAuYyB8IDY1ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCsp
Cj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS90b29scy9saWIvcGVyZi9tbWFwLmMgYi90b29scy9s
aWIvcGVyZi9tbWFwLmMKPiA+ID4gaW5kZXggMGQxNjM0Y2VkZjQ0Li42NWYyNTBlMGVmOTIgMTAw
NjQ0Cj4gPiA+IC0tLSBhL3Rvb2xzL2xpYi9wZXJmL21tYXAuYwo+ID4gPiArKysgYi90b29scy9s
aWIvcGVyZi9tbWFwLmMKPiA+ID4gQEAgLTM5Miw2ICszOTIsNzEgQEAgc3RhdGljIHU2NCByZWFk
X3BlcmZfY291bnRlcih1bnNpZ25lZCBpbnQgY291bnRlcikKPiA+ID4KPiA+ID4gIHN0YXRpYyB1
NjQgcmVhZF90aW1lc3RhbXAodm9pZCkgeyByZXR1cm4gcmVhZF9zeXNyZWcoY250dmN0X2VsMCk7
IH0KPiA+ID4KPiA+ID4gKyNlbGlmIF9fcmlzY3ZfeGxlbiA9PSA2NAo+ID4gPiArCj4gPgo+ID4g
VGhpcyBpcyBhcHBsaWNhYmxlIGZvciBSVjMyIGFzIHdlbGwuIE5vID8KPiA+IG90aGVyd2lzZSwg
eW91IHdvbid0IG5lZWQgQ1NSX0NZQ0xFSAo+Cj4gQWRtaXR0ZWRseSwgSSBoYXZlIG5vdCBjaGVj
a2VkIHJ2MzIgYXQgYWxsIGluIHRoaXMgc2VyaWVzIGFuZCB0aGUgY29kZQo+IGJlbG93IGlzIGEg
Y29weS1wYXN0ZS4gSSdkIHNheSB0aGF0IHJ2MzIgc3VwcG9ydCBpcyBvdXQgb2Ygc2NvcGUgZm9y
Cj4gdGhpcyBzZXJpZXMsIGlzIHRoYXQgb2sgd2l0aCB5b3U/Cj4KClRoYXQncyBmaW5lLiBMZXQn
cyBqdXN0IHJlbW92ZSB0aGUgQ1lDTEVIIGFuZCBsZWF2ZSBhIFRPRE8gY29tbWVudCBmb3IgUlYz
Mi4KCj4gPgo+ID4gPiArI2RlZmluZSBDU1JfQ1lDTEUgICAgICAweGMwMAo+ID4gPiArI2RlZmlu
ZSBDU1JfVElNRSAgICAgICAweGMwMQo+ID4gPiArI2RlZmluZSBDU1JfQ1lDTEVIICAgICAweGM4
MAo+ID4gPiArCj4gPiA+ICsjZGVmaW5lIGNzcl9yZWFkKGNzcikgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICsoeyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICsgICAgICAgcmVn
aXN0ZXIgdW5zaWduZWQgbG9uZyBfX3Y7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
PiA+ICsgICAgICAgICAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoImNzcnIgJTAsICIgI2Nz
ciAgICAgICAgICBcCj4gPiA+ICsgICAgICAgICAgICAgICAgOiAiPXIiIChfX3YpIDogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICsgICAgICAgICAgICAgICAgOiAibWVt
b3J5Iik7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICsgICAgICAg
ICAgICAgICAgX192OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gPiA+ICt9KQo+ID4gPiArCj4gPiA+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBjc3JfcmVhZF9u
dW0oaW50IGNzcl9udW0pCj4gPiA+ICt7Cj4gPiA+ICsjZGVmaW5lIHN3aXRjaGNhc2VfY3NyX3Jl
YWQoX19jc3JfbnVtLCBfX3ZhbCkgICAgICAgICAgIHtcCj4gPiA+ICsgICAgICAgY2FzZSBfX2Nz
cl9udW06ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiArICAgICAgICAg
ICAgICAgX192YWwgPSBjc3JfcmVhZChfX2Nzcl9udW0pOyAgICAgICAgICAgIFwKPiA+ID4gKyAg
ICAgICAgICAgICAgIGJyZWFrOyB9Cj4gPiA+ICsjZGVmaW5lIHN3aXRjaGNhc2VfY3NyX3JlYWRf
MihfX2Nzcl9udW0sIF9fdmFsKSAgICAgICAgIHtcCj4gPiA+ICsgICAgICAgc3dpdGNoY2FzZV9j
c3JfcmVhZChfX2Nzcl9udW0gKyAwLCBfX3ZhbCkgICAgICAgIFwKPiA+ID4gKyAgICAgICBzd2l0
Y2hjYXNlX2Nzcl9yZWFkKF9fY3NyX251bSArIDEsIF9fdmFsKX0KPiA+ID4gKyNkZWZpbmUgc3dp
dGNoY2FzZV9jc3JfcmVhZF80KF9fY3NyX251bSwgX192YWwpICAgICAgICAge1wKPiA+ID4gKyAg
ICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzIoX19jc3JfbnVtICsgMCwgX192YWwpICAgICAgXAo+
ID4gPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRfMihfX2Nzcl9udW0gKyAyLCBfX3ZhbCl9
Cj4gPiA+ICsjZGVmaW5lIHN3aXRjaGNhc2VfY3NyX3JlYWRfOChfX2Nzcl9udW0sIF9fdmFsKSAg
ICAgICAgIHtcCj4gPiA+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF80KF9fY3NyX251bSAr
IDAsIF9fdmFsKSAgICAgIFwKPiA+ID4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzQoX19j
c3JfbnVtICsgNCwgX192YWwpfQo+ID4gPiArI2RlZmluZSBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzE2
KF9fY3NyX251bSwgX192YWwpICAgICAgICB7XAo+ID4gPiArICAgICAgIHN3aXRjaGNhc2VfY3Ny
X3JlYWRfOChfX2Nzcl9udW0gKyAwLCBfX3ZhbCkgICAgICBcCj4gPiA+ICsgICAgICAgc3dpdGNo
Y2FzZV9jc3JfcmVhZF84KF9fY3NyX251bSArIDgsIF9fdmFsKX0KPiA+ID4gKyNkZWZpbmUgc3dp
dGNoY2FzZV9jc3JfcmVhZF8zMihfX2Nzcl9udW0sIF9fdmFsKSAgICAgICAge1wKPiA+ID4gKyAg
ICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzE2KF9fY3NyX251bSArIDAsIF9fdmFsKSAgICAgXAo+
ID4gPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRfMTYoX19jc3JfbnVtICsgMTYsIF9fdmFs
KX0KPiA+ID4gKwo+ID4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgcmV0ID0gMDsKPiA+ID4gKwo+
ID4gPiArICAgICAgIHN3aXRjaCAoY3NyX251bSkgewo+ID4gPiArICAgICAgIHN3aXRjaGNhc2Vf
Y3NyX3JlYWRfMzIoQ1NSX0NZQ0xFLCByZXQpCj4gPiA+ICsgICAgICAgc3dpdGNoY2FzZV9jc3Jf
cmVhZF8zMihDU1JfQ1lDTEVILCByZXQpCj4gPiA+ICsgICAgICAgZGVmYXVsdDoKPiA+ID4gKyAg
ICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiArICAgICAgIH0KPiA+ID4gKwo+ID4gPiArICAgICAg
IHJldHVybiByZXQ7Cj4gPiA+ICsjdW5kZWYgc3dpdGNoY2FzZV9jc3JfcmVhZF8zMgo+ID4gPiAr
I3VuZGVmIHN3aXRjaGNhc2VfY3NyX3JlYWRfMTYKPiA+ID4gKyN1bmRlZiBzd2l0Y2hjYXNlX2Nz
cl9yZWFkXzgKPiA+ID4gKyN1bmRlZiBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzQKPiA+ID4gKyN1bmRl
ZiBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzIKPiA+ID4gKyN1bmRlZiBzd2l0Y2hjYXNlX2Nzcl9yZWFk
Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyB1NjQgcmVhZF9wZXJmX2NvdW50ZXIodW5z
aWduZWQgaW50IGNvdW50ZXIpCj4gPiA+ICt7Cj4gPiA+ICsgICAgICAgcmV0dXJuIGNzcl9yZWFk
X251bShDU1JfQ1lDTEUgKyBjb3VudGVyKTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiArc3RhdGlj
IHU2NCByZWFkX3RpbWVzdGFtcCh2b2lkKQo+ID4gPiArewo+ID4gPiArICAgICAgIHJldHVybiBj
c3JfcmVhZF9udW0oQ1NSX1RJTUUpOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICAjZWxzZQo+ID4g
PiAgc3RhdGljIHU2NCByZWFkX3BlcmZfY291bnRlcih1bnNpZ25lZCBpbnQgY291bnRlciBfX21h
eWJlX3VudXNlZCkgeyByZXR1cm4gMDsgfQo+ID4gPiAgc3RhdGljIHU2NCByZWFkX3RpbWVzdGFt
cCh2b2lkKSB7IHJldHVybiAwOyB9Cj4gPiA+IC0tCj4gPiA+IDIuMzcuMgo+ID4gPgo+ID4KPiA+
Cj4gPiAtLQo+ID4gUmVnYXJkcywKPiA+IEF0aXNoCgoKCi0tIApSZWdhcmRzLApBdGlzaAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
