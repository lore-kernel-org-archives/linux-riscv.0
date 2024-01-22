Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493AFC47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 10:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4lIQGbEc0/saC0Y1lJr+JauVBMbqZYfwDXmdtfeLeo=; b=3Wp0y5RUz2hmcv
	vtoBAxjJbxz4w8jcz7etV7MqPEJaIm4dQ93HHocJZkwH9H4pxkHmzFjoi8tshkGeRHLGQ2dJvOFlU
	6oHPsqr1HcDvy9LFqA/ODCF587Kavv9rmS8hrwXHCyxwx8/FCM8gVLRNdP9VzEp8qcgdVQfhAye7b
	MiA6NjACYAwdUVPX5hRChR74SJxzRKklsIfvKyEaXLxXH4k2A1vZ2SURTlCf3vCXbfjvp1O4L3KPG
	iweYoNpWW/BcUS8Af2P/IF1s2Q2zyZcx/1zmPBZQRkBcHe83OrXzyqhX7QJLUzER6U2rEUML482A/
	wAU4EejVU4G/K3H3a39A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRs1C-00Bcd0-1s;
	Mon, 22 Jan 2024 10:59:06 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRs1A-00BccB-28
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 10:59:05 +0000
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6ddeb09bc68so1684561a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 02:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705921080; x=1706525880; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyrL3W6llccgMrgGVcBgvlNKkqQHZ86nYnIjTDXIxtE=;
        b=j+xHtaTjg1sPJBBqiiGzXl9OJUNE+evfc3gU3+oCwryD6HPPRFJ8vLEqDl2X86LEHg
         jwJQ/qtIZ9AgRJWT9Dg0dZWzijxXlQDB4jKz3JZ9vXJboY+Lnsi4VKGBpxb4oKHIWKZJ
         6/MaEAJlfLFBM4xFW8/gfQv+IpyqT9my5n9RBFHp9gQbpeFYvI5F92LkpDw2th2jxPHw
         8XxXRSSKLiTxwHWPuQgUrhvFNej8kjox/+aqQsXc+Bp3wgD2GiBJ2ODL0GCEM/MXps12
         ibuqDN9GVzZ1Noq/U6tHKGwe+dfA4/xlRLcftzdEDTFoq6Z42W96lKK1zcitQU9BYzmg
         I2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921080; x=1706525880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JyrL3W6llccgMrgGVcBgvlNKkqQHZ86nYnIjTDXIxtE=;
        b=qVkFUxJ+Y7FmIxeWuf8sKwq9enS91WXCRhBmCWYy6pnmnK4NGFfLpPd+WfHCT8L6tv
         lP9b2LVexwF0Xedv3ZMYadYf4/ObMMO/4bEJolmDmq1Mxw9MEYU6z6JY5kSutRxnBRyt
         XoKGqLtLccL/Xre3T9bFP6wumc09OTmsk3CFEN23q0/mcISlLbPpVHOAEXUrKO3+8B9+
         lm+RZ7Mkyv6mXTt+W/CqPwVje9vdiPU0U3A7lii51HlN0HBjPEfenXXniFmS9Wi1ZET9
         Njl6Bu6Si8zwW759kWFyi2uJ9uvU9s5KoKEmOJ3rxPKU84UaAJyshkCshV5HKru0FL2n
         3+XA==
X-Gm-Message-State: AOJu0Yyji0nNmrSRuIQrt+PvEBqpuQEXb8FDKZRL5GOnpd5EPhi291yo
	RuvgLGxEwIe92ATrtWk1Tk69FvygPMknnUllI4sbWTK9SIqlgaPlSMH+qcoTLeUzWFbPOHvCGEY
	LTn9sBV/VObSyJ4EFVG7PXiJWO1iCidjKGY9TxA==
X-Google-Smtp-Source: AGHT+IH/zbah4ktUS7RBxnUb+QZmXGB6Q0Aw2aF+Gzwvh1cuixikSER5a9dsCCz8OiPNs+wmNhu04fK2CIxYdOaBVuo=
X-Received: by 2002:a05:6870:2112:b0:203:7522:e0db with SMTP id
 f18-20020a056870211200b002037522e0dbmr2055647oae.19.1705921080618; Mon, 22
 Jan 2024 02:58:00 -0800 (PST)
MIME-Version: 1.0
References: <20240122013510.55788-1-cuiyunhui@bytedance.com>
 <20240122-boxcar-conical-c728a709aa5c@spud> <CAEEQ3wmX7_VP-YM9NkesAhd+5zetw79AW9bo0YO7KGAeJX4eRQ@mail.gmail.com>
 <20240122-jawline-handling-e190c90ddcfc@spud>
In-Reply-To: <20240122-jawline-handling-e190c90ddcfc@spud>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 22 Jan 2024 18:57:49 +0800
Message-ID: <CAEEQ3wn3vuPMG_=6skXcXNvnktv767nAENp=wmXoD_MAi7EuPw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: cacheinfo: add init_cache_level()
To: Conor Dooley <conor@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, robh@kernel.org, sudeep.holla@arm.com, 
	pierre.gondois@arm.com, suagrfillet@gmail.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_025904_706108_18D83487 
X-CRM114-Status: GOOD (  14.68  )
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

SGkgQ29ub3IsCgpPbiBNb24sIEphbiAyMiwgMjAyNCBhdCA0OjU14oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSmFuIDIyLCAyMDI0IGF0IDA0
OjMyOjE1UE0gKzA4MDAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiBIaSBDb25vciwKPiA+Cj4gPiBP
biBNb24sIEphbiAyMiwgMjAyNCBhdCA0OjA54oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgMDk6MzU6
MTBBTSArMDgwMCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+ID4gPiBXaGVuIGNhY2hlaW5mb19zeXNm
c19pbml0KCkgaXMgZXhlY3V0ZWQsIHRoZSBnZW5lcmFsIHdlYWsgZnVuY3Rpb24KPiA+ID4gPiBp
bml0X2NhY2hlX2xldmVsKCkgcmV0dXJucyAtRU5PRU5ULCBjYXVzaW5nIGZhaWx1cmUgdG8gYWRk
IHRoZSAiY2FjaGUiCj4gPiA+ID4gbm9kZSB0byAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHV4
Ly4gSW1wbGVtZW50IHRoZSBpbml0X2NhY2hlX2xldmVsKCkKPiA+ID4gPiBmdW5jdGlvbiBvbiBS
SVNDLVYgdG8gZml4IGl0Lgo+ID4gPgo+ID4gPiBJZiB5b3UgcmVjYWxsIGNvcnJlY3RseSwgSSBh
c2tlZCB5b3UgdG8gZXhwbGFpbiBob3cgdG8gcmVwcm9kdWNlIHRoaXMKPiA+ID4gd2hlbiB5b3Ug
c2VudCB0aGUgcGF0Y2guCj4gPgo+ID4gSW4gZmFjdCwgdGhlIHJlYXNvbiBoYXMgYmVlbiBleHBs
YWluZWQgaW4gdGhlIGNvbW1pdCBsb2cuIEFzIGZvciBob3cKPiA+IHRvIHJlcHJvZHVjZSBpdCwg
eW91IGNhbiBjaGVjayB3aGV0aGVyIHRoZXJlIGlzIGEgImNhY2hlIiBub2RlIGluCj4gPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHV4LyBvbiB0aGUgcmlzY3YgcGxhdGZvcm0uCj4KPiBUaGF0
J3MgdGhlIHRoaW5nIC0gSSB0cmllZCB0byByZXByb2R1Y2UgdGhpcyBzZXZlcmFsIHRpbWVzIGFu
ZCBlaXRoZXI6Cj4gYSkgVGhlIHN5c3RlbSBoYWQgY2FjaGUgaW5mb3JtYXRpb24gaW4gRFQgYW5k
IHRoZSBkaXJlY3Rvcnkgd2FzCj4gICAgY3JlYXRlZC4gSWYgSSBob3QgdW5wbHVnZ2VkIGFuZCBy
ZS1wbHVnZ2VkIHRoZSBkaXJlY3Rvcnkgd2FzCj4gICAgcmUtY3JlYXRlZC4KPiBiKSBUaGUgc3lz
dGVtIGhhZCBubyBjYWNoZSBpbmZvcm1hdGlvbiBpbiBEVCBhbmQgdGhlIGRpcmVjdG9yeSB3YXMg
bmV2ZXIKPiAgICBjcmVhdGVkLgoKSW5kZWVkLCBJIHZlcmlmaWVkIGl0IGFnYWluLCBpdOKAmXMg
YmVjYXVzZSB0aGVyZSBpcyBubyBjYWNoZSBub2RlIGluCmR0cywgdGhhbmsgeW91IGZvciByZW1p
bmRpbmcgbWUuCgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
