Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5FDC71159
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ScwjTUY9CkR2wjEaX5TCeBRJ4yCBYpkSRvrMJpCv0c=; b=l9Kad0dcdOZo6J
	JhWFj+7aZpyJabo8wLR9ZtVU8HsuP5GI3Yi29TX+29ErbAF9xVVvnvAQL0lMaPHMLegdFN2fzytyj
	XiBWNvEla8lfb77NB/ZMij05zyrD9vE536/G6NfflPs4acuC9nhshitSNNIXrbRNnWeXMhRUGKiah
	a3qoEhZC2/wiCn1eCICyxaCPKJwlLIosElrrLQ2Uzb1xCwvGT/QVoo74NqmmyHp9jYHTfePOlVoPg
	h4MEr+S9eqme+ohufO0GpVdce7u+xt0IP7MF09j4s9MYCKRp7jgJA07At5fl6N2oAJHKu9jT6XVMh
	dfnE5nwI0sAZ6OmlppQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREZw-00000005DbI-0AbM;
	Mon, 16 Jun 2025 18:29:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBsC-00000004u2o-29Wr
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 15:35:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED6BF4A8A2
	for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 15:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 978F2C4CEF7
	for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 15:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750088147;
	bh=wyqcm4yLFb4zJVbqbZ+q1/zy0wFmRhuu32ZyoGJEm1w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n3bZOHKZoHcqds6WdwLDyCh3eGecUSnALkzpuA6RI2FELJ0DG8RzDRcPyzsFnI4Ab
	 ZN4TgdtH68jdmFSKH1v4IEWLcNeGY5IGxIWYLylzvIdcpzqWQsJHUjBDhxKnqffsuA
	 9lQ2Ab3Sm2gIeJFCkShIkyDnsUFHgIUh5OSbS1VAGeL7udBfn4zwunNF9IiYoCyanx
	 q+9Tp/HH1rZdCnr+paz7eIpDktBTVHAbDfaMrB1RYh5x77mLUDUjEiQ60AW4dtxn+e
	 arDHNiEC8SwPHl7laJtMdGyaPFqIFI1lqOZs/U1Pg0W+m+OkFDB9RrtwCLe9b7+e6L
	 H+lO6Oxh40Mow==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b10594812so4709780e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 08:35:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnjWZYF3MR34zu2UvIUb7yTQG788s9ut6ekdtoOzKeydnVlIDGfaCybQGl+n7Ad29+3E+2w/liUn2RcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+xc5ZZDlZ1I9WcR3fx0GIsjPQ4wpbpBF10uA5Z50rzRUU1qxx
	PPCLxxKAALrytWhYGXAgDg8PoSEsDIrn4FZkhN5RAiiQST1MSyNou8PevMKpg+B5Kb6vcH3g8e2
	vhX07DBXtXBlhlQb1ksh9e125Qr7zNKQ=
X-Google-Smtp-Source: AGHT+IFbOeYossnraAyxlskXcqKyhhi56Nq19OyIZS4QGfWlkeawL/vDS4Zr+c6sgGu0d5OcjxKjLTWl/KyJOsqacys=
X-Received: by 2002:a05:6512:3096:b0:553:2f8c:e631 with SMTP id
 2adb3069b0e04-553b6e6898bmr2461277e87.9.1750088146062; Mon, 16 Jun 2025
 08:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de> <20250611-kunit-kselftests-v3-4-55e3d148cbc6@linutronix.de>
In-Reply-To: <20250611-kunit-kselftests-v3-4-55e3d148cbc6@linutronix.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 17 Jun 2025 00:35:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQUN3hWYh_1=LMzVp1Ddbq3W=yGHZ5__LbcfBajfuhscg@mail.gmail.com>
X-Gm-Features: AX0GCFsBbQd8edKmRItTPTAmU_9r7N84LVB4bZhJmBSwwSeK_bPp6ZeS2KFUAXQ
Message-ID: <CAK7LNAQUN3hWYh_1=LMzVp1Ddbq3W=yGHZ5__LbcfBajfuhscg@mail.gmail.com>
Subject: Re: [PATCH v3 04/16] kbuild: userprogs: add nolibc support
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Willy Tarreau <w@1wt.eu>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	workflows@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_083548_590606_F341AD58 
X-CRM114-Status: GOOD (  25.11  )
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgNDozOOKAr1BNIFRob21hcyBXZWnDn3NjaHVoCjx0aG9t
YXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPiB3cm90ZToKPgo+IFVzZXJwcm9ncyBhcmUgYnVp
bHQgd2l0aCB0aGUgcmVndWxhciBrZXJuZWwgY29tcGlsZXIgJENDLgo+IEEga2VybmVsIGNvbXBp
bGVyIGRvZXMgbm90IG5lY2Vzc2FyaWx5IGNvbnRhaW4gYSBsaWJjIHdoaWNoIGlzIHJlcXVpcmVk
Cj4gZm9yIGEgbm9ybWFsIHVzZXJzcGFjZSBhcHBsaWNhdGlvbi4KPiBIb3dldmVyIHRoZSBrZXJu
ZWwgdHJlZSBkb2VzIGNvbnRhaW4gYSBtaW5pbWFsIGxpYmMgaW1wbGVtZW50YXRpb24KPiAibm9s
aWJjIiB3aGljaCBjYW4gYmUgdXNlZCB0byBidWlsZCB1c2Vyc3BhY2UgYXBwbGljYXRpb25zLgo+
Cj4gSW50cm9kdWNlIHN1cHBvcnQgdG8gYnVpbGQgdXNlcnByb2dzIGFnYWluc3Qgbm9saWJjIGlu
c3RlYWQgb2YgdGhlCj4gZGVmYXVsdCBsaWJjIG9mIHRoZSBjb21waWxlciwgd2hpY2ggbWF5IG5v
dCBleGlzdC4KPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vp
c3NzY2h1aEBsaW51dHJvbml4LmRlPgo+Cj4gLS0tCj4gVGhpcyBjb3VsZCBwcm9iYWJseSBiZSBt
b3ZlZCBvdXQgb2YgdGhlIGdlbmVyaWMga2J1aWxkIG1ha2VmaWxlcy4KPiBJIHRoaW5rIHRoZSBl
cmdvbmltaWNzIHdvdWxkIHN1ZmZlciBhbmQgdGhpcyBmdW5jdGlvbmFsaXR5IGNvdWxkIGJlCj4g
dXNlZCBieSBvdGhlciB1c2VycyBvZiB1c2VycHJvZ3MuCj4KPiBBbHNvIHRoaXMgZG9lcyBjdXJy
ZW50bHkgbm90IHN1cHBvcnQgb3V0LW9mLXRyZWUgYnVpbGRzLgo+IEZvciB0aGF0IHRvb2xzL2lu
Y2x1ZGUvbm9saWJjLyouaCBhbmQgdXNyL2luY2x1ZGUvKi5oIHdvdWxkIG5lZWQgdG8gYmUKPiBp
bnN0YWxsZWQgaW50byB0aGUgYnVpbGQgZGlyZWN0b3J5Lgo+IC0tLQo+ICBEb2N1bWVudGF0aW9u
L2tidWlsZC9tYWtlZmlsZXMucnN0IHwgMTMgKysrKysrKysrKysrKwo+ICBzY3JpcHRzL01ha2Vm
aWxlLnVzZXJwcm9ncyAgICAgICAgIHwgMTMgKysrKysrKysrKy0tLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDIzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9rYnVpbGQvbWFrZWZpbGVzLnJzdCBiL0RvY3VtZW50YXRpb24va2J1aWxkL21h
a2VmaWxlcy5yc3QKPiBpbmRleCA4YWVmMzY1MGMxZjMyYjZiMTk3ZTBkYzc3N2UyNjc3NWQzNzFh
MDgxLi40Y2M3YTFiODlmMTgwMzg1N2E0NzIzMjg0NjEzMTExZTlhZDcxZDkyIDEwMDY0NAo+IC0t
LSBhL0RvY3VtZW50YXRpb24va2J1aWxkL21ha2VmaWxlcy5yc3QKPiArKysgYi9Eb2N1bWVudGF0
aW9uL2tidWlsZC9tYWtlZmlsZXMucnN0Cj4gQEAgLTk3NCw2ICs5NzQsMTkgQEAgV2hlbiBsaW5r
aW5nIGJwZmlsdGVyX3VtaCwgaXQgd2lsbCBiZSBwYXNzZWQgdGhlIGV4dHJhIG9wdGlvbiAtc3Rh
dGljLgo+Cj4gIEZyb20gY29tbWFuZCBsaW5lLCA6cmVmOmBVU0VSQ0ZMQUdTIGFuZCBVU0VSTERG
TEFHUyA8dXNlcmtidWlsZGZsYWdzPmAgd2lsbCBhbHNvIGJlIHVzZWQuCj4KPiArQnVpbGRpbmcg
dXNlcnByb2dzIGFnYWluc3Qgbm9saWJjCj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ICsKPiArTm90IGFsbCBrZXJuZWwgdG9vbGNoYWlucyBwcm92aWRlIGEgbGliYy4KPiAr
U2ltcGxlIHVzZXJwcm9ncyBjYW4gYmUgYnVpbHQgYWdhaW5zdCBhIHZlcnkgc2ltcGxlIGxpYmMg
Y2FsbCAibm9saWJjIiBwcm92aWRlZAo+ICtieSB0aGUga2VybmVsIHNvdXJjZSB0cmVlLgo+ICtU
aGlzIHJlcXVpcmVzIGBgQ09ORklHX0hFQURFUlNfSU5TVEFMTD15YGAuCj4gKwo+ICtFeGFtcGxl
OjoKPiArCj4gKyAgIyBsaWIva3VuaXQvTWFrZWZpbGUKPiArICB1YXBpLXByZWluaXQtbm9saWJj
IDo9ICQoQ09ORklHX0FSQ0hfSEFTX05PTElCQykKPiArCj4gIFdoZW4gdXNlcnNwYWNlIHByb2dy
YW1zIGFyZSBhY3R1YWxseSBidWlsdAo+ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPgo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL01ha2VmaWxlLnVzZXJwcm9ncyBi
L3NjcmlwdHMvTWFrZWZpbGUudXNlcnByb2dzCj4gaW5kZXggZjNhN2UxZWYzNzUzYjU0MzAzNzE4
ZmFlOTdmNGIzYzlkNGVhYzA3Yy4uYjE2MzNhOWRlNmM4NmEwMjNjNzBhNzE3YmFjMGI4MGI4OWQw
MTQzMSAxMDA2NDQKPiAtLS0gYS9zY3JpcHRzL01ha2VmaWxlLnVzZXJwcm9ncwo+ICsrKyBiL3Nj
cmlwdHMvTWFrZWZpbGUudXNlcnByb2dzCj4gQEAgLTE2LDEwICsxNiwxNyBAQCB1c2VyLWNzaW5n
bGUgICAgICAgIDo9ICQoYWRkcHJlZml4ICQob2JqKS8sICQodXNlci1jc2luZ2xlKSkKPiAgdXNl
ci1jbXVsdGkgICAgOj0gJChhZGRwcmVmaXggJChvYmopLywgJCh1c2VyLWNtdWx0aSkpCj4gIHVz
ZXItY29ianMgICAgIDo9ICQoYWRkcHJlZml4ICQob2JqKS8sICQodXNlci1jb2JqcykpCj4KPiAr
dXNlcl9ub2xpYmNfY2NmbGFncyA6PSAtbm9zdGRsaWIgLW5vc3RkaW5jIC1zdGF0aWMgLWZuby1p
ZGVudCAtZm5vLWFzeW5jaHJvbm91cy11bndpbmQtdGFibGVzIFwKPiArICAgICAgICAgICAgICAg
ICAgICAgLWZmcmVlc3RhbmRpbmcgLWZuby1zdGFjay1wcm90ZWN0b3IgXAo+ICsgICAgICAgICAg
ICAgICAgICAgICAtaXN5c3RlbSAkKG9ianRyZWUpL3Vzci9pbmNsdWRlIC1pbmNsdWRlICQoc3Jj
dHJlZSkvdG9vbHMvaW5jbHVkZS9ub2xpYmMvbm9saWJjLmggLWlzeXN0ZW0gJChzcmN0cmVlKS90
b29scy9pbmNsdWRlL25vbGliYy8KClRoZSB0b29scy8gZGlyZWN0b3J5IGlzIGEgZGlmZmVyZW50
IHdvcmxkLCBhbmQgS2J1aWxkIHNjcmlwdHMgZG8gbm90IGtub3cKYW55dGhpbmcgYWJvdXQgaXQu
CgpBbmQsIHlvdSBkbyBub3QgbmVlZCB0byBpbXBsZW1lbnQgdGhpcyBpbiBzY3JpcHRzL01ha2Vm
aWxlLnVzZXJwcm9ncwpiZWNhdXNlIHlvdSBjYW4gbW92ZSB0aGlzIHRvIGxpYi9rdW5pdC9NYWtl
ZmlsZS5rdW5pdC11YXBpIG9yIHNvbWV3aGVyZS4KCgoKCgoKCgoKPiArdXNlcl9ub2xpYmNfbGRm
bGFncyA6PSAtbm9zdGRsaWIgLW5vc3RkaW5jIC1zdGF0aWMKPiArCj4gIHVzZXJfY2NmbGFncyAg
ID0gLVdwLC1NTUQsJChkZXBmaWxlKSAkKEtCVUlMRF9VU0VSQ0ZMQUdTKSAkKHVzZXJjY2ZsYWdz
KSBcCj4gLSAgICAgICAgICAgICAgICAgICAgICAgJCgkKHRhcmdldC1zdGVtKS11c2VyY2NmbGFn
cykKPiAtdXNlcl9sZGZsYWdzICAgPSAkKEtCVUlMRF9VU0VSTERGTEFHUykgJCh1c2VybGRmbGFn
cykgJCgkKHRhcmdldC1zdGVtKS11c2VybGRmbGFncykKPiAtdXNlcl9sZGxpYnMgICAgPSAkKHVz
ZXJsZGxpYnMpICQoJCh0YXJnZXQtc3RlbSktdXNlcmxkbGlicykKPiArICAgICAgICAgICAgICAg
ICAgICAgICAkKCQodGFyZ2V0LXN0ZW0pLXVzZXJjY2ZsYWdzKSAkKGlmICQoJCh0YXJnZXQtc3Rl
bSktbm9saWJjKSwkKHVzZXJfbm9saWJjX2NjZmxhZ3MpKQo+ICt1c2VyX2xkZmxhZ3MgICA9ICQo
S0JVSUxEX1VTRVJMREZMQUdTKSAkKHVzZXJsZGZsYWdzKSAkKCQodGFyZ2V0LXN0ZW0pLXVzZXJs
ZGZsYWdzKSBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgJChpZiAkKCQodGFyZ2V0LXN0ZW0p
LW5vbGliYyksJCh1c2VyX25vbGliY19sZGZsYWdzKSkKPiArdXNlcl9sZGxpYnMgICAgPSAkKHVz
ZXJsZGxpYnMpICQoJCh0YXJnZXQtc3RlbSktdXNlcmxkbGlicykgXAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICQoaWYgJCgkKHRhcmdldC1zdGVtKS1ub2xpYmMpLCQodXNlcl9ub2xpYmNfbGRs
aWJzKSkKPgo+ICAjIENyZWF0ZSBhbiBleGVjdXRhYmxlIGZyb20gYSBzaW5nbGUgLmMgZmlsZQo+
ICBxdWlldF9jbWRfdXNlcl9jY19jID0gQ0MgW1VdICAkQAo+Cj4gLS0KPiAyLjQ5LjAKPgo+CgoK
LS0KQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlhbWFkYQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
