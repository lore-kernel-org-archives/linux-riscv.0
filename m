Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD0CC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 09:51:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1F312085B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 09:51:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d3H5FJf1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAV1Alqa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1F312085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUBXJfBI8Tc8FGXnq39AIOiPU56js2TODN1APeZrxeE=; b=d3H5FJf1gpFGcE
	3lZ+Beiuuv4GIukIrBPSnql8wX5Ci3TjY//URlHD7TfPGS/iXYt8EPDtoG5nJa//nDi95wnPACQgn
	MGvLb9IY/NifnDyc3b1yYZAvEDDbof4+z+ihBh2qRmqy3QIR7uABpuebUr2cWhSEO3+XA0Stls6Vs
	kScR8KjBj2qWjutkyX2EwgIiky4J5xtCAprpMILwXPTYksPFl2UYTEzSFWXDSBPOxLBPPNG99F/eg
	G3wLT5Lc1nkrQ0bSqK2rKV7q21ItDKfZ401D53GO0cDKBvRQ60+V8d36q+kZlWU8NjnCSzHojiDBr
	m9jU4EhQFEMeAW86tl2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKKUg-0003v0-G1; Wed, 07 Nov 2018 09:51:26 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKKUd-0003u7-T2
 for linux-riscv@lists.infradead.org; Wed, 07 Nov 2018 09:51:25 +0000
Received: by mail-qk1-x741.google.com with SMTP id q1so20118415qkf.13
 for <linux-riscv@lists.infradead.org>; Wed, 07 Nov 2018 01:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=BJq84/a5/nkl9JGGExc2GPSH9U5Gl2mha1VX6NO2L/w=;
 b=TAV1AlqaVMHwg/Znw/UHeL6gRqNkTUmfRxzmOq3vs1+ngjUDYo1uTnmAnjTzc2Bolm
 BnOjTkqQla/cL0XXWp17S0rPAEwhB+MvwXzCcYP0FAFYMVt7pPJb0zVbiGUizI5EaXoj
 9xLE9vfTHCR0F6OLRZd1xLoAy5n9HyrpcLDXh42VnGV+FijlCDuHekCyHA6c6nuNPpZU
 a2dwWwIU5NnXtcK1tm3rRrmKjmemD5EQv0vEPDqJQaLT8L/n4MrlKxfsmtzT6mkLfTif
 cz0lQlpRtizdSl1fBoRX1SoLes7uEfX/NwOHMYGLWwL1bmcvGZ91OhVXgDHM3suVFM8r
 qauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=BJq84/a5/nkl9JGGExc2GPSH9U5Gl2mha1VX6NO2L/w=;
 b=nrAzO6zw7IIdNUOuHzECI6R+15Eui2+lEvC9tJhLO3nXFSsu/qQiiUf9kVeO+CkUFV
 OiJK91UsYJj/dmClfoYZVbuYZC00ElurSejRKxf1gsrHyCRALSgqI3K623hxW9RiLnQ+
 eP19bKS8XDQH6QVlqpUxN3uNGM+5Y9YWqbxk2rcf1B8tWzXcu3wjoEz063sJ3CwLfxuq
 gLHpO9GYj3NXbwA4UWMKfqefBi4TM5lzvmN6DhN8rPL1tTYWXxLaGvwIWH4kbWVMiK1Y
 rZnlYG030ItwIcQWUOvZJ7MwJHqNeBr7MaHQL5ex8F+q2mzpjGwkz7KDH90LD1q1UB2V
 nrjw==
X-Gm-Message-State: AGRZ1gJL6KGD/3hLtkh0hfUC84QLH+7JS3/g+9Gg701VqX8+txPy8869
 QMyXDzWsUejdmnmm/AOXGiN1QIzTY5LIOzhN0VM=
X-Google-Smtp-Source: AJdET5e5iMMqrY432W6dIKyI8anemN5g31txn1Sp+2R557iBjNI0tUDKiR1MgTkPzzRgLmN3IutQJhQ9JCuYoNmwUEY=
X-Received: by 2002:a37:324a:: with SMTP id y71mr916649qky.291.1541584271725; 
 Wed, 07 Nov 2018 01:51:11 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a0c:9881:0:0:0:0:0 with HTTP;
 Wed, 7 Nov 2018 01:51:11 -0800 (PST)
In-Reply-To: <mhng-19511b81-9f89-4a15-8b2f-d63779074fb4@palmer-si-x1c4>
References: <CAK8P3a2c98VVPArCkdAR=-nnDBq1gYRCLDDgQB71eGiTSRdb4A@mail.gmail.com>
 <mhng-19511b81-9f89-4a15-8b2f-d63779074fb4@palmer-si-x1c4>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 7 Nov 2018 10:51:11 +0100
X-Google-Sender-Auth: HIqzNzdoQ7BmDvG7NETbjR9Vl-w
Message-ID:
 <CAK8P3a1He1B2UHLEinzuPF2WvDbt=gwmTkz7-XoMwvpHhBDiuA@mail.gmail.com>
Subject: Re: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_015123_960954_82EAB59D 
X-CRM114-Status: GOOD (  13.78  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: vincentc@andestech.com, aou@eecs.berkeley.edu, alankao@andestech.com,
 greentime@andestech.com, zong@andestech.com, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, kito@andestech.com,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107095111.9Z27oJFi_7aC54s3vsA4eXRBm1tsu6fQqkdTifruNPA@z>

T24gMTEvNy8xOCwgUGFsbWVyIERhYmJlbHQgPHBhbG1lckBzaWZpdmUuY29tPiB3cm90ZToKPiBP
biBNb24sIDA1IE5vdiAyMDE4IDAwOjUyOjUyIFBTVCAoLTA4MDApLCBBcm5kIEJlcmdtYW5uIHdy
b3RlOgo+PiBPbiAxMS81LzE4LCBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+
IHdyb3RlOgo+Pj4gT24gTW9uLCBOb3YgMDUsIDIwMTggYXQgMDI6NTg6MDdQTSArMDgwMCwgVmlu
Y2VudCBDaGVuIHdyb3RlOgo+Pj4+IE1hbnkgdGhhbmtzIGZvciBraW5kcyBvZiBjb21tZW50cy4g
SSBxdWlja2x5IHN5bnRoZXNpemUgdGhlIGNvbW1lbnRzCj4+Pj4gYW5kCj4+Pj4gbGlzdCB0aGVt
IGFzIGJlbG93Lgo+Pj4+IDEuIFRoZSBrZXJuZWwgaW1hZ2Ugc2hhbGwgaW5jbHVkZSBhbGwgdmVu
ZG9yLXNwZWNpZmljIGNvZGUuCj4+Pgo+Pj4gSSBmdW5kYW1lbnRhbGx5IGRpc2FncmVlIHdpdGgg
dGhpc+KApiBhbmQgdGhpbmsgaXQgc2hvdWxkIGJlIHRoZSBjb250cmFyeS4KPj4+Cj4+PiAxLiBU
aGUga2VybmVsIHNoYWxsIHN1cHBvcnQgbm8gdmVuZG9yIHNwZWNpZmljIGluc3RydWN0aW9ucyB3
aGF0c29ldmVyLAo+Pj4gcGVyaW9kLgo+Pgo+PiBJIHRoaW5rIHdoYXQgd2FzIG1lYW50IGFib3Zl
IGlzCj4+Cj4+IDEuIElmIGEgdmVuZG9yIGV4dGVuc2lvbiByZXF1aXJlcyBrZXJuZWwgc3VwcG9y
dCwgdGhhdCBzdXBwb3J0Cj4+IG11c3QgYmUgYWJsZSB0byBiZSBidWlsdCBpbnRvIGEga2VybmVs
IGltYWdlIHdpdGhvdXQgYnJlYWtpbmcgc3VwcG9ydAo+PiBmb3IgQ1BVcyB0aGF0IGRvIG5vdCBo
YXZlIHRoYXQgZXh0ZW5zaW9uLCB0byBhbGxvdyBidWlsZGluZyBhIHNpbmdsZQo+PiBrZXJuZWwg
aW1hZ2UgdGhhdCB3b3JrcyBvbiBhbGwgQ1BVcy4KPgo+IFllcy4gIEkgZG9uJ3Qgd2FudCBhbnl0
aGluZyB0aGF0IHdvbid0IGNvbXBpbGUgd2l0aCB1cHN0cmVhbSBHQ0MsIGJ1dCBJIGFsc28KPgo+
IGRvbid0IHdhbnQgdG8gaGF2ZSBhIEtjb25maWcgdGhhdCBzYXlzICJtYWtlIHRoZSBrZXJuZWwg
b25seSB3b3JrIG9uCj4gJFZFTkRPUidzICBpbXBsZW1lbnRhdGlvbiIuICBJIHRoaW5rIHRoaXMg
Y2FuIGJlIGFjaGlldmVkLCBhdCBsZWFzdCBmb3IgdGhlCj4gY2FzZXMgSSd2ZSBzZWVuIHNvIGZh
ci4KCkkgdGhpbmsgb3ZlciB0aW1lLCB0aGUgaW1wbGVtZW50YXRpb25zIHdpbGwgZGl2ZXJnZS4g
SWdub3JpbmcgdGhlIHF1ZXN0aW9uCm9mIHZlbmRvciBleHRlbnNpb25zIGZvciB0aGUgbW9tZW50
LCB5b3Ugd2lsbCBkZWZpbml0ZWx5IGhhdmUgdG8gZGVhbCB3aXRoCmNvbWJpbmF0aW9ucyBvZiAo
ZnV0dXJlKSBzdGFuZGFyZCBleHRlbnNpb25zLiBJIGNhbiBzZWUgdHdvIHdheXMgb2YKZG9pbmcg
dGhhdDogRWl0aGVyIGVhY2ggZXh0ZW5zaW9uIGlzIGEgc2VwYXJhdGUgS2NvbmZpZyBvcHRpb24g
YW5kIHlvdQpoYXZlIHRvIGtub3cgd2hpY2ggb25lIHRvIGVuYWJsZSBvciBkaXNhYmxlIGZvciBh
IHBhcnRpY3VsYXIgdGFyZ2V0LApvciB5b3UgbGlzdCBlYWNoIHBsYXRmb3JtIHNlcGFyYXRlbHkg
d2l0aCBvbmUgS2NvbmZpZyBvcHRpb24sIGFuZApoYXZlIEtjb25maWcvS2J1aWxkIHdvcmsgb3V0
IHdoaWNoIGZlYXR1cmVzIHRvIGVuYWJsZSBvciBkaXNhYmxlCmJhc2VkIG9uIHRoYXQgdG8gZ2V0
IHRoZSBmYXN0ZXN0IGFuZCBtb3N0IGZlYXR1cmVmdWwga2VybmVsIHRoYXQgc3RpbGwKd29ya3Mg
b24gYWxsIGVuYWJsZWQgcGxhdGZvcm1zLgoKICAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
