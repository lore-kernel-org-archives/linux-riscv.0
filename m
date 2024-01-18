Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD48C4707B
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 12:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RH7RSR3cBZ6eXbfWxJfijgXNTiVIZ5tbfGOwHcBeXHw=; b=JPvw7J9hgr/XpW
	Bsd7i82gMkOXooQkBJd/WmVb4Job3SOVkFON9uqy6TWgHPMxSlUsio/nu/VSKOyWuE7S0cgyRL3fI
	MxOWy6VVU0STp9N1i4bTbT5kBxRI+x/BX73fN0mop5ZBpDODM4PWuhfrbCFla0RUTjyXi69y+XZHo
	P6uTjTdGKuJDuL9dWx8qFj1rsjnSXLG8y0wWQ+VjivRnbdS3BqbvzCJsKxDxpGWtf4v3YwThp6hkL
	hEba+Ub3SuUZ603zDFv2bU8XW8AjuHtk73aBHLOIU1obuHzRtJAtprnBCv7VlQExvpCxcxiajLOpN
	JWn+jxoE7W0ATadQfk1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQRlT-002lGW-21;
	Thu, 18 Jan 2024 12:44:59 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQRlP-002lDz-2K
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 12:44:58 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3606ebda57cso57539075ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jan 2024 04:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1705581894; x=1706186694; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CWJqfzPlIKbIm9XXUGeYPV3xbAqaiB/K2JIOon3tWs=;
        b=A5pkw+9XBFjlITTCZmvIcnkSf7pViWyLcLpWjPOQ8dYMQmd2sr9KMpOw8zJAwNQ2eE
         sn9ailDO7sJYlzSch0cPVvNWPywGYyzu2zI6esQBnutOUpC5n7g5K01/8IqJAiU4ZMhs
         7OBuNsynhvLhb4El8oB6c4m/hbwNPqLK/6vTSN6TJg5Nrz/Xg0ercZeZHzbByi4WRqTj
         MDblnL0xlKaX2rtmY3+xOgQMZYV7l9k/DJ92R1n6wL211aEW1kYEYLtmiD90SRihfNqi
         EfuY8ndKJeZM6tiMRFAF9ZHrKcaMMNUfBM9Ka+QCJBovfeL6RzdgVex7Q9KGB2ljkRQq
         eN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705581894; x=1706186694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CWJqfzPlIKbIm9XXUGeYPV3xbAqaiB/K2JIOon3tWs=;
        b=wdgfLMSgaVboTEfq4d1YnhMOR5urGBUI+tYd567E7jNQ/P5pNHKunQFeqNJsmQX2lZ
         GjoWItbwF+PlaxqopkXQ8J2NArd5PY1wpCz5V62mrEagdhcbzkwSKNZSLW/k4pJNJMZ8
         YFvzf3OykZFg4Hg7kX2JBHwJquQM0scxnEFS43o7w+ZaP5UrQoa8ttRpVaye550TXb67
         6TwGkqjz+M/TXl+K0RNFpSqv648ak9zDl344cxUENA5tcwg98gTyRtoF+hE6ChDp9FCS
         sf+2VVAnbRv4aFhpA+LRw2Q//ExIgi+cKy1PnLcuTfMdW+EQCn+lKn2UEVvwCX0Df0MA
         GEgA==
X-Gm-Message-State: AOJu0YzNZFx6tq5unb7Z+6hZx3JUFGOQ84H6KaBaHU4a4XjWL8u5R37R
	g3pe0IMZMM99B/9cPmW//HU2mkbDlTIgcgFeZQuqpis88fgAqfm+DKp+EsJhBQ89g0EyIM8v4p/
	uL14qUVnA79Er7Hd7EYMJT+dYTZD68Qg81I2VvQ==
X-Google-Smtp-Source: AGHT+IFJ1bu7mCR98lyWrW+kDP0nULQ1bDHopDCzu01vUiZEYsTfjPTku/pcO21lNxa+IQGYXi5gy2BL1dSF+jC1bNQ=
X-Received: by 2002:a05:6e02:96d:b0:361:a21d:d492 with SMTP id
 q13-20020a056e02096d00b00361a21dd492mr227444ilt.24.1705581893859; Thu, 18 Jan
 2024 04:44:53 -0800 (PST)
MIME-Version: 1.0
References: <20231128145357.413321-1-apatel@ventanamicro.com>
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 Jan 2024 18:14:42 +0530
Message-ID: <CAAhSdy0Q8raGzH_mUsvAo++KmWu3yqBkjNTrn8CO-ZCiYEY9Cw@mail.gmail.com>
Subject: Re: [PATCH 00/15] KVM RISC-V report more ISA extensions through ONE_REG
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_044456_784655_12645E94 
X-CRM114-Status: GOOD (  11.67  )
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

T24gVHVlLCBOb3YgMjgsIDIwMjMgYXQgODoyNOKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoaXMgZXh0ZW5kcyB0aGUgS1ZNIFJJU0MtViBPTkVf
UkVHIGludGVyZmFjZSB0byByZXBvcnQgbW9yZSBJU0EgZXh0ZW5zaW9ucwo+IG5hbWVseTogWmJ6
LCBzY2FsYXIgY3J5cHRvLCB2ZWN0b3IgY3J5cHRvLCBaZmhbbWluXSwgWmloaW50bnRsLCBadmZo
W21pbl0sCj4gYW5kIFpmYS4KPgo+IFRoaXMgc2VyaWVzIGRlcGVuZHMgdXBvbiB0aGUgInJpc2N2
OiByZXBvcnQgbW9yZSBJU0EgZXh0ZW5zaW9ucyB0aHJvdWdoCj4gaHdwcm9iZSIgc2VyaWVzLmZy
b20gQ2xlbWVudC4KPiAoTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMTEx
NDE0MTI1Ni4xMjY3NDktMS1jbGVnZXJAcml2b3NpbmMuY29tLykKPgo+IFRvIHRlc3QgdGhlc2Ug
cGF0Y2hlcywgdXNlIEtWTVRPT0wgZnJvbSB0aGUgcmlzY3ZfbW9yZV9leHRzX3YxIGJyYW5jaCBh
dDoKPiBodHRwczovL2dpdGh1Yi5jb20vYXZwYXRlbC9rdm10b29sLmdpdAo+Cj4gVGhlc2UgcGF0
Y2hlcyBjYW4gYWxzbyBiZSBmb3VuZCBpbiB0aGUgcmlzY3Zfa3ZtX21vcmVfZXh0c192MSBicmFu
Y2ggYXQ6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwvbGludXguZ2l0Cj4KPiBBbnVwIFBh
dGVsICgxNSk6Cj4gICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEdlbmVyYXRlIElTQSBleHRlbnNp
b24gcmVnX2xpc3QgdXNpbmcgbWFjcm9zCj4gICBSSVNDLVY6IEtWTTogQWxsb3cgWmJjIGV4dGVu
c2lvbiBmb3IgR3Vlc3QvVk0KPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFpiYyBleHRl
bnNpb24gdG8gZ2V0LXJlZy1saXN0IHRlc3QKPiAgIFJJU0MtVjogS1ZNOiBBbGxvdyBzY2FsYXIg
Y3J5cHRvIGV4dGVuc2lvbnMgZm9yIEd1ZXN0L1ZNCj4gICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6
IEFkZCBzY2FsZXIgY3J5cHRvIGV4dGVuc2lvbnMgdG8gZ2V0LXJlZy1saXN0Cj4gICAgIHRlc3QK
PiAgIFJJU0MtVjogS1ZNOiBBbGxvdyB2ZWN0b3IgY3J5cHRvIGV4dGVuc2lvbnMgZm9yIEd1ZXN0
L1ZNCj4gICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCB2ZWN0b3IgY3J5cHRvIGV4dGVuc2lv
bnMgdG8gZ2V0LXJlZy1saXN0Cj4gICAgIHRlc3QKPiAgIFJJU0MtVjogS1ZNOiBBbGxvdyBaZmhb
bWluXSBleHRlbnNpb25zIGZvciBHdWVzdC9WTQo+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBB
ZGQgWmZoW21pbl0gZXh0ZW5zaW9ucyB0byBnZXQtcmVnLWxpc3QgdGVzdAo+ICAgUklTQy1WOiBL
Vk06IEFsbG93IFppaGludG50bCBleHRlbnNpb24gZm9yIEd1ZXN0L1ZNCj4gICBLVk06IHJpc2N2
OiBzZWxmdGVzdHM6IEFkZCBaaWhpbnRudGwgZXh0ZW5zaW9uIHRvIGdldC1yZWctbGlzdCB0ZXN0
Cj4gICBSSVNDLVY6IEtWTTogQWxsb3cgWnZmaFttaW5dIGV4dGVuc2lvbnMgZm9yIEd1ZXN0L1ZN
Cj4gICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBadmZoW21pbl0gZXh0ZW5zaW9ucyB0byBn
ZXQtcmVnLWxpc3QgdGVzdAo+ICAgUklTQy1WOiBLVk06IEFsbG93IFpmYSBleHRlbnNpb24gZm9y
IEd1ZXN0L1ZNCj4gICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBaZmEgZXh0ZW5zaW9uIHRv
IGdldC1yZWctbGlzdCB0ZXN0CgpUaGUgZmlyc3QgUEFUQ0ggaXMgYWxyZWFkeSBtZXJnZWQgaW4g
dXBzdHJlYW0gTGludXguCgpJIGhhdmUgcmViYXNlZCBhbmQgcXVldWVkIHRoZSByZW1haW5pbmcg
cGF0Y2hlcyBmb3IgTGludXgtNi44LgoKUmVnYXJkcywKQW51cAoKPgo+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20va3ZtLmggICAgICAgICAgICAgfCAgMjcgKysKPiAgYXJjaC9yaXNjdi9r
dm0vdmNwdV9vbmVyZWcuYyAgICAgICAgICAgICAgICAgIHwgIDU0ICsrKwo+ICAuLi4vc2VsZnRl
c3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAgICAgICAgfCA0MzkgKysrKysrKystLS0tLS0t
LS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjY1IGluc2VydGlvbnMoKyksIDI1NSBkZWxldGlvbnMo
LSkKPgo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
