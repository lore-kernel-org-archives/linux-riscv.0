Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DAEC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 18:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IrozsquG/tlliDEqqPSKStw+qHvYDED4KQv4Z6nCiuI=; b=Da77nc1l/vzgMg
	Q/TR/XqcUg/uK7XBs12axXm8UzA3ul79BSqHGBkPMmB6Ybc7Odm3pzMGoxRGGm8m77C0FmXXrXdz6
	TYQYNwUJZwYMjdIP09Cz6dINWq51a860r57oZS3I+hhXiwGTFneuxtObdltqXA4DwqJEADwA+PYB+
	OJN6RGIEeXFnrAJU+ecgT0J4zmXhpqZ0NufHus/H/6C3AIZ+1RpO7Gw/GOcwKb5wIdC0FBqtayegl
	zUiGR8+kfS28GdFKcmRE2GFRDDBPZMevXYIOJu5D+8jjMzj/cGRsihdOVDimNbYakQsZJAIDNan4/
	xsaOUD0VWuZOX/UFrc8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKjRa-008i2v-2j;
	Tue, 02 Jan 2024 18:24:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKjRW-008i1G-02
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 18:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704219879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YGtRjZmMmbNMYMYyioQRov4waYs86YugI8J9gTbyhEE=;
	b=ApVH9yAQG/TCII7IHBYtOsOPztGjtAl93s3Sfxvt4/47rsY/oQF1QvTYfCDvbSliVu1jMs
	CgRlZlfrAzrKZp+fgvteAduk21kDCs9HRw7sugXWnSh1OkLPokdiv95syNuj9xojMKr5GU
	Uf7XvMj5oVpGqMo1dTqJExHUV++1puQ=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-3aQK8DupNU6ZPOraAUqeWg-1; Tue, 02 Jan 2024 13:24:38 -0500
X-MC-Unique: 3aQK8DupNU6ZPOraAUqeWg-1
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-7cc06b90950so1913944241.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 10:24:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704219878; x=1704824678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGtRjZmMmbNMYMYyioQRov4waYs86YugI8J9gTbyhEE=;
        b=kkFQ8XZGlJsPSsVo6qZXEANb42z2YZEh7s0gQuY5B1CfeiBqw0YhLPmgaXuAIKqVLZ
         nIosvMALJcx+OR79umqPpVzQp0MkAinARwYzGzTvldPC6lY4eX7bAqmc0Hbc9O4RIpQg
         wR+4ELtwr6AK5WYFsndtcLlMy4JSwJ3QkDY4k03oJ1vW/3/JCQoZqFcSrW3O2FQ9Xj8G
         2bzR5qAzWvowC2z2DJvWTfMt7755uJAFaxHL8fhGshSuyEux6tKgPDSMyh3jePSSCIoq
         bSy2Nqo3XuxDkepM/r8pRuR9g0C/7hPw71iSR75H03Oo70qG4XeJP4GTc3MAZ2SqhYR3
         AEfA==
X-Gm-Message-State: AOJu0YzcYDr3gUxy4XZf0ptG0dpMDX+wFQOfisn+bWmf+k0ZJGTN3szY
	5U8NZMc+EVF/WMUzYqDvakdPZjV604EaL7ugRTvdLFLS6gj8DoS6Lm3EWDfoaF6GXkp4n1B4uF3
	dkH/Bgc0k5aC4vFhqhqamKUdgt9Mq22PLjgrDvjkhjcsJgcL2LfLC
X-Received: by 2002:a05:6102:10cd:b0:466:fc84:fc42 with SMTP id t13-20020a05610210cd00b00466fc84fc42mr6218405vsr.61.1704219877847;
        Tue, 02 Jan 2024 10:24:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcEme0AwBsq2SkjvHwA5uTApX5CHKYtaxllcpJVnvL9RqA3a3vL5jSdm4AW4mhRpHLFagdJZOmrzHqOkhuoVA=
X-Received: by 2002:a05:6102:10cd:b0:466:fc84:fc42 with SMTP id
 t13-20020a05610210cd00b00466fc84fc42mr6218396vsr.61.1704219877601; Tue, 02
 Jan 2024 10:24:37 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy1QsMuAmr+DFxjkf3a2Ur91AX9AnddRnBHGM6+exkAn1g@mail.gmail.com>
In-Reply-To: <CAAhSdy1QsMuAmr+DFxjkf3a2Ur91AX9AnddRnBHGM6+exkAn1g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 2 Jan 2024 19:24:26 +0100
Message-ID: <CABgObfZN4_xvOHr8aukZZGZj5teWZ7rt5RJU5Y0YFewQk19FRw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.8 part #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_102446_191370_DC59A966 
X-CRM114-Status: GOOD (  12.20  )
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

T24gU3VuLCBEZWMgMzEsIDIwMjMgYXQgNjozM+KAr0FNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIHRoZSBmb2xsb3dpbmcg
S1ZNIFJJU0MtViBjaGFuZ2VzIGZvciA2Ljg6Cj4gMSkgS1ZNX0dFVF9SRUdfTElTVCBpbXByb3Zl
bWVudCBmb3IgdmVjdG9yIHJlZ2lzdGVycwo+IDIpIEdlbmVyYXRlIElTQSBleHRlbnNpb24gcmVn
X2xpc3QgdXNpbmcgbWFjcm9zIGluIGdldC1yZWctbGlzdCBzZWxmdGVzdAo+IDMpIFN0ZWFsIHRp
bWUgYWNjb3VudCBzdXBwb3J0IGFsb25nIHdpdGggc2VsZnRlc3QKCkp1c3Qgb25lIHNtYWxsIHRo
aW5nIEkgbm90aWNlZCBvbiAoMyksIGRvIHlvdSByZWFsbHkgbmVlZCBjcHVfdG9fbGU2NAphbmQg
bGU2NF90b19jcHUgb24gUklTQy1WPyBJdCBzZWVtcyB0aGF0IGl0IHdhcyBjb3BpZWQgZnJvbSBh
YXJjaDY0LgpObyBuZWVkIHRvIHJlc2VuZCB0aGUgUFIgYW55d2F5LCBvZiBjb3Vyc2UuCgo+IFBs
ZWFzZSBwdWxsLgo+Cj4gUGxlYXNlIG5vdGUgdGhhdCBJIHdpbGwgYmUgc2VuZGluZyBhbm90aGVy
IFBSIGZvciA2Ljggd2hpY2ggd2lsbAo+IGluY2x1ZGUgdHdvIG1vcmUgY2hhbmdlczoKPiAxKSBL
Vk0gUklTQy1WIHJlcG9ydCBtb3JlIElTQSBleHRlbnNpb25zIHRocm91Z2ggT05FX1JFRwo+IDIp
IFJJU0MtViBTQkkgdjIuMCBQTVUgaW1wcm92ZW1lbnRzIGFuZCBQZXJmIHNhbXBsaW5nIGluIEtW
TSBndWVzdAo+Cj4gVHdvIHNlcGFyYXRlIFBScyBhcmUgYmVjYXVzZSAjMSAoYWJvdmUpIGRlcGVu
ZHMgb24gYSBzZXJpZXMKPiBtZXJnZWQgYnkgUGFsbWVyIGZvciA2LjggYW5kICMyIChhYm92ZSkg
cmVxdWlyZXMgbGl0dGxlIG1vcmUgdGVzdGluZy4KPiBJIGhvcGUgeW91IGFyZSBva2F5IHdpdGgg
dHdvIHNlcGFyYXRlIFBScyBmb3IgNi44LgoKWWVzLCBzdXJlLiBUaGUgbW9yZSB0aGUgbWVycmll
ci4gOikgIElmIHlvdSB3YW50IHRvIHNlbmQgb25seSAjMSwgdGhhdAptYXkgYmUgYmV0dGVyPwoK
UGFvbG8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
