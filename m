Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D841AC001B0
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 18:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U39d7Jh5jOtfrxEiWJzu7swodfvEJ+Pp96cUbgaUxas=; b=dFPZR1VnmZhr2R
	zS/DGMu5EwkezICqlzyidKxoU9ir0XsCvcZji0DLfPyc9hDavtX6AtnABEPG8X8AtSqo2ALxLbj2g
	Xs4MmpzNgpWW5mUw3IaDDVzKfLsJ0LBpa0FnkUZuk3j/eoSKVUWC2aayEx2xvJWlB1RR9SCR3Wxyo
	x5sm1IMaiphnXixB+DohMmULrSpNDqBI4T75HH2Qtq/7N7u2soqpKzN6XlIgxdmJYjYC3bb3jZjnB
	sh4LPRonmHEzQxzc7LiaPSFQhv6LbTHvkTpiSynwFJqRZeWwtsqs6WnPPJm2KtA4HoxjAChb/PgdP
	ploKHiTDe3WO/cEkoKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGOke-00BFb5-2l;
	Mon, 03 Jul 2023 18:58:20 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGOkc-00BFaW-0w
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 18:58:19 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-c5c8d00ced3so12545276.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 11:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688410696; x=1691002696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdI/aR6tDnny9jl70GO2VaZWhjHcoPI5SvZ3goGqWe0=;
        b=QnHxICIrzDP76D9hf4nrvbTsxoz1OcQQIUlQgEs6FCOrdQio9sHxHfdcZHUuaqYKY5
         KencCpjDBUlgIDBiYvtW88dWsN9sOPduo0cUhLFWR3LyhyGsqkW2+f3GjFbDq9m12UAZ
         Isb+Gx4LWLtikSyJ8SjvovAFD1ZLBUWrHU4gJ7OqWCyOIQ5Gik34njEg7pAYGKqunfWq
         tdY4MFzXobsGG+SBfSmtqe5DFQTAfVo1SDSka0bTTF0/+4bjGMvr5AcpuMUuVWC8S5vf
         uwsfq2us2K3oAMj2Nq0/Qp9EHU9IG/taxq6tew4BcUMTiaLEMrObheFdiGxsxbLeHIsr
         51tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688410696; x=1691002696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdI/aR6tDnny9jl70GO2VaZWhjHcoPI5SvZ3goGqWe0=;
        b=fGXKzFwgyrysXACPbWQLsNprdWk1OCX67bCJzsYWrGamF9aUIrfsQ4Dq7u1XVo8mKy
         3KvY9vXRnHsLrNasDtG8UaCzo7iQDS6xl2sQW8cjso1c8H0HiM7BbJqJTj1BwktlkhkY
         tAcJb5RNwHkBClbAITxuItvSUbzyFCIfHbtOr2nHVcjU8iLVPFOi5S4unMILI+xbWy3z
         vpPnr4s0uG/54MwuuYhKdgzvmId3K9Px3wA+WaEQsG1G0BjxkJEMwQre54H7giHOf1aT
         61BFkzN8o38DhgL8mK+pepP7xPvfGHWOxkk/s89Vi0jwbSX4td9f5N4YC8RdPPyvEEup
         Xz7Q==
X-Gm-Message-State: ABy/qLYIlChv6l8/LnsXs1O/glkasm0VCdmLcW11cBAQuE68VyIw9wN/
	+qnLV7CeoOD4AW+V57+JO7CoTzL3UkxjHdmKHew=
X-Google-Smtp-Source: APBJJlGX+HQAUgcwh5aUbevyBV7Auco1dx/c0vI2lwouiMuJpkFdnAyw13cNFf+KlvG50Qc45KCcJyggHhnzFoKfJPU=
X-Received: by 2002:a25:320c:0:b0:c2b:cc71:d870 with SMTP id
 y12-20020a25320c000000b00c2bcc71d870mr9565258yby.57.1688410695987; Mon, 03
 Jul 2023 11:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230702095735.860-1-cuiyunhui@bytedance.com> <20230703-71f67eb66a037f5c0fb825c6@orel>
 <CAEEQ3w=7tBHyG=CvuktPN5cvfpY6ayamnbry6eOYxMDrPN+oZg@mail.gmail.com>
In-Reply-To: <CAEEQ3w=7tBHyG=CvuktPN5cvfpY6ayamnbry6eOYxMDrPN+oZg@mail.gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Date: Mon, 3 Jul 2023 20:58:04 +0200
Message-ID: <CANBLGcwcvK55dZ1__wvWCtcw=XoKt=qki8g6C_QYo+TBqqJ=TA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/3] riscv: obtain ACPI RSDP from FFI.
To: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, ardb@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, rminnich@gmail.com, mark.rutland@arm.com, 
	lpieralisi@kernel.org, rafael@kernel.org, lenb@kernel.org, jdelvare@suse.com, 
	yc.hung@mediatek.com, angelogioacchino.delregno@collabora.com, 
	allen-kh.cheng@mediatek.com, pierre-louis.bossart@linux.intel.com, 
	tinghan.shen@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, geshijian@bytedance.com, weidong.wd@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_115818_349317_F084C787 
X-CRM114-Status: GOOD (  13.69  )
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

T24gTW9uLCAzIEp1bCAyMDIzIGF0IDE1OjMzLCDov5DovonltJQgPGN1aXl1bmh1aUBieXRlZGFu
Y2UuY29tPiB3cm90ZToKPgo+IEhpIGRyZXcsCj4KPiBPbiBNb24sIEp1bCAzLCAyMDIzIGF0IDk6
MDHigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+
Cj4gPgo+ID4gKFRoaXMgaXMgYSByZXBseSB0byBhIG5vbi1leGlzdGVudCBjb3ZlciBsZXR0ZXIu
KQo+Cj4gVGhpcyBoYXMgYmVlbiBkaXNjdXNzZWQgbWFueSB0aW1lcyB3aXRoIEFyZCwgUGxlYXNl
IHJlZmVyIHRvIDoKPiBodHRwczovL3BhdGNoZXMubGluYXJvLm9yZy9wcm9qZWN0L2xpbnV4LWFj
cGkvcGF0Y2gvMjAyMzA0MjYwMzQwMDEuMTYtMS1jdWl5dW5odWlAYnl0ZWRhbmNlLmNvbS8KCkhp
IFl1bmh1aSwKCkZyb20gdGhhdCBkaXNjdXNzaW9uIGl0IHdhcyBtZW50aW9uZWQgdGhhdCB0aGF0
IGFybSBzdXBwb3J0cyAzIG1ldGhvZHMKb2YgYm9vdGluZzoKICBkaXJlY3QgKyBkZXZpY2V0cmVl
CiAgRUZJICsgZGV2aWNldHJlZQogIEVGSSArIEFDUEkKLi5idXQgbm90CiAgZGlyZWN0ICsgQUNQ
SQoKVG8gbWUgaXQgaXNuJ3Qgb2J2aW91cyBmcm9tIHRoYXQgb3IgdGhpcyB0aHJlYWQsIGFuZCBz
aW5jZSBhcm0gc2VlbXMKdG8gYmUgZG9pbmcgZmluZSB3aXRob3V0IHRoZSA0dGggb3B0aW9uIEkn
bSBjdXJpb3VzIHdoeSB0aGF0J3MKbmVjZXNzYXJ5IG9uIHJpc2N2PwoKPiA+IEknbSBub3QgYSBi
aWcgZmFuIG9mIGFkZGluZyB5ZXQgYW5vdGhlciBpbnRlcmZhY2UuIEhhdmUgeW91IGNvbnNpZGVy
ZWQKPiA+IGRvaW5nIHNvbWV0aGluZyBsaWtlIFsxXT8KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9naXRo
dWIuY29tL3RpYW5vY29yZS90aWFub2NvcmUuZ2l0aHViLmlvL3dpa2kvVWVmaVBheWxvYWRQa2cK
CkFsc28geW91IGRpZG4ndCBhbnN3ZXIgdGhpcyBxdWVzdGlvbiwgd2hpY2ggSSdkIGFsc28gbGlr
ZSB0byBoZWFyIGEgcmVwbHkgdG8uCgovRW1pbAoKPiA+IFRoYW5rcywKPiA+IGRyZXcKPgo+IFRo
YW5rcywKPiBZdW5odWkKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
