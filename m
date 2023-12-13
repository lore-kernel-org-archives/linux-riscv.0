Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98423C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 16:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=njxagnjMICmaZdoMtvdzQoVp/PWE53BiqSIFV76Rwg0=; b=uWzaXNJufuuq68
	7wt2JXdiaoWNnBjsKV2hFJRPLtekZWTd/JdNsfLpLRAN0AEn+vTyUJ5xpwzV47A+P4nr3rXW7xpHo
	T+10k0Ysj/pTU8Xa/uohjH6bQqpaDmNyjOj3XUMaRYSUKSoQ0xwuzhtOHak+byiJcAV3NNZqegiEB
	Z66r0qkOXTRdKFczECJkjAdLVvLtFkWm8jm+usHZpbyxitgMUAFUMINYRDRS+qx4al9j2/VGaTBbc
	xEAzPGZEwgq5Xvzl3RY1bZzxoejfN9UvDe9n0MMepXmuWdPCNVIoF6QRhrF22hirycxfZ2VYnmrdd
	PtL4/+98Rt7pYfhYppUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDS78-00FSWE-2N;
	Wed, 13 Dec 2023 16:29:38 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDS76-00FSUM-1C
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 16:29:37 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-28694702c18so6885764a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 08:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702484975; x=1703089775; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9dn7GmspgNgHEGY9A6dD5fii8/D9Qo2vxkgBCvUsaw=;
        b=MrzXkGHbE/oS2qexVJ8UBr3q48hLY867mO7uk/cUZj3O52JhqUUDywvNlwtNwHz8Ap
         4L78v4eBRyX6/h1Zd6PdCu7ug+ucbK737u9IrQrv23yeEvMd7NT2ST75qqy8bIbHVAeF
         9hkyWcF0y4whr128mvZ6y7XzehhqRROQdQG9RIjBjAkubF5mH9nAgRzyqwJjVjQrrFGv
         MZYw4WXNRuh2OnE960oj1xDqXm6ExhR19JaYUMIcjgn/d4WnXiQtMiHv1F9CKO72aVia
         GZoJ60Cyt1LWoCP9DTlYXBZA17t3gklBXpHFxSSZacD7ZwUQCZeNquW5xVnIfkLpvMLP
         /frQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702484975; x=1703089775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9dn7GmspgNgHEGY9A6dD5fii8/D9Qo2vxkgBCvUsaw=;
        b=b94PnvKcQNB+2v0Jz7BzhmgMmSuGbnXr7R9+uB0HFzVHjKDRLIG1KgezsuGluiLpje
         p2fUEPPLjwjvztU6kOQ8+cbKG9YPer3RY+Ia7Zre/dJ0FuUudrXFeCiBFdTCTxbDsNt6
         ts9cWanJcunZtheHc2AEbUjSemF+fe5FOm9ijrafX102PU2lu5zwF5oszjbLKf5R7zOO
         2lCmJ5GpAEaTrc963VhIn+vYI5J4T/OJLGwSI5FDS2wBfkqMDgzCLTjBMMPOHz1LZSr4
         2WwOc5WG7THGAImTDqqjBcpIAcGqUoe781stZp8Fr+6SJ69m5E6xo/lHYmXZBLAOYHph
         0yaQ==
X-Gm-Message-State: AOJu0YyoE+T5GRhjRMTzxLiqvzW6m/gRhu7SRsD+bKz0cEHxAA1UIj1U
	PZA9x86YFhUnC5QZn7ykZRqSCGaVU5EPxzgOSNn8lw==
X-Google-Smtp-Source: AGHT+IGUUDRH493jO4UobfoZvgJ13WlODORyUASGuNabfleAyyTFptP1ZlT4rW/DVG6CMrV7geI8cOhs3nt9AjAEBdU=
X-Received: by 2002:a17:90b:10d:b0:286:a454:6b43 with SMTP id
 p13-20020a17090b010d00b00286a4546b43mr6149233pjz.18.1702484974866; Wed, 13
 Dec 2023 08:29:34 -0800 (PST)
MIME-Version: 1.0
References: <20231130183537.55203-8-ajones@ventanamicro.com>
In-Reply-To: <20231130183537.55203-8-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 Dec 2023 21:59:22 +0530
Message-ID: <CAAhSdy0ic5ERKR8Q2VdSOzNSgV22omE_7qPN0fNcUTxawZRn4w@mail.gmail.com>
Subject: Re: [PATCH 0/6] RISC-V: KVM: Make SBI uapi consistent with ISA uapi
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	atishp@atishpatra.org, palmer@dabbelt.com, haibo1.xu@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_082936_407284_6046638C 
X-CRM114-Status: GOOD (  14.36  )
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

T24gRnJpLCBEZWMgMSwgMjAyMyBhdCAxMjoxOeKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gU0JJIGV4dGVuc2lvbiBVQVBJIGlzIGN1cnJlbnRs
eSBhbG1vc3QgdGhlIHNhbWUgYXMgdGhlIElTQSBleHRlbnNpb24KPiBVQVBJLiBUaGlzIHNlcmll
cyBjbG9zZXMgdGhlIHJlbWFpbmluZyBnYXAgYnkgZW5zdXJpbmcgd2hlbiBhbiBTQkkKPiBleHRl
bnNpb24gaXMgbm90IGF2YWlsYWJsZSB0aGF0IGl0cyByZWdpc3RlciByZXR1cm5zIEVOT0VOVCB3
aGVuCj4gYWNjZXNzZWQgYnkgdXNlcnNwYWNlLiBXZSBhbHNvIGRyb3AgdGhlIFNCSSBtdWx0aSBy
ZWdpc3RlcnMgZnJvbQo+IGdldC1yZWctbGlzdCAoSVNBIG11bHRpIHJlZ2lzdGVycyBhcmVuJ3Qg
dGhlcmUgZWl0aGVyKSBhbmQgbWFrZQo+IHNldmVyYWwgaW1wcm92ZW1lbnRzIHRvIHRoZSBnZXQt
cmVnLWxpc3Qga3NlbGZ0ZXN0Lgo+Cj4gVGhpcyBzZXJpZXMgaXMgYmFzZWQgb24gQW51cCdzIHJp
c2N2X2t2bV9tb3JlX2V4dHNfdjEgYnJhbmNoLgo+IEJhc2VkLW9uOiAyMDIzMTEyODE0NTM1Ny40
MTMzMjEtMS1hcGF0ZWxAdmVudGFuYW1pY3JvLmNvbQo+Cj4gVGhhbmtzLAo+IGRyZXcKPgo+IEFu
ZHJldyBKb25lcyAoNik6Cj4gICBSSVNDLVY6IEtWTTogRG9uJ3QgYWRkIFNCSSBtdWx0aSByZWdz
IGluIGdldC1yZWctbGlzdAo+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBEcm9wIFNCSSBtdWx0
aSByZWdpc3RlcnMKPiAgIFJJU0MtVjogS1ZNOiBNYWtlIFNCSSB1YXBpIGNvbnNpc3RlbnQgd2l0
aCBJU0EgdWFwaQoKSSBhbSBub3QgYWJsZSB0byBsb2NhdGUgdGhpcyBwYXRjaCBvbiB0aGUgbWFp
bGluZyBsaXN0IGFzIHdlbGwgYXMgb24KcGF0Y2h3b3JrLgoKQ2FuIHlvdSByZS1zZW5kIHRoaXMg
c2VyaWVzID8KClJlZ2FyZHMsCkFudXAKCj4gICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBS
SVNDVl9TQklfRVhUX1JFRwo+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBVc2UgcmVnaXN0ZXIg
c3VidHlwZXMKPiAgIFJJU0MtVjogS1ZNOiBzZWxmdGVzdHM6IFRyZWF0IFNCSSBleHQgcmVncyBs
aWtlIElTQSBleHQgcmVncwo+Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2Jp
LmggICAgICAgICB8ICAxMCArLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAg
ICAgICAgICAgICAgfCAgNTMgKy0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jICAgICAg
ICAgICAgICAgICAgICAgfCAgNzUgKysrLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcmVw
bGFjZS5jICAgICAgICAgICAgIHwgICAyICstCj4gIC4uLi9zZWxmdGVzdHMva3ZtL2luY2x1ZGUv
a3ZtX3V0aWxfYmFzZS5oICAgICB8ICAgMSArCj4gIC4uLi9zZWxmdGVzdHMva3ZtL2luY2x1ZGUv
cmlzY3YvcHJvY2Vzc29yLmggICB8ICA0MCArLS0KPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vbGliL3Jp
c2N2L3Byb2Nlc3Nvci5jICAgICAgIHwgICA0ICstCj4gIC4uLi9zZWxmdGVzdHMva3ZtL3Jpc2N2
L2dldC1yZWctbGlzdC5jICAgICAgICB8IDI3NCArKysrKysrKysrKystLS0tLS0KPiAgOCBmaWxl
cyBjaGFuZ2VkLCAyODEgaW5zZXJ0aW9ucygrKSwgMTc4IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAy
LjQzLjAKPgo+Cj4gLS0KPiBrdm0tcmlzY3YgbWFpbGluZyBsaXN0Cj4ga3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
