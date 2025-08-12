Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C573AC87FCB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 17:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3b7rUyP+cJT0XiNYHYbD/4++ZXaUIExpp+GEgB1+uCs=; b=ojraSM1WL03r+M
	wZzHk/vKOpjzOtRUGheCxd1E04UHavcf03OTuVrvwsN/uCnT79v6BixFUdxcIRjOnR7yGn0vrvtsf
	Pf5ht+qvVem/0ICUPycvacC8o8aGaduf2paBpEa+x7YY6gMlTMOe5rNcLu0Lels2dtnqHoZGsAiYc
	qgDPQVQ75DGagSEbG4/IU1gZMC9d2Zry6t1sAGZS02ux+rculeX9CMujhT3E8uEr9eKTk5e0k54LA
	QG9xP/rIV6a3VE+peGE+O725exu3Xfy692NUflL0rIw7Khvd2RL3HVqL7ljPfsnHq7vMoiA043v0G
	BidRKhQw7IeowSIZGb+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ult4U-0000000BdpT-1ErT;
	Tue, 12 Aug 2025 17:46:02 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloqh-0000000AtLt-07q7
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 13:15:32 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2402b5396cdso33945815ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 06:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755004530; x=1755609330; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CIZ+4Wv9ojpY1/fI9C11E1ch7d9wvWodMXJMaf6VoBs=;
        b=UujcbVEiaugcCWY4f/j1/YmUd4EXrX4eZQU8HYmu+fJ2TsAAiy7l+2JA8fonZS9hSb
         9lUu2t71BikRMkyGtGgsYnCXrgJCjSzbkxEwRKMyu7E8dBuIC3Uu0aQRvYm6WpnqifV+
         15CY5aACxHwhciXWHGYYxrqPhUH/hnF4INMcXxKvLyGRHAIi9LeXK4VhukfKjH4IWTHf
         CowQxHnpuPqYjwKkA3EwFinCZx3oNLwjmVbgKHR1Phq3Hsi0jIILLmk/DT+VcvKk/V6q
         1CAF3Z2h+AD8LA0tXlbsCNOfbLeKmF/sKOiRDCWWyHfHBPXcxHwA1AHJdT4YrenFk0oW
         954g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755004530; x=1755609330;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CIZ+4Wv9ojpY1/fI9C11E1ch7d9wvWodMXJMaf6VoBs=;
        b=gTHEGxix6xcqtFUSaVbj1oA+JEyi2g2zg9AKjVwKoPTq/lYThnFvgpTTnugmg6lD5U
         Jf42JybrYsuaUfGctZkwHDB/viryYMMooa845x/ex+GfXVGe3UGy8VRB7VfPVH4dyhmo
         oaz8Nq9T0nxyqvtR5qqaKfUu6Mq1XTH14pnlGBsOxJJr8hSo096zYN1IBtD4NogCqkYJ
         GqJktRbxYXZqZ/qGZCYkpETC6oA5RO/ANHrynzLZhblyhfY9bOaWpczFGj0Wz/iCF6x9
         4fUbIT0C5F1bomFohZ/zrcZd3LbhoKNihKqzhXKdAa6xsmihQbCMNNkvU2yjGTWafkUg
         U31Q==
X-Forwarded-Encrypted: i=1; AJvYcCVV8tXGw+yo8vKyEn1LimNpCzxeY+7QUAy6xRyulZnNbdIEJ7nx9etaMJfev83C5gPmvQ4IRSMMoG8+pA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoHbqXHSMnEh+K8z3UckX10oS97oMIUGqZGlGsbCR69TVOJv2F
	jPXFweUSzcJdSZWSb0mNX+c2nMLssWbRY4NGsTleghFu2aOPlkNT8KbCCgZzaL/IWtw=
X-Gm-Gg: ASbGnctxUWt2/T1M/fE8U4E3tJrUCc7WETEJJDw6MC8SQGYvY5LdwQoGNlNgDMICgAX
	X1gFpq/cnIdqgrmy/MLENFFJY+nMdo2nRJKfn7J99e1dxuzy1sk6zO1lVK8eRT1B7aBn6pxA5sa
	RfcKMFcOhZKcuT7gSJ5yE88FzCnkDsUO6j4B4j3KH2QKna7HsqjfQ4o000URiKygD2PLGxOJ5e5
	lQGLMOBryQcNU86waWxN2vzQfONyXJxgpRPNqvHzrc3ltv8rwNHfD+NB2pEdHb0AOgLCyS3hry7
	9slNosxxfvMI5Dtct4XDLzJOgAdJEZW/WjyC3Ih+prKWAea/WHTHs6Cf9/OUUaat0z2CbAU9OoC
	hJrdXmPNi5AKCqbOANoeDyyRbp24=
X-Google-Smtp-Source: AGHT+IFryvq0NSXrxuldQjBSYbOlN7Rlx50CKMnuKseVMjAVcE6lnBOuAaWxNGVUjJ4OlINPVdOdDQ==
X-Received: by 2002:a17:903:41d1:b0:237:e696:3d56 with SMTP id d9443c01a7336-242fc316303mr60853235ad.32.1755004529704;
        Tue, 12 Aug 2025 06:15:29 -0700 (PDT)
Received: from sunil-laptop ([106.51.199.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f1efe8sm297489915ad.69.2025.08.12.06.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 06:15:29 -0700 (PDT)
Date: Tue, 12 Aug 2025 18:45:20 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: rafael@kernel.org, lenb@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>
Subject: Re: [PATCH] ACPI: RISC-V: CPPC: Add CSR_CYCLE for CPPC FFH
Message-ID: <aJs-aPH32OxpzR3G@sunil-laptop>
References: <20250515094301.40016-1-cuiyunhui@bytedance.com>
 <CAEEQ3w=XqoKmVu1kvc5XUbGbQJsHVkRx=T65tXvYEYo0HCTcnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3w=XqoKmVu1kvc5XUbGbQJsHVkRx=T65tXvYEYo0HCTcnQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_061531_068103_91090FB5 
X-CRM114-Status: GOOD (  24.89  )
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

T24gVHVlLCBBdWcgMTIsIDIwMjUgYXQgMDc6MjU6NDRQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBTdW5pbCwKPiAKPiBPbiBUaHUsIE1heSAxNSwgMjAyNSBhdCA1OjQ04oCvUE0gWXVu
aHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4KPiA+IEFkZCB0aGUg
cmVhZCBvZiBDU1JfQ1lDTEUgdG8gY3BwY19mZmhfY3NyX3JlYWQoKSB0byBmaXggdGhlCj4gPiB3
YXJuaW5nIG1lc3NhZ2U6ICJDUFBDIENwdWZyZXE6IGNwcGNfc2NhbGVfZnJlcV93b2tyZm46IGZh
aWxlZAo+ID4gdG8gcmVhZCBwZXJmIGNvdW50ZXJzIi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZ
dW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMv
YWNwaS9yaXNjdi9jcHBjLmMgfCA1ICsrKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkv
cmlzY3YvY3BwYy5jIGIvZHJpdmVycy9hY3BpL3Jpc2N2L2NwcGMuYwo+ID4gaW5kZXggNGNkZmYz
ODdkZWZmNi4uYzFhY2FlYjE4ZWFjMyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvYWNwaS9yaXNj
di9jcHBjLmMKPiA+ICsrKyBiL2RyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMKPiA+IEBAIC02OSwx
MSArNjksMTQgQEAgc3RhdGljIHZvaWQgY3BwY19mZmhfY3NyX3JlYWQodm9pZCAqcmVhZF9kYXRh
KQo+ID4gICAgICAgICBzdHJ1Y3Qgc2JpX2NwcGNfZGF0YSAqZGF0YSA9IChzdHJ1Y3Qgc2JpX2Nw
cGNfZGF0YSAqKXJlYWRfZGF0YTsKPiA+Cj4gPiAgICAgICAgIHN3aXRjaCAoZGF0YS0+cmVnKSB7
Cj4gPiAtICAgICAgIC8qIFN1cHBvcnQgb25seSBUSU1FIENTUiBmb3Igbm93ICovCj4gPiAgICAg
ICAgIGNhc2UgQ1NSX1RJTUU6Cj4gPiAgICAgICAgICAgICAgICAgZGF0YS0+cmV0LnZhbHVlID0g
Y3NyX3JlYWQoQ1NSX1RJTUUpOwo+ID4gICAgICAgICAgICAgICAgIGRhdGEtPnJldC5lcnJvciA9
IDA7Cj4gPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICAgIGNhc2UgQ1NSX0NZQ0xF
Ogo+ID4gKyAgICAgICAgICAgICAgIGRhdGEtPnJldC52YWx1ZSA9IGNzcl9yZWFkKENTUl9DWUNM
RSk7Cj4gPiArICAgICAgICAgICAgICAgZGF0YS0+cmV0LmVycm9yID0gMDsKPiA+ICsgICAgICAg
ICAgICAgICBicmVhazsKPiA+ICAgICAgICAgZGVmYXVsdDoKPiA+ICAgICAgICAgICAgICAgICBk
YXRhLT5yZXQuZXJyb3IgPSAtRUlOVkFMOwo+ID4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4g
LS0KPiA+IDIuMzkuMgo+ID4KPiAKPiBUaGUgcHVycG9zZSBvZiBjcHBjX2ZmaF9jc3JfcmVhZCgp
IGlzIHRvIGNhbGN1bGF0ZSB0aGUgYWN0dWFsCj4gZnJlcXVlbmN5IG9mIHRoZSBDUFUsIHdoaWNo
IGlzIGRlbHRhX0NTUl9DWUNMRS9kZWx0YV9DU1JfWFhYLgo+IAo+IENTUl9YWFggc2hvdWxkIGJl
IGEgcmVmZXJlbmNlIGNsb2NrIGFuZCBkb2VzIG5vdCBjb3VudCBkdXJpbmcgV0ZJCj4gKFdhaXQg
Rm9yIEludGVycnVwdCkuCj4gCj4gU2ltaWxhciBzb2x1dGlvbnMgaW5jbHVkZTogeDg2J3MgYXBl
cmYvbXBlcmYsIGFuZCBBUk02NCdzIEFNVSB3aXRoCj4gcmVnaXN0ZXJzIFNZU19BTUVWQ05UUjBf
Q09SRV9FTDAvU1lTX0FNRVZDTlRSMF9DT05TVF9FTDAuCj4gCj4gSG93ZXZlciwgd2Uga25vdyB0
aGF0IENTUl9USU1FIGluIHRoZSBjdXJyZW50IGNvZGUgZG9lcyBjb3VudCBkdXJpbmcKPiBXRkku
IFNvLCBpcyB0aGlzIGRlc2lnbiB1bnJlYXNvbmFibGU/Cj4gCj4gU2hvdWxkIHdlIGNvbnNpZGVy
IHByb3Bvc2luZyBhbiBleHRlbnNpb24gdG8gc3VwcG9ydCBzdWNoIGEgZGVkaWNhdGVkCj4gY291
bnRlciAoYSByZWZlcmVuY2UgY2xvY2sgdGhhdCBkb2VzIG5vdCBjb3VudCBkdXJpbmcgV0ZJKT8g
VGhpcyB3YXksCj4gdGhlIHZhbHVlIGNhbiBiZSBvYnRhaW5lZCBkaXJlY3RseSBpbiBTLW1vZGUg
d2l0aG91dCB0cmFwcGluZyB0bwo+IE0tbW9kZSwgZXNwZWNpYWxseSBzaW5jZSByZWFkaW5nIHRo
aXMgY291bnRlciBpcyB2ZXJ5IGZyZXF1ZW50Lgo+IApIaSBZdW5odWksCgpZZXMsIGJ1dCB3ZSBh
bnRpY2lwYXRlZCB0aGF0IHZlbmRvcnMgbWlnaHQgZGVmaW5lIHRoZWlyIG93biBjdXN0b20gQ1NS
cy4KU28sIHdlIGludHJvZHVjZWQgRkZIIGVuY29kaW5nIHRvIGFjY29tbW9kYXRlIHN1Y2ggY2Fz
ZXMuCgpUaGFua3MsClN1bmlsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
