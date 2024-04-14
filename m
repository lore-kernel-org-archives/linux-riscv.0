Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB799C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2024 14:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFk86cnwmuKbOQV4DyCPrUaEFf4UCuwITHg6ueQ9UAw=; b=zlZQ34X8YbIhy6
	7bfE3sMSxPaDRRJPXqDUp4a7tgTxchnLoQ84+vHQvFJPDqY4nmgzHNfpI4C0D7flupEVfmh6S/48t
	/qTV2F8kCe7kLlrc6p4e6AeO9KtaNaizSDFOMf1B2jszzxY8HC4pWi5eQcbUY9heALRkHVD/yHejy
	UZE624Vwymq7UVQtFLq3oIWL25Vp4G2R42h/jdAg8r3DwpR2JLj9kSZ2YSkdeAVRL8aPOb13QB4jj
	F2PRZQksBkE1CsKNmMF/DFZvgtWzlf+CfTJAszfexLeZ6kGTaxZoIgoZmp8V5iPpnlBaTqiSXu9LB
	4gU7GRXHzbACKUbDw7LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw0Wr-00000005agB-0EiD;
	Sun, 14 Apr 2024 14:08:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw0Wn-00000005aec-2wRo
	for linux-riscv@lists.infradead.org;
	Sun, 14 Apr 2024 14:08:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C167E60B76;
	Sun, 14 Apr 2024 14:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7932C2BD11;
	Sun, 14 Apr 2024 14:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713103695;
	bh=nJphaxyGk5suB7H36OjqlLYhSoBdMx7ElHPwRl517d0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KKtfqaGXNf6ctHlU9UkBITIAtIiMUXT6NFIiTGdm3+tyNS5BojD78UO4E3Bs+JzRk
	 hUS6xHiWSaYJRGhHykfOeuGRQf8Ng4wSSrKTPIQ1KP4E1DAy3dnD/NHTGo1/dtM2Ev
	 Q9VeGbig0+8dF17EoYKo2eg8Jjq3OyD2gLyAOXNR8pusfRt3tJhtHa4tZDJqYV4DAy
	 Oc+2UvT+7j7NVGyyRAHUVoIgDp3DqoN2Cgq5JsBrYMTyfsjTCc2J6M7J5/gqRVagc9
	 MJar/oNL/+BYrBvsVgS/30FQi6r1T7ghGUy466yxWtmcrYKDBUb9cWtrLJPNKdyo+G
	 JkfZw2ubteobw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andreas Dilger <adilger@dilger.ca>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Nam Cao <namcao@linutronix.de>, linux-fsdevel
 <linux-fsdevel@vger.kernel.org>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Theodore
 Ts'o <tytso@mit.edu>, Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Conor Dooley <conor@kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
In-Reply-To: <887E261B-3C76-4CD9-867B-5D087051D004@dilger.ca>
References: <878r1ibpdn.fsf@all.your.base.are.belong.to.us>
 <20240413164318.7260c5ef@namcao>
 <22E65CA5-A2C0-44A3-AB01-7514916A18FC@dilger.ca>
 <20240414021555.GQ2118490@ZenIV>
 <887E261B-3C76-4CD9-867B-5D087051D004@dilger.ca>
Date: Sun, 14 Apr 2024 16:08:11 +0200
Message-ID: <87v84kujec.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_070817_880273_7E6F1353 
X-CRM114-Status: GOOD (  14.99  )
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

QW5kcmVhcyBEaWxnZXIgPGFkaWxnZXJAZGlsZ2VyLmNhPiB3cml0ZXM6Cgo+IE9uIEFwciAxMywg
MjAyNCwgYXQgODoxNSBQTSwgQWwgVmlybyA8dmlyb0B6ZW5pdi5saW51eC5vcmcudWs+IHdyb3Rl
Ogo+PiAKPj4gT24gU2F0LCBBcHIgMTMsIDIwMjQgYXQgMDc6NDY6MDNQTSAtMDYwMCwgQW5kcmVh
cyBEaWxnZXIgd3JvdGU6Cj4+IAo+Pj4gQXMgdG8gd2hldGhlciB0aGUgMHhmZmZmZjAwMCBhZGRy
ZXNzIGl0c2VsZiBpcyB2YWxpZCBmb3IgcmlzY3YzMiBpcwo+Pj4gb3V0c2lkZSBteSByZWFsbSwg
YnV0IGdpdmVuIHRoYXQgUkFNIGlzIGNoZWFwIGl0IGRvZXNuJ3Qgc2VlbSB1bmxpa2VseQo+Pj4g
dG8gaGF2ZSA0R0IrIG9mIFJBTSBhbmQgd2FudCB0byB1c2UgaXQgYWxsLiAgVGhlIHJpc2N2MzIg
bWlnaHQgY29uc2lkZXIKPj4+IHJlc2VydmluZyB0aGlzIHBhZ2UgYWRkcmVzcyBmcm9tIGFsbG9j
YXRpb24gdG8gYXZvaWQgc2ltaWxhciBpc3N1ZXMgaW4KPj4+IG90aGVyIHBhcnRzIG9mIHRoZSBj
b2RlLCBhcyBpcyBkb25lIHdpdGggdGhlIE5VTEwvMCBwYWdlIGFkZHJlc3MuCj4+IAo+PiBOb3Qg
YSBjaGFuY2UuICAqQW55KiBwYWdlIG1hcHBlZCB0aGVyZSBpcyBhIHNlcmlvdXMgYnVnIG9uIGFu
eSAzMmJpdAo+PiBib3guICBSZWNhbGwgd2hhdCBFUlJfUFRSKCkgaXMuLi4KPj4gCj4+IE9uIGFu
eSBhcmNoaXRlY3R1cmUgdGhlIHZpcnR1YWwgYWRkcmVzc2VzIGluIHJhbmdlICh1bnNpZ25lZCBs
b25nKS01MTIuLgo+PiAodW5zaWduZWQgbG9uZyktMSBtdXN0IG5ldmVyIHJlc29sdmUgdG8gdmFs
aWQga2VybmVsIG9iamVjdHMuCj4+IEluIG90aGVyIHdvcmRzLCBhbnkga2luZCBvZiB3cmFwYXJv
dW5kIGhlcmUgaXMgYXNraW5nIGZvciBhbiBvb3BzIG9uCj4+IGF0dGVtcHRzIHRvIGFjY2VzcyB0
aGUgZWxlbWVudHMgb2YgYnVmZmVyIC0ga2VybmVsIGRlcmVmZXJlbmNlIG9mCj4+IChjaGFyICop
MHhmZmZmZjAwMCBvbiBhIDMyYml0IGJveCBpcyBhbHJlYWR5IGEgYnVnLgo+PiAKPj4gSXQgbWln
aHQgYmUgZ2V0dGluZyBhbiBpbnZhbGlkIHBvaW50ZXIsIGJ1dCBhcml0aG1ldGljYWwgb3ZlcmZs
b3dzCj4+IGFyZSBpcnJlbGV2YW50Lgo+Cj4gVGhlIG9yaWdpbmFsIGJ1ZyByZXBvcnQgc3RhdGVk
IHRoYXQgc2VhcmNoX2J1ZiA9IDB4ZmZmZmYwMDAgb24gZW50cnksCj4gYW5kIEknZCBxdW90ZWQg
dGhhdCBhdCB0aGUgc3RhcnQgb2YgbXkgZW1haWw6Cj4KPiBPbiBBcHIgMTIsIDIwMjQsIGF0IDg6
NTcgQU0sIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiBXaGF0IEkg
c2VlIGluIGV4dDRfc2VhcmNoX2RpcigpIGlzIHRoYXQgc2VhcmNoX2J1ZiBpcyAweGZmZmZmMDAw
LCBhbmQgYXQKPj4gc29tZSBwb2ludCB0aGUgYWRkcmVzcyB3cmFwcyB0byB6ZXJvLCBhbmQgYm9v
bS4gSSBkb3VidCB0aGF0IDB4ZmZmZmYwMDAKPj4gaXMgYSBzYW5lIGFkZHJlc3MuCj4KPiBOb3cg
dGhhdCB5b3UgbWVudGlvbiBFUlJfUFRSKCkgaXQgZGVmaW5pdGVseSBtYWtlcyBzZW5zZSB0aGF0
IHRoaXMgbGFzdAo+IHBhZ2UgSEFTIHRvIGJlIGV4Y2x1ZGVkLgo+Cj4gU28gc29tZSBvdGhlciBi
dWcgaXMgcGFzc2luZyB0aGUgYmFkIHBvaW50ZXIgdG8gdGhpcyBjb2RlIGJlZm9yZSB0aGlzCj4g
ZXJyb3IsIG9yIHRoZSBhcmNoIGlzIG5vdCBjb3JyZWN0bHkgZXhjbHVkaW5nIHRoaXMgcGFnZSBm
cm9tIGFsbG9jYXRpb24uCgpZZWFoLCBzb21ldGhpbmcgaXMgb2ZmIGZvciBzdXJlLgoKKEZXSVcs
IEkgbWFuYWdlIHRvIGhpdCB0aGlzIGZvciBMaW51cycgbWFzdGVyIGFzIHdlbGwuKQoKSSBhZGRl
ZCBhIHByaW50IChjbG9zZSB0byB0cmFjZV9tbV9maWxlbWFwX2FkZF90b19wYWdlX2NhY2hlKCkp
LCBhbmQgZm9yCnRoaXMgQlQ6CgogIFs8YzAxZThiMzQ+XSBfX2ZpbGVtYXBfYWRkX2ZvbGlvKzB4
MzIyLzB4NTA4CiAgWzxjMDFlOGQ2ZT5dIGZpbGVtYXBfYWRkX2ZvbGlvKzB4NTQvMHhjZQogIFs8
YzAxZWEwNzY+XSBfX2ZpbGVtYXBfZ2V0X2ZvbGlvKzB4MTU2LzB4MmFhCiAgWzxjMDJkZjM0Nj5d
IF9fZ2V0YmxrX3Nsb3crMHhjYy8weDMwMgogIFs8YzAyZGY1ZjI+XSBiZGV2X2dldGJsaysweDc2
LzB4N2EKICBbPGMwMzUxOWRhPl0gZXh0NF9nZXRibGsrMHhiYy8weDJjNAogIFs8YzAzNTFjYzI+
XSBleHQ0X2JyZWFkX2JhdGNoKzB4NTYvMHgxODYKICBbPGMwMzZiY2FhPl0gX19leHQ0X2ZpbmRf
ZW50cnkrMHgxNTYvMHg1NzgKICBbPGMwMzZjMTUyPl0gZXh0NF9sb29rdXArMHg4Ni8weDFmNAog
IFs8YzAyYTMyNTI+XSBfX2xvb2t1cF9zbG93KzB4OGUvMHgxNDIKICBbPGMwMmE2ZDcwPl0gd2Fs
a19jb21wb25lbnQrMHgxMDQvMHgxNzQKICBbPGMwMmE3OTNjPl0gcGF0aF9sb29rdXBhdCsweDc4
LzB4MTgyCiAgWzxjMDJhOGM3Yz5dIGZpbGVuYW1lX2xvb2t1cCsweDk2LzB4MTU4CiAgWzxjMDJh
OGQ3Nj5dIGtlcm5fcGF0aCsweDM4LzB4NTYKICBbPGMwYzFjYjdhPl0gaW5pdF9tb3VudCsweDVj
LzB4YWMKICBbPGMwYzJiYTRjPl0gZGV2dG1wZnNfbW91bnQrMHg0NC8weDdhCiAgWzxjMGMwMWNj
ZT5dIHByZXBhcmVfbmFtZXNwYWNlKzB4MjI2LzB4MjdjCiAgWzxjMGMwMTFjNj5dIGtlcm5lbF9p
bml0X2ZyZWVhYmxlKzB4Mjg2LzB4MmE4CiAgWzxjMGI5N2FiOD5dIGtlcm5lbF9pbml0KzB4MmEv
MHgxNTYKICBbPGMwYmEyMmNhPl0gcmV0X2Zyb21fZm9yaysweGUvMHgyMAoKSSBnZXQgYSBmb2xp
byB3aGVyZSBmb2xpb19hZGRyZXNzKGZvbGlvKSA9PSAweGZmZmZmMDAwICh3aGljaCBpcwpicm9r
ZW4pLgoKTmVlZCB0byBnbyBpbnRvIHRoZSB3ZWVkcyBoZXJlLi4uCgoKQmrDtnJuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
