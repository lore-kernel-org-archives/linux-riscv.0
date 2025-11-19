Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA832CF34B2
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 14:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1HS8hzRENISW2zi/lDLEqKYr7LNozrxqGCJprKoIaBg=; b=vMFO5aNrkRnZVktXgGFTHMa6DN
	6Oz9ciOhqU0+SIXOBdv5JVz3+hpS7dBZSCak6jVbVff0kooCQv5UBw4tIUcWZApvkWCJik8tJSA9+
	aTa/j2qlmKYbpPfJyiMs/eX409BDdpzNCebWsEAKCiZ5pOQcPItHlxb46z+3QZ07ArWJwiTNMJ6AU
	lmaXm1tGGDuOMOC97fh5+N0dUvvFHalB5nSa/95XtcZ4WUnJlpj9+1G73X6J2S9AgeFVAqW6+9BRR
	hDFCUsmuhxYaeBiPl4xJu6D3Y4/HEibvQdw0TO+bZ+ImEaWl0NmALM2cuDnOr6bGjhNc940fbQo0+
	MgObKjuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjDx-00000003NfT-0xzF;
	Wed, 19 Nov 2025 14:31:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjDw-00000003NfA-0MOO
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 14:31:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E80C26016B;
	Wed, 19 Nov 2025 14:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4EC7C2BCB1;
	Wed, 19 Nov 2025 14:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763562714;
	bh=t7JHEvub1bQJal+g6fm+oWNxS6WRDvkPwGmxdErav44=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Ea4bojU3b4uuNYkYVwnmXHYKrqlrEyIaRN7/uuLqQ0tjPkP+0CBl8L7OWP74jMhkR
	 6BEZWebMdOXDsVMaFdTA/3c4Ol/FfmWfZJ7I77nIstjY/8MxmX60jwnojnAv9c5OB6
	 yiaxqYjeyx5Rbc+bcCTpfw9nnAVkEBGMQ7n8TQ68Sdv8V0/fXWca/2aZJ+PdDOCe1Z
	 fgqUw43kE8xbSlEr9OaiWF6IUiQPM10iJQo0m7vG74uwaC7eKHKSOTyPWFK+IxX8Cr
	 NCsa459K8S2l9VNSLvncI+/+4fDDtvhtPnwSSP5VIBtd53subUnkzEeGp3uNl9yo2f
	 QaAOeHd7myqGw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 560CFF4008D;
	Wed, 19 Nov 2025 09:31:51 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 19 Nov 2025 09:31:51 -0500
X-ME-Sender: <xms:19Qdaap8BjsJbFtssqDUjnsMU_LQS_YP23cqGo1hqasAALMZnLH2Jw>
    <xme:19QdaTekCirxoT8xxcC2RnapN71lsrezhBKHk9cWFJTrytiWHrCnoOSQ_WG25jLgz
    VLVYir4VtevPFlszmb_dX0zPBndPMUq9wQrH4t08wLIbtcqw1mEIP0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvvdeggeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehnugih
    ucfnuhhtohhmihhrshhkihdfuceolhhuthhosehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhepjeejvddvtdehffdtgfejjeefgefgjeeggfeuteeiuedvtefgfffhvdej
    iefguedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnugihodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduudeiudekheei
    fedvqddvieefudeiiedtkedqlhhuthhopeepkhgvrhhnvghlrdhorhhgsehlihhnuhigrd
    hluhhtohdruhhspdhnsggprhgtphhtthhopeegkedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepjhgsrghrohhnsegrkhgrmhgrihdrtghomhdprhgtphhtthhopegsphesrg
    hlihgvnhekrdguvgdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthht
    ohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmrghthhhivg
    hurdguvghsnhhohigvrhhssegvfhhfihgtihhoshdrtghomhdprhgtphhtthhopegsohhq
    uhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopehurhgviihkihesghhmrg
    hilhdrtghomhdprhgtphhtthhopehrohhsthgvughtsehgohhoughmihhsrdhorhhgpdhr
    tghpthhtohepjhgrnhhnhhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:19QdaSQxr3HQaS5D5svYtdioLzJ9DrcJWaaCXygndJcKZTp8DQA1XQ>
    <xmx:19QdaRuKJfSzLCcUvQaFs6zUjI1C5yzQpwXIrnbakBUBZf6Go7P5Dw>
    <xmx:19QdaRsZ04AgZVVF3BYyQvlnngCHXui5cx1xuooIBwrJs48FrjqOhQ>
    <xmx:19QdaZdxW-cnpAjF52S13LU5nKqG8Kl70x0BiZJ1Wz-zYL2XACcj4g>
    <xmx:19QdaU7njPzMtRawVt5wHwKl1sfmi7DCVtIMkE__tcglxZK-V1ApZbUe>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1FAFE700054; Wed, 19 Nov 2025 09:31:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A2ZwPDH9FoLc
Date: Wed, 19 Nov 2025 06:31:30 -0800
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
Message-Id: <65ae9404-5d7d-42a3-969e-7e2ceb56c433@app.fastmail.com>
In-Reply-To: <20251114151428.1064524-9-vschneid@redhat.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
 <20251114151428.1064524-9-vschneid@redhat.com>
Subject: Re: [RFC PATCH v7 29/31] x86/mm/pti: Implement a TLB flush immediately after a
 switch to kernel CR3
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

CgpPbiBGcmksIE5vdiAxNCwgMjAyNSwgYXQgNzoxNCBBTSwgVmFsZW50aW4gU2NobmVpZGVyIHdy
b3RlOgo+IERlZmVycmluZyBrZXJuZWwgcmFuZ2UgVExCIGZsdXNoZXMgcmVxdWlyZXMgdGhlIGd1
YXJhbnRlZSB0aGF0IHVwb24KPiBlbnRlcmluZyB0aGUga2VybmVsLCBubyBzdGFsZSBlbnRyeSBt
YXkgYmUgYWNjZXNzZWQuIFRoZSBzaW1wbGVzdCB3YXkgdG8KPiBwcm92aWRlIHN1Y2ggYSBndWFy
YW50ZWUgaXMgdG8gaXNzdWUgYW4gdW5jb25kaXRpb25hbCBmbHVzaCB1cG9uIHN3aXRjaGluZwo+
IHRvIHRoZSBrZXJuZWwgQ1IzLCBhcyB0aGlzIGlzIHRoZSBwaXZvdGluZyBwb2ludCB3aGVyZSBz
dWNoIHN0YWxlIGVudHJpZXMKPiBtYXkgYmUgYWNjZXNzZWQuCj4KCkRvaW5nIHRoaXMgdG9nZXRo
ZXIgd2l0aCB0aGUgUFRJIENSMyBzd2l0Y2ggaGFzIG5vIGFjdHVhbCBiZW5lZml0OiBNT1YgQ1Iz
IGRvZXNu4oCZdCBmbHVzaCBnbG9iYWwgcGFnZXMuIEFuZCBkb2luZyB0aGlzIGluIGFzbSBpcyBw
cmV0dHkgZ3Jvc3MuICBXZSBkb27igJl0IGV2ZW4gZ2V0IGEgZnJlZSBzeW5jX2NvcmUoKSBvdXQg
b2YgaXQgYmVjYXVzZSBJTlZQQ0lEIGlzIG5vdCBkb2N1bWVudGVkIGFzIGJlaW5nIHNlcmlhbGl6
aW5nLgoKV2h5IGNhbuKAmXQgd2UgZG8gaXQgaW4gQz8gIFdoYXTigJlzIHRoZSBhY3R1YWwgcmlz
az8gIEluIG9yZGVyIHRvIHRyaXAgb3ZlciBhIHN0YWxlIFRMQiBlbnRyeSwgd2Ugd291bGQgbmVl
ZCB0byBkZWZlcmVuY2UgYSBwb2ludGVyIHRvIG5ld2x5IGFsbG9jYXRlZCBrZXJuZWwgdmlydHVh
bCBtZW1vcnkgdGhhdCB3YXMgbm90IHZhbGlkIHByaW9yIHRvIG91ciBlbnRyeSBpbnRvIHVzZXIg
bW9kZS4gSSBjYW4gaW1hZ2luZSBCUEYgZG9pbmcgdGhpcywgYnV0IHBsYWluIG5vaW5zdHIgQyBp
biB0aGUgZW50cnkgcGF0aD8gIEVzcGVjaWFsbHkgbm9pbnN0ciBDICp0aGF0IGhhcyBSQ1UgZGlz
YWJsZWQqPyAgV2UgYWxyZWFkeSBjYW7igJl0IGZvbGxvdyBhbiBSQ1UgcG9pbnRlciwgYW5kIElT
VE0gdGhlIG9ubHkgc3R5bGUgb2Yga2VybmVsIGNvZGUgdGhhdCBtaWdodCBkbyB0aGlzIHdvdWxk
IHVzZSBSQ1UgdG8gcHJvdGVjdCB0aGUgcG9pbnRlciwgYW5kIHdlIGFyZSBhbHJlYWR5IGRvb21l
ZCBpZiB3ZSBmb2xsb3cgYW4gUkNVIHBvaW50ZXIgdG8gYW55IHNvcnQgb2YgbWVtb3J5LgoKV2Ug
ZG8gbmVlZCB0byB3YXRjaCBvdXQgZm9yIE5NSS9NQ0UgaGl0dGluZyBiZWZvcmUgd2UgZmx1c2gu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
