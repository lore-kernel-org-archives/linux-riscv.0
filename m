Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483D1C83F04
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 15:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2fE1+cs/HyNH0QBPrw6vEGuBy3RpRMKoDCAm17hzKgI=; b=BwhFrl/8NkijTy
	to355GRH/xnEsM60uY5DHlrF6ohH2wF7gNfB/E2Xxjl4EhS0whF4g5qZc5HYnIWP9eH1z9y4o0b4z
	m26q+AX2bgmLiUtWj1UPv1jJ/XCCKFPKiG3tVwfCwE/Oj8kcyXpKuE4dGueC/THwDxeJi1Lm+7Hf1
	l4OJtWe+r5KaaSdhjfTV47aw4EQ4FTIGoiTq8ntNitbtLBJjuYR0OyhtNFlYDeKV85axnh7wC3gI8
	idOelB/S3wHYoKq3AuzSuRURnvKOHqHfpIxwKk6Kob8E9qaJGRVDVaFKdW/2Lqh3nbcU8wmLkyItB
	T1eafCewR14AVLC/k+lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzUg-00000008ofD-1LA6;
	Wed, 02 Jul 2025 15:35:30 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyi8-00000008fGX-3x9S
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 14:45:22 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-31329098ae8so5818833a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 07:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751467520; x=1752072320; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ub3S+Dt/bu8miV+mMpV8No5VX9B8sDnT2TuQkds1xm4=;
        b=HDZGWTa2RjPkYKp1X7ejxwzeE1+LWHFqOFFhs2Mlr1qNU+haOABTCUaANU4tMCvWph
         PXo/1g/h5X3ndTcLvzhrrxkIs54VvNTstEzdQFrmRyfvlnN/n1xLZgm48FuuUcUJ25Em
         xhElCtpGYmYkqIEfSzL8ngztDVIDy3GYM8nM3SjlrdJN8aMRkM6WqKWMdlUvwpNC4C/A
         GtUPZmQmHsY9qbU6PoAQkkr58lb+MukWNQzkz1NBdqmphORBwmpQlCoeGXxGF3gYSznk
         YX3e+PL/XMAUoC7stoR3YTiFqYIDACnyMuyJaG/3Ra2rsHFYyv+bCXEy8XZzNxrXrv3x
         1nHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467520; x=1752072320;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ub3S+Dt/bu8miV+mMpV8No5VX9B8sDnT2TuQkds1xm4=;
        b=q676jyKMC+JaYafQYIO6kTdArIvvLSVFAjS2zHiU0RnybbjLCYwN3KBoChWGPeItHf
         n0zRVHX1wQ8Qr7iRQbiQJqNRSpfVQkPByGLZAZ2QJiwxef2rPXu4wQ3rWjx0oF7njTO+
         voj2n/diJFzBJPTeGKh4wByKW9xwNHzBHD7mtL6n8kBzgfD74HPUBG7Ma+u80lXDHwiI
         bUFzaCQdlA+mjpVqHhzOXrnlgRWCg9VzEJn7FjmO2V8NCfOtfW3g6nmqmh5KSb71gUOj
         5C4SKx9jq50nAp2eDjMXDSK+CZIzbj8ihmbk8XM9hCB0hBuuBOtvTC/fMSX2dVAQkGkH
         X7PA==
X-Forwarded-Encrypted: i=1; AJvYcCUGHeUSijXJyiZfiFuS9+3fWm328pgdfQDWeI8vLtXUWYgttapeOUy3+xxtmzgiiB+UAtYGR9KNpg4/xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnER2ICAfyfb1JgnrpBa7QvbYpSM676kGn+dQibE8XMzjX7fEr
	MLmt3LG08FDcUAuXf+x+LFRM4jriRUsPXn8xFOLu6x1VUg4mVRvWMtogekMCbqYsh34=
X-Gm-Gg: ASbGncuLUojWBABu+Sn1Kt9/XGm5sBIus3zpjcaNItb1nwbnV/ZyGe1ZnJPV90Su0t9
	KN3OFTHGvG6vtIpwjEoRFkD8SCSZD5Ri5usdM/IeauUQpuUYsR8kU++slyQlZoYkNt52PdoHf8C
	IirIMMtPkhpT6umueeZNNOCobPwLXChIxrFcBAVhsFzUSr+hMstCmw1DrEaIKMGzDja5hKHiozN
	feNKVcbHR7i4OQCRB5Jsxa5e+3saeaZsL6h1/tRMuupuJFqnmzN3PXdRfeFRS+nB+Sm9TBI6lXs
	/FgIQGFFIks7gv42xQB8mJCRlgmu0P1q09GJKccJgUfD5VgUE8hEjdzzKztB6pgMcXtOTFKb+Os
	vayoE
X-Google-Smtp-Source: AGHT+IFPa9TeJNuPoAgMtcthgHelhMMx1yE/P2JRUakvM+iYhxMlIKjpAgWtoSbiHmHsdR0eqv5U7A==
X-Received: by 2002:a17:90b:558d:b0:30e:e9f1:8447 with SMTP id 98e67ed59e1d1-31a917843a0mr4240732a91.4.1751467519591;
        Wed, 02 Jul 2025 07:45:19 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cc4c7c3sm17879a91.9.2025.07.02.07.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:45:19 -0700 (PDT)
Date: Wed, 2 Jul 2025 20:15:04 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 14/24] ACPI: property: Refactor
 acpi_fwnode_get_reference_args()
Message-ID: <aGVF8Gqzs2YZf1Os@sunil-laptop>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-15-apatel@ventanamicro.com>
 <CAJZ5v0ifCN7OWEw0DHpULSmXn4nCb9EdJMjQPJwmdoF_y0nfjA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0ifCN7OWEw0DHpULSmXn4nCb9EdJMjQPJwmdoF_y0nfjA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_074520_982459_907A9AFB 
X-CRM114-Status: GOOD (  20.27  )
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

T24gV2VkLCBKdWwgMDIsIDIwMjUgYXQgMTI6MDc6MzZQTSArMDIwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gV2VkLCBKdWwgMiwgMjAyNSBhdCA3OjE14oCvQU0gQW51cCBQYXRlbCA8
YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IEZyb206IFN1bmlsIFYgTCA8
c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgo+ID4KPiA+IEN1cnJlbnRseSBhY3BpX2Z3bm9kZV9n
ZXRfcmVmZXJlbmNlX2FyZ3MoKSBjYWxscyB0aGUgcHVibGljIGZ1bmN0aW9uCj4gPiBfX2FjcGlf
bm9kZV9nZXRfcHJvcGVydHlfcmVmZXJlbmNlKCkgd2hpY2ggaWdub3JlcyB0aGUgbmFyZ3NfcHJv
cAo+ID4gcGFyYW1ldGVyLgo+IAo+IFdoaWNoIEkgc3VwcG9zZSBpcyBhIHByb2JsZW0uICBXaHkg
aXMgaXQgc28/Cj4gCmZ3bm9kZV9wcm9wZXJ0eV9nZXRfcmVmZXJlbmNlX2FyZ3MoKSBkb2N1bWVu
dHMgYXMgYmVsb3cuCgoqIEBuYXJnc19wcm9wOiBUaGUgbmFtZSBvZiB0aGUgcHJvcGVydHkgdGVs
bGluZyB0aGUgbnVtYmVyIG9mCiAqICAgICAgICAgICAgICBhcmd1bWVudHMgaW4gdGhlIHJlZmVy
cmVkIG5vZGUuIE5VTEwgaWYgQG5hcmdzIGlzIGtub3duLAogKiAgICAgICAgICAgICAgb3RoZXJ3
aXNlIEBuYXJncyBpcyBpZ25vcmVkLiBPbmx5IHJlbGV2YW50IG9uIE9GLgogKiBAbmFyZ3M6ICAg
ICAgTnVtYmVyIG9mIGFyZ3VtZW50cy4gSWdub3JlZCBpZiBAbmFyZ3NfcHJvcCBpcyBub24tTlVM
TC4KCllvdSBjYW4gc2VlIHRoYXQgbmFyZ3NfcHJvcCBpcyBub3Qgc3VwcG9ydGVkIHdpdGggQUNQ
SSBjdXJyZW50bHkuIFNpbmNlCmZ3bm9kZV9wcm9wZXJ0eV9nZXRfcmVmZXJlbmNlX2FyZ3MoKSBj
YWxscwpfX2FjcGlfbm9kZV9nZXRfcHJvcGVydHlfcmVmZXJlbmNlKCksIHRoZXJlIGlzIG5vIHdh
eSB0byBkZXRlcm1pbmUgdGhlCm5hcmdzIGZyb20gdGhlIG5hcmdzX3Byb3AgY3VycmVudGx5IHdp
dGggQUNQSS4gU2luY2UKZndub2RlX3Byb3BlcnR5X2dldF9yZWZlcmVuY2VfYXJncygpIGlzIGEg
Y29tbW9uIEFQSSBhY3Jvc3MgRFQgYW5kIEFDUEksCml0IGlzIGEgcHJvYmxlbSBmb3IgdXNlcnMu
CgoKPiA+IFRvIGZpeCB0aGlzLCBtYWtlIF9fYWNwaV9ub2RlX2dldF9wcm9wZXJ0eV9yZWZlcmVu
Y2UoKSB0bwo+ID4gY2FsbCB0aGUgc3RhdGljIGFjcGlfZndub2RlX2dldF9yZWZlcmVuY2UoKSBz
byB0aGF0IGNhbGxlcnMgb2YKPiA+IGZ3bm9kZV9nZXRfcmVmZXJlbmNlX2FyZ3MoKSBjYW4gc3Rp
bGwgcGFzcyBhIHZhbGlkIHByb3BlcnR5IG5hbWUgdG8KPiA+IGZldGNoIHRoZSBudW1iZXIgb2Yg
YXJndW1lbnRzLgo+IAo+IEFyZSB0aGUgY3VycmVudCBjYWxsZXJzIG9mIGFjcGlfZndub2RlX2dl
dF9yZWZlcmVuY2VfYXJncygpIGdvaW5nIHRvCj4gYmUgYWZmZWN0ZWQgYnkgdGhpcyBjaGFuZ2Ug
YW5kIGlmIHNvLCB0aGVuIGhvdz8KPiAKR29vZCBxdWVzdGlvbiEuIElmIHNvbWUgb25lIGlzIGN1
cnJlbnRseSBwYXNzaW5nIGJvdGggdmFsaWQgbmFyZ3NfcHJvcCBhbmQKbmFyZ3Mgd2l0aCBBQ1BJ
LCBub3cgd2l0aCB0aGlzIGNoYW5nZSBpdCB3aWxsIHN0YXJ0IGdldHRpbmcgdGhlIHZhbHVlCmZy
b20gbmFyZ3NfcHJvcCB3aGljaCB3YXMgc2ltcGx5IGlnbm9yZWQgZWFybGllci4gSG93ZXZlciwg
SSBzZWUgb25seSAyCmNvbWJpbmF0aW9ucyBob3cgZndub2RlX3Byb3BlcnR5X2dldF9yZWZlcmVu
Y2VfYXJncygpIGlzIGJlaW5nIHVzZWQuIAoKKG5hcmdzX3Byb3AgPSBOVUxMKSAmJiAoYXJnc19j
b3VudCAhPTApCm9yCihuYXJnc19wcm9wICE9IE5VTEwpICYmIChhcmdzX2NvdW50ID0gMCkKClNv
LCBJTU8gaXQgc2hvdWxkIGJlIHNhZmUgdG8gbWFrZSB0aGlzIGNoYW5nZS4gQnV0IGxldCBtZSBr
bm93IGlmIEkgYW0KbWlzc2luZyBzb21ldGhpbmcuCgpUaGFua3MhClN1bmlsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
