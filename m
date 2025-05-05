Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8750CC3ABAA
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 16:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=feK9xtS99RPe4ah62P3Vx9xV/llxNJigM4PHV/VCQRY=; b=Cbi7Yax00KzJ2Y
	c14p1WesyNNcq6MrKuc71y/B9m11ITYHPhTtfU3NNkdSYCNI0HPzgeSu5p/ZVG+sFP1W78OxSU3V0
	zAh5b2tkUcmQQOO5jgoQEJbqcmAnIXo12zPTZyDkn5mLaBlV/ZBR+/BODn44xTm8piJ2pdgonCN8F
	yWoNKOMil0hqa+lRq8IseB1IgZgqf+Ej3Sqsph1r3C2oOLmgnffbmP7u5rVBaOSrBQWTisCoeTjmB
	tBFQ6jrY4RX+WpM64OadOt+1TWq3swImnjDKyLxBj5Rtv92ZPm0vwiv/bMhLG9Hj+IrbgebAPZmaD
	J6t6uJP14xfoQgdyMg6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBynw-000000080jO-2tHk;
	Mon, 05 May 2025 16:36:32 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBySv-00000007wSf-3ok5
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 16:14:51 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7369ce5d323so4210339b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 May 2025 09:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746461689; x=1747066489; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SWvry4KDZapMEnULakjmTiQHQSX4k/taW1KwMUhJXLA=;
        b=hc1SoMqKbgG9EpqO7vDLl0eFJ89XMtzxvTLOaQm+/8z2jf+nB+kOEtyNA+2PBc2j0V
         n570K3zfHgcJC9PoKaweXxNs5zxTQ1CoYNoN8uEyqB3YZxzFa/wzXO/bd6QkG/m9YONC
         w5LYsz54Jpxo8WzrRNQaRbM4pAHUK/VyxhPri0LhgFmNL8OJmDLYjlR14D3elBC0UVKA
         3G7h1CQNqqJyK+k05x8GAvQLct1/Zh9VrYiZoeAzOcOBBXvLGubGjWrevFgrN0FJuY2X
         2sbkE8BZ0xtv0H8PPMUv8jF5Wu/MngZX3xG46mxaTJqUkxdvX03VKZZe7MTAkSPGh9w1
         bbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746461689; x=1747066489;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SWvry4KDZapMEnULakjmTiQHQSX4k/taW1KwMUhJXLA=;
        b=vj3aE+STK7u60i54L+mRLx0/9aZcnpjVn+hAzzDiUdKQ6vTu0MhR7L3A6lMT6Ctyq2
         CirR8gkTaMQNLSmuQCuFFqPlxXtPoDiOaey/UTJHyw8Diz+a8RDHyrg3kxvETSuRiMq2
         idHm3a33P4sd46IqhMj3k8dQ6y39n8Zt1nRfjfrKSTvtFw7UQ3HTcQqkKRfg99XVWLsY
         1xsKJOMnxBm3eYckx0EYter3VSq9bhEvIERDAG2Hyc3YNw7olTJ14fAvohT3+VknrHSt
         O9EI9cI72soHzbYWW2ZF6nnof6mW4zIc2cnZMNDgRW2gepTvJbhyTIUcogiHKVst9Kxi
         T2qQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3QBXjR/BENOHWLeKSqaSxdW5bDdvdW8va+e8vS8miSHS/6o+MdZwianRgbaZCeLWRiLtFVh0ukHy2+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5JcpqiI7J8SRBNDNZCfokK9jtWvX9wDN2ClMF9l/7acM7sqkf
	h/kZv1ltYfgObfaKbrGPhXLZTxJdcon8t6g9qSGT0GI8/AFdd2HuVRpWwQsocw==
X-Gm-Gg: ASbGnctEan1aC584hzULk71YcjF0BlTNrd1sEgy6nTRhpZMD0kbnbVW0+Xz/BrYTRck
	rjJw3NigxIdVJBGCC61CfkWJ6vQEsHx8iJP+H/53TvdIOc7gxhMtmIQ8VTdlr6IRVJcIrfMbDMz
	JR9lNAC3HU2PCGorJvpENpqO5t5+5yl7T1asB1cuE1AOLPW4AMHpMhT7nXdXU1nlXlHgb8M/stf
	+KPgojhOWpC9PYOVfz+JdUXsiJxTNCeeaFF4yJqNQsUc+3NYZZRFMdXMy2eVoSc/JOMOv9DMnbT
	OEvx5c29rRcPbM0SUgaqHar8J5j/c7yRVDM4w7O3jsFALDSkYjY=
X-Google-Smtp-Source: AGHT+IGDlihVIhUXhK0fIymH88F2X8FV0rkQuFidNrc3Roi5FkXvbM1MtssO/KpT/pJrJT2EqnO02g==
X-Received: by 2002:a05:6a00:9095:b0:732:5164:3cc with SMTP id d2e1a72fcca58-7406f17ac90mr10027660b3a.19.1746461688655;
        Mon, 05 May 2025 09:14:48 -0700 (PDT)
Received: from thinkpad ([120.60.48.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590a1c09sm6964138b3a.168.2025.05.05.09.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:14:48 -0700 (PDT)
Date: Mon, 5 May 2025 21:44:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, Lukas Wunner <lukas@wunner.de>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, wilfred.mallawa@wdc.com
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add support for resetting the slot due
 to link down event
Message-ID: <tflie6ncttih5jxn5xg3zvktidqv5jaqsnsuryy56qfq7pghxd@ippj4lhsdqme>
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
 <20250417-pcie-reset-slot-v3-5-59a10811c962@linaro.org>
 <aBjTpglI5_P2Q3Aa@ryzen>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aBjTpglI5_P2Q3Aa@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_091449_941852_A9673723 
X-CRM114-Status: GOOD (  22.44  )
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

T24gTW9uLCBNYXkgMDUsIDIwMjUgYXQgMDU6MDU6MTBQTSArMDIwMCwgTmlrbGFzIENhc3NlbCB3
cm90ZToKPiBIZWxsbyBNYW5pLAo+IAo+IE9uIFRodSwgQXByIDE3LCAyMDI1IGF0IDEwOjQ2OjMx
UE0gKzA1MzAsIE1hbml2YW5uYW4gU2FkaGFzaXZhbSB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4gPiBA
QCAtMTU3MSw2ICsxNjUyLDkgQEAgc3RhdGljIGlycXJldHVybl90IHFjb21fcGNpZV9nbG9iYWxf
aXJxX3RocmVhZChpbnQgaXJxLCB2b2lkICpkYXRhKQo+ID4gIAkJcGNpX3VubG9ja19yZXNjYW5f
cmVtb3ZlKCk7Cj4gPiAgCj4gPiAgCQlxY29tX3BjaWVfaWNjX29wcF91cGRhdGUocGNpZSk7Cj4g
PiArCX0gZWxzZSBpZiAoRklFTERfR0VUKFBBUkZfSU5UX0FMTF9MSU5LX0RPV04sIHN0YXR1cykp
IHsKPiA+ICsJCWRldl9kYmcoZGV2LCAiUmVjZWl2ZWQgTGluayBkb3duIGV2ZW50XG4iKTsKPiA+
ICsJCXBjaV9ob3N0X2hhbmRsZV9saW5rX2Rvd24ocHAtPmJyaWRnZSk7Cj4gPiAgCX0gZWxzZSB7
Cj4gPiAgCQlkZXZfV0FSTl9PTkNFKGRldiwgMSwgIlJlY2VpdmVkIHVua25vd24gZXZlbnQuIElO
VF9TVEFUVVM6IDB4JTA4eFxuIiwKPiA+ICAJCQkgICAgICBzdGF0dXMpOwo+IAo+IEZyb20gZGVi
dWdnaW5nIGFuIHVucmVsYXRlZCBwcm9ibGVtLCBJIG5vdGljZWQgdGhhdCBkdy1yb2NrY2hpcCBj
YW4KPiBzb21ldGltZXMgaGF2ZSBib3RoICJsaW5rIHVwIiBiaXQgYW5kICJob3QgcmVzZXQgb3Ig
bGluayBkb3duIiBiaXQgc2V0Cj4gYXQgdGhlIHNhbWUgdGltZSwgd2hlbiByZWFkaW5nIHRoZSBz
dGF0dXMgcmVnaXN0ZXIuCj4gCgpUaGF0J3MgYSBnb29kIGNhdGNoLiBJdCBpcyBxdWl0ZSBwb3Nz
aWJsZSB0aGF0IGJvdGggZmllbGRzIGNvdWxkIGJlIHNldCBhdCBvbmNlLApzbyAnaWYuLmVsc2Un
IGlzIGluZGVlZCBhIGJhZCBpZGVhLgoKPiBQZXJoYXBzIHRoZSBsaW5rIHdlbnQgZG93biB2ZXJ5
IHF1aWNrbHkgYW5kIHRoZW4gd2FzIGVzdGFibGlzaGVkIGFnYWluCj4gYnkgdGhlIHRpbWUgdGhl
IHRocmVhZGVkIElSUSBoYW5kbGVyIGdldHMgdG8gcnVuLgo+IAo+IFlvdXIgY29kZSBzZWVtcyB0
byBkbyBhbiBpZiArIGVsc2UgaWYuCj4gCj4gV2l0aG91dCBrbm93aW5nIGhvdyB0aGUgZXZlbnRz
IHdvcmsgZm9yIHlvdXIgcGxhdGZvcm1zLCBJIHdvdWxkIGd1ZXNzCj4gdGhhdCBpdCBzaG91bGQg
YWxzbyBiZSBwb3NzaWJsZSB0byBoYXZlIG11bHRpcGxlIGV2ZW50cyBzZXQuCj4gCgpJIGFncmVl
LgoKPiAKPiBJbiB5b3UgY29kZSwgaWYgYm90aCBMSU5LIFVQIGFuZCBob3QgcmVzZXQvbGluayBk
b3duIGFyZSBzZXQsCj4gSSB3b3VsZCBhc3N1bWUgdGhhdCB5b3UgZHJpdmVyIHdpbGwgbm90IGRv
IHRoZSByaWdodCB0aGluZy4KPiAKPiBQZXJoYXBzIHlvdSB3YW50IHRvIHN3YXAgdGhlIG9yZGVy
PyBTbyB0aGF0IGxpbmsgZG93biBpcyBoYW5kbGVkIGZpcnN0LAo+IGFuZCB0aGVuIGxpbmsgdXAg
aXMgaGFuZGxlZC4gKElmIHlvdSBjb252ZXJ0IHRvICJpZiArIGlmICJpbnN0ZWFkIG9mCj4gImlm
ICsgZWxzZSBpZiIgdGhhdCBpcy4pCj4gCgpNYWtlcyBzZW5zZS4gSSdsbCBpbmNvcnBvcmF0ZSB0
aGlzIGNoYW5nZSBpbiB2NSwgdGhhbmtzIQoKLSBNYW5pCgotLSAK4K6u4K6j4K6/4K614K6j4K+N
4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
