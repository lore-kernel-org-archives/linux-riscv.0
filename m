Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE56EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 23:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=egoV0UznsVGKk9GBWt/JGlKUqe1W1XiSLPrjfTYPIwQ=; b=oR+Nb+3uttKZgS
	r73n/6CJJFw8HgtzrjwQa10/cIsW0POew8szs2yn1zzGHzaWAmtoctqIa7VXwPCDnwmqGGaWCgnZI
	u3LaznHpibCHqxnANMwkjgztL9a2YR//IIu5UzVuhLnbAt4cuQjSXMFxtUxu0MgbCp6lXQx+Lph10
	g4OSs56zk+OaKLTM7RAIFjYRn2W63hkr6HWxfXjdg5bM+Is8Alpkdsfk34+CanoiMShFvwM4kbHja
	vN1GQ3q/LhpMvpRpZw98QiHafVVYaX3KWGLNj1mQj8/zoT11NVm+o1EFqRL0SV4uV/vvXF40C+B/T
	0D36C5STcp9kuX1P/Hpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN01u-00FOxq-04;
	Fri, 21 Jul 2023 23:59:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN01q-00FOwv-1z
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 23:59:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA49261DB5
	for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 23:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C92C433C7
	for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 23:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689983961;
	bh=nL7Uxf9LHyedJ5ptAy4FvNEgMCaUaf2n0tlV63dMa9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RvnXTCVRk34PGdj+bQvssXz4LeOTC+DbWn8hWfk6WgWbWND9AtlpCfjopnv+euggV
	 vE8kYSRXU833jaRO2ZlxJl84gWNnom23X2yWT8z7pPD2isr9/cgLT/FiI0YyfHBR2p
	 NswU/R7uhIvd1bN1IOnsn1lR2/ymplpwRJORCDWP6s5EstIQ8QATgP5FiwDZC+bTXa
	 zjfC+yB1or+WAbbYrjtIFALfbB7s+sP2b60SaxjVSy9cWTNvPwqaEBLleB3iMNoUmB
	 fusZPNJxS0iDH1lHEf8HD+vhR1+3KbVEM0FhBiVGah/Ua0ghF+1SlR1GhDUy3RBfXJ
	 ViSBGV542tikg==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5217bb5ae05so3084583a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 16:59:21 -0700 (PDT)
X-Gm-Message-State: ABy/qLY1HQAFr9o6uNQ22F2MWSe3JRZSujH03Ho0RWmfQQj0hLAoG8KI
	6cB8YbnvgM27DiJJC2S++9N2GeDt+vaJg2Gj0l4=
X-Google-Smtp-Source: APBJJlHBERULY9uAI2Af2Xh5LWL+8JllED/iDuB/6zed6hakhaHaL7B3C2jZUryHRlWbwy9LE0TlZntWen33Js4NvTg=
X-Received: by 2002:a50:fc16:0:b0:51e:5cab:feb9 with SMTP id
 i22-20020a50fc16000000b0051e5cabfeb9mr2715190edr.33.1689983959307; Fri, 21
 Jul 2023 16:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230721145121.1854104-1-guoren@kernel.org> <5e5be2d4-c563-6beb-b5f5-df47edeebc83@ghiti.fr>
 <CAJF2gTQMAVUtC6_ftEwp=EeYR_O7yzfGYmxwrqcO6+hn2J32bA@mail.gmail.com> <87bfcd33-9741-4d6c-8b7a-1d1ee2dce61b@ghiti.fr>
In-Reply-To: <87bfcd33-9741-4d6c-8b7a-1d1ee2dce61b@ghiti.fr>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Jul 2023 19:59:07 -0400
X-Gmail-Original-Message-ID: <CAJF2gTT8JV5f4Fm1F-XgfAhNWNXJquVW8-uCK-b4Qy0xztrGLA@mail.gmail.com>
Message-ID: <CAJF2gTT8JV5f4Fm1F-XgfAhNWNXJquVW8-uCK-b4Qy0xztrGLA@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: Fixup spurious fault of kernel vaddr
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: palmer@rivosinc.com, paul.walmsley@sifive.com, falcon@tinylab.org, 
	bjorn@kernel.org, conor.dooley@microchip.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_165922_743695_B480E83B 
X-CRM114-Status: GOOD (  34.26  )
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

T24gRnJpLCBKdWwgMjEsIDIwMjMgYXQgNDowMeKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBn
aGl0aS5mcj4gd3JvdGU6Cj4KPgo+IE9uIDIxLzA3LzIwMjMgMTg6MDgsIEd1byBSZW4gd3JvdGU6
Cj4gPiBPbiBGcmksIEp1bCAyMSwgMjAyMyBhdCAxMToxOeKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8
YWxleEBnaGl0aS5mcj4gd3JvdGU6Cj4gPj4KPiA+PiBPbiAyMS8wNy8yMDIzIDE2OjUxLCBndW9y
ZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+Pj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFs
aWJhYmEuY29tPgo+ID4+Pgo+ID4+PiBSSVNDLVYgc3BlY2lmaWNhdGlvbiBwZXJtaXRzIHRoZSBj
YWNoaW5nIG9mIFBURXMgd2hvc2UgViAoVmFsaWQpCj4gPj4+IGJpdCBpcyBjbGVhci4gT3BlcmF0
aW5nIHN5c3RlbXMgbXVzdCBiZSB3cml0dGVuIHRvIGNvcGUgd2l0aCB0aGlzCj4gPj4+IHBvc3Np
YmlsaXR5LCBidXQgaW1wbGVtZW50ZXJzIGFyZSByZW1pbmRlZCB0aGF0IGVhZ2VybHkgY2FjaGlu
Zwo+ID4+PiBpbnZhbGlkIFBURXMgd2lsbCByZWR1Y2UgcGVyZm9ybWFuY2UgYnkgY2F1c2luZyBh
ZGRpdGlvbmFsIHBhZ2UKPiA+Pj4gZmF1bHRzLgo+ID4+Pgo+ID4+PiBTbyB3ZSBtdXN0IGtlZXAg
dm1hbGxvY19mYXVsdCBmb3IgdGhlIHNwdXJpb3VzIHBhZ2UgZmF1bHRzIG9mIGtlcm5lbAo+ID4+
PiB2aXJ0dWFsIGFkZHJlc3MgZnJvbSBhbiBPb08gbWFjaGluZS4KPiA+Pj4KPiA+Pj4gU2lnbmVk
LW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4+PiBTaWduZWQt
b2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+Pj4gLS0tCj4gPj4+ICAgIGFy
Y2gvcmlzY3YvbW0vZmF1bHQuYyB8IDMgKy0tCj4gPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvbW0vZmF1bHQuYyBiL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+ID4+PiBpbmRleCA4NTE2
NWZlNDM4ZDguLmY2NjJjOWVhZTdkNCAxMDA2NDQKPiA+Pj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9m
YXVsdC5jCj4gPj4+ICsrKyBiL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+ID4+PiBAQCAtMjU4LDgg
KzI1OCw3IEBAIHZvaWQgaGFuZGxlX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4g
Pj4+ICAgICAgICAgKiBvbmx5IGNvcHkgdGhlIGluZm9ybWF0aW9uIGZyb20gdGhlIG1hc3RlciBw
YWdlIHRhYmxlLAo+ID4+PiAgICAgICAgICogbm90aGluZyBtb3JlLgo+ID4+PiAgICAgICAgICov
Cj4gPj4+IC0gICAgIGlmICgoIUlTX0VOQUJMRUQoQ09ORklHX01NVSkgfHwgIUlTX0VOQUJMRUQo
Q09ORklHXzY0QklUKSkgJiYKPiA+Pj4gLSAgICAgICAgIHVubGlrZWx5KGFkZHIgPj0gVk1BTExP
Q19TVEFSVCAmJiBhZGRyIDwgVk1BTExPQ19FTkQpKSB7Cj4gPj4+ICsgICAgIGlmICh1bmxpa2Vs
eShhZGRyID49IFRBU0tfU0laRSkpIHsKPiA+Pj4gICAgICAgICAgICAgICAgdm1hbGxvY19mYXVs
dChyZWdzLCBjb2RlLCBhZGRyKTsKPiA+Pj4gICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4+PiAg
ICAgICAgfQo+ID4+Cj4gPj4gQ2FuIHlvdSBzaGFyZSB3aGF0IHlvdSBhcmUgdHJ5aW5nIHRvIGZp
eCBoZXJlPwo+ID4gV2UgbWV0IGEgc3B1cmlvdXMgcGFnZSBmYXVsdCBwYW5pYyBvbiBhbiBPb08g
bWFjaGluZS4KPiA+Cj4gPiAxLiBUaGUgcHJvY2Vzc29yIHNwZWN1bGF0aXZlIGV4ZWN1dGlvbiBi
cmluZ3MgdGhlIFY9MCBlbnRyaWVzIGludG8gdGhlCj4gPiBUTEIgaW4gdGhlIGtlcm5lbCB2aXJ0
dWFsIGFkZHJlc3MuCj4gPiAyLiBMaW51eCBrZXJuZWwgaW5zdGFsbHMgdGhlIGtlcm5lbCB2aXJ0
dWFsIGFkZHJlc3Mgd2l0aCB0aGUgcGFnZSwgYW5kIFY9MQo+ID4gMy4gV2hlbiBrZXJuZWwgY29k
ZSBhY2Nlc3MgdGhlIGtlcm5lbCB2aXJ0dWFsIGFkZHJlc3MsIGl0IHdvdWxkIHJhaXNlCj4gPiBh
IHBhZ2UgZmF1bHQgYXMgdGhlIFY9MCBlbnRyeSBpbiB0aGUgdGxiLgo+ID4gNC4gTm8gdm1hbGxv
Y19mYXVsdCwgdGhlbiBwYW5pYy4KPiA+Cj4gPj4gSSBoYXZlIGEgZml4ICh0aGF0J3MgY3VycmVu
dGx5IHJ1bm5pbmcgb3VyIENJKSBmb3IgY29tbWl0IDdkMzMzMmJlMDExZQo+ID4+ICgicmlzY3Y6
IG1tOiBQcmUtYWxsb2NhdGUgUEdEIGVudHJpZXMgZm9yIHZtYWxsb2MvbW9kdWxlcyBhcmVhIikg
dGhhdAo+ID4+IGltcGxlbWVudHMgZmx1c2hfY2FjaGVfdm1hcCgpIHNpbmNlIHdlIGxvc3QgdGhl
IHZtYWxsb2NfZmF1bHQuCj4gPiBDb3VsZCB5b3Ugc2hhcmUgdGhhdCBwYXRjaD8KPgo+Cj4gSGVy
ZSB3ZSBnbzoKPgo+Cj4gQXV0aG9yOiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2lu
Yy5jb20+Cj4gRGF0ZTogICBGcmkgSnVsIDIxIDA4OjQzOjQ0IDIwMjMgKzAwMDAKPgo+ICAgICAg
cmlzY3Y6IEltcGxlbWVudCBmbHVzaF9jYWNoZV92bWFwKCkKPgo+ICAgICAgVGhlIFJJU0MtViBr
ZXJuZWwgbmVlZHMgYSBzZmVuY2Uudm1hIGFmdGVyIGEgcGFnZSB0YWJsZQo+IG1vZGlmaWNhdGlv
bjogd2UKPiAgICAgIHVzZWQgdG8gcmVseSBvbiB0aGUgdm1hbGxvYyBmYXVsdCBoYW5kbGluZyB0
byBlbWl0IGFuIHNmZW5jZS52bWEsIGJ1dAo+ICAgICAgY29tbWl0IDdkMzMzMmJlMDExZSAoInJp
c2N2OiBtbTogUHJlLWFsbG9jYXRlIFBHRCBlbnRyaWVzIGZvcgo+ICAgICAgdm1hbGxvYy9tb2R1
bGVzIGFyZWEiKSBnb3QgcmlkIG9mIHRoaXMgcGF0aCBmb3IgNjQtYml0IGtlcm5lbHMsIHNvCj4g
bm93IHdlCj4gICAgICBuZWVkIHRvIGV4cGxpY2l0bHkgZW1pdCBhIHNmZW5jZS52bWEgaW4gZmx1
c2hfY2FjaGVfdm1hcCgpLgo+Cj4gICAgICBOb3RlIHRoYXQgd2UgZG9uJ3QgbmVlZCB0byBpbXBs
ZW1lbnQgZmx1c2hfY2FjaGVfdnVubWFwKCkgYXMgdGhlCj4gZ2VuZXJpYwo+ICAgICAgY29kZSBz
aG91bGQgZW1pdCBhIGZsdXNoIHRsYiBhZnRlciB1bm1hcHBpbmcgYSB2bWFsbG9jIHJlZ2lvbi4K
Pgo+ICAgICAgRml4ZXM6IDdkMzMzMmJlMDExZSAoInJpc2N2OiBtbTogUHJlLWFsbG9jYXRlIFBH
RCBlbnRyaWVzIGZvcgo+IHZtYWxsb2MvbW9kdWxlcyBhcmVhIikKPiAgICAgIFNpZ25lZC1vZmYt
Ynk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAo+IGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKPiBpbmRleCA4MDkxYjhiZjQ4ODMuLmI5M2ZmZGRmOGE2
MSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAo+ICsr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCj4gQEAgLTM3LDYgKzM3LDEw
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9kY2FjaGVfcGFnZShzdHJ1Y3QgcGFnZSAqcGFn
ZSkKPiAgICNkZWZpbmUgZmx1c2hfaWNhY2hlX3VzZXJfcGFnZSh2bWEsIHBnLCBhZGRyLCBsZW4p
IFwKPiAgICAgICAgICBmbHVzaF9pY2FjaGVfbW0odm1hLT52bV9tbSwgMCkKPgo+ICsjaWZkZWYg
Q09ORklHXzY0QklUCj4gKyNkZWZpbmUgZmx1c2hfY2FjaGVfdm1hcChzdGFydCwgZW5kKSBmbHVz
aF90bGJfa2VybmVsX3JhbmdlKHN0YXJ0LCBlbmQpCj4gKyNlbmRpZgpJIGRvbid0IHdhbnQgdGhh
dCwgYW5kIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UgaXMgZmx1c2hfdGxiX2FsbC4gSW4KYWRkaXRp
b24sIGl0IHdvdWxkIGNhbGwgSVBJLCB3aGljaCBpcyBhIHBlcmZvcm1hbmNlIGtpbGxlci4KCldo
YXQncyB0aGUgcHJvYmxlbSBvZiBzcHVyaW91cyBmYXVsdCByZXBsYXk/IEl0IG9ubHkgY29zdHMg
YQpsb2NhbF90bGJfZmx1c2ggd2l0aCB2YWRkci4KCj4gKwo+ICAgI2lmbmRlZiBDT05GSUdfU01Q
Cj4KPiAgICNkZWZpbmUgZmx1c2hfaWNhY2hlX2FsbCgpIGxvY2FsX2ZsdXNoX2ljYWNoZV9hbGwo
KQo+Cj4KPiBMZXQgbWUga25vdyBpZiB0aGF0IHdvcmtzIGZvciB5b3UhCj4KPgo+ID4KPiA+Cgot
LQpCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
