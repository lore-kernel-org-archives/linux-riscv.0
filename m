Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538F6D5E378
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Nov 2024 17:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6EWa20ndnzU81/mNZdlTntbsVP8I/fc3ynzAAfJoRsU=; b=RRXH1LrKdc3obL
	WdcBwq8JldDicbaBItoijZ/AzVzaLQJ1eiWmUQmUJYCkIrmTcHkNzIxeJElGdppQh3rax0CX2YlVM
	QnM+mCpqr0AGqhJYZC8o5Hj+Su0QfO5bfQ1FE/ZjsA2aEHLuHu8NfzL4dkwEdNr2blgNINpdhCs0b
	ZZeZOqrvuvYQqcmY43MDf2CV9NwAkr7ASW3uA5kyqvpXE53+cspzLg5Mv2naVTc51lFJ2mUn0PhRc
	Vk1RCUqeNJUrIGQVLJS8oqruZ/fPTFEzEvrrKG7EuRP4+EjEEjsobdeIpB7pa8PEJOr7mY0RVSIMa
	hJpIfXyFDVWkB7Bg8waQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9oxs-0000000DhV2-3lrx;
	Sat, 09 Nov 2024 17:09:37 +0000
Received: from out203-205-221-153.mail.qq.com ([203.205.221.153])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9oxo-0000000DhUJ-2xwG
	for linux-riscv@lists.infradead.org;
	Sat, 09 Nov 2024 17:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1731172152; bh=wgh7oxshIvBfCo/XN2fcYI/AUwFuT7KbVC63TPF2DV0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jMQ9E3VKy0NdzpHdT1MoWYPt/4Rbk8gfp1qaFIezqNd1X75zbnhcL8rgJKaKJlYj7
	 OZhjXWeMTagHsPVda6O9gb870jm2IoCTQlQL2IUCiydgDjyqlN109SOJbIErYGkASq
	 V6RjYOfYQC5WT9stIVlLv1RWFfeJkUYTTymlTGNk=
Received: from [IPV6:2408:8207:18a1:fd20:75f7:4ab1:fc76:cbf3] ([2408:8207:18a1:fd20:75f7:4ab1:fc76:cbf3])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 24A2DCFD; Sun, 10 Nov 2024 01:09:10 +0800
X-QQ-mid: xmsmtpt1731172150t3hd5dol6
Message-ID: <tencent_EA66C5C485CC35BAF2250AD26A5F39EAE10A@qq.com>
X-QQ-XMAILINFO: OeJ9zRfntlNP1164s/n4CzOs/Rt1p1tjoiYXJFGjU+PUIXHDoYe3bcVmkE3bvG
	 9uJZ8Me7+cTlVKtSi1Zo611qBUrrEjXhPMGZ3MwcAcRli+tRcAcYDXS6kI2A4zyTjeNoR6l1YqAE
	 Qoq92QYUuZIwOnVk3x+eTm+tS/0lZUj6byOY4EL7YrWHjaPP06Jr0o2Jwjj0wZBHHjDlFMK9VCKP
	 AvSaXkIDVWOiLaw2XCg5Fgk6QPF3OtydeQt/fdSqXqZ9K3HiVkZn2FKf5i+lZPgnHsHc3N3NVrVB
	 xgk7hoklrUyy/jrrZfnNxhgkrojljdSFfMFMkE0mlU7ZmEdmgk359d4XL+lsqsBd/uHz2TK6AhKf
	 V/aBhgd0mUWPrcpjv/nsD6XTpftHAC50SvvrEg/vjZGHjRF3swx0aVAqXwRs3jMdRsARjDyBciml
	 z6INXEp9/Eejl9xRaZoC8arHDp8BeKIGJPlpnR38rZqLUBAK3x2nqh5r9kLOGfxF8+Sbp7xYmFXZ
	 MiadXZnEhYYMQNl3bUxe1ZXicn84PMggt/Oesh1ifjpLJszcWGA43JQK5GsWkZelgYyMaUou5a5Z
	 9vGrCl+ON5que+dnFy6ZO4uoldnWlObUqte03hBxgXq8o6YhNukSp9DlfM9/19N60jSIG1vBqF6P
	 VFEJdJHVeLlQKGUjzfkY5sjay/PnAk8BGRwaCwOpZowdL6xHbqnhMAOgf437yFdfmD5Kpmv3rm7n
	 Kd008hs4uKRsi8k6sUMH4l9FVbS0l9jeLb4A6TUZHr9LliYl+WhiYWGrdMWLvsgZvWkmkoZrNgpi
	 A6At2xLtNNQVVGPT4w6qHzdgbLBe+HN8O9Tq0oGvD6M4zfdWYhoTdPlE0GItcggdoYfgnlIUHXZC
	 ly9du5DnlvKV6efczvfP3kocUxsRtpdeNf25ro4C1C8iXC73U73LkGxsGLGiga8N83stO8dBta/n
	 Hgfl9BsrbWAYCD7pHwu4IRAqFFgh9MPFtbsQc124LPoUwNFERxxcVOqxLbxQZwcChTnKWKUizdP1
	 f5lQ1cPg==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-OQ-MSGID: <d66d431f-ba46-4bf5-9441-59fdd5fc7464@cyyself.name>
Date: Sun, 10 Nov 2024 01:09:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/14] riscv: Add support for xtheadvector
To: Jesse T <mr.bossman075@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>,
 "charlie@rivosinc.com" <charlie@rivosinc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
 <a1f41f92-6bd0-48b6-a931-e7ad7aba18cc@outlook.com>
 <20240930-reenact-stratus-9d42d7439df4@spud>
 <d9eaaf71-dfe7-4bf8-8aee-538ee8ad9f24@outlook.com>
 <CAJFTR8REgZkOVGP+Y3skYPYbdV6x3E2iMfWjg0SoSkaSxQtGig@mail.gmail.com>
Content-Language: en-US
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <CAJFTR8REgZkOVGP+Y3skYPYbdV6x3E2iMfWjg0SoSkaSxQtGig@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_090933_284646_A93BB3FB 
X-CRM114-Status: GOOD (  23.38  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAxMS85LzI0IDA2OjE2LCBKZXNzZSBUIHdyb3RlOgo+IEhleSBQYWxtZXIgdGhlcmUgYXJl
IGEgYnVuY2ggb2YgbWVyZ2UgYXJ0aWZhY3RzIGluIGZvci1uZXh0IGZyb20gdGhpcwo+IHNldC4g
SnVzdCBsZXR0aW5nIHlvdSBrbm93Lgo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3BhbG1lci9saW51eC5naXQvY29tbWl0Lz9oPWZvci1uZXh0JmlkPTk1
NDM3ZjhjMDJiNTkwN2I1ZjJkN2RjNmMwM2UzYzczNTIzYzVjZDYKPiAKCkkgdGhpbmsgdGhlc2Ug
Y2FuIGJlIG1lcmdlZCB3aXRoIGtlZXAgYm90aCBtZXJnZSBvcHRpb24gZXhjZXB0IGZvciB0aGUg
CmxpbmUgIiNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfVkVORE9SX0VYVF9USEVBRF8wCTkiLiBU
aGUgOSBoZXJlIHNob3VsZCAKYmUgY2hhbmdlZCB0byAxMS4KCj4gT24gTW9uLCBTZXAgMzAsIDIw
MjQgYXQgMTE6NTLigK9BTSBBb2JhIEsgPG5FeHBfMHgxN0BvdXRsb29rLmNvbT4gd3JvdGU6Cj4+
Cj4+IFRoZSBkZXZpY2V0cmVlIG5hbWUgc2hvd24gaW4gT3BlblNCSSBpcwo+PiB0aGUgb25lIHBh
Y2tlZCB3aXRoIFUtQm9vdCBTUEwuCj4+IEFzIHRoZSBpbWFnZSBidWlsZGVyIGRpZG4ndCBwdXQg
dGhlIGtlcm5lbAo+PiBkZXZpY2V0cmVlIHdpdGggdGhlIGltYWdlIHVuZGVyIGJvb3QgcGFydGl0
aW9uLAo+PiBUaGUgd2hvbGUgYm9vdCBwcm9jZXNzIG9ubHkgdXNlcyB0aGUgVS1Cb290IGRldmlj
ZSB0cmVlLgo+Pgo+PiBUaGUgcmVhc29uIHdoeSB0aGUgbG9nIHNob3dzICJOZXpoYSIKPj4gYnV0
IG5vdCAiTGljaGVlIFJWIiBpcyB0aGF0IHRoaXMgbG9nIGlzIHByb2R1Y2VkCj4+IHdoaWNoIFUt
Qm9vdCByZXZpc2lvbiBpcyBkMS0yMDIyLTEwLTMxIGZyb20gc2FtdWVsJ3MgcmVwby4KPj4gQnVp
bGQgZnJvbSBkMS13aXAgY2FuIHNob3cgIkxpY2hlZSBSViIgY29ycmVjdGx5Cj4+IChtYW51YWxs
eSBlZGl0IGNvbmZpZyB0byBzcGVjaWZ5IExpY2hlZVJWIGR0YiBzaG91bGQgaGF2ZSBzYW1lIGVm
ZmVjdCB0aG91Z2gpLAo+PiB3aGlsZSB0aGUgaXNzdWUgcGVyc2lzdHMgd2hlbiBrZXJuZWwgbG9h
ZCB0bwo+PiB0aGUgcHJvY2VkdXJlIHNhbWUgYXMgdGhlIGRtZXNnIG1lbnRpb25lZCBhYm92ZS4K
Pj4KPj4KPj4gQ2hlZXJzLAo+PiBBb2JhIEsKPj4KPj4gMjAyNOW5tDnmnIgzMOaXpSDkuIvljYgx
MDo1Mzo0MCBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+Ogo+Pgo+Pj4gT24gU3VuLCBT
ZXAgMjksIDIwMjQgYXQgMTI6NDQ6MDdQTSArMDAwMCwgQW9iYSBLIHdyb3RlOgo+Pj4+IEhlbGxv
IENoYXJsaWUsCj4+Pj4KPj4+PiBJJ3ZlIGJlZW4gd29ya2luZyBvbiBicmluZ2luZyB1cCB0aGUg
U2lwZWVkIExpY2hlZSBSViBEb2NrCj4+Pj4gKHdoaWNoIGFsc28gdXNlcyB0aGUgRDEgU29DKSB3
aXRoIHRoZSBrZXJuZWwgcGF0Y2hlcyB5b3UgcHJvdmlkZWQuCj4+Pj4gVGhlIHBhdGNoZXMgYXBw
bGllZCBjbGVhbmx5IHRvIFBhbG1lcidzIGZvci1uZXh0IGJyYW5jaCwKPj4+PiBidXQgSSd2ZSBl
bmNvdW50ZXJlZCBhIGNvdXBsZSBvZiBpc3N1ZXM6Cj4+Pj4KPj4+PiAxLiBTa2lmZm9zIENvbXBp
bGF0aW9uIEVycm9yIGR1cmluZyB0aGUgY29tcGlsYXRpb24gcHJvY2VzcyBvZiBgY2dvYDoKPj4+
PiBgdW5rbm93biByZWxvY2F0aW9uIHR5cGUgMTc7IGNvbXBpbGVkIHdpdGhvdXQgLWZwaWM/YAo+
Pj4+IFVuZm9ydHVuYXRlbHksIEkgY2xvc2VkIHRoZSB0ZXJtaW5hbCBiZWZvcmUgc2F2aW5nIHRo
ZSBmdWxsIGxvZywKPj4+PiBzbyBJIGRvbid0IGhhdmUgdGhlIGNvbXBsZXRlIGRldGFpbHMsIGJ1
dCB0aGUgcmVzdWx0IHNob3VsZCBiZSByZXByb2R1Y2libGUuCj4+Pj4gV2hpbGUgdGhpcyBzaG91
bGQgYmUgYSBTa2lmZk9TIGlzc3VlLCBtZW50aW9uIGl0IGluIGNhc2UgU2tpZmZPUyBpcyB0aGUg
bWV0aG9kCj4+Pj4gdGhhdCB5b3UgbWVudGlvbmVkIGZvciBicmluZ2luZyB1cCB0aGUgZGV2aWNl
Lgo+Pj4+Cj4+Pj4gMi4gSW1hZ2UgQnVpbGRpbmcgd2l0aCBzZWhyYWYvcmlzY3YtYXJjaC1pbWFn
ZS1idWlsZGVyOgo+Pj4+IEFmdGVyIGJ1aWxkaW5nIHRoZSBpbWFnZSwgdGhlIGRldmljZSBmYWls
ZWQgdG8gc3RhcnQgYXQgYW4gZWFybHkgc3RhZ2UuCj4+Pj4gSSBzdXNwZWN0IHRoaXMgbWF5IGJl
IHJlbGF0ZWQgdG8gaW5jb3JyZWN0IFJBTSBzaXplIGRldGVjdGlvbiwKPj4+PiBhcyB0aGUgYm9h
cmQgb25seSBoYXMgNTEyTUIgb2YgUkFNLgo+Pj4+IEludGVyZXN0aW5nbHksIHRoZSB2ZW5kb3Ig
aW1hZ2UgcmVwb3J0cyAxR0IsIGFuZCB0aGUgU2lwZWVkIHdlYnNpdGUgYWxzbyBzdGF0ZXMKPj4+
PiB0aGF0IHRoZSBEb2NrIGhhcyAxR0IsIGRlc3BpdGUgdGhlcmUgYmVpbmcgbm8gZXh0cmEgbWVt
b3J5IGJhbmsgcHJlc2VudC4KPj4+Pgo+Pj4+IFlvdSBjYW4gZmluZCB0aGUgYm9vdCBsb2cgaGVy
ZTogaHR0cHM6Ly9mYXJzLmVlL2JkWWsubG9nCj4+Pj4KPj4+PiBBbnkgaGVscCB3b3VsZCBiZSBh
cHByZWNpYXRlZCwgYW5kIGJpZyB0aGFua3MgdG8geW91ciB3b3JrCj4+Pj4gdG8gbWFrZSB0aGUg
ZWZmaWNpZW50IHBhcnQgb2YgdGhpcyBib2FyZCB0byB3b3JrIChhZ2FpbikhCj4+Pgo+Pj4gVGhl
IGxvZyB5b3UgcG9zdGVkIGF0IGh0dHBzOi8vZmFycy5lZS9YRnpSIGFwcGVhcnMgdG8gYmUgdXNp
bmcgdGhlCj4+PiBkZXZpY2V0cmVlIG9mIGEgTmV6aGEgbm90IHRoZSBMaWNoZWUgUlYgRG9jay4g
V2h5IGFyZSB5b3UgZG9pbmcgdGhhdCwKPj4+IHdoZW4gdGhlIExpY2hlZSBSViBEb2NrIGlzIHN1
cHBvcnRlZCBpbiB0aGUga2VybmVsIGFscmVhZHk/Cj4+Pgo+Pj4gQ2hlZXJzLAo+Pj4gQ29ub3Iu
Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+
IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
