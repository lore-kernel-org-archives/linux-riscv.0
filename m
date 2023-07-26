Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779A7C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zy023uyV4DwknRicXZlu9UhwQqxi8riseHwRCCgZ/2E=; b=QaoanuFW5OrdBQ
	nnTs79TqLPjxfBP+cBJiT5SKlZZDLjOpaxcsGHeKNfOmmIcCoCdNc/Gmqy7wmvcTTAOpWCZ9xsgnk
	FYBAmJMhA+62R9xLkpRfj8fjLiao2qi1HMRGAsOiOlF34OZcVUrgpWc6zbWVsLrSa+yiLKyNVsy3j
	uYIlegW8VIHtBFX1k/GRdKPKFBa0jxBd3UPZoSKGJiNh2Hd1NZcQr2bx4ScEYGWMNihsX7+wGOfuD
	YqloAgjVyYGH2KGaQcUkrL5rc59Cstum3lDvXZbooIJU9yk+KxWU2jfA0b0p48y1uAIakERJbr+L2
	80R9oS91KEPRWKosTPSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOewE-00AanE-1G;
	Wed, 26 Jul 2023 13:52:26 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOewB-00Aals-0X
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 13:52:24 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-666e6541c98so6298822b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jul 2023 06:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690379540; x=1690984340;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ey/D5M5CPmKQzId6+XsuiPGSyzaXamRUEWGT1BcC7g8=;
        b=oljGFhSavZjxkXX9CucTy5gLK6qGX0I821ndm/pPrymKSKvJ3P/6/lBeLNfqGQ4Prz
         yG8vGsi8TbRKYjWbNGsB7yiDHaa22xpMOxU5nHjrXLOpOpFIaRgQgmi30rvNMGGaQlnA
         aPogyoGDwEByaH6x2bu+i8DUJ8aQuv5RYESZZc2lxWmys95qEqie9+VLr28t9jXKQoGb
         ACUOHsx+Kh0P0USxXLLtGjTtYmJCoHLrvO3TngfJVNsHF6lP/Mjr03UuslceDWRR7aFU
         P220Nkr1pYqcfa9oPNp6sOExUOn8A0YJcEA5TAhibvstRj/Q8VU7/V3AREKD6GV4ila3
         mM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690379540; x=1690984340;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ey/D5M5CPmKQzId6+XsuiPGSyzaXamRUEWGT1BcC7g8=;
        b=II9KjhhfaBzdQc5Ujk2GaeEHTk8OfNGmhJ7JdHXIxSNaLWweB+581wKresbJWgxOmY
         IYIPgK9FX4DjP1VAFK/UElVUi0CIQyDaGzme+t73yuc8q3Qa1EC2RJJrLYEG0br8B4w+
         Ek0L82ogsGXYTQ+zxXa5vqn6zS3GbUgO6VuL5d9qk5lg2MaIw76cEOA5sb5iDXn/Qlz9
         DZiU/On+Y4RWvP/hsD/JvvKPvATo4Yj9kwC+arPsI1X5I+fJTb6WtuYXHRIGorT/5DHM
         TJbJ1YRAvRNI5Trn4HlL9dlux2Tmw265ThsgACMXLKNXhWETHI9bSA698vIa6Z6EAtru
         6zjA==
X-Gm-Message-State: ABy/qLZ3naeN/XlnXnvSDTvwOJ3eB0k4bpMmfvQJ9/s947hCpOH28GE4
	hQb7lEbkthfukHTysl+laRPX1g==
X-Google-Smtp-Source: APBJJlGGggspPA6ImxibgpDOjxq8NwN3+9CEYkMOcJSUt5QiwCOV4FVffsYERBKNj9SOSpMuSGApCw==
X-Received: by 2002:a05:6a00:234c:b0:686:c7be:5259 with SMTP id j12-20020a056a00234c00b00686c7be5259mr2598630pfj.32.1690379540161;
        Wed, 26 Jul 2023 06:52:20 -0700 (PDT)
Received: from ghost ([2601:c0:ca7f:e7c0:14ff:979a:dd27:29d7])
        by smtp.gmail.com with ESMTPSA id d134-20020a63368c000000b0055be951145csm12722952pga.36.2023.07.26.06.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 06:52:19 -0700 (PDT)
Date: Wed, 26 Jul 2023 09:52:15 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	conor@kernel.org, paul.walmsley@sifive.com, palmer@rivosinc.com,
	aou@eecs.berkeley.edu, anup@brainfault.org,
	konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	mick@ics.forth.gr, jrtc27@jrtc27.com, rdunlap@infradead.org
Subject: Re: [PATCH v6 4/4] RISC-V: mm: Document mmap changes
Message-ID: <ZMElD/V0G715rf/S@ghost>
References: <20230714165508.94561-1-charlie@rivosinc.com>
 <20230714165508.94561-5-charlie@rivosinc.com>
 <CAHVXubgSLhsMdS3aFbSuPNf2d_FXhztnFtRnbjsMstH5coCHWA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHVXubgSLhsMdS3aFbSuPNf2d_FXhztnFtRnbjsMstH5coCHWA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_065223_228467_B78924B0 
X-CRM114-Status: GOOD (  28.93  )
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

T24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgMDg6NTk6MTJBTSArMDIwMCwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+IE9uIEZyaSwgSnVsIDE0LCAyMDIzIGF0IDY6NTbigK9QTSBDaGFybGllIEplbmtp
bnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGUgYmVoYXZpb3Igb2Yg
bW1hcCBpcyBtb2RpZmllZCB3aXRoIHRoaXMgcGF0Y2ggc2VyaWVzLCBzbyBleHBsYWluIHRoZQo+
ID4gY2hhbmdlcyB0byB0aGUgbW1hcCBoaW50IGFkZHJlc3MgYmVoYXZpb3IuCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiA+IC0t
LQo+ID4gIERvY3VtZW50YXRpb24vcmlzY3Yvdm0tbGF5b3V0LnJzdCB8IDIyICsrKysrKysrKysr
KysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Jpc2N2L3ZtLWxheW91dC5yc3QgYi9Eb2N1bWVu
dGF0aW9uL3Jpc2N2L3ZtLWxheW91dC5yc3QKPiA+IGluZGV4IDU0NjJjODRmNDcyMy4uODkyNDEy
YjkxMzAwIDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9yaXNjdi92bS1sYXlvdXQucnN0
Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L3ZtLWxheW91dC5yc3QKPiA+IEBAIC0xMzMs
MyArMTMzLDI1IEBAIFJJU0MtViBMaW51eCBLZXJuZWwgU1Y1Nwo+ID4gICAgIGZmZmZmZmZmMDAw
MDAwMDAgfCAgLTQgICAgIEdCIHwgZmZmZmZmZmY3ZmZmZmZmZiB8ICAgIDIgR0IgfCBtb2R1bGVz
LCBCUEYKPiA+ICAgICBmZmZmZmZmZjgwMDAwMDAwIHwgIC0yICAgICBHQiB8IGZmZmZmZmZmZmZm
ZmZmZmYgfCAgICAyIEdCIHwga2VybmVsCj4gPiAgICBfX19fX19fX19fX19fX19fX198X19fX19f
X19fX19ffF9fX19fX19fX19fX19fX19fX3xfX19fX19fX198X19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiArCj4gPiArCj4gPiAr
VXNlcnNwYWNlIFZBcwo+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiArVG8gbWFpbnRhaW4g
Y29tcGF0aWJpbGl0eSB3aXRoIHNvZnR3YXJlIHRoYXQgcmVsaWVzIG9uIHRoZSBWQSBzcGFjZSB3
aXRoIGEKPiA+ICttYXhpbXVtIG9mIDQ4IGJpdHMgdGhlIGtlcm5lbCB3aWxsLCBieSBkZWZhdWx0
LCByZXR1cm4gdmlydHVhbCBhZGRyZXNzZXMgdG8KPiA+ICt1c2Vyc3BhY2UgZnJvbSBhIDQ4LWJp
dCByYW5nZSAoc3Y0OCkuIFRoaXMgZGVmYXVsdCBiZWhhdmlvciBpcyBhY2hpZXZlZCBieQo+ID4g
K3Bhc3NpbmcgMCBpbnRvIHRoZSBoaW50IGFkZHJlc3MgcGFyYW1ldGVyIG9mIG1tYXAuIE9uIENQ
VXMgd2l0aCBhbiBhZGRyZXNzIHNwYWNlCj4gPiArc21hbGxlciB0aGFuIHN2NDgsIHRoZSBDUFUg
bWF4aW11bSBzdXBwb3J0ZWQgYWRkcmVzcyBzcGFjZSB3aWxsIGJlIHRoZSBkZWZhdWx0Lgo+ID4g
Kwo+ID4gK1NvZnR3YXJlIGNhbiAib3B0LWluIiB0byByZWNlaXZpbmcgVkFzIGZyb20gYW5vdGhl
ciBWQSBzcGFjZSBieSBwcm92aWRpbmcKPiA+ICthIGhpbnQgYWRkcmVzcyB0byBtbWFwLiBBIGNh
bGwgdG8gbW1hcCBpcyBndWFyYW50ZWVkIHRvIHJldHVybiBhbiBhZGRyZXNzCj4gPiArdGhhdCB3
aWxsIG5vdCBvdmVycmlkZSB0aGUgdW5zZXQgbGVmdC1hbGlnbmVkIGJpdHMgaW4gdGhlIGhpbnQg
YWRkcmVzcywKPiA+ICt1bmxlc3MgdGhlcmUgaXMgbm8gc3BhY2UgbGVmdCBpbiB0aGUgYWRkcmVz
cyBzcGFjZS4gSWYgdGhlcmUgaXMgbm8gc3BhY2UKPiA+ICthdmFpbGFibGUgaW4gdGhlIHJlcXVl
c3RlZCBhZGRyZXNzIHNwYWNlLCBhbiBhZGRyZXNzIGluIHRoZSBuZXh0IHNtYWxsZXN0Cj4gPiAr
YXZhaWxhYmxlIGFkZHJlc3Mgc3BhY2Ugd2lsbCBiZSByZXR1cm5lZC4KPiA+ICsKPiA+ICtGb3Ig
ZXhhbXBsZSwgaW4gb3JkZXIgdG8gb2J0YWluIDQ4LWJpdCBWQSBzcGFjZSwgYSBoaW50IGFkZHJl
c3MgZ3JlYXRlciB0aGFuCj4gPiArOmNvZGU6YDEgPDwgMzhgIG11c3QgYmUgcHJvdmlkZWQuCj4g
Cj4gSXMgdGhpcyBjb3JyZWN0PyBTaG91bGRuJ3QgdGhlIGhpbnQgYmUgc3RyaWN0bHkgZ3JlYXRl
ciB0aGFuIHRoZQo+IGFkZHJlc3Mgc3BhY2UgaXQgdGFyZ2V0cz8gSW4gcGF0Y2ggMSwgeW91IHN0
YXRlIHRoYXQgIkEgaGludCBhZGRyZXNzCj4gcGFzc2VkIHRvIG1tYXAgd2lsbCBjYXVzZSB0aGUg
bGFyZ2VzdCBhZGRyZXNzIHNwYWNlIHRoYXQgZml0cyBlbnRpcmVseQo+IGludG8gdGhlIGhpbnQg
dG8gYmUgdXNlZCIsIGl0IHNlZW1zIGNvbnRyYWRpY3RvcnkgdG8gbWUuCj4gClRoYXQgaXMgYSBt
aXN0YWtlLCBpdCBzaG91bGQgaGF2ZSBhIGhpbnQgYWRkcmVzcyBncmVhdGVyIHRoYW4gMSA8PCA0
Ny4gSQp3aWxsIGZpeCB1cCB0aGUgd29yZGluZyBoZXJlLgo+ID4gTm90ZSB0aGF0IHRoaXMgaXMg
MzggZHVlIHRvIHN2MzkgdXNlcnNwYWNlCj4gPiArZW5kaW5nIGF0IDpjb2RlOmAxIDw8IDM4YCBh
bmQgdGhlIGFkZHJlc3NlcyBiZXlvbmQgdGhpcyBhcmUgcmVzZXJ2ZWQgZm9yIHRoZQo+ID4gK2tl
cm5lbC4gU2ltaWxhcmx5LCB0byBvYnRhaW4gNTctYml0IFZBIHNwYWNlIGFkZHJlc3NlcywgYSBo
aW50IGFkZHJlc3MgZ3JlYXRlcgo+ID4gK3RoYW4gb3IgZXF1YWwgdG8gOmNvZGU6YDEgPDwgNDdg
IG11c3QgYmUgcHJvdmlkZWQuCj4gPiAtLQo+ID4gMi40MS4wCj4gPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
