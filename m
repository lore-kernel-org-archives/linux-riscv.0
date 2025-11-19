Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26E7CF58C1
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 17:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JhBdLc9qBzjNP7eWKliCs1eXmc9rwODb4nhqfZg7yD0=; b=K/QnJyiCnlElynoBP/HD4VFGyw
	CoKd9EGBeRRmPaZhNkf6idMeAt1NmOrIrxGh2x8wPx65meM8h6LTpPVQPSw8pMNtLcBzg1dcAruu4
	gi0nXvs3jKPyu0vlqIrUB53CksNwMGRBSjKHOmfveBzVer/BWIbMjCoRWT68hqNT7+JTGTuaEyvij
	TLKZxtLN1bDtD+KJtePSB8ococMrOg2rBGIBqps9j7gxFZ9bEqCd3c+X8cvbmZkENrZtY7vvTqOvf
	YY7TUWUvVznjwjomSImoWtqjlzosbuIUkvat4ZACa4f2M/GujXTl9H/e6OxPpOp0LzxM3mOqP6t8K
	S9caKQ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLm2H-000000047z7-2oaf;
	Wed, 19 Nov 2025 17:32:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLm2E-000000047vB-39zA
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 17:32:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C0AE43612;
	Wed, 19 Nov 2025 17:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51471C116C6;
	Wed, 19 Nov 2025 17:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763573521;
	bh=/t2oTQtncuM/mvzgreWw/hJ7gSFNgj07SaGnfOfObKg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=KdqOuympGFQjKVKxCMIy8G0GAxGGFh55JJngpEAScQHQGWRysLKwPaRaPGp4qCDc1
	 8btnkJMxNykpl0kqln4Hku4Rl7Wl6/H+ZbSDO9x3qt7/BMn8RhxRLMyNCYFiQ1dFGj
	 F5bg0iS4PkrQC2NupcpUKMQJhzkMg4j1Ut1JLm54fGbqMQlfMv8aGSw8ofIhj60/6k
	 LiWxVlRPgCl2E0x3jG55+VQjf7Lo24Qok6kiHWDwrJlVZJNvbPc6FJwfRvWJuarmi8
	 h25G+4xIYjDKJYHN9BIr4was3SRjf1u+E/4z6iCp01yeGHECgheE+ihNjFtF4ocDTl
	 c7OkIUzT+g7Iw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 15FF1F4006F;
	Wed, 19 Nov 2025 12:31:59 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 19 Nov 2025 12:31:59 -0500
X-ME-Sender: <xms:Dv8daYw8V6oCHt7IdscAKP7ZmNBGAa5l2QAwxtemNAhqmc86Cvmz2w>
    <xme:Dv8daXFjKfxoLeyJ2tQ-LMwJMhCMviHudxhtJj_7W7G9StSFxeNFWZzqbW4KphyxD
    U3EneA33cqOoXiVDgcMLskQ2oHKFwMim-OnIq2k97GUUcvqh4MgBwbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvvdegkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehnugih
    ucfnuhhtohhmihhrshhkihdfuceolhhuthhosehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhephffgieeuueevvddvffehiedtteduveejtefhuedtteehfffgieehhfeg
    ffehvddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhguhidomhgvshhmthhprghuthhh
    phgvrhhsohhnrghlihhthidqudduiedukeehieefvddqvdeifeduieeitdekqdhluhhtoh
    eppehkvghrnhgvlhdrohhrgheslhhinhhugidrlhhuthhordhushdpnhgspghrtghpthht
    ohepgeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsggrrhhonhesrghkrg
    hmrghirdgtohhmpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohep
    rghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofh
    htrdhnvghtpdhrtghpthhtohepmhgrthhhihgvuhdruggvshhnohihvghrshesvghffhhi
    tghiohhsrdgtohhmpdhrtghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepuhhrvgiikhhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhho
    shhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtthhopehjrghnnhhhsehgohhogh
    hlvgdrtghomh
X-ME-Proxy: <xmx:Dv8daRCKxEiK-0E-MKjf5NWUbib5nldBL-kYR9iWEijS3CsfVa89kg>
    <xmx:D_8daX6x1rtaemMXGl1UUQ-GckmNeRG7S9C0cE8st-Pfk6O6QPlNqQ>
    <xmx:D_8daW0MQGOGXibaGRTJmbXnHuAS5PAeFiV8Msmu0BCYqd_QjRTjZA>
    <xmx:D_8daQVCyt9OWVjQ8WbjKcJmpn9xIBLHN3rVEdTmsuxpWYuoTd_HUQ>
    <xmx:D_8daTkZEglornIN3N4-CtsqujdAUXdXlIbQgLT3HNoWB_wXN4CqSIGu>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D1DC6700063; Wed, 19 Nov 2025 12:31:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A2ZwPDH9FoLc
Date: Wed, 19 Nov 2025 09:31:37 -0800
From: "Andy Lutomirski" <luto@kernel.org>
To: "Valentin Schneider" <vschneid@redhat.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, rcu@vger.kernel.org,
 "the arch/x86 maintainers" <x86@kernel.org>,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 "Arnaldo Carvalho de Melo" <acme@kernel.org>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Paolo Bonzini" <pbonzini@redhat.com>, "Arnd Bergmann" <arnd@arndb.de>,
 "Frederic Weisbecker" <frederic@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Jason Baron" <jbaron@akamai.com>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Sami Tolvanen" <samitolvanen@google.com>,
 "David S. Miller" <davem@davemloft.net>,
 "Neeraj Upadhyay" <neeraj.upadhyay@kernel.org>,
 "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Josh Triplett" <josh@joshtriplett.org>,
 "Boqun Feng" <boqun.feng@gmail.com>,
 "Uladzislau Rezki" <urezki@gmail.com>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
 "Mel Gorman" <mgorman@suse.de>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Han Shen" <shenhan@google.com>, "Rik van Riel" <riel@surriel.com>,
 "Jann Horn" <jannh@google.com>,
 "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Oleg Nesterov" <oleg@redhat.com>, "Juri Lelli" <juri.lelli@redhat.com>,
 "Clark Williams" <williams@redhat.com>,
 "Yair Podemsky" <ypodemsk@redhat.com>,
 "Marcelo Tosatti" <mtosatti@redhat.com>,
 "Daniel Wagner" <dwagner@suse.de>, "Petr Tesarik" <ptesarik@suse.com>,
 "Shrikanth Hegde" <sshegde@linux.ibm.com>
Message-Id: <91702ceb-afba-450e-819b-52d482d7bd11@app.fastmail.com>
In-Reply-To: <xhsmhecpukowa.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
References: <20251114150133.1056710-1-vschneid@redhat.com>
 <20251114151428.1064524-9-vschneid@redhat.com>
 <65ae9404-5d7d-42a3-969e-7e2ceb56c433@app.fastmail.com>
 <xhsmhecpukowa.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Subject: Re: [RFC PATCH v7 29/31] x86/mm/pti: Implement a TLB flush immediately after a
 switch to kernel CR3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_093202_831245_FD512FB9 
X-CRM114-Status: GOOD (  31.58  )
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

Ck9uIFdlZCwgTm92IDE5LCAyMDI1LCBhdCA3OjQ0IEFNLCBWYWxlbnRpbiBTY2huZWlkZXIgd3Jv
dGU6Cj4gT24gMTkvMTEvMjUgMDY6MzEsIEFuZHkgTHV0b21pcnNraSB3cm90ZToKPj4gT24gRnJp
LCBOb3YgMTQsIDIwMjUsIGF0IDc6MTQgQU0sIFZhbGVudGluIFNjaG5laWRlciB3cm90ZToKPj4+
IERlZmVycmluZyBrZXJuZWwgcmFuZ2UgVExCIGZsdXNoZXMgcmVxdWlyZXMgdGhlIGd1YXJhbnRl
ZSB0aGF0IHVwb24KPj4+IGVudGVyaW5nIHRoZSBrZXJuZWwsIG5vIHN0YWxlIGVudHJ5IG1heSBi
ZSBhY2Nlc3NlZC4gVGhlIHNpbXBsZXN0IHdheSB0bwo+Pj4gcHJvdmlkZSBzdWNoIGEgZ3VhcmFu
dGVlIGlzIHRvIGlzc3VlIGFuIHVuY29uZGl0aW9uYWwgZmx1c2ggdXBvbiBzd2l0Y2hpbmcKPj4+
IHRvIHRoZSBrZXJuZWwgQ1IzLCBhcyB0aGlzIGlzIHRoZSBwaXZvdGluZyBwb2ludCB3aGVyZSBz
dWNoIHN0YWxlIGVudHJpZXMKPj4+IG1heSBiZSBhY2Nlc3NlZC4KPj4+Cj4+Cj4+IERvaW5nIHRo
aXMgdG9nZXRoZXIgd2l0aCB0aGUgUFRJIENSMyBzd2l0Y2ggaGFzIG5vIGFjdHVhbCBiZW5lZml0
OiBNT1YgQ1IzIGRvZXNu4oCZdCBmbHVzaCBnbG9iYWwgcGFnZXMuIEFuZCBkb2luZyB0aGlzIGlu
IGFzbSBpcyBwcmV0dHkgZ3Jvc3MuICBXZSBkb27igJl0IGV2ZW4gZ2V0IGEgZnJlZSBzeW5jX2Nv
cmUoKSBvdXQgb2YgaXQgYmVjYXVzZSBJTlZQQ0lEIGlzIG5vdCBkb2N1bWVudGVkIGFzIGJlaW5n
IHNlcmlhbGl6aW5nLgo+Pgo+PiBXaHkgY2Fu4oCZdCB3ZSBkbyBpdCBpbiBDPyAgV2hhdOKAmXMg
dGhlIGFjdHVhbCByaXNrPyAgSW4gb3JkZXIgdG8gdHJpcCBvdmVyIGEgc3RhbGUgVExCIGVudHJ5
LCB3ZSB3b3VsZCBuZWVkIHRvIGRlZmVyZW5jZSBhIHBvaW50ZXIgdG8gbmV3bHkgYWxsb2NhdGVk
IGtlcm5lbCB2aXJ0dWFsIG1lbW9yeSB0aGF0IHdhcyBub3QgdmFsaWQgcHJpb3IgdG8gb3VyIGVu
dHJ5IGludG8gdXNlciBtb2RlLiBJIGNhbiBpbWFnaW5lIEJQRiBkb2luZyB0aGlzLCBidXQgcGxh
aW4gbm9pbnN0ciBDIGluIHRoZSBlbnRyeSBwYXRoPyAgRXNwZWNpYWxseSBub2luc3RyIEMgKnRo
YXQgaGFzIFJDVSBkaXNhYmxlZCo/ICBXZSBhbHJlYWR5IGNhbuKAmXQgZm9sbG93IGFuIFJDVSBw
b2ludGVyLCBhbmQgSVNUTSB0aGUgb25seSBzdHlsZSBvZiBrZXJuZWwgY29kZSB0aGF0IG1pZ2h0
IGRvIHRoaXMgd291bGQgdXNlIFJDVSB0byBwcm90ZWN0IHRoZSBwb2ludGVyLCBhbmQgd2UgYXJl
IGFscmVhZHkgZG9vbWVkIGlmIHdlIGZvbGxvdyBhbiBSQ1UgcG9pbnRlciB0byBhbnkgc29ydCBv
ZiBtZW1vcnkuCj4+Cj4KPiBTbyB2NCBhbmQgZWFybGllciBoYWQgdGhlIFRMQiBmbHVzaCBmYWZm
IGRvbmUgaW4gQyBpbiB0aGUgY29udGV4dF90cmFja2luZyBlbnRyeQo+IGp1c3QgbGlrZSBzeW5j
X2NvcmUoKS4KPgo+IE15IGJpZ2dlc3QgaXNzdWUgd2l0aCBpdCB3YXMgdGhhdCBJIGNvdWxkbid0
IGZpZ3VyZSBvdXQgYSB3YXkgdG8gaW5zdHJ1bWVudAo+IG1lbW9yeSBhY2Nlc3NlcyBzdWNoIHRo
YXQgSSB3b3VsZCBnZXQgYW4gaWRlYSBvZiB3aGVyZSB2bWFsbG9jJ2QgYWNjZXNzZXMKPiBoYXBw
ZW4gLSBldmVuIHdpdGggYSBoYWNraXNoIHRoaW5nIGp1c3QgdG8gc3VydmV5IHRoZSBsYW5kc2Nh
cGUuIFNvIHdoaWxlIEkKPiBhZ3JlZSB3aXRoIHlvdXIgcmVhc29uaW5nIHdydCBlbnRyeSBub2lu
c3RyIGNvZGUsIEkgZG9uJ3QgaGF2ZSBhbnkgd2F5IHRvCj4gcHJvdmUgaXQuCj4gVGhhdCdzIHVu
bGlrZSB0aGUgdGV4dF9wb2tlIHN5bmNfY29yZSgpIGRlZmVycmFsIGZvciB3aGljaCBJIGhhdmUg
YWxsIG9mCj4gdGhhdCBuaWNlIG9ianRvb2wgaW5zdHJ1bWVudGF0aW9uLgo+Cj4gRGF2ZSBhbHNv
IHBvaW50ZWQgb3V0IHRoYXQgdGhlIHdob2xlIHN0YWxlIGVudHJ5IGZsdXNoIGRlZmVycmFsIGlz
IGEgcmlza3kKPiBtb3ZlLCBhbmQgdGhhdCB0aGUgc2FuZXN0IHRoaW5nIHdvdWxkIGJlIHRvIGV4
ZWN1dGUgdGhlIGRlZmVycmVkIGZsdXNoIGp1c3QKPiBhZnRlciBzd2l0Y2hpbmcgdG8gdGhlIGtl
cm5lbCBDUjMuCj4KPiBTZWUgdGhlIHRocmVhZCBzdXJyb3VuZGluZzoKPiAgIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xrbWwvMjAyNTAxMTQxNzUxNDMuODE0MzgtMzAtdnNjaG5laWRAcmVkaGF0
LmNvbS8KPgo+IG1haW5seSBEYXZlJ3MgcmVwbHkgYW5kIHN1YnRocmVhZDoKPiAgIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMzUyMzE3ZTMtYzdkYy00M2I0LWI0Y2ItOTY0NDQ4OTMxOGQw
QGludGVsLmNvbS8KPgo+PiBXZSBkbyBuZWVkIHRvIHdhdGNoIG91dCBmb3IgTk1JL01DRSBoaXR0
aW5nIGJlZm9yZSB3ZSBmbHVzaC4KCkkgcmVhZCBhIGRlY2VudCBmcmFjdGlvbiBvZiB0aGF0IHRo
cmVhZC4KCkxldCdzIGNvbnNpZGVyIHdoYXQgd2UncmUgd29ycmllZCBhYm91dDoKCjEuIEFyY2hp
dGVjdHVyYWwgYWNjZXNzIHRvIGEga2VybmVsIHZpcnR1YWwgYWRkcmVzcyB0aGF0IGhhcyBiZWVu
IHVubWFwcGVkLCBpbiBhc20gb3IgZWFybHkgQy4gIElmIGl0IGhhc24ndCBiZWVuIHJlbWFwcGVk
LCB0aGVuIHdlIG9vcHMgYW55d2F5LiAgSWYgaXQgaGFzLCB0aGVuIHRoYXQgbWVhbnMgd2UncmUg
YWNjZXNzaW5nIGEgcG9pbnRlciB3aGVyZSBlaXRoZXIgdGhlIHBvaW50ZXIgaGFzIGNoYW5nZWQg
b3IgdGhlIHBvaW50ZWUgaGFzIGJlZW4gcmVtYXBwZWQgd2hpbGUgd2UncmUgaW4gdXNlciBtb2Rl
LCBhbmQgdGhhdCdzIGEgdmVyeSBzdHJhbmdlIHRoaW5nIHRvIGRvIGZvciBhbnl0aGluZyB0aGF0
IHRoZSBhc20gcG9pbnRzIHRvIG9yIHRoYXQgZWFybHkgQyBwb2ludHMgdG8sIHVubGVzcyBSQ1Ug
aXMgaW52b2x2ZWQuICBCdXQgUkNVIGlzIGFscmVhZHkgZGlzYWxsb3dlZCBpbiB0aGUgZW50cnkg
cGF0aHMgdGhhdCBtaWdodCBiZSBpbiBleHRlbmRlZCBxdWllc2NlbnQgc3RhdGVzLCBzbyBJIHRo
aW5rIHRoaXMgaXMgbW9zdGx5IGEgbm9uaXNzdWUuCgoyLiBOb24tc3BlY3VsYXRpdmUgYWNjZXNz
IHZpYSBHRFQgYWNjZXNzLCBldGMuICBXZSBjYW4ndCBjb250cm9sIHRoaXMgYXQgYWxsLCBidXQg
d2UncmUgbm90IGF2b2lkIHRvIG1vdmUgdGhlIEdEVCwgSURULCBMRFQgZXRjIG9mIGEgcnVubmlu
ZyB0YXNrIHdoaWxlIHRoYXQgdGFzayBpcyBpbiB1c2VyIG1vZGUuICBXZSBkbyBtb3ZlIHRoZSBM
RFQsIGJ1dCB0aGF0J3MgcXVpdGUgdGhvcm91Z2hseSBzeW5jaHJvbml6ZWQgdmlhIElQSS4gIChT
aG91bGQgcHJvYmFibHkgYmUgZG91YmxlIGNoZWNrZWQuICBJIHdyb3RlIHRoYXQgY29kZSwgYnV0
IHRoYXQgZG9lc24ndCBtZWFuIEkgcmVtZW1iZXIgaXQgZXhhY3RseS4pCgozLiBTcGVjdWxhdGl2
ZSBUTEIgZmlsbHMuICBXZSBjYW4ndCBjb250cm9sIHRoaXMgYXQgYWxsLiAgV2UgaGF2ZSBoYWQg
YWN0dWFsIG1hY2hpbmUgY2hlY2tzLCBvbiBBTUQgSUlSQywgZHVlIHRvIG1lc3NpbmcgdGhpcyB1
cC4gIFRoaXMgaXMgd2h5IHdlIGNhbid0IGRlZmVyIGEgZmx1c2ggYWZ0ZXIgZnJlZWluZyBhIHBh
Z2UgdGFibGUuCgo0LiBTcGVjdWxhdGl2ZSBvciBvdGhlciBub25hcmNoaXRlY3R1cmFsIGxvYWRz
LiAgT25lIHdvdWxkIGhvcGUgdGhhdCB0aGVzZSBhcmUgbm90IGRhbmdlcm91cy4gIEZvciBleGFt
cGxlLCBhbiBlYXJseSB2ZXJzaW9uIG9mIFREWCB3b3VsZCBtYWNoaW5lIGNoZWNrIGlmIHdlIGRp
ZCBhIHNwZWN1bGF0aXZlIGxvYWQgZnJvbSBURFggbWVtb3J5LCBidXQgdGhhdCB3YXMgZml4ZWQu
ICBJIGRvbid0IHNlZSB3aHkgdGhpcyB3b3VsZCBiZSBtYXRlcmlhbGx5IGRpZmZlcmVudCBiZXR3
ZWVuIGFjdHVhbCB1c2Vyc3BhY2UgZXhlY3V0aW9uICh3aXRob3V0IExBU1MsIGFueXdheSksIGtl
cm5lbCBhc20sIGFuZCBrZXJuZWwgQy4KCjUuIFdyaXRlcyB0byBwYWdlIHRhYmxlIGRpcnR5IGJp
dHMuICBJIGRvbid0IHRoaW5rIHdlIHVzZSB0aGVzZS4KCkluIGFueSBjYXNlLCB0aGUgY3VycmVu
dCBpbXBsZW1lbnRhdGlvbiBpbiB5b3VyIHNlcmllcyBpcyByZWFsbHksIHJlYWxseSwgdXR0ZXJs
eSBob3JyaWZpY2FsbHkgc2xvdy4gIEl0J3MgcHJvYmFibHkgZmluZSBmb3IgYSB0YXNrIHRoYXQg
Z2VudWluZWx5IHNpdHMgaW4gdXNlcm1vZGUgZm9yZXZlciwgYnV0IEkgZG9uJ3QgdGhpbmsgaXQn
cyBsaWtlbHkgdG8gYmUgc29tZXRoaW5nIHRoYXQgd2UnZCBiZSB3aWxsaW5nIHRvIGVuYWJsZSBm
b3Igbm9ybWFsIGtlcm5lbHMgYW5kIG5vcm1hbCB0YXNrcy4gIEFuZCBpdCB3b3VsZCBiZSByZWFs
bHkgbmljZSBmb3IgdGhlIGRvbid0LWludGVycnVwdC11c2VyLWNvZGUgc3RpbGwgdG8gbW92ZSB0
b3dhcmQgYmVpbmcgYWx3YXlzIGF2YWlsYWJsZSByYXRoZXIgdGhhbiBmdXJ0aGVyIGZyb20gaXQu
CgoKSSBhZG1pdCB0aGF0IEknbSBraW5kIG9mIHdpdGggZGhhbnNlbjogWmVuIDMrIGNhbiB1c2Ug
SU5WTFBHQiBhbmQgZG9lc24ndCBuZWVkIGFueSBvZiB0aGlzLiAgU29tZSBJbnRlbCBDUFVzIHN1
cHBvcnQgUkFSIGFuZCB3aWxsIGV2ZW50dWFsbHkgYmUgYWJsZSB0byB1c2UgUkFSLCBwb3NzaWJs
eSBldmVuIGZvciBzeW5jX2NvcmUoKS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
