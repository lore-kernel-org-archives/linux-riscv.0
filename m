Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE6DC5B543
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 03:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utnTxuh7qOwL7AXzOpsK3TSF8i00Q+CFtxzReOjp1mU=; b=wSs+CRDoASwIpz+JnQA2b2ZL2w
	jmdUPfW4d1nzVg5Wt3lcl3OJbaNUIT/3YjJz4MMOKnSyQ8n68R+Pw3iFozNGdTWzXHYnEntnhg+C2
	pK2Cbc7QmP6I+xil49FAaBb3rbs6e6+donjV4F3YlmOd39KGefneB5Mo/Uk10E7mhXLYA13sKFBlV
	ZEGb9WZlnwzGK2HAnVRcVJPRlBkJ2HJR9aWVsIiehf2uQ3ltQ4zUE6Ov1tMPTU5l3rYCXIsMfG3TI
	ozsals+90HbB5CcQU0gnvkoHgpC7Ji/Q+kxiPGUORK1hOcfDdb1vrSkCkzrk/2IbTeSHXgzx8Kmjv
	fZzD67Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMend-0000000CRkn-2j5A;
	Wed, 04 Jun 2025 03:28:21 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcaN-0000000C92T-1Odv
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 01:06:33 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-afc857702d1so4813956a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 18:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748999190; x=1749603990; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LhHMc55NRcsN/FvPE9B87wOrlUj3VF0MtSHgMnAPDz4=;
        b=xrNpbBWwnEL9C9GMRiL85UgX9mTbTyVypsbmkrfXu18MWXQ08REtG8+iK8IEJQ1gBv
         Zr5GO0S/7Lv9yxbSr8aNtNmMvu/eDqqn3zE+6OkZPHa67zUsybUgNu+t1NSPzQikpLpp
         FsEKfa6sfKIUXnS5X6cp8Z9vLsZT6GNw0ygTDH+MiifoK72mf/2UXaXXN85GCR4oHYT9
         TSxTEowjUwvSmKcaOrV8rBMBIPABZLzearbuFSdOfyYVNvqzfQufb6p6RYnW0IlA8Igb
         xBal4vXmUbIH7C22Fy2Fh2Hjv5lqrOkSEgRuwv9FJt0q6CmFONoij2O07qd6uhwGBC9s
         W0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748999190; x=1749603990;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LhHMc55NRcsN/FvPE9B87wOrlUj3VF0MtSHgMnAPDz4=;
        b=F/FS2AGxb7NcXC61e+igHK2ysHg1H4ePOLhpCbJx8brs3Fh+0sdWQxPihFRNzkvtS6
         iGNOo7VJ5os4hux1TAHsHBUjvVHypbzMAmF7nLpsnim6R0hvOQFssxlOTLB9Ygu6NI7L
         LnSIeAx/oAppWUPoMf7RbCb4SuQU3YT77iHz0uLRdlJcL7kQVDjHMtv7UV0ggLEg8xpU
         PvcYS/4ah92lZA2QKE7sgp1CSxosszH/m973b01yyK5tdLYuClTU80arFiHENxA+D0wx
         G1jgVTiAXjD/ujE5qrTYQVTJptZigwCTCLR3vhHRl+30MKFtJUM8ZKYvoJgILgnddjVJ
         6uiA==
X-Forwarded-Encrypted: i=1; AJvYcCWxBsQ3TxgxaaqP1UUT7Ogp777QE5far/Lnm3C2cXeDq77LB8qW7ldmyS61+gzYd0OuCDcOqllHjdf86g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMeFro5qiHiRZwil9BB53tDiXeSgXVantziJcGUAisnetiRfXw
	zSE/2TvRcj5a8cL3Btm9qAlernRta/afzdKim+zdInph0ZmAR6jMUeyX0eDyHKfJ/XC9zDJxXPa
	CwVvn
X-Gm-Gg: ASbGncu5Np9YH9L3fXp3fHxNAQ1VypHxeZhtWDVNZAoVMvDK5wUmGrq9Qf/Ydko9BoT
	2crKuk/0yAWqOwFtprMbhnpL0I3aHCr4TOLk2bCHKrWP7NC03/PVIQcZ1U41yC89tCFepsfNcon
	qHPb5A4Uh5N5gyBQzGRHCn8Y0yL2hyOesv+IjHMooAt1hZwwfUFuW0w3Jrwu8pxMqQiMCei9tFI
	o7Vifpev4MKGNQ1UzNSXNbKlB4x/7iyFE40u2w1GsCUDsLq28MntBGMLLgEvwUw15L+kXBak+LU
	JdgT4lDqtVn//6O7Pjet6BX+SfXbKafAZOXN8SQfV+QG7kVtrbpWzC+qkWoQEA==
X-Google-Smtp-Source: AGHT+IFvTALfjp/Y3ibakB8CWPTcZ35xraSu/LuIlBzY9vBaddLzmcMTcOCjwa9SRy36GVF16/VEAg==
X-Received: by 2002:a17:90a:da87:b0:311:e8cc:4253 with SMTP id 98e67ed59e1d1-3130ccf5106mr1396296a91.2.1748999189904;
        Tue, 03 Jun 2025 18:06:29 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9262sm7890955a91.27.2025.06.03.18.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 18:06:29 -0700 (PDT)
Date: Tue, 3 Jun 2025 18:06:27 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Zong Li <zong.li@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: traps: handle uprobe event in software-check
 exception
Message-ID: <aD-cE9IGrV6nOUjX@debug.ba.rivosinc.com>
References: <20250314092614.27372-1-zong.li@sifive.com>
 <aD3WKnyp_ffk60oF@debug.ba.rivosinc.com>
 <CANXhq0r8DeksFQC2ht8jeLpfn-0Tvuy4LU52BOMAj-AAB83+5A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0r8DeksFQC2ht8jeLpfn-0Tvuy4LU52BOMAj-AAB83+5A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_180631_612226_22A2C8BA 
X-CRM114-Status: GOOD (  20.84  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMDMsIDIwMjUgYXQgMDk6NDg6MDhBTSArMDgwMCwgWm9uZyBMaSB3cm90ZToK
Pk9uIFR1ZSwgSnVuIDMsIDIwMjUgYXQgMTI6NTDigK9BTSBEZWVwYWsgR3VwdGEgPGRlYnVnQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4+Cj4+IEhpIFpvbmcsCj4+Cj4+IFRoYW5rcyBmb3IgdGFraW5n
IHRoZSBpbml0aWF0aXZlIGZvciBtYWtpbmcgY2ZpIHdvcmsgd2l0aCB1cHJvYmUuCj4+IEFuZCBz
b3JyeSBmb3Igbm90IG5vdGljaW5nIHRoZSBwYXRjaCBlYXJsaWVyLgo+PiBGZXcgY29tbWVudHMg
aW5saW5lLgo+Pgo+Pgo+PiBPbiBGcmksIE1hciAxNCwgMjAyNSBhdCAwNToyNjoxNFBNICswODAw
LCBab25nIExpIHdyb3RlOgo+PiA+SGFuZGxlIHRoZSB1cHJvYmUgZXZlbnQgZmlyc3QgYmVmb3Jl
IGhhbmRsaW5nIHRoZSBDRkkgdmlvbGF0aW9uIGluCj4+ID5zb2Z0d2FyZS1jaGVjayBleGNlcHRp
b24gaGFuZGxlci4gQmVjYXVzZSB3aGVuIHRoZSBsYW5kaW5nIHBhZCBpcwo+PiA+YWN0aXZhdGVk
LCBpZiB0aGUgdXByb2JlIHBvaW50IGlzIHNldCBhdCB0aGUgbHBhZCBpbnN0cnVjdGlvbiBhdAo+
PiA+dGhlIGJlZ2lubmluZyBvZiBhIGZ1bmN0aW9uLCB0aGUgc3lzdGVtIHRyaWdnZXJzIGEgc29m
dHdhcmUtY2hlY2sKPj4gPmV4Y2VwdGlvbiBpbnN0ZWFkIG9mIGFuIGVicmVhayBleGNlcHRpb24g
ZHVlIHRvIHRoZSBleGNlcHRpb24KPj4gPnByaW9yaXR5LCB0aGVuIHVwcm9iZSBjYW4ndCB3b3Jr
IHN1Y2Nlc3NmdWxseS4KPj4gPgo+PiA+Q28tZGV2ZWxvcGVkLWJ5OiBEZWVwYWsgR3VwdGEgPGRl
YnVnQHJpdm9zaW5jLmNvbT4KPj4gPlNpZ25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdA
cml2b3NpbmMuY29tPgo+PiA+U2lnbmVkLW9mZi1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUu
Y29tPgo+PiA+LS0tCj4+ID4KPj4gPlRoaXMgcGF0Y2ggaXMgYmFzZWQgb24gdG9wIG9mIHRoZSBm
b2xsb3dpbmcgc2VyaWVzCj4+ID5bUEFUQ0ggdjExIDAwLzI3XSByaXNjdiBjb250cm9sLWZsb3cg
aW50ZWdyaXR5IGZvciB1c2VybW9kZQo+PiA+Cj4+ID4gYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMu
YyB8IDkgKysrKysrLS0tCj4+ID4gMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPj4gPgo+PiA+ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4+ID5pbmRleCAzZjc3MDlmNDU5NWEuLmVm
NWE5MjExMWVlMSAxMDA2NDQKPj4gPi0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPj4g
PisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPj4gPkBAIC0zODYsOSArMzg2LDEyIEBA
IGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9zb2Z0d2Fy
ZV9jaGVjayhzdHJ1Y3QgcHRfcmVncyAqCj4+ID4gICAgICAgaWYgKHVzZXJfbW9kZShyZWdzKSkg
ewo+PiA+ICAgICAgICAgICAgICAgaXJxZW50cnlfZW50ZXJfZnJvbV91c2VyX21vZGUocmVncyk7
Cj4+ID4KPj4gPi0gICAgICAgICAgICAgIC8qIG5vdCBhIGNmaSB2aW9sYXRpb24sIHRoZW4gbWVy
Z2UgaW50byBmbG93IG9mIHVua25vd24gdHJhcCBoYW5kbGVyICovCj4+ID4tICAgICAgICAgICAg
ICBpZiAoIWhhbmRsZV91c2VyX2NmaV92aW9sYXRpb24ocmVncykpCj4+ID4tICAgICAgICAgICAg
ICAgICAgICAgIGRvX3RyYXBfdW5rbm93bihyZWdzKTsKPj4gPisgICAgICAgICAgICAgIC8qIGhh
bmRsZSB1cHJvYmUgZXZlbnQgZnJpc3QgKi8KPj4gPisgICAgICAgICAgICAgIGlmICghcHJvYmVf
YnJlYWtwb2ludF9oYW5kbGVyKHJlZ3MpKSB7Cj4+Cj4+IElmIHRhc2sgaGFzIHVwcm9iZSBlbmFi
bGVkIGFuZCB0aGVyZSBpcyBhIGNmaSB2aW9sYXRpb24gZHVlIHRvIG1pc21hdGNoIGluCj4+IHJl
dHVybiBhZGRyZXNzIG9uIHNoYWRvdyBzdGFjayBhbmQgcmVndWxhciBzdGFjaywgdGhlbiBpdCB3
b3VsZCBiZSBhIGNmaQo+PiBieXBhc3MsIHJpZ2h0Pwo+PiBQZXJoYXBzIHdlIHNob3VsZCBiZSBk
b2luZyB0aGlzIG9ubHkgd2hlbiB3ZSBtYXRjaCB0aGF0IHN3IGNoZWNrIGV4Y2VwdGlvbgo+PiBp
cyBkdWUgdG8gZm9yd2FyZCBjZmkgdmlvbGF0aW9uPwo+Pgo+PiBEbyB5b3UgYWdyZWU/Cj4KPlll
cywgbGV0IG1lIGFkZCBhIGNvbmRpdGlvbiBmb3IgZm9yd2FyZCBjZmkgdmlvbGF0aW9uIGhlcmUu
IFRoYW5rcyBmb3IKPnBvaW50aW5nIGl0IG91dC4KCkNvb2wsIEknbGwgc2VuZCBvdXQgYW5vdGhl
ciByZXZpc2lvbiBmb3IgbXkgY2ZpIHNlcmllcyB0aGlzIHdlZWsuCklmIHlvdSBzZW5kIG91dCB5
b3VyIHVwcm9iZSBmaXgsIEkgY2FuIGluY2x1ZGUgaXQgaW4gbXkgcGF0Y2hzZXQuCgo+Cj4+Cj4+
ID4rICAgICAgICAgICAgICAgICAgICAgIC8qIG5vdCBhIGNmaSB2aW9sYXRpb24sIHRoZW4gbWVy
Z2UgaW50byBmbG93IG9mIHVua25vd24gdHJhcCBoYW5kbGVyICovCj4+ID4rICAgICAgICAgICAg
ICAgICAgICAgIGlmICghaGFuZGxlX3VzZXJfY2ZpX3Zpb2xhdGlvbihyZWdzKSkKPj4gPisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBkb190cmFwX3Vua25vd24ocmVncyk7Cj4+ID4rICAg
ICAgICAgICAgICB9Cj4+ID4KPj4gPiAgICAgICAgICAgICAgIGlycWVudHJ5X2V4aXRfdG9fdXNl
cl9tb2RlKHJlZ3MpOwo+PiA+ICAgICAgIH0gZWxzZSB7Cj4+ID4tLQo+PiA+Mi4xNy4xCj4+ID4K
Pj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4g
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
