Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3456BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 00:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=RdUQVkTE+S/AUcqcfVEoj1+99V6IB09r0B23RwRbF8U=; b=zFgPzgLlx6fbvQ9e2r0RnOG8wU
	sogwrWGXeifEGaFV5hDucjpALr6oGn/2BpQi2d8QR+P5AAtAfpik1d4y6/tWMMAqstzQrpR3y7SX2
	u+5uQ+gQI1Dx20kyKeN4P8GQdThmkJijf9DrI7BDO/fraPwOgmB8fmocI5UyweJZ9ffQoGuQ/uub6
	B6soytH0HsdRjsWjNun1oJ5YyzIV+gX9eQe4bguzECPz9sMB5gJ61FIRhiVPlupD/7GAGoL+I44ax
	9A9jUsOEO+heoikeeTQZfhZhYsQmf0IMvXlxsoZPSELJlUT5qoZMDmyGrQnU69u29OToGcsv3Mxcm
	r3kn805g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAL6f-007wAZ-5R; Thu, 20 Jan 2022 00:15:13 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAL6b-007w8c-Vw
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 00:15:11 +0000
Received: by mail-pg1-x534.google.com with SMTP id i8so4090415pgt.13
 for <linux-riscv@lists.infradead.org>; Wed, 19 Jan 2022 16:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=iVoccYTErvqiVX+jKejZcWbLazxCCJAURsVgtJ9k/PI=;
 b=PAmnXcdie90f3pHLFoJF8Vjl+BsEbmFWtI+tTDzryR44DQ55Y3blI77OUyZK+T61pe
 TNsjwFtnJB1LDf1JFK9dHAada4F6ylWH7RCLfDrM9tMy2wo3JmNnaScG/DFcAf6NPaoX
 qUj/oIhvqDOrP0mR4q27k8Nd1wAFqxQ5004gizaU14mV8nukhd+J9abBO4cBbshLzYUb
 8szhyD2JOWMdElmQ/xxhsdHNVBjYtXZCmthm5vxGeOeDn0r+ZJ3z/GXO+SDJhdxql9Nz
 5399e7d+PMMYUV+l802WueHppD9R7k7DV0yD9NWUvEW9ZlpRgl04U8x2jiXdZU00gu9t
 uqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=iVoccYTErvqiVX+jKejZcWbLazxCCJAURsVgtJ9k/PI=;
 b=IMxEo+0ahgoF+NjvQLtlJs7vnulqx7WuCUr3wnqWFZ525LyUUh/pDPl/oYtez0e7P9
 qDby9D9tBBxAi3Qz29aWpGYrnz7Pgxh8AQOHZ3Yoi8bSH0RwnBLZsnYCOwpdoKK0hrBq
 ywnBCTrH1OKc320kdjQ6OFaSehaE0Tu0D/MSIauOPR6x2/9JFZAblN4xMSL7ygSh1AgE
 aPaJdKBCfbMT8w39yqDq0fQK+Zagn6yockdW8jDtn0A0+QzJWlGUVD4Pgah3ClSigSVh
 Mknn5uaBh9NHjYcyXjK3jwyuuaSPVSSh012Eqt6L3WnkKMlxlPLRKF4jz0JyH7BBd4Sp
 On6g==
X-Gm-Message-State: AOAM5307ZCXOLuneIoUZ3VuAR6b3ewnsPN48OSh2aQiTFqlyBWAKyBV5
 zz9Kk11IVgG4RvXWTHU6TefC0w==
X-Google-Smtp-Source: ABdhPJwiZRE6QQn3hTsf9Ovlp1p3FKQUye3GJEcTOnfQDjiRPeGks9QjIA2eVkKW1KI1wj9KiQow/g==
X-Received: by 2002:a63:2210:: with SMTP id i16mr22839905pgi.532.1642637708411; 
 Wed, 19 Jan 2022 16:15:08 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id q17sm708831pfu.158.2022.01.19.16.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 16:15:07 -0800 (PST)
Date: Wed, 19 Jan 2022 16:15:07 -0800 (PST)
X-Google-Original-Date: Wed, 19 Jan 2022 16:14:41 PST (-0800)
Subject: Re: [PATCH] riscv: eliminate unreliable __builtin_frame_address(1)
In-Reply-To: <87tudz5llo.fsf@igel.home>
CC: jrtc27@jrtc27.com, changbin.du@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@linux-m68k.org
Message-ID: <mhng-35c602a8-0eb5-4f07-a94e-ceb5c00e2a36@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_161510_097850_1F97BCFB 
X-CRM114-Status: GOOD (  20.62  )
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

T24gV2VkLCAxOSBKYW4gMjAyMiAxNTo1MzowNyBQU1QgKC0wODAwKSwgc2Nod2FiQGxpbnV4LW02
OGsub3JnIHdyb3RlOgo+IE9uIEphbiAxOSAyMDIyLCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPgo+
PiBXaGF04oCZcyB5b3VyIHBvaW50Pwo+Cj4gTExWTSBkb2Vzbid0IGhhdmUgdG8gZGVhbCB3aXRo
IHRoZSBleHRyYSBjb21wbGV4aXR5Lgo+Cj4+IGRvZXNu4oCZdCBtZWFuIG90aGVyIHRvb2xjaGFp
bnMgdGhhdCBkbyBuZWVkIHRoYXQgdG8gYmUgY29ycmVjdCBzaG91bGQKPj4ganVzdCBkbyBzb21l
dGhpbmcgd3JvbmcuCj4KPiBfX2J1aWx0aW5fZnJhbWVfYWRkcmVzcyB3aXRoIGNvdW50ID4gMCBp
cyBjb25zaWRlcmVkIGJhZC4gIE5vYm9keSBzaG91bGQKPiB1c2UgaXQuCgpUaGUgZG9jdW1lbnRh
dGlvbiBpcyB2ZXJ5IGNsZWFyIGFib3V0IHRoaXMuCgpJIGRvbid0IHJlYWxseSBzZWUgYW55dGhp
bmcgdG8gYXJndWUgYWJvdXQgaGVyZTogb3VyIGNvZGUgdmlvbGF0ZXMgdGhlIApzcGVjIGFuZCBp
cyBwcm9kdWNpbmcgcmVzdWx0cyB3ZSBkb24ndCBsaWtlLCB0aG91Z2ggdGhlIHNwZWMgYWxsb3dz
IGZvciAKbXVjaCB3b3JzZS4gIFdlIHNob3VsZG4ndCBoYXZlIGhhZCB0aGF0IGNvZGUgaW4gdGhl
IGZpcnN0IHBsYWNlLCBidXQgaXQgCnNsaXBwZWQgdGhyb3VnaCBhcyB0aGVzZSB0aGluZ3Mgc29t
ZXRpbWVzIGRvLiAgVGhpcyBpcyBqdXN0IGEgcmVndWxhciAKb2xkIGJ1ZyB0aGF0IGRlc2VydmVz
IHRvIGJlIGZpeGVkLiAgSnVzdCBiZWNhdXNlIG9uZSBjb21waWxlciBwcm9kdWNlcyAKYW5zd2Vy
cyB3ZSBsaWtlIGRvZXNuJ3QgbWVhbiBpdCdzIHZhbGlkIGNvZGUsIHRoYXQncyB0aGUgd2hvbGUg
cG9pbnQgb2YgCmhhdmluZyBhIHNwZWMgaW4gdGhlIGZpcnN0IHBsYWNlLgoKPiBZb3UgZG9uJ3Qg
aGF2ZSB0byBiZSBhcnJvZ2FudC4KClRoaXMgaGFzIGJlZW4gYSBwZXJzaXN0ZW50IHByb2JsZW0s
IGl0J3MgcmVhbGx5IGp1c3Qgbm90IHByb2R1Y3RpdmUuICAKV2UncmUgc3RpbGwgdHJ5aW5nIHRv
IGRpZyBvdXQgZnJvbSB0aGUgbGFzdCB0d28gcm91bmRzIG9mIHNpbGxpbmVzcywgCmxldCdzIG5v
dCBoYXZlIGFub3RoZXIgb25lLgoKSSBkb24ndCBzZWUgYW55dGhpbmcgd3Jvbmcgd2l0aCB0aGUg
cGF0Y2ggaW4gcXVlc3Rpb24sIGJ1dCB0aGVzZSAic3RhY2sgCnRyYWNlIHdpdGhvdXQgZGVidWcg
aW5mbyIgdGhpbmdzIGFyZSBhbHdheXMgdHJpY2t5IGFuZCB0aHVzIHdhcnJhbnQgYSAKcHJvcGVy
IGxvb2suICBJJ20gaW4gdGhlIG1pZGRsZSBvZiBqdWdnbGluZyBzb21lIHBhdGNoZXMgcmlnaHQg
bm93LCBJJ2xsIAp0cnkgdG8gdGFrZSBhIGxvb2sgYnV0IGl0J3MgZmFpcmx5IGZhciBkb3duIHRo
ZSBxdWV1ZS4KCkFsd2F5cyBoYXBweSB0byBoYXZlIGhlbHAgbG9va2luZyB0aGVzZSB0aGluZ3Mg
b3ZlciwgbGV0J3MgdHJ5IHRvIGtlZXAgCnRoaW5ncyBjb25zdHJ1Y3RpdmUsIHRob3VnaC4gIFdl
J3ZlIGFscmVhZHkgZ290IGVub3VnaCB3b3JrIHRvIGRvLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
