Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513B8CA0EDC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 16:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9cb3C7zbtyK0cWZCZVXdzfwlrvNHMG9cqMmj98j+v7U=; b=3KjRCT4vIt56ai
	Yu2LSUnxf6MDYyMTuMYVUZCuHxt9OS4wvbS4xLAZaewCvvZW2Yb2eQeJZEZOs78hj5Le26Sg6MD3u
	1pOP0gjC6J9J3LgIr4nl2WbbLKdhR4H4l4nq6VMsrTZTs1Zd+rB97SEeS4sONB2Rom0NmFXOejuV3
	H+qoTENLWoa/LK2S8TNKopYbjfaKcaydq/m2n5n5gE1rhnT5SMnHj+2QmKgAR87F1toXePBtTo22Y
	vXxbq+E/RYP1mcnrUvXyUiK2rpNOAhFNVtLMrbJ4vciXYj4gMimsxN6YCh3SPvou3zB8mCuMrb1vo
	jGThhYnuYgQt5u0ej2kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolmV-0000000EPqU-2Xwe;
	Wed, 20 Aug 2025 16:35:23 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokEt-0000000EA2X-2r2y
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 14:56:36 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2449978aceaso19768715ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Aug 2025 07:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755701794; x=1756306594; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=moeebx/JYPecP7+5BXDqI16mVoleF3sa2PSk0SopksM=;
        b=KsrvFh8hE+l26EBVJAwWGod1YZ/iSCdkSCYZ9FluawmD+8Ux1TZnpwRwcJBSjzHLxk
         8CHuaZNTkc84vihgHH3FBoiQl8oRUSW81agIEcLz+CAsv7eWHc1AhxBeX/XaoVQgzu9f
         YPen4eI7Ns6q/yGHLEprQ//5e4WotDjcmEZ4zDdTlwjSQABYRBJrIbiNBdJomdIOAefS
         XvufEFEdnUDhZzZrf3f0QX+5VUrig/xD6tJU2f9U7Ha2VsIvTNoJhpbwI7n7KA936qy9
         wkVBU0dFMjLdqXRPRNvCW1EoJw1bDJUjZ7rhtgs5HRomwh0nZV/4rZGn5av3yScgslpo
         nc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755701794; x=1756306594;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=moeebx/JYPecP7+5BXDqI16mVoleF3sa2PSk0SopksM=;
        b=w0WMZfjHPpHZFS1cYMMJVNLD3zFxw5ijHcCIaz8S26mcfUyt6q/Uzmqqg2BVgFr5Op
         PzWlJdvSkjFDx3MeDahuQ1JiGI6UBVX67NqbhoCyGLqS32EkSrTQCYonOdKsAKYBh2f5
         GmLcLwlE4AH6ObLiBVaT95KDAVvRLwCJ+d600jpTThL4S40UEOkcSUmK4D9Vh0DUj2qY
         /CpO9mDnajOLJ/46ER+Eb9bRhgK+Yx41gya8lNUXEm1UPULzucHrNSnRMONuBKpuAL5I
         FbhLIQpqO+MQsQ6CxQdXB8Cz/JY+wZ9v0qhyyVTt8NPXGB4D0Ml8MfDjvrXdeItXyc88
         IXxA==
X-Forwarded-Encrypted: i=1; AJvYcCV2jUfGUILrfu0bduX4SKqankMjzOA2iD/CGrrzJgtJILl1fbPJjz92RqINlnx6SBltf/kAA4WRRWhR+w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6dmg23DxHbaFLdufExgpd650p7SNTenYip3ck4t0y2Tt+prBy
	A0NIYFP/p9rc7G2ynF33E7x/zbMdaRZk22ksTGkTo79mTp57BVmBrORN
X-Gm-Gg: ASbGncv5ICkN6KskCIDHS3aZG5ijnpZloV76ziv6zamkWArb7C8hTDYWoXmCtU4JmD3
	eojg8F/cvnp7AFqo5063jxvY94Grx3q3ZLLri8X0wU0PyIDqf0rTMq+5npC1GeKq3qko/5q80/Q
	e/lZwtAvW0k5sMxEd8hLdTpesRSuf3YDg2HUi4ThpVncxJTeVALABwVEIjobRvs/mZqYZodIbsZ
	4gwFxRNFJvBYCmDv0Po0ld5DPTsBwb1niViW96qjXMnIVfOWNBjn3C90Ezik9TJxfzBtDZGNMEv
	blLZxImB2VCk2sPYxSBbCLK9tLeq6dsfbPUCdjOfkZtNbSyglMmH2NHZz68UvFLbldPiUUPwBPQ
	dUcOQVgHa5Fuus0rPZdY52kkvJoWsjnoP
X-Google-Smtp-Source: AGHT+IFvmJ+PFgyRTv6iBOk9rxDjBEezlxvSGHL//EVCX7uKCA4RaW440nBfEbxK3UBFWSkUHyyBLA==
X-Received: by 2002:a17:903:18a:b0:224:10a2:cae7 with SMTP id d9443c01a7336-245ef25dc0fmr44522095ad.40.1755701794342;
        Wed, 20 Aug 2025 07:56:34 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245f374595fsm19276835ad.105.2025.08.20.07.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 07:56:33 -0700 (PDT)
Date: Wed, 20 Aug 2025 10:56:31 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Vivian Wang <uwu@dram.page>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?QXlkxLFu?= Mercan <aydin@mercan.dev>
Subject: Re: [PATCH 1/6] riscv: Introduce use_alternative_{likely,unlikely}
Message-ID: <aKXiH1eqGliLNb8u@yury>
References: <20250820-riscv-altn-helper-wip-v1-0-c3c626c1f7e6@iscas.ac.cn>
 <20250820-riscv-altn-helper-wip-v1-1-c3c626c1f7e6@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250820-riscv-altn-helper-wip-v1-1-c3c626c1f7e6@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_075635_720328_C57D46E6 
X-CRM114-Status: GOOD (  23.44  )
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

T24gV2VkLCBBdWcgMjAsIDIwMjUgYXQgMDk6NDQ6NDVQTSArMDgwMCwgVml2aWFuIFdhbmcgd3Jv
dGU6Cj4gSW50cm9kdWNlIGNvbnZlbmllbmNlIGhlbHBlcnMgdXNlX2FsdGVybmF0aXZlX2xpa2Vs
eSgpIGFuZAo+IHVzZV9hbHRlcm5hdGl2ZV91bmxpa2VseSgpIHRvIGltcGxlbWVudCB0aGUgcGF0
dGVybiBvZiB1c2luZyBhc20gZ290byB0bwo+IGNoZWNrIGlmIGFuIGFsdGVybmF0aXZlIGlzIHNl
bGVjdGVkLiBFeGlzdGluZyBjb2RlIHdpbGwgYmUgY29udmVydGVkIGluCj4gc3Vic2VxdWVudCBw
YXRjaGVzLgo+IAo+IFNpbWlsYXIgdG8gYXJtNjQgYWx0ZXJuYXRpdmVfaGFzX2NhcF97bGlrZWx5
LHVubGlrZWx5fSwgYnV0IGZvciByaXNjdiwKPiBhbHRlcm5hdGl2ZXMgYXJlIG5vdCBhbGwgQ1BV
IGNhcGFiaWxpdGllcy4KPiAKPiBTdWdnZXN0ZWQtYnk6IEF5ZMSxbiBNZXJjYW4gPGF5ZGluQG1l
cmNhbi5kZXY+Cj4gU2lnbmVkLW9mZi1ieTogVml2aWFuIFdhbmcgPHdhbmdydWlrYW5nQGlzY2Fz
LmFjLmNuPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLW1hY3Jv
cy5oIHwgNzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDczIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9hbHRlcm5hdGl2ZS1tYWNyb3MuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWx0ZXJuYXRp
dmUtbWFjcm9zLmgKPiBpbmRleCAyMzFkNzc3ZDkzNmMyZDI5Yzg1OGRlY2FhOWEzZmE1ZjE3MmVm
YmI4Li5iZTk4MzViNWU0ZWJhMDNkNzZkYjNhNzNkYTE5YWM5ZTI5ODFjNGRiIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWx0ZXJuYXRpdmUtbWFjcm9zLmgKPiArKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLW1hY3Jvcy5oCj4gQEAgLTE1OCw0ICsx
NTgsNzcgQEAKPiAgCV9BTFRFUk5BVElWRV9DRkdfMihvbGRfY29udGVudCwgbmV3X2NvbnRlbnRf
MSwgdmVuZG9yX2lkXzEsIHBhdGNoX2lkXzEsIENPTkZJR19rXzEsCVwKPiAgCQkJCQluZXdfY29u
dGVudF8yLCB2ZW5kb3JfaWRfMiwgcGF0Y2hfaWRfMiwgQ09ORklHX2tfMikKPiAgCj4gKy8qCj4g
KyAqIHVzZV9hbHRlcm5hdGl2ZV97bGlrZWx5LHVubGlrZWx5fSgpIHJldHVybnMgdHJ1ZSBpZiB0
aGUgYWx0ZXJuYXRpdmUgaXMKPiArICogYXBwbGllZCBhbmQgZmFsc2Ugb3RoZXJ3aXNlLCBidXQg
aW4gYSB3YXkgd2hlcmUgdGhlIGNvbXBpbGVyIGNhbiBvcHRpbWl6ZQo+ICsgKiB0aGlzIGNoZWNr
IGRvd24gdG8gYSBub3AgaW5zdHJ1Y3Rpb24gdGhhdCdzIHBhdGNoZWQgaW50byBhIGp1bXAsIG9y
IHZpY2UKPiArICogdmVyc2EuCj4gKyAqCj4gKyAqIEFsd2F5cyByZXR1cm5zIGZhbHNlIGlmIHRo
ZSBhbHRlcm5hdGl2ZXMgbWVjaGFuaXNtIGlzIG5vdCBhdmFpbGFibGUuCj4gKyAqCj4gKyAqIFVz
YWdlIGV4YW1wbGU6Cj4gKyAqICAgaWYgKHVzZV9hbHRlcm5hdGl2ZV9saWtlbHkoMCwgUklTQ1Zf
SVNBX1pCQikpCj4gKyAqCj4gKyAqIFNpbWlsYXIgdG8gc3RhdGljIGtleXMsICJsaWtlbHkiIG1l
YW5zIHVzZSBhIG5vcCBpZiB0aGUgYWx0ZXJuYXRpdmUgaXMKPiArICogc2VsZWN0ZWQsIGFuZCBq
dW1wIGlmIHVuc2VsZWN0ZWQ7ICJ1bmxpa2VseSIgaXMgdGhlIG90aGVyIHdheSBhcm91bmQuCj4g
KyAqLwo+ICsKPiArI2lmbmRlZiBfX0FTU0VNQkxFUl9fCj4gKwo+ICsjaW5jbHVkZSA8bGludXgv
dHlwZXMuaD4KPiArCj4gKyNpZmRlZiBDT05GSUdfUklTQ1ZfQUxURVJOQVRJVkUKPiArCj4gK3N0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCB1c2VfYWx0ZXJuYXRpdmVfbGlrZWx5KHUxNiB2ZW5k
b3JfaWQsIHUzMiBwYXRjaF9pZCkKPiArewo+ICsJQlVJTERfQlVHX09OKCFfX2J1aWx0aW5fY29u
c3RhbnRfcCh2ZW5kb3JfaWQpKTsKPiArCUJVSUxEX0JVR19PTighX19idWlsdGluX2NvbnN0YW50
X3AocGF0Y2hfaWQpKTsKPiArCj4gKwlhc20gZ290byhBTFRFUk5BVElWRSgiaiAlbFtub19hbHRd
IiwgIm5vcCIsICVbdmVuZG9yX2lkXSwgJVtwYXRjaF9pZF0sIDEpCj4gKwkJIDoKPiArCQkgOiBb
dmVuZG9yX2lkXSAiaSIodmVuZG9yX2lkKSwKPiArCQkgICBbcGF0Y2hfaWRdICJpIihwYXRjaF9p
ZCkKPiArCQkgOgo+ICsJCSA6IG5vX2FsdCk7Cj4gKwo+ICsJcmV0dXJuIHRydWU7Cj4gKwo+ICtu
b19hbHQ6Cj4gKwlyZXR1cm4gZmFsc2U7Cj4gK30KCkFwYXJ0IGZyb20gdGhvc2UgQlVJTERfQlVH
X09OKClzLCBpdCBsb29rcyBzaW1pbGFyIHRvCl9fcmlzY3ZfaGFzX2V4dGVuc2lvbl9saWtlbHko
KS4gQ2FuIHlvdSBtYWtlIHN1cmUgeW91IGRvbid0IGR1cGxpY2F0ZQppdD8KCklmIHNvLCBjYW4g
eW91IGRlc2NyaWJlIHdoYXQncyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRob3NlIHR3byBpbiB0
aGUKY29tbWl0IG1lc3NhZ2U/Cgo+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wgdXNlX2Fs
dGVybmF0aXZlX3VubGlrZWx5KHUxNiB2ZW5kb3JfaWQsIHUzMiBwYXRjaF9pZCkKPiArewo+ICsJ
QlVJTERfQlVHX09OKCFfX2J1aWx0aW5fY29uc3RhbnRfcCh2ZW5kb3JfaWQpKTsKPiArCUJVSUxE
X0JVR19PTighX19idWlsdGluX2NvbnN0YW50X3AocGF0Y2hfaWQpKTsKPiArCj4gKwlhc20gZ290
byhBTFRFUk5BVElWRSgibm9wIiwgImogJWxbYWx0XSIsICVbdmVuZG9yX2lkXSwgJVtwYXRjaF9p
ZF0sIDEpCj4gKwkJIDoKPiArCQkgOiBbdmVuZG9yX2lkXSAiaSIodmVuZG9yX2lkKSwKPiArCQkg
ICBbcGF0Y2hfaWRdICJpIihwYXRjaF9pZCkKPiArCQkgOgo+ICsJCSA6IGFsdCk7Cj4gKwo+ICsJ
cmV0dXJuIGZhbHNlOwo+ICsKPiArYWx0Ogo+ICsJcmV0dXJuIHRydWU7Cj4gK30KClRoaXMgJ3Vu
bGlrZWx5JyB2ZXJzaW9uIGlzIGp1c3QgYW4gbmVnYXRpb24gb2YgJ2xpa2VseScgb25lLCBhbmQg
aXQKbG9va3MgbGlrZSBhbiBhdHRlbXB0IHRvIHNhdmUgb24gb25lIG5lZ2F0aW9uLiBPbiB0aGUg
b3RoZXIgaGFuZCwgdGhlCmZ1bmN0aW9uIGlzIF9fYWx3YXlzX2lubGluZSwgd2hpY2ggbWVhbnMg
dGhhdCBjb21waWxlciBzaG91bGQgbm9ybWFsbHkKdGFrZSBjYXJlIG9mIGl0LiBDYW4geW91IHBy
b3ZlIHdpdGggb2JqZHVtcCB0aGF0IGl0IHJlYWxseSB3b3JrcyBhcwppbnRlbmRlZD8gSSBtZWFu
IHRoYXQgCgogICAgICAgIGlmICh1c2VfYWx0ZXJuYXRpdmVfdW5saWtlbHkoKSkKICAgICAgICAg
ICAgICAgIGRvX3NvbWV0aGluZygpOwoKZ2VuZXJhdGVzIGEgYmV0dGVyIGNvZGUgdGhhbiAKICAg
ICAgICAKICAgICAgICBpZiAoIXVzZV9hbHRlcm5hdGl2ZV9saWtlbHkoKSkKICAgICAgICAgICAg
ICAgIGRvX3NvbWV0aGluZygpOwoKVGhhbmtzLApZdXJ5CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
