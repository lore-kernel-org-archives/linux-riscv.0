Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC574CA600A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 07:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LV/rffxiZ6B7Lgkcj7UCH1KMwTboSIPe8YiJUMailrY=; b=i8tLyULSrN0lZS
	ng6xP1kjhgGRslp0iPJVvY5ioOgIbfdkuWfYBEhF5cA7Q+TIST4RVglGYAmATMCe0FbITmApDKrhF
	oMn2z0uQos/2eWGG21Mcf+OYleWlGzSW3wYF5y5+jM55CR2jMcs0Izam4PusODeMZUBBU525Uca0S
	4WiU4DrwhkGlTS8jOEPxUJVitY2xAWBU9/7wtUo7QJd7NTQ8vFDcQ2c37sffzikaH5f6YbWgYR3dE
	DNPmjKQW53y1yLiGTWVPNmVtAW8jbbB7f0mONf+wYCyiq6n/a3uG+llW4PkA63kC0JbRLp7N9qSWD
	VaXp8arzK09hmRszKGZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEib8-00000003l96-1D1W;
	Thu, 08 Oct 2026 07:31:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEib7-00000003l89-1mCZ
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 07:31:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 31E38437CF
	for <linux-riscv@lists.infradead.org>; Thu,  8 Oct 2026 07:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1664A1F000FF
	for <linux-riscv@lists.infradead.org>; Thu,  8 Oct 2026 07:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791444685;
	bh=hgXM43tHGPmwH3n7UjXTQnwb08aCbZO7DGfxBqk6R9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jO4vGZtE6LmIMsuh5rHP00aBNWAr7BDT+Nto/XNr6/eUzRVr5H04RJFb2qmWiVg8C
	 alIn8GLCP0Y9O2gjrI9JS5d/k3DDiYMPqK84R4GGSUFwabjYzYAicaKoAvQ6Yv98b6
	 JCvJ1TZovMe5DX0012A7qt7+4RCE8qw+G1vS+FBFB29cJfEtV3AZlZgT18aXORNdLU
	 oQsgqimlFD6VW0YcLX1I8YHU9N0eRsWB8mwnuxyuAK1h8LKuY9ePLKuMx8mgWYabXL
	 synVk4HJsszrN7bpZ3qN9ltqAsxUR+Ouym8S6aSaELHu5TCJuvZ7h/m0PchetHGZWD
	 n/BBRVMwOoEQw==
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so1875437f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 00:31:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxRsG7xKTd2s4XiJ5onfCV5YWFSliGpgfraqTie5Re1M9ymCqtRwlrcDAab1Kmgn5DaAUrC9YFPo7mNEQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIg8Gr3t+GEIxEVCj27MOsswzXBc76J1jIN1xFzrTbZJUgOFmQ5
	56mZSV8omIaDHl35ONug1pYmS4xvrI7306YhRP3z7JBILux6UXCH6GCzSP+HBYom8OdKrpr2zoj
	/VIyvJvCdeoUyFOhZeMi9k78Vw3cFBMY=
X-Received: by 2002:a05:6000:2304:b0:48c:7ab9:99cc with SMTP id
 ffacd0b85a97d-48c7ab99b74mr4162377f8f.52.1791444680209; Thu, 08 Oct 2026
 00:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-b4-thead-maintainers-tree-v1-1-12d077a36f4b@kernel.org>
In-Reply-To: <20260930-b4-thead-maintainers-tree-v1-1-12d077a36f4b@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 8 Oct 2026 15:31:04 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS7+GSsVBonCq90_uUnMXN2Cd-JuABzWRrTcOakX66kOA@mail.gmail.com>
X-Gm-Features: AclHuK8dDt6mXE6lOlv9oIXUWPqegYUdStdtkMcJ90S7CqFS2v3WIY1wq048jL8
Message-ID: <CAJF2gTS7+GSsVBonCq90_uUnMXN2Cd-JuABzWRrTcOakX66kOA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Move RISC-V T-Head SoC tree to kernel.org
To: Drew Fustini <fustini@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Fu Wei <wefu@redhat.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gVGh1LCBPY3QgMSwgMjAyNiBhdCAxOjEw4oCvQU0gRHJldyBGdXN0aW5pIDxmdXN0aW5pQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gVXBkYXRlIHRoZSBULUhlYWQgU29DIGVudHJ5IHRvIHJlZmxl
Y3QgdGhhdCB0aGUgYnJhbmNoZXMgYXJlIGhvc3RlZCBvbgo+IGtlcm5lbC5vcmcuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4KPiAtLS0KPiAgTUFJ
TlRBSU5FUlMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiBpbmRl
eCAzYTE5ZGE3NGQwMGMuLjdlOGI1OWUxZmMxOCAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+
ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTIzNjE5LDcgKzIzNjE5LDcgQEAgTTogICAgICBGdSBX
ZWkgPHdlZnVAcmVkaGF0LmNvbT4KPiAgTDogICAgIGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiAgUzogICAgIE1haW50YWluZWQKPiAgUTogICAgIGh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcHJvamVjdC9yaXNjdi10aGVhZC9saXN0Lwo+IC1UOiAgICAgZ2l0IGh0dHBzOi8v
Z2l0aHViLmNvbS9wZHA3L2xpbnV4LmdpdAo+ICtUOiAgICAgZ2l0IGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Z1c3RpbmkvbGludXguZ2l0Cj4gIEY6ICAg
ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svdGhlYWQsdGgxNTIwLWNs
ay1hcC55YW1sCj4gIEY6ICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZmly
bXdhcmUvdGhlYWQsdGgxNTIwLWFvbi55YW1sCj4gIEY6ICAgICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWFpbGJveC90aGVhZCx0aDE1MjAtbWJveC55YW1sCj4KPiAtLS0KPiBi
YXNlLWNvbW1pdDogY2VlOTM5NWFjZDgwNDNiZTA2NDRiMjVjMzRiZmE4NjYyM2YyYjkzNQo+IGNo
YW5nZS1pZDogMjAyNjA5MjktYjQtdGhlYWQtbWFpbnRhaW5lcnMtdHJlZS00NmYyZTY1OTBkZDgK
Pgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IERyZXcgRnVzdGluaSAoVGVuc3RvcnJlbnQpIDxmdXN0
aW5pQGtlcm5lbC5vcmc+Cj4KCkFja2VkLWJ5OiBHVU8gUmVuIChYdWFuVGllKSA8Z3VvcmVuQGtl
cm5lbC5vcmc+CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
