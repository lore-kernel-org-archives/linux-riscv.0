Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D6BC71157
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 06:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoOVR4z1KWFJuJao5lPYmZBPx6ZMh9YSdZB35mju/70=; b=MLKycw33DLnSYX
	LOIGRvJxINWVtygX7Ig8DL52nfOk3b6rlv1HP7dZRy+nnq3HZl7dIP6seCo+zFU/6YJjZ9ktq7uAz
	10dcJAAB19IjAXKKlv4AbZztjRIlw/CesP2BdDZjN3YCD+ggCmQZer63gWcCc7QsyujJZgZb5zPIf
	1NiYhpDSLVYYMHiKakMt6phz24otj4SVQQzFaUMQTy8id68FxwMvS+S1KfgiGBJA0P6gsjPfhHN7f
	UechD4np3qw4Aey1VV/b4qW3BLqeAv5GN9K8pcN1aV7tyPrU8iJ6Z81GCH2jqdszq97Ao2Uh3wN9e
	HmCcFvhoG7aDD2DZ6wqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxEl-00000004lpG-3ttx;
	Tue, 24 Jun 2025 06:34:31 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTwxw-00000004kaW-413U
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 06:17:10 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3ddd68aeb4fso294295ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 23:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1750745828; x=1751350628; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYG91yD8Ep2EXRSGpuOy5eRtahYB+nXeo+0C962eFWM=;
        b=q0reRjbaWvI5FUcGLGSjDbv6wE7gKbqnnxGxAWn/G+oEkFXNtnTy0n7O1XBCL7+jHz
         fA10UJg7M8fWNXYoxBCHKGfIbxV3g3NaG4uV9TvN/lw0kg+eWxKWr+FYl9TD/NFJbaKC
         haFwZ5UFVt1iR44rvZrphDYxqBXdbRgmrAs87gdyG/4fKfn7zkFkgyBGQ9mVctzuKvJw
         eKWPtXFW7xIiC4NurVToNzsuzpfJlKQyD/77KuqNLnAzuKVPIQrBNFkkIRjkWwsC/Xkv
         LctzIRcvIa8PAxbE+AeWxaV7A994GxNMh0j5Y3ALxKNtqetXXNtYmjIRADcUOzXe1+Sz
         Iypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745828; x=1751350628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYG91yD8Ep2EXRSGpuOy5eRtahYB+nXeo+0C962eFWM=;
        b=eIsDLijqlw1DtkvBFKbEDGZ8eHvVJ07Pp8j3z4ZKyVy0Ny/OqDDWo4zqPavwA+hSYo
         Lrnhq/EU8VuCeGaRRlQxU0S2WQSNal0snh6kLCeU94QMrtdX2D7lYD9qGzRMQTOkjlwx
         8UsGWZWdQlIeX6FhZkF22Q9zYlwMDTxVFgzmwfM15gTOYfMgvTQETZGNX+YdaajEJwy4
         QkPZT4Y99BUsyO84HivNfGj/FqYL75XSM5IGMDebMThuxP4salo8Ynqb7PTU/EM8YX1y
         Y47eFcAr4pWXQw/FvQsrjSRb4m3mnjYAgBBIV3AdJ14oR5g806E7doyBfkKI9FPuUwBm
         nvlg==
X-Forwarded-Encrypted: i=1; AJvYcCXuUgo5vsl72Crr79lJ4Vva1qAUZaaZX0Bo4Yd6qnIdpg6zjTJYihbIm9SEsi1a+dK0+l4AgZHQieVPkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0Sh+GdfPoaMTGyYrcBOgM71ArWjnDXhnNH3r4yb47quYqL/Op
	Ab1wGXfepxSiBVQgosQIgdV7q+LddRHRij1nc1vKyLpi3C+abukdNSk0/kB/YTCbIQ79qMHD7SY
	b06GkYXGQGYWvdv3GnM13lT8PTzYpcF7/zaM9jxYlsg==
X-Gm-Gg: ASbGncuhLoy71gWPXAa5gZT/d2Gh79yV9SmwpGm2iieDl7vq/5Xd8LRZU6F6f/OiATL
	cdWb6aZK4Ti+aYnKoo88RbEyhlYqeEnt3HJ9cshBwlbwosu1HmgUU1jeuoSHPwBxb32eXG5Jy3n
	7vipahtgnrNcS0jm2ib/cp1VpnGoUiy0sgREohjude+Kh0QTJcSyg8NQe/9IL8WITqdre00oZMw
	2YVBmB7u4NMhtA=
X-Google-Smtp-Source: AGHT+IFwOF9k2nb1vIM4HBKlhQn3P/HTPfDXxywRlHGTWdHMw5hoNm/+IT6iRV+qxyKkYESXR3ipGWMbxS5qleBQHcE=
X-Received: by 2002:a05:6e02:1fc8:b0:3d9:6485:39f0 with SMTP id
 e9e14a558f8ab-3de38c5547cmr149451765ab.9.1750745828023; Mon, 23 Jun 2025
 23:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250618113532.471448-1-apatel@ventanamicro.com>
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 Jun 2025 11:46:56 +0530
X-Gm-Features: AX0GCFs_mePpNxQYfE3ujwI_mugaGrSNJrso1cJLOw_Iw1ipREGGeBwAWpV5eNU
Message-ID: <CAAhSdy0=aAzu=Hu72h21GU2bxBZ+oVWuZG6TDiOag2NYBf=ATA@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] MMU related improvements for KVM RISC-V
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_231709_259113_7857667E 
X-CRM114-Status: GOOD (  17.76  )
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

T24gV2VkLCBKdW4gMTgsIDIwMjUgYXQgNTowNeKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIHByaW1hcmlseSBoYXMgdmFyaW91
cyBNTVUgaW1wcm92ZW1lbnRzIGZvciBLVk0gUklTQy1WCj4gYW5kIGl0IGFsc28gc2VydmVzIGFz
IGEgcHJlcGFyYXRvcnkgc2VyaWVzIGZvciB0aGUgdXBjb21pbmcgbmVzdGVkCj4gdmlydHVhbGl6
YXRpb24gc3VwcG9ydC4KPgo+IFBBVENIMSB0byBQQVRDSDQ6IEZldyBjb3NtZXRpYyBpbXByb3Zl
bWVudHMKPiBQQVRDSDUgdG8gUEFUQ0g3OiBUTEIgbWFpbnRlbmFuY2UgYW5kIFNCSSBOQUNMIHJl
bGF0ZWQgaW1wcm92ZW1lbnRzCj4gUEFUQ0g4IHRvIFBBVENIMTI6IE1NVSByZWxhdGVkIHByZXBh
cmF0b3J5IHdvcmsgZm9yIG5lc3RlZCB2aXJ0dWFsaXphdGlvbgo+Cj4gVGhlc2UgcGF0Y2hlcyBj
YW4gYWxzbyBiZSBmb3VuZCBpbiB0aGUgcmlzY3Zfa3ZtX21tdV9pbXBfdjMgYnJhbmNoCj4gYXQ6
IGh0dHBzOi8vZ2l0aHViLmNvbS9hdnBhdGVsL2xpbnV4LmdpdAo+Cj4gQ2hhbmdlcyBzaW5jZSB2
MjoKPiAgLSBSZWJhc2VkIHVwb24gTGludXgtNi4xNi1yYzIgYW5kIGxhdGVzdCByaXNjdl9rdm1f
cXVldWUgYnJhbmNoCj4gIC0gQWRkZWQgUmV2aWV3ZWQtYnkgdGFncyB0byBhcHByb3ByaWF0ZSBw
YXRjaGVzCj4KPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ICAtIFJlYmFzZWQgdXBvbiBMaW51eC02LjE2
LXJjMQo+ICAtIERyb3BwZWQgUEFUQ0gxIGFuZCBQQVRDSDIgb2YgdjEgc2VyaWVzIHNpbmNlIHRo
ZXNlIGFyZSBxdWV1ZWQKPiAgICBhcyBmaXhlcyBmb3IgTGludXgtNi4xNgo+ICAtIEFkZHJlc3Nl
ZCBBdGlzaCdzIGNvbW1lbnQgb24gUEFUQ0gxIGluIHRoaXMgc2VyaWVzCj4gIC0gQWRkZWQgbmV3
IFBBVENINyBpbiB0aGlzIHNlcmllcwo+Cj4gQW51cCBQYXRlbCAoMTIpOgo+ICAgUklTQy1WOiBL
Vk06IENoZWNrIGt2bV9yaXNjdl92Y3B1X2FsbG9jX3ZlY3Rvcl9jb250ZXh0KCkgcmV0dXJuIHZh
bHVlCj4gICBSSVNDLVY6IEtWTTogRHJvcCB0aGUgcmV0dXJuIHZhbHVlIG9mIGt2bV9yaXNjdl92
Y3B1X2FpYV9pbml0KCkKPiAgIFJJU0MtVjogS1ZNOiBSZW5hbWUgYW5kIG1vdmUga3ZtX3Jpc2N2
X2xvY2FsX3RsYl9zYW5pdGl6ZSgpCj4gICBSSVNDLVY6IEtWTTogUmVwbGFjZSBLVk1fUkVRX0hG
RU5DRV9HVk1BX1ZNSURfQUxMIHdpdGgKPiAgICAgS1ZNX1JFUV9UTEJfRkxVU0gKPiAgIFJJU0Mt
VjogS1ZNOiBEb24ndCBmbHVzaCBUTEIgd2hlbiBQVEUgaXMgdW5jaGFuZ2VkCj4gICBSSVNDLVY6
IEtWTTogSW1wbGVtZW50IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKCkKPiAgIFJJ
U0MtVjogS1ZNOiBVc2UgbmNzcl94eXooKSBpbiBrdm1fcmlzY3ZfdmNwdV90cmFwX3JlZGlyZWN0
KCkKPiAgIFJJU0MtVjogS1ZNOiBGYWN0b3Itb3V0IE1NVSByZWxhdGVkIGRlY2xhcmF0aW9ucyBp
bnRvIHNlcGFyYXRlIGhlYWRlcnMKPiAgIFJJU0MtVjogS1ZNOiBJbnRyb2R1Y2Ugc3RydWN0IGt2
bV9nc3RhZ2VfbWFwcGluZwo+ICAgUklTQy1WOiBLVk06IEFkZCB2bWlkIGZpZWxkIHRvIHN0cnVj
dCBrdm1fcmlzY3ZfaGZlbmNlCj4gICBSSVNDLVY6IEtWTTogRmFjdG9yLW91dCBnLXN0YWdlIHBh
Z2UgdGFibGUgbWFuYWdlbWVudAo+ICAgUklTQy1WOiBLVk06IFBhc3MgVk1JRCBhcyBwYXJhbWV0
ZXIgdG8ga3ZtX3Jpc2N2X2hmZW5jZV94eXooKSBBUElzCgpRdWV1ZWQgdGhpcyBzZXJpZXMgZm9y
IExpbnV4LTYuMTcKClRoYW5rcywKQW51cAoKPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2
bV9haWEuaCAgICB8ICAgMiArLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2Uu
aCB8ICA3MiArKysrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCAgIHwgMTAz
ICstLS0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9tbXUuaCAgICB8ICAyMSArKwo+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV90bGIuaCAgICB8ICA4NCArKysrKwo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92bWlkLmggICB8ICAyNyArKwo+ICBhcmNoL3Jpc2N2L2t2
bS9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgMSArCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9kZXZp
Y2UuYyAgICAgICAgIHwgICA2ICstCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jICAgICAg
ICAgIHwgIDEyICstCj4gIGFyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jICAgICAgICAgICAgIHwgMzM4
ICsrKysrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9rdm0vbWFpbi5jICAgICAgICAgICAg
ICAgfCAgIDMgKy0KPiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgICAgICAgICAgICAgICAgfCA0OTkg
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS90bGIuYyAgICAg
ICAgICAgICAgICB8IDExMCArKystLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAg
ICAgICAgfCAgMjYgKy0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgICAgICAgICAgfCAg
MjAgKy0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jICAgfCAgMTcgKy0KPiAg
YXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfdjAxLmMgICAgICAgfCAgMjUgKy0KPiAgYXJjaC9yaXNj
di9rdm0vdm0uYyAgICAgICAgICAgICAgICAgfCAgIDcgKy0KPiAgYXJjaC9yaXNjdi9rdm0vdm1p
ZC5jICAgICAgICAgICAgICAgfCAgMjUgKysKPiAgMTkgZmlsZXMgY2hhbmdlZCwgNzk1IGluc2Vy
dGlvbnMoKyksIDYwMyBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2t2bV9tbXUuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9rdm1fdGxiLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20va3ZtX3ZtaWQuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9r
dm0vZ3N0YWdlLmMKPgo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
