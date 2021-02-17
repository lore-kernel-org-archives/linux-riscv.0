Return-Path: <SRS0=wXp/=HT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F36EC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Feb 2021 16:37:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4F1764E15
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Feb 2021 16:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4F1764E15
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wqAn+SlXRqhU0NJVFZSFfIEzLZYbPq3n55bFzWTsb6s=; b=AGXYfEIGHnbPhXx/JG88eCo0c
	8PQsfM17DhsMKT1g29DXguqsQVdSqoJaHcS77U2rCcNYL8YjDnOJotEhCStdhKe4Viki28+BYvYnk
	M7jZNZH539awzj9OWCyaR1k45kdVM6WJTlfZATbD1pFGvwda0TJ8spRXgEzH3EomVvlSKubLllQcI
	UbpOwz3r/imr/T4UCkFURX+opF8yRfcb2Ewa9XzrJR2C44OQbZcw5naaWE/PYQN4NNZ7+JyluBnRl
	tHrbT5onfymBIMlM5QqN//0ziRLnpjMuPGeNClIlcwKJl0zYrk4B6sDmWoVxjrBuvmxyYmO8f9q4m
	vHR1Zy1jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCPoq-0007ze-HR; Wed, 17 Feb 2021 16:36:52 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCPon-0007yU-MT
 for linux-riscv@lists.infradead.org; Wed, 17 Feb 2021 16:36:51 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.12] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 62D241C0004;
 Wed, 17 Feb 2021 16:36:40 +0000 (UTC)
Subject: Re: riscv+KASAN does not boot
To: Dmitry Vyukov <dvyukov@google.com>
References: <CACT4Y+bDqMiC+ou5ghb=XB3Oyjw3p-GTDvNw4NkkQqQthw1yuQ@mail.gmail.com>
 <mhng-02b88d43-ede8-48f9-82f1-c84201acb7a8@palmerdabbelt-glaptop>
 <CACT4Y+aN3LvgaBc_zmW=t=D7ChU-jrWYnjt5sZ2GEDQhg_BC9A@mail.gmail.com>
 <CACT4Y+aC19DaNOm87EO3cER2=MEmO9pmtUxzVmRtg9YhZKuMVA@mail.gmail.com>
 <20210118145310.crnqnh6kax5jqicj@distanz.ch>
 <CACT4Y+bFV6m1LCYb1nO7ioKJK99916D76sJ+H-LgBjWx6biF5w@mail.gmail.com>
 <CACT4Y+bmDKNnykeTP9yKjje3XZjbXY3De+_e3fMFOMoe0dnARw@mail.gmail.com>
 <6e9ee3a1-0e16-b1fc-a690-f1ca8e9823a5@ghiti.fr>
 <CACT4Y+adSjve7bXRPh5UybCQx6ubOUu5RbwuT620wdcxHzVYJg@mail.gmail.com>
 <CACT4Y+ZNJBnkKHXUf=tm_yuowvZvHwN=0rmJ=7J+xFd+9r_6pQ@mail.gmail.com>
 <CACT4Y+awHrJfFo+g33AiAnCj3vq6t6PqbL-3=Qbciy6dAJfVWg@mail.gmail.com>
 <24857bfc-c557-f141-8ae7-2e3da24f67f5@ghiti.fr>
 <CACT4Y+bmuhR=2u=1bGK+W8ttOn+=bkKrqCRM8_SiDSW1iAX60A@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <957f09fb-84f4-2e0a-13ab-f7e4831ee7d0@ghiti.fr>
Date: Wed, 17 Feb 2021 11:36:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CACT4Y+bmuhR=2u=1bGK+W8ttOn+=bkKrqCRM8_SiDSW1iAX60A@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_113649_955669_7383DB44 
X-CRM114-Status: GOOD (  34.69  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Bjorn Topel <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, LKML <linux-kernel@vger.kernel.org>,
 nylon7@andestech.com, syzkaller <syzkaller@googlegroups.com>,
 Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

TGUgMi8xNi8yMSDDoCAxMTo0MiBQTSwgRG1pdHJ5IFZ5dWtvdiBhIMOpY3JpdMKgOgo+IE9uIFR1
ZSwgRmViIDE2LCAyMDIxIGF0IDk6NDIgUE0gQWxleCBHaGl0aSA8YWxleEBnaGl0aS5mcj4gd3Jv
dGU6Cj4+Cj4+IEhpIERtaXRyeSwKPj4KPj4gTGUgMi8xNi8yMSDDoCA2OjI1IEFNLCBEbWl0cnkg
Vnl1a292IGEgw6ljcml0IDoKPj4+IE9uIFR1ZSwgRmViIDE2LCAyMDIxIGF0IDEyOjE3IFBNIERt
aXRyeSBWeXVrb3YgPGR2eXVrb3ZAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiBPbiBGcmks
IEphbiAyOSwgMjAyMSBhdCA5OjExIEFNIERtaXRyeSBWeXVrb3YgPGR2eXVrb3ZAZ29vZ2xlLmNv
bT4gd3JvdGU6Cj4+Pj4+PiBJIHdhcyBmaXhpbmcgS0FTQU4gc3VwcG9ydCBmb3IgbXkgc3Y0OCBw
YXRjaHNldCBzbyBJIHRvb2sgYSBsb29rIGF0IHlvdXIKPj4+Pj4+IGlzc3VlOiBJIGJ1aWx0IGEg
a2VybmVsIG9uIHRvcCBvZiB0aGUgYnJhbmNoIHJpc2N2L2ZpeGVzIHVzaW5nCj4+Pj4+PiBodHRw
czovL2dpdGh1Yi5jb20vZ29vZ2xlL3N5emthbGxlci9ibG9iLzI2OWQyNGU4NTdhNzU3ZDA5YTg5
ODA4NmEyZmE2ZmE1ZDgyN2MzZTEvZGFzaGJvYXJkL2NvbmZpZy9saW51eC91cHN0cmVhbS1yaXNj
djY0LWthc2FuLmNvbmZpZwo+Pj4+Pj4gYW5kIEJ1aWxkcm9vdCAyMDIwLjExLiBJIGhhdmUgdGhl
IHdhcm5pbmdzIHJlZ2FyZGluZyB0aGUgdXNlIG9mCj4+Pj4+PiBfX3ZpcnRfdG9fcGh5cyBvbiB3
cm9uZyBhZGRyZXNzZXMgKGJ1dCB0aGF0J3Mgbm9ybWFsIHNpbmNlIHRoaXMgZnVuY3Rpb24KPj4+
Pj4+IGlzIHVzZWQgaW4gdmlydF9hZGRyX3ZhbGlkKSBidXQgbm90IHRoZSBzZWdmYXVsdHMgeW91
IGRlc2NyaWJlLgo+Pj4+Pgo+Pj4+PiBIaSBBbGV4LAo+Pj4+Pgo+Pj4+PiBMZXQgbWUgdHJ5IHRv
IHJlYnVpbGQgYnVpbGRyb290IGltYWdlLiBNYXliZSB0aGVyZSB3YXMgc29tZXRoaW5nIHdyb25n
Cj4+Pj4+IHdpdGggbXkgYnVpbGQsIHRob3VnaCwgSSBkaWQgJ21ha2UgY2xlYW4nIGJlZm9yZSBk
b2luZy4gQnV0IGF0IHRoZQo+Pj4+PiBzYW1lIHRpbWUgaXQgd29ya2VkIGJhY2sgaW4gSnVuZS4u
Lgo+Pj4+Pgo+Pj4+PiBSZSBXQVJOSU5HcywgdGhleSBpbmRpY2F0ZSBrZXJuZWwgYnVncy4gSSBh
bSB3b3JraW5nIG9uIHNldHRpbmcgdXAgYQo+Pj4+PiBzeXpib3QgaW5zdGFuY2Ugb24gcmlzY3Yu
IElmIHRoZXJlIGEgV0FSTklORyBkdXJpbmcgYm9vdCB0aGVuIHRoZQo+Pj4+PiBrZXJuZWwgd2ls
bCBiZSBtYXJrZWQgYXMgYnJva2VuLiBObyBmdXJ0aGVyIHRlc3Rpbmcgd2lsbCBoYXBwZW4uCj4+
Pj4+IElzIGl0IGEgbWlzLXVzZSBvZiBXQVJOX09OPyBJZiBzbywgY291bGQgYW55Ym9keSBwbGVh
c2UgcmVtb3ZlIGl0IG9yCj4+Pj4+IHJlcGxhY2UgaXQgd2l0aCBwcl9lcnIuCj4+Pj4KPj4+Pgo+
Pj4+IEhpLAo+Pj4+Cj4+Pj4gSSd2ZSBsb2NhbGl6ZWQgb25lIGlzc3VlIHdpdGggcmlzY3YvS0FT
QU46Cj4+Pj4gS0FTQU4gYnJlYWtzIFZEU08gYW5kIHRoYXQncyBJIHRoaW5rIHRoZSByb290IGNh
dXNlIG9mIHdlaXJkIGZhdWx0cyBJCj4+Pj4gc2F3IGVhcmxpZXIuIFRoZSBmb2xsb3dpbmcgcGF0
Y2ggZml4ZXMgaXQuCj4+Pj4gQ291bGQgc29tZWJvZHkgcGxlYXNlIHVwc3RyZWFtIHRoaXMgZml4
PyBJIGRvbid0IGtub3cgaG93IHRvIGFkZC9ydW4KPj4+PiB0ZXN0cyBmb3IgdGhpcy4KPj4+PiBU
aGFua3MKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2Vm
aWxlIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZQo+Pj4+IGluZGV4IDBjZmQ2ZGE3
ODRmODQuLmNmM2EzODNjMTc5OWQgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
dmRzby9NYWtlZmlsZQo+Pj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUK
Pj4+PiBAQCAtMzUsNiArMzUsNyBAQCBDRkxBR1NfUkVNT1ZFX3ZnZXR0aW1lb2ZkYXkubyA9ICQo
Q0NfRkxBR1NfRlRSQUNFKSAtT3MKPj4+PiAgICAjIERpc2FibGUgZ2NvdiBwcm9maWxpbmcgZm9y
IFZEU08gY29kZQo+Pj4+ICAgIEdDT1ZfUFJPRklMRSA6PSBuCj4+Pj4gICAgS0NPVl9JTlNUUlVN
RU5UIDo9IG4KPj4+PiArS0FTQU5fU0FOSVRJWkUgOj0gbgo+Pj4+Cj4+Pj4gICAgIyBGb3JjZSBk
ZXBlbmRlbmN5Cj4+Pj4gICAgJChvYmopL3Zkc28ubzogJChvYmopL3Zkc28uc28KPj4KPj4gV2hh
dCdzIHdlaXJkIGlzIHRoYXQgSSBkb24ndCBoYXZlIGFueSBpc3N1ZSB3aXRob3V0IHRoaXMgcGF0
Y2ggd2l0aCB0aGUKPj4gZm9sbG93aW5nIGNvbmZpZyB3aGVyZWFzIGl0IGluZGVlZCBzZWVtcyBy
ZXF1aXJlZCBmb3IgS0FTQU4uIEJ1dCB3aGVuCj4+IGxvb2tpbmcgYXQgdGhlIHNlZ2ZhdWx0cyB5
b3UgZ290IGVhcmxpZXIsIHRoZSBzZWdmYXVsdCBhZGRyZXNzIGlzIDB4YmIwCj4+IGFuZCB0aGUg
Y2F1c2UgaXMgYW4gaW5zdHJ1Y3Rpb24gcGFnZSBmYXVsdDogdGhpcyBhZGRyZXNzIGlzIHRoZSBQ
TFQgYmFzZQo+PiBhZGRyZXNzIGluIHZkc28uc28gYW5kIGFuIGluc3RydWN0aW9uIHBhZ2UgZmF1
bHQgd291bGQgbWVhbiB0aGF0IHNvbWVvbmUKPj4gdHJpZWQgdG8ganVtcCBhdCB0aGlzIGFkZHJl
c3MsIHdoaWNoIGlzIHdlaXJkLiBBdCBmaXJzdCBzaWdodCwgdGhhdCBkb2VzCj4+IG5vdCBzZWVt
IHJlbGF0ZWQgdG8geW91ciBwYXRjaCBhYm92ZSwgYnV0IGNsZWFybHkgSSBtYXkgYmUgd3Jvbmcu
Cj4+Cj4+IFRvYmlhcywgZGlkIHlvdSBvYnNlcnZlIHRoZSBzYW1lIHNlZ2ZhdWx0cyBhcyBEbWl0
cnkgPwo+IAo+IAo+IEkgbm90aWNlZCB0aGF0IG5vdCBhbGwgYnVpbGRyb290IGltYWdlcyB1c2Ug
VkRTTywgaXQgc2VlbXMgdG8gYmUKPiBkZXBlbmRlbnQgb24gbGliYyBzZXR0aW5ncyAoYXQgbGVh
c3QgSSB0aGluayBJIGNoYW5nZWQgaXQgaW4gdGhlCj4gcGFzdCkuCgpPaywgSSB1c2VkIHVDbGli
YyBidXQgdGhlbiB3aGVuIHVzaW5nIGdsaWJjLCBJIGhhdmUgdGhlIHNhbWUgc2VnZmF1bHRzLCAK
b25seSB3aGVuIEtBU0FOIGlzIGVuYWJsZWQuIEFuZCB5b3VyIHBhdGNoIGZpeGVzIHRoZSBwcm9i
bGVtLiBJIHdpbGwgdHJ5IAp0byB0YWtlIGEgbG9vayBsYXRlciB0byBiZXR0ZXIgdW5kZXJzdGFu
ZCB0aGUgcHJvYmxlbS4KCj4gSSBhbHNvIGJvb3RlZCBhbiBpbWFnZSBjb21wbGV0ZWx5IHN1Y2Nl
c3NmdWxseSBpbmNsdWRpbmcgZGhjcGQvc3NoZAo+IHN0YXJ0LCBidXQgdGhlbiBteSBleGVjdXRh
YmxlIGNyYXNoZWQgaW4gY2xvY2tfZ2V0dGltZS4gVGhlIGV4ZWN1dGFibGUKPiB3YXMgYnVpbGQg
b24gbGludXgvYW1kNjQgaG9zdCB3aXRoICJyaXNjdjY0LWxpbnV4LWdudS1nY2MgLXN0YXRpYyIK
PiAoMTAuMi4xKS4KPiAKPiAKPj4+IFNlY29uZCBpc3N1ZSBJIGFtIHNlZWluZyBzZWVtcyB0byBi
ZSByZWxhdGVkIHRvIHRleHQgc2VnbWVudCBzaXplLgo+Pj4gSSBjaGVjayBvdXQgdjUuMTEgYW5k
IHVzZSB0aGlzIGNvbmZpZzoKPj4+IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2R2eXVrb3YvNmFm
MjU0NzRkNDU1NDM3NTc3YTg0MjEzYjBjYzkxNzgKPj4KPj4gVGhpcyBjb25maWcgZ2F2ZSBteSBs
YXB0b3AgYSBoYXJkIHRpbWUgISBGaW5hbGx5IEkgd2FzIGFibGUgdG8gYm9vdAo+PiBjb3JyZWN0
bHkgdG8gdXNlcnNwYWNlLCBidXQgSSByZWFsaXplZCBJIHVzZWQgbXkgc3Y0OCBicmFuY2guLi5F
aXRoZXIgSQo+PiBmaXhlZCB5b3VyIGlzc3VlIGFsb25nIHRoZSB3YXkgb3IgSSBjYW4ndCByZXBy
b2R1Y2UgaXQsIEknbGwgZ2l2ZSBpdCBhCj4+IHRyeSB0b21vcnJvdy4KPiAKPiBXaGVyZSBpcyB5
b3VyIGJyYW5jaD8gSSBjb3VsZCBhbHNvIHRlc3QgaW4gbXkgc2V0dXAgb24geW91ciBicmFuY2gu
Cj4gCgpZb3UgY2FuIGZpbmQgbXkgYnJhbmNoIGludC9hbGV4L3Jpc2N2X2tlcm5lbF9lbmRfb2Zf
YWRkcmVzc19zcGFjZV92MiAKaGVyZTogaHR0cHM6Ly9naXRodWIuY29tL0FsZXhHaGl0aS9yaXNj
di1saW51eC5naXQKClRoYW5rcywKCj4gCj4+PiBUaGVuIHRyeWluZyB0byBib290IGl0IHVzaW5n
Ogo+Pj4gUUVNVSBlbXVsYXRvciB2ZXJzaW9uIDUuMi4wIChEZWJpYW4gMTo1LjIrZGZzZy0zKQo+
Pj4gJCBxZW11LXN5c3RlbS1yaXNjdjY0IC1tYWNoaW5lIHZpcnQgLXNtcCAyIC1tIDRHIC4uLgo+
Pj4KPj4+IEl0IHNob3dzIG5vIG91dHB1dCBmcm9tIHRoZSBrZXJuZWwgd2hhdHNvZXZlciwgZXZl
biB0aG91Z2ggSSBoYXZlCj4+PiBlYXJseWNvbiBhbmQgb3V0cHV0IHNob3dzIHZlcnkgZWFybHkg
d2l0aCBvdGhlciBjb25maWdzLgo+Pj4gS2VybmVsIGJvb3RzIGZpbmUgd2l0aCBkZWZjb25maWcg
YW5kIG90aGVyIHNtYWxsZXIgY29uZmlncy4KPj4+Cj4+PiBJZiBJIGVuYWJsZSBLQVNBTl9PVVRM
SU5FIGFuZCBDQ19PUFRJTUlaRV9GT1JfU0laRSwgdGhlbiB0aGlzIGNvbmZpZwo+Pj4gYWxzbyBi
b290cyBmaW5lLiBCb3RoIG9mIHRoZXNlIG9wdGlvbnMgc2lnbmlmaWNhbnRseSByZWR1Y2Uga2Vy
bmVsCj4+PiBzaXplLiBIb3dldmVyLCBJIGNhbiBhbHNvIGJvb3QgdGhlIGtlcm5lbCB3aXRob3V0
IHRoZXNlIDIgY29uZmlncywgaWYKPj4+IEkgZGlzYWJsZSBhIHdob2xlIGxvdCBvZiBzdWJzeXN0
ZW0gY29uZmlncy4gVGhpcyBtYWtlcyBtZSB0aGluayB0aGF0Cj4+PiB0aGVyZSBpcyBhbiBpc3N1
ZSByZWxhdGVkIHRvIGtlcm5lbCBzaXplIHNvbWV3aGVyZSBpbgo+Pj4gcWVtdS9ib290bG9hZGVy
L2tlcm5lbCBib290c3RyYXAgY29kZS4KPj4+IERvZXMgaXQgbWFrZSBzZW5zZSB0byB5b3U/IENh
biBzb21lYm9keSByZXByb2R1Y2Ugd2hhdCBJIGFtIHNlZWluZz8gPgo+Pgo+PiBJIGRpZCBub3Qg
YnJpbmcgYW55IGFuc3dlciB0byB5b3VyIHF1ZXN0aW9uLCBidXQgYXQgbGVhc3QgeW91IGtub3cg
SSdtCj4+IHdvcmtpbmcgb24gaXQsIEknbGwga2VlcCB5b3UgcG9zdGVkLgo+Pgo+PiBUaGFua3Mg
Zm9yIHRha2luZyB0aGUgdGltZSB0byBzZXR1cCBzeXprYWxsZXIuCj4+Cj4+IEFsZXgKPj4KPj4+
IFRoYW5rcwo+Pj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4+IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKPj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YKPj4+Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
