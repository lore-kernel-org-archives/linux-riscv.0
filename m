Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6B6D1037E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 06:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GM4p6V+e59/GWtyfBL0koz/eDtMANsiomMdV4L3vWcw=; b=XjU11Ew6XPDLD2
	bja+0nAWeN5aGSFJuPuu1/Dc7hjlu7MbBD4SW4KgcObqSGbXl/Kq1QI/xY6UBssilQ7ocKAkZWA1D
	WtQAfPju0982x+dAUMSGk7MmY6kiLYI2fUNL3vYyjEeyv9zCdmnBLh5BKy7tT2Bv71zf5gtB0pRk2
	lMHSC+boeSvC+HwlCSiKWbg0bbVmjFUCESdMO19Hbej0q0RIRnllT/8GQR0YbzoYX4ZOfE0+dK8i6
	6kOhkRzsDliRdLZQ0eXyzMGMLzBXx1gI1cxKJlQklwKLmDctVzLPP3+YmUxmFX5+PBnlkElxAk2r7
	w/Q4VNVEbUwaDvIZSDyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO9AU-0000000ERn7-3RUz;
	Wed, 26 Nov 2025 06:38:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO9AS-0000000ERn0-3osR
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 06:38:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C879E6013A
	for <linux-riscv@lists.infradead.org>; Wed, 26 Nov 2025 06:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CDBCC4AF0B
	for <linux-riscv@lists.infradead.org>; Wed, 26 Nov 2025 06:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764139099;
	bh=IHcn8poodH//FU1MA5VWzEcXDJSpMUbDUfboDcSleBw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JekaNptcX8SnxevqpavPO2YS78STQdKQ8KyL6PXQWg++Wkk787/8FtnYB7tjzvQJc
	 jB8XmEIHb1v3Ffou0RxHiLfu6gDKclHjI/WCRiWq/eucUmFGxpgQIgG8Jk1/Aj9nU/
	 B0gvE1aTi1WXVd/EK12BYUgcg5lfpkwyPJfJZ3tEQECTIhVz3Rm6Dl9SODIU+pNI9M
	 ibauMdWNSWRAiVYH5AeG9P3qYibeNh0f675lfKOApAjBUvan51a3HfzBQnRGEyKF8e
	 Zu0HFqX1U1k4+YAirJjy5jpnd8nKRZ6pfKK0JfYrIeoXV5ktU4hDhQQCiiVaIkh02O
	 HkiLgwNwNFfDg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so599357e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Nov 2025 22:38:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWM3NVsW6aKLnJyIm5/T/MVYx6h9MVEwOlRIS+8LehbBfvHcuEdM9IQvJtqTr2vG0OIC83wu6oAmOGfMg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3VZhoPtDvxlC3o9gVa9hBhBnI9bWHnWUc91obrQHYzvJfWCMs
	MR2QMOVw5sbTJlpXol8QZ+ENkddr89oNfrQCFzprPp/x9Pk2XRb5xxStDhmMoKD1hMNDoTPfBPI
	cnaTkYSjqDUaRfrCeCpF7NAaachH6Wo8=
X-Google-Smtp-Source: AGHT+IGgbB0yJvyFDsxvPnqjZKGrRr0GuCZSWkaPRw856NhzHZOODkomFBVO/pt6qkNhS64UG52bzDpH5Ucaj05SyXE=
X-Received: by 2002:a05:6512:2301:b0:595:83d5:7b47 with SMTP id
 2adb3069b0e04-5969e9d3083mr7486321e87.5.1764139097778; Tue, 25 Nov 2025
 22:38:17 -0800 (PST)
MIME-Version: 1.0
References: <20251031024328.735161-1-maqianga@uniontech.com>
 <f9d632d5-22dc-8b14-8a70-37737a78f206@kernel.org> <37CDF8D84A26949E+cc84e626-911b-40ac-90ef-ff5a2df585a9@uniontech.com>
In-Reply-To: <37CDF8D84A26949E+cc84e626-911b-40ac-90ef-ff5a2df585a9@uniontech.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 26 Nov 2025 07:38:06 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE0ic5Jx3J75qocFgvUPMqQF4Xsqf4CCnaYggWJ35bUiQ@mail.gmail.com>
X-Gm-Features: AWmQ_bm5Kouy_gNO6ASdM7F_2CcaRjX-XGeBmmg295zd55RvtqIf1wAb-jTzdk0
Message-ID: <CAMj1kXE0ic5Jx3J75qocFgvUPMqQF4Xsqf4CCnaYggWJ35bUiQ@mail.gmail.com>
Subject: Re: [PATCH] efi/riscv: Remove the useless failure return message print
To: Qiang Ma <maqianga@uniontech.com>
Cc: Paul Walmsley <pjw@kernel.org>, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gV2VkLCAyNiBOb3YgMjAyNSBhdCAwMzo1MywgUWlhbmcgTWEgPG1hcWlhbmdhQHVuaW9udGVj
aC5jb20+IHdyb3RlOgo+Cj4KPiDlnKggMjAyNS8xMS8yNiAwODoyNywgUGF1bCBXYWxtc2xleSDl
hpnpgZM6Cj4gPiBPbiBGcmksIDMxIE9jdCAyMDI1LCBRaWFuZyBNYSB3cm90ZToKPiA+Cj4gPj4g
SW4gdGhlIGVmaV9jcmVhdGVfbWFwcGluZygpIGluIGFyY2gvcmlzY3Yva2VybmVsL2VmaS5jLAo+
ID4+IHRoZSByZXR1cm4gdmFsdWUgaXMgYWx3YXlzIDAsIGFuZCB0aGlzIGRlYnVnIG1lc3NhZ2UK
PiA+PiBpcyB1bm5lY2Vzc2FyeS4gU28sIHJlbW92ZSBpdC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYt
Ynk6IFFpYW5nIE1hIDxtYXFpYW5nYUB1bmlvbnRlY2guY29tPgo+ID4gQ29uc2lkZXJpbmcgdGhh
dCBBcmQgZG9lc24ndCB0aGluayBlZmlfY3JlYXRlX21hcHBpbmcoKSBzaG91bGQgYmUgY2hhbmdl
ZAo+ID4gdG8gcmVtb3ZlIHRoZSByZXR1cm4gdmFsdWUsIGFuZCB0aGF0IHRoZSBBUk0gdmVyc2lv
biBvZiB0aGlzIGNvZGUgcmV0YWlucwo+ID4gdGhlIGRlYnVnIG1lc3NhZ2UsIHdlIHNob3VsZCBw
cm9iYWJseSBrZWVwIHRoaW5ncyB0aGUgd2F5IHRoZXkgYXJlLiAgQnV0Cj4gPiBpZiB5b3UgY2Fu
IGdldCBhIFJldmlld2VkLWJ5OiBvciBhbiBBY2tlZC1ieTogZnJvbSBBcmQsIEknZCB0YWtlIGl0
Lgo+IEhpLCBBcmQsIHdoYXQgYXJlIHlvdXIgc3VnZ2VzdGlvbnMgZm9yIHRoaXMgcGF0Y2g/Cj4K
PiBDb3VsZCB5b3UgYWRkIGEgUmV2aWV3ZWQtYnk6IG9yIGFuIEFja2VkLWJ5OiB0byB0aGlzIHBh
dGNoPwoKSSBhbHJlYWR5IHF1ZXVlZCB0aGlzIHVwIGluIGVmaS9uZXh0CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
