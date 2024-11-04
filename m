Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6710D111A5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 03:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KIt5U068J5tCd3qvdsWrIZ7ljQtmgd9lbybcN5BEKlg=; b=COY6xNFYm5u6xJ
	3c+eocYpvCaJtlfz+X4B6fAAVkHR0NGfc4Is4NWtHo+YFtbi603aNJoFcL7vqn3vM5nB5Qwmqp3xd
	6jMxUGG39Sv/DgokYJEYroisANm1e8WcEvBlfP3FeDNspB32X4cS0HjoMb8mxqnWgm0dkqywlyCDv
	tQa7BCZSTX+qyCris+1PSww2mNpzqdUwIfZx4yD3iTCxwyWz2XtdhawZtjctm6v7inNcRhOs1/Tpi
	q9YGjL7KS9I2a4+vljcwt4zJCMkAMTuEKzzYlzJLK9m0tAS8Mso0S9hP5XxqwUnpGWdhsk6vGYtXo
	/WHMWVPFAcQ4regD+NHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7o8r-0000000CanK-02Td;
	Mon, 04 Nov 2024 03:52:37 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7o0d-0000000CZqd-0jz4
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 03:44:09 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5ebab72da05so1940817eaf.0
        for <linux-riscv@lists.infradead.org>; Sun, 03 Nov 2024 19:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1730691840; x=1731296640; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4fakRh8sye3jPEox0UlPU/qvi+CwkqRNh/HcEuMyoc=;
        b=gigAa1lVeTs42Z6dogPviGCZ87Mmp1WJnfXwYrvN2fkphDrlerxn3VMgm0OxgWMJbT
         adoF2h07bAi6qyk2DTsXphKCiCy8m0uWmO0IiAV5OtL+E3UpPZH8whDd1NyRc4l/JJNg
         BJ5RsLtBXalfKfrmHnjdeaW4PygMpWX8NlklHEHQfgeHP6/AQ52QFK34wcmtlt5m/lB5
         UP3lMzloFCVD+JnGG887ywO+ZlP+sSGg3lpbsPswELuhmjlerMQXVs/53y8nC7TXImF+
         /UZbK/dwBoIecCz3xT5NxwyEe9qRS28IqXINd63R854tqRX0qpcCenwDwksbHOWJHK8j
         992g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730691840; x=1731296640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4fakRh8sye3jPEox0UlPU/qvi+CwkqRNh/HcEuMyoc=;
        b=eOZ8fhCcCpLtwNq/Vy0GHzU/jJyhSPYbdNAHkNwQSiXj5R3LmvtbLvKjmz/nRcVUog
         5dHMxfcMiJIB7F7j4EWrlx8z8lke6aQlMjaK06KIhKCtVFWa5Kv2e9ugfZZg3Nra73Fy
         twDCoHFU3kHq8jY95mKiFIDaIB8FKaSySFZ22fUc9JyDUUL2aSX1SUj/8r8GAvs0Okza
         kbikbcWZ6O63xyj2vD1501ggg2cG4uMXaHaZ+ujBHpTejIP6MvZNT3kh8pQNr2c/0usK
         78ivyeNIrJyL+j7eKx/BIiri/pg+TWizGYMrYRykeOUEag0kpGO+RRucgdy5RldaPwFB
         Lffg==
X-Forwarded-Encrypted: i=1; AJvYcCWv99/WMiSStFyg0wcuYBAiGwyiTll6s033Yv67wRPZst51UxVlOEypZhEasps5rvACjZhF11CCrCQOpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxR6Xx4sy4ar7D+XdOammXl4x7Z1rWVVlHid+cbASTQJ38IbJ6q
	yjHE5R8pYdMW5yzoLNUsMy6tmNOW/p4hMR2fUQxt97STqFKcbs1Ka5P9MYeffG7EE5H26l6y8jG
	Gyj40Jm50pmkNWDUGpzffY4Ll9OMIOmL/0AKTiw==
X-Google-Smtp-Source: AGHT+IHowkm8L0BkrzUoIWvagpjJDW4Ncnx46v2FYMoNot193/y7DqBbyROpepcuBrQbrXR+mtmlJN0Iz7kR9DOqDoE=
X-Received: by 2002:a05:6820:310b:b0:5ed:f849:51dd with SMTP id
 006d021491bc7-5edf8495895mr4072347eaf.8.1730691839815; Sun, 03 Nov 2024
 19:43:59 -0800 (PST)
MIME-Version: 1.0
References: <20241014094705.71775-1-cuiyunhui@bytedance.com>
 <d39e4832-50f3-4fc8-ba95-a2d6eefa5abe@ghiti.fr> <CAEEQ3wk6K52RdCat+L91KvfNVkxbj1-3zxjubkn9xy89wK_-bA@mail.gmail.com>
 <c05e09d0-d996-4712-a6e5-ef77f1f2ff0a@ghiti.fr> <CAEEQ3wmw8B_cOs54H4Z8e2QTGyeE2cAYQwDRyk7KgUUKTFhZ-g@mail.gmail.com>
 <CAHVXubjDhM6NEF6uf981Y2fNA1Dw=Bu_SNtpso6P1=3Np6BUDw@mail.gmail.com>
 <CAEEQ3wndPwdaNrJZaqqrbyMBeWTVnV3m8KEehdijtTfXWjuYsw@mail.gmail.com> <ZyBfvfvyry6Wb89H@sunil-laptop>
In-Reply-To: <ZyBfvfvyry6Wb89H@sunil-laptop>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 4 Nov 2024 11:43:48 +0800
Message-ID: <CAEEQ3wkwUx1ySYRXZZP3vO2r5+1zd1PqFrUidkU11tnnzR+MnQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: ACPI: fix early_ioremap to early_memremap
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, punit.agrawal@bytedance.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	ajones@ventanamicro.com, jeeheng.sia@starfivetech.com, haibo1.xu@intel.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_194407_599370_CD7F5980 
X-CRM114-Status: GOOD (  43.33  )
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

SGkgU3VuaWwsIEFsZXgKCk9uIFR1ZSwgT2N0IDI5LCAyMDI0IGF0IDEyOjA44oCvUE0gU3VuaWwg
ViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBPY3QgMjks
IDIwMjQgYXQgMTE6MDQ6NDlBTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90ZToKPiA+IEhpIEFsZXgs
Cj4gPgo+ID4KPiA+IE9uIE1vbiwgT2N0IDI4LCAyMDI0IGF0IDk6MzfigK9QTSBBbGV4YW5kcmUg
R2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSBZdW5o
dWksCj4gPiA+Cj4gPiA+IFNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseSwgSSB3YXMgb24gdmFjYXRp
b24gbGFzdCB3ZWVrLgo+ID4gPgo+ID4gPiBPbiBNb24sIE9jdCAyMSwgMjAyNCBhdCA4OjQ14oCv
QU0geXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4g
PiA+ID4gSGkgQWxleCwKPiA+ID4gPgo+ID4gPiA+IE9uIE1vbiwgT2N0IDE0LCAyMDI0IGF0IDk6
MDHigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+ID4gPiA+ID4K
PiA+ID4gPiA+IE9uIDE0LzEwLzIwMjQgMTQ6MzAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiA+ID4g
PiA+IEhpIEFsZXgsCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE9uIE1vbiwgT2N0IDE0LCAyMDI0
IGF0IDg6MTLigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+ID4g
PiA+ID4gPj4gSGkgWXVuaHVpLAo+ID4gPiA+ID4gPj4KPiA+ID4gPiA+ID4+IE9uIDE0LzEwLzIw
MjQgMTE6NDcsIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiA+ID4gPiA+Pj4gV2hlbiBTVlBCTVQgaXMg
ZW5hYmxlZCwgX19hY3BpX21hcF90YWJsZSgpIHdpbGwgZGlyZWN0bHkgYWNjZXNzIHRoZQo+ID4g
PiA+ID4gPj4+IGRhdGEgaW4gRERSIHRocm91Z2ggdGhlIElPIGF0dHJpYnV0ZSwgcmF0aGVyIHRo
YW4gdGhyb3VnaCBoYXJkd2FyZQo+ID4gPiA+ID4gPj4+IGNhY2hlIGNvbnNpc3RlbmN5LCByZXN1
bHRpbmcgaW4gaW5jb3JyZWN0IGRhdGEgaW4gdGhlIG9idGFpbmVkIEFDUEkKPiA+ID4gPiA+ID4+
PiB0YWJsZS4KPiA+ID4gPiA+ID4+Pgo+ID4gPiA+ID4gPj4+IFRoZSBsb2c6IEFDUEk6IFtBQ1BJ
OjB4MThdIEludmFsaWQgemVybyBsZW5ndGguCj4gPiA+ID4gPiA+Pj4KPiA+ID4gPiA+ID4+PiBX
ZSBkbyBub3QgYXNzdW1lIHdoZXRoZXIgdGhlIGJvb3Rsb2FkZXIgZmx1c2hlcyBvciBub3QuIFdl
IHNob3VsZAo+ID4gPiA+ID4gPj4+IGFjY2VzcyBpbiBhIGNhY2hlYWJsZSB3YXkgaW5zdGVhZCBv
ZiBtYWludGFpbmluZyBjYWNoZSBjb25zaXN0ZW5jeQo+ID4gPiA+ID4gPj4+IGJ5IHNvZnR3YXJl
Lgo+ID4gPiA+ID4gPj4+Cj4gPiA+ID4gPiA+Pj4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8
Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiA+ID4gPiA+Pj4gLS0tCj4gPiA+ID4gPiA+Pj4g
ICAgYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5jIHwgMiArLQo+ID4gPiA+ID4gPj4+ICAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+ID4gPj4+Cj4g
PiA+ID4gPiA+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2FjcGkuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL2FjcGkuYwo+ID4gPiA+ID4gPj4+IGluZGV4IDZlMGQzMzNmNTdlNS4uMzE3
N2M5YWY4NzY0IDEwMDY0NAo+ID4gPiA+ID4gPj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2Fj
cGkuYwo+ID4gPiA+ID4gPj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2FjcGkuYwo+ID4gPiA+
ID4gPj4+IEBAIC0yMTAsNyArMjEwLDcgQEAgdm9pZCBfX2luaXQgX19pb21lbSAqX19hY3BpX21h
cF90YWJsZSh1bnNpZ25lZCBsb25nIHBoeXMsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiA+ID4gPiA+
ID4+PiAgICAgICAgaWYgKCFzaXplKQo+ID4gPiA+ID4gPj4+ICAgICAgICAgICAgICAgIHJldHVy
biBOVUxMOwo+ID4gPiA+ID4gPj4+Cj4gPiA+ID4gPiA+Pj4gLSAgICAgcmV0dXJuIGVhcmx5X2lv
cmVtYXAocGh5cywgc2l6ZSk7Cj4gPiA+ID4gPiA+Pj4gKyAgICAgcmV0dXJuIGVhcmx5X21lbXJl
bWFwKHBoeXMsIHNpemUpOwo+ID4gPiA+ID4gPj4+ICAgIH0KPiA+ID4gPiA+ID4+Pgo+ID4gPiA+
ID4gPj4+ICAgIHZvaWQgX19pbml0IF9fYWNwaV91bm1hcF90YWJsZSh2b2lkIF9faW9tZW0gKm1h
cCwgdW5zaWduZWQgbG9uZyBzaXplKQo+ID4gPiA+ID4gPj4KPiA+ID4gPiA+ID4+IEl0IG1ha2Vz
IHNlbnNlIHRvIG1lIHNpbmNlIHdpdGggdGhpcywgd2UgZG9uJ3QgaGF2ZSB0byBjYXJlIGFib3V0
IGhvdwo+ID4gPiA+ID4gPj4gdGhlIGZpcm13YXJlIG1hcHBlZCB0aGUgdGFibGUuIEFuZCBpdCBt
aW1pY3MgYWxsIG90aGVyIGFyY2hpdGVjdHVyZXMKPiA+ID4gPiA+ID4+IChhcm02NCwgbG9vbmdh
cmNoIGFuZCB4ODYpLgo+ID4gPiA+ID4gPj4KPiA+ID4gPiA+ID4+IEhlcmUgaXMgdGhlIGNvcnJl
c3BvbmRpbmcgZml4ZXMgdGFnOgo+ID4gPiA+ID4gPj4KPiA+ID4gPiA+ID4+IEZpeGVzOiAzYjQy
NmQ0YjViMTQgKCJSSVNDLVY6IEFDUEkgOiBGaXggZm9yIHVzYWdlIG9mIHBvaW50ZXJzIGluCj4g
PiA+ID4gPiA+PiBkaWZmZXJlbnQgYWRkcmVzcyBzcGFjZSIpCj4gPiA+ID4gPiA+Pgo+ID4gPiA+
ID4gPj4gV2l0aCB0aGUgY29ycmVzcG9uZGluZyBmaXggaW4gX19hY3BpX3VubWFwX3RhYmxlKCkg
YXMgcG9pbnRlZCBieSBTdW5pbCwKPiA+ID4gPiA+ID4+IHlvdSBjYW4gYWRkOgo+ID4gPiA+ID4g
Pj4KPiA+ID4gPiA+ID4+IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUBy
aXZvc2luYy5jb20+Cj4gPiA+ID4gPiA+Pgo+ID4gPiA+ID4gPj4gQW5kIHJlZ2FyZGluZyB0aGUg
c3BhcnNlIGVycm9yLCBJIGRvbid0IHNlZSBhbnkgb3RoZXIgYXJjaGl0ZWN0dXJlCj4gPiA+ID4g
PiA+PiBjYXN0aW5nIHRvIF9faW9tZW0sIHNvIG1heWJlIHRoYXQncyBub3QgbmVjZXNzYXJ5IGFu
eW1vcmU/Cj4gPiA+ID4gPiA+IE9LLiBJIHdpbGwgbWFrZSB0aGUgY2hhbmdlcyBpbiB2Mi4gUmVn
YXJkaW5nIHRoZSBzcGFyc2UgZXJyb3IsIEkgd2lsbAo+ID4gPiA+ID4gPiB1c2UgYW5vdGhlciBw
YXRjaCBzcGVjaWZpY2FsbHkgdG8gc29sdmUgaXQuIElzIHRoYXQgb2theT8KPiA+ID4gPiA+Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gSWYgdGhlIHNlY29uZCBwYXRjaCBvbmx5IGNvbnNpc3RzIGluIGNh
c3RpbmcsIEkgd291bGQgbm90IHVzZSBhbm90aGVyCj4gPiA+ID4gPiBwYXRjaCBzaW5jZSB0aGUg
cGF0Y2ggMiB3b3VsZCBmaXggc29tZXRoaW5nIGludHJvZHVjZWQgaW4gcGF0Y2ggMS4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBCdXQgaWYgcGF0Y2ggMiBpcyBtb3JlIGNvbXBsaWNhdGVkLCAgaXQgbWF5
IG1ha2Ugc2Vuc2UgdG8gZG8gYXMgeW91Cj4gPiA+ID4gPiBzdWdnZXN0LCB0aGUgZ29hbCBpcyB0
byBtZXJnZSBwYXRjaCAxIGFzYXAuCj4gPiA+ID4KPiA+ID4gPiBSZWdhcmRpbmcgcGF0Y2ggMiwg
SSBleGVjdXRlZCAibWFrZSAmIG1ha2UgaW5zdGFsbCIgZm9yIHNwYXJzZSBvZiB0aGUKPiA+ID4g
PiByaXNjdiBhcmNoLiBJICJnaXQgY2xvbmVkIiBmcm9tCj4gPiA+ID4gaHR0cHM6Ly9naXRodWIu
Y29tL0NvbmNodU9EL3NwYXJzZS5naXQuCj4gPiA+ID4gVGhlbiB3aGVuIGNvbXBpbGluZyB0aGUg
a2VybmVsLCB0aGUgZm9sbG93aW5nIGVycm9yIHdhcyByZXBvcnRlZDoKPiA+ID4gPgo+ID4gPiA+
IGNkIC9kYXRhMDAvY3loL2xpbnV4LW5leHQvCj4gPiA+ID4gbWFrZSBkZWZjb25maWcKPiA+ID4g
PiBjcCAuY29uZmlnIGJ1aWxkLXJpc2N2NjQvCj4gPiA+ID4KPiA+ID4gPiBtYWtlIE89YnVpbGQt
cmlzY3Y2NC8gQz0xIFc9MSBhcmNoL3Jpc2N2L2tlcm5lbC8gZHJpdmVycy9hY3BpLwo+ID4gPiA+
IGRyaXZlcnMvbWFpbGJveC8gLWoKPiA+ID4gPiBtYWtlWzFdOiBFbnRlcmluZyBkaXJlY3Rvcnkg
Jy9kYXRhMDAvY3loL2xpbnV4LW5leHQvYnVpbGQtcmlzY3Y2NCcKPiA+ID4gPiAgIEdFTiAgICAg
TWFrZWZpbGUKPiA+ID4gPiAgIENDICAgICAgc2NyaXB0cy9tb2QvZW1wdHkubwo+ID4gPiA+ICAg
Q0MgICAgICBzY3JpcHRzL21vZC9kZXZpY2V0YWJsZS1vZmZzZXRzLnMKPiA+ID4gPiAgIENIRUNL
ICAgLi4vc2NyaXB0cy9tb2QvZW1wdHkuYwo+ID4gPiA+IGludmFsaWQgYXJndW1lbnQgdG8gJy1t
YXJjaCc6ICdfemljc3JfemlmZW5jZWknCj4gPiA+ID4KPiA+ID4gPiBtYWtlWzNdOiAqKiogWy4u
L3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MjI5OiBzY3JpcHRzL21vZC9lbXB0eS5vXSBFcnJvciAx
Cj4gPiA+ID4gbWFrZVszXTogKioqIERlbGV0aW5nIGZpbGUgJ3NjcmlwdHMvbW9kL2VtcHR5Lm8n
Cj4gPiA+ID4gbWFrZVszXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KPiA+
ID4gPiBtYWtlWzJdOiAqKiogWy9kYXRhMDAvY3loL2xpbnV4LW5leHQvTWFrZWZpbGU6MTIxNTog
cHJlcGFyZTBdIEVycm9yIDIKPiA+ID4gPiBtYWtlWzFdOiAqKiogWy9kYXRhMDAvY3loL2xpbnV4
LW5leHQvTWFrZWZpbGU6MjI0OiBfX3N1Yi1tYWtlXSBFcnJvciAyCj4gPiA+ID4KPiA+ID4gPiBE
byB5b3Uga25vdyB0aGUgc29sdXRpb24/Cj4gPiA+Cj4gPiA+IEluIGNhc2UgeW91IGRpZCBub3Qg
ZmluZCB0aGUgc29sdXRpb24geWV0LCBJIHdvdWxkIHNheSB0aGF0IHlvdXIKPiA+ID4gdG9vbGNo
YWluIGlzIHRvbyBvbGQuCj4gPiA+Cj4gPiA+IExldCBtZSBrbm93IGlmIEkgY2FuIGhlbHAsCj4g
PiBJdCBtYXkgbm90IGJlIGEgcHJvYmxlbSBvZiBhbiBvbGQgY29tcGlsZXIuIFRoZSB2ZXJzaW9u
IG9mIHRoZQo+ID4gY29tcGlsZXIgSSBhbSB1c2luZyBpcyAxMy4yLgo+ID4gSXQgaXMgYSBwcm9i
bGVtIHdpdGggc3BhcnNlLiBXaGVuIHJ1bm5pbmcgInNwYXJzZSAtLWFyY2g9cmlzY3YKPiA+IC1t
YXJjaD1ydjY0aW1hY196aWNzcl96aWZlbmNlaSBzY3JpcHRzL21vZC9lbXB0eS5jIiwgdGhlcmUg
aXMgYW4KPiA+IGludmFsaWQgYXJndW1lbnQgZm9yICctbWFyY2gnOiAnX3ppY3NyX3ppZmVuY2Vp
Jy4KPiA+Cj4gSGkgWXVuaHVpLAo+Cj4gSSB0aGluayB5b3UgbmVlZCBsYXRlc3Qgc3BhcnNlLiBJ
IHJlbWVtYmVyIGJ1aWxkaW5nIHNwYXJzZSBmcm9tIGxhdGVzdAo+IHNvdXJjZXMgdG8gYXZvaWQg
dGhpcyBlcnJvci4KPgo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjQuMTEvZGV2
LXRvb2xzL3NwYXJzZS5odG1sCj4KPiBUaGFua3MsCj4gU3VuaWwKClRoYW5rIHlvdSBmb3IgeW91
ciBzdWdnZXN0aW9ucyBvbiBzcGFyc2UuIFRoZSBwYXRjaCBoYXMgYmVlbiBzZW50IHRvCnRoZSBj
b21tdW5pdHkuIFBsZWFzZSByZWZlciB0bzoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
YXJtLWtlcm5lbC8yMDI0MTAzMTExMjAzMC43MjY0Ny0xLWN1aXl1bmh1aUBieXRlZGFuY2UuY29t
L1QvLgoKClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
