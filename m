Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CB0C636CD
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 06:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iEVrLW2v4XarvfwbesXNYVHPDw8wcCcq6+ts2M8fGe8=; b=T+gVEjXk15DKqM
	uci3e0Tm6ksMKvN1zcx9Hsqb+bbFy9x5whPPV1AQX60YQwFpkk5Z+h1aLXT+8vbL/KAIfFV1/gGMh
	sf9H03J09OIxc/reD72X8XJK/TxqcVEaMib713RU8IEMSl3XZtDGvlPQiQndLBJlg903dqP0JGfx3
	bLv8hn1LeOaWj7+1p4qAIlhg40RWI0CP8d1JyXMRmWSPw94C6KcoO6n38daYqxRL5SntopNCG5pIr
	rSV8ynrd19PMPzENBna4/IRznWNVHcw+kttlE63yOOGSumVSBcOlFGjIowV9xatM+G373u0hPMMic
	EyNCRfdO9tDycz7BkqxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQNCs-004VtE-UE; Fri, 10 Feb 2023 06:48:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQNCp-004Vs9-LC
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 06:48:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AF38061CBB;
	Fri, 10 Feb 2023 06:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E180C433D2;
	Fri, 10 Feb 2023 06:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1676011702;
	bh=b6Oc5ZzVG7nkvmdk4QiD1WgVKwZk2maRbTIji6Y1fRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/mNkwkhzmWnBepo6lLnMq2Hy8LeFdqTjsvG9JKYOHiE3I/OTk2GACwE/E1kBhDwQ
	 SsexiB9LjVzuhFVNyP232bjlM6QwapGkfcBJ6shtGvQWoQIQb/oyi1re+7V5Rinbrx
	 4PZpgtZNXiGKHAaG4ZW91ELrOP7LaTvQkDp4gW0w=
Date: Fri, 10 Feb 2023 07:48:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Evan Green <evan@rivosinc.com>, Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Vineet Gupta <vineetg@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>, slewis@rivosinc.com,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>, Arnd Bergmann <arnd@arndb.de>,
	Atish Patra <atishp@rivosinc.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Celeste Liu <coelacanthus@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Dao Lu <daolu@rivosinc.com>, Guo Ren <guoren@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ruizhe Pan <c141028@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Tobias Klauser <tklauser@distanz.ch>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
Message-ID: <Y+Xosn6Zbbcqn3ge@kroah.com>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-3-evan@rivosinc.com>
 <Y+HsE397cY4HF+5K@kroah.com>
 <C3C21677-5250-4120-9A4F-24945C1EE51B@kernel.org>
 <CALs-HsvuX-Uj5g9c6vvUp=MaUpdcPdpwwQCsxzjoXpqS+3LEsA@mail.gmail.com>
 <Y+UpqHstcMahbadE@kroah.com>
 <F4C20D57-912B-489F-A262-51EAEE79F41D@jrtc27.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F4C20D57-912B-489F-A262-51EAEE79F41D@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_224823_809763_1CCEB7F2 
X-CRM114-Status: GOOD (  40.21  )
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

T24gVGh1LCBGZWIgMDksIDIwMjMgYXQgMDU6MjI6MDlQTSArMDAwMCwgSmVzc2ljYSBDbGFya2Ug
d3JvdGU6Cj4gT24gOSBGZWIgMjAyMywgYXQgMTc6MTMsIEdyZWcgS0ggPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPiB3cm90ZToKPiA+IE9uIFRodSwgRmViIDA5LCAyMDIzIGF0IDA5OjA5OjE2
QU0gLTA4MDAsIEV2YW4gR3JlZW4gd3JvdGU6Cj4gPj4gT24gTW9uLCBGZWIgNiwgMjAyMyBhdCAx
MDozMiBQTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+PiAKPiA+
Pj4gSGV5IEV2YW4sIEdyZWcsCj4gPj4+IAo+ID4+PiAKPiA+Pj4gT24gNyBGZWJydWFyeSAyMDIz
IDA2OjEzOjM5IEdNVCwgR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3Rl
Ogo+ID4+Pj4gT24gTW9uLCBGZWIgMDYsIDIwMjMgYXQgMTI6MTQ6NTFQTSAtMDgwMCwgRXZhbiBH
cmVlbiB3cm90ZToKPiA+Pj4+PiBXZSBkb24ndCBoYXZlIGVub3VnaCBzcGFjZSBmb3IgdGhlc2Ug
YWxsIGluIEVMRl9IV0NBUHssMn0gYW5kIHRoZXJlJ3Mgbm8KPiA+Pj4+PiBzeXN0ZW0gY2FsbCB0
aGF0IHF1aXRlIGRvZXMgdGhpcywgc28gbGV0J3MganVzdCBwcm92aWRlIGFuIGFyY2gtc3BlY2lm
aWMKPiA+Pj4+PiBvbmUgdG8gcHJvYmUgZm9yIGhhcmR3YXJlIGNhcGFiaWxpdGllcy4gIFRoaXMg
Y3VycmVudGx5IGp1c3QgcHJvdmlkZXMKPiA+Pj4+PiBte2FyY2gsaW1wLHZlbmRvcn1pZCwgYnV0
IHdpdGggdGhlIGtleS12YWx1ZSBwYWlycyB3ZSBjYW4gcGFzcyBtb3JlIGluCj4gPj4+Pj4gdGhl
IGZ1dHVyZS4KPiA+Pj4+IAo+ID4+Pj4gSWNrLCB0aGlzIGlzIGV4YWN0bHkgd2hhdCBzeXNmcyBp
cyBkZXNpZ25lZCB0byBleHBvcnQgaW4gYSBzYW5lIHdheS4KPiA+Pj4+IFdoeSBub3QganVzdCB1
c2UgdGhhdCBpbnN0ZWFkPyAgVGhlICJrZXkiIHdvdWxkIGJlIHRoZSBmaWxlbmFtZSwgYW5kIHRo
ZQo+ID4+Pj4gdmFsdWUgdGhlIHZhbHVlIHJlYWQgZnJvbSB0aGUgZmlsZW5hbWUuICBJZiB0aGUg
a2V5IGlzIG5vdCBwcmVzZW50LCB0aGUKPiA+Pj4+IGZpbGUgaXMgbm90IHByZXNlbnQgYW5kIGl0
J3Mgb2J2aW91cyB3aGF0IGlzIGhhcHBlbmluZywgbm8gZmFuY3kgcGFyc2luZwo+ID4+Pj4gYW5k
IEFCSSBpc3N1ZXMgYXQgYWxsLgo+ID4+PiAKPiA+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtcmlzY3YvMjAyMjEyMDExNjA2MTQueHBvbWxxcTJmenB6Zm1jbUBrYW16aWsvCj4gPj4+
IAo+ID4+PiBUaGlzIGlzIHRoZSBzeXNmcyBpbnRlcmZhY2UgdGhhdCBJIG1lbnRpb25lZCBkcmV3
Cj4gPj4+IHN1Z2dlc3RlZCBvbiB0aGUgdjEuCj4gPj4+IEkgdGhpbmsgaXQgZml0cyB+cGVyZmVj
dGx5IHdpdGggd2hhdCBHcmVnIGlzIHN1Z2dlc3RpbmcgdG9vLgo+ID4+IAo+ID4+IFdob29wcywg
SSdsbCBhZG1pdCBJIG1pc3NlZCB0aGF0IGNvbW1lbnQgd2hlbiBJIHJldmlld2VkIHRoZSBmZWVk
YmFjawo+ID4+IGZyb20gdjEuIEkgc3BlbnQgc29tZSB0aW1lIHRoaW5raW5nIGFib3V0IHN5c2Zz
LiBUaGUgcHJvYmxlbSBpcyB0aGlzCj4gPj4gaW50ZXJmYWNlIHdpbGwgYmUgbmVlZGVkIGluIHBs
YWNlcyBsaWtlIHZlcnkgZWFybHkgcHJvZ3JhbSBzdGFydHVwLiBJZgo+ID4+IHdlJ3JlIHRyeWlu
ZyB0byB1c2UgdGhpcyBpbiBwbGFjZXMgbGlrZSB0aGUgaWZ1bmMgc2VsZWN0b3IgdG8gZGVjaWRl
Cj4gPj4gd2hpY2ggbWVtY3B5IHRvIHVzZSwgaGF2aW5nIHRvIGdvIG9wZW4gYW5kIHJlYWQgYSBm
aXN0ZnVsIG9mIGZpbGVzIGlzCj4gPj4gZ29pbmcgdG8gYmUgY29tcGxleCB0aGF0IGVhcmx5LCBh
bmQgcm91Z2ggb24gcGVyZm9ybWFuY2UuCj4gPiAKPiA+IEhvdyBpcyBpdCBnb2luZyB0byBiZSBh
bnkgZGlmZmVyZW50IG9uICJwZXJmb3JtYW5jZSIgdGhhbiBhIHN5c2NhbGw/ICBPcgo+ID4gY29t
cGxleD8gIEl0IHNob3VsZCBiZSBhbG1vc3QgaWRlbnRpY2FsIG92ZXJhbGwgYXMgdGhpcyBpcyBh
bGwgaW4tcmFtCj4gPiBhbmQgbm90IGFueSByZWFsIEkvbyBpcyBoYXBwZW5pbmcuICBZb3UgYXJl
IGxpbWl0ZWQgb25seSBieSB0aGUgc3BlZWQgb2YKPiA+IHlvdXIgY3B1Lgo+ID4gCj4gPj4gUmVh
bGx5IHRoaXMgaXMgZGF0YSB0aGF0IHdvdWxkIGdvIGdyZWF0IGluIHRoZSBhdXggdmVjdG9yLCBl
eGNlcHQKPiA+PiB0aGVyZSdzIHByb2JhYmx5IHRvbyBtdWNoIG9mIGl0IHRvIGp1c3RpZnkgcHJl
cGFyaW5nIGFuZCBjb3B5aW5nIGludG8KPiA+PiBldmVyeSBuZXcgcHJvY2Vzcy4gWW91IGNvdWxk
IHBvaW50IHRoZSBhdXggdmVjdG9yIGludG8gYSB2RFNPIGRhdGEKPiA+PiBhcmVhLiBUaGlzIGhh
cyB0aGUgYWR2YW50YWdlIG9mIGdyZWF0IHBlcmZvcm1hbmNlIGFuZCBubyBzeXNjYWxsLCBidXQK
PiA+PiBoYXMgdGhlIGRpc2FkdmFudGFnZXMgb2YgbWFraW5nIHRoYXQgZGF0YSBBQkksIGFuZCBy
ZXF1aXJpbmcgaXQgYWxsIHRvCj4gPj4gYmUga25vd24gdXAgZnJvbnQgKGVnIHRoZSBrZXJuZWwg
Y2FuJ3QgY29tcHV0ZSBhbnkgYW5zd2VycyBvbiB0aGUKPiA+PiBmbHkpLgo+ID4+IAo+ID4+IEFm
dGVyIGRpc2N1c3Npb25zIHdpdGggUGFsbWVyLCBteSBwbGFuIGZvciB0aGUgbmV4dCB2ZXJzaW9u
IGlzIHRvIG1vdmUKPiA+PiB0aGlzIGludG8gYSB2RFNPIGZ1bmN0aW9uIHBsdXMgYSBzeXNjYWxs
LiBQcml2YXRlIHZEU08gZGF0YSB3aWxsIGJlCj4gPj4gcHJlcHBlZCB3aXRoIGNvbW1vbiBhbnN3
ZXJzIGZvciB0aGUgImFsbCBDUFVzIiBjYXNlLCBhdm9pZGluZyB0aGUgbmVlZAo+ID4+IGZvciBh
IHN5c2NhbGwgaW4gbW9zdCBjYXNlcyBhbmQgbWFraW5nIHRoaXMgZmFzdC4gU2luY2UgdGhlIGRh
dGEgaXMKPiA+PiBoaWRkZW4gYmVoaW5kIHRoZSB2ZHNvIGZ1bmN0aW9uLCBpdCdzIG5vdCBBQkks
IHdoaWNoIGlzIGEgcGx1cy4gVGhlbgo+ID4+IHRoZSB2ZHNvIGZ1bmN0aW9uIGNhbiBmYWxsIGJh
Y2sgdG8gdGhlIHN5c2NhbGwgZm9yIGNhc2VzIHdpdGggZXhvdGljCj4gPj4gQ1BVIG1hc2tzIG9y
IGtleXMgdGhhdCBhcmUgdW5rbm93bi9leHBlbnNpdmUgdG8gY29tcHV0ZSBhdCBydW50aW1lLgo+
ID4gCj4gPiBJIHN0aWxsIHRoaW5rIHRoYXQncyB3cm9uZywgYXMgeW91IGFyZSB3YW50aW5nIGEg
c2V0IG9mIGtleS92YWx1ZXMgaGVyZSwKPiA+IHdoaWNoIGlzIGV4YWN0bHkgd2hhdCBzeXNmcyBp
cyBkZXNpZ25lZCBmb3IuCj4gCj4gQnV0IHRoaXMgbmVlZHMgdG8gYmUgYSBSSVNDLVYgc3RhbmRh
cmQgaW50ZXJmYWNlIHRoYXQgY2FuIGJlIHByb2dyYW1tZWQKPiBhZ2FpbnN0LCBub3Qgc29tZXRo
aW5nIHRpZWQgdG8gaGlnaGx5IExpbnV4LXNwZWNpZmljIHRoaW5ncyBsaWtlIHN5c2ZzLgo+IFlv
deKAmXJlIGZyZWUgdG8gaW1wbGVtZW50IHRoYXQgaW50ZXJmYWNlIHdpdGggc3lzZnMsIGJ1dCBl
eHBvc2luZyB0aGF0Cj4gYXMgKnRoZSogaW50ZXJmYWNlIHRvIHVzZSB3b3VsZCBiZSB0ZXJyaWJs
ZSBmb3IgcG9ydGFiaWxpdHkuCgpBIHZkc28gYW5kIGEgbmV3IGtlcm5lbCBzeXNjYWxsIGlzIGFs
c28gYSBoaWdobHkgTGludXgtc3BlY2lmaWMgdGhpbmcsCnNvIEkgZG8gbm90IHVuZGVyc3RhbmQg
dGhlIG9iamVjdGlvbiBoZXJlIGF0IGFsbC4gIFlvdSdyZSBnb2luZyB0byBoYXZlCnRvIHdyYXAg
YWxsIG9mIHRoaXMgdXAgaW4gc29tZSBzb3J0IG9mIGNvbW1vbiB1c2Vyc3BhY2UgbGlicmFyeSBj
b2RlCmFueXdheSwgYW5kIHRoYXQgd2lsbCBoYXZlIHRvIGhhbmRsZSBhbGwgb2YgdGhlIGRpZmZl
cmVudCBvcGVyYXRpbmcKc3lzdGVtIGltcGxlbWVudGF0aW9ucy4KCkFsc28sIGZyYW5rbHksIEkg
ZG9uJ3QgY2FyZSBhYm91dCBub24tTGludXggaW1wbGVtZW50YXRpb25zLCBzbyB0aGF0Cmlzbid0
IGEgdmFsaWQgYXJndW1lbnQgaGVyZSA6KQoKdGhhbmtzLAoKZ3JlZyBrLWgKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
