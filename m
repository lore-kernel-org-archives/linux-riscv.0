Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B696EC48BE5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 14:55:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E1256105A
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 14:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E1256105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+hincO4jthOs958czU45PO2j9DUM/jDztkw8OA0wzc=; b=RD4Un7H1btNbUV
	5RH4+8RaiINBHEBGRW6rxCRKwIqoUxC6iZBg3qw0OM4TYIw/jMQ0bpRlCJiPWkVYqCJyBdNPuICdd
	SJ69jn0tJip4mWt2bxudcWVuxmh7nF/ZiIwMSm0Sr9E2hXBP4iwFkqk3Urie2GWkpeTshy/vZ6P+c
	Ejw7ZmvQVj/0n5IxL+JjRwCAp7Y8qaWED3fWybdPCiKv9SUMI3pxXSXS5Mi1bx2cmdjPpDXaSElrT
	1D7U5ECnZleneCA3Yrf57/t68H4p7zKVeuuUo8kx09nxaeHLuafSLg6fBdKKsrZYoQfUftW55+FmH
	MxdaxqotT3y8/FAMtToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltWwq-006mbe-0M; Wed, 16 Jun 2021 14:55:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltWwn-006mb0-46
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 14:55:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C47496115C
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 14:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623855316;
 bh=AxlyDycZpX8N+vmFuWI19Sd23V+DuNrgeU3nJ9fSOlQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QbxJDVCXZCiJeF3/Q66YYkQXX8XrqQWunoHlN3fz7MvO3OBOJzfBaIE1+y9uV3EAJ
 7ZOnQOUax/KFmkvtfDUou8wXJ0FfPxJ4kcKXYjibBCJdFoN5AgHrlcU9CuAk4qCvlw
 zLTuWne2oMrfffRAnHML8LSecawZJ9nk0RmoqKCSYZh8Z9k8REa/NtJtsTmhlIcV+3
 ZIDmMzY3L8+UFaPWf88q3/7ddG2zmUdCL/6pwINt3fHenvC3PuKC/nnYWq23IPE5Nm
 lrqlsLz6YFDCi9nBadTiG2yRnNxG98sePhSk02i2zImkAJwuFwFs6frHPbEhyjfmgV
 h1jU+qvK6TdTg==
Received: by mail-ej1-f46.google.com with SMTP id hq2so4433383ejc.2
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 07:55:16 -0700 (PDT)
X-Gm-Message-State: AOAM530gW6SfgmsHNQN9Qe5X3cqA6PSYjQS3jl55tL2Fy5u94gHBr413
 h9/2WPILcLh+9hKJVI6ZvzTLGEHD7a/GueVGHA==
X-Google-Smtp-Source: ABdhPJwrM8JUB7d5DGbvDUmM8cwcGPrXjP07+dvcNQN2Yqm0+3CnQUECrHvdmK6ajaK5xuXmYOM66M46eB/vWGyFWYM=
X-Received: by 2002:a17:906:9419:: with SMTP id
 q25mr163961ejx.341.1623855315390; 
 Wed, 16 Jun 2021 07:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210419005539.22729-1-mick@ics.forth.gr>
 <20210419005539.22729-6-mick@ics.forth.gr>
 <CAMuHMdW=23SPXwqcjD+30M_d0azdze2=ChZM-PF1brf9bCNtrA@mail.gmail.com>
 <fe02eb618eee141e8bc021e8e30906fc@mailhost.ics.forth.gr>
 <CAMuHMdXtT1L3yfzkTkbhqz3zgUQj89Bcm7mqz+m126NprAsK8Q@mail.gmail.com>
 <CAL_JsqLHOmZ6az0bYGC3dg__YX3aq=+Un4_x4+R2nNksc0hM2g@mail.gmail.com>
 <a488d802940f7fc2ae34a4fe583ec187@mailhost.ics.forth.gr>
In-Reply-To: <a488d802940f7fc2ae34a4fe583ec187@mailhost.ics.forth.gr>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 16 Jun 2021 08:55:02 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+9eBSHUwzWBipgoSHNDvxqfrTuY4Un0PrRhoaAHugJNw@mail.gmail.com>
Message-ID: <CAL_Jsq+9eBSHUwzWBipgoSHNDvxqfrTuY4Un0PrRhoaAHugJNw@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] RISC-V: Add crash kernel support
To: Nick Kossifidis <mick@ics.forth.gr>, Ard Biesheuvel <ardb@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_075517_236466_F33A17F9 
X-CRM114-Status: GOOD (  27.13  )
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

K0FyZAoKT24gVHVlLCBKdW4gMTUsIDIwMjEgYXQgNToyOSBQTSBOaWNrIEtvc3NpZmlkaXMgPG1p
Y2tAaWNzLmZvcnRoLmdyPiB3cm90ZToKPgo+IM6jz4TOuc+CIDIwMjEtMDYtMTUgMjI6MjEsIFJv
YiBIZXJyaW5nIM6tzrPPgc6xz4jOtToKPiA+IE9uIFR1ZSwgSnVuIDE1LCAyMDIxIGF0IDEyOjQ4
IFBNIEdlZXJ0IFV5dHRlcmhvZXZlbgo+ID4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToK
PiA+Pgo+ID4+IEhpIE5pY2ssCj4gPj4KPiA+PiBPbiBUdWUsIEp1biAxNSwgMjAyMSBhdCA4OjI5
IFBNIE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+Cj4gPj4gd3JvdGU6Cj4gPj4g
PiDOo8+EzrnPgiAyMDIxLTA2LTE1IDE2OjE5LCBHZWVydCBVeXR0ZXJob2V2ZW4gzq3Os8+BzrHP
iM61Ogo+ID4+ID4gPiBUaGlzIGRvZXMgbm90IG1hdGNoCj4gPj4gPiA+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9kZXZpY2V0cmVlLW9yZy9kdC1zY2hlbWEvYmxvYi9tYXN0ZXIvc2NoZW1hcy9jaG9zZW4u
eWFtbCNMNzc6Cj4gPj4gPiA+Cj4gPj4gPiA+ICAgICAkcmVmOiB0eXBlcy55YW1sIy9kZWZpbml0
aW9ucy91aW50NjQtYXJyYXkKPiA+PiA+ID4gICAgIG1heEl0ZW1zOiAyCj4gPj4gPiA+ICAgICBk
ZXNjcmlwdGlvbjoKPiA+PiA+ID4gICAgICAgVGhpcyBwcm9wZXJ0eSAoY3VycmVudGx5IHVzZWQg
b25seSBvbiBhcm02NCkgaG9sZHMgdGhlIG1lbW9yeQo+ID4+ID4gPiByYW5nZSwKPiA+PiA+ID4g
ICAgICAgdGhlIGFkZHJlc3MgYW5kIHRoZSBzaXplLCBvZiB0aGUgZWxmIGNvcmUgaGVhZGVyIHdo
aWNoIG1haW5seQo+ID4+ID4gPiBkZXNjcmliZXMKPiA+PiA+ID4gICAgICAgdGhlIHBhbmlja2Vk
IGtlcm5lbFwncyBtZW1vcnkgbGF5b3V0IGFzIFBUX0xPQUQgc2VnbWVudHMgb2YgZWxmCj4gPj4g
PiA+IGZvcm1hdC4KPiA+PiA+ID4KPiA+PiA+ID4gSGVuY2UgImxpbnV4LGVsZmNvcmVoZHIiIHNo
b3VsZCBiZSBhIHByb3BlcnR5IG9mIHRoZSAvY2hvc2VuIG5vZGUsCj4gPj4gPiA+IGluc3RlYWQg
b2YgYSBtZW1vcnkgbm9kZSB3aXRoIGEgY29tcGF0aWJsZSB2YWx1ZSBvZiAibGludXgsZWxmY29y
ZWhkciIuCj4gPj4gPiA+Cj4gPj4gPgo+ID4+ID4gVGhhdCdzIGEgYmluZGluZyBmb3IgYSBwcm9w
ZXJ0eSBvbiB0aGUgL2Nob3NlbiBub2RlLCB0aGF0IGFzIHRoZSB0ZXh0Cj4gPj4gPiBzYXlzIGl0
J3MgZGVmaW5lZCBmb3IgYXJtNjQgb25seSBhbmQgdGhlIGNvZGUgdGhhdCBoYW5kbGVkIGl0IHdh
cyBhbHNvCj4gPj4KPiA+PiBUaGF0IGRvZXNuJ3QgbWVhbiBpdCBtdXN0IG5vdCBiZSB1c2VkIG9u
IG90aGVyIGFyY2hpdGVjdHVyZXMgOy0pCj4gPj4gQXJtNjQgd2FzIGp1c3QgdGhlIGZpcnN0IG9u
ZSB0byB1c2UgaXQuLi4KPiA+Cj4gPiBJdCBpcyB1c2VkIG9uIGFybTY0IGJlY2F1c2UgbWVtb3J5
IGlzIG9mdGVuIHBhc3NlZCBieSBVRUZJIHRhYmxlcyBhbmQKPiA+IG5vdCB3aXRoIC9tZW1vcnkg
bm9kZS4gQXMgcmlzY3YgaXMgYWxzbyBzdXBwb3J0aW5nIEVGSSwgSSdkIHRoaW5rIHRoZXkKPiA+
IHdvdWxkIGRvIHRoZSBzYW1lLgo+ID4KPgo+IFdlJ3ZlIGhhZCB0aGlzIGRpc2N1c3Npb24gYmVm
b3JlLCByaXNjdiB1c2VzIC9tZW1vcnkgZm9yIG5vdyBhbmQgZXZlbiBpZgo+IHdlIHN3aXRjaGVk
IHRvIGdldHRpbmcgbWVtb3J5IGZyb20gQUNQSS9VRUZJIHRhYmxlcywgdGhlIGVsZiBjb3JlIGhl
YWRlcgo+IGlzIHBhc3NlZCBmcm9tIHRoZSBjcmFzaGVkIGtlcm5lbCB0byB0aGUga2R1bXAga2Vy
bmVsLCBpdCBoYXMgbm90aGluZyB0bwo+IGRvIHdpdGggVUVGSSBzaW5jZSB0aGUgYm9vdGxvYWRl
ciBpcyB0aGUga2VybmVsIGl0c2VsZi4gQW0gSSBtaXNzaW5nCj4gc29tZXRoaW5nID8KCkkgYmVs
aWV2ZSBpZiB3ZSBvcmlnaW5hbGx5IGJvb3RlZCB1c2luZyBVRUZJIHRhYmxlcywgdGhlbiB0aG9z
ZSBhcmUKcGFzc2VkIHRoZSBrZHVtcCBrZXJuZWwgYXMgd2VsbC4gVGhlIG9yaWdpbmFsIERUIG1h
eSBoYXZlIGhhZCBhCi9tZW1vcnkgbm9kZSwgYnV0IGl0J3MgcG9zc2libGUgaXQgZGlkbid0IG1h
dGNoIHdoYXQgd2FzIGluIHRoZSBVRUZJCnRhYmxlcy4gU28gdXNpbmcgdGhlIERUIC9tZW1vcnkg
bm9kZXMgZm9yIGtkdW1wIGNvdWxkIGdpdmUgc3VycHJpc2luZwpyZXN1bHRzLiBJIHRoaW5rIHJl
c2VydmVkIHJlZ2lvbnMgYWxzbyBjb21lIGZyb20gVUVGSS4gQXJkIGNhbgpwcm9iYWJseSBjb21t
ZW50IGJldHRlci4KClJvYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
