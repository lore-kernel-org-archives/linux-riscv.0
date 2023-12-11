Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0268C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 08:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gWGf5Ls8myqGsHcB1mpaQbPdMwEf681sA4Ivkr3v3Ow=; b=QD+n5V76GsyZm1
	PtLke/ksPYjClF1rgWTXmQl3NCeCfY4HqKgf2lDbtHGFkQsjrydQeqtcSUE0wO2RYhUYjIWUWiVJ3
	MnMgxVhXEwtEzTc1thuJmtZyEZs7TWxaCp+YEtdiHyW40LhErMYlo07JP/VcBQTUJsKK5PLONy3DG
	42OlmWrHxbNXiOvXsrK71+tj60i6amo876Tk8xHgUVSui9CmhOeiSDEuecfQGdJlXP4Awd0cFtzXv
	Y0cdSOZI4YwWdkpa9Db/5VEac6TgoKaakNcK4QpKGL11OrAeE+yyTtuGUJ3KZLgws6BkeFmiVeZu+
	rk1dCLU6KBJXZye7I26A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCbrL-004NCI-0x;
	Mon, 11 Dec 2023 08:41:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCbrF-004N9v-2e
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 08:41:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 865FACE0F7F
	for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 08:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201DBC433D9
	for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 08:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702284103;
	bh=yUXy5KMGAXSGc2rYF6QzrrccUQw8a5P/gu1jqOP4kTY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SqRbPNZi3Tzo1WjiBzZGiLtX2/w8UDGCBsHDl9dsCqAqNgnLrfiWj3xXdNW4M4sfa
	 nHqHvcspUfdyjSS0lY/QEFAWu9Sp1x+BxCI/frlVeS02S4YfVi/GIREBpfkEWnsjUC
	 uS44fMmoINQKQ9HQSIrnhPDHeWAHw6ElZsw9n7BVAZy1I26UKzmT4vXSuT0WWtjJfR
	 DswCh7Sdg1U0EaJPbVZR7/yZmr8bOfCdgLZO1nqEfF8U1FQBQGmfqH4TYwjZxdPEZ1
	 uu7e+gOMcZ/f1wUBsiX/cjYcV4kEqV/ACUWX5Qa34BBtfWuNre0R4kPN3wOFl2NW7o
	 dOk8w84gLVLpw==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-54c9116d05fso5849823a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 00:41:43 -0800 (PST)
X-Gm-Message-State: AOJu0Yw2TaCROZxI8ghaw4Eze9YZ+Q47+4a+UT3R4Nq4QQ3wBXuzAyb/
	SUo4M3oItRNCwMe6VDKiAZ8ilC8/NTYIE3sf+fA=
X-Google-Smtp-Source: AGHT+IHV09gn3uQwbmW4lHx+slaNMCE8kXMnmmfEp+gPk1a+gEbxMnAq96j16hTduHEvWLxgZ3w96DTajZR3GrRECyQ=
X-Received: by 2002:a17:907:7f1f:b0:a19:d40a:d1fd with SMTP id
 qf31-20020a1709077f1f00b00a19d40ad1fdmr1448805ejc.201.1702284101520; Mon, 11
 Dec 2023 00:41:41 -0800 (PST)
MIME-Version: 1.0
References: <20231208151036.2458921-1-guoren@kernel.org> <CAHVXubjfuKZ1PBYQ8By41OX65YpAma3_kmSL7urT8L0PmMxFnQ@mail.gmail.com>
In-Reply-To: <CAHVXubjfuKZ1PBYQ8By41OX65YpAma3_kmSL7urT8L0PmMxFnQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 11 Dec 2023 16:41:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSB-4hDo8ncSLVKvbnOOEwLSrV716kQM9d9HrzXFs7D8A@mail.gmail.com>
Message-ID: <CAJF2gTSB-4hDo8ncSLVKvbnOOEwLSrV716kQM9d9HrzXFs7D8A@mail.gmail.com>
Subject: Re: [PATCH] riscv: pgtable: Enhance set_pte to prevent OoO risk
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, akpm@linux-foundation.org, 
	catalin.marinas@arm.com, willy@infradead.org, david@redhat.com, 
	muchun.song@linux.dev, will@kernel.org, peterz@infradead.org, rppt@kernel.org, 
	paulmck@kernel.org, atishp@atishpatra.org, anup@brainfault.org, alex@ghiti.fr, 
	mike.kravetz@oracle.com, dfustini@baylibre.com, wefu@redhat.com, 
	jszhang@kernel.org, falcon@tinylab.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_004146_236151_EBAB2389 
X-CRM114-Status: GOOD (  29.79  )
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

T24gTW9uLCBEZWMgMTEsIDIwMjMgYXQgMTo1MuKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBIaSBHdW8sCj4KPiBPbiBGcmksIERlYyA4LCAy
MDIzIGF0IDQ6MTDigK9QTSA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEZyb206
IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBXaGVuIGNoYW5naW5n
IGZyb20gYW4gaW52YWxpZCBwdGUgdG8gYSB2YWxpZCBvbmUgZm9yIGEga2VybmVsIHBhZ2UsCj4g
PiB0aGVyZSBpcyBubyBuZWVkIGZvciB0bGJfZmx1c2guIEl0J3Mgb2theSBmb3IgdGhlIFRTTyBt
ZW1vcnkgbW9kZWwsIGJ1dAo+ID4gdGhlcmUgaXMgYW4gT29PIHJpc2sgZm9yIHRoZSBXZWFrIG9u
ZS4gZWc6Cj4gPgo+ID4gc2QgdDAsIChhMCkgLy8gYTAgPSBwdGUgYWRkcmVzcywgcHRldmFsIGlz
IGNoYW5nZWQgZnJvbSBpbnZhbGlkIHRvIHZhbGlkCj4gPiAuLi4KPiA+IGxkIHQxLCAoYTEpIC8v
IGExID0gdmEgb2YgYWJvdmUgcHRlCj4gPgo+ID4gSWYgdGhlIGxkIGluc3RydWN0aW9uIGlzIGV4
ZWN1dGVkIHNwZWN1bGF0aXZlbHkgYmVmb3JlIHRoZSBzZAo+ID4gaW5zdHJ1Y3Rpb24uIFRoZW4g
aXQgd291bGQgYnJpbmcgYW4gaW52YWxpZCBlbnRyeSBpbnRvIHRoZSBUTEIsIGFuZCB3aGVuCj4g
PiB0aGUgbGQgaW5zdHJ1Y3Rpb24gcmV0aXJlZCwgYSBzcHVyaW91cyBwYWdlIGZhdWx0IG9jY3Vy
cmVkLiBCZWNhdXNlIHRoZQo+ID4gdm1lbW1hcCBoYXMgYmVlbiBpZ25vcmVkIGJ5IHZtYWxsb2Nf
ZmF1bHQsIHRoZSBzcHVyaW91cyBwYWdlIGZhdWx0IHdvdWxkCj4gPiBjYXVzZSBrZXJuZWwgcGFu
aWMuCj4gPgo+ID4gVGhpcyBwYXRjaCB3YXMgaW5zcGlyZWQgYnkgdGhlIGNvbW1pdDogN2YwYjFi
ZjA0NTExICgiYXJtNjQ6IEZpeCBiYXJyaWVycwo+ID4gdXNlZCBmb3IgcGFnZSB0YWJsZSBtb2Rp
ZmljYXRpb25zIikuIEZvciBSSVNDLVYsIHRoZXJlIGlzIG5vIHJlcXVpcmVtZW50Cj4gPiBpbiB0
aGUgc3BlYyB0byBndWFyYW50ZWUgYWxsIHRsYiBlbnRyaWVzIGFyZSB2YWxpZCBhbmQgbm8gcmVx
dWlyZW1lbnQgdG8KPiA+IFBUVyBmaWx0ZXIgb3V0IGludmFsaWQgZW50cmllcy4gT2YgY291cnNl
LCBtaWNyby1hcmNoIGNvdWxkIGdpdmUgYSBtb3JlCj4gPiByb2J1c3QgZGVzaWduLCBidXQgaGVy
ZSwgdXNlIGEgc29mdHdhcmUgZmVuY2UgdG8gZ3VhcmFudGVlLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6
IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wZ3RhYmxlLmggfCA3ICsrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0
YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+IGluZGV4IDI5NDA0
NDQyOWU4ZS4uMmZhZTVhNTQzOGUwIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5o
Cj4gPiBAQCAtNTExLDYgKzUxMSwxMyBAQCBzdGF0aWMgaW5saW5lIGludCBwdGVfc2FtZShwdGVf
dCBwdGVfYSwgcHRlX3QgcHRlX2IpCj4gPiAgc3RhdGljIGlubGluZSB2b2lkIHNldF9wdGUocHRl
X3QgKnB0ZXAsIHB0ZV90IHB0ZXZhbCkKPiA+ICB7Cj4gPiAgICAgICAgICpwdGVwID0gcHRldmFs
Owo+ID4gKwo+ID4gKyAgICAgICAvKgo+ID4gKyAgICAgICAgKiBPbmx5IGlmIHRoZSBuZXcgcHRl
IGlzIHByZXNlbnQgYW5kIGtlcm5lbCwgb3RoZXJ3aXNlIFRMQgo+ID4gKyAgICAgICAgKiBtYWlu
dGVuYW5jZSBvciB1cGRhdGVfbW11X2NhY2hlKCkgaGF2ZSB0aGUgbmVjZXNzYXJ5IGJhcnJpZXJz
Lgo+ID4gKyAgICAgICAgKi8KPiA+ICsgICAgICAgaWYgKHB0ZV92YWwocHRldmFsKSAmIChfUEFH
RV9QUkVTRU5UIHwgX1BBR0VfR0xPQkFMKSkKPiA+ICsgICAgICAgICAgICAgICBSSVNDVl9GRU5D
RShydyxydyk7Cj4KPiBPbmx5IGEgc2ZlbmNlLnZtYSBjYW4gZ3VhcmFudGVlIHRoYXQgdGhlIFBU
VyBhY3R1YWxseSBzZWVzIGEgbmV3Cj4gbWFwcGluZywgYSBmZW5jZSBpcyBub3QgZW5vdWdoLiBU
aGF0IGJlaW5nIHNhaWQsIG5ldyBrZXJuZWwgbWFwcGluZ3MKPiAodm1hbGxvYyBvbmVzKSBhcmUg
Y29ycmVjdGx5IGhhbmRsZWQgaW4gdGhlIGtlcm5lbCBieSB1c2luZwo+IGZsdXNoX2NhY2hlX3Zt
YXAoKS4gRGlkIHlvdSBvYnNlcnZlIHNvbWV0aGluZyB0aGF0IHRoaXMgcGF0Y2ggZml4ZXM/ClRo
eCBmb3IgdGhlIHJlcGx5IQoKVGhlIHNmZW5jZS52bWEgaXMgdG9vIGV4cGVuc2l2ZSwgc28gdGhl
IHNpdHVhdGlvbiBpcyB0cmlja3kuIFNlZSB0aGUKYXJtNjQgY29tbWl0OiA3ZjBiMWJmMDQ1MTEg
KCJhcm02NDogRml4IGJhcnJpZXJzIHVzZWQgZm9yIHBhZ2UgdGFibGUKbW9kaWZpY2F0aW9ucyIp
LCB3aGljaCBpcyBzaW1pbGFyLiBUaGF0IGlzLCBsaW51eCBhc3N1bWVzIGludmFsaWQgcHRlCndv
bid0IGdldCBpbnRvIFRMQi4gVGhpbmsgYWJvdXQgbWVtb3J5IGhvdHBsdWc6CgptbS9zcGFyc2Uu
Yzogc3BhcnNlX2FkZF9zZWN0aW9uKCkgewouLi4KICAgICAgICBtZW1tYXAgPSBzZWN0aW9uX2Fj
dGl2YXRlKG5pZCwgc3RhcnRfcGZuLCBucl9wYWdlcywgYWx0bWFwLCBwZ21hcCk7CiAgICAgICAg
aWYgKElTX0VSUihtZW1tYXApKQogICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIobWVtbWFw
KTsKCiAgICAgICAgLyoKICAgICAgICAgKiBQb2lzb24gdW5pbml0aWFsaXplZCBzdHJ1Y3QgcGFn
ZXMgaW4gb3JkZXIgdG8gY2F0Y2ggaW52YWxpZCBmbGFncwogICAgICAgICAqIGNvbWJpbmF0aW9u
cy4KICAgICAgICAgKi8KICAgICAgICBwYWdlX2luaXRfcG9pc29uKG1lbW1hcCwgc2l6ZW9mKHN0
cnVjdCBwYWdlKSAqIG5yX3BhZ2VzKTsKLi4uCn0KVGhlIHNlY3Rpb25fYWN0aXZhdGUgd291bGQg
dXNlIHNldF9wdGUgdG8gc2V0dXAgdm1lbW1hcCwgYW5kCnBhZ2VfaW5pdF9wb2lzb24gd291bGQg
YWNjZXNzIHRoZXNlIHBhZ2VzJyBzdHJ1Y3QuCgpUaGF0IG1lYW5zOgpzZCB0MCwgKGEwKSAvLyBh
MCA9IHN0cnVjdCBwYWdlJ3MgcHRlIGFkZHJlc3MsIHB0ZXZhbCBpcyBjaGFuZ2VkIGZyb20KaW52
YWxpZCB0byB2YWxpZAogLi4uCmx3L3N3IHQxLCAoYTEpIC8vIGExID0gdmEgb2Ygc3RydWN0IHBh
Z2UKCklmIHRoZSBsdy9zdyBpbnN0cnVjdGlvbiBpcyBleGVjdXRlZCBzcGVjdWxhdGl2ZWx5IGJl
Zm9yZSB0aGUgc2V0X3B0ZSwKd2UgbmVlZCBhIGZlbmNlIHRvIHByZXZlbnQgdGhpcy4KCj4KPiBU
aGFua3MsCj4KPiBBbGV4Cj4KPiA+ICB9Cj4gPgo+ID4gIHZvaWQgZmx1c2hfaWNhY2hlX3B0ZShw
dGVfdCBwdGUpOwo+ID4gLS0KPiA+IDIuNDAuMQo+ID4KCgoKLS0gCkJlc3QgUmVnYXJkcwogR3Vv
IFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
