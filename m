Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9468FC77B7F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 04:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mpfGRJMHv5JntK7KyAMu+S2RjbUqg0ckVVIwu2SRyrY=; b=kLDg+Erx9p3LeU
	lIW7JcVdMMqMB8yv7u4JdXhq3NZgOg+O+klzJb/65v0cJOzESvIDq/sc98hV9BjPEIn+mXWiAPDOZ
	gUuytMJQ8BGvj2cpfn2/n1l1h7nkrlQwUSUV2rFSRHlb+08MVR3fbLow2DCYw4m4lh4x2GvzeFEvf
	a6tzRyNflL+vuZMIpGpTEvp+qmEiGFh5t6zG3IIzC//3wnDhkNQwZk7e0R+j+u1tHCvmv7saKqMSR
	Qe6JbB+9z3P1cIapFNLf29pgVjl7EjuAe6eOy3ccdWYK/bKuuMsTUwJewSgk5jyQ0V5+m58u4fE7U
	MolwCaE1UzhwsHBYox3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvss7-00HGFk-1P;
	Mon, 08 May 2023 04:53:15 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvss3-00HGF1-2m
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 04:53:13 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50bdd7b229cso7796131a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 07 May 2023 21:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683521589; x=1686113589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tj282JyJVQUgRutNdXOQYurEIFEN0tNVyi4CZOQ3wIM=;
        b=G/3XOrDA/b6w37PRj/w1YQKfSatKaHvpnfAp9lE9NyC61Q36cK+VV9xC6ev1D3boZY
         D2ORv2EjmUiGKqkpi73/IUbMglDluyQuc3km+gVAAqmH/OdXNlqKOCINb06cdW6JK1Pg
         60ENB4zGDGAFuFnp1bTVht5+V4tUQMS1IpEswdNj6KW8btKwrEfF73FEou7F3WzGV87y
         jqe1EcqKFsHYZtA0gvuIJSoD/cMnH/jVTiUfjY7vTDgF/we/cgsGZwVwUhd6WdSp/jL7
         mQlDwCCGKBD9eKKHDhtix6o8xGAXTm8GJQdx1Wxw0iqMlqL1KsRi5TZPiSUDt61SNfK7
         YpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683521589; x=1686113589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tj282JyJVQUgRutNdXOQYurEIFEN0tNVyi4CZOQ3wIM=;
        b=OixH1iZjDez+n8K9EtfsKmOp66Dlb8PNACC8jNGL0zWbs/gLamFch9mYqU1p+ebrjZ
         PkZB5RYeroqz1Ab5ODmf1IXzuFZIR7m7L8QidtWVs1oKY0GGWJTse/kHfTCLhfFph59C
         vTb6ICsTxg1nL5dmBmYGKOtEn9GHI7tk5gbjrQGtKYhPA6ICvjK9vUxzlid0JuBbeS/p
         L9VEgNkP+hBdrc0akSRlzhtPRWF9i6r6Nb+EibyPUKn2+SOXpOtg0WNvVy19VGy5/7Tc
         EBA3fdLVkaklbr0qyxpSeXGbMY4K4jAdK4LoMzC1bE8IlSjCPh1CfOp4tqO7TTeJHR2H
         zx+w==
X-Gm-Message-State: AC+VfDzsCaaNXswnzxacZakMz26DVlrqLJNRTA9OuIQHteAqCaWhsnOY
	HW1TFgQpZDG9TgAPmeyaNTWgnCeKOfw2OFCW0lzLhVZ0tdE=
X-Google-Smtp-Source: ACHHUZ6BwAPhomteCeBltcZmEsbA/mGMQbj0BYwkXjY/2amuBNCqHy5iRGTfDOHRx3rr1LiNDsIKhORiWyAsJrJ4uRg=
X-Received: by 2002:a17:907:31c9:b0:94f:6627:22b5 with SMTP id
 xf9-20020a17090731c900b0094f662722b5mr7060809ejb.47.1683521589347; Sun, 07
 May 2023 21:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAKXUXMyVeg2kQK_edKHtMD3eADrDK_PKhCSVkMrLDdYgTQQ5rg@mail.gmail.com>
 <CAJF2gTRNxex0JBMt21HLeHDKh78e9aBEw81Q3TVyb-=CunSH4Q@mail.gmail.com>
In-Reply-To: <CAJF2gTRNxex0JBMt21HLeHDKh78e9aBEw81Q3TVyb-=CunSH4Q@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 8 May 2023 06:52:58 +0200
Message-ID: <CAKXUXMwgmFTB5dxcGBWMnJjHS5jB+PXxTm2GEG7bezyqD=cbSA@mail.gmail.com>
Subject: Re: In-flight collision: ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP renaming
To: Guo Ren <guoren@kernel.org>
Cc: Guo Ren <guoren@linux.alibaba.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	linux-riscv@lists.infradead.org, Linux-MM <linux-mm@kvack.org>, 
	kernel-janitors <kernel-janitors@vger.kernel.org>, Muchun Song <songmuchun@bytedance.com>, 
	Andrew Jones <ajones@ventanamicro.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_215311_901141_640224E9 
X-CRM114-Status: GOOD (  19.47  )
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

T24gRnJpLCBNYXkgNSwgMjAyMyBhdCA4OjE24oCvQU0gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBBcHIgMjQsIDIwMjMgYXQgNTo0MOKAr1BNIEx1a2FzIEJ1
bHdhaG4gPGx1a2FzLmJ1bHdhaG5AZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBEZWFyIEd1byBS
ZW4sIGRlYXIgUGFsbWVyLAo+ID4KPiA+IG9uIGxpbnV4LW5leHQsIEkgaGF2ZSBub3RpY2VkIHRo
YXQgeW91IGhhdmUgc3VibWl0dGVkIGFuZCBhZGRlZCB0aGUKPiA+IGNvbW1pdCBhM2M3ZDZiNjQy
ZTQgKCJyaXNjdjogbW06IGh1Z2V0bGI6IEVuYWJsZQo+ID4gQVJDSF9XQU5UX0hVR0VUTEJfUEFH
RV9PUFRJTUlaRV9WTUVNTUFQIiksIHRoYXQgYWRkcyB0aGUgc2VsZWN0Cj4gPiBBUkNIX1dBTlRf
SFVHRVRMQl9QQUdFX09QVElNSVpFX1ZNRU1NQVAgdG8gdGhlIFJJU0NWIGNvbmZpZy4gQXMgaXQK
PiA+IHNlZW1zLCBBbmVlc2ggS3VtYXIgSy5WIGhhcyBjb25jdXJyZW50bHkgcmVuYW1lZCB0aGlz
IGNvbmZpZwo+ID4gdGhyb3VnaG91dCB0aGUgdHJlZSB3aXRoIGNvbW1pdCAyMTUyMThkZGRkMjUg
KCJtbS9odWdldGxiX3ZtZW1tYXA6Cj4gPiByZW5hbWUgQVJDSF9XQU5UX0hVR0VUTEJfUEFHRV9P
UFRJTUlaRV9WTUVNTUFQIiksIGJ1dCB5b3VyIGNvbW1pdCB3YXMKPiA+IG5vdCB2aXNpYmxlIHRv
IHRoYXQgcmVuYW1pbmcuIFdoZW4gYm90aCBjb21taXRzIGFyZSBtZXJnZWQgaW4gYSBjb21tb24K
PiA+IHRyZWUtLS1hcyBoYXBwZW5zIHdpdGggbGludXgtbmV4dCwgYW5kIHdpbGwgc29vbiBoYXBw
ZW4gd2l0aCBMaW51cycKPiA+IHRyZWUsIHlvdXIgY29tbWl0IGEzYzdkNmI2NDJlNCB3aWxsIGRv
IG5vdGhpbmcgKHNlbGVjdCBubyBleGlzdGluZwo+ID4gY29uZmlnIGFueW1vcmUpLgo+ID4KPiA+
IEl0IGlzIGVhc3kgdG8gZml4LCBhZGp1c3QgdGhpcyBvbmUgbGluZSB0byB0aGUgcmVuYW1pbmcg
YW5kICdzZWxlY3QKPiA+IEFSQ0hfV0FOVF9PUFRJTUlaRV9WTUVNTUFQJy4gRm9yIG5vdywgSSBh
bSBqdXN0IHJlcG9ydGluZyB0byBsZXQgeW91Cj4gPiBrbm93OyBwcm9iYWJseSwgaXQgaXMgYmVz
dCB0byBnZXQgYSBxdWljayBmaXgtdXAgcGF0Y2ggd2l0aCAtcmMyLCBvbmNlCj4gPiBhbGwgdGhl
IGNoYW5nZXMgbGFuZGVkIGluIC1yYzEuCj4gVGh4IGZvciB0YWtpbmcgY2FyZTsgcGxlYXNlIGZp
eCB0aGF0Lgo+CgpKdXN0IGZvciB0aGUgcmVjb3JkOgoKQ29ub3IgRG9vbGV5IHNlbnQgYSBwYXRj
aCBhZnRlciB0aGUgbWVyZ2Ugb2YgdGhlIHR3byB0cmVlcywgYWRkcmVzc2luZwp0aGUgaXNzdWUu
IFRoaXMgcGF0Y2ggaXMgaW5jbHVkZWQgaW4gdjYuNC1yYzEgYXMgY29tbWl0IDI2YjA4MTJmNGNm
OAooIlJJU0MtVjogZml4dXAgaW4tZmxpZ2h0IGNvbGxpc2lvbiB3aXRoIEFSQ0hfV0FOVF9PUFRJ
TUlaRV9WTUVNTUFQCnJlbmFtZSIpCgpTbywgdGhlIGlzc3VlIGlzIHJlc29sdmVkLgoKTHVrYXMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
