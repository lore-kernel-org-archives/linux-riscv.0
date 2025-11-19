Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C20DCF58C8
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 18:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0diRFyUXtkkpt9qJEUNuL01RUCwHX752uatMicnPmBo=; b=BIn+whiaddEmBJsX0Q2WBdR2Ht
	bnS+QXZhFeYD6OzJ+J1EVTKALHWsZ5X5BKQym6r/8+Wza6FyQwG8SUizRd+UlrFvNzuYXIpdVdhzj
	ylkdf5lPvgrtips85rUiG76jP1klbLufL9Po0csCTiv7ieKGwZuuijOxdGFuzvs+uakCMSZJAXOim
	pQZ9ODJrwrbKZ1W9fM5ioUhloTHIooAaW/Ssp2aP1mc5Dk3wb5/+edij6ujIQOLr0VpwUUnGcqpr2
	MeVJwCo15zvUhvsxbZrI2Nj5pPABAUiM0HJJYWM1EfKSS2kDZ/K81o9ChFa/ytXV/jmbDbnx7G8+c
	s+zqVtCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLn0C-00000004dDz-3BRj;
	Wed, 19 Nov 2025 18:34:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLn0B-00000004dDf-1Xv0;
	Wed, 19 Nov 2025 18:33:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53E626019F;
	Wed, 19 Nov 2025 18:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97AEEC4CEF5;
	Wed, 19 Nov 2025 18:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763577238;
	bh=isuSe0vHAL4pBqh4kPYeDqNJgvukP3SkbC0ClCMHi/U=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Oj6dh3QF2+yqHgZl00hjnXzhiNz+Kd5gYv4Mj4vHnoLuipqptSvCQU/ENuPdlJrkM
	 QCZqRhvmmZXjGd/NFfGhOlECLddt5EAF6gsnDbdre02U3ZehF2T2bdHQYrvGRRjZRI
	 KIUnyGtdsfnJYxILq0DcK0YYT7H1xJuQ214CUgOUoDfVAz3tSQPe6BZ8jeuzAcBm1p
	 wXft2yGvOtlxxVS/f2uFljuXnVnBuAEiQdQEuRS49EJQ/cQJ3m8lwZTWNnHhaozgGs
	 apJhTg7BHqj7YbEppl1GoT03u3M/p2wK2rr8z7Rl1f58PwIPr+i0ClaOfchr52lQVa
	 yxyq/528F3qvw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8AE21F40084;
	Wed, 19 Nov 2025 13:33:55 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 19 Nov 2025 13:33:55 -0500
X-ME-Sender: <xms:kw0eaXtHW_hPzTjGGcVhcydgSpeOMQsuqt-CDQ2ce8lXwh_2XkBDew>
    <xme:kw0eaTTFCCwjUA8kF8nkRRywEr7igPyQ-OlA6aLIu76kha6OTU-uEILXGlFKbpWmH
    l1XsdpwdhUBo5Q6bK0a2g_fD9owfX20pc_Ddgru3Du8XugMOTSVRBE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvvdegledvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehnugih
    ucfnuhhtohhmihhrshhkihdfuceolhhuthhosehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhepjeejvddvtdehffdtgfejjeefgefgjeeggfeuteeiuedvtefgfffhvdej
    iefguedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnugihodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduudeiudekheei
    fedvqddvieefudeiiedtkedqlhhuthhopeepkhgvrhhnvghlrdhorhhgsehlihhnuhigrd
    hluhhtohdruhhspdhnsggprhgtphhtthhopeegledpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepjhgsrghrohhnsegrkhgrmhgrihdrtghomhdprhgtphhtthhopegsphesrg
    hlihgvnhekrdguvgdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthht
    ohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmrghthhhivg
    hurdguvghsnhhohigvrhhssegvfhhfihgtihhoshdrtghomhdprhgtphhtthhopegsohhq
    uhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopehurhgviihkihesghhmrg
    hilhdrtghomhdprhgtphhtthhopehrohhsthgvughtsehgohhoughmihhsrdhorhhgpdhr
    tghpthhtohepjhgrnhhnhhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:kw0eaUKcvBX6ZqDb2Zfz2lS6ZTPn-nXSDUpeDQirQ9WsFITs37m1FA>
    <xmx:kw0eadq2-jmwILaPpoRuPfN2N1yM3Y8zfKpCUT6xaUllbcz1l4r_ww>
    <xmx:kw0eaY_jsr-_Ab2g_NL1wFjttUgbqyW25dTE8Gwsk4BL2Ms0a7Nw1g>
    <xmx:kw0eaY-o7o-_VANLMjD5K5xLI3aUCtOQ36zJ9mu52nOwG5c_vbE8HA>
    <xmx:kw0eaT6PvxdLshew8G6EsocVLck8YE1dY0HQ7jptKjjUdBShZ13KNOpC>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4771A700054; Wed, 19 Nov 2025 13:33:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A1wO5D87xXUg
Date: Wed, 19 Nov 2025 10:33:35 -0800
From: "Andy Lutomirski" <luto@kernel.org>
To: "Dave Hansen" <dave.hansen@intel.com>,
 "Valentin Schneider" <vschneid@redhat.com>,
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
Message-Id: <292ebf6a-4a7a-43b2-a670-ea53728f2c06@app.fastmail.com>
In-Reply-To: <bad9eaaa-561a-498a-90d1-fe3a3ab8ba37@intel.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
 <20251114151428.1064524-10-vschneid@redhat.com>
 <bad9eaaa-561a-498a-90d1-fe3a3ab8ba37@intel.com>
Subject: Re: [RFC PATCH v7 30/31] x86/mm, mm/vmalloc: Defer kernel TLB flush IPIs under
 CONFIG_COALESCE_TLBI=y
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

CgpPbiBXZWQsIE5vdiAxOSwgMjAyNSwgYXQgMTA6MzEgQU0sIERhdmUgSGFuc2VuIHdyb3RlOgo+
IE9uIDExLzE0LzI1IDA3OjE0LCBWYWxlbnRpbiBTY2huZWlkZXIgd3JvdGU6Cj4+ICtzdGF0aWMg
Ym9vbCBmbHVzaF90bGJfa2VybmVsX2NvbmQoaW50IGNwdSwgdm9pZCAqaW5mbykKPj4gK3sKPj4g
KwlyZXR1cm4gaG91c2VrZWVwaW5nX2NwdShjcHUsIEhLX1RZUEVfS0VSTkVMX05PSVNFKSB8fAo+
PiArCSAgICAgICBwZXJfY3B1KGtlcm5lbF9jcjNfbG9hZGVkLCBjcHUpOwo+PiArfQo+Cj4gSXMg
aXQgT0sgdGhhdCAna2VybmVsX2NyM19sb2FkZWQnIGNhbiBiZSBiZSBzdGFsZT8gU2luY2UgaXQn
cyBub3QgcGFydAo+IG9mIHRoZSBpbnN0cnVjdGlvbiB0aGF0IGFjdHVhbGx5IHNldHMgQ1IzLCB0
aGVyZSdzIGEgd2luZG93IGJldHdlZW4gd2hlbgo+ICdrZXJuZWxfY3IzX2xvYWRlZCcgaXMgc2V0
IChvciBjbGVhcmVkKSBhbmQgQ1IzIGlzIGFjdHVhbGx5IHdyaXR0ZW4uCj4KPiBJcyB0aGF0IE9L
Pwo+Cj4gSXQgc2VlbXMgbGlrZSBpdCBjb3VsZCBsZWFkIHRvIGJvdGggdW5uZWNlc3NhcnkgSVBJ
cyBiZWluZyBzZW50IGFuZCBmb3IKPiBJUElzIHRvIGJlIG1pc3NlZC4KCkkgcmVhZCB0aGUgY29k
ZSBlYXJsaWVyIHRvZGF5IGFuZCBJICp0aGluayogaXTigJlzIG1heWJlIG9rYXkuIEl04oCZcyBx
dWl0ZSBjb25mdXNpbmcgdGhhdCB0aGlzIHRoaW5nIGlzIHNwbGl0IGFtb25nIG11bHRpcGxlIHBh
dGNoZXMsIGFuZCB0aGUgbWVtb3J5IG9yZGVyaW5nIGlzc3VlcyBuZWVkIGNvbW1lbnRzLgoKVGhl
IGZhY3QgdGhhdCB0aGUgYmlnIGZsdXNoIGlzIGJhc2ljYWxseSB1bmNvbmRpdGlvbmFsIGF0IHRo
aXMgcG9pbnQgaGVscHMuIFRoZSBmYWN0IHRoYXQgaXTigJlzIHRhbmdsZWQgdXAgd2l0aCBDUjMg
ZXZlbiB0aG91Z2ggdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gaGFzIG5vdGhpbmcgdG8gZG8g
d2l0aCBDUjMgZG9lcyBub3QgaGVscC4KCknigJltIGtpbmQgb2Ygd2l0aCBkaGFuc2VuIHRob3Vn
aCDigJQgdGhlIGZhY3QgdGhhdCB0aGUgaW1wbGVtZW50YXRpb24gaXMgc28gbmFzdHkgY291cGxl
ZCB3aXRoIHRoZSBmYWN0IHRoYXQgbW9kZXJuIENQVXMgY2FuIGRvIHRoaXMgaW4gaGFyZHdhcmUg
bWFrZXMgdGhlIHdob2xlIHRoaW5nIGtpbmQgb2YgdW5wYWxhdGFibGUuCgo+Cj4gSSBzdGlsbCBf
cmVhbGx5XyB3aXNoIGZvbGtzIHdvdWxkIGJlIHdpbGxpbmcgdG8gZ2V0IG5ld2VyIENQVXMgdG8g
Z2V0Cj4gdGhpcyBiZWhhdmlvciByYXRoZXIgdGhhbiBnb2luZyB0aHJvdWdoIGFsbCB0aGlzIGNv
bXBsZXhpdHkuIFJBUiBpbgo+IHBhcnRpY3VsYXIgd2FzICpzcGVjaWZpY2FsbHkqIGRlc2lnbmVk
IHRvIGtlZXAgVExCIGZsdXNoaW5nIElQSXMgZnJvbQo+IGJsaXBwaW5nIHVzZXJzcGFjZSBmb3Ig
dG9vIGxvbmcuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
