Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A04CFA763
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 11:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8y8UtxklZtVYPtWkgaMeEES07PVImaO4L8+nmT96r8=; b=tKootJhz+uyGMH
	EI1HPQU091F56DpPLSs679Pch1l9+IRlecU1foAwgaNN3i4gQAZNNYA8ed764iqnzjrcqN6DZA/Rx
	vsMxGmAG5vho6aFtIDAfvPlFmWd0RXU64bVx+vMWKsL6BGdtpdtgymDN7iX96NfJggtY79b7W9BXj
	8uXNVxb9vc+vbpUzEJyhn3+tH12Yo08XnnthRi/X6XMu6dLh06oqPifd5WQGFPCMeQDJl73MRhcIi
	qA4XFJeZ3MODLwAsZKzzkLURiT1N4AFS999FZ3pKKGTzXDP5l6Pvk2X49GCHUeemq5vijGSnTlENJ
	CSmYJ8+zwBSOaVl+qhiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swg9R-0000000C0tu-2Hi0;
	Fri, 04 Oct 2024 11:07:13 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swfsu-0000000Bx61-0v8O
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 10:50:11 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3e03981dad2so1775156b6e.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Oct 2024 03:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1728039006; x=1728643806; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywSS2L490J8CU6HcXGs1TjYnaQVhnORicV0t1QQIhzc=;
        b=E19kJN+pF0P3TrLzb9vvl+7tL08F9yXT3O7WjMITU3bxkLRw6eVsuLcMxLFfh+Hb/P
         9qLPqYmv3mxoFMLo5RFcKpY7DwLGMhI4uqxuTPtkU6+zXNIBC1e4XY/couMlCCqXi8+V
         LYsTnRAn5a7OGlCEZ8q3z0ZnMwKlAgva8Ns3kRd6GNcdMMnQ3B2w0TkzGu16HU2uRvfH
         G/FNcL7+jD+8RChzmDuxdo39C0VMcODRKL+Jy17qKhhjYdZr9hknT8Oq3uUPmOM5FMdQ
         P59ANSmUNGC3/CtyhVvoBOfEpaAlhU6ZfqRABhaI5YMUhJt9ePwbb+nIKrJIP5w7GmPk
         O5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728039006; x=1728643806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywSS2L490J8CU6HcXGs1TjYnaQVhnORicV0t1QQIhzc=;
        b=BXUMyiaKUgQvMXRHJnFtlKDpfh2r+sJQAW00RCRKOXSh6RZo0LuWXa3AHEnUft/DxA
         +H7PQdc8yCnJLaTWSJ6lrgMW4BOFjKzkZRFPRuIkGID4WuiYmrfQ/q2mYuvv9Auno8TS
         UwxEizDx3QXIfFOtioDvhdLnT52B2KKMuwc2kz09bF4rcP9YCCPbaBI8ImRGZeFuKgor
         bS0/NM5wMBVqnVFtmGaQ50EvXaF8eOuu7KVrIZ5XgXDAZVdOuvYhGyxeNbF3aK5CL9r9
         s27qMiW2X8ZDOIDHqDbYzRX5gzIjyX6h4EiK+rPND4wvuuTZwBvPDzysfmyphVz1aCUq
         TwjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs1OlXIs69Xrhy3+0Ti3liBVqak6qoxngXi3xx9LzCBtILnpVGZiUS0/QM9X7HWODgUjnGdWeiWkWQaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwE4jo8j2wIF1FgmOZadu5EfJcV2lXIwqeRKcJBd+B8K58SC4Et
	k3Lx6MwNTc9vN6nScPAqS9LbpmyN4i5mAuDPIt1qrHA++u2b2EhE23eVF5AURG3oKKSg07MX6YC
	+eTUGOZChmbflU4JZS1pA1coXv2rr4BCqUArSfw==
X-Google-Smtp-Source: AGHT+IFdS1NgCgffh0R0p2aEd2ZRC4hGoiJ1ekyWkNR4iWURqjLghfq2K21CKe2rjB4nMhlYIqLz4cS31CYnPsoOl4o=
X-Received: by 2002:aca:1118:0:b0:3e3:b291:833e with SMTP id
 5614622812f47-3e3ba1adb0dmr2801841b6e.9.1728039006554; Fri, 04 Oct 2024
 03:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240808081439.24661-1-yongxuan.wang@sifive.com>
In-Reply-To: <20240808081439.24661-1-yongxuan.wang@sifive.com>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Fri, 4 Oct 2024 18:49:55 +0800
Message-ID: <CAMWQL2gBOma5c_A4JPnTK6uDfbyqcbcf_4qZ4Pt_S3mvBY3s0w@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISC-V: KVM: Fix APLIC in_clrip and clripnum write emulation
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_035008_369871_4D52EB28 
X-CRM114-Status: GOOD (  17.07  )
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

cGluZwoKT24gVGh1LCBBdWcgOCwgMjAyNCBhdCA0OjE04oCvUE0gWW9uZy1YdWFuIFdhbmcgPHlv
bmd4dWFuLndhbmdAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBJbiB0aGUgc2VjdGlvbiAiNC43IFBy
ZWNpc2UgZWZmZWN0cyBvbiBpbnRlcnJ1cHQtcGVuZGluZyBiaXRzIgo+IG9mIHRoZSBSSVNDLVYg
QUlBIHNwZWNpZmljYXRpb24gZGVmaW5lcyB0aGF0Ogo+Cj4gSWYgdGhlIHNvdXJjZSBtb2RlIGlz
IExldmVsMSBvciBMZXZlbDAgYW5kIHRoZSBpbnRlcnJ1cHQgZG9tYWluCj4gaXMgY29uZmlndXJl
ZCBpbiBNU0kgZGVsaXZlcnkgbW9kZSAoZG9tYWluY2ZnLkRNID0gMSk6Cj4gVGhlIHBlbmRpbmcg
Yml0IGlzIGNsZWFyZWQgd2hlbmV2ZXIgdGhlIHJlY3RpZmllZCBpbnB1dCB2YWx1ZSBpcwo+IGxv
dywgd2hlbiB0aGUgaW50ZXJydXB0IGlzIGZvcndhcmRlZCBieSBNU0ksIG9yIGJ5IGEgcmVsZXZh
bnQKPiB3cml0ZSB0byBhbiBpbl9jbHJpcCByZWdpc3RlciBvciB0byBjbHJpcG51bS4KPgo+IFVw
ZGF0ZSB0aGUgYXBsaWNfd3JpdGVfcGVuZGluZygpIHRvIG1hdGNoIHRoZSBzcGVjLgo+Cj4gU2ln
bmVkLW9mZi1ieTogWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFuLndhbmdAc2lmaXZlLmNvbT4KPiBS
ZXZpZXdlZC1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4KPiAtLS0K
PiAgYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMgfCAyIC0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5j
IGIvYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMKPiBpbmRleCBkYTZmZjFiYWRlMGQuLjk3YzZk
YmNhYmY0NyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYwo+ICsrKyBi
L2FyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jCj4gQEAgLTE0Miw4ICsxNDIsNiBAQCBzdGF0aWMg
dm9pZCBhcGxpY193cml0ZV9wZW5kaW5nKHN0cnVjdCBhcGxpYyAqYXBsaWMsIHUzMiBpcnEsIGJv
b2wgcGVuZGluZykKPgo+ICAgICAgICAgaWYgKHNtID09IEFQTElDX1NPVVJDRUNGR19TTV9MRVZF
TF9ISUdIIHx8Cj4gICAgICAgICAgICAgc20gPT0gQVBMSUNfU09VUkNFQ0ZHX1NNX0xFVkVMX0xP
Vykgewo+IC0gICAgICAgICAgICAgICBpZiAoIXBlbmRpbmcpCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgZ290byBza2lwX3dyaXRlX3BlbmRpbmc7Cj4gICAgICAgICAgICAgICAgIGlmICgoaXJx
ZC0+c3RhdGUgJiBBUExJQ19JUlFfU1RBVEVfSU5QVVQpICYmCj4gICAgICAgICAgICAgICAgICAg
ICBzbSA9PSBBUExJQ19TT1VSQ0VDRkdfU01fTEVWRUxfTE9XKQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGdvdG8gc2tpcF93cml0ZV9wZW5kaW5nOwo+IC0tCj4gMi4xNy4xCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
