Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E99C54798
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 23:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=425tpzxyyK70Sczb1xr6/teOb4zoYaCEDyOY3mz9us8=; b=YUXGKNFPQztY4P
	I7MvogZU90DWqAy4RbhvZ1h9MPDPX11y0nOlWJH9urSihGriRglwEs9msN2x3AzKKqYZjgYUnv1SB
	UTCI5mXUVpmDC2G1LbboYgjiu+1rbA3AOrIqpdf5+0AvLI8trbYYyPpp1uCbr9HOMFSqTeolhnYtO
	SQzkRMhC9OjZvAmQjPIf9i6txUEZtuXiQibJgEC283TGZoiJ60XsxwKaFlPecG3Su7VOwZxFR+V+z
	YrgXIy3mwu7UhbKzll45yTJQ4ewBRC3zPgl2iOwbH0xwQFfWqI85aFSwutqE0XNiMKBSBWN3xGK5Q
	nHj1UA0Ts9IaQE+3vIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rheHZ-0000000FcuU-0jPx;
	Tue, 05 Mar 2024 23:33:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rheHW-0000000Fctc-3hVT
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 23:33:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 071C9CE1F35
	for <linux-riscv@lists.infradead.org>; Tue,  5 Mar 2024 23:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BA3C433A6
	for <linux-riscv@lists.infradead.org>; Tue,  5 Mar 2024 23:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709681588;
	bh=GV6QSpr73nKx1N3kC+/YquZZJlDLkT+Jyggf5X8nB3Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JgYxooaukiQEv8kYAhZ+k9R8UPYFemzDg9fAoHRgAWYGUcpXyU1+0KI/RpXc+Wt18
	 3F4Awz3IHeC0YUcWMUaH5tOb10oE6Iqfx414SIizqoMIlTZshp8ToueLWjwXSUsY1e
	 3JNaLJK04BnTkufqmL0zpKBD67RXsmrMV7w4gWfS8X1sB3aGQI4S6V9r1nbNRHDeED
	 o+PQI5uL7uQcXY+DXbgtue9YJkDss6K8jh2J+BDDwCGlIRzo6hIEEZ52Xyg1n0GhVv
	 ynS003qguSKk1STR18zuBq5E0+apqIGy4k9IrdanUhAaCZgJTw1Qr8lIH+1Mch9tUX
	 L+z+NQ8hP43/g==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-567bac94719so956818a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Mar 2024 15:33:08 -0800 (PST)
X-Gm-Message-State: AOJu0YzVnTmMXvrVWq2gF2BzWcy/etH0voqw/4aGeVmS50hTAHwBt+2L
	Bsku0yz719zwKvNGpwOPFIuLCSWUalnPR9GUpZgoxGBpkL2JSdPsGuKE+mWp3G4GlhxFh93gaOv
	LqRxtrB7p6cSFuQtuSeuOog33l28=
X-Google-Smtp-Source: AGHT+IE4oE/82RTc1ckiCxung2i51spLqqwA1a4EnF/Ui8gBzt85uDUwF69igN7hEQLgRa4LJ4A4X/hQUKRWKBRJujQ=
X-Received: by 2002:a50:d585:0:b0:566:5dcc:1c27 with SMTP id
 v5-20020a50d585000000b005665dcc1c27mr8605222edi.41.1709681586660; Tue, 05 Mar
 2024 15:33:06 -0800 (PST)
MIME-Version: 1.0
References: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com> <tencent_8E66E30C9FBB60BB36B9230E2E56CC770806@qq.com>
In-Reply-To: <tencent_8E66E30C9FBB60BB36B9230E2E56CC770806@qq.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 6 Mar 2024 07:32:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS2cif-6+oym48yCM3zqifpdsnXavtuo81T6rFYkMi4ZA@mail.gmail.com>
Message-ID: <CAJF2gTS2cif-6+oym48yCM3zqifpdsnXavtuo81T6rFYkMi4ZA@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] riscv: config: enable ARCH_CANAAN in defconfig
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_153311_122053_0906D136 
X-CRM114-Status: GOOD (  13.10  )
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

T24gV2VkLCBNYXIgNiwgMjAyNCBhdCA0OjAz4oCvQU0gWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxm
Lm5hbWU+IHdyb3RlOgo+Cj4gU2luY2UgSzIzMCBoYXMgYmVlbiBzdXBwb3J0ZWQsIGFsbG93IEFS
Q0hfQ0FOQUFOIHRvIGJlIHNlbGVjdGVkIHRvIGJ1aWxkIGR0Cj4gYW5kIGRyaXZlcnMgZm9yIGl0
IGluIGRlZmNvbmZpZy4KPgo+IFNpZ25lZC1vZmYtYnk6IFlhbmd5dSBDaGVuIDxjeXlAY3l5c2Vs
Zi5uYW1lPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2NvbmZpZ3MvZGVmY29uZmlnIHwgMSArCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
Y29uZmlncy9kZWZjb25maWcgYi9hcmNoL3Jpc2N2L2NvbmZpZ3MvZGVmY29uZmlnCj4gaW5kZXgg
ODlhMDA5YTU4MGZlLi5mODlkZjdkZGI1NDMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9jb25m
aWdzL2RlZmNvbmZpZwo+ICsrKyBiL2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcKPiBAQCAt
MzMsNiArMzMsNyBAQCBDT05GSUdfU09DX1NUQVJGSVZFPXkKPiAgQ09ORklHX0FSQ0hfU1VOWEk9
eQo+ICBDT05GSUdfQVJDSF9USEVBRD15Cj4gIENPTkZJR19TT0NfVklSVD15Cj4gK0NPTkZJR19B
UkNIX0NBTkFBTj15Cj4gIENPTkZJR19TTVA9eQo+ICBDT05GSUdfSE9UUExVR19DUFU9eQo+ICBD
T05GSUdfUE09eQo+IC0tCj4gMi40My4wCj4KUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBr
ZXJuZWwub3JnPgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
