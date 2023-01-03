Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC2BC46467
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 10:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tAnduk/UuVB28nkKp3/Y60oNcPHGWXvK2n/hQ5DraeQ=; b=XVGfBmkhUjcnVl
	OVnsQhAS5ZZxczkDfhBbVrJ9ugpo0yXgmvhn0dZ4gnvGAL/x/PrGiv15VNv/zHveXewIdr5CrnCqz
	ySKvBp8sprTi7YFrsmnmL6SEqhxHYSVIN9Ln8P5UNl8gnu0dx/3HMZyrP+GOEr6TYuOfuRXHmFdO3
	2hZEWP0ZzCxCfgBvQfxyiRVKrOIHkSzOzuErU2K4lJ5RieJSRenxK75vznnnAmEQos69O4mLKIlEO
	u6RsSRYmDEGWAMpJfuKnj3ICpuBc/8xEzMIwTXq7sNf2IQjv4gtdkzZTli9a7x3zSB6CDBj90gj8u
	2VXT2hNGadv0/ozzQZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCeDt-000d6u-FE; Tue, 03 Jan 2023 10:08:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCe5E-000aSJ-VK
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 09:59:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C92A46123F
	for <linux-riscv@lists.infradead.org>; Tue,  3 Jan 2023 09:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0A3C433F2
	for <linux-riscv@lists.infradead.org>; Tue,  3 Jan 2023 09:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672739987;
	bh=K3GNdh0iSKVs4cxHbbMFC6QCnRMk4vyTA2omm3ALejE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s1knHPqbkH7hlnM/m2D9Hj1wBaYLROgZ0vWB17OegTZcHFUhfFTMGjijqVogryHkf
	 PwIYftn7jclRTnQmNvitI578qvf3d8l2U1GW9YCcQ1g0cc1ZxzpIi4uormiWctxVd8
	 4ijcD1hwqub9bvsMEiA65wZb9ZFrV/xupotZCIIzelvY5/dreDDYVrB3jMHTS1fBjP
	 QZo7YCgdHhEly2Qov/UlMKbuL/glPxUYdFUvgclP1agwJDf/3/yQhreMoigbXgkQTN
	 723b29wsh137zszJDNpjRK9aCUcVBx8ErN13PHlVkUx864RMcN5k88znh2jHNTQW7N
	 xCGR9zDycUJLA==
Received: by mail-ej1-f49.google.com with SMTP id u9so72496954ejo.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 01:59:47 -0800 (PST)
X-Gm-Message-State: AFqh2kpwTmX/TFurorNHbBYew/tzAWJwnTK8VWTj6FK60Xym14Zqq30N
	u3L4liGoWW1Eycj+s4fo8Tfc7KS0Ce9yNn3yMqU=
X-Google-Smtp-Source: AMrXdXs6X1KS2ScftLdukmy7fbm+oYnh2kNUOaxOawhAHpBi8S0P7w9c/T56eT42XKAb8tDbpox74vUvReqk46aTokU=
X-Received: by 2002:a17:906:33d4:b0:7c0:f7af:7c5e with SMTP id
 w20-20020a17090633d400b007c0f7af7c5emr2862143eja.406.1672739985408; Tue, 03
 Jan 2023 01:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20230102160748.1307289-1-bjorn@kernel.org>
In-Reply-To: <20230102160748.1307289-1-bjorn@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 3 Jan 2023 17:59:33 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTF9_J__Qk+ppg5c1V+1PeFbZ-xf7DEbo=DXBRpQu1L=A@mail.gmail.com>
Message-ID: <CAJF2gTTF9_J__Qk+ppg5c1V+1PeFbZ-xf7DEbo=DXBRpQu1L=A@mail.gmail.com>
Subject: Re: [PATCH] riscv, kprobes: Stricter c.jr/c.jalr decoding
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_015953_164416_5B61631F 
X-CRM114-Status: GOOD (  19.26  )
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

VGh4IGZvciBjYXRjaGluZyBpdC4KCk9uIFR1ZSwgSmFuIDMsIDIwMjMgYXQgMTI6MDcgQU0gQmrD
tnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBCasO2cm4gVMO2
cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiBJbiB0aGUgY29tcHJlc3NlZCBpbnN0cnVjdGlv
biBleHRlbnNpb24sIGMuanIsIGMuamFsciwgYy5tdiwgYW5kIGMuYWRkCj4gaXMgZW5jb2RlZCB0
aGUgZm9sbG93aW5nIHdheSAoZWFjaCBpbnN0cnVjdGlvbiBpcyAxNmIpOgo+Cj4gLS0tKy0rLS0t
LS0tLS0tLS0rLS0tLS0tLS0tLS0rLS0KPiAxMDAgMCByczFbNDowXSE9MCAgICAgICAwMDAwMCAx
MCA6IGMuanIKPiAxMDAgMSByczFbNDowXSE9MCAgICAgICAwMDAwMCAxMCA6IGMuamFscgo+IDEw
MCAwICByZFs0OjBdIT0wIHJzMls0OjBdIT0wIDEwIDogYy5tdgo+IDEwMCAxICByZFs0OjBdIT0w
IHJzMls0OjBdIT0wIDEwIDogYy5hZGQKWWVzLCBJIGZvcmdvdCB0aGUgYy5tdiAmIGMuYWRkIGVm
ZmVjdC4KClJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCj4KPiBUaGUg
Zm9sbG93aW5nIGxvZ2ljIGlzIHVzZWQgdG8gZGVjb2RlIGMuanIgYW5kIGMuamFscjoKPgo+ICAg
aW5zbiAmIDB4ZjAwNyA9PSAweDgwMDIgPT4gaW5zdHJ1Y3Rpb24gaXMgYW4gYy5qcgo+ICAgaW5z
biAmIDB4ZjAwNyA9PSAweDkwMDIgPT4gaW5zdHJ1Y3Rpb24gaXMgYW4gYy5qYWxyCj4KPiBXaGVu
IDB4ZjAwNyBpcyB1c2VkIHRvIG1hc2sgdGhlIGluc3RydWN0aW9uLCBjLm12IGNhbiBiZSBpbmNv
cnJlY3RseQo+IGRlY29kZWQgYXMgYy5qciwgYW5kIGMuYWRkIGFzIGMuamFsci4KPgo+IENvcnJl
Y3QgdGhlIGRlY29kaW5nIGJ5IGNoYW5naW5nIHRoZSBtYXNrIGZyb20gMHhmMDA3IHRvIDB4ZjA3
Zi4KPgo+IEZpeGVzOiBjMjJiMGJjYjFkZDAgKCJyaXNjdjogQWRkIGtwcm9iZXMgc3VwcG9ydGVk
IikKPiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4g
LS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9zaW11bGF0ZS1pbnNuLmggfCA0ICsrLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvc2ltdWxhdGUtaW5zbi5oIGIvYXJj
aC9yaXNjdi9rZXJuZWwvcHJvYmVzL3NpbXVsYXRlLWluc24uaAo+IGluZGV4IGNiNmZmN2RjY2I5
Mi4uZGU4NDc0MTQ2YTliIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9z
aW11bGF0ZS1pbnNuLmgKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvc2ltdWxhdGUt
aW5zbi5oCj4gQEAgLTMxLDkgKzMxLDkgQEAgX19SSVNDVl9JTlNOX0ZVTkNTKGZlbmNlLCAgICAg
MHg3ZiwgMHgwZik7Cj4gICAgICAgICB9IHdoaWxlICgwKQo+Cj4gIF9fUklTQ1ZfSU5TTl9GVU5D
UyhjX2osICAgICAgICAgICAgICAgIDB4ZTAwMywgMHhhMDAxKTsKPiAtX19SSVNDVl9JTlNOX0ZV
TkNTKGNfanIsICAgICAgIDB4ZjAwNywgMHg4MDAyKTsKPiArX19SSVNDVl9JTlNOX0ZVTkNTKGNf
anIsICAgICAgIDB4ZjA3ZiwgMHg4MDAyKTsKPiAgX19SSVNDVl9JTlNOX0ZVTkNTKGNfamFsLCAg
ICAgIDB4ZTAwMywgMHgyMDAxKTsKPiAtX19SSVNDVl9JTlNOX0ZVTkNTKGNfamFsciwgICAgIDB4
ZjAwNywgMHg5MDAyKTsKPiArX19SSVNDVl9JTlNOX0ZVTkNTKGNfamFsciwgICAgIDB4ZjA3Ziwg
MHg5MDAyKTsKPiAgX19SSVNDVl9JTlNOX0ZVTkNTKGNfYmVxeiwgICAgIDB4ZTAwMywgMHhjMDAx
KTsKPiAgX19SSVNDVl9JTlNOX0ZVTkNTKGNfYm5leiwgICAgIDB4ZTAwMywgMHhlMDAxKTsKPiAg
X19SSVNDVl9JTlNOX0ZVTkNTKGNfZWJyZWFrLCAgIDB4ZmZmZiwgMHg5MDAyKTsKPgo+IGJhc2Ut
Y29tbWl0OiAxYjkyOWMwMmFmZDM3ODcxZDVhZmI5ZDQ5ODQyNmY4MzQzMmU3MWMyCj4gLS0KPiAy
LjM3LjIKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
