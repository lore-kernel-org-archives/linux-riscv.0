Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5270BC52D7C
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 11:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lKTYvdIHQodjCYdbyBY/sdidaEklIPLlr80Kh5HMOfo=; b=U3klfXh+7MycRB
	cfX9YN2O7n03mDs5Z1bcvAWWcVv/KgxEFIF2dbHDJoUMIDUb9y1HnLzNOwiVI9RvpH+acVBlcaVGR
	EW/J51hipCgbxtIKBoUako1XrSSVEKncKIFJVMVHxTf/916jdp7fBc1Lp/unddIv56uFvbF/BWN0X
	759nTldT8Ne4AHQ5hpDyiKy/ma7PSmcF6biIXVhnKrnsYT8ta2YItTwHyKIVGvI29eFM6FW8cmR8S
	OIWf6+r8tXJ0SXWXlvyCdmF+Lybn5MPm+n8NKW94+xXAuwA2ydeyoAH30WVGk6SvePv7Oxrz2qR9i
	ig7htVV/ZfTVBx7AVNFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdpGl-00000003RCI-1DXI;
	Tue, 13 Aug 2024 11:00:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdpGW-00000003R8x-2Ro0
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 11:00:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8EA826164C;
	Tue, 13 Aug 2024 11:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D780BC4AF10;
	Tue, 13 Aug 2024 11:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723546835;
	bh=B808EudKWrHxZfYg+a3UwZuglHevVcZNFkJtnW2kji4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tb+0FW+tZf+oPwB7sp1BP0xAvdBX0bocm7umTDDTc2QtHC4wg9unm2yzSoVx1Yjz3
	 0HpVeUz5XPlAjZsWbPNaCl3+gl3RbfWrkMJNRUi9oTMafXERRKlJtfdB0KgiKAXo86
	 FUOMRocHoHBhCewj4woksJz6ZX5CIfnW6DFsox5GUUxtV5f2utGyxad7d8JCYWL00n
	 uNGQl6ygAxKPZvZry8w9OqdCnJnj8iB0qUACpviY1MNS45N8En7CRBfTFaisBEBZxy
	 Q4HJT8usc4u+xLYAQIE7ApsQKjFAJSPDM9CsOlxct0GUW81MdbE2PF8G7/pkicL30R
	 V2pQ3jPuIJOhQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Zong Li
 <zong.li@sifive.com>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Puranjay Mohan <puranjay@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Evgenii Shatokhin <e.shatokhin@yadro.com>, Andy Chiu
 <andy.chiu@sifive.com>
Subject: Re: [PATCH v2 0/6] riscv: ftrace: atmoic patching and preempt
 improvements
In-Reply-To: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
References: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
Date: Tue, 13 Aug 2024 13:00:31 +0200
Message-ID: <87cymcadrk.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_040036_791238_386AA7C2 
X-CRM114-Status: GOOD (  22.66  )
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

QW5keSwKCldheSBvdmVyIGR1ZTsgSSdtIGJhY2sgZnJvbSBteSB2YWNhdGlvbiwgSSd2ZSBmaW5h
bGx5IHN0YXJ0ZWQgdG8gbG9vayBhdAp0aGUgc2VyaWVzLiBUaGFua3MgZm9yIHdvcmtpbmcgb24g
aXQuCgpBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPiB3cml0ZXM6Cgo+IFRoaXMgc2Vy
aWVzIG1ha2VzIGF0bW9pYyBjb2RlIHBhdGNoaW5nIHBvc3NpYmxlIGluIHJpc2N2IGZ0cmFjZS4g
QQogICAgICAgICAgICAgICAgICAgIGF0b21pYwoKPiBkaXJlY3QgYmVuZWZpdCBvZiB0aGlzIGlz
IHRoYXQgd2UgY2FuIGdldCByaWQgb2Ygc3RvcF9tYWNoaW5lKCkgd2hlbgo+IHBhdGNoaW5nIGZ1
bmN0aW9uIGVudHJpZXMuIFRoaXMgYWxzbyBtYWtlcyBpdCBwb3NzaWJsZSB0byBydW4gZnRyYWNl
Cj4gd2l0aCBmdWxsIGtlcm5lbCBwcmVlbXB0aW9uLiBCZWZvcmUgdGhpcyBzZXJpZXMsIHRoZSBr
ZXJuZWwgaW5pdGlhbGl6ZXMKPiBwYXRjaGFibGUgZnVuY3Rpb24gZW50cmllcyB0byBOT1A0ICsg
Tk9QNC4gVG8gc3RhcnQgdHJhY2luZywgaXQgdXBkYXRlcwo+IGVudHJpZXMgdG8gQVVJUEMgKyBK
QUxSIHdoaWxlIGhvbGRpbmcgb3RoZXIgY29yZXMgaW4gc3RvcF9tYWNoaW5lLgo+IHN0b3BfbWFj
aGluZSgpIGlzIHJlcXVpcmVkIGJlY2F1c2UgaXQgaXMgaW1wb3NzaWJsZSB0byB1cGRhdGUgMgo+
IGluc3RydWN0aW9ucywgYW5kIGJlIHNlZW4gYXRvbWljYWxseS4gQW5kIHByZWVtcHRpb24gbXVz
dCBoYXZlIHRvIGJlCj4gcHJldmVudGVkLCBhcyBrZXJuZWwgcHJlZW1wdGlvbiBhbGxvd3MgcHJv
Y2VzcyB0byBiZSBzY2hlZHVsZWQgb3V0IHdoaWxlCj4gZXhlY3V0aW5nIG9uIG9uZSBvZiB0aGVz
ZSBpbnN0cnVjdGlvbiBwYWlycy4KPgo+IFRoaXMgc2VyaWVzIGFkZHJlc3NlcyB0aGUgcHJvYmxl
bSBieSBpbml0aWFsaXppbmcgdGhlIGZpcnN0IE5PUDQgdG8KPiBBVUlQQy4gU28sIGF0bW9pYyBw
YXRjaGluZyBpcyBwb3NzaWJsZSBiZWNhdXNlIHRoZSBrZXJuZWwgb25seSBoYXMgdG8KICAgICAg
ICAgICAgIGF0b21pYwoKPiB1cGRhdGUgb25lIGluc3RydWN0aW9uLiBBcyBsb25nIGFzIHRoZSBp
bnN0cnVjdGlvbiBpcyBuYXR1cmFsbHkgYWxpZ25lZCwKPiB0aGVuIGl0IGlzIGV4cGVjdGVkIHRv
IGJlIHVwZGF0ZWQgYXRvbWljYWxseS4KClRoaXMgY2FtZSB1cCBvbiB0aGUgbGFzdCB3ZWVrbHkg
cGF0Y2h3b3JrIGNhbGw7IEdpdmVuIHRoYXQgUklTQy1WIGRvZXMKbm90IHlldCAoV0lQISkgaGFz
IGEgZm9ybWFsIHNwZWNmaWNhdGlvbiBleHByZXNzaW5nIGNtb2R4IGJlaGF2aW91ciwgdGhlCmFz
c3VtcHRpb25zIGRvbmUgaW4gdGhpcyBzZXJpZXMgKHdoYXQgeW91J3JlIGRlc2NyaWJpbmcgaGVy
ZSBwcmV0dHkKbXVjaCkgc2hvdWxkIGJlIHByb3Blcmx5IGRvY3VtZW50ZWQgaW4gRG9jdW1lbnRh
dGlvbi9yaXNjdiB0aGUgbmV4dApyZXZpc2lvbi4KCkZyb20gdGhlIGVhcmxpZXIgcHVibGljIGRp
c2N1c3Npb25zIFsxXSwgdGhpcyBpcyAib3B0aW9uIEEiLgoKPiBIb3dldmVyLCB0aGUgYWRkcmVz
cyByYW5nZSBvZiB0aGUgZnRyYWNlIHRyYW1wb2xpbmUgaXMgbGltaXRlZCB0byArLTJLCj4gZnJv
bSBmdHJhY2VfY2FsbGVyIGFmdGVyIGFwcHBseWluZyB0aGlzIHNlcmllcy4gVGhpcyBpc3N1ZSBp
cyBleHBlY3RlZAo+IHRvIGJlIHNvbHZlZCBieSBQdXJhbmpheSdzIENBTExfT1BTLCB3aGVyZSBp
dCBhZGRzIDhCIG5hdHVyYWxseSBhbGlnbgo+IGRhdGEgaW4gZnJvbnQgb2YgcGFjdGhhYmxlIGZ1
bmN0aW9ucyBhbmQgY2FuICB1c2UgaXQgdG8gZGlyZWN0IGV4ZWN1dGlvbgogICAgICAgICAgICAg
ICAgICAgcGF0Y2hhYmxlCgpJcyBpdCByZWFsbHkgdXNhYmxlIHRvIGVuYWJsZSB3aXRoIHRoZSBs
aW1pdCAySyByYW5nZT8gTWFrZXMgbWUgd29uZGVyCmlmIHdlIHNob3VsZCBiYWtlIGluIFB1cmFu
amF5IENBTExfT1BTIHdvcmsgZGlyZWN0bHkgaW4gdGhpcyBzZXJpZXMuClRob3VnaHRzPwoKPiBv
dXQgdG8gYW55IGN1c3RvbSB0cmFtcG9saW5lcy4KPgo+IFRoZSBzZXJpZXMgaXMgY29tcG9zZWQg
YnkgdGhyZWUgcGFydHMuIFRoZSBmaXJzdCBwYXJ0IGNsZWFucyB1cCB0aGUKPiBleGlzdGluZyBp
c3N1ZXMgd2hlbiB0aGUga2VybmVsIGlzIGNvbXBpbGVkIHdpdGggY2xhbmcuVGhlIHNlY29uZCBw
YXJ0Cj4gbW9kaWZpZXMgdGhlIGZ0cmFjZSBjb2RlIHBhdGNoaW5nIG1lY2hhbmlzbSAoMi00KSBh
cyBtZW50aW9uZWQgYWJvdmUuCj4gVGhlbiBwcmVwYXJlIGZ0cmFjZSB0byBiZSBhYmxlIHRvIHJ1
biB3aXRoIGtlcm5lbCBwcmVlbXB0aW9uICg1LDYpCj4KPiBUaGlzIHNlcmllcyBpcyB0ZXN0ZWQg
YWZ0ZXIgYXBwbHlpbmcgdGhlIGZvbGxvd2luZyBmdHJhY2UvcGF0Y2hpbmcgaW4KPiB0aGUgZml4
ZXMgYnJhbmNoOgo+Cj4gLSBjb21taXQgNTdhMzY5YjZmMmVlICgicmlzY3Y6IHBhdGNoOiBGbHVz
aCB0aGUgaWNhY2hlIHJpZ2h0IGFmdGVyCj4gICAgICAgICAgICAgICAgICAgICAgICAgcGF0Y2hp
bmcgdG8gYXZvaWQgaWxsZWdhbCBpbnNucyIpCj4gLSBjb21taXQgYTJiZDNhNWI0YjYzICgicmlz
Y3Y6IHN0YWNrdHJhY2U6IGNvbnZlcnQgYXJjaF9zdGFja193YWxrKCkgdG8KPiAgICAgICAgICAg
ICAgICAgICAgICAgICBub2luc3RyIikKPgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBEcm9wIHBhdGNo
IDEgYXMgaXQgaXMgbWVyZ2VkIHRocm91Z2ggZml4ZXMuCj4gLSBEcm9wIHBhdGNoIDIsIHdoaWNo
IGNvbnZlcnRzIGtlcm5lbF90ZXh0X2FkZHJlc3MgaW50byBub3RyYWNlLiBBcwo+ICAgdXNlcnMg
Y2FuIHByZXZlbnQgdHJhY2luZyBpdCBieSBjb25maWd1cmluZyB0aGUgdHJhY2Vmcy4KPiAtIFVz
ZSBhIG1vcmUgZ2VuZXJpYyB3YXkgaW4ga2NvbmZpZyB0byBhbGlnbiBmdW5jdGlvbnMuCj4gLSBM
aW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNjEzLWRldi1hbmR5Yy1k
eW4tZnRyYWNlLXY0LXYxLTAtMWE1MzhlMTJjMDFlQHNpZml2ZS5jb20KCk1vcmUgaW5wdXQgaW4g
c3Vic2VxdWVudCBwYXRjaGVzLgoKCkNoZWVycywKQmrDtnJuCgpbMV0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtcmlzY3YvODd6ZnYwb25yZS5mc2ZAYWxsLnlvdXIuYmFzZS5hcmUuYmVs
b25nLnRvLnVzLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
