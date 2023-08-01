Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85ACEEB64DD
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 23:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOGXaD5YLcZ3/nXF9lUSzGOLe53kvXPishuZQcdlAy4=; b=t45r7sSBh1b5wK
	Fl7Bt6UgOtNiH9brFAnfrP0I94I2pQiu+xcne9wWDHZMvT1+a9qfawZg8GifGBC1iUwbbP7gOCH3p
	QrHka1wK6u+CK9cwAc6nbxYrUxvLZQyJDXABPgkbbIFQfoT3fdBT7k629nZfVy7/1ktpvlJXiSeUg
	Eofn0HpV+47c9AFhfzweN0m1Lp4EZruiV+0Mbaq7W46YpwtTxuhB/mCAh1GfEeLycL84xt1JDX2eQ
	Oc1hZvHUW5ulOb7gQ7ezutbc4km2C04Mjn3pz4slr9yKdo5nIgjbxXVgIN7+wqO8YA29AY8yCd+KD
	jJgXtp9Xzwn6RKPf9owQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQyfH-003VXj-23;
	Tue, 01 Aug 2023 23:20:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQyfE-003VXI-2g
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 23:20:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 48E816175D
	for <linux-riscv@lists.infradead.org>; Tue,  1 Aug 2023 23:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6CC0C433C8
	for <linux-riscv@lists.infradead.org>; Tue,  1 Aug 2023 23:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690932027;
	bh=ZOeGcgWaXxL8wuJgurZ4REa3i8T6uB8qhuJywzbdmLA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SPmiaR1yH2dH1mzCRYahn8YlHiWivScDx9PpXotQrLCNxgcRLf9s8PVglkY/PbCS2
	 j2Qy6jwLbDwlkz5I1zVZHhNJuDVCpeaOenYNveo+5RB18Usp8LQ0hEDvh7jQmXrRX4
	 BFskpt+xWSMJtb84SR59FesSFH6IFGUjZseR1Mi4ugXdWcT1FBNBKE81nsFiV8/vXt
	 B34frGrRdJFBxcQ0yBa33BlwBXBTRWYk7MLEw2ZeUZUdwx06iywkDY5Nbo/cO5rotq
	 G8YRxJ6KVsCE5dlH3okgPlzgBUWnS3Z5XzQsTt8Oq1LOqLRMnvsmfcCPJVQa8A4Xgh
	 X9WKSqPtfCxmA==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9891c73e0fbso69214466b.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 16:20:27 -0700 (PDT)
X-Gm-Message-State: ABy/qLYyyEC1l3misgYfQej5dkSDpG+QFTn329DmxsOrjxAipuN3WYhv
	ha/up8541tmZJNVhYqLg6BNUkL9Rk+DfVJ8lOmo=
X-Google-Smtp-Source: APBJJlG2Jz5+Ht3aUrbh9y9w1k/w4uNbdCHSctd/waCLLP2ugvWE7le66rEWjh9fBF03E2qmRF5NOiKj2dOZ3e0GMgk=
X-Received: by 2002:a17:907:961f:b0:988:d841:7f90 with SMTP id
 gb31-20020a170907961f00b00988d8417f90mr4861360ejc.27.1690932025958; Tue, 01
 Aug 2023 16:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230801111014.1432679-1-suagrfillet@gmail.com> <CAHVXubgv1xmH7ZF9WsBQ=hYYk1PpKH5PUmYnSH1QTU-Jg1=xOA@mail.gmail.com>
In-Reply-To: <CAHVXubgv1xmH7ZF9WsBQ=hYYk1PpKH5PUmYnSH1QTU-Jg1=xOA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 1 Aug 2023 19:20:14 -0400
X-Gmail-Original-Message-ID: <CAJF2gTR-OTfbYVZD2uWm4GFOxbva_OpR70tbhYf197bX+yngRQ@mail.gmail.com>
Message-ID: <CAJF2gTR-OTfbYVZD2uWm4GFOxbva_OpR70tbhYf197bX+yngRQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Correct the MODULES_VADDR
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Song Shuai <suagrfillet@gmail.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, akpm@linux-foundation.org, 
	sergey.matyukevich@syntacore.com, david@redhat.com, 
	wangkefeng.wang@huawei.com, panqinglin2020@iscas.ac.cn, 
	woodrow.shen@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_162028_959283_6E9735F6 
X-CRM114-Status: GOOD (  22.13  )
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

T24gVHVlLCBBdWcgMSwgMjAyMyBhdCA4OjA14oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IEhpIFNvbmcsCj4KPiBPbiBUdWUsIEF1ZyAxLCAy
MDIzIGF0IDE6MTDigK9QTSBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+IHdyb3Rl
Ogo+ID4KPiA+IEFzIERvY3VtZW50YXRpb24vcmlzY3Yvdm0tbGF5b3V0LnJzdCBkZXNjcmliZXMs
IHRoZSAyRy1zaXplZCAibW9kdWxlcywgQlBGIgo+ID4gYXJlYSBzaG91bGQgbGllIHJpZ2h0IGJl
Zm9yZSB0aGUgImtlcm5lbCIgYXJlYS4gQnV0IHRoZSBjdXJyZW50IGRlZmluaXRpb24KPiA+IG9m
IE1PRFVMRVNfVkFERFIgaXNuJ3QgY29uc2lzdGVudCB3aXRoIHRoYXQsIHNvIGNvcnJlY3QgaXQu
Cj4gPgo+ID4gQmVmb3JlIHRoaXMgcGF0Y2gsIHRoZSBzaXplIG9mICJtb2R1bGVzIiBmcm9tIHBy
aW50X3ZtX2xheW91dCgpIGlzIG5vdCAyRy4KPiA+Cj4gPiBbICAgIDAuMDAwMDAwXSAgICAgIG1v
ZHVsZXMgOiAweGZmZmZmZmZmMmZmMmYwMDAgLSAweGZmZmZmZmZmYWU2MDAwMDAgKDIwMjIgTUIp
Cj4gPiBbICAgIDAuMDAwMDAwXSAgICAgICBsb3dtZW0gOiAweGZmNjAwMDAwMDAwMDAwMDAgLSAw
eGZmNjAwMDAwNDAwMDAwMDAgKDEwMjQgTUIpCj4gPiBbICAgIDAuMDAwMDAwXSAgICAgICBrZXJu
ZWwgOiAweGZmZmZmZmZmYWU2MDAwMDAgLSAweGZmZmZmZmZmZmZmZmZmZmYgKDEzMDUgTUIpCj4g
Pgo+ID4gQWZ0ZXIgdGhpcyBwYXRjaCwgdGhlIHNpemUgaXMgMkcuCj4gPgo+ID4gWyAgICAwLjAw
MDAwMF0gICAgICBtb2R1bGVzIDogMHhmZmZmZmZmZjNhMDAwMDAwIC0gMHhmZmZmZmZmZmJhMDAw
MDAwICgyMDQ4IE1CKQo+ID4gWyAgICAwLjAwMDAwMF0gICAgICAgbG93bWVtIDogMHhmZjYwMDAw
MDAwMDAwMDAwIC0gMHhmZjYwMDAwMDQwMDAwMDAwICgxMDI0IE1CKQo+ID4gWyAgICAwLjAwMDAw
MF0gICAgICAga2VybmVsIDogMHhmZmZmZmZmZmJhMDAwMDAwIC0gMHhmZmZmZmZmZmZmZmZmZmZm
ICgxMTE5IE1CKQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFNvbmcgU2h1YWkgPHN1YWdyZmlsbGV0
QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5o
IHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiBpbmRleCA3NTk3MGVlMmJkYTIu
LjdjNTdlMTdmYzc1OCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0
YWJsZS5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gQEAg
LTUzLDggKzUzLDggQEAKPiA+ICAjaWZkZWYgQ09ORklHXzY0QklUCj4gPiAgLyogVGhpcyBpcyB1
c2VkIHRvIGRlZmluZSB0aGUgZW5kIG9mIHRoZSBLQVNBTiBzaGFkb3cgcmVnaW9uICovCj4gPiAg
I2RlZmluZSBNT0RVTEVTX0xPV0VTVF9WQUREUiAgIChLRVJORUxfTElOS19BRERSIC0gU1pfMkcp
Cj4gPiAtI2RlZmluZSBNT0RVTEVTX1ZBRERSICAgICAgICAgIChQRk5fQUxJR04oKHVuc2lnbmVk
IGxvbmcpJl9lbmQpIC0gU1pfMkcpCj4gPiAgI2RlZmluZSBNT0RVTEVTX0VORCAgICAgICAgICAg
IChQRk5fQUxJR04oKHVuc2lnbmVkIGxvbmcpJl9zdGFydCkpCj4gPiArI2RlZmluZSBNT0RVTEVT
X1ZBRERSICAgICAgICAgIChNT0RVTEVTX0VORCAtIFNaXzJHKQo+ID4gICNlbmRpZgo+ID4KPiA+
ICAvKgo+ID4gLS0KPiA+IDIuMjAuMQo+ID4KPgo+IFRoZSBkb2N1bWVudGF0aW9uIGlzIGFwcHJv
eGltYXRpdmUsIHRoZSBtb2R1bGVzIG11c3Qgc3RheSB3aXRoaW4gYSAyR0IKPiB3aW5kb3cgdG8g
KmFsbCogdGhlIGtlcm5lbCBzeW1ib2xzLCBoZW5jZSB0aGUgX19lbmQgLSAyRywgbm90IF9fc3Rh
cnQuClRodXMsIHRoZSBmdHJhY2UgZGV0b3VyIHRyYW1wb2xpbmUgY291bGQgY292ZXIgYWxsIGtl
cm5lbCBzeW1ib2xzLgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
