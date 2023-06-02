Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591EEC77B7E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 00:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQxiyxXjzj3J1lKiJqUR3FAG9ijt9L+jFC6lu6e1ezg=; b=EVekp//E0t22JG
	RL921Q1wpxtKpNIQpyAiRSGGaDrMte5NfN2gBDPedGjBMJwVayXlOf49n/QMJANTad9xz52C5Kbil
	D6juHVXZ/zFdbq90+CoWHr6CUDidZvCT1bHVDKgV72W/IdHe6KXx2WWlpPj6qwi+90B3v4ClYR5Qm
	ZScSOpUEgWrNVITJ29aVYrslm9hPllVS9xtj614s1nI7wQWd3q+Ozzs3sMLZ08pO8EKIrt6X5QhYf
	j6jHQpjFstkPZILIEngiOZla6HYN1roP23xsB7/MUOFp8mTyf46gJ5PTLfrVG2Cnk6YtaZOIAPniI
	/D14iS74GlPbH9MwPSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4smY-005Kgx-1H;
	Fri, 02 Jun 2023 00:36:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4smT-005Kei-2N;
	Fri, 02 Jun 2023 00:36:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1EA7B648F1;
	Fri,  2 Jun 2023 00:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD3DC433A0;
	Fri,  2 Jun 2023 00:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685666196;
	bh=8680DMzx0gtVOisbuW5F5FI58VdZiV3S7sDNyC66jIs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XTmFrz6x8P+uu4p7+8CwwHHAR8ToxETybv3aokjIkUt8au2/bliIWtKwA0GAbEtXU
	 35MXE4ZwOYCOUbquOW3LQoZZDXhPbam+LWuZhJ0mqETvOfa2/rMGWxD+GJruYpNbS6
	 ci30bYJW5Xs8iSRMEPad+knzjZDpipv9dxPxlL70NiYXhKXJnUs1HWnqvirj5dSWAN
	 B2cCO/rarwHERSu66gvzGkFtyDmlSmQAJPI3dJJQqihBq56qTMR5zptT8HtrJ2b10S
	 TMFJdORTSry9D8pvsZGiWSqPLVC1lC/A7oq6hOwBZbEcU0/jUM34HuLUgEBSnU29a0
	 P+mvZ51/iQCoA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f5021faa16so2032926e87.2;
        Thu, 01 Jun 2023 17:36:35 -0700 (PDT)
X-Gm-Message-State: AC+VfDyrDYQoqdL14+oa0nfAxu4cbRaTwZt30ILQQvwvITQ0Lvoi5UO3
	SPMSx+oTCOVaOimY+c8wAC/gyESMboeF55T9CLY=
X-Google-Smtp-Source: ACHHUZ4rAYUoiHYEWWqFuntxOuL06QmDCDII8lO4o2SuljgVgQXswY+xn62uFOnPiNtfcw4WXcIV+P9v/6p/Zkld05w=
X-Received: by 2002:ac2:44ca:0:b0:4f3:b18a:6497 with SMTP id
 d10-20020ac244ca000000b004f3b18a6497mr927744lfm.52.1685666193979; Thu, 01 Jun
 2023 17:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org>
In-Reply-To: <20230601101257.530867-1-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 1 Jun 2023 17:36:21 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5Em5Sj9uCGyfM6BheTuvA4pviavRTUK-3MbGsd9yCRbQ@mail.gmail.com>
Message-ID: <CAPhsuW5Em5Sj9uCGyfM6BheTuvA4pviavRTUK-3MbGsd9yCRbQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_173637_871610_EB705FA8 
X-CRM114-Status: GOOD (  22.10  )
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

T24gVGh1LCBKdW4gMSwgMjAyMyBhdCAzOjEz4oCvQU0gTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEZyb206ICJNaWtlIFJhcG9wb3J0IChJQk0pIiA8cnBwdEBrZXJu
ZWwub3JnPgo+Cj4gSGksCj4KPiBtb2R1bGVfYWxsb2MoKSBpcyB1c2VkIGV2ZXJ5d2hlcmUgYXMg
YSBtZWFuIHRvIGFsbG9jYXRlIG1lbW9yeSBmb3IgY29kZS4KPgo+IEJlc2lkZSBiZWluZyBzZW1h
bnRpY2FsbHkgd3JvbmcsIHRoaXMgdW5uZWNlc3NhcmlseSB0aWVzIGFsbCBzdWJzeXN0bWVzCj4g
dGhhdCBuZWVkIHRvIGFsbG9jYXRlIGNvZGUsIHN1Y2ggYXMgZnRyYWNlLCBrcHJvYmVzIGFuZCBC
UEYgdG8gbW9kdWxlcwo+IGFuZCBwdXRzIHRoZSBidXJkZW4gb2YgY29kZSBhbGxvY2F0aW9uIHRv
IHRoZSBtb2R1bGVzIGNvZGUuCj4KPiBTZXZlcmFsIGFyY2hpdGVjdHVyZXMgb3ZlcnJpZGUgbW9k
dWxlX2FsbG9jKCkgYmVjYXVzZSBvZiB2YXJpb3VzCj4gY29uc3RyYWludHMgd2hlcmUgdGhlIGV4
ZWN1dGFibGUgbWVtb3J5IGNhbiBiZSBsb2NhdGVkIGFuZCB0aGlzIGNhdXNlcwo+IGFkZGl0aW9u
YWwgb2JzdGFjbGVzIGZvciBpbXByb3ZlbWVudHMgb2YgY29kZSBhbGxvY2F0aW9uLgo+Cj4gVGhp
cyBzZXQgc3BsaXRzIGNvZGUgYWxsb2NhdGlvbiBmcm9tIG1vZHVsZXMgYnkgaW50cm9kdWNpbmcK
PiBqaXRfdGV4dF9hbGxvYygpLCBqaXRfZGF0YV9hbGxvYygpIGFuZCBqaXRfZnJlZSgpIEFQSXMs
IHJlcGxhY2VzIGNhbGwKPiBzaXRlcyBvZiBtb2R1bGVfYWxsb2MoKSBhbmQgbW9kdWxlX21lbWZy
ZWUoKSB3aXRoIHRoZSBuZXcgQVBJcyBhbmQKPiBpbXBsZW1lbnRzIGNvcmUgdGV4dCBhbmQgcmVs
YXRlZCBhbGxvY2F0aW9uIGluIGEgY2VudHJhbCBwbGFjZS4KPgo+IEluc3RlYWQgb2YgYXJjaGl0
ZWN0dXJlIHNwZWNpZmljIG92ZXJyaWRlcyBmb3IgbW9kdWxlX2FsbG9jKCksIHRoZQo+IGFyY2hp
dGVjdHVyZXMgdGhhdCByZXF1aXJlIG5vbi1kZWZhdWx0IGJlaGF2aW91ciBmb3IgdGV4dCBhbGxv
Y2F0aW9uIG11c3QKPiBmaWxsIGppdF9hbGxvY19wYXJhbXMgc3RydWN0dXJlIGFuZCBpbXBsZW1l
bnQgaml0X2FsbG9jX2FyY2hfcGFyYW1zKCkgdGhhdAo+IHJldHVybnMgYSBwb2ludGVyIHRvIHRo
YXQgc3RydWN0dXJlLiBJZiBhbiBhcmNoaXRlY3R1cmUgZG9lcyBub3QgaW1wbGVtZW50Cj4gaml0
X2FsbG9jX2FyY2hfcGFyYW1zKCksIHRoZSBkZWZhdWx0cyBjb21wYXRpYmxlIHdpdGggdGhlIGN1
cnJlbnQKPiBtb2R1bGVzOjptb2R1bGVfYWxsb2MoKSBhcmUgdXNlZC4KPgo+IFRoZSBuZXcgaml0
YWxsb2MgaW5mcmFzdHJ1Y3R1cmUgYWxsb3dzIGRlY291cGxpbmcgb2Yga3Byb2JlcyBhbmQgZnRy
YWNlCj4gZnJvbSBtb2R1bGVzLCBhbmQgbW9zdCBpbXBvcnRhbnRseSBpdCBlbmFibGVzIFJPWCBh
bGxvY2F0aW9ucyBmb3IKPiBleGVjdXRhYmxlIG1lbW9yeS4KClRoaXMgc2V0IGRvZXMgbG9vayBj
bGVhbmVyIHRoYW4gbXkgdmVyc2lvbiBbMV0uIEhvd2V2ZXIsIHRoaXMgaXMKcGFydGlhbGx5IGJl
Y2F1c2UgdGhpcyBzZXQgb25seSBzZXBhcmF0ZXMgdGV4dCBhbmQgZGF0YTsgd2hpbGUgWzFdCmFs
c28gc2VwYXJhdGVzIHJ3IGRhdGEsIHJvIGRhdGEsIGFuZCByb19hZnRlcl9pbml0IGRhdGEuIFdl
IG5lZWQKc3VjaCBzZXBhcmF0aW9uIHRvIGZ1bGx5IGNvdmVyIG1vZHVsZSB1c2FnZSwgYW5kIHRv
IHJlbW92ZQpWTV9GTFVTSF9SRVNFVF9QRVJNUy4gT25jZSB3ZSBhZGQgdGhlc2UgbG9naWMgdG8g
dGhpcwpzZXQsIHRoZSB0d28gdmVyc2lvbnMgd2lsbCBsb29rIHNpbWlsYXIuCgpPVE9ILCBJIGRv
IGxpa2UgdGhlIGZhY3QgdGhpcyB2ZXJzaW9uIGVuYWJsZXMga3Byb2JlcyAoYW5kCnBvdGVudGlh
bGx5IGZ0cmFjZSBhbmQgYnBmKSB3aXRob3V0IENPTkZJR19NT0RVTEVTLiBBbmQKbW0vIHNlZW1z
IGEgYmV0dGVyIGhvbWUgZm9yIHRoZSBsb2dpYy4KClRoYXQgYmVpbmcgc2FpZCwgYmVzaWRlcyBj
b21tZW50cyBpbiBhIGZldyBwYXRjaGVzLCB0aGlzCnZlcnNpb24gbG9va3MgZ29vZCB0byBtZS4g
V2l0aCB0aGUgZml4IEkgc3VnZ2VzdGVkIGZvciBwYXRjaAoxMi8xMywgaXQgcGFzc2VkIG15IHRl
c3RzIG9uIHg4Nl82NCB3aXRoIG1vZHVsZXMsIGtwcm9iZXMsCmZ0cmFjZSwgYW5kIEJQRi4KCklm
IHdlIGRlY2lkZWQgdG8gc2hpcCB0aGlzIHZlcnNpb24sIEkgd291bGQgYXBwcmVjaWF0ZSBpdCBp
ZiBJCmNvdWxkIGdldCBtb3JlIGNyZWRpdCBmb3IgbXkgd29yayBpbiBbMV0gYW5kIHJlc2VhcmNo
IHdvcmsKYmVmb3JlIHRoYXQuCgpUaGFua3MsClNvbmcKClsxXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzIwMjMwNTI2MDUxNTI5LjMzODcxMDMtMS1zb25nQGtlcm5lbC5vcmcvCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
