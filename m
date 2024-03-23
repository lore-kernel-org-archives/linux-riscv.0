Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F079C54E58
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 12:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuYprYO3HVYF0yOjuzhbafWHI2hR1aAmj3OqsMOCZic=; b=otxnkAOtCgHNDY
	QLkRT0qzSy2LMCqHDVuvtejAs58sxlI8CxjTfVlCWGENWlamm7U7aD67LEUCBjDd4ZfDEwP4qiXnX
	dh2Gy4h1jzTiSAj31gL76yZC/6D0MjODqZHavC01pr4FL1w1O/ahyGeuttdXWFzIB6hwUkTueLJkd
	oIY5Lefmvu7dwRq+Rrx4wZqbFbkRg5B75aN5qXoYkgDK+a2bTma7wL0btfiaEwGWOyYzvyq1sGnMq
	VdbnDdyg7svHxa+bS/gVj/GYLOJdBDAG32GLFyjtqd5VxkGVJCEi2mJKwE7UxuymkGaP0r5jUXPcS
	mMM+EOMKZHQwEpIgiooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0lG-0000000AOaY-3IHA;
	Sat, 23 Mar 2024 12:46:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0lE-0000000AOa5-2KwV
	for linux-riscv@bombadil.infradead.org;
	Sat, 23 Mar 2024 12:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:References:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=4QAwHmLtmam4GpY5M1geCT/OMSnNUTDPePbkUBJaklk=; b=JjMy6HJ6HSV8YxLn+TRMS4BKHQ
	dXzfUn48YBwy1nkujB5a1NxxFpeS2IKo6EK1YMZ27Z3vsWB3atg1Xr9KEXr23pX5OPzMX63pJF8Yp
	fEddMlDa+NGRrLsMlEWgNgQwIjjU1g60pVvUdqEFTlihv+6/t0A2Kp/NukWiuuhQCxr+oESCRHSW0
	5C/xQqnhcf4Hf6p4Tb2KqUhB63Pwl2IGd4XqomWIISWy8NdJt2Z5PvL5COUkGd+koCdVKaX2eGUKH
	76lT0PkpsG7Ilrzvqtq5CsMKLDb6/bgAKSVwrmCuZjyfPuuO/d/sroF/0iaqnVLYdBX9Bw2VqX0Bc
	cZl/iPug==;
Received: from out203-205-221-155.mail.qq.com ([203.205.221.155])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0l8-0000000FWJg-1iT6
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 12:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1711197939; bh=4QAwHmLtmam4GpY5M1geCT/OMSnNUTDPePbkUBJaklk=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=XswpOuk5phQbFuJUICkbfsyuKSNI9K2vpUjS7AOjQujemXBXlTzVoQP9dwzN5VrTi
	 vT1BRq2wE4IrjCEuogv6dib+G/8uYbF11ONNFJFQG8FAVYy2p3VKX0tjhabZpTxt+C
	 PWPdah+X+hRotGReBsNfzN5w4863cOj3P2mEEIuo=
Received: from smtpclient.apple ([240e:467:1bf4:3ea0:e479:c9a1:95aa:d444])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id 9DF97C22; Sat, 23 Mar 2024 20:39:31 +0800
X-QQ-mid: xmsmtpt1711197571txj3ebjsu
Message-ID: <tencent_BE1AABF8C6052FB4FD1DD9713962E0425609@qq.com>
X-QQ-XMAILINFO: OKkKo7I1HxIeYsRDFAmm8SNn+E/R6zSHEkIhqlCo7BV7aYryBV9V/zL/PjuuAn
	 bMxFX/trQWhKgEj09W+dtZ1fd18tQ+GxX3HIelQ0JcpLprrp+9Uc0Lzhl8IjRAd7XkqybMlZsNQ6
	 dt9narQlT+bv/0SNmYPB7Z/fYdkhfFduFYNNFK4q2QfNUHsBqwOOudP/dv5q88CBB+pYNYRyE85L
	 EKwVgBb7eVs7hKcINbKjBT+tuo1VwqVfqagn/TQPnfsftrFbDS26RvXTPHKSHQ7VucwBRxxOTVwE
	 0en2jWtCJpC/mdqpB7GrDchr3+ciE+mePG4X0gnucNkdsg7sTYZjTt3W9QwASA6xbxWM+0Wnkvsm
	 zDLnrEHOxzuE07UxhzgZHneNLkVBupp5UGIPJVwaSbE7UOtSvbd8qM5BnmtTsWEC0NwC2jsPbL5k
	 NmOnLTyRRS/UzCKUGZh7z78Nps2Vx3mv2RJ4IOlahiR6kOHgWeExyJV8Y7mizHTfbi3LHVgaGDn2
	 mPFWY6XNvEEsAyMO5wtG9NioCEBUGzqksDob78qlcGwALJt2dKZRniTfCCrI6M2Qpw5Re/oeUbu8
	 0xMe1Nzva56/UDyZuO+Relk76LRrUd5j9xIalJfTN2VAh1NalaJHwV8G8s5cIjQ/v+LHYIWZOEHC
	 fiVPsdzEBdqKd5NuW7+W7HFsKRL3sL3ys9AHph4eoFY7XNYqPssqrg0mRhsK91ZLkVNUz1cQOyqo
	 EU6oEXNLpyAGIo77ZM5i4RT8Chzg8CAvAZYLTOY9J0ugSGiEYyd26gevbBSxBqOqw9kdNI8VKqRA
	 CzBENb1ujJ+ek020HeycQ1x/5I3MCju+p7xTopK4l9xPE4gQQib2FK4hfFmBKgIISqvFI4fLx/n/
	 Djko4NBNLy4KpGBGku7nvJLA6gtmVMTsuwRVXuvKkLrdSBiUmMUIzRukNiqx6jSCV3YNZasO9eIt
	 oPUcvySbILJJ9xkZ1G3Jc6YN7ApAnr2+zd7FQ8+rE05Gy9fj035Mii+UOB+54YvenmFjIKfX2jNX
	 ovOrm2Ug==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH] RISC-V: only flush icache when it has VM_EXEC set
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <CAHVXubiosOMnUghsaG_zDyX4wPQ3QGY_UhsUO+PGWQ8v2tDbFw@mail.gmail.com>
Date: Sat, 23 Mar 2024 20:39:21 +0800
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 jszhang@kernel.org,
 Andrew Waterman <andrew@sifive.com>
X-OQ-MSGID: <29CFE66B-53EA-4AB7-94C5-840583BC9002@cyyself.name>
References: <tencent_6D851035F6F2FD0B5A69FB391AE39AC6300A@qq.com>
 <mhng-3e79924e-d965-4156-836d-19cc8fb8cafe@palmer-ri-x1c9a>
 <CAHVXubiosOMnUghsaG_zDyX4wPQ3QGY_UhsUO+PGWQ8v2tDbFw@mail.gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_124603_360940_78DCDEE6 
X-CRM114-Status: GOOD (  16.14  )
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

Cgo+IE9uIE1hciAyMiwgMjAyNCwgYXQgMjM6NTAsIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRp
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gCj4gT24gV2VkLCBNYXIgMjAsIDIwMjQgYXQgMTo0OOKA
r0FNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+PiAKPj4gT24g
VHVlLCAwOSBKYW4gMjAyNCAxMDo0ODo1OSBQU1QgKC0wODAwKSwgY3l5QGN5eXNlbGYubmFtZSB3
cm90ZToKPj4+IEFzIEktQ2FjaGUgZmx1c2ggb24gY3VycmVudCBSSVNDLVYgbmVlZHMgdG8gc2Vu
ZCBJUElzIHRvIGV2ZXJ5IENQVSBjb3Jlcwo+Pj4gaW4gdGhlIHN5c3RlbSBpcyB2ZXJ5IGNvc3Rs
eSwgbGltaXRpbmcgZmx1c2hfaWNhY2hlX21tIHRvIGJlIGNhbGxlZCBvbmx5Cj4+PiB3aGVuIHZt
YS0+dm1fZmxhZ3MgaGFzIFZNX0VYRUMgY2FuIGhlbHAgbWluaW1pemUgdGhlIGZyZXF1ZW5jeSBv
ZiB0aGVzZQo+Pj4gb3BlcmF0aW9ucy4gSXQgaW1wcm92ZXMgcGVyZm9ybWFuY2UgYW5kIHJlZHVj
ZXMgZGlzdHVyYmFuY2VzIHdoZW4KPj4+IGNvcHlfZnJvbV91c2VyX3BhZ2UgaXMgbmVlZGVkIHN1
Y2ggYXMgcHJvZmlsaW5nIHdpdGggcGVyZi4KPj4+IAo+Pj4gRm9yIEktRCBjb2hlcmVuY2UgY29u
Y2VybnMsIGl0IHdpbGwgbm90IGZhaWwgaWYgc3VjaCBhIHBhZ2UgYWRkcyBWTV9FWEVDCj4+PiBm
bGFncyBpbiB0aGUgZnV0dXJlIHNpbmNlIHdlIGhhdmUgY2hlY2tlZCBpdCBpbiB0aGUgX19zZXRf
cHRlX2F0IGZ1bmN0aW9uLgo+Pj4gCj4+PiBTaWduZWQtb2ZmLWJ5OiBZYW5neXUgQ2hlbiA8Y3l5
QGN5eXNlbGYubmFtZT4KPj4+IC0tLQo+Pj4gYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZs
dXNoLmggfCA3ICsrKysrLS0KPj4+IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4+PiAKPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2NhY2hlZmx1c2guaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCj4+PiBp
bmRleCAzY2I1M2M0ZGYyN2MuLjkxNWY1MzJkYzMzNiAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCj4+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2NhY2hlZmx1c2guaAo+Pj4gQEAgLTMzLDggKzMzLDExIEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCBmbHVzaF9kY2FjaGVfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKPj4+ICAqIHNvIGluc3RlYWQg
d2UganVzdCBmbHVzaCB0aGUgd2hvbGUgdGhpbmcuCj4+PiAgKi8KPj4+ICNkZWZpbmUgZmx1c2hf
aWNhY2hlX3JhbmdlKHN0YXJ0LCBlbmQpIGZsdXNoX2ljYWNoZV9hbGwoKQo+Pj4gLSNkZWZpbmUg
Zmx1c2hfaWNhY2hlX3VzZXJfcGFnZSh2bWEsIHBnLCBhZGRyLCBsZW4pIFwKPj4+IC0gICAgIGZs
dXNoX2ljYWNoZV9tbSh2bWEtPnZtX21tLCAwKQo+Pj4gKyNkZWZpbmUgZmx1c2hfaWNhY2hlX3Vz
ZXJfcGFnZSh2bWEsIHBnLCBhZGRyLCBsZW4pICAgXAo+Pj4gK2RvIHsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Pj4gKyAgICAgaWYgKHZtYS0+dm1f
ZmxhZ3MgJiBWTV9FWEVDKSAgICAgICAgICAgICAgICAgICAgXAo+Pj4gKyAgICAgICAgICAgICBm
bHVzaF9pY2FjaGVfbW0odm1hLT52bV9tbSwgMCk7ICAgICAgICAgXAo+Pj4gK30gd2hpbGUgKDAp
Cj4+PiAKPj4+ICNpZmRlZiBDT05GSUdfNjRCSVQKPj4+ICNkZWZpbmUgZmx1c2hfY2FjaGVfdm1h
cChzdGFydCwgZW5kKSBmbHVzaF90bGJfa2VybmVsX3JhbmdlKHN0YXJ0LCBlbmQpCj4+IAo+PiBJ
J20gbm90IHN1cGVyIHdvcnJpZWQgYWJvdXQgdGhlIGJlbmNobWFya3MsIEkgdGhpbmsgd2UgY2Fu
IGp1c3QKPj4gb3Blbi1sb29wIGFzc3VtZSB0aGlzIGlzIGZhc3RlciBieSBhdm9pZGluZyB0aGUg
Zmx1c2hlcy4gIEkgZG8gdGhpbmsgd2UKPj4gbmVlZCBhIGhvb2sgaW50byBhdCBsZWFzdCB0bGJf
dXBkYXRlX3ZtYV9mbGFncygpLCB0aG91Z2gsIHRvIGluc2VydCB0aGUKPj4gZmVuY2UuaSB3aGVu
IHVwZ3JhZGluZyBhIG1hcHBpbmcgdG8gaW5jbHVkZSBWTV9FWEVDLgo+IAo+IEknZCBzYXkgWWFu
Z3l1IGlzIHJpZ2h0IHdoZW4gaGUgbWVudGlvbnMgaW4gdGhlIGNvbW1pdCBsb2c6ICJGb3IgSS1E
Cj4gY29oZXJlbmNlIGNvbmNlcm5zLCBpdCB3aWxsIG5vdCBmYWlsIGlmIHN1Y2ggYSBwYWdlIGFk
ZHMgVk1fRVhFQyBmbGFncwo+IGluIHRoZSBmdXR1cmUgc2luY2Ugd2UgaGF2ZSBjaGVja2VkIGl0
IGluIHRoZSBfX3NldF9wdGVfYXQgZnVuY3Rpb24uIi4KPiBJZiBhIHJlZ2lvbiBpbmRlZWQgYmVj
b21lcyBleGVjdXRhYmxlLCB0aGUgcGFnZSB0YWJsZSB3aWxsIGJlIG1vZGlmaWVkCj4gdG8gcmVm
bGVjdCB0aGF0IGFuZCB0aGVuIHdpbGwgcGFzcyBpbiBfX3NldF9wdGVfYXQoKSB3aGljaCwgYXMg
WWFuZ3l1Cj4gbWVudGlvbnMsIGRvZXMgdGhlIHJpZ2h0IHRoaW5nLiBPciBhbSBJIG1pc3Npbmcg
c29tZXRoaW5nPwo+IAoKSSB0aGluayBzby4gVW5sZXNzIHdlIGhhdmUgYW55IG90aGVyIHdheSB0
byB1cGRhdGUgUFRFIHJhdGhlciB0aGFuCnVzaW5nIF9fc2V0X3B0ZV9hdCwgSSB0aGluayBpdOKA
mXMgc2FmZS4gSeKAmW0gdG9vIGJ1c3kgdGhlc2UgZGF5cyB0bwpwcm92aWRlIGEgbWljcm8gZW5v
dWdoIGJlbmNobWFyay4KClRoYW5rcywKWWFuZ3l1IENoZW4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
