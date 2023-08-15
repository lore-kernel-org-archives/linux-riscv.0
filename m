Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA50C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 12:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/9fk1cTm3PqipLefRjdOeWx06//3b5k/ch0E2TDA8J8=; b=LSNnr8XEJhx/7B
	rOFUceH/208xX6cqN3qA+ppekFT+2XIxJoRLJBw0TJ6UU8UuM94JIUISguh97IMup4gsRfF/7JnBG
	wglpzci6ApXAFQPAcw7CbQeksIqL5eCCEaFvkOKDkULDCiiPH0/+Row7iuxwvEJG9nCI7q/WeLwfQ
	00Bg5Jd+Y2Yo9UogBeeMDgiGadQzvWiXv/FKkwAIO3zbhlZXxpF62IgqVEpPvapo+3acQfyZhXbFE
	I+NjZOxTtsyvEaaco/utTGbqAAYL/mm5/OFu/ckHpOBJREjbZv8vOh586jowt0SEIQg6CYy//tW7F
	p/BCap9+S66L+mmLQE9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVt1M-001axH-24;
	Tue, 15 Aug 2023 12:19:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVt1K-001awe-1A
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 12:19:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B1A6C61D0B;
	Tue, 15 Aug 2023 12:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B1C7C433C8;
	Tue, 15 Aug 2023 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692101973;
	bh=F+QBXTktClw1//7fQW6I+DnTh5SvAuT9bMxhOC+ZD6Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HBxjkyrXSFMB5/+qp2uVmtjjYZ8+LnBWuck+25wyHv7DrV3I1JjJp6t4jU2IrznRG
	 hk2JCTtTNjn3paurBM84lCmBnOoeh21EUe5B9l7mWIv7/Vk+EldOxJwn1xzBvRup2b
	 4dq3KSl2bCzNKOwbVCuVshJJYLQ6QCnvYFv6IzSfkxO5NReC7RxryFvIDirelW/Vux
	 AMATCTPWBe1PAg11jCB8qvPd1q7qNsTnGd4BTIUronqiEhi1qIA6HqVAJo+2KFtH7d
	 yCm/Rm8W8TLK8p9hiHVx51dLXZAsxGfJb4+Vq2PoJ2DMqmy6DDyRQd8fKePJoucg8b
	 mdZI6dm5B9EcQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, paul.walmsley@sifive.com,
 guoren@linux.alibaba.com, anup@brainfault.org, atishp@atishpatra.org,
 heiko.stuebner@vrull.eu, Andy Chiu <andy.chiu@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Vincent Chen
 <vincent.chen@sifive.com>, Heiko Stuebner <heiko@sntech.de>, Conor Dooley
 <conor.dooley@microchip.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Jisheng Zhang <jszhang@kernel.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Sia
 Jee Heng <jeeheng.sia@starfivetech.com>, Mason Huo
 <mason.huo@starfivetech.com>, Andrew Bresticker <abrestic@rivosinc.com>,
 Fangrui Song <maskray@google.com>, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [v2, 5/5] riscv: vector: allow kernel-mode Vector with preemption
In-Reply-To: <20230721112855.1006-6-andy.chiu@sifive.com>
References: <20230721112855.1006-1-andy.chiu@sifive.com>
 <20230721112855.1006-6-andy.chiu@sifive.com>
Date: Tue, 15 Aug 2023 14:19:30 +0200
Message-ID: <87cyzoebvx.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_051934_540297_2FB1EAF2 
X-CRM114-Status: GOOD (  16.83  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBBZGQga2VybmVsX3Zz
dGF0ZSB0byBrZWVwIHRyYWNrIG9mIGtlcm5lbC1tb2RlIFZlY3RvciByZWdpc3RlcnMgd2hlbgo+
IHRyYXAgaW50cm9kdWNlZCBjb250ZXh0IHN3aXRjaCBoYXBwZW5zLiBBbHNvLCBwcm92aWRlIHRy
YXBfcHRfcmVncyB0bwo+IGxldCBjb250ZXh0IHNhdmUvcmVzdG9yZSByb3V0aW5lIHJlZmVyZW5j
ZSBzdGF0dXMuVlMgYXQgd2hpY2ggdGhlIHRyYXAKPiB0YWtlcyBwbGFjZS4gVGhlIHRocmVhZCBm
bGFnIFRJRl9SSVNDVl9WX0tFUk5FTF9NT0RFIGluZGljYXRlcyB3aGV0aGVyCj4gYSB0YXNrIGlz
IHJ1bm5pbmcgaW4ga2VybmVsLW1vZGUgVmVjdG9yIHdpdGggcHJlZW1wdGlvbiAnT04nLiBTbyBj
b250ZXh0Cj4gc3dpdGNoIHJvdXRpbmVzIGtub3cgYW5kIHdvdWxkIHNhdmUgVi1yZWdzIHRvIGtl
cm5lbF92c3RhdGUgYW5kIHJlc3RvcmUKPiBWLXJlZ3MgaW1tZWRpYXRlbHkgZnJvbSBrZXJuZWxf
dnN0YXRlIGlmIHRoZSBiaXQgaXMgc2V0Lgo+Cj4gQXBhcnQgZnJvbSBhIHRhc2sncyBwcmVlbXB0
aW9uIHN0YXR1cywgdGhlIGNhcGFiaWxpdHkgb2YKPiBydW5uaW5nIHByZWVtcHRpdmUga2VybmVs
LW1vZGUgVmVjdG9yIGlzIGpvaW50bHkgY29udHJvbGxlZCBieSB0aGUKPiBSSVNDVl9WX1ZTVEFU
RV9DVFJMX1BSRUVNUFRJQkxFIG1hc2sgaW4gdGhlIHRhc2sncwo+IHRocmVhZC52c3RhdGVfY3Ry
bC4gVGhpcyBiaXQgaXMgbWFza2VkIHdoZW5ldmVyIGEgdHJhcCB0YWtlcyBwbGFjZSBpbgo+IGtl
cm5lbCBtb2RlIHdoaWxlIGV4ZWN1dGluZyBwcmVlbXB0aXZlIFZlY3RvciBjb2RlLgo+Cj4gQWxz
bywgcHJvdmlkZSBhIGNvbmZpZyBDT05GSUdfUklTQ1ZfSVNBX1ZfUFJFRU1QVElWRSB0byBnaXZl
IHVzZXJzIGFuCj4gb3B0aW9uIHRvIGRpc2FibGUgcHJlZW1wdGlibGUga2VybmVsLW1vZGUgVmVj
dG9yIGF0IGJ1aWxkIHRpbWUuIFVzZXJzCj4gd2l0aCBjb25zdHJhaW50IG1lbW9yeSBtYXkgd2Fu
dCB0byBkaXNhYmxlIHRoaXMgY29uZmlnIGFzIHByZWVtcHRpYmxlCj4ga2VybmVsLW1vZGUgVmVj
dG9yIG5lZWRzIGV4dHJhIHNwYWNlIGZvciB0cmFja2luZyBwZXIgdGhyZWFkJ3MKPiBrZXJuZWwt
bW9kZSBWIGNvbnRleHQuIE9yLCB1c2VycyBtaWdodCBhcyB3ZWxsIHdhbnQgdG8gZGlzYWJsZSBp
dCBpZiBhbGwKPiBrZXJuZWwtbW9kZSBWZWN0b3IgY29kZSBpcyB0aW1lIHNlbnNpdGl2ZSBhbmQg
Y2Fubm90IHRvbGVyYXRlIGNvbnRleHQKPiBzd2ljdGggb3ZlcmhlYWQuCgpOaWNlIGlkZWEhIERp
ZCB5b3UgcGVyZm9ybSBhbnkgYmVuY2htYXJraW5nPyBXb3VsZCBiZSByZWFsbHkgaW50ZXJlc3Rp
bmcKdG8gZ2V0IHNvbWUgbnVtYmVycy4KCk5pdDogInN3aXRjaCIKCkkgbGlrZSB0aGF0IHRoZSBt
b3N0ICJjb250cm92ZXJzaWFsIiBwYXRjaCBpcyBsYXN0LCBzbyBpdCBjYW4gZWFzaWx5IGJlCmRy
b3BwZWQgaWYgdGhlIGRpc2N1c3Npb25zIGRvZXNuJ3Qgc2V0dGxlISBJdCB3b3VsZCBiZSBuaWNl
IHdpdGgga2VybmVsCnZlY3RvciBzdXBwb3J0IGluIDYuNiEKCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL2tlcm5lbF9tb2RlX3ZlY3Rvci5jIGIvYXJjaC9yaXNjdi9rZXJuZWwva2Vy
bmVsX21vZGVfdmVjdG9yLmMKWy4uLl0KPiBAQCAtNzAsMTEgKzEwOSwxNCBAQCB2b2lkIGtlcm5l
bF92ZWN0b3JfYmVnaW4odm9pZCkKPiAgCj4gIAlyaXNjdl92X3ZzdGF0ZV9zYXZlKCZjdXJyZW50
LT50aHJlYWQudnN0YXRlLCB0YXNrX3B0X3JlZ3MoY3VycmVudCkpOwo+ICAKPiAtCWdldF9jcHVf
dmVjdG9yX2NvbnRleHQoKTsKPiArCWlmICghcHJlZW1wdGlibGUoKSB8fCAha2VybmVsX3ZlY3Rv
cl9wcmVlbXB0aWJsZSgpKSB7Cj4gKwkJZ2V0X2NwdV92ZWN0b3JfY29udGV4dCgpOwo+ICsJfSBl
bHNlIHsKPiArCQlpZiAocmlzY3Zfdl9zdGFydF9rZXJuZWxfY29udGV4dCgpKQo+ICsJCQlnZXRf
Y3B1X3ZlY3Rvcl9jb250ZXh0KCk7Cj4gKwl9CgpXZHl0IGFib3V0IHJlcGxhY2luZyB0aGlzIHdp
dGg6CiAgICAgICAgaWYgKCFwcmVlbXB0aWJsZSgpIHx8ICFrZXJuZWxfdmVjdG9yX3ByZWVtcHRp
YmxlKCkgfHwgcmlzY3Zfdl9zdGFydF9rZXJuZWxfY29udGV4dCgpKQogICAgICAgICAgICAgICAg
Z2V0X2NwdV92ZWN0b3JfY29udGV4dCgpOwoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
