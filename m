Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97BDC9830D
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 06:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FvQdb1D4f9i1qaDf/h50F0YL1hUOd6j1zJltpP7Fkgc=; b=mL74BfALm27swC
	6592cuLgnRbwMFxQ9cm8pvUz3Pyx4h5bQDq2e3kmmkieslAaPLqQLVqiT89xCCjkJChhUuOwUThIz
	kwqrOzFlyodX8Iy30yYUGd3qG+I9xbyzBTKuq7yn98ZYbJ42JHzF5aFOhKK+BBE3+TZ9c78gEa7lK
	qsNFFFkLmjEjHZh0QUOVpljFUA9tmRsiYNJApkzSCzNnu9tXmRWxGVxfOpzkZo4NBgIWKsnEsiCZa
	IEWNTobqvXQnyjqPkKggfCNqHldjnV/iNj9Qh8PJA8m+fInBRhbivko8V3WWnflX+0EjlxVrFVMPM
	R1nrxo60+SnnXCD4pL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zJn-0000000Ck2S-0gBx;
	Fri, 25 Sep 2026 06:21:59 +0000
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zJl-0000000Ck1n-0WU3
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 06:21:58 +0000
Received: by mail-dy2-x10.google.com with SMTP id 5a478bee46e88-33be7dfcfc1so682025eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 23:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790317315; x=1790922115; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=peRJubAzt5CBA3DlGa/amJu9ZBZekocmcGMZ2nqjKzw=;
        b=BStfM6EGFUc0AgebSMImm4GzOD7xZRXdRYt/IPQAHJWMhh4wrOhS4kiSvzIrdBgzu1
         ZEgs3FwgFYChkMDnRFs/W4BFJjMgApnBJtE7Ve69oBcdHAIH/iHb7a5jK4EojBoBz/bj
         SWJrqfogcbjZfw7ao/wam9yZNk3n2brbQlgFyO0wHjKQ3aexQBpufKdQUlLZceVjNkkW
         lSD8yy4lNFwajWzpQk6Y0dIRp94eJHorK6EuZO4W7SRrBUTue5ecWKNAf+0fnQOoQdo2
         FeKFQ6YHYmoR6fmhciDHpN5TQmy3CvhvvO5e5xjF/omXB7ie6Q/BOc5AwkJ0swQnHh5q
         a6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790317315; x=1790922115;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=peRJubAzt5CBA3DlGa/amJu9ZBZekocmcGMZ2nqjKzw=;
        b=K8zTS+eoRMqW1mECl1wUeYNnRryq8dfgTI8OqiK0N2k+f+c1yYgJbTHar0YE3Lkl9/
         Ib/S87jx3LZpOvUuxmuuQqRov0U2cHIPZk8Anqdkh8X92mr29IVNroxkqx95y4bEYgfj
         kaBmxHIVQnOoO5cDwteg4A2u4cBBfMT8XkUw+XO0qT6KYboOmgNlPpLaQfB/F4Dr/uek
         lBQhX087p5I37laDC4JzyCgBEa6RD2aiT4AFZ+zS84f4oRq9Tpyhm9SwbDoBg9Emx2qx
         Yo3PFOtr04r77zhekUBQFIQtr73Fs1tF2GTmRYzXNFg2Fn/58JhErs8pr13ElMPa0iR0
         AsxA==
X-Forwarded-Encrypted: i=1; AKwUvBxWNa/ykeMiy0RbBQR4f5Tcs9OAtFKj8tcZAbMMaIwvAV/CLH8cDU8GQJSWIoycuC/2WI9lBFEg8MQomA==@lists.infradead.org
X-Gm-Message-State: AFuF++l/tx+qb1cNUv4iJ1yTwOfInLwd4642Ryzhq3pd+T7hw7rVLghC
	qCT4uv2GER2ZGvoxjfUaa6RrJEATZvKR1DX7dZ2gWGJ0/R0kTMr5EPmJ
X-Gm-Gg: AYBFou2+I2I13KeK1b4fHDhN2Yk9B+DyzOZnZupf+5deqm8zqEcEDYf03gRYSrq3Gs4
	9U0COKKARTuDed3xp8d2jNs1q6AY1kMNVWkVsjvD8AoZil3+JYRZvp3udyG47VNNFboyYFNtweb
	mk/Yy2PbkgiCCdHgrCtqEBB4GXjxVHHy21Ly0FC4YmbXXo5xJOKJy4johV7/qrtPwSJJitN3Y4x
	4/6WkbHBIoKWxRbzu98hdjjwMGW8UwctJIwSJTC7jtdzg+kbG5gJJNNF0caUvUupA0yfifqlcwn
	b6jU/z5s9F/Vw/JK/M4niGJlDAN0xJVpLX3qPHHHd19jCn/HVJyO7VgfUT7DrenK5hHCqaAJVHy
	BZLjz4Nf9FC7RrUXpTvTTId1NHTDOb4Yp3J59L7kjioenXMPiOsRbhcP5b2fnYkxLdYY797NERq
	goB2yAHwRrlgFlcrhbSy0S+yvdat8K/FBkWXWGNk7MA2dko0kSWCVW6GlLkmNf2ML3QrVcf7s83
	bYXTc6cnjJuIYtN3ifVrnxbTftVe4jY9hp9b7lhwOcy
X-Received: by 2002:a05:7300:dd47:b0:342:94b:aa28 with SMTP id 5a478bee46e88-342095b08cemr188044eec.27.1790317315073;
        Thu, 24 Sep 2026 23:21:55 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172de6sm5598126eec.9.2026.09.24.23.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:21:54 -0700 (PDT)
Date: Fri, 25 Sep 2026 11:51:33 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com, 
	sshegde@linux.ibm.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, jszhang@kernel.org, japo@linux.ibm.com, 
	peterz@infradead.org, jpoimboe@kernel.org, seanjc@google.com, pmladek@suse.com, 
	thuth@redhat.com, ynorov@nvidia.com, joelagnelf@nvidia.com, david@davidgow.net, 
	fujita.tomonori@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RFC] rust: kernel: Add KUnit tests for ARCH_WARN_ASM bug table
 emission
Message-ID: <arYR4GrzNnFko7XO@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260922054959.955093-2-mkchauras@gmail.com>
 <arUYLsJJewE--wqo@J2N7QTR9R3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <arUYLsJJewE--wqo@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_232157_170175_1849582A 
X-CRM114-Status: GOOD (  17.50  )
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

T24gVGh1LCBTZXAgMjQsIDIwMjYgYXQgMDE6MzE6NDJQTSArMDEwMCwgTWFyayBSdXRsYW5kIHdy
b3RlOgo+IE9uIFR1ZSwgU2VwIDIyLCAyMDI2IGF0IDExOjIwOjAwQU0gKzA1MzAsIE11a2VzaCBL
dW1hciBDaGF1cmFzaXlhIChJQk0pIHdyb3RlOgo+ID4gVmVyaWZ5IHRoYXQgdGhlIF9fYnVnX3Rh
YmxlIGVudHJ5IGVtaXR0ZWQgYnkgQVJDSF9XQVJOX0FTTSBoYXMgYSBjb3JyZWN0Cj4gPiBidWdf
YWRkciBkaXNwbGFjZW1lbnQg4oCUIGkuZS4gdGhlIGFyY2gncyB0cmFwIGxhYmVsIHJlZmVyZW5j
ZSByZXNvbHZlcyB0bwo+ID4gdGhlIHRyYXAgaW5zdHJ1Y3Rpb24g4oCUIGJ5IGNhbGxpbmcgZmlu
ZF9idWcoKSB3aXRoIHRoZSBleGFjdCB2aXJ0dWFsIGFkZHJlc3MKPiA+IG9mIHRoZSB0cmFwLCBt
aXJyb3Jpbmcgd2hhdCB0aGUgcmVhbCB0cmFwIGhhbmRsZXIgZG9lcy4KPiA+IAo+ID4gVG8gc3Vw
cG9ydCBhbGwgYXJjaGl0ZWN0dXJlcywgZWFjaCBhcmNoIHRoYXQgaW1wbGVtZW50cyBBUkNIX1dB
Uk5fQVNNIG5vdwo+ID4gZGVmaW5lcyBBUkNIX1dBUk5fQVNNX1RSQVBfTEFCRUwsIGEgc3RyaW5n
IGNvbnN0YW50IG5hbWluZyB0aGUgbG9jYWwgbGFiZWwKPiA+IGF0IHdoaWNoIHRoZSB0cmFwIGlu
c3RydWN0aW9uIGlzIHBsYWNlZDoKPiA+IAo+ID4gICB4ODYgICAgICAgIjEiICAgICAodWQyIGF0
IGxhYmVsIDE6KQo+ID4gICBwb3dlcnBjICAgIjEiICAgICAodHdpIGF0IGxhYmVsIDE6KQo+ID4g
ICByaXNjdiAgICAgIjEiICAgICAoZWJyZWFrIGF0IGxhYmVsIDE6KQo+ID4gICBhcm02NCAgICAg
IjE0NDcxIiAoYnJrIHBsYWNlZCBhdCAxNDQ3MTogYnkgX19CVUdfRU5UUllfRU5EKQo+ID4gICBz
MzkwICAgICAgIjAiICAgICAobWMgYXQgbGFiZWwgMDopCj4gCj4gSSdtIG5vdCBhIGZhbiBvZiBl
eHBvc2luZyBzdWNoIGEgbG93LWxldmVsIGltcGxlbWVudGF0aW9uIGRldGFpbCBvdXQgb2YKPiB0
aGUgYXJjaGl0ZWN0dXJlIGNvZGUsIGFuZCBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBleHBvc2Ug
dGhpcy4KPiAKPiBXaGF0IGV4YWN0bHkgYXJlIHlvdSB0cnlpbmcgdG8gdmVyaWZ5IGhlcmUsIGFu
ZCB3aHk/IEhhcyB0aGVyZSBiZWVuCj4gc29tZSBfc3BlY2lmaWNfIGlzc3VlIG9uIHBvd2VycGMg
dGhhdCBjYXVzZWQgeW91IHRvIGxvb2sgYXQgdGhpcz8KPiAKPiBNYXJrLgoKSGV5IE1hcmssCgpE
dXJpbmcgaW1wbGVtZW50aW5nIEFSQ0hfV0FSTl9BU00gZm9yIHJ1c3QgSSBicm9rZSB0aGUgYnVn
IGVudHJ5IGZvcgpwb3dlcnBjIHNvIEkgd3JvdGUgdGhpcyB0byB2ZXJpZnkuIEkgc2VudCBpdCBv
dXQgbWFpbmx5IGZvciBwcGMgYnV0CmZldyBwZW9wbGUgd2FudGVkIHRoYXQgaWYgaXQgbmVlZGVk
IGl0IHNob3VsZCBiZSBkb25lIGZvciBhbGwgYXJjaHMuClNvIHNlcGFyYXRlZCB0aGlzIHRoaW5n
IGFuZCBzZW50IGl0IG91dCBhcyBhbiBSRkMgdG8gY2hlY2sgd2hldGhlcgpvdGhlciBhcmNocyB3
YW50IHRoaXMgb3Igbm90LgoKUmVnYXJkcywKTXVrZXNoCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
