Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA983C25B79
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 07:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpO2DuRdlswqkbSCD/5O6frYxSPiqapqbLVi1t7it6g=; b=h9jkueL9LErGdYr9o+hhzsNGQc
	rL6ENOg4LmfB4EwwR5UflH198wT1wf9xjblKn3aPzq+vDtA8PrfIrxpbw4t83YGGkPZwMKRGo2Ke7
	pqhdDLv8ZwTdQm04sUGSaEjShnXzRBpkcpe+DQM6OkWr2RU1iFgyhh1L8i6jiawnIlicyMV4g4aVI
	c480Li8RbAuBdayZ5bzlwcpoA/gaZnhnWGHCqmfICb2chrSQUf1l2NXHF3r8Xn4zOLCma7POSgtXu
	bTjDRmtN2N1vsQuVZ8H1z0/hJSQI92bisPtI1LvZzCqVzRfk/SctNNqDg8bSzzNLfYafDH5E4ihr/
	kmpm5/4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAPAN-00000008F7h-0ale;
	Fri, 24 May 2024 07:16:39 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAPAJ-00000008F6l-3zh6
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 07:16:37 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2be00b445c2so727378a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 00:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716534992; x=1717139792; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G5b7QgiVlAzfw1l+FA1jhqowDIFfn6XCF4+Yt8iGQO0=;
        b=Xz6OOIcDPcxv3s+qnYv5IIzc0qoBRGrc8doeAqUFoIEphcw6uayxJIsGSItbdW1YJc
         kz7p3P/KSWnxEN7KAe0IqK6rddytbyttEZaPlSJ5NSiPpWtAMotianzUNurZmN27YPXR
         xdaRyabUrA148jUrV1Dd45DOrK0EZPspJWSggkRHMiWhTGqSkhO/6flK/lAOn5/f9ROK
         WModTl3oVGVkuagHUwOqY/6fIO8mSaCEqyPenoFCFH6nNDuBWUEShf7cWj1g9H118tJ5
         1WIAkgqm5kvWkAenO6bOVwEtZJWHeopHwpd04VVHsQKSX73TSlLJ40enrmHDu/Bn6LzC
         NkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716534992; x=1717139792;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G5b7QgiVlAzfw1l+FA1jhqowDIFfn6XCF4+Yt8iGQO0=;
        b=EK2IBUlPSWHJhIkdEc5cMwaQKOb0qYwFPKjfjjeUiORmZPZpMmoydphygyQaX8QPpL
         PBKhfO99YuRO+dBDFybfcXazBgvuJJKfWOabST+3eQL7aYE8dDszN3Yte9RfkCbZ6pkw
         b/XkeFxlDyHvW4ugzBYlak4kknG+QLs5QmOYgo1btYUZ7m2hGpro0azjswCfUDrO2hXC
         mTDHcypdjyJrPL01wAy5hZg5FxSJQWc6dK4LPctDPnjKBcF1Ngsk7pU58eO5jrSZeIdO
         0ksRZl3Zs4wmWNMWtP6YIpCtPqAbHA08CqG4Bx6t9jrZRH3/AOuuxTuHO1cw//MM7zfc
         fgsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmbSguu/UO9HT8xit/627wSMArjUKJHc86uTh+O1/ZIcyFN+W5HKN98nWlFfd4W0jEnR7oMWfJ9CaLmi69X2CP4//y2C8OgdpbPLUzKQ41
X-Gm-Message-State: AOJu0YwEd8tQ9q/WZtGyhzUpq500oiirU60y0UiygiuObt5fkEl6J0db
	FHVeXCCOdeTGdwNoEMCAnEtlKlGQvxipBAD2b3bFIw8LK3EvUir4m3LYeBoPPl4=
X-Google-Smtp-Source: AGHT+IEDTqTA76mWXJ68mdGF74fNSFi0v4c+GSsV/TK7Kq0h+0BnWlexLZoWy2cb8clnmvmHxGdpVw==
X-Received: by 2002:a17:90a:ec12:b0:2bf:5992:31ae with SMTP id 98e67ed59e1d1-2bf5ee1cb71mr1385379a91.20.1716534992281;
        Fri, 24 May 2024 00:16:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bf5f9b28dcsm742083a91.52.2024.05.24.00.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 00:16:31 -0700 (PDT)
Date: Fri, 24 May 2024 00:16:27 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com, broonie@kernel.org,
	Szabolcs.Nagy@arm.com, kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	cleger@rivosinc.com, atishp@atishpatra.org, bjorn@rivosinc.com,
	samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	charlie@rivosinc.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, dbarboza@ventanamicro.com,
	sameo@rivosinc.com, shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 13/29] riscv mmu: write protect and shadow stack
Message-ID: <ZlA+yxsiHtyUJ/5/@debug.ba.rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-14-debug@rivosinc.com>
 <276fa17b-cd62-433d-b0ec-fa98c65a46ca@ghiti.fr>
 <ZkJOs6ENmDHFsq/U@debug.ba.rivosinc.com>
 <CAHVXubhS3CJ87DxC+9+8z6CiWDV1bQ8nK+iOZUDvMiT7vszFLA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHVXubhS3CJ87DxC+9+8z6CiWDV1bQ8nK+iOZUDvMiT7vszFLA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_001636_135346_7EC1C115 
X-CRM114-Status: GOOD (  22.86  )
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

T24gVGh1LCBNYXkgMjMsIDIwMjQgYXQgMDQ6NTk6MzBQTSArMDIwMCwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+SGkgRGVlcGFrLAo+Cj5PbiBNb24sIE1heSAxMywgMjAyNCBhdCA3OjMy4oCvUE0g
RGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+IHdyb3RlOgo+Pgo+PiBPbiBTdW4sIE1h
eSAxMiwgMjAyNCBhdCAwNjozMToyNFBNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+
ID5PbiAwNC8wNC8yMDI0IDAxOjM1LCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4+ID4+YGZvcmtgIGlt
cGxlbWVudHMgY29weSBvbiB3cml0ZSAoQ09XKSBieSBtYWtpbmcgcGFnZXMgcmVhZG9ubHkgaW4g
Y2hpbGQKPj4gPj5hbmQgcGFyZW50IGJvdGguCj4+ID4+Cj4+ID4+cHRlcF9zZXRfd3Jwcm90ZWN0
IGFuZCBwdGVfd3Jwcm90ZWN0IGNsZWFycyBfUEFHRV9XUklURSBpbiBQVEUuCj4+ID4+QXNzdW1w
dGlvbiBpcyB0aGF0IHBhZ2UgaXMgcmVhZGFibGUgYW5kIG9uIGZhdWx0IGNvcHkgb24gd3JpdGUg
aGFwcGVucy4KPj4gPj4KPj4gPj5UbyBpbXBsZW1lbnQgQ09XIG9uIHN1Y2ggcGFnZXMsCj4+ID4K
Pj4gPgo+PiA+SSBndWVzcyB5b3UgbWVhbiAic2hhZG93IHN0YWNrIHBhZ2VzIiBoZXJlLgo+Pgo+
PiBZZXMgSSBtZWFudCBzaGFkb3cgc3RhY2sgcGFnZXMuIFdpbGwgZml4IHRoZSBtZXNzYWdlLgo+
Pgo+PiA+Cj4+ID4KPj4gPj4gIGNsZWFyaW5nIHVwIFcgYml0IG1ha2VzIHRoZW0gWFdSID0gMDAw
Lgo+PiA+PlRoaXMgd2lsbCByZXN1bHQgaW4gd3JvbmcgUFRFIHNldHRpbmcgd2hpY2ggc2F5cyBu
byBwZXJtcyBidXQgVj0xIGFuZCBQRk4KPj4gPj5maWVsZCBwb2ludGluZyB0byBmaW5hbCBwYWdl
LiBJbnN0ZWFkIGRlc2lyZWQgYmVoYXZpb3IgaXMgdG8gdHVybiBpdCBpbnRvCj4+ID4+YSByZWFk
YWJsZSBwYWdlLCB0YWtlIGFuIGFjY2VzcyAobG9hZC9zdG9yZSkgZmF1bHQgb24gc3NwdXNoL3Nz
cG9wCj4+ID4+KHNoYWRvdyBzdGFjaykgYW5kIHRoZW4gcGVyZm9ybSBDT1cgb24gc3VjaCBwYWdl
cy4KPj4gPj5UaGlzIHdheSByZWd1bGFyIHJlYWRzCj4+ID4+d291bGQgc3RpbGwgYmUgYWxsb3dl
ZCBhbmQgbm90IGxlYWQgdG8gQ09XIG1haW50YWluaW5nIGN1cnJlbnQgYmVoYXZpb3IKPj4gPj5v
ZiBDT1cgb24gbm9uLXNoYWRvdyBzdGFjayBidXQgd3JpdGVhYmxlIG1lbW9yeS4KPj4gPj4KPj4g
Pj5PbiB0aGUgb3RoZXIgaGFuZCBpdCBkb2Vzbid0IGludGVyZmVyZSB3aXRoIGV4aXN0aW5nIENP
VyBmb3IgcmVhZC13cml0ZQo+PiA+Pm1lbW9yeS4gQXNzdW1wdGlvbiBpcyBhbHdheXMgdGhhdCBf
UEFHRV9SRUFEIG11c3QgaGF2ZSBiZWVuIHNldCBhbmQgdGh1cwo+PiA+PnNldHRpbmcgX1BBR0Vf
UkVBRCBpcyBoYXJtbGVzcy4KPj4gPj4KPj4gPj5TaWduZWQtb2ZmLWJ5OiBEZWVwYWsgR3VwdGEg
PGRlYnVnQHJpdm9zaW5jLmNvbT4KPj4gPj4tLS0KPj4gPj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGd0YWJsZS5oIHwgMTIgKysrKysrKysrKy0tCj4+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4gPj4KPj4gPj5kaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Bn
dGFibGUuaAo+PiA+PmluZGV4IDliODM3MjM5ZDNlOC4uN2ExYzJhOThkMjcyIDEwMDY0NAo+PiA+
Pi0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+ID4+KysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPj4gPj5AQCAtMzk4LDcgKzM5OCw3IEBAIHN0YXRp
YyBpbmxpbmUgaW50IHB0ZV9zcGVjaWFsKHB0ZV90IHB0ZSkKPj4gPj4gIHN0YXRpYyBpbmxpbmUg
cHRlX3QgcHRlX3dycHJvdGVjdChwdGVfdCBwdGUpCj4+ID4+ICB7Cj4+ID4+LSAgICAgcmV0dXJu
IF9fcHRlKHB0ZV92YWwocHRlKSAmIH4oX1BBR0VfV1JJVEUpKTsKPj4gPj4rICAgICByZXR1cm4g
X19wdGUoKHB0ZV92YWwocHRlKSAmIH4oX1BBR0VfV1JJVEUpKSB8IChfUEFHRV9SRUFEKSk7Cj4+
ID4+ICB9Cj4+ID4+ICAvKiBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9ta3JlYWQocHRlX3QgcHRl
KSAqLwo+PiA+PkBAIC01ODEsNyArNTgxLDE1IEBAIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlcF9n
ZXRfYW5kX2NsZWFyKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+PiA+PiAgc3RhdGljIGlubGluZSB2
b2lkIHB0ZXBfc2V0X3dycHJvdGVjdChzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPj4gPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFkZHJlc3MsIHB0ZV90
ICpwdGVwKQo+PiA+PiAgewo+PiA+Pi0gICAgIGF0b21pY19sb25nX2FuZCh+KHVuc2lnbmVkIGxv
bmcpX1BBR0VfV1JJVEUsIChhdG9taWNfbG9uZ190ICopcHRlcCk7Cj4+ID4+KyAgICAgdm9sYXRp
bGUgcHRlX3QgcmVhZF9wdGUgPSAqcHRlcDsKPgo+U29ycnkgSSBtaXNzZWQgdGhpcyBeLiBZb3Ug
bmVlZCB0byB1c2UgcHRlcF9nZXQoKSB0byBnZXQgdGhlIHZhbHVlIG9mCj5hIHB0ZS4gCgpOb3Rl
ZC4gd2lsbCBmaXggaXQuCgo+QW5kIHdoeSBkbyB5b3UgbmVlZCB0aGUgdm9sYXRpbGUgaGVyZT8K
CkkgZG9uJ3QgcmVtZW1iZXIgdGhlIHJlYXNvbi4gSXQncyBwcm9iYWJseSBub3QgbmVlZGVkIGhl
cmUuCkJ1dCBJIGFtIHN1cmUgSSB3YXMgZGVidWdnaW5nIHNvbWV0aGluZyBhbmQgdHJ5aW5nIGV2
ZXJ5dGhpbmcuCkFuZCB0aGlzIHByb2JhYmx5IHNsaXBwZWQgc2FuaXRpemF0aW9uIGJlZm9yZSBz
ZW5kaW5nIHBhdGNoZXMuCgpXaWxsIGZpeCBpdC4KPgo+PiA+PisgICAgIC8qCj4+ID4+KyAgICAg
ICogcHRlcF9zZXRfd3Jwcm90ZWN0IGNhbiBiZSBjYWxsZWQgZm9yIHNoYWRvdyBzdGFjayByYW5n
ZXMgdG9vLgo+PiA+PisgICAgICAqIHNoYWRvdyBzdGFjayBtZW1vcnkgaXMgWFdSID0gMDEwIGFu
ZCB0aHVzIGNsZWFyaW5nIF9QQUdFX1dSSVRFIHdpbGwgbGVhZCB0bwo+PiA+PisgICAgICAqIGVu
Y29kaW5nIDAwMGIgd2hpY2ggaXMgd3JvbmcgZW5jb2Rpbmcgd2l0aCBWID0gMS4gVGhpcyBzaG91
bGQgbGVhZCB0byBwYWdlIGZhdWx0Cj4+ID4+KyAgICAgICogYnV0IHdlIGRvbnQgd2FudCB0aGlz
IHdyb25nIGNvbmZpZ3VyYXRpb24gdG8gYmUgc2V0IGluIHBhZ2UgdGFibGVzLgo+PiA+PisgICAg
ICAqLwo+PiA+PisgICAgIGF0b21pY19sb25nX3NldCgoYXRvbWljX2xvbmdfdCAqKXB0ZXAsCj4+
ID4+KyAgICAgICAgICAgICAgICAgICAgICgocHRlX3ZhbChyZWFkX3B0ZSkgJiB+KHVuc2lnbmVk
IGxvbmcpX1BBR0VfV1JJVEUpIHwgX1BBR0VfUkVBRCkpOwo+PiA+PiAgfQo+PiA+PiAgI2RlZmlu
ZSBfX0hBVkVfQVJDSF9QVEVQX0NMRUFSX1lPVU5HX0ZMVVNICj4+ID4KPj4gPgo+PiA+RG9lc24n
dCBtYWtpbmcgdGhlIHNoYWRvdyBzdGFjayBwYWdlIHJlYWRhYmxlIGFsbG93ICJub3JtYWwiIGxv
YWRzIHRvCj4+ID5hY2Nlc3MgdGhlIHBhZ2U/IElmIGl0IGRvZXMsIGlzbid0IHRoYXQgYW4gaXNz
dWUgKHNlY3VyaXR5LXdpc2UpPwo+Pgo+PiBXaGVuIHNoYWRvdyBzdGFjayBwZXJtaXNzaW9ucyBh
cmUgdGhlcmUgKGkuZS4gUj0wLCBXPTEsIFg9MCksIHRoZW4gYWxzbyBzaGFkb3cgc3RhY2sgaXMK
Pj4gcmVhZGFibGUgdGhyb3VnaCAibm9ybWFsIiBsb2Fkcy4gU28gbm90aGluZyBjaGFuZ2VzIHdo
ZW4gaXQgY29udmVydHMgaW50byBhIHJlYWRvbmx5IHBhZ2UKPj4gZnJvbSBwYWdlIHBlcm1pc3Np
b25zIHBlcnNwZWN0aXZlLgo+Pgo+PiBTZWN1cml0eS13aXNlIGl0J3Mgbm90IGEgY29uY2VybiBi
ZWNhdXNlIGZyb20gdGhyZWF0IG1vZGVsaW5nIHBlcnNwZWN0aXZlLCBpZiBhdHRhY2tlciBoYWQK
Pj4gcmVhZC13cml0ZSBwcmltaXRpdmVzICh2aWEgc29tZSBidWcgaW4gcHJvZ3JhbSkgYXZhaWxh
YmxlIHRvIHJlYWQgYW5kIHdyaXRlIGFkZHJlc3Mgc3BhY2UKPj4gb2YgcHJvY2Vzcy90YXNrOyB0
aGVuIHRoZXkgd291bGQgaGF2ZSBhdmFpbGlibGl0eSBvZiByZXR1cm4gYWRkcmVzc2VzIG9uIG5v
cm1hbCBzdGFjay4gSXQncwo+PiB0aGUgd3JpdGUgcHJpbWl0aXZlIHRoYXQgaXMgY29uY2Vybmlu
ZyBhbmQgdG8gYmUgcHJvdGVjdGVkIGFnYWluc3QuIEFuZCB0aGF0J3Mgd2h5IHNoYWRvdyBzdGFj
awo+PiBpcyBub3Qgd3JpdGVhYmxlIHVzaW5nICJub3JtYWwiIHN0b3Jlcy4KPj4KPj4gPgo+Cj5U
aGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbiEKPgo+V2l0aCB0aGUgdXNlIG9mIHB0ZXBfZ2V0KCks
IHlvdSBjYW4gYWRkOgo+Cj5SZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlA
cml2b3NpbmMuY29tPgo+Cj5UaGFua3MsCj4KPkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
