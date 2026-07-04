Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705D3C43458
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jul 2026 17:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hkHbsrV4gs6W4z1F1LS0jhDS5mo+Q2mbYMSDDeN99Eo=; b=TUUQfqlHvmJk4j
	ZvnsBmZZrXsc6lHehw8x8k8FpUlAIzoT0LnBJJ93M7FZZardtrB353w2TP9jDXM5DaiX/b4JjtNec
	hT5NiZ8m034GUUyl6E8d6XX8lXf3RxY/VQj+sLF//sUo+bXqgVYNS8Mi7bOfWv+66OzfzYtWFKJfS
	RiUjI6lUhC5H0eHoxvvkgkEc/Csz2ddo2+7kNlofMvOf+i+ZJRVGiB1ndICtdHWNmDI/v2QOcVt2V
	qeTLa0isksofIVeTvvz/A4xzqSryxP90mJsA1ffnMvSsM8RBpXbQYsmIVG9L939xXxd5qK3e9Dkw4
	xleSs/9NR9fq67eouT3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg46T-00000008cB8-3fgm;
	Sat, 04 Jul 2026 17:24:33 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg46R-00000008cAg-2jf0
	for linux-riscv@lists.infradead.org;
	Sat, 04 Jul 2026 17:24:32 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 664HNJRr1739853
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sat, 4 Jul 2026 10:23:20 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 664HNJRr1739853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1783185802;
	bh=laVgWzETVzPyfy8TL8hiLjbkrz+X11MaGvxM78c56UQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=ddFVpaRAV0DC0OsSpEM1RIGHdBDJycmv5PNIh79X6gjmuMgZhFXuXaEyZMuGKQziN
	 OXk7biHUDHT0id4zqijW2S9+E1K2MG3eQgRHESaRXSn6bOYCiocdts3lN+RepzSoZw
	 TOOQ7IFrPKYiQXilVte+NFU7pH4AfLGwtMm+BT8IuAwsfOXlg8V88nAoWj3ssgp7L8
	 ugiLZlzclplOyDd/yAEDi+QXxhgXjjoy3ynstiJ/KRiwHjrTYdeKJ88yjtqBF39aRs
	 qeK/eeXW2dOUDGPSJXmYE43L0c6Vl+pbFzkWgHwreiQ+kRpM4ZyEWkWN2b5QpPTl1+
	 hYinKg61do8cg==
Date: Sat, 04 Jul 2026 10:23:14 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Thomas Gleixner <tglx@kernel.org>,
        =?ISO-8859-1?Q?Michal_Such=E1nek?= <msuchanek@suse.de>,
        Peter Zijlstra <peterz@infradead.org>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, Andy Lutomirski <luto@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Andrew Donnellan <andrew+kernel@donnellan.id.au>,
        Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, Zong Li <zong.li@sifive.com>,
        Nam Cao <namcao@linutronix.de>, Deepak Gupta <debug@rivosinc.com>,
        Lukas Gerlach <lukas.gerlach@cispa.de>,
        Rui Qi <qirui.001@bytedance.com>, Kees Cook <kees@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFC=5D_entry=3A_Untangle_the_return_value_of?=
 =?US-ASCII?Q?_syscall=5Fenter=5Ffrom=5Fuser=5Fmode_from_syscall_NR?=
User-Agent: K-9 Mail for Android
In-Reply-To: <87h5mhnjsr.ffs@fw13>
References: <akVRcPsD_R_CE1qW@kunlun.suse.cz> <BA7CD91D-C0E5-47A1-B49C-BC6AF6604182@zytor.com> <87h5mhnjsr.ffs@fw13>
Message-ID: <3DD62076-5420-4D2B-8E7E-9FE0446BD8A0@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_102431_698370_FF73461D 
X-CRM114-Status: GOOD (  28.30  )
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

T24gSnVseSAyLCAyMDI2IDI6NDk6NTYgUE0gUERULCBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj5PbiBXZWQsIEp1bCAwMSAyMDI2IGF0IDExOjI5LCBILiBQZXRlciBB
bnZpbiB3cm90ZToKPgo+Q2FuIHlvdSBwbGVhc2UgdHJpbSB5b3VyIHJlcGxpZXM/IFNjcm9sbGlu
ZyB0aHJvdWdoIGh1bmRyZWQgbGluZXMgb2YKPnVzZWxlc3MgcXVvdGVkIHRleHQgaXMganVzdCBh
bm5veWluZy4KPgo+PiBPbiBKdWx5IDEsIDIwMjYgMTA6NDI6MDggQU0gUERULCAiTWljaGFsIFN1
Y2jDoW5layIgPG1zdWNoYW5la0BzdXNlLmRlPiB3cm90ZToKPj4+LXN0YXRpYyBfX2Fsd2F5c19p
bmxpbmUgbG9uZyBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKHN0cnVjdCBwdF9yZWdzICpy
ZWdzLCBsb25nIHN5c2NhbGwpCj4+PitzdGF0aWMgX19hbHdheXNfaW5saW5lIGxvbmcgc3lzY2Fs
bF9lbnRlcl9mcm9tX3VzZXJfbW9kZShzdHJ1Y3QgcHRfcmVncyAqcmVncywgbG9uZyAqc3lzY2Fs
bCkKPj4+IHsKPj4+IAlsb25nIHJldDsKPj4+Cj4KPj4gMS4gVGhlIHR5cGUgZm9yIGEgc3lzdGVt
IGNhbGwgaXMgaW50Lgo+Cj5UaGF0IHNoaXAgaGFzIHNhaWxlZCBsb25nIGFnby4gbWFuIHN5c2Nh
bGwgLi4uCj4KPj4gMi4gQSB2YWxpZCBzeXN0ZW0gY2FsbCBudW1iZXIgaXMgYWx3YXlzIGdvaW5n
IHRvIGJlIHBvc2l0aXZlLgo+Cj5UaGF0J3MgdHJ1ZSB0b2RheS4KPgo+PiAzLiBCaXRzIFszMDoy
NF0gYXJlIGF2YWlsYWJsZSBmb3IgYXJjaGl0ZWN0dXJlIEFCSSB1c2UuIFRoZQo+PiAgICAiYXJj
aGl0ZWN0dXJlIGluZGVwZW5kZW50IiBwYXJ0IG9mIHRoZSBzeXN0ZW0gY2FsbCBudW1iZXIgaXMg
dGhlcmVmb3JlCj4+ICAgIDI0IGJpdHMgd2lkZS4KPj4KPj4gNC4gVGhlIGV4YWN0IEFCSSBpcyBw
bGF0Zm9ybS1zcGVjaWZpYywgb2J2aW91c2x5LCBidXQgYXMgYSBnZW5lcmFsCj4+ICAgIGd1aWRl
bGluZSAoZXNwZWNpYWxseSBmb3IgbmV3IHBsYXRmb3Jtcy9BQklzKSBzaG91bGQgZm9sbG93IHRo
ZSBydWxlcwo+PiAgICBmb3IgYSBwbGF0Zm9ybSAiaW50IiBpZiBwcmFjdGljYWwuIE5vdGFibHks
IHdoZW4gcGFzc2luZyBhIHZhbHVlIGluIGEKPj4gICAgcmVnaXN0ZXIgbGFyZ2VyIHRoYW4gMzIg
Yml0cywgd2hpY2ggc2lkZSBvZiB0aGUgY2FsbGluZyBpbnRlcmZhY2UgaXMKPj4gICAgcmVzcG9u
c2libGUgZm9yIHNpZ24tZXh0ZW5kaW5nIGEgdmFsdWUgcGFzc2VkIGluIGEgcmVnaXN0ZXIuIElm
IGNhbGxlcgo+PiAgICBzaWRlLCB0aGUga2VybmVsIHNob3VsZCB2YWxpZGF0ZSwgaWYgY2FsbGVl
IHNpZGUgdGhlIGtlcm5lbCBzaG91bGQKPj4gICAgaWdub3JlIHRoZSBhZGRpdGlvbmFsIGJpdHMg
YW5kIGRvIHRoZSBleHRlbnNpb24uCj4KPlRoZSBrZXJuZWwgc2lnbiBleHBhbmRzIHRvZGF5IGFs
cmVhZHksIGkuZS4gZm9yIGNvbXBhdCBzeXNjYWxscy4KPgo+PiA1LiBBIG5lZ2F0aXZlIHN5c3Rl
bSBjYWxsIG51bWJlciBpcyBndWFyYW50ZWVkIHRvIHJldHVybiAtRU5PU1lTCj4+ICAgICh1bmxl
c3MgaW50ZXJjZXB0ZWQgYnkgc2VjY29tcCwgcHRyYWNlLCBvciBhbm90aGVyIG1lY2hhbmlzbSB1
bmRlcgo+PiAgICB1c2VyIHNwYWNlIGNvbnRyb2wuKQo+Cj5UaGF0J3MgdHJ1ZSB0b2RheS4KPgo+
QVNNIGVudHJ5Ogo+ICAgICAgIHJlZ3MtPmVheCA9IC1FTk9TWVM7Cj4KPkMgZW50cnk6Cj4gICAg
ICAgbnIgPSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MsIG5yKTsKPgo+ICAgICAg
IGlmICgodW5zaWduZWQpbnIgPCBTWVNDQUxMX01BWCkKPiAgICAgICAJICAgIHJlZ3MtPmVheCA9
IGhhbmRsZV9zeXNjYWxsKCk7Cj4gICAgICAgZWxzZSBpZiAobnIgIT0gLTEpCj4gICAgICAgCSAg
ICByZWdzLT5lYXggPSAtRU5PU1lTOwo+Cj4gICAgICAgLi4uLgo+Cj5JZiBzZWNjb21wIG92ZXJ3
cml0ZXMgcmVncy0+ZWF4IGFuZCBhYm9ydHMgYW55IHN5c2NhbGwgKGluY2x1ZGluZyAtMSkgYnkK
PnJldHVybmluZyAtMSwgdGhlbiB0aGUgdmFsdWUgc2VjY29tcCB3cm90ZSBpbnRvIHJlZ3MtPmVh
eCBpcyBwcmVzZXJ2ZWQKPmFuZCByZXR1cm5lZCB0byB1c2VyIHNwYWNlLgo+Cj5UaGUgc2FtZSBh
cHBsaWVzIGZvciBzeXNjYWxsX3VzZXJfZGlzcGF0Y2goKSBhbmQgcHRyYWNlLi4uKCkgaWYgdGhl
eQo+ZGVjaWRlIHRvIG92ZXJ3cml0ZSByZWdzLT5lYXggX2FuZF8gYWJvcnQgdGhlIHN5c2NhbGwg
YnkgbGV0dGluZwo+c3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSgpIHJldHVybiAtMS4KPgo+
dHJhY2Vfc3lzY2FsbF9lbnRlcigpIGlzIG5vdCBhbnkgZGlmZmVyZW50LiBJZiB0aGUgbWFnaWMg
QlBGIGluIHRoZXJlCj5yZXdyaXRlcyB0aGUgc3lzY2FsbCBudW1iZXIgdG8gLTEgdGhlbiBlaXRo
ZXIgdGhlIG9yaWdpbmFsIC1FTk9TWVMgb3IKPnRoZSBCUEYgaW5kdWNlZCBvdmVyd3JpdGUgaXMg
cmV0dXJuZWQgdG8gdXNlciBzcGFjZS4KPgo+SXQncyBsZXNzIHRoYW4gb2J2aW91cyBhbmQgSSBo
YXZlIG5vIG9iamVjdGlvbnMgdG8gY2xlYW4gdGhhdCB1cCBhbmQKPm1ha2UgaXQgbW9yZSBpbnR1
aXRpdmUsIGJ1dCBJIHN0aWxsIGZhaWwgdG8gc2VlIHdoYXQgTWljaGFsIGlzIGFjdHVhbGx5Cj50
cnlpbmcgdG8gc29sdmUgYW5kIHdoYXQgdGhlIG1hZ2ljIGZsYWcgaXMgZm9yLiBJZiBzMzkwIHJl
cXVpcmVzIGl0LAo+dGhlbiB0aGF0J3MgYW4gczM5MCBwcm9ibGVtLCBidXQgZGVmaW5pdGVseSB4
ODYgZG9lcyBub3QuCj4KPj4gNi4gSWYgdGhlIHBsYXRmb3JtIG5lZWRzIHRvIGFsZ29yaXRobWlj
YWxseSBtb2RpZnkgdGhlIHN5c3RlbSBjYWxsCj4+ICAgIG51bWJlciBkdWUgdG8gcGxhdGZvcm0t
c3BlY2lmaWMgY29uY2VybnMgKHNheSwgdGhlIHBsYXRmb3JtIHVzZXMgYQo+PiAgICAxNi1iaXQg
c3BlY2lhbCBwdXJwb3NlIHJlZ2lzdGVyIGZvciB0aGUgc3lzY2FsbCBudW1iZXIsIG9yIGl0IGhh
cwo+PiAgICBtdWx0aXBsZSBrZXJuZWwgZW50cnkgcG9pbnRzIHdpdGggZGlmZmVyZW50IGJlaGF2
aW9yKSwgaXQgc2hvdWxkIGlmIGF0Cj4+ICAgIGFsbCBwb3NzaWJsZSB0cmFuc2NvZGUgdGhlIHN5
c3RlbSBjYWxsIG51bWJlciBhcyBuZWNlc3NhcnkgdG8gbWF0Y2gKPj4gICAgdGhpcyBjb252ZW50
aW9uIGluIEFQSXMgdGhhdCBhcmUgZXhwb3NlZCB0byBnZW5lcmFsIGtlcm5lbCBjb2RlLgo+Pgo+
PiBGb3IgZXhhbXBsZSwgaW4gdGhlIGZ1dHVyZSBJIGNvdWxkIHZlcnkgbXVjaCBzZWUgdGhlIElB
MzIgY29kZSBpbiB0aGUKPj4geDg2IGtlcm5lbCB1c2luZyBiaXQgMjkgaW50ZXJuYWxseSB0byBp
bmRpY2F0ZSBhbiBpYTMyIHN5c3RlbSBjYWxsLAo+PiBzaW1wbGlmeWluZyB0aGUgaXNfY29tcGF0
IGltcGxlbWVudGF0aW9uIG9uIHg4Ni4KPgo+SSBkb24ndCBzZWUgaG93IHRoYXQgbWFrZXMgaXQg
c2ltcGxlci4gVGhvc2UgYXJlIHR3byBkaWZmZXJlbnQgZW50cnkKPmNvZGUgcGF0aHMgYW5kIG1h
Z2ljIGJpdHMgd29udCBtYWtlIHRoYXQgZ28gYXdheS4KPgo+PiBJdCBzaG91bGQgbm90IG1lYW4g
dGhhdCBwYXNzaW5nIGJpdCAyOSB0byBlaXRoZXIgdGhlIHN5c2NhbGwKPj4gaW5zdHJ1Y3Rpb24g
b3IgaW50ICQweDgwIHdpbGwgYmUgYWNjZXB0ZWQuCj4KPllvdXIgcHJvcG9zYWwgbG9va3MgZXZl
biBtb3JlIGxpa2UgYSBzb2x1dGlvbiBpbiBzZWFyY2ggb2YgYSBwcm9ibGVtCj50aGFuIHRoZSBv
cmlnaW5hbCBvbmUuCj4KPlRoYW5rcywKPgo+ICAgICAgICB0Z2x4Cj4KPgoKVGhlIHR5cGUgaW4g
c3lzY2FsbCgzKSBpcyBpcnJlbGV2YW50LiBUaGUgYXJndW1lbnQgcGFzc2VkIHRvIHRoZSBrZXJu
ZWwgaXMgdHJlYXRlZCBhcyBhbiBpbnQgYW5kIHNpZ24tZXh0ZW5kZWQgZnJvbSAzMiBiaXRzLiAK
CkknbSBleHBsaWNpdGx5IG5vdCB0cnlpbmcgdG8gaW52ZW50IHRoaW5nczsgSSdtIHRyeWluZyB0
byBkb2N1bWVudCB0aGUgc3RhdHVzIHF1byB0byBhdm9pZCBmdXJ0aGVyIGNvbmZ1c2lvbiBhbmQg
dG8gY3JlYXRlIG1pc3Rha2VzLiAKCkknbSBzb3JyeSBJIG11ZGRsZWQgdGhlIHdhdGVycyB3aXRo
IHdoYXQgd2FzIGludGVuZGVkIHRvIGJlIGEgaHlwb3RoZXRpY2FsIGV4YW1wbGUuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
