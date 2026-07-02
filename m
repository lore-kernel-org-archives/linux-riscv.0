Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9AEC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 20:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ye2nDc4PrvU8siQNs8eINfwktwj7Xxpu86GuLDhzlDs=; b=wC+13LhWRn8WVg
	qMEMU8xs4DYnj90RU4OpO+aqM6w3oalLeYA2kyIUU6ipimQQcogOdDoJKQKV6KK2WTb7dpeV0lY6z
	2t5uS/Gaiz6xoFMUv2+g+f3rVFIeg3JjyTXeUO0D8LD2yhaM/Q1FYS5n3ZXYOXSou78x85BNEBxCz
	2xXTIcoA+I04iQ4/1ZKckCjCZS4/pblrOEHjq5B04A2dVKwQWC45n9px7nV8p4zOPp13UxcFf9iRi
	eKKot6t/J/BhWgqGvRWLDsgcTf/dsakNRau4PTQBRMoU7wvGkgX+41QuqoQZBj1V+h58Or2M1C96e
	XOpwgHiPTL3P2yO4zFOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfOIK-00000005T7d-0ROf;
	Thu, 02 Jul 2026 20:46:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfOII-00000005T7V-1ITB
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 20:45:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 677034013B;
	Thu,  2 Jul 2026 20:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E22A1F000E9;
	Thu,  2 Jul 2026 20:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783025157;
	bh=RgKO/UZyvy5Z38gyC0IxY1FJQhRYi6rg13CXydLdQY0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=UaD5CREX6zIC4y3TKyphGTRRC28mz0dermBnriIDo4VJeBY/fdSm+bo4SMeeqxcg4
	 2nZAzjliM6+hr13yB3w26OsBLeq2/LrH4mPoYTvdvIoIgX7/pLVzQh7YACklPUTPLp
	 FLllWVPCLOhkab1Df0IWNyhs3Ywb2DxH7ixWEd8w6zgUPmPOydjr19iHGh9HjLcZ4F
	 9UCuRvgiy4zhYBZoDyEW5Z9msFbTaIp5y2F8IW6O+Mb0197Xa/ngseuyyyv0Wudwne
	 iFoJGUnjorvAS2hYs4zLCLoOB5VYqaG8YVDJzvMwOcYqcJ7sZ/KrRKbchO6zN9ftrj
	 z/YENEra/5DFg==
From: Thomas Gleixner <tglx@kernel.org>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Andy Lutomirski <luto@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Andrew Donnellan <andrew+kernel@donnellan.id.au>, Mark
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
In-Reply-To: <akZPakNl6JT_jgGd@kunlun.suse.cz>
References: <akVRcPsD_R_CE1qW@kunlun.suse.cz> <878q7tprau.ffs@fw13>
 <akZPakNl6JT_jgGd@kunlun.suse.cz>
Date: Thu, 02 Jul 2026 22:45:54 +0200
Message-ID: <87jyrdnmrh.ffs@fw13>
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

T24gVGh1LCBKdWwgMDIgMjAyNiBhdCAxMzo0NSwgTWljaGFsIFN1Y2jDoW5layB3cm90ZToKPiBP
biBUaHUsIEp1bCAwMiwgMjAyNiBhdCAwMToyNDo1N1BNICswMjAwLCBUaG9tYXMgR2xlaXhuZXIg
d3JvdGU6Cj4+IE9uIFdlZCwgSnVsIDAxIDIwMjYgYXQgMTk6NDIsIE1pY2hhbCBTdWNow6FuZWsg
d3JvdGU6Cj4+ID4gVGhlIHJldHVybiB2YWx1ZSBvZiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9t
b2RlIGlzIHVzZWQgYm90aCBmb3IgdGhlCj4+ID4gYWRqdXN0ZWQgc3lzY2FsbCBudW1iZXIgYW5k
IHRoZSBpbmRpY2F0b3IgdGhhdCBhIHN5c2NhbGwgc2hvdWxkIGJlCj4+ID4gc2tpcHBlZC4KPj4g
Pgo+PiA+IEFzIHNlY2NvbXAgY2FuIGJlIGludm9rZWQgb24gYW55IHN5c2NhbGwsIGluY2x1ZGlu
ZyBpbnZhbGlkIG9uZXMgdGhpcwo+PiA+IHNvbWV3aGF0IHVuZGVybWluZXMgc2VjY29tcC4KPj4g
Pgo+PiA+IFdoaWxlIHRoZSBzZWNjb21wIHZhcmlhbnRzIHRoYXQgdGVybWluYXRlIHRoZSBwcm9j
ZXNzIGRvIG5vdCBuZWVkIHRvCj4+ID4gY2FyZSBhYm91dCB0aGlzIGZvciB0aGUgZmlsdGVyIHRo
YXQgc2V0cyB0aGUgc3lzY2FsbCByZXR1cm4gdmFsdWUgdGhpcwo+PiA+IGRpc2N0aW5jdGlvbiBp
cyByZXF1aXJlZC4KPj4gCj4+IFlvdSBjb21wbGV0ZWx5IGZhaWwgdG8gZXhwbGFpbiB3aHkgYW5k
IHdoYXQgYWN0dWFsIHByb2JsZW0geW91IGFyZQo+PiB0cnlpbmcgdG8gc29sdmUuIEF0IGxlYXN0
IEkgY2FuJ3QgZmlndXJlIGl0IG91dCBmcm9tIHRoZSBhYm92ZSB3b3JkCj4+IHNhbGFkLgo+Cj4g
c3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSByZXR1cm5zIHRoZSBuZXcgc3lzY2FsbCBudW1i
ZXIgYWZ0ZXIgZG9pbmcKPiBzb21ldGhpbmcgYXJiaXRyYXJyeSB3aXRoIGl0LCBpbmNsdWRpbmcg
cnVubmluZyBzZWNjb21wLgo+Cj4gV2VobiB0aGUgc3lzY2FsbCBpcyBhbHJlYWR5IGhhbmRsZWQs
IGVnLiBieSBzZWNjb21wIGZpbHRlcmluZyBpdCByZXR1cm5zCj4gLTEgYXMgdGhlIG5ldyBzeXNj
YWxsIG51bWJlci4gLTEgaXMgYW4gaW52YWxpZCBzeXNjYWxsIG51bWJlciBidXQgaXQgY2FuCj4g
c3RpbGwgYmUgZmlsdGVyZWQgYnkgc2VjY29tcC4KCk9uY2Ugc3lzY2FsbF9lbnRlcl9mcm9tX3Vz
ZXJfbW9kZSgpIHJldHVybnMgLTEgbm90aGluZyBjYW4gZmlsdGVyIGl0CmFueW1vcmUuCgo+IFdo
ZW4gdGhlIHN5c2NhbGwgbnVtYmVyIHdhcyAtMSB0byBzdGFydCB3aXRoIGl0J3Mgbm90IHBvc3Np
YmxlIHRvCj4gZGV0ZXJtaW5lIGlmIHRoZSBzeXNjYWxsIHdhcyBmaWxldGVyZCBmcm9tIHRoZSBy
ZXR1cm4gdmFsdWUuIHMzOTAKPiByZXR1cm5zIHRoZSBmaWx0ZXJlZCBzdGF0ZSBpbiBhIGZsYWcg
aXQgc2V0cyBvbiB0aGUgcmVncyBzdHJ1Y3R1cmUsCj4gYXZvaWRpbmcgdGhpcyBwcm9ibGVtLgoK
V2hhdCBuZWVkcyB0byBkZXRlcm1pbmUgd2hldGhlciB0aGUgc3lzY2FsbCB3YXMgZmlsdGVyZWQg
b3Igbm90PwoKPiBIb3dldmVyLCB0aGUgQVBJIHNob3VsZCBiZSBzcGVjaWZpZWQgaW4gYSB3YXkg
dGhhdCBkb2VzIG5vdCByZXF1aXJlCj4gZXZlcnlvbmUgaW1wbGVtZW50aW5nIHN1Y2ggZmxhZy4K
CldoaWNoIGV4YWN0IHByb2JsZW0gZG9lcyB0aGUgZmxhZyBzb2x2ZT8KCj4+ID4gLQlpbnN0cnVt
ZW50YXRpb25fYmVnaW4oKTsKPj4gPiAtCWlmICghaW52b2tlX3N5c2NhbGwocmVncywgbnIpICYm
IG5yICE9IC0xKQo+PiA+IC0JIAlyZXN1bHRfcmVnKHJlZ3MpID0gX19zeXNfbmlfc3lzY2FsbChy
ZWdzKTsKPj4gPiAtCWluc3RydW1lbnRhdGlvbl9lbmQoKTsKPj4gPiArCS8qIFNraXAgc3lzY2Fs
bCB3aGVuIC0xIGlzIHJldHVybmVkICovCj4+ID4gKwlpZiAoIXN5c2NhbGxfZW50ZXJfZnJvbV91
c2VyX21vZGUocmVncywgJm5yKSkgewo+PiAKPj4gU2VyaW91c2x5Pwo+PiAKPj4gSWYgd2UgZ28g
YW5kIHNlcGFyYXRlIHRoZSBzeXNjYWxsIG51bWJlciBmcm9tIHRoZSByZXR1cm4gdmFsdWUsIHRo
ZW4gdGhlCj4+IHJldHVybiB2YWx1ZSAwIG1lYW5zIHN1Y2Nlc3MgYW5kIGFueXRoaW5nIGVsc2Ug
ZmFpbC4gV2hpY2ggaW4gb3RoZXIKPj4gd29yZHMgaXMgYSBib29sZWFuLiBTbyBpbnN0ZWFkIG9m
IHRhc3RlbGVzc2x5IGFkZGluZyBhIGNvbXBsZXRlbHkKPj4gbm9uc2Vuc2ljYWwgY29tbWVudCBh
Ym91dCAtMSBoZXJlLCBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkgd2FudHMKPj4gdG8g
aGF2ZSB0aGUgcmV0dXJuIHZhbHVlIHR5cGUgYm9vbCB3aXRoIGEgcHJvcGVyIGJvb2xlYW4gbG9n
aWM6IHRydWUgPQo+PiBzdWNjZXNzLCBmYWxzZSA9IGFib3J0Lgo+Cj4gV2UgaGF2ZSB0aGF0IHZl
cnkgc2FtZSBBUEkgZG93biB0byBfX3NlY3VyZV9jb21wdXRpbmcoKSB3aGljaCByZXR1cm5zCj4g
Ym9vbGVhbiByZXByZXNlbnRlZCBhcyAtMSBhbmQgMCB2YWx1ZXMuIFRoYXQgZG9lcyBub3QgbWVh
biBpdCdzIG5vdAo+IHRhc3RlbGVzcy4KCkhhaGFoYWhhaGEuCgpXZSBoYXZlIGEgbG90IG9mIGZ1
bmN0aW9ucyB3aGljaCBoYXZlIGEgYm9vbGVhbiByZXR1cm4gdmFsdWUgYnV0IGEKaW50L2xvbmcg
cmV0dXJuIHR5cGUgZm9yIGhpc3RvcmljYWwgcmVhc29ucy4KCldlJ3ZlIGFkZGVkIGJvb2wgYmVj
YXVzZSBpdCdzIG5vdCBhbWJpZ3VvdXMgYW5kIGFsbG93cyB0aGUgY29tcGlsZXIgdG8Kb3B0aW1p
emUgYmV0dGVyLiBJdCBhbHNvIG1ha2VzIHRoZSBjb2RlIG1vcmUgY2xlYXIuIE1vZGVybiBjb2Rl
IHVzZXMgYQpub24tYm9vbGVhbiByZXR1cm4gdHlwZSBvbmx5IHdoZW4gdGhlcmUgaXMgYW4gYWN0
dWFsIHJlYXNvbiBmb3IgaXQsCmUuZy4gcHJvcGFnYXRpbmcgYW4gZXJyb3IgY29kZSBhbGwgdGhl
IHdheSBiYWNrIHRocm91Z2ggdGhlIGNhbGwgY2hhaW4uClRoZSBoaXN0b3JpY2FsIDA9c3VjY2Vz
cyA8MCA9IGVycm9yY29kZSBtb2RlbCByZWFsbHkgd2FudCdzIHRvIGJlCnJlc3RyaWN0ZWQgdG8g
c3VjaCBjYXNlcy4KCkp1c3QgZm9yIHRoZSByZWNvcmQ6CgogIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC82N2MzYWU1Yy1kODhiLTQxNzItOTk5Ni00ZTIwNDZiN2UwZGNAaHVhd2VpLmNvbS8K
ICBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA2MjkxMzA2MTYuNjQyMDIyLTItcnVh
bmppbmppZUBodWF3ZWkuY29tLwoKU28gSSBzdGFuZCB3aXRoIG15IGNvbW1lbnQgdGhhdCBpdCBp
cyBzbG9wcHkgYW5kIHRhc3RlbGVzcyB0byBzbGFwIGFuCmFyZ3VtZW50IGludG8gYSBwaWxlIG9m
IGZ1bmN0aW9ucywgY2xhaW0gc2VwYXJhdGlvbiBvZiByZXR1cm4gdmFsdWUgYW5kCnN5c2NhbGwg
bnVtYmVyIGFuZCBsZWF2ZSB0aGUgcmV0dXJuIHZhbHVlIGluIGFuIGlsbC1kZWZpbmVkIHN0YXRl
LgoKPj4gPiBAQCAtMTY4LDggKzE2OCw3IEBAIF9fdmlzaWJsZSBub2luc3RyIHZvaWQgZG9faW50
ODBfZW11bGF0aW9uKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+PiA+ICAJbnIgPSBzeXNjYWxsXzMy
X2VudGVyKHJlZ3MpOwo+PiA+ICAKPj4gPiAgCWxvY2FsX2lycV9lbmFibGUoKTsKPj4gPiAtCW5y
ID0gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZV93b3JrKHJlZ3MsIG5yKTsKPj4gPiAtCWRv
X3N5c2NhbGxfMzJfaXJxc19vbihyZWdzLCBucik7Cj4+ID4gKwlzeXNjYWxsX2VudGVyX2Zyb21f
dXNlcl9tb2RlX3dvcmsocmVncywgJm5yKTsKPj4gCj4+IEhvdyBleGFjdGx5IGlzIHRoaXMgZXZl
ciBnb2luZyB0byBpbnZva2UgYSB2YWxpZCBzeXNjYWxsPwo+Cj4gVGhhdCdzIG9uZSBvZiB0aGUg
cHJvYmxlbXMgd2l0aCBnaWFudCBhbGwtaW4tb25lIHBhdGNoLCB0aGluZ3MgbGlrZSB0aGlzCj4g
ZWFzaWx5IHNsaXAgaW4uIEhvd2V2ZXIsIGl0IGlzIGluIGNsdWRlZCBtb3N0bHkgZm9yIGlsbHVz
dHJhdGlvbiwgSQo+IGRvbid0IGV4cGVjdCBhbnlvbmUgdG8gbWVyZ2UgdGhpcyBhcy1pcy4KCkl0
J3MgYSBwcm9ibGVtIHdpdGggaGFzdGlseSBjb2JibGVkIHRvZ2V0aGVyIHNsb3AuIEV2ZW4gUkZD
IHBhdGNoZXMKc2hvdWxkIGF0IGxlYXN0IGJlIGZ1bmN0aW9uYWwuCiAKPj4gPiArCWlmICghc3lz
Y2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZV93b3JrKHJlZ3MsICZucikpIHsKPj4gPiArCQluciAm
PSBHRU5NQVNLKDMxLCAwKTsKPj4gPiArCQlkb19zeXNjYWxsXzMyX2lycXNfb24ocmVncywgbnIp
Owo+PiAKPj4gICBkb19zeXNjYWxsXzMyX2lycXNfb24ocmVncywgKGludClucik7Cj4+IAo+PiB3
b3VsZCBiZSB0b28gc2ltcGxlLCByaWdodD8KPgo+IEFsc28gd2F5IGxlc3MgZXhwbGljaXQuCgpO
b3cgeW91IGNhcmUgYWJvdXQgZXhwbGljaXQsIGJ1dCB0aGUgcmV0dXJuIHZhbHVlIG1lc3MgY2Fu
IGJlIGxlZnQKYW1iaWd1b3VzLCByaWdodD8KCkFzaWRlIG9mIHRoYXQsIHRoZSBjYXN0IGlzIHZl
cnkgbXVjaCBleHBsaWNpdCBmb3IgcGVvcGxlIHdobyBjYW4gcmVhZCBDLgoKSXQgd291bGQgYmUg
Z3JlYXQgaWYgeW91IGNvdWxkIHNpdCBiYWNrIGFuZCBjb21lIHVwIHdpdGggYSB2ZXJ5IGV4cGxp
Y2l0CmFuZCBjb21wcmVoZW5zaWJsZSBleHBsYW5hdGlvbiBmb3IgdGhlIHByb2JsZW0geW91IGFy
ZSB0cnlpbmcgdG8gc29sdmUuCgpUaGFua3MsCgogICAgICAgIHRnbHgKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
