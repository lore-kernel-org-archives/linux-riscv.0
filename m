Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC35EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 08:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1RW5/I42KIayZHp2t8mo2SWWFIDg0dcqZ6JR6l/GGD8=; b=ntoPkZOJTXjbrA
	gzBKVSNlqEGiFsmnLI40cRrSiDxq0VpTsU4K7IVPLmeACKUgF9UilXCywxkW1yesa0an1czxGWz3T
	Wp9ojxpUc9sSEgZFSM+GRL2iUEzXXbTANaOvN8HYPYjNKmWl0Kk/6ohY5EzibGuRxtr55xJ7qtVxo
	v+XYFn6or1v3rVvFpHsb8vHbtdciA67Bm3S04hg/Ue1HC/rvQ08KM30sb3/Em1HHvf2EQTG+4kVvr
	/ciInTQS2pRpEUdcbDmgHiccvtZF+ExyvWeDOpo6QgP2Ubsy5mM+k1OpnG9tgIv5O4pRaqODvOGcx
	KrClPib5fTiurGspOmRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Cb-006Dfd-2L;
	Wed, 19 Jul 2023 08:06:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2CY-006DbM-2z
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 08:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YGiv9/fSZ9/x4l9j0o250oTmzheTChRDROaZqjcT0Uk=; b=WxDMDMhiAkfhXuy3U5LQqEA8Xi
	cVteoyGY7gwzhDkHHlDgJ83/OB2fY5yXjliC69EtnN9+lGTEo17+HiF5JKxNIG4UdYaL5GTc5HCoG
	5t+wo0MdZSyZRxbMmWoTf+c5uC5fjSgc5Ce0VCiaV9oFzDRw4BG+eC/xKC2zr9sYOiDFcJPTSBL7w
	rk0Z9Bt/boZjaHLF/7s5nwMZiEOF/lg6HXMcezSg9zkAB1n3dSCbAQFSb8YJUXbCMHAzMEvOeVUTe
	OB2fxF75RqPk8afK3eQlt5lAsCiA77d4app34+QuyPs/08UlRKoylM1uXhqUeQYchhik/wY9kI66i
	fadIDHIg==;
Received: from 13.mo582.mail-out.ovh.net ([188.165.56.124])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLo9u-00BoDe-2q
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 17:06:49 +0000
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.143.208])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 24BDA2437F
	for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 17:06:40 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-kgjmm (unknown [10.110.115.151])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B05EE1FE4F;
	Tue, 18 Jul 2023 17:06:37 +0000 (UTC)
Received: from courmont.net ([37.59.142.109])
	by ghost-submission-6684bf9d7b-kgjmm with ESMTPSA
	id co++IZ3GtmTPUgEAdIjfRg
	(envelope-from <remi@remlab.net>); Tue, 18 Jul 2023 17:06:37 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-109S003826dc6eb-88b5-4684-a2f6-36c303c88a24,
                    3111FEB0E50A85C15A7B3C8E702AC4BF574C28F6) smtp.auth=postmaster@courmont.net
X-OVh-ClientIp: 87.92.194.88
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Aurelien Jarno <aurelien@aurel32.net>,
 Mathieu Malaterre <malat@debian.org>, Jan Newger <jannewger@google.com>
Subject: Re: [PATCH v4 00/10] riscv: Allow userspace to directly access perf counters
Date: Tue, 18 Jul 2023 20:06:36 +0300
Message-ID: <4761144.fSbbhVQpq0@basile.remlab.net>
Organization: Remlab
In-Reply-To: <CAOnJCU+ee=FXWp7mz_Tn07TbRBb3eXLFBqyRBAJbhQTO-Jxvrw@mail.gmail.com>
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
 <DDB4EEB8-12A0-4E66-8E96-808E84A82078@remlab.net>
 <CAOnJCU+ee=FXWp7mz_Tn07TbRBb3eXLFBqyRBAJbhQTO-Jxvrw@mail.gmail.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 14312439619513293242
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrgeeggddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkohgjfhgggfgtsehtqhertddttdejnecuhfhrohhmpeftrohmihcuffgvnhhishdqvehouhhrmhhonhhtuceorhgvmhhisehrvghmlhgrsgdrnhgvtheqnecuggftrfgrthhtvghrnhephedujedulefftedvvefgueehjeekhfeukeegtdeijefgheevgeehkeekhedtleeknecuffhomhgrihhnpehffhhmphgvghdrohhrghdprhgvmhhlrggsrdhnvghtnecukfhppeduvdejrddtrddtrddupdekjedrledvrdduleegrdekkedpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrvghmihesrhgvmhhlrggsrdhnvghtqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_180647_023128_4109F0BC 
X-CRM114-Status: GOOD (  22.15  )
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

CUhpLAoKTGUgdGlpc3RhaW5hIDE4LiBoZWluw6RrdXV0YSAyMDIzLCAyLjIyLjU0IEVFU1QgQXRp
c2ggUGF0cmEgYSDDqWNyaXQgOgo+ID4gQUZBSUssIGlmIHRoZSBkZWZhdWx0IHNldHRpbmdzIGJy
ZWFrcyB1c2VyIHNwYWNlLCB0aGUgcGF0Y2hzZXQgaXMKPiA+IGNvbnNpZGVyZWQgdG8gYnJlYWsg
dXNlciBzcGFjZS4gVGhhdCBiZWluZyB0aGUgY2FzZSwgZWl0aGVyIHRoaXMgY2FzZSBpcwo+ID4g
ZGVlbWVkIHNwZWNpYWwgZW5vdWdoIHRoYXQgYnJlYWtpbmcgdXNlciBzcGFjZSBpcyBPSywgb3Ig
aXQgaXMgbm90LgoKPiBUaGlzIGNhc2UgaXMgYSBzcGVjaWFsIGNhc2UgYXMgdGhlIHVzYWdlIHdh
cyBpbmNvcnJlY3QgaW4gdGhlIGZpcnN0Cj4gcGxhY2UuCgpJIGFncmVlIHRoYXQgaXQncyBub3Qg
b25seSBpbnNlY3VyZSBidXQgYWxzbyBpbmNvcnJlY3QuIEhvd2V2ZXIgaXQgbW9zdGx5IAp3b3Jr
cy4gSW4gZmFjdCBJIGRvbid0IGRpc2FncmVlIHdpdGggdGhlIGNoYW5nZSBhcyBzdWNoLCBidXQg
SSB0aGluayB0aGF0IHRoZSAKY29tbWl0IG1lc3NhZ2VzIGFyZSBtaXNsZWFkaW5nIGFuZCBjb25m
dXNpbmcuIEZvciBhIHN0YXJ0LCBpbiBvbmUgcGxhY2UgaXQgCnNheXMgdGhhdCBpdCBpcyBub3Qg
YnJlYWtpbmcgdXNlciBzcGFjZSBhbmQgaW4gYW5vdGhlciBpdCBzYXlzIGJhc2ljYWxseSB0aGUg
Cm9wcG9zaXRlLgoKKFVuZm9ydHVuYXRlbHksIG5vdCBldmVyeWJvZHkgYWdyZWVzIHdpdGggdGhl
IGNoYW5nZS4gSSBjYW4ndCBzZWVtIHRvIGdldCAKRkZtcGVnJ3MgY2hlY2thc20gdG9vbCBmaXhl
ZDoKaHR0cDovL2ZmbXBlZy5vcmcvcGlwZXJtYWlsL2ZmbXBlZy1kZXZlbC8yMDIzLUp1bHkvMzEy
MjQ1Lmh0bWwgKQoKQWxzbyB0aGlzIGlzIG5vdCB0aGUgZmlyc3QgdGltZSBzb21lYm9keSBhcmd1
ZXMgdGhhdCBhbiBBUEkgc2hvdWxkIGJlIHJlbW92ZWQgCmJlY2F1c2UgaXQncyBicm9rZW4uIFRo
YXQncyBub3Qgc3BlY2lhbC4KCj4gQW55IGFwcGxpY2F0aW9uIHRoYXQgZ2VudWluZWx5IHJlcXVp
cmVzIHJkY3ljbGUgY2FuIGFsd2F5cyBnZXQKPiBpdCBub3cgdmlhIHRoZSBwZXJmIGludGVyZmFj
ZS4KClN1cmUuIEJ1dCB0aGUgcXVlc3Rpb24gaXMgd2hldGhlciBpdCBicmVha3MgdXNlciBzcGFj
ZSBhbmQgaWYgc28sIHdoZXRoZXIgCnRoYXQncyBhY2NlcHRhYmxlLiBFeGlzdGluZyBhcHBzIHRo
YXQgY2FsbCBSRENZQ0xFIHdpbGwgbm93IGZhaWwsIHByZXN1bWJseSAKcmVjZWl2ZSBTSUdJTEwo
PykuCgo+IElmIHRoZSBpbnNlY3VyZSBhbmQgaW5jb3JyZWN0IGJlaGF2aW9yIGlzIGFsbG93ZWQs
IHdlIHN1c3BlY3QgdGhlIHVzZXIKPiBzcGFjZSBiZWhhdmlvciB3aWxsIG5ldmVyIGJlIGZpeGVk
IGFzIGl0IGlzIGhhcmQgdG8gcHV0IGEgZnV0dXJlIGZsYWcKPiBkYXRlIGluIHRoZXNlIGNhc2Vz
LgoKRm9yIGJldHRlciBvciB3b3JzZSwgSSBjYW4gb25seSBhZ3JlZSB0aGVyZS4gQnV0IHRoZW4g
YWRkaW5nIGFuIG9wdGlvbiB0byAKcHJlc2VydmUgdGhlIGJyb2tlbiBiZWhhdmlvdXIgaXMgYmVn
Z2luZyBmb3IgcGVvcGxlIHRvIChhYil1c2UgaXQsIGFuZCBpbmRlZWQgCm5ldmVyIGZpeCB0aGUg
cHJvYmxlbSwgYW5kIG5ldmVyIGJlIGFibGUgdG8gcmVtb3ZlIHRoZSBvcHRpb24uCgo+ID4gSWYg
aXQgaXMgbm90IE9LLCB0aGVuIHRoZSBvbmx5IHdheSBvdXQgdGhhdCBJIGNhbiB0aGluayBvZiwg
Y29uc2lzdHMgb2YKPiA+IHRyYXBwaW5nIGFuZCBlbXVsYXRpbmcgdGhlIGNvdW50ZXJzLCByZXR1
cm5pbmcgdGhlIHNhbWUgc2FuaXRpc2VkIHZhbHVlcwo+ID4gdGhhdCBMaW51eCBwZXJmIHdvdWxk
IHJldHVybi4gVGhlbiB5b3UgY2FuIGFkZCBhIGtlcm5lbCBjb25maWcgb3B0aW9uIHRvCj4gPiBk
aXNhYmxlIHRoYXQgdHJhcC1hbmQtZW11bGF0aW9uIGNvZGUgaW4gdGhlIGZ1dHVyZS4KPiBXaGF0
IGRvIHlvdSBtZWFuIGJ5ICJzYW5pdGlzZWQiIHZhbHVlID8KCkkgbWVhbiB3aGF0ZXZlciBhdm9p
ZHMgY3JlYXRpbmcgYSBzZWN1cml0eSBpc3N1ZS4gUHJlc3VtYWJseSByZXBvcnQgdGhlIG51bWJl
ciAKb2YgY3ljbGVzIHNwZW50IGluIHRoZSBjYWxsaW5nIHRocmVhZCBhbmQgaW4gdXNlciBtb2Rl
IHNpbmNlIHRoZSBmaXJzdCB0aW1lIAp0aGF0IHRoZSBwcm9jZXNzIGNhbGxlZCBSRENZQ0xFPwoK
TWF5YmUgaXQncyBub3QgcmVhc29uYWJsZSBmb3IgY29tcGxleGl0eSBvciBwZXJmb3JtYW5jZSBy
ZWFzb25zLCBidXQgdGhlbiBJTU8sIAppdCBkZXNlcnZlcyBhIGxpdHRsZSBiaXQgYmV0dGVyIGV4
cGxhaW5pbmcgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKLS0gCumbt+exs+KAp+W+t+WwvC3lupPl
sJTokpkKaHR0cDovL3d3dy5yZW1sYWIubmV0LwoKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
