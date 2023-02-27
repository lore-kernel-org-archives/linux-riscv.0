Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5741FC64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 12:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdLcmywqbYDXCqqwBEF3H8JsnnrOALpZjdLHgGinEjk=; b=vOZMyRlM4IhyOQ
	/gn7FHfMBiXZxgLJO84oWXe8oxKjwWBs53Eo/E+2h1WsrdcgspumkNBWUZBjoEhUXIOzejgtbiFox
	xptd6mFVMiAP2s8tal6t1i0lgHkM55UDXj1RIdYK0wz8m/54B8ouQf662nkqHlCk2zpIUnUolVx00
	g/x9DbUfUb0fcb4mpk2CPd7cZ//ARgOfuBntPvgTaoUpMA/MR+/NF9tjE4p1X1S1u/Ztz9jI7Hf/p
	+4U+MHKtVU/xOSEV+I0dsKAyq62BTcl6hPy2WpVquR/oElJHRmWNhwkFdGnZ4epsGzAjL6ISj3Qr5
	4wws9FLZ9a9bVZUO1nRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWd44-009emu-Nt; Mon, 27 Feb 2023 12:57:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWd42-009elw-B8
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 12:57:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B1E4660DFD
	for <linux-riscv@lists.infradead.org>; Mon, 27 Feb 2023 12:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD76C433AF
	for <linux-riscv@lists.infradead.org>; Mon, 27 Feb 2023 12:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677502628;
	bh=zedX3PdU562c+Q1Gru7wIFDB2Pb4iAhIkFLPWy35NEU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sgKlU8T7UnCzCGpc2Ptin2Yo+usa0g1LIyoX6AHWNJX+cAeTVWPsCekMElbdRZTd7
	 yVAuodfK5Yk9dM3GAv7cLT/0VnAMP2q/IQIBs4NE2iWBp59pO1k9yXRxxpq0N5iS7C
	 rt3PXCYzUMbQqcfRjrfZZQa9FitCYgCft7Q6YEUgs/EXLC/lGv3h0wbs4cLNPIbfLf
	 pVRJTJBrQdPFhAH8PTAqJoax84OVsNw6oXmhrM9gdYt/s8uXBWB7erR/+WyDocXkPm
	 +nKIjmNwA/XTUezg1EVIp3ki9wyobdAwaq48s1YpJMRTj6JHTl9MTCLeZilzOT5J/Z
	 TwuTLiafgIBcg==
Received: by mail-lf1-f46.google.com with SMTP id k14so8390139lfj.7
        for <linux-riscv@lists.infradead.org>; Mon, 27 Feb 2023 04:57:08 -0800 (PST)
X-Gm-Message-State: AO0yUKWYrX4I0WCRrWv+qjUgh+D6JbSJI4jlskcYqw1JL/Rj5/TOJGq/
	GMqbvXjS7a2a/fq2Azo1LZA4gw1vrLQx1M+oXp8=
X-Google-Smtp-Source: AK7set9VVtyfreeHcNt3/ckrXOFuAsLW/BdgFHIDhxvPasrYVOh6UMsLhaVKKjKkGGJH2QPPePGPWvRpd3iC4i7i69A=
X-Received: by 2002:ac2:44a8:0:b0:4d8:6fd3:b8bf with SMTP id
 c8-20020ac244a8000000b004d86fd3b8bfmr7422782lfm.7.1677502626519; Mon, 27 Feb
 2023 04:57:06 -0800 (PST)
MIME-Version: 1.0
References: <20230224100218.1824569-1-alexghiti@rivosinc.com>
 <20230224100218.1824569-2-alexghiti@rivosinc.com> <Y/yilORflGv3vXjX@wendy>
In-Reply-To: <Y/yilORflGv3vXjX@wendy>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 27 Feb 2023 13:56:55 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGCkqpHY7rHZv0EFKhPNk6jpbh1OfG_Jm3vSW8c5Y+9_A@mail.gmail.com>
Message-ID: <CAMj1kXGCkqpHY7rHZv0EFKhPNk6jpbh1OfG_Jm3vSW8c5Y+9_A@mail.gmail.com>
Subject: Re: [PATCH v7 1/1] riscv: Allow to downgrade paging mode from the
 command line
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	nathan@kernel.org, llvm@lists.linux.dev, ndesaulniers@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_045710_485596_9628BA29 
X-CRM114-Status: GOOD (  29.46  )
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

T24gTW9uLCAyNyBGZWIgMjAyMyBhdCAxMzozMiwgQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlA
bWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBIZXkgQWxleCwgY2xhbmcvbGx2bSBmb2xrLAo+Cj4g
T24gRnJpLCBGZWIgMjQsIDIwMjMgYXQgMTE6MDI6MThBTSArMDEwMCwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+ID4gQWRkIDIgZWFybHkgY29tbWFuZCBsaW5lIHBhcmFtZXRlcnMgdGhhdCBhbGxv
dyB0byBkb3duZ3JhZGUgc2F0cCBtb2RlCj4gPiAodXNpbmcgdGhlIHNhbWUgbmFtaW5nIGFzIHg4
Nik6Cj4gPiAtICJubzVsdmwiOiB1c2UgYSA0LWxldmVsIHBhZ2UgdGFibGUgKGRvd24gZnJvbSBz
djU3IHRvIHN2NDgpCj4gPiAtICJubzRsdmwiOiB1c2UgYSAzLWxldmVsIHBhZ2UgdGFibGUgKGRv
d24gZnJvbSBzdjU3L3N2NDggdG8gc3YzOSkKPiA+Cj4gPiBOb3RlIHRoYXQgZ29pbmcgdGhyb3Vn
aCB0aGUgZGV2aWNlIHRyZWUgdG8gZ2V0IHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lCj4gPiB3b3Jr
cyB3aXRoIEFDUEkgdG9vIHNpbmNlIHRoZSBlZmkgc3R1YiBjcmVhdGVzIGEgZGV2aWNlIHRyZWUg
YW55d2F5IHdpdGgKPiA+IHRoZSBjb21tYW5kIGxpbmUuCj4gPgo+ID4gSW4gS0FTQU4ga2VybmVs
cywgd2UgY2FuJ3QgdXNlIHRoZSBsaWJmZHQgdGhhdCBlYXJseSBpbiB0aGUgYm9vdCBwcm9jZXNz
Cj4gPiBzaW5jZSB3ZSBhcmUgbm90IHJlYWR5IHRvIGV4ZWN1dGUgaW5zdHJ1bWVudGVkIGZ1bmN0
aW9ucy4gU28gaW5zdGVhZCBvZgo+ID4gdXNpbmcgdGhlICJnZW5lcmljIiBsaWJmZHQsIHdlIGNv
bXBpbGUgb3VyIG93biB2ZXJzaW9ucyBvZiB0aG9zZSBmdW5jdGlvbnMKPiA+IHRoYXQgYXJlIG5v
dCBpbnN0cnVtZW50ZWQgYW5kIHRoYXQgYXJlIHByZWZpeGVkIHNvIHRoYXQgdGhleSBkbyBub3QK
PiA+IGNvbmZsaWN0IHdpdGggdGhlIGdlbmVyaWMgb25lcy4gV2UgYWxzbyBuZWVkIHRoZSBub24t
aW5zdHJ1bWVudGVkIHZlcnNpb25zCj4gPiBvZiB0aGUgc3RyaW5nIGZ1bmN0aW9ucyBhbmQgdGhl
IHByZWZpeGVkIHZlcnNpb25zIG9mIG1lbWNweS9tZW1tb3ZlLgo+ID4KPiA+IFRoaXMgaXMgbGFy
Z2VseSBpbnNwaXJlZCBieSBjb21taXQgYWFjZDE0OWI2MjM4ICgiYXJtNjQ6IGhlYWQ6IGF2b2lk
Cj4gPiByZWxvY2F0aW5nIHRoZSBrZXJuZWwgdHdpY2UgZm9yIEtBU0xSIikgZnJvbSB3aGljaCBJ
IHJlbW92ZWQgY29tcGlsYXRpb24KPiA+IGZsYWdzIHRoYXQgd2VyZSBub3QgcmVsZXZhbnQgdG8g
UklTQy1WIGF0IHRoZSBtb21lbnQgKExUTywgU0NTLCBwaWUpLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiA+IFRlc3RlZC1i
eTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEJq
w7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9hZG1pbi1n
dWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgICAgICAgICB8ICA1ICstCj4gPiAgYXJjaC9yaXNj
di9rZXJuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgIDIgKwo+ID4gIGFyY2gvcmlz
Y3Yva2VybmVsL3BpL01ha2VmaWxlICAgICAgICAgICAgICAgICB8IDM3ICsrKysrKysrKysrCj4g
PiAgYXJjaC9yaXNjdi9rZXJuZWwvcGkvY21kbGluZV9lYXJseS5jICAgICAgICAgIHwgNjIgKysr
KysrKysrKysrKysrKysrKwo+Cj4gKyAgICAgIDQgbGQubGxkOiB3YXJuaW5nOiB2bWxpbnV4LmEo
YXJjaC9yaXNjdi9rZXJuZWwvcGkvc3RyaW5nLnBpLm8pOiguaW5pdC5zZGF0YSkgaXMgYmVpbmcg
cGxhY2VkIGluICcuaW5pdC5zZGF0YScKPgo+IEknbSBnZXR0aW5nIDQgbmV3IGxpbmtlciB3YXJu
aW5ncyB3aXRoIExMVk09MSBjbGFuZy0xNSBhbGxtb2Rjb25maWcKPiBidWlsZHMgLSBidXQgSSBk
b24ndCByZWFsbHkgdW5kZXJzdGFuZCB0aGlzIGlzc3VlLgo+IElzIHRoaXMgc3B1cmlvdXMsIGFu
ZCBhIGp1c3QgY29uc2VxdWVuY2Ugb2YuLi4KPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3BpL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGkvTWFrZWZpbGUKPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjQwMDJlZDk0YjZkMwo+
ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGkvTWFrZWZpbGUK
PiA+IEBAIC0wLDAgKzEsMzcgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wCj4gPiArIyBUaGlzIGZpbGUgd2FzIGNvcGllZCBmcm9tIGFybTY0L2tlcm5lbC9waS9NYWtl
ZmlsZS4KPiA+ICsKPiA+ICtLQlVJTERfQ0ZMQUdTICAgICAgICA6PSAkKHN1YnN0ICQoQ0NfRkxB
R1NfRlRSQUNFKSwsJChLQlVJTERfQ0ZMQUdTKSkgXAo+ID4gKyAgICAgICAgICAgICAgICAtT3Mg
LURESVNBQkxFX0JSQU5DSF9QUk9GSUxJTkcgJChESVNBQkxFX1NUQUNLTEVBS19QTFVHSU4pIFwK
PiA+ICsgICAgICAgICAgICAgICAgJChjYWxsIGNjLW9wdGlvbiwtbWJyYW5jaC1wcm90ZWN0aW9u
PW5vbmUpIFwKPiA+ICsgICAgICAgICAgICAgICAgLUkkKHNyY3RyZWUpL3NjcmlwdHMvZHRjL2xp
YmZkdCAtZm5vLXN0YWNrLXByb3RlY3RvciBcCj4gPiArICAgICAgICAgICAgICAgIC1EX19ESVNB
QkxFX0VYUE9SVFMgLWZmcmVlc3RhbmRpbmcgXAo+ID4gKyAgICAgICAgICAgICAgICAtZm5vLWFz
eW5jaHJvbm91cy11bndpbmQtdGFibGVzIC1mbm8tdW53aW5kLXRhYmxlcyBcCj4gPiArICAgICAg
ICAgICAgICAgICQoY2FsbCBjYy1vcHRpb24sLWZuby1hZGRyc2lnKQo+ID4gKwo+ID4gK0NGTEFH
U19jbWRsaW5lX2Vhcmx5Lm8gKz0gLURfX05PX0ZPUlRJRlkKPiA+ICtDRkxBR1NfbGliLWZkdF9y
by5vICs9IC1EX19OT19GT1JUSUZZCj4gPiArCj4gPiArR0NPVl9QUk9GSUxFIDo9IG4KPiA+ICtL
QVNBTl9TQU5JVElaRSAgICAgICA6PSBuCj4gPiArS0NTQU5fU0FOSVRJWkUgICAgICAgOj0gbgo+
ID4gK1VCU0FOX1NBTklUSVpFICAgICAgIDo9IG4KPiA+ICtLQ09WX0lOU1RSVU1FTlQgICAgICA6
PSBuCj4gPiArCj4gPiArJChvYmopLyUucGkubzogT0JKQ09QWUZMQUdTIDo9IC0tcHJlZml4LXN5
bWJvbHM9X19waV8gXAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLXJlbW92ZS1z
ZWN0aW9uPS5ub3RlLmdudS5wcm9wZXJ0eSBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tcHJlZml4LWFsbG9jLXNlY3Rpb25zPS5pbml0Cj4KPiAuLi50aGlzPwo+CgpZZXMuIGlm
IHRoZSBpbnB1dCBvYmplY3QgaGFzIGEgLnNkYXRhIHNlY3Rpb24sIHRoZSBvdXRwdXQgLnBpLm8g
b2JqZWN0CndpbGwgaGF2ZSBhIC5pbml0LnNkYXRhIHNlY3Rpb24sIGFuZCBpZiB0aGUgY29tbW9u
IGxpbmtlciBzY3JpcHQgZG9lcwpub3QgcGxhY2UgaXQgZXhwbGljaXRseSwgeW91IHdpbGwgZ2V0
IGEgd2FybmluZy4gTm90ZSB0aGF0IHdlIHN3aXRjaGVkCnRvIC0tb3JwaGFuLWhhbmRsaW5nPWVy
cm9yIG9uIG90aGVyIGFyY2hlcywgYXMgdGhlIGxpbmtlciBzb21ldGltZXMKZG9lcyB1bmV4cGVj
dGVkIHRoaW5ncyB3aXRoIHNlY3Rpb25zIGl0IGRvZXNuJ3Qga25vdyBhYm91dC4KCkknZCBpbWFn
aW5lIHRoaXMgbmVlZHMgdG8gYmUgY29tYmluZWQgd2l0aCAuaW5pdC5kYXRhCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
