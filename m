Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2530C2BBCA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 03:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rfw2ind/bOgle0N4plVedT0VYtSENRHf5K0kh3zYEbc=; b=XoWO/q3QhvmmPO
	fTZNJrh6surtQakYge+zAZ3PHxmXN4UUl6w7Yw4UqV7Q+cTy3u+vMXcJGJjqYR/5gUbKaT3IMv213
	cXRcoICgs5hdPm8okPbXZ0fHGraAnKYDUf/9vniTQ7It1s+RLPyGR4OHuMPkuSD+IpBicaupboMj1
	8kelWefJvzY4qTNQxGX/yTYnmkB3Lkn08dvlf4aUiF7FeRsiJzVbgxguqJiCG8NolcTix059ZZ3MG
	9/YQddJSYmrEBEUHxdcndflrFFWye3aJbONMeEjE4VpMVGYE7UsmR51gG8A+uzQRcC41H3aPTeB1+
	fS7BFaWhMJs8HOCQGyIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKUWa-00000007VcV-2wJC;
	Fri, 21 Jun 2024 03:01:16 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKUWX-00000007Vbt-3U5x
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 03:01:15 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6f980c89db8so806947a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2024 20:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718938872; x=1719543672; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhH4UzFO6eCWAfNDZXl4qF39oiAH3m5hA5swtcyFl4o=;
        b=Fnmj+l1i/6WndsfYVF54+N+zwVJZtLQ98Q82pIw54229dTA2W0BEVapJAtPADLYpH8
         yWTPWXQV53ihlTm21Z7S5EVPNBtd1lPzTheGnAieUZR8LShNLYZ+O3VCRWu6IOGraa/l
         nXAyHY8cPmBgRLXc9ACiCsW8ClmmNSjO7OHKyDoZ9qt98Bo9BP7SXGz5DxEOp9vvVBVR
         nRffF1r7apMqldwAAKDnKyxiMPyieQ3qWsRfvh4rETQeRycq03EOG6mFRpNUxI2MgNcY
         Z07Ub3VP/wbFgdUxjW1BxYjx8dLKOPbAKdLX2iFPkDiMJfnVlDPzedVvM/B/20tuzRMs
         G7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718938872; x=1719543672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhH4UzFO6eCWAfNDZXl4qF39oiAH3m5hA5swtcyFl4o=;
        b=rFtR7EnLtjhMT5QEPpRbkR7p/k22ayVgnggr/DBPVWTFO0Xh1iRCNXTcFqXr5kXZ/k
         iQQYg6HJN17vHQL08mZFLghTA6KakX6GXka8C8w3EDRnPYX456De8nD2gfk/REwsFVen
         1QU/TGOcf86SVQDHQLDwJABp0Kk3zTtmVIebcdq9V8ci91TFLbwskkRXTYCRcY2xNnAo
         DIK37+175vvyvB7na+SB2yEdyFLKHCZf9uDqJKawnrE7b14ff3uJ7sQ25QbiC1cReZo4
         zW5sqFDuiSKudh22mzoRbzFF5RAobf/YsLS5aqenWMbGBhbOd/X4C6mUw85g+/bKGNyy
         L9qg==
X-Forwarded-Encrypted: i=1; AJvYcCXFSXx1KdVPHjKuDe5GU5IDIrkIkr+g3U9CZGOH5GD84dMalD/q7xXpcpo04dtqCMVVHB5Da46/jS4nYDiOdUplGr3J36/YK8rtHBOXtjov
X-Gm-Message-State: AOJu0YzXRegMsl10ziuXAAPDwJvOj5KvLB2sm4vccJw2waWDmM22PsW1
	8/Sq2L4/mOhS9PySpFmUv3uDGSl02GEJuHRuExcus1+24+h1iwL3BCJKDKeYxblCjLpVd8yUzaF
	vnUZ9qhtX94vib6Mcog6EEQWUOpLRSG9vHnY17g==
X-Google-Smtp-Source: AGHT+IGyFusLAIbhi8rnMuNWECpZj7QZvd3djKvKk4GFt8o8t2VKFxpjQUmUU64qgidV9DbQZc3wAs4aLywxdskKhs8=
X-Received: by 2002:a05:6870:970e:b0:24c:b80e:ee1b with SMTP id
 586e51a60fabf-25c94d70a03mr8284877fac.50.1718938871743; Thu, 20 Jun 2024
 20:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240618114653.12485-1-cuiyunhui@bytedance.com>
 <2BA519C8-D258-4D98-AD49-AC7D30D8B0D2@jrtc27.com> <3c20c9f15cd7a9fb1f2e88560c1b089ac8032898.camel@icenowy.me>
In-Reply-To: <3c20c9f15cd7a9fb1f2e88560c1b089ac8032898.camel@icenowy.me>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 21 Jun 2024 11:01:00 +0800
Message-ID: <CAEEQ3w=HZptMOgXp2Rtuz-VtzPabN=h5N3=3wS4AMk3Lo7E7FQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: Provide the frequency of mtime via hwprobe
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, costa.shul@redhat.com, 
	Andy Chiu <andy.chiu@sifive.com>, samitolvanen@google.com, linux-doc@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_200114_133098_99F81E00 
X-CRM114-Status: GOOD (  15.14  )
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

SGkgSWNlbm93eSwKCk9uIFdlZCwgSnVuIDE5LCAyMDI0IGF0IDc6NTHigK9BTSBJY2Vub3d5IFpo
ZW5nIDx1d3VAaWNlbm93eS5tZT4gd3JvdGU6Cj4KPiDlnKggMjAyNC0wNi0xOOaYn+acn+S6jOea
hCAxODoxMSArMDEwMO+8jEplc3NpY2EgQ2xhcmtl5YaZ6YGT77yaCj4gPiBPbiAxOCBKdW4gMjAy
NCwgYXQgMTI6NDYsIFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToK
PiA+ID4KPiA+ID4gRnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4g
PiA+Cj4gPiA+IEEgaGFuZGZ1bCBvZiB1c2VyLXZpc2libGUgYmVoYXZpb3IgaXMgYmFzZWQgb24g
dGhlIGZyZXF1ZW5jeSBvZiB0aGUKPiA+ID4gbWFjaGluZS1tb2RlIHRpbWUuCj4gPiA+Cj4gPiA+
IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+
Cj4gPiBJIHdvdWxkIHN1Z2dlc3QgcmVmZXJyaW5nIHRvIHRoZSB1c2VyLW1vZGUgQ1NSIGluc3Rl
YWQsIGkuZS4g4oCcdGltZeKAnQo+ID4gcmF0aGVyIHRoYW4g4oCcbXRpbWXigJ0gdGhyb3VnaG91
dCBpbiBuYW1lcyBhbmQgZGVzY3JpcHRpb25zLCBzaW5jZQo+ID4gdGhhdOKAmXMKPiA+IHRoZSB0
aGluZyB0aGF0IHVzZXItbW9kZSBzb2Z0d2FyZSBpcyBhY3R1YWxseSByZWFkaW5nIGZyb20uCj4K
PiBBZ3JlZS4gTVRJTUUgaXNuJ3QgZXZlbiBhIHRoaW5nIGRlZmluZWQgaW4gUklTQy1WIElTQSAt
LSBpdCdzIHBhcnQgb2YKPiB0aGUgQUNMSU5UIHRpbWVyIHNwZWMsIGJ1dCBiZWZvcmUgQUNMSU5U
IGdldHMgd2lkZWx5IGFjY2VwdGVkLCBpdCdzCj4ganVzdCBzb21lIFNpRml2ZSB0aGluZyB0aGF0
IGdvdCBjb3BpZWQgYnkgbWFueSBvdGhlciB2ZW5kb3JzIChhbmQKPiB2ZW5kb3JzIHN1Y2ggYXMg
VC1IZWFkIGV2ZW4gcHJvdmlkZXMgQ0xJTlQgdy9vIE1USU1FIHJlZ2lzdGVyICh3ZWxsCj4gYmVj
YXVzZSB0aGVzZSBULUhlYWQgY29yZXMgaGF2ZSByZWZlcmVuY2Ugc291cmNlIGNvZGUgYXZhaWxh
YmxlLCB0aGlzCj4gaXMgYmVjYXVzZSBvZiB0aGVpciBDUFUgZGVzaWduIHVzZXMgYW4gZXh0ZXJu
YWwgY291bnRlciBmZWQgYXMgVElNRQo+IHJlZ2lzdGVyKSkuCgpPa2F5LCBUaGFua3MgZm9yIHlv
dXIgc3VnZ2VzdGlvbnMsICBJIHRoaW5rIHRoaXMgbW9kaWZpY2F0aW9uIGlzIG1vcmUKYXBwcm9w
cmlhdGU6CgpSSVNDLVY6IFByb3ZpZGUgdGhlIGZyZXF1ZW5jeSBvZiB0aW1lIGNvdW50ZXIgdmlh
IGh3cHJvYmUKCkEgaGFuZGZ1bCBvZiB1c2VyLXZpc2libGUgYmVoYXZpb3IgaXMgYmFzZWQgb24g
dGhlIGZyZXF1ZW5jeSBvZiB0aGUKdGltZSBjb3VudGVyLgoKV2hhdCBkbyB5b3UgdGhpbmsgPwoK
Pgo+ID4KPiA+IEplc3MKPiA+Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4gbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+CgpUaGFua3MsCll1bmh1aQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
