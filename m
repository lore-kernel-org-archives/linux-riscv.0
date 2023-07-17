Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7964EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 03:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7iooDzD8BkMR2cHl0DRkjhVfGt9JO+2s5NlYY2/slc=; b=a9uyebG7RlzJhN
	EWIS7UatquUpK5YA6Ip0OC55u0vaKTlk4hMAlgRMEMfEb/V+9Itu9C55DU5Qysrt2t3CN6hPIua9Y
	lwBgEaStnUL2ehD6u6a3y9AAYWzlbakPzSlmCAyVz/q7NHspXttO2anGTMl4BIKvx9Lz9XxkEzi+j
	cu7o5YqX7MP+X5hmfIPftrKCcH0HBoPLEnS9wsQrluh4IOVB7qRmWBh6uKbDhQVOzRG8uSI6fzAxY
	8Fbw3QHiH33gGpe5cCkIrZT0vfN+kyEcq+ZEkWqbMbf9XLYj+b9+t7iJSPMNcz8F8gvnGztxhJ0CU
	Grx+Lk7+TFUfATxlNamQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLFJg-001eqC-0K;
	Mon, 17 Jul 2023 03:54:32 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLFJa-001elL-2J
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 03:54:28 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-992b2249d82so586340366b.1
        for <linux-riscv@lists.infradead.org>; Sun, 16 Jul 2023 20:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1689566064; x=1692158064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IADBk67MmtQgEFrJ4GNzmRMtCsY7zxHXJTj9byIPGyM=;
        b=zL1UbGQQabWyZVL/qkzQG7J6gpH1aG3NKw0+gfIKICF7guBFe6P4URiTIsry1vB43c
         bHUACKVpACI3sa7hLDc+WBiVWNj+kEg1hTq47Z14aVk65UIHDCTJQzRNtTCXE5gqY9fE
         dFA6x/tlagHdw5z49kZ48idi/49e8dL6PaYQ3xMYgVlstvspYP+JESz9EkI3Fd0GzSvk
         PI8RVW68ilfaKc41gLfEgGunPkP/CCXuXkuPGjmfCL+iSZ6XmRt9j7CHkoa3k9x8ZM1a
         Zg1xaVfbGaDxBPCsMwFlRlI9VR8+SjEWMk8EgOTEgnMgMcgu/rDj1DeNe9iABrp1Q8Dq
         H9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689566064; x=1692158064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IADBk67MmtQgEFrJ4GNzmRMtCsY7zxHXJTj9byIPGyM=;
        b=ZQvB9xUZSwBK7MkucGaW8oNcSDniQBCRANtxtlfcMblzQSDThNWxmYU35AB4yPxHu7
         0klqUPB3xPzQhjUazBoxs9wLCDIWH+ACfxraRdEh4b7zMctfGszckAv2yVIOkLPrQ7zG
         UIn7AbcZ6asFAcQHtNBYv6bKlSsMeqExcrEbRUv26CNZNdUPXG9oQDgyRmo6nyqKv/Ej
         ETuWY6FHRwQyO2+8om2a5pCkDxaDHczMF9KWI9i9rOjWris/303l2A454tTEHrkMGPkH
         XX+MYiDsgPt2PpLjPaUUhsoL6tKvuqk9yAkujMxtZy4MQ81qOXV5M4WGMKb0k704jvSV
         qFkg==
X-Gm-Message-State: ABy/qLZF4up7kdJiOv0CWiM3IwZwqxyXjx3rpXHIfe+Iag8Ghlw1H545
	kMmzIK0+NXyl6RuJGZKSFLAKXnkTZjTJ7q+HunSXfg==
X-Google-Smtp-Source: APBJJlGMFjbuzvR13okMMKYKW2GKmezRZzN3Ec5qqIvk5Im4E5ilkEl+jfnCM7bLgPcLpNqXz758I9FrRMNgMcy8DR8=
X-Received: by 2002:a17:906:5185:b0:96f:a891:36cb with SMTP id
 y5-20020a170906518500b0096fa89136cbmr10978298ejk.0.1689566063601; Sun, 16 Jul
 2023 20:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
In-Reply-To: <20230712161047.1764756-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Jul 2023 09:24:12 +0530
Message-ID: <CAAhSdy048rUYUj2j+rutCc73=aE0dKgCrt75ohz9tO476+n6Gg@mail.gmail.com>
Subject: Re: [PATCH 0/7] KVM RISC-V ONE_REG ISA extension improvements
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Heiko Stuebner <heiko@sntech.de>, 
	Samuel Ortiz <sameo@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_205426_962082_60614C58 
X-CRM114-Status: GOOD (  14.42  )
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

T24gV2VkLCBKdWwgMTIsIDIwMjMgYXQgOTo0MeKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGltcHJvdmVzIHRoZSBJU0EgZXh0
ZW5zaW9uIE9ORV9SRUcgaW50ZXJmYWNlIGluIGZvbGxvd2luZyB3YXlzOgo+IDEpIE1vdmUgT05F
X1JFRyByZWxhdGVkIGNvZGUgdG8gZGVkaWNhdGVkIHNvdXJjZSBmaWxlCj4gMikgQWxsb3cgbXVs
dGlwbGUgSVNBIGV4dGVuc2lvbnMgdG8gYmUgZW5hYmxlZC9kaXNhYmxlZCBpbiBvbmUgaW9jdGwK
PiAzKSBBZGQgbW9yZSBJU0EgZXh0ZW5zaW9ucyB0byB0aGUgT05FX1JFRyBpbnRlcmZhY2UKPgo+
IFRoZSBzZXJpZXMgaGFzIGZvbGxvd2luZyBkZXBlbmRlbmNpZXM6Cj4gMSkgUEFUQ0g2IGRlcGVu
ZHMgb24KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDcxMjA4NDEz
NC4xNjQ4MDA4LTEtc2FtZW9Acml2b3NpbmMuY29tLwo+IDIpIFBBVENINyBkZXBlbmRzIG9uCj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzA3MTExNTM3NDMuMTk3MDYy
NS0xLWhlaWtvQHNudGVjaC5kZS8KPgo+IFRoZSBQQVRDSDEgdG8gUEFUQ0g1IG9mIHRoaXMgc2Vy
aWVzIGRvbid0IGRlcGVuZCBvbiBhbnkgcGF0Y2hlcy4KPgo+IFRoZXNlIHBhdGNoZXMgY2FuIGFs
c28gYmUgZm91bmQgaW4gdGhlIHJpc2N2X2t2bV9vbmVyZWdfaW1wX3YxIGJyYW5jaCBhdDoKPiBo
dHRwczovL2dpdGh1Yi5jb20vYXZwYXRlbC9saW51eC5naXQKPgo+IEFudXAgUGF0ZWwgKDcpOgo+
ICAgUklTQy1WOiBLVk06IEZhY3Rvci1vdXQgT05FX1JFRyByZWxhdGVkIGNvZGUgdG8gaXRzIG93
biBzb3VyY2UgZmlsZQo+ICAgUklTQy1WOiBLVk06IEV4dGVuZCBPTkVfUkVHIHRvIGVuYWJsZS9k
aXNhYmxlIG11bHRpcGxlIElTQSBleHRlbnNpb25zCj4gICBSSVNDLVY6IEtWTTogQWxsb3cgWmJh
IGFuZCBaYnMgZXh0ZW5zaW9ucyBmb3IgR3Vlc3QvVk0KPiAgIFJJU0MtVjogS1ZNOiBBbGxvdyBa
aWNudHIsIFppY3NyLCBaaWZlbmNlaSwgYW5kIFppaHBtIGZvciBHdWVzdC9WTQo+ICAgUklTQy1W
OiBLVk06IFNvcnQgSVNBIGV4dGVuc2lvbnMgYWxwaGFiZXRpY2FsbHkgaW4gT05FX1JFRyBpbnRl
cmZhY2UKPiAgIFJJU0MtVjogS1ZNOiBBbGxvdyBaYmMsIFpiayogYW5kIFprKiBleHRlbnNpb25z
IGZvciBHdWVzdC9WTQo+ICAgUklTQy1WOiBLVk06IEFsbG93IFp2YiogYW5kIFp2ayogZXh0ZW5z
aW9ucyBmb3IgR3Vlc3QvVk0KCkkgaGF2ZSBxdWV1ZWQgUEFUQ0gxIHRvIFBBVENINSBmb3IgTGlu
dXgtNi42IHNvIHRoYXQgb3RoZXIgaW4tZmxpZ2h0CnBhdGNoZXMgY2FuIGJlIHJlYmFzZWQgb24g
dGhlIHJpc2N2X2t2bV9xdWV1ZS4KClRoZSBQQVRDSDYgYW5kIFBBVENINyB3aWxsIGhhdmUgdG8g
d2FpdCB1bnRpbCByZXF1aXJlZCBkZXBlbmRlbmNpZXMKYXJlIG1lcmdlZCBpbiBhcmNoL3Jpc2N2
LgoKVGhhbmtzLApBbnVwCgoKPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0Lmgg
fCAgIDYgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggfCAgMzUgKysKPiAg
YXJjaC9yaXNjdi9rdm0vTWFrZWZpbGUgICAgICAgICAgIHwgICAxICsKPiAgYXJjaC9yaXNjdi9r
dm0vdmNwdS5jICAgICAgICAgICAgIHwgNTI5ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICB8IDY5NSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCA3MzggaW5zZXJ0aW9ucygrKSwgNTI4IGRl
bGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVy
ZWcuYwo+Cj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
