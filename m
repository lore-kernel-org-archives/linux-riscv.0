Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7794C001DE
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 04:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5FGbkGRenrBt37js6bELFcWPTz3D+/8WpLdy+5IbsE=; b=17wjPNURaLcHwz
	Xrz87cFICDjXH/tdC+1CX0LekcFiEhDEHFGwNbT+ybQks8lvwn7OAOCBpq2Q2suWJbXTNVO0AvyU1
	2HdMM2Qwtw75DbSINLpOylrflqhOijf/rlYj/yTDcQ9rH09bC/UyVp9gJGYc1uaAZ2C/yWzdC5bUu
	IfSB1TQg1hzTr+emyADiAfQNDLjuZX4XqlIHdrb5Dfr8jDUVf/ilvRQ7xueVUeT25T6itjLGt+nNH
	Tq+Jl4vI+KNy91hjg6Wj/J9BRghr0G9vwufqDkXhQOyrxIOi9ZpUp6lSh2/RBqnigQc0dMxJ91A46
	/HZS3nAXuLsTC9tVy2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOW6Z-0097Tg-0s;
	Wed, 26 Jul 2023 04:26:31 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOW6V-0097T5-0c
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 04:26:29 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-786bb09e595so13383139f.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 21:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690345586; x=1690950386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lavfuE2py63kVqVG37hnlHpSBQOco6qEbPDbyiaGHr8=;
        b=KqNnFaBvS8w7I7Srdl6Jvzm1b1m8LmOq6bK3MqaoIGO2Jsq06v9TC8TZKZ/LI8J5wR
         6G2uTZ5CofCxhiBDp8OUDQd4uGKXq+Ghy2JQLWqdNQaSuf3sx3bg+KWKkXxjuGn1k6Ns
         UAv/ymipwkhEjgru0+r9KINywii/CVWwNkj99dIaqLBjW8xQ59aBZs53xoxVyyhcAHXG
         /F435bvD/JsfH7CxoLctneRrgi3Cx0VedSUIQ6syZ8+BbEoPh+mVGrW1ugwLiHPeIb/Q
         fryDob8lF1DUfKrl6BRvkBu1j9fUe6VHD9dwTt7rDNExgRE09b0GNE59iwA8dgsQAceg
         7m0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690345586; x=1690950386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lavfuE2py63kVqVG37hnlHpSBQOco6qEbPDbyiaGHr8=;
        b=UEEpSp+mYA52a7eu8IkDe5f21c2FvQ84c4Wttzn/2EaLYzoEbhEknG0PO1qYIkt1GH
         ZdMh07wObOL61g8s8JLqNZrDqm5YlNCkcTzTL+WFcaCZCDsZGCIl0LuYmlli0jcMTM7U
         d27qco4+ovVKit9hUUfVVTmbif0kc6wfiXTK9+viarIp2wwEOpS6qt6m9/RhWXNoxY94
         Nvlk1l27jbdC0K8qYoUzuqFG8cUAC/nAKgGT4TNyAnA6E+3Uq5Q2x689MNna5dDCSDiX
         PEJVgul+nshyvvxhtAllf9OzeGOokcyS+Bcyq21dJ9UY7VLmGAzOaLfvRTYc4doZiGF9
         TFpg==
X-Gm-Message-State: ABy/qLZM+9s1sGMLAvpaSfX+Xpy5ZKkz0SKMiMg3G5KOPQf4/I/OGerM
	CVSoSxKxPrleFyubvV2uPZ91kCpFBeICC6pLRenxfQ==
X-Google-Smtp-Source: APBJJlHvcJ/8Fz022/unHWa1t7PeKP7/pURtkJm4fhXV77/BJ2s2iC9flzceWDnwDO/a8UM371CQfe7YxffPrAH9qk8=
X-Received: by 2002:a05:6e02:1c2a:b0:346:63f1:a96f with SMTP id
 m10-20020a056e021c2a00b0034663f1a96fmr3000190ilh.2.1690345585840; Tue, 25 Jul
 2023 21:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <d62ceb33620cab766d809e6bbf30eaf5b46bc955.1689792825.git.tjeznach@rivosinc.com>
 <CANXhq0r=2eqpy9wLjVt1U0J7=LpnJLcKV7N9d90jvCss=7+Fzg@mail.gmail.com>
 <CAK9=C2Vg9eR5LJPeqDDQ0pHZcrT5DOUzA8_wYEVEjfnhb6s8pw@mail.gmail.com>
 <CANXhq0oTrU_-OQroW7H+hvxcU7YROhkgdCF9g_WtPTzVFQL7gA@mail.gmail.com>
 <CAK9=C2XoQjPzZ5yB5jfTbee4-Pb8GgFAZRbfcMwMk9pyo39WxQ@mail.gmail.com>
 <CANXhq0q7R9Srx6U=fReq7LDLFgW6rMmjKH=o6MzDT5AWNRXP6w@mail.gmail.com> <592edb17-7fa4-3b5b-2803-e8c50c322eee@linux.intel.com>
In-Reply-To: <592edb17-7fa4-3b5b-2803-e8c50c322eee@linux.intel.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 26 Jul 2023 12:26:14 +0800
Message-ID: <CANXhq0pS_=YxgrxSKbdfrFdGcBduzk3LTyC4vp_hqoJTbX3e0g@mail.gmail.com>
Subject: Re: [PATCH 03/11] dt-bindings: Add RISC-V IOMMU bindings
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, 
	linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_212627_295987_44CE7828 
X-CRM114-Status: GOOD (  35.84  )
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

T24gV2VkLCBKdWwgMjYsIDIwMjMgYXQgMTE6MjHigK9BTSBCYW9sdSBMdSA8YmFvbHUubHVAbGlu
dXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIDIwMjMvNy8yNCAyMToyMywgWm9uZyBMaSB3cm90
ZToKPiA+Pj4+PiBJbiBSSVNDLVYgSU9NTVUsIGNlcnRhaW4gZGV2aWNlcyBjYW4gYmUgc2V0IHRv
IGJ5cGFzcyBtb2RlIHdoZW4gdGhlCj4gPj4+Pj4gSU9NTVUgaXMgaW4gdHJhbnNsYXRpb24gbW9k
ZS4gVG8gaWRlbnRpZnkgdGhlIGRldmljZXMgdGhhdCByZXF1aXJlCj4gPj4+Pj4gYnlwYXNzIG1v
ZGUgYnkgZGVmYXVsdCwgZG9lcyBpdCBiZSBzZW5zaWJsZSB0byBhZGQgYSBwcm9wZXJ0eSB0bwo+
ID4+Pj4+IGluZGljYXRlIHRoaXMgYmVoYXZpb3I/Cj4gPj4+PiBCeXBhc3MgbW9kZSBmb3IgYSBk
ZXZpY2UgaXMgYSBwcm9wZXJ0eSBvZiB0aGF0IGRldmljZSAoc2ltaWxhciB0byBkbWEtY29oZXJl
bnQpCj4gPj4+PiBhbmQgbm90IG9mIHRoZSBJT01NVS4gT3RoZXIgYXJjaGl0ZWN0dXJlcyAoQVJN
IGFuZCB4ODYpIG5ldmVyIGFkZGVkIHN1Y2gKPiA+Pj4+IGEgZGV2aWNlIHByb3BlcnR5IGZvciBi
eXBhc3MgbW9kZSBzbyBJIGd1ZXNzIGl0IGlzIE5PVCBBRFZJU0FCTEUgdG8gZG8gaXQuCj4gPj4+
Pgo+ID4+Pj4gSWYgdGhpcyBpcyBSRUFMTFkgcmVxdWlyZWQgdGhlbiB3ZSBjYW4gZG8gc29tZXRo
aW5nIHNpbWlsYXIgdG8gdGhlIFFDT00KPiA+Pj4+IFNNTVUgZHJpdmVyIHdoZXJlIHRoZXkgaGF2
ZSBhIHdoaXRlbGlzdCBvZiBkZXZpY2VzIHdoaWNoIGFyZSBhbGxvd2VkIHRvCj4gPj4+PiBiZSBp
biBieXBhc3MgbW9kZSAoaS5lLiBJT01NVV9ET01BSU5fSURFTlRJVFkpIGJhc2VkIHRoZWlyIGRl
dmljZQo+ID4+Pj4gY29tcGF0aWJsZSBzdHJpbmcgYW5kIGFueSBkZXZpY2Ugb3V0c2lkZSB0aGlz
IHdoaXRlbGlzdCBpcyBibG9ja2VkIGJ5IGRlZmF1bHQuCj4gPj4+Pgo+ID4+PiBJIGhhdmUgY29u
c2lkZXJlZCB0aGF0IGFkZGluZyB0aGUgcHJvcGVydHkgb2YgYnlwYXNzIG1vZGUgdG8gdGhhdAo+
ID4+PiBkZXZpY2Ugd291bGQgYmUgbW9yZSBhcHByb3ByaWF0ZS4gSG93ZXZlciwgaWYgd2Ugd2Fu
dCB0byBkZWZpbmUgdGhpcwo+ID4+PiBwcm9wZXJ0eSBmb3IgdGhlIGRldmljZSwgaXQgbWlnaHQg
bmVlZCB0byBnbyB0aHJvdWdoIHRoZSBnZW5lcmljIElPTU1VCj4gPj4+IGR0LWJpbmRpbmdzLCBi
dXQgSSdtIG5vdCBzdXJlIGlmIG90aGVyIElPTU1VIGRldmljZXMgbmVlZCB0aGlzLiBJIGFtCj4g
Pj4+IGJyaW5naW5nIHVwIHRoaXMgdG9waWMgaGVyZSBiZWNhdXNlIEkgd291bGQgbGlrZSB0byBl
eHBsb3JlIGlmIHRoZXJlCj4gPj4+IGFyZSBhbnkgc29sdXRpb25zIG9uIHRoZSBJT01NVSBzaWRl
LCBzdWNoIGFzIGEgcHJvcGVydHkgdGhhdCBpbmRpY2F0ZXMKPiA+Pj4gdGhlIHBoYW5kbGUgb2Yg
ZGV2aWNlcyB3aXNoaW5nIHRvIHNldCBieXBhc3MgbW9kZSwgc29tZXdoYXQgc2ltaWxhciB0bwo+
ID4+PiB0aGUgd2hpdGVsaXN0IHlvdSBtZW50aW9uZWQgZWFybGllci4gRG8geW91IHRoaW5rIHdl
IHNob3VsZCBhZGRyZXNzCj4gPj4+IHRoaXM/IEFmdGVyIGFsbCwgdGhpcyBpcyBhIGNhc2Ugb2Yg
UklTQy1WIElPTU1VIHN1cHBvcnRlZC4KPiA+PiBCeXBhc3MgbW9kZSBpcyBhIGNvbW1vbiBmZWF0
dXJlIGFjcm9zcyBJT01NVXMuIE90aGVyIElPTU1VcyBkb24ndAo+ID4+IGhhdmUgYSBzcGVjaWFs
IHByb3BlcnR5IGZvciBieXBhc3MgbW9kZSBhdCBkZXZpY2UtbGV2ZWwgb3IgYXQgSU9NTVUgbGV2
ZWwsCj4gPj4gd2hpY2ggY2xlYXJseSBpbmRpY2F0ZXMgdGhhdCBkZWZpbmluZyBhIFJJU0MtViBz
cGVjaWZpYyBwcm9wZXJ0eSBpcyBub3QgdGhlCj4gPj4gcmlnaHQgd2F5IHRvIGdvLgo+ID4+Cj4g
Pj4gVGhlIHJlYWwgcXVlc3Rpb24gaXMgaG93IGRvIHdlIHNldCBJT01NVV9ET01BSU5fSURFTlRJ
VFkgKGkuZS4KPiA+PiBieXBhc3MvaWRlbnRpdHkgZG9tYWluKSBhcyB0aGUgZGVmYXVsdCBkb21h
aW4gZm9yIGNlcnRhaW4gZGV2aWNlcyA/Cj4gPj4KPiA+PiBPbmUgcG9zc2libGUgb3B0aW9uIGlz
IHRvIGltcGxlbWVudCBkZWZfZG9tYWluX3R5cGUoKSBJT01NVSBvcGVyYXRpb24KPiA+PiBmb3Ig
UklTQy1WIElPTU1VIHdoaWNoIHdpbGwgcmV0dXJuIElPTU1VX0RPTUFJTl9JREVOVElUWSBmb3IK
PiA+PiBjZXJ0YWluIGRldmljZXMgYmFzZWQgb24gY29tcGF0aWJsZSBzdHJpbmcgbWF0Y2hpbmcg
KGkuZS4gd2hpdGVsaXN0IG9mCj4gPj4gZGV2aWNlcykuIEFzIGFuIGV4YW1wbGUsIHJlZmVyIHFj
b21fc21tdV9kZWZfZG9tYWluX3R5cGUoKQo+ID4+IG9mIGRyaXZlcnMvaW9tbXUvYXJtL2FybS1z
bW11L2FybS1zbW11LXFjb20uYwo+ID4+Cj4gPiBUaGF0IGlzIGluZGVlZCBvbmUgd2F5IHRvIGFw
cHJvYWNoIGl0LCBhbmQgd2UgY2FuIG1vZGlmeSB0aGUKPiA+IGNvbXBhdGlibGUgc3RyaW5nIHdo
ZW4gd2Ugd2FudCB0byBjaGFuZ2UgdGhlIG1vZGUuIEhvd2V2ZXIsIGl0IHdvdWxkCj4gPiBiZSBw
cmVmZXJhYmxlIHRvIGV4cGxvcmUgYSBtb3JlIGZsZXhpYmxlIGFwcHJvYWNoIHRvIGFjaGlldmUg
dGhpcwo+ID4gZ29hbC4gQnkgZG9pbmcgc28sIHdlIGNhbiBhdm9pZCBoYXJkIGNvZGluZyBhbnl0
aGluZyBpbiB0aGUgZHJpdmVyIG9yCj4gPiBoYXZpbmcgdG8gcmVidWlsZCB0aGUga2VybmVsICB3
aGVuZXZlciB3ZSB3YW50IHRvIGNoYW5nZSB0aGUgbW9kZSBmb3IKPiA+IGNlcnRhaW4gZGV2aWNl
cy4gV2hpbGUgSSBoYXZlIGNvbnNpZGVyZWQgZXh0ZW5kaW5nIGEgY2VsbCBpbiB0aGUKPiA+ICdp
b21tdXMnIHByb3BlcnR5IHRvIGluZGljYXRlIGEgZGV2aWNlJ3MgZGVzaXJlIHRvIHNldCBieXBh
c3MgbW9kZSwgaXQKPiA+IGRvZXNuJ3QgY29tcGx5IHdpdGggdGhlIGlvbW11IGRvY3VtZW50YXRp
b24gYW5kIGNvdWxkIGxlYWQgdG8KPiA+IGFtYmlndW91cyBkZWZpbml0aW9ucy4KPgo+IEhhcmQg
Y29kaW5nIHRoZSBtYXRjaGluZyBzdHJpbmdzIGluIHRoZSBpb21tdSBkcml2ZXIgaXMgZGVmaW5p
dGVseSBub3QgYQo+IHByZWZlcmFibGUgd2F5LiBBIGZlYXNpYmxlIHNvbHV0aW9uIGZyb20gY3Vy
cmVudCBjb2RlJ3MgcG9pbnQgb2YgdmlldyBpcwo+IHRoYXQgcGxhdGZvcm0gb3B0LWluIHRoZSBk
ZXZpY2UncyBzcGVjaWFsIHJlcXVpcmVtZW50cyB0aHJvdWdoIERUIG9yCj4gQUNQSS4gQW5kIGlu
IHRoZSBkZWZfZG9tYWluX3R5cGUgY2FsbGJhY2ssIGxldCB0aGUgaW9tbXUgY29yZSBrbm93IHRo
YXQsCj4gaGVuY2UgaXQgY2FuIGFsbG9jYXRlIGEgcmlnaHQgdHlwZSBvZiBkb21haW4gZm9yIHRo
ZSBkZXZpY2UuCj4KPiBUaG91Z2h0cz8KPgoKSXQgd291bGQgYmUgbmljZSBpZiB3ZSBjYW4gZGVh
bCB3aXRoIGl0IGF0IHRoaXMgdGltZS4gQXMgd2UgZGlzY3Vzc2VkCmVhcmxpZXIsIHdlIG1pZ2h0
IG5lZWQgdG8gY29uc2lkZXIgaG93IHRvIGluZGljYXRlIHRoYXQsIHN1Y2ggYXMKcHV0dGluZyBh
IHByb3BlcnR5IGluIGRldmljZSBzaWRlIG9yIGlvbW11IHNpZGUsIGFuZCB3aGV0aGVyIHdlIG5l
ZWQKdG8gZGVmaW5lIGl0IGluIGdlbmVyaWMgZHQtYmluZGluZyBpbnN0ZWFkIG9mIFJJU0MtViBz
cGVjaWZpYwpkdC1iaW5kaW5nLgoKPiBCZXN0IHJlZ2FyZHMsCj4gYmFvbHUKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
