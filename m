Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B27C43602
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 21:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0IZSvpbhhoMEEEbMY/Z5x+HasSBp6KlYSwfvZ7hHNFc=; b=pHaMntkXikpSwO
	gbG6XDUi3CGE8Na/9+KHgqYpVlT3vCtE5mtJnNrHgS5FqnoY/O7JLUSgu2quKiLy7FjuYVy2woSko
	g/fU6qEQDmhO8G2Yp1Sj/MTNzxvRIAUXhjwaT3hK/2745va/DZJ7nKR/k22I/uLDCbmyjFBfAJ7hI
	MBuTwvdWAZ7qs3VHobvsRNCSTgnUzZ2iL8Veb5jK+f3R1c0bIGzqn+ft8pjtkpLhzqa6F7GN9Lzcq
	KvB5rd+G5InwTuK7pdtIL5t77sKS79ATuT6XB34N+r6h5EqRdDXxI8SDjx9MOFhat2MZ0G63BCMRW
	W19RmDrCsItaKlXeSSsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPIH-00000005Ztc-1C97;
	Thu, 02 Jul 2026 21:50:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPIG-00000005Zt1-0v8m
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 21:50:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 417C7601CA;
	Thu,  2 Jul 2026 21:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229061F000E9;
	Thu,  2 Jul 2026 21:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783028999;
	bh=OR8xOq9dAd26ujiAwVszzOHiLCszARnPiwIaNz5ESn0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=B+tc+5RHqY3JoS8BHBFtIs6Ixwb3FHiZW7sw1eSjWzSZOdtdOeiX1LOBPB259SqN0
	 RNu9r3S6UrqNIzSwvlS0ScHYEXZUS4yKPvIEK6KMwjeIWpfxZumCiw9DxB+KO6MQY1
	 ZI5ulAka1rXUJeevOMYAvWilVlf7cswGz3Dxdg/7doTH+m+bgGilYGCAoBXpM2yze+
	 njTHv1m+JV3W3uth459/AznoFJO4beF/j9n/ic34ynDmKQQgBUnWNLxloBHcFS7A8E
	 ikCdHAQgPb2eYut2DcXNxvdCL/QOxh0vGXxjv4Fo+Kn0pYSvtPQluXZyAJPKTejWQ+
	 kdFdgBw5+DLDA==
From: Thomas Gleixner <tglx@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>, Michal =?utf-8?Q?Such=C3=A1nek?=
 <msuchanek@suse.de>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Andy
 Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Andrew Donnellan <andrew+kernel@donnellan.id.au>, Mark
 Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Ryan Roberts <ryan.roberts@arm.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mukesh Kumar Chaurasiya
 <mkchauras@linux.ibm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Zong
 Li <zong.li@sifive.com>, Nam Cao <namcao@linutronix.de>, Deepak Gupta
 <debug@rivosinc.com>, Lukas Gerlach <lukas.gerlach@cispa.de>, Rui Qi
 <qirui.001@bytedance.com>, Kees Cook <kees@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [RFC] entry: Untangle the return value of
 syscall_enter_from_user_mode from syscall NR
In-Reply-To: <BA7CD91D-C0E5-47A1-B49C-BC6AF6604182@zytor.com>
References: <akVRcPsD_R_CE1qW@kunlun.suse.cz>
 <BA7CD91D-C0E5-47A1-B49C-BC6AF6604182@zytor.com>
Date: Thu, 02 Jul 2026 23:49:56 +0200
Message-ID: <87h5mhnjsr.ffs@fw13>
MIME-Version: 1.0
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

T24gV2VkLCBKdWwgMDEgMjAyNiBhdCAxMToyOSwgSC4gUGV0ZXIgQW52aW4gd3JvdGU6CgpDYW4g
eW91IHBsZWFzZSB0cmltIHlvdXIgcmVwbGllcz8gU2Nyb2xsaW5nIHRocm91Z2ggaHVuZHJlZCBs
aW5lcyBvZgp1c2VsZXNzIHF1b3RlZCB0ZXh0IGlzIGp1c3QgYW5ub3lpbmcuCgo+IE9uIEp1bHkg
MSwgMjAyNiAxMDo0MjowOCBBTSBQRFQsICJNaWNoYWwgU3VjaMOhbmVrIiA8bXN1Y2hhbmVrQHN1
c2UuZGU+IHdyb3RlOgo+Pi1zdGF0aWMgX19hbHdheXNfaW5saW5lIGxvbmcgc3lzY2FsbF9lbnRl
cl9mcm9tX3VzZXJfbW9kZShzdHJ1Y3QgcHRfcmVncyAqcmVncywgbG9uZyBzeXNjYWxsKQo+Pitz
dGF0aWMgX19hbHdheXNfaW5saW5lIGxvbmcgc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZShz
dHJ1Y3QgcHRfcmVncyAqcmVncywgbG9uZyAqc3lzY2FsbCkKPj4gewo+PiAJbG9uZyByZXQ7Cj4+
Cgo+IDEuIFRoZSB0eXBlIGZvciBhIHN5c3RlbSBjYWxsIGlzIGludC4KClRoYXQgc2hpcCBoYXMg
c2FpbGVkIGxvbmcgYWdvLiBtYW4gc3lzY2FsbCAuLi4KCj4gMi4gQSB2YWxpZCBzeXN0ZW0gY2Fs
bCBudW1iZXIgaXMgYWx3YXlzIGdvaW5nIHRvIGJlIHBvc2l0aXZlLgoKVGhhdCdzIHRydWUgdG9k
YXkuCgo+IDMuIEJpdHMgWzMwOjI0XSBhcmUgYXZhaWxhYmxlIGZvciBhcmNoaXRlY3R1cmUgQUJJ
IHVzZS4gVGhlCj4gICAgImFyY2hpdGVjdHVyZSBpbmRlcGVuZGVudCIgcGFydCBvZiB0aGUgc3lz
dGVtIGNhbGwgbnVtYmVyIGlzIHRoZXJlZm9yZQo+ICAgIDI0IGJpdHMgd2lkZS4KPgo+IDQuIFRo
ZSBleGFjdCBBQkkgaXMgcGxhdGZvcm0tc3BlY2lmaWMsIG9idmlvdXNseSwgYnV0IGFzIGEgZ2Vu
ZXJhbAo+ICAgIGd1aWRlbGluZSAoZXNwZWNpYWxseSBmb3IgbmV3IHBsYXRmb3Jtcy9BQklzKSBz
aG91bGQgZm9sbG93IHRoZSBydWxlcwo+ICAgIGZvciBhIHBsYXRmb3JtICJpbnQiIGlmIHByYWN0
aWNhbC4gTm90YWJseSwgd2hlbiBwYXNzaW5nIGEgdmFsdWUgaW4gYQo+ICAgIHJlZ2lzdGVyIGxh
cmdlciB0aGFuIDMyIGJpdHMsIHdoaWNoIHNpZGUgb2YgdGhlIGNhbGxpbmcgaW50ZXJmYWNlIGlz
Cj4gICAgcmVzcG9uc2libGUgZm9yIHNpZ24tZXh0ZW5kaW5nIGEgdmFsdWUgcGFzc2VkIGluIGEg
cmVnaXN0ZXIuIElmIGNhbGxlcgo+ICAgIHNpZGUsIHRoZSBrZXJuZWwgc2hvdWxkIHZhbGlkYXRl
LCBpZiBjYWxsZWUgc2lkZSB0aGUga2VybmVsIHNob3VsZAo+ICAgIGlnbm9yZSB0aGUgYWRkaXRp
b25hbCBiaXRzIGFuZCBkbyB0aGUgZXh0ZW5zaW9uLgoKVGhlIGtlcm5lbCBzaWduIGV4cGFuZHMg
dG9kYXkgYWxyZWFkeSwgaS5lLiBmb3IgY29tcGF0IHN5c2NhbGxzLgoKPiA1LiBBIG5lZ2F0aXZl
IHN5c3RlbSBjYWxsIG51bWJlciBpcyBndWFyYW50ZWVkIHRvIHJldHVybiAtRU5PU1lTCj4gICAg
KHVubGVzcyBpbnRlcmNlcHRlZCBieSBzZWNjb21wLCBwdHJhY2UsIG9yIGFub3RoZXIgbWVjaGFu
aXNtIHVuZGVyCj4gICAgdXNlciBzcGFjZSBjb250cm9sLikKClRoYXQncyB0cnVlIHRvZGF5LgoK
QVNNIGVudHJ5OgogICAgICAgcmVncy0+ZWF4ID0gLUVOT1NZUzsKCkMgZW50cnk6CiAgICAgICBu
ciA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUocmVncywgbnIpOwoKICAgICAgIGlmICgo
dW5zaWduZWQpbnIgPCBTWVNDQUxMX01BWCkKICAgICAgIAkgICAgcmVncy0+ZWF4ID0gaGFuZGxl
X3N5c2NhbGwoKTsKICAgICAgIGVsc2UgaWYgKG5yICE9IC0xKQogICAgICAgCSAgICByZWdzLT5l
YXggPSAtRU5PU1lTOwoKICAgICAgIC4uLi4KCklmIHNlY2NvbXAgb3ZlcndyaXRlcyByZWdzLT5l
YXggYW5kIGFib3J0cyBhbnkgc3lzY2FsbCAoaW5jbHVkaW5nIC0xKSBieQpyZXR1cm5pbmcgLTEs
IHRoZW4gdGhlIHZhbHVlIHNlY2NvbXAgd3JvdGUgaW50byByZWdzLT5lYXggaXMgcHJlc2VydmVk
CmFuZCByZXR1cm5lZCB0byB1c2VyIHNwYWNlLgoKVGhlIHNhbWUgYXBwbGllcyBmb3Igc3lzY2Fs
bF91c2VyX2Rpc3BhdGNoKCkgYW5kIHB0cmFjZS4uLigpIGlmIHRoZXkKZGVjaWRlIHRvIG92ZXJ3
cml0ZSByZWdzLT5lYXggX2FuZF8gYWJvcnQgdGhlIHN5c2NhbGwgYnkgbGV0dGluZwpzeXNjYWxs
X2VudGVyX2Zyb21fdXNlcl9tb2RlKCkgcmV0dXJuIC0xLgoKdHJhY2Vfc3lzY2FsbF9lbnRlcigp
IGlzIG5vdCBhbnkgZGlmZmVyZW50LiBJZiB0aGUgbWFnaWMgQlBGIGluIHRoZXJlCnJld3JpdGVz
IHRoZSBzeXNjYWxsIG51bWJlciB0byAtMSB0aGVuIGVpdGhlciB0aGUgb3JpZ2luYWwgLUVOT1NZ
UyBvcgp0aGUgQlBGIGluZHVjZWQgb3ZlcndyaXRlIGlzIHJldHVybmVkIHRvIHVzZXIgc3BhY2Uu
CgpJdCdzIGxlc3MgdGhhbiBvYnZpb3VzIGFuZCBJIGhhdmUgbm8gb2JqZWN0aW9ucyB0byBjbGVh
biB0aGF0IHVwIGFuZAptYWtlIGl0IG1vcmUgaW50dWl0aXZlLCBidXQgSSBzdGlsbCBmYWlsIHRv
IHNlZSB3aGF0IE1pY2hhbCBpcyBhY3R1YWxseQp0cnlpbmcgdG8gc29sdmUgYW5kIHdoYXQgdGhl
IG1hZ2ljIGZsYWcgaXMgZm9yLiBJZiBzMzkwIHJlcXVpcmVzIGl0LAp0aGVuIHRoYXQncyBhbiBz
MzkwIHByb2JsZW0sIGJ1dCBkZWZpbml0ZWx5IHg4NiBkb2VzIG5vdC4KCj4gNi4gSWYgdGhlIHBs
YXRmb3JtIG5lZWRzIHRvIGFsZ29yaXRobWljYWxseSBtb2RpZnkgdGhlIHN5c3RlbSBjYWxsCj4g
ICAgbnVtYmVyIGR1ZSB0byBwbGF0Zm9ybS1zcGVjaWZpYyBjb25jZXJucyAoc2F5LCB0aGUgcGxh
dGZvcm0gdXNlcyBhCj4gICAgMTYtYml0IHNwZWNpYWwgcHVycG9zZSByZWdpc3RlciBmb3IgdGhl
IHN5c2NhbGwgbnVtYmVyLCBvciBpdCBoYXMKPiAgICBtdWx0aXBsZSBrZXJuZWwgZW50cnkgcG9p
bnRzIHdpdGggZGlmZmVyZW50IGJlaGF2aW9yKSwgaXQgc2hvdWxkIGlmIGF0Cj4gICAgYWxsIHBv
c3NpYmxlIHRyYW5zY29kZSB0aGUgc3lzdGVtIGNhbGwgbnVtYmVyIGFzIG5lY2Vzc2FyeSB0byBt
YXRjaAo+ICAgIHRoaXMgY29udmVudGlvbiBpbiBBUElzIHRoYXQgYXJlIGV4cG9zZWQgdG8gZ2Vu
ZXJhbCBrZXJuZWwgY29kZS4KPgo+IEZvciBleGFtcGxlLCBpbiB0aGUgZnV0dXJlIEkgY291bGQg
dmVyeSBtdWNoIHNlZSB0aGUgSUEzMiBjb2RlIGluIHRoZQo+IHg4NiBrZXJuZWwgdXNpbmcgYml0
IDI5IGludGVybmFsbHkgdG8gaW5kaWNhdGUgYW4gaWEzMiBzeXN0ZW0gY2FsbCwKPiBzaW1wbGlm
eWluZyB0aGUgaXNfY29tcGF0IGltcGxlbWVudGF0aW9uIG9uIHg4Ni4KCkkgZG9uJ3Qgc2VlIGhv
dyB0aGF0IG1ha2VzIGl0IHNpbXBsZXIuIFRob3NlIGFyZSB0d28gZGlmZmVyZW50IGVudHJ5CmNv
ZGUgcGF0aHMgYW5kIG1hZ2ljIGJpdHMgd29udCBtYWtlIHRoYXQgZ28gYXdheS4KCj4gSXQgc2hv
dWxkIG5vdCBtZWFuIHRoYXQgcGFzc2luZyBiaXQgMjkgdG8gZWl0aGVyIHRoZSBzeXNjYWxsCj4g
aW5zdHJ1Y3Rpb24gb3IgaW50ICQweDgwIHdpbGwgYmUgYWNjZXB0ZWQuCgpZb3VyIHByb3Bvc2Fs
IGxvb2tzIGV2ZW4gbW9yZSBsaWtlIGEgc29sdXRpb24gaW4gc2VhcmNoIG9mIGEgcHJvYmxlbQp0
aGFuIHRoZSBvcmlnaW5hbCBvbmUuCgpUaGFua3MsCgogICAgICAgIHRnbHgKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
