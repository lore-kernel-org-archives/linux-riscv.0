Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0AEC4707C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 18:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UHx5h/TvoSFiMUnDOkAFyaBLxtnyCiOTu+vp8Q6ni1g=; b=bmnvX3TZZEUwFA
	HbFuRYoAuDcy4emrNvTiw7CUaKJ+gqiPms50NbIEqSuDZ3M0ySfqigNv8Y5Z7dLhs09OiFNvRqTcd
	oD+dIpZDi2pTVAfVeWaYVyj4up0kDNVU8J7/C2iLODm6MD/qWJm+GNjENLgaolfHH1hvLgvwvQ5uu
	q3RwXIUoUK4UDTAd6zZ3LSbpGuSAPuyZQY2Kq8/BkvDTCXN3AeRDbv8cyLKTJx7iPT0BrH7o1mqMQ
	GbAbFf1oXR5L0GP39SLBFdIqHv+faOrC2iEfOJW+ZiQQxWoJqWEs6WtGPSwapTu9vl+EEfZnmJAkm
	vwVjEw8mKVm6Ug6UEzzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOMXs-003djy-1I;
	Fri, 12 Jan 2024 18:46:20 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOMXp-003dj3-13
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 18:46:19 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50e7e55c0f6so8237717e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 10:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705085173; x=1705689973; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KaDZQeaE0qXDQXu0IekcYEof1gWfQyecGV2e3EyEUM=;
        b=SSSMB6I3IpOjSZbNvzHVo5s9QD3yo1FhBX0U6Rcnq5owaCW5ZP+QzrNssX0TZDEdWC
         JoopRdXUXgcuy/mzUeM9+BMbmMsrDErvMYojMnWfupC4+qD1idgLii4rbmbuXvqLnWDk
         0pkh4+/CFwhK74V+1EaS+RxyR6cUFn7FPtr2XMiwfIoVIjjrqgK1iGuK6D3H7lt88gaB
         P3qisrNd/nR/DofmjnSzdLeDki9LOCkRY9x511k+u0hZ5u6OeBBysETOXz0eR2Dqun1O
         Vp+EVIpm33yiYu7JGVdZ2KwQIUYbiYRzYC9TksPQU4TZv5rzNCdCGiIy4x4DBZe0YmhC
         TbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705085173; x=1705689973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KaDZQeaE0qXDQXu0IekcYEof1gWfQyecGV2e3EyEUM=;
        b=XjrzgHUNQaFFFcvZmsMVE8V3pm0B2+OIUKBU7a58+Qvh/9u2izYNGLT8R+mTe1Of8A
         N03ekIe9JSD0T+uFZ7moGa4ZLNgO9+Lq/KgsKRXeAO+K82BkMFKLvttGxuvyR+06tv/g
         lneOD6mlTdyjEwEE6oMJYnSctsfbtaU+VeylILSsTVVyOlUE/hYj3wtQyAIKQqa1k57q
         SYQdJJRW6gqDxTIYYL3abAlvR5tXuKWE4wKt6vKkANNWu4jdGtj56FVlPW+4Hk7BtcC3
         3X/Uc1IvHvnAJviWw3W6+wE/Z0ZD2Qn8pF4DYMy+UiZviUOyaDFV+w/RxWE4dlkyZqbF
         i/DQ==
X-Gm-Message-State: AOJu0Yy1I2hui91jih0LycNCGFS2hpVJXWLm00j155VwdgTM+AOb++Tf
	0OFp0eIK8knltuskrsz8menZbWHmdpCC8bW8gWo3jv7SSq92vg==
X-Google-Smtp-Source: AGHT+IHBZijORtnOmi4cGK2Us8qJQ/LYFGLsOj03KQBtFvlukenduv/l/FYd1o2FyAo63700OXBdMVDZKr26m4oNqaM=
X-Received: by 2002:ac2:4183:0:b0:50e:b206:c4df with SMTP id
 z3-20020ac24183000000b0050eb206c4dfmr416865lfh.82.1705085173341; Fri, 12 Jan
 2024 10:46:13 -0800 (PST)
MIME-Version: 1.0
References: <20240111131558.31211-1-andy.chiu@sifive.com> <170504103075.17535.16233182023874920613.git-patchwork-notify@kernel.org>
 <87o7dqsh80.fsf@all.your.base.are.belong.to.us> <CABgGipXYeE4J3226yoAU9J25eeP+vWofqL1mMYoD9axthJrk2Q@mail.gmail.com>
In-Reply-To: <CABgGipXYeE4J3226yoAU9J25eeP+vWofqL1mMYoD9axthJrk2Q@mail.gmail.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Sat, 13 Jan 2024 02:46:01 +0800
Message-ID: <CABgGipUYB1FO-kP3M1wfEkx9Y9RNu8fXW+4Qp-DASK=avVX=iA@mail.gmail.com>
Subject: Re: [v10, 00/10] riscv: support kernel-mode Vector
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	charlie@rivosinc.com, ardb@kernel.org, arnd@arndb.de, peterz@infradead.org, 
	tglx@linutronix.de, ebiggers@kernel.org, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_104617_393496_CB90DC6A 
X-CRM114-Status: GOOD (  29.33  )
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

SGkgQmrDtnJuLAoKT24gU2F0LCBKYW4gMTMsIDIwMjQgYXQgMTI6MDPigK9BTSBBbmR5IENoaXUg
PGFuZHkuY2hpdUBzaWZpdmUuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgSmFuIDEyLCAyMDI0IGF0
IDExOjI54oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+
ID4gQW5keSwKPiA+Cj4gPiA+IEhlbGxvOgo+ID4gPgo+ID4gPiBUaGlzIHNlcmllcyB3YXMgYXBw
bGllZCB0byByaXNjdi9saW51eC5naXQgKGZvci1uZXh0KQo+ID4gPiBieSBQYWxtZXIgRGFiYmVs
dCA8cGFsbWVyQHJpdm9zaW5jLmNvbT46Cj4gPiA+Cj4gPgo+ID4gSSdtIGdldHRpbmcgc29tZSBi
b290IGlzc3VlcyB3aXRoIHRoaXMgc2VyaWVzIGFwcGxpZWQgdG8gcmlzY3YvZm9yLW5leHQuCj4g
Pgo+ID4gVGhlIGZ1bGwgcnVucyAod2l0aCBsb2dzKSBpcyBoZXJlOgo+ID4gaHR0cHM6Ly9naXRo
dWIuY29tL2xpbnV4LXJpc2N2L2xpbnV4LXJpc2N2L2FjdGlvbnMvcnVucy83NDk4NzA2MzI2Cj4g
Pgo+ID4gVHlwaWNhbGx5IGl0IGZhaWxzIGluIHR3byB3YXlzOgo+ID4gVWJ1bnR1IHJvb3RmczoK
PiA+IC0tODwtLQo+ID4gWyA0LjM0NjQxNF0gKHNkLWdlbnMpWzY4XTogRmFpbGVkIHRvIGV4dHJh
Y3QgZmlsZSBuYW1lIGZyb20gJyc6IEludmFsaWQgYXJndW1lbnQKPiA+IFsgNC4zOTA4MzJdIHN5
c3RlbWRbMV06IEZhaWxlZCB0byBmb3JrIG9mZiBzYW5kYm94aW5nIGVudmlyb25tZW50IGZvciBl
eGVjdXRpbmcgZ2VuZXJhdG9yczogUHJvdG9jb2wgZXJyb3IKPiA+IFtFU0NbMDsxOzMxbSEhISEh
IUVTQ1swbV0gRmFpbGVkIHRvIHN0YXJ0IHVwIG1hbmFnZXIuCj4gPiBbIDQuNDQwMTY0XSBzeXN0
ZW1kWzFdOiBGcmVlemluZyBleGVjdXRpb24uCj4gPiAtLTg8LS0KPiA+Cj4gPiBvcjoKPiA+IC0t
ODwtLQo+ID4gWyAgIDE0LjkwOTkxMl0gKHNkLWdlbnMpWzcxXTogQXNzZXJ0aW9uICchc3Rydl9p
c2VtcHR5KGRpcnMpJyBmYWlsZWQgYXQgc3JjL3NoYXJlZC9leGVjLXV0aWwuYzoyMTEsIGZ1bmN0
aW9uIGV4ZWN1dGVfZGlyZWN0b3JpZXMoKS4gQWJvcnRpbmcuCj4gPiBbICAgMTUuMDA4NDgwXSBz
eXN0ZW1kWzFdOiBGYWlsZWQgdG8gZm9yayBvZmYgc2FuZGJveGluZyBlbnZpcm9ubWVudCBmb3Ig
ZXhlY3V0aW5nIGdlbmVyYXRvcnM6IFByb3RvY29sIGVycm9yCj4gPiBbRVNDWzA7MTszMW0hISEh
ISFFU0NbMG1dIEZhaWxlZCB0byBzdGFydCB1cCBtYW5hZ2VyLgo+ID4gWyAgIDE1LjExMTk4OV0g
c3lzdGVtZFsxXTogRnJlZXppbmcgZXhlY3V0aW9uLgo+ID4gLS04PC0tCj4gPgo+ID4gYW5kIEFs
cGluZSB3aXRoOgo+ID4gLS04PC0tCj4gPiBbIDAuMDM2NzAzXSBLZXJuZWwgcGFuaWMgLSBub3Qg
c3luY2luZzoga21lbV9jYWNoZV9jcmVhdGVfdXNlcmNvcHk6IEZhaWxlZCB0byBjcmVhdGUgc2xh
YiAncmlzY3ZfdmVjdG9yX2N0eCcuIEVycm9yIC0yMgo+ID4gWyAwLjAzOTE5NV0gQ1BVOiAwIFBJ
RDogMCBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQgNi43LjAtcmMxLWRlZmNvbmZpZ19wbGFp
bi1nZGY5NDQ3MDQxODJlICMxCj4gPiBbIDAuMDQwNzQ0XSBIYXJkd2FyZSBuYW1lOiByaXNjdi12
aXJ0aW8scWVtdSAoRFQpCj4gPiBbIDAuMDQxOTc1XSBDYWxsIFRyYWNlOgo+ID4gWyAwLjA0Mjgx
M10gWzxmZmZmZmZmZjgwMDA2N2E0Pl0gZHVtcF9iYWNrdHJhY2UrMHgxYy8weDI0Cj4gPiBbIDAu
MDQ0ODMyXSBbPGZmZmZmZmZmODA5NDU5ODA+XSBzaG93X3N0YWNrKzB4MmMvMHgzOAo+ID4gWyAw
LjA0NTcyNF0gWzxmZmZmZmZmZjgwOTUyMjE0Pl0gZHVtcF9zdGFja19sdmwrMHgzYy8weDU0Cj4g
PiBbIDAuMDQ2ODQxXSBbPGZmZmZmZmZmODA5NTIyNDA+XSBkdW1wX3N0YWNrKzB4MTQvMHgxYwo+
ID4gWyAwLjA0NzQyOF0gWzxmZmZmZmZmZjgwOTQ1ZTdjPl0gcGFuaWMrMHgxMDYvMHgyOWUKPiA+
IFsgMC4wNDc5OThdIFs8ZmZmZmZmZmY4MDE1ZjE0Yz5dIGttZW1fY2FjaGVfY3JlYXRlX3VzZXJj
b3B5KzB4MjBlLzB4MjU4Cj4gPiBbIDAuMDQ4Nzg2XSBbPGZmZmZmZmZmODBhMDQ0ZGM+XSByaXNj
dl92X3NldHVwX2N0eF9jYWNoZSsweDJjLzB4M2MKPiA+IFsgMC4wNDk1MjFdIFs8ZmZmZmZmZmY4
MGEwM2E0OD5dIGFyY2hfdGFza19jYWNoZV9pbml0KzB4MTAvMHgxOAo+ID4gWyAwLjA1NzgzMl0g
WzxmZmZmZmZmZjgwYTA3MDZjPl0gZm9ya19pbml0KzB4NDIvMHgxNjgKPiA+IFsgMC4wNTg3Mzdd
IFs8ZmZmZmZmZmY4MGEwMGQ3MD5dIHN0YXJ0X2tlcm5lbCsweDZiYS8weDczYQo+ID4gLS04PC0t
Cj4gPgo+ID4gVGhlIEFscGluZSBib290IGNhbiBiZSBmaXhlZCB3aXRoIHNvbWV0aGluZyBsaWtl
Ogo+ID4gLS04PC0tCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+ID4gaW5kZXggZjk3Njk3MDNmZDM5Li4wYWM3
OWE5Y2RiYTUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+ID4g
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMKPiA+IEBAIC01Myw2ICs1Myw5IEBAIGlu
dCByaXNjdl92X3NldHVwX3ZzaXplKHZvaWQpCj4gPgo+ID4gIHZvaWQgX19pbml0IHJpc2N2X3Zf
c2V0dXBfY3R4X2NhY2hlKHZvaWQpCj4gPiAgewo+ID4gKyAgICAgICBpZiAoIXJpc2N2X3ZfdnNp
emUpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKwo+ID4gICAgICAgICByaXNjdl92
X3VzZXJfY2FjaGVwID0ga21lbV9jYWNoZV9jcmVhdGVfdXNlcmNvcHkoInJpc2N2X3ZlY3Rvcl9j
dHgiLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmlzY3Zfdl92c2l6ZSwgMTYsIFNMQUJfUEFOSUMsCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLCByaXNjdl92X3Zz
aXplLCBOVUxMKTsKPiA+IC0tODwtLQo+Cj4gU29ycnkgZm9yIHRoYXQhIEkgZm9yZ290IHRvIGRv
IGEgaGFzX3ZlY3RvcigpIGNoZWNrIGJlZm9yZSBjcmVhdGluZwo+IHRoZSBjYWNoZS4gSSBhbSBn
b2luZyB0byBzZW5kIGEgcGF0Y2ggdG8gZml4IGl0Lgo+Cj4gPgo+ID4gYnV0IHdpdGggdGhpcyAi
Zml4IiBpbiBwbGFjZSBJIHN0aWxsIGdldCBVYnVudHUgYm9vdCBmYWlsdXJlcy4gVG8KPiA+IHJl
cHJvZHVjZSB0aGUgQ0kgbG9jYWxseToKPiA+Cj4gPiAgIHwgZ2l0IGZldGNoIGh0dHBzOi8vZ2l0
aHViLmNvbS9saW51eC1yaXNjdi9saW51eC1yaXNjdiBlMmFhZDc1YjM0MGQ2NWIwYmU0ZDFhNjg5
ZGIzZTEwYzZlZDNmMThlCj4gPiAgIHwgZ2l0IGNoZWNrb3V0IEZFVENIX0hFQUQKPiA+ICAgfCBk
b2NrZXIgcHVsbCBnaGNyLmlvL2xpbnV4LXJpc2N2L3B3LWJ1aWxkZXItbXVsdGk6bGF0ZXN0Cj4g
PiAgIHwgZG9ja2VyIHJ1biAtaXQgLS12b2x1bWUgJFBXRDovYnVpbGQvbXktbGludXggZ2hjci5p
by9saW51eC1yaXNjdi9wdy1idWlsZGVyLW11bHRpOmxhdGVzdCBiYXNoCj4gPiAgIHwgIyBJbiBj
b250YWluZXIKPiA+ICAgfCBiYXNoIC1sCj4gPiAgIHwgbWtkaXIgLXAgL2J1aWxkL2tlcm5lbHMv
bG9ncwo+ID4gICB8IC5naXRodWIvc2NyaXB0cy9zZXJpZXMvcHJlcGFyZV90ZXN0cy5zaAo+ID4g
ICB8IGNkIC9idWlsZC9teS1saW51eAo+ID4gICB8IC5naXRodWIvc2NyaXB0cy9zZXJpZXMva2Vy
bmVsX2J1aWxkZXIuc2ggcnY2NCBkZWZjb25maWcgcGxhaW4gZ2NjCj4gPiAgIHwgLmdpdGh1Yi9z
Y3JpcHRzL3Nlcmllcy90ZXN0X3J1bm5lci5zaCBydjY0IGRlZmNvbmZpZyBwbGFpbiBnY2MgdWJ1
bnR1Cj4gPiAgIHwgLmdpdGh1Yi9zY3JpcHRzL3Nlcmllcy90ZXN0X3J1bm5lci5zaCBydjY0IGRl
ZmNvbmZpZyBwbGFpbiBnY2MgYWxwaW5lCj4KPiBJdCdzIHdlaXJkIHRoYXQgdGhlc2UgZXJyb3Jz
IGRvIG5vdCBzaG93IHVwIGluIG15IHRlc3QgZW52aXJvbm1lbnQuIEkKPiB3aWxsIHRyeSB0byBy
ZXByb2R1Y2UgaXQgd2l0aCB0aGUgc2NyaXB0IGFib3ZlLgoKSSBqdXN0IGxvY2F0ZWQgdGhlIGJv
b3QgZmFpbCB3aXRoIHNvbWUgZXhwZXJpbWVudHMuIEl0IGlzIHJlbGF0ZWQgdG8KdGhlIGZhbGxi
YWNrIGxvZ2ljIGluIGVudGVyX3ZlY3Rvcl91c2VyY29weSgpLiBJdCBzZWVtcyBsaWtlIGJvb3Rp
bmcKaXMgc3VjY2Vzc2Z1bCBpZiB3ZSByZXN0YXJ0ZWQgc2NhbGFyIGZhbGxiYWNrIHdpdGggaXRz
IG9yaWdpbmFsIGNvcHkKc2l6ZS4gSXQgaXMgbm90IGFmZmVjdGluZyBwcmVlbXB0X3YgYmVjYXVz
ZSBwcmVlbXB0X3Ygd2lsbCBuZXZlciBnb2VzCmludG8gdGhpcyBicmFuY2guCgpJdCdzIGxhdGUg
Zm9yIG1lLiBJIHdpbGwgZmlndXJlIG91dCB0aGUgcmVhc29uIGFuZCBob3BlZnVsbHkgZml4IGl0
IGF0CnRoZSByb290IGNhdXNlIGluIHRoZSB3ZWVrZW5kLgoKLS0tIGEvYXJjaC9yaXNjdi9saWIv
cmlzY3Zfdl9oZWxwZXJzLmMKKysrIGIvYXJjaC9yaXNjdi9saWIvcmlzY3Zfdl9oZWxwZXJzLmMK
QEAgLTMwLDkgKzMwLDYgQEAgYXNtbGlua2FnZSBpbnQgZW50ZXJfdmVjdG9yX3VzZXJjb3B5KHZv
aWQgKmRzdCwgdm9pZAoqc3JjLCBzaXplX3QgbikKICAgICAgICBrZXJuZWxfdmVjdG9yX2VuZCgp
OwoKICAgICAgICBpZiAocmVtYWluKSB7Ci0gICAgICAgICAgICAgICBjb3BpZWQgPSBuIC0gcmVt
YWluOwotICAgICAgICAgICAgICAgZHN0ICs9IGNvcGllZDsKLSAgICAgICAgICAgICAgIHNyYyAr
PSBjb3BpZWQ7CiAgICAgICAgICAgICAgICBnb3RvIGZhbGxiYWNrOwogICAgICAgIH0KCj4KPiA+
Cj4gPiBMb2dzIGluIC9idWlsZC90ZXN0cy9ydW5fdGVzdCoKPiA+Cj4gPiBJJ2xsIGNvbnRpbnVl
IHRvIGRlYnVnIGluIHRoZSBtZWFudGltZS4KPiA+Cj4gPgo+ID4gQmrDtnJuCj4KPiBUaGFua3Ms
Cj4gQW5keQoKVGhhbmtzLApBbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
