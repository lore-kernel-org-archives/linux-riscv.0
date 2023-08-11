Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9100DC001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 01:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0DD6kNHoQ6CubN0jdsry1+KIlUU2PHwk3RdtqEMoO8I=; b=hvbZnbx8mR+7Hg
	mS5/qw+zeqFDKh9y26r73kK9tsK+Rj9NeBqlcl9kZ+5hDAYv5nsXzu+3NvAxT83EGJHC+a7OSQEM0
	vIKbQ5X05EgJlXx4DcrVxE98j1btLaT6lhEAlGP1rpRSgzHhfD7O2xx/D6yNAEttpzbGiwwFO91WJ
	f6JoSUnU5E/qhEb6Ksg2x0Kuy+iy2qSFIk38fQDqMAfRxL6T3yZliki20lT/BFPRcdyxnT31U5wT+
	ltPbDxomz+MGCnCNss3nccCOkPQI3ODn1niukZb4k8sCzMPi0YNajRs9NFCYewbO9zW8J0jZQK3Dj
	KjqN/VWOuwk9DJD9zRFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUH8y-0095xW-1A;
	Fri, 11 Aug 2023 01:40:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUH8v-0095wZ-1v
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 01:40:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3F396144D
	for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 01:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64377C433C8
	for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 01:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691718043;
	bh=NJ6p09CbSTr2E2bfl8mxk76nHLwPDnBOE4E31aqoHXc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ukFP0lPswQW0z8jubmdg1L91dnwv+lqMVFrJFlRmabf/tqe2ZBS+pLaf+7B7okCq7
	 pLwvSbAmZWAlGO2kO8z8mwmRPq/DSnbc0EAvmbAwSMH51EgN5kb1tfvb2yuqRbZUOG
	 /UxbwuUYqTuHa4gbx/hGYih1MsjDrGgLqyHC3eBsfiv7b3b14438RqKaEFwOhdBnq3
	 Fdk3dFTPxHINvEoHRV/X12odiNOe0Q63KzqnbcT0C7bhl26agNYwzIDlThBSZbqO2l
	 ZJyTsFwfXxKGnGoDm74tr86kho75GePW262Gn1lJgghk8VuB0O6sPLRpjTQeznP4QG
	 rjkThKeE/9C8g==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-523225dd110so1954286a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 18:40:43 -0700 (PDT)
X-Gm-Message-State: AOJu0YxLaChlZQbMVfzho5qXKGSezFpyYS3Rsoq6A4froF3Ue2WUOsQo
	Uyn0TorScLPFmGen2/+B2ZTC/5pya3pWmcobiEo=
X-Google-Smtp-Source: AGHT+IFuvY7MHaG2fY2pyFFFYnFbZrXUs4GynmjmNXuvGAjsAOK4IFX7ZMngfrFNPSpDlE1S3D5gI7m4vwsCowSTAo4=
X-Received: by 2002:aa7:c30f:0:b0:523:6c47:56f8 with SMTP id
 l15-20020aa7c30f000000b005236c4756f8mr590466edq.18.1691718041693; Thu, 10 Aug
 2023 18:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <98f523e515b2adc2aa7bb8d133353bad74e30897.camel@redhat.com> <mhng-92f37526-d36c-48c0-8fbd-7676df1b6086@palmer-ri-x1c9>
In-Reply-To: <mhng-92f37526-d36c-48c0-8fbd-7676df1b6086@palmer-ri-x1c9>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 11 Aug 2023 09:40:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQgv5xsfSfvV7KePAXFnFQOMq4GXOp40kQgM54L6hVD7w@mail.gmail.com>
Message-ID: <CAJF2gTQgv5xsfSfvV7KePAXFnFQOMq4GXOp40kQgM54L6hVD7w@mail.gmail.com>
Subject: Re: [RFC PATCH v5 5/5] riscv/cmpxchg: Implement xchg for variables of
 size 1 and 2
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: leobras@redhat.com, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, 
	peterz@infradead.org, boqun.feng@gmail.com, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	parri.andrea@gmail.com, andrzej.hajda@intel.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_184045_721959_7A9C6649 
X-CRM114-Status: GOOD (  42.12  )
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

T24gRnJpLCBBdWcgMTEsIDIwMjMgYXQgMTI6MjPigK9BTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIDEwIEF1ZyAyMDIzIDA5OjA0OjA0IFBE
VCAoLTA3MDApLCBsZW9icmFzQHJlZGhhdC5jb20gd3JvdGU6Cj4gPiBPbiBUaHUsIDIwMjMtMDgt
MTAgYXQgMDg6NTEgKzAyMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPj4gT24gVGh1LCBBdWcg
MTAsIDIwMjMsIGF0IDA2OjAzLCBMZW9uYXJkbyBCcmFzIHdyb3RlOgo+ID4+ID4geGNoZyBmb3Ig
dmFyaWFibGVzIG9mIHNpemUgMS1ieXRlIGFuZCAyLWJ5dGVzIGlzIG5vdCB5ZXQgYXZhaWxhYmxl
IGZvcgo+ID4+ID4gcmlzY3YsIGV2ZW4gdGhvdWdoIGl0cyBwcmVzZW50IGluIG90aGVyIGFyY2hp
dGVjdHVyZXMgc3VjaCBhcyBhcm02NCBhbmQKPiA+PiA+IHg4Ni4gVGhpcyBjb3VsZCBsZWFkIHRv
IG5vdCBiZWluZyBhYmxlIHRvIGltcGxlbWVudCBzb21lIGxvY2tpbmcgbWVjaGFuaXNtcwo+ID4+
ID4gb3IgcmVxdWlyaW5nIHNvbWUgcmV3b3JrIHRvIG1ha2UgaXQgd29yayBwcm9wZXJseS4KPiA+
PiA+Cj4gPj4gPiBJbXBsZW1lbnQgMS1ieXRlIGFuZCAyLWJ5dGVzIHhjaGcgaW4gb3JkZXIgdG8g
YWNoaWV2ZSBwYXJpdHkgd2l0aCBvdGhlcgo+ID4+ID4gYXJjaGl0ZWN0dXJlcy4KPiA+PiA+Cj4g
Pj4gPiBTaWduZWQtb2ZmLWJ5OiBMZW9uYXJkbyBCcmFzIDxsZW9icmFzQHJlZGhhdC5jb20+Cj4g
Pj4KPiA+Cj4gPiBIZWxsbyBBcm5kIEJlcmdtYW5uLCB0aGFua3MgZm9yIHJldmlld2luZyEKPiA+
Cj4gPj4gUGFyaXR5IHdpdGggb3RoZXIgYXJjaGl0ZWN0dXJlcyBieSBpdHNlbGYgaXMgbm90IGEg
cmVhc29uIHRvIGRvIHRoaXMsCj4gPj4gaW4gcGFydGljdWxhciB0aGUgb3RoZXIgYXJjaGl0ZWN0
dXJlcyB5b3UgbGlzdGVkIGhhdmUgdGhlIGluc3RydWN0aW9ucwo+ID4+IGluIGhhcmR3YXJlIHdo
aWxlIHJpc2N2IGRvZXMgbm90Lgo+ID4KPiA+IFN1cmUsIEkgdW5kZXJzdGFuZCBSSVNDLVYgZG9u
J3QgaGF2ZSBuYXRpdmUgc3VwcG9ydCBmb3IgeGNoZyBvbiB2YXJpYWJsZXMgb2YKPiA+IHNpemUg
PCA0Qi4gTXkgYXJndW1lbnQgaXMgdGhhdCBpdCdzIG5pY2UgdG8gaGF2ZSBldmVuIGFuIGVtdWxh
dGVkIHZlcnNpb24gZm9yCj4gPiB0aGlzIGluIGNhc2UgYW55IGZ1dHVyZSBtZWNoYW5pc20gd2Fu
dHMgdG8gdXNlIGl0Lgo+ID4KPiA+IE5vdCBoYXZpbmcgaXQgbWF5IG1lYW4gd2Ugd29uJ3QgYmUg
YWJsZSB0byBlbmFibGUgZ2l2ZW4gbWVjaGFuaXNtIGluIFJJU0MtVi4KPgo+IElJVUMgdGhlIGFz
ayBpcyB0byBoYXZlIGEgdXNlciB3aXRoaW4gdGhlIGtlcm5lbCBmb3IgdGhlc2UgZnVuY3Rpb25z
Lgo+IFRoYXQncyB0aGUgZ2VuZXJhbCB0aGluZyB0byBkbywgYW5kIGxhc3QgdGltZSB0aGlzIGNh
bWUgdXAgdGhlcmUgd2FzIG5vCj4gaW4ta2VybmVsIHVzZSBvZiBpdCAtLSB0aGUgcXNwaW5sb2Nr
IHN0dWZmIHdvdWxkLCBidXQgd2UgaGF2ZW4ndCBlbmFibGVkCj4gaXQgeWV0IGJlY2F1c2Ugd2Un
cmUgd29ycmllZCBhYm91dCB0aGUgcGVyZm9ybWFuY2UvZmFpcm5lc3Mgc3R1ZmYgdGhhdAo+IG90
aGVyIHBvcnRzIGhhdmUgc2VlbiBhbmQgbm9ib2R5J3MgZ290IGNvbmNyZXRlIGJlbmNobWFya3Mg
eWV0ICh0aG91Z2gKPiB0aGVyZSdzIGFub3RoZXIgcGF0Y2ggc2V0IG91dCB0aGF0IEkgaGF2ZW4n
dCBoYWQgdGltZSB0byBsb29rIHRocm91Z2gsCj4gc28gdGhhdCBtYXkgaGF2ZSBjaGFuZ2VkKS4K
Q29ub3IgZG9lc24ndCBhZ3JlZSB3aXRoIHVzaW5nIGFuIGFsdGVybmF0aXZlIGFzIGEgZGV0b3Vy
IG1lY2hhbmlzbQpiZXR3ZWVuIHFzcGlubG9jayAmIHRpY2tldCBsb2NrLiBTbyBJJ20gcHJlcGFy
aW5nIFYxMSB3aXRoIHN0YXRpY19rZXkKKGp1bXBfbGFiZWwpIHN0eWxlLiBOZXh0IHZlcnNpb24s
IEkgd291bGQgc2VwYXJhdGUgcGFyYXZpcnRfcXNwaW5sb2NrCiYgQ05BX3FzcGlubG9jayBmcm9t
IFYxMC4gVGhhdCB3b3VsZCBtYWtlIGl0IGVhc3kgdG8gcmV2aWV3IHRoZQpxc3BpbmxvY2sgcGF0
Y2ggc2VyaWVzLiBZb3UgY2FuIHJldmlldyB0aGUgbmV4dCB2ZXJzaW9uIFYxMS4gTm93IEknbQpk
ZWJ1Z2dpbmcgYSBzdGF0aWNfa2V5IGluaXQgcHJvYmxlbSB3aGVuIGxvYWRfbW9kdWxlcywgd2hp
Y2ggaXMKdHJpZ2dlcmVkIGJ5IG91ciBjb21ib19xc3BpbmxvY2suCgpUaGUgcXNwaW5sb2NrIGlz
IGJlaW5nIHRlc3RlZCBvbiB0aGUgcmlzY3YgcGxhdGZvcm0gWzFdIHdpdGggMTI4IGNvcmVzCndp
dGggOCBOVU1BIG5vZGVzLCBuZXh0LCBJIHdvdWxkIHVwZGF0ZSB0aGUgY29tcGFyaXNvbiByZXN1
bHRzIG9mCnFzcGlubG9jayAmIHRpY2tldCBsb2NrLgoKWzFdOiBodHRwczovL3d3dy5zb3Bob24u
YWkvCgo+Cj4gU28gaWYgc29tZXRoaW5nIHVzZXMgdGhlc2UgSSdtIGhhcHB5IHRvIGdvIGxvb2sg
Y2xvc2VyLgo+Cj4gPj4gRW11bGF0aW5nIHRoZSBzbWFsbCB4Y2hnKCkgdGhyb3VnaCBjbXB4Y2hn
KCkgaXMgcGFydGljdWxhcmx5IHRyaWNreQo+ID4+IHNpbmNlIGl0J3MgZWFzeSB0byBydW4gaW50
byBhIGNhc2Ugd2hlcmUgdGhpcyBkb2VzIG5vdCBndWFyYW50ZWUKPiA+PiBmb3J3YXJkIHByb2dy
ZXNzLgo+ID4+Cj4gPgo+ID4gRGlkbid0IGdldCB0aGlzIHBhcnQ6Cj4gPiBCeSAiZW11bGF0aW5n
IHNtYWxsIHhjaGcoKSB0aHJvdWdoIGNtcHhjaGcoKSIsIGRpZCB5b3UgbWVhbiBsaWtlIGVtdWxh
dGluZyBhbgo+ID4geGNoZyAodXN1YWxseSAxIGluc3RydWN0aW9uKSB3aXRoIGxyICYgc2MgKHNh
bWUgdXNlZCBpbiBjbXB4Y2hnKSA/Cj4gPgo+ID4gSWYgc28sIHllYWgsIGl0J3MgYSBmYWlyIHBv
aW50OiBpbiBzb21lIGV4dHJlbWUgY2FzZSB3ZSBjb3VsZCBoYXZlIG11bHRpcGxlCj4gPiB0aHJl
YWRzIGFjY2Vzc2luZyBnaXZlbiBjYWNoZWxpbmUgYW5kIGhhdmUgc2MgYWx3YXlzIGZhaWxpbmcu
IE9uIHRoZSBvdGhlciBoYW5kLAo+ID4gdGhlcmUgYXJlIDIgYXJndW1lbnRzIG9uIHRoYXQ6Cj4g
Pgo+ID4gMSAtIE90aGVyIGFyY2hpdGVjdHVyZXMsIChzdWNoIGFzIHBvd2VycGMsIGFybSBhbmQg
YXJtNjQgd2l0aG91dCBMU0UgYXRvbWljcykKPiA+IGFsc28gc2VlbSB0byByZWx5IGluIHRoaXMg
bWVjaGFuaXNtIGZvciBldmVyeSB4Y2hnIHNpemUuIEFub3RoZXIgYXJjaHMgbGlrZSBjc2t5Cj4g
PiBhbmQgbG9vbmdhcmNoIHVzZSBhc20gdGhhdCBsb29rIGxpa2UgbWluZSB0byBoYW5kbGUgc2l6
ZSA8IDRCIHhjaGcuCj4gPgo+ID4KPiA+PiAgVGhpcyBpcyBhbHNvIHNvbWV0aGluZyB0aGF0IGFs
bW9zdCBubyBhcmNoaXRlY3R1cmUKPiA+PiBzcGVjaWZpYyBjb2RlIHJlbGllcyBvbiAoZ2VuZXJp
YyBxc3BpbmxvY2sgYmVpbmcgYSBub3RhYmxlIGV4Y2VwdGlvbikuCj4gPj4KPiA+Cj4gPiAyIC0g
QXMgeW91IG1lbnRpb25lZCwgdGhlcmUgc2hvdWxkIGJlIHZlcnkgbGl0dGxlIGNvZGUgdGhhdCB3
aWxsIGFjdHVhbGx5IG1ha2UKPiA+IHVzZSBvZiB4Y2hnIGZvciB2YXJzIDwgNEIsIHNvIGl0IHNo
b3VsZCBiZSBzYWZlIHRvIGFzc3VtZSBpdHMgZmluZSB0byBub3QKPiA+IGd1YXJhbnRlZSBmb3J3
YXJkIHByb2dyZXNzIGZvciB0aG9zZSByYXJlIHVzYWdlcyAobGlrZSBzb21lIG9mIGFib3ZlIG1l
bnRpb25lZAo+ID4gYXJjaHMpLgo+ID4KPiA+PiBJIHdvdWxkIHJlY29tbWVuZCBqdXN0IGRyb3Bw
aW5nIHRoaXMgcGF0Y2ggZnJvbSB0aGUgc2VyaWVzLCBhdCBsZWFzdAo+ID4+IHVudGlsIHRoZXJl
IGlzIGEgbmVlZCBmb3IgaXQuCj4gPgo+ID4gV2hpbGUgSSBhZ3JlZSB0aGlzIGlzIGEgdmFsaWQg
cG9pbnQsIEkgYmVsaWV2ZSBpdHMgbW9yZSBpbnRlcmVzdGluZyB0byBoYXZlIGl0Cj4gPiBpbXBs
ZW1lbnRlZCBpZiBhbnkgZnV0dXJlIG1lY2hhbmlzbSB3YW50cyB0byBtYWtlIHVzZSBvZiB0aGlz
Lgo+ID4KPiA+Cj4gPiBUaGFua3MhCj4gPiBMZW8KCgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
