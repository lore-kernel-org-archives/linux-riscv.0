Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02202C7115C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 09:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UVaH1lW5WAi3CXp7pY8nKr1g9u0j1AHudWlOvAPpXAM=; b=aF2ZSW2RO5ID1S
	rTVP3qldojtvlr1M7FggsWDr/dDakrFcDLSQR8hP38gMcOyHGKNo2UXSRm9ql8VcZzxCifquUD3Ug
	aa8tUvKWWdg5g+G0+SIMoC0/QSUnEOAT5HhXYU4vEvUe+sY79J0ulQU7KF941RbLkSDi6PCYz5SiG
	TzU3MPe3n8o1u+9icyjin6qbTE4shjliWRNo2Eszgn/r+K+UM4ygAON6OobbM4dcB+AD+VB9Dx7dk
	9Arxq9qaNWl529bvceKdv6f3OoPqyjo0d5BmfhVoeXucN/WahhBmmIrewdMdiRONUNGzgDlmNevbZ
	cvMbY+UcuW2SqXmD1L2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMDY-000000085ju-1847;
	Wed, 25 Jun 2025 09:14:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULaI-00000007yHL-1Bsu
	for linux-riscv@bombadil.infradead.org;
	Wed, 25 Jun 2025 08:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RzsHE0Dm+vaKIDZxCmSo57hINCBe8Wa9oOmgUaoD+0o=; b=F9WIGcj3nLiACDj0tVo/fCPzVj
	mFnTO1Ycv7OVw1xNVRdj1moaT6HDI3mXePFYMlwK1qGV3/y0VogAKILYFvpjfR3KqSGc6rqai6an+
	JasgjHUT6voG5Q/x80867kaYbCZRd2YOcGEBLS7F7UCsCbkG/DSdyzHBEf51ixXnWaFjVyJT2pQ0Q
	BV7A7HwRfyPZPZ3845KAUZcVqwxgFLbZZZiYNDkSGJoL9skdbsrFIKqhgsDmf8+d0LblDzdjv1tEL
	+Clph2Bbn3XDJvzcRF2LdWLVS0GQR/p9ZnFslGlCyhNw3GyxTYxGUiBTvjr2Iwwlw/S/lIzGxUV2S
	ZTt/351w==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULaF-00000005gzU-2hHm
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 08:34:21 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so1253092f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 01:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750840457; x=1751445257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzsHE0Dm+vaKIDZxCmSo57hINCBe8Wa9oOmgUaoD+0o=;
        b=HhelVktHBQtkdlnuWTfY4rgZ8SlSgO27Ra88XtCz2JiH6J9teDn+ugGlmJnt4iY7yL
         qiGdyT08PlnwbpnAQBe86fg6wdgiXn85w3zRX1dna+zbyY7LclPlS9AdQA8cTfmT8xrq
         dfngltqnVfUw99G/Oz+QhfaqJidWd5oaTQLvBZSSgQnQ4F9+NSJZGcY8vqYv6mg2MHZu
         cNI/XwT9GmzU3ECGl43Zo2nTgGN+fIn/VfoGQNN8vHxgJ+iHTuc28FpbX5EDdBJTGdwT
         VzIQmbdT2TVUa4mkFVbDQ3RpJOcHSOclAEeAAaFnMndbs41FDZKgwDaVSvAp/iyU5h4W
         ezcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750840457; x=1751445257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzsHE0Dm+vaKIDZxCmSo57hINCBe8Wa9oOmgUaoD+0o=;
        b=IuNYLKT+shZP/7MtQpnjV9WDaFeVZeAEGHbSIb0mWctUy5LPqNvsceq8oMmKaL9Uy6
         gWrkew3AZ4WdFARGkL6n0E8shWDdjjgmTLjeyqTnxgujmfZu1/cg4f0iy+rgUMHgghDb
         qNNXuDf+fajhk5NqEoxeYltWcwnJC15kOwIvNvxnWyMvnO2ulS2gK/C4E983kceesflo
         5ZoJAHlSzj7iq6JOztBONbbPToRLwrawnI0cShTRSjHjiH+CT4+3XpSNZdcx10KJVXrn
         bY2V95xITGn/fya5cKPM5vI9R050rr8ebJa9sDm1KmLS5mANx35jP1ebyGkQCLLd3h4r
         77qQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+4Ki8jlhtwjdkUu6Acv/uKrfdRL9Un1Hiypp/C/IPQPtUyPmDoKKlYouBV6+e2M2l0TK7zNhiBIGQ/g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2WB8OR5ovy8eVV+1FQM1NH2fsntYKXD2BbZSqSwOWcouBAApo
	uMVPnmFtmk5b65sYaB3tcrTVXsupQBhuYdSq8TTRz72XtyZwHB6Du1mVo1roUg==
X-Gm-Gg: ASbGnctQu/739iNcEq2hyRQ8AWSwWSEHITKIR8DZWK6MkatWafBxmIAn3k6RT8max2a
	6+Wjo8Q6LuY8orjtQ4Nlq3io5KCedXBlo54wBbltJfa1ST0G1/H6n7do/Yh9lZmIMWaRaD9zK3S
	9akDHwvi06ESz9hcOacRGHrqkJPp2MeYjlx2XucwdMapq+PWAkmZEeQjWmFxRRJE3XTHju8/KVL
	A3AZ2oyg5mCe/zuzWhX3FTGCja1e5wqilNLZTlwgKH8ro7vNvfweVN/ZUDaYncvi8ooZYlkfEUM
	8LK3bATUV4n8dBaoAmBXtS62rE8EF2+BqodQY94+BGIehleycIB9HOjOL7BqgPxDNW4M2F9RtoE
	y9gnIhcn88jLSGqSuHdmtPxew
X-Google-Smtp-Source: AGHT+IG4iG1MpnnxD3c0z3g1108nyY/UfjDrLLLTyFBsEARnqSoXsXoPNJxtt7ch3KoKN+2Mq6N5Pw==
X-Received: by 2002:a05:6000:1449:b0:3a4:dbac:2dc1 with SMTP id ffacd0b85a97d-3a6ed6506a3mr1622991f8f.54.1750840456547;
        Wed, 25 Jun 2025 01:34:16 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538238198asm12803765e9.39.2025.06.25.01.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 01:34:16 -0700 (PDT)
Date: Wed, 25 Jun 2025 09:34:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Atish Patra" <atishp@rivosinc.com>,
 <ajones@ventanamicro.com>, <cleger@rivosinc.com>,
 <apatel@ventanamicro.com>, <thomas.weissschuh@linutronix.de>, "Jeff Law"
 <jlaw@ventanamicro.com>
Subject: Re: [PATCH v2 3/2] RISC-V: sbi: remove sbi_ecall tracepoints
Message-ID: <20250625093415.53fd21cf@pumpkin>
In-Reply-To: <DAVG8M70SJ4Q.ZSTC5VSJWGSK@ventanamicro.com>
References: <20250619190315.2603194-4-rkrcmar@ventanamicro.com>
	<mhng-516082EA-5A9A-4A76-9448-70828749F95F@palmerdabbelt-mac>
	<DAUSD38QIV6D.1YO5ASNI3EUGV@ventanamicro.com>
	<DAVG8M70SJ4Q.ZSTC5VSJWGSK@ventanamicro.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_093419_862940_42056465 
X-CRM114-Status: GOOD (  10.19  )
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

T24gV2VkLCAyNSBKdW4gMjAyNSAwOTo1MTo0NSArMDIwMApSYWRpbSBLcsSNbcOhxZkgPHJrcmNt
YXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cgo+IDIwMjUtMDYtMjRUMTU6MDk6MDkrMDI6MDAs
IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPjoKPiA+IEZvciBhbm90
aGVyIGV4YW1wbGUsIGxldCdzIGhhdmUgdGhlIGZvbGxvd2luZyBmdW5jdGlvbjoKPiA+Cj4gPiAg
IHN0cnVjdCBzYmlyZXQgc29tZV9zYmlfZWNhbGwodWludHB0cl90IGEwLCB1aW50cHRyX3QgYTEp
Cj4gPiAgIHsKPiA+ICAgICByZXR1cm4gc2JpX2VjYWxsKDEyMywgNDU2LCBhMCwgYTEpOwo+ID4g
ICB9Cj4gPgouLi4KPiAKPiBHQ0MgMTUuMSBzdGlsbCBsZWF2ZXMgIm12IiBvdXRzaWRlIHRoZSBi
cmFuY2gsIGJ1dCBhdCBsZWFzdCBzZWVtcyB0byBiZQo+IG9uIHRoZSByaWdodCB0cmFjayAodW5k
ZXNpcmVkIG92ZXJoZWFkIGlzIG1hcmtlZCB3aXRoIGxlYWRpbmcgc3RhcnMpOgo+IAo+ICAgIDB4
ZmZmZmZmZmY4MDAyMzZlOCA8KzA+OglhZGRpCXNwLHNwLC00OAo+ICAgIDB4ZmZmZmZmZmY4MDAy
MzZlYSA8KzI+OglzZAlzMCwzMihzcCkKPiAgICAweGZmZmZmZmZmODAwMjM2ZWMgPCs0PjoJc2QJ
cmEsNDAoc3ApCj4gICAgMHhmZmZmZmZmZjgwMDIzNmVlIDwrNj46CWFkZGkJczAsc3AsNDgKPiAq
ICAweGZmZmZmZmZmODAwMjM2ZjAgPCs4PjoJbXYJYTQsYTAKPiAqICAweGZmZmZmZmZmODAwMjM2
ZjIgPCsxMD46CW12CWE1LGExCj4gICAgMHhmZmZmZmZmZjgwMDIzNmY0IDwrMTI+Oglub3AKPiAq
ICAweGZmZmZmZmZmODAwMjM2ZjggPCsxNj46CW12CWEwLGE0Cj4gKiAgMHhmZmZmZmZmZjgwMDIz
NmZhIDwrMTg+OgltdglhMSxhNQo+ICAgIDB4ZmZmZmZmZmY4MDAyMzZmYyA8KzIwPjoJbGkJYTcs
MTIzCj4gICAgMHhmZmZmZmZmZjgwMDIzNzAwIDwrMjQ+OglsaQlhNiw0NTYKPiAgICAweGZmZmZm
ZmZmODAwMjM3MDQgPCsyOD46CWVjYWxsCj4gKiAgMHhmZmZmZmZmZjgwMDIzNzA4IDwrMzI+Oglt
dglhNSxhMAo+ICogIDB4ZmZmZmZmZmY4MDAyMzcwYSA8KzM0PjoJbXYJYTIsYTEKPiAgICAweGZm
ZmZmZmZmODAwMjM3MGMgPCszNj46CW5vcAo+ICAgIDB4ZmZmZmZmZmY4MDAyMzcxMCA8KzQwPjoJ
bGQJcmEsNDAoc3ApCj4gICAgMHhmZmZmZmZmZjgwMDIzNzEyIDwrNDI+OglsZAlzMCwzMihzcCkK
PiAqICAweGZmZmZmZmZmODAwMjM3MTQgPCs0ND46CW12CWEwLGE1Cj4gKiAgMHhmZmZmZmZmZjgw
MDIzNzE2IDwrNDY+OgltdglhMSxhMgo+ICAgIDB4ZmZmZmZmZmY4MDAyMzcxOCA8KzQ4PjoJYWRk
aQlzcCxzcCw0OAo+ICAgIDB4ZmZmZmZmZmY4MDAyMzcxYSA8KzUwPjoJcmV0Cj4gICAgW1RyYWNp
bmcgZ29lcyB0byArMTI2XQoKSG93IG11Y2ggZG8gYSBmZXcgcmVnaXN0ZXIgbW92ZXMvc3BpbGxz
IG1hdHRlciBjb21wYXJlZCB0byB0aGUKY29zdCBvZiB0aGUgY2FsbGVkIGNvZGU/ClRoZXJlIHdp
bGwgYnV0IG11Y2ggd29yc2UgdGhpbmdzIG91dCB0aGVyZSBpZiB5b3UgbG9vay4KCglEYXZpZAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
