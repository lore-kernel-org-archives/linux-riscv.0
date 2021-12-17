Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF99C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 05:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Fkt49gZHeB1IhVx3hKxzM2NSIH4dQLntx5wlrqXivtQ=; b=h2Rl0TxJWCjJPMHr8yajSJu2uJ
	9OnR5EQ7GTpz5dfeCMAmbCaU19XltnUEBU0VGRaLkq992JNyZ2KUh8qbJw7uWYA+iUSguRM/13yYk
	FyUpYuJY8zxwVjhf/j9r1rX1z3zDTiZY1IlMlLKE6tj6+Xt/NbNtcfvq/wFAJPsM7vykLt2I6njS/
	J3B6i/n5n1H4omiynK5PSsj7+4qX1bUHkyjowcGN0XfFwQh06vKS5PGM7Y/3O4E+J1YqjMMo9sIBx
	IHvHp7Bg1DWK18+RN0XFvbsbqPw9bxb7cHwejh9SfDuaoOJeZ8puHM0ZxWb4bIxl/9xlC8yqFifZy
	tPKV8Xxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my5tc-008fEg-M3; Fri, 17 Dec 2021 05:35:08 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my5tZ-008fDf-Bf
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 05:35:07 +0000
Received: by mail-pl1-x630.google.com with SMTP id m24so908769pls.10
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 21:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=CTKXdWbXYFCcZS3TCZsbdeP+y1YkG9m0hcHXCbzMHfM=;
 b=A4M9QeI+3ITdTU3nEB+emC4vcyx+RAPXNHc00k+QZaVfIv+tswGciZ0liMjWSBUY1e
 DzU51tl6VIka910nqnfFhTtBy7NN35fgeTEE4y5KpuRqf3O9EneSu9iI6iv3pGqeYbnd
 OftXqjemeUxNgZlZKVGNivuRcYejGt1AfV76STSMgZQ96wBeXb8Ee2HIYjbzyfRI6R4X
 cEtN7hKnS9omG+gm+dWusTvfCsirNk1GtOg7wYiqXixd4c69Eu4FSjYkTYn/4n+fRpIv
 0CjVJ6ZCcf/j39XFI/l+wiVbKsK/0xx81J3peOGp6cK9O8sOkrIyFQZawH0J03RFvRwU
 xfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=CTKXdWbXYFCcZS3TCZsbdeP+y1YkG9m0hcHXCbzMHfM=;
 b=TdMGsnsCkAQp3XG9VA3+p6vHon8X5JB5jB0fAa4UeZZlFfcNsFxmI79JeVl/eqSws5
 oy+91AzO3yqqdTbH5Of1OMQd6v9Elg2JHFEVwuIa47pND5VmNUiUTNuKZGYZuT9xIaMo
 NBIbVa5+9keVMaTTpdl0az7DcqJaxTOhsBLqVfpnd3brFFqWGJONLn5kacz/fFW2VIri
 WgzVvzxynGR7HnNfFwmY+DJcV9JXHxGfSK5Hpht7rZDI7vyYSnncE820jL5kLTEQCGqr
 pyHwH+WpzIh8lYph7x3t90uqNEA4Ay1pD+RdtViuxGGZDDkNUD99PSdFkN8wIQzmz+eX
 AAag==
X-Gm-Message-State: AOAM532vyx+cT0uPGe2VfG3IQyzjBUGVvorQKphKUQFZI5SByzYVBJxB
 G6PQGu050lCTV+p0TOX6HESMT3w2eiq8dA==
X-Google-Smtp-Source: ABdhPJw5nyrUeaDehYt+dPK8PDeUMkeASbVvAJf4VuOnAdah2SxYnJZ8OzLk5tw2P3bphJ0UMxxIgA==
X-Received: by 2002:a17:90a:909:: with SMTP id n9mr1943440pjn.1.1639719301358; 
 Thu, 16 Dec 2021 21:35:01 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id m67sm687523pfb.36.2021.12.16.21.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 21:35:00 -0800 (PST)
Date: Thu, 16 Dec 2021 21:35:00 -0800 (PST)
X-Google-Original-Date: Thu, 16 Dec 2021 21:30:12 PST (-0800)
Subject: Re: [PATCH v3 4/6] riscv: dts: sifive unmatched: Expose the FU740
 core supply regulator
In-Reply-To: <5ab111e71e88d545d7f03233f10b6d84ef3d6c21.1637362542.git.plr.vincent@gmail.com>
CC: robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 qiuwenbo@kylinos.com.cn, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, david.abdurachmanov@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: plr.vincent@gmail.com
Message-ID: <mhng-854afd5f-800b-4b58-af68-cdc6afdc0a4a@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_213505_428935_7F6664F4 
X-CRM114-Status: GOOD (  16.76  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxOSBOb3YgMjAyMSAxNDo1NTo0MCBQU1QgKC0wODAwKSwgcGxyLnZpbmNlbnRAZ21h
aWwuY29tIHdyb3RlOgo+IFByb3ZpZGVzIG1vbml0b3Jpbmcgb2YgY29yZSB2b2x0YWdlIGFuZCBj
dXJyZW50Ogo+IHRwczU0NGIyMC1pMmMtMC0xZQo+IEFkYXB0ZXI6IGkyYy1vY29yZXMKPiB2b3V0
MTogICAgICAgOTA2LjAwIG1WCj4gdGVtcDE6ICAgICAgICAtNDAuMMKwQyAgKGhpZ2ggPSArMTI1
LjDCsEMsIGNyaXQgPSArMTUwLjDCsEMpCj4gaW91dDE6ICAgICAgICAgNS4wNiBBICAobWF4ID0g
KzIwLjAwIEEsIGNyaXQgbWF4ID0gKzI2LjAwIEEpCj4KPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50
IFBlbGxldGllciA8cGxyLnZpbmNlbnRAZ21haWwuY29tPgo+Cj4gLS0tCj4gTm90ZTogY2hlY2tw
YXRjaC5wbCBjb21wbGFpbnMgYWJvdXQgdW5kb2N1bWVudGVkIGRldmljZXRyZWUgYmluZGluZywK
PiB3aGljaCBpcyBmaXhlZCBieToKPiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWRl
dmljZXRyZWUvMjAyMTExMTYxMTAyMDcuNjg0OTQtMS1rcnp5c3p0b2Yua296bG93c2tpQGNhbm9u
aWNhbC5jb20vVC8jdQo+Cj4gQ2hhbmdlcyBzaW5jZSB2MjoKPiAtIEZpeCBlbmQtb2YtY29tbWl0
LW1lc3NhZ2Ugc2VwYXJhdG9yIHNvIGNoYW5nZSBsaXN0cyBkbyBub3QgZW5kIHVwIGluIHRoZW0u
Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAtIEFkZGVkIG1pc3NpbmcgInRpLCIgcHJlZml4IGluIGNv
bXBhdGlibGUgc3RyaW5nLgo+IC0gUmVtb3ZlIHRyYWlsaW5nICIuIiBvbiBzdWJqZWN0IGxpbmUu
Cj4gLSBSZW5hbWUgdHJlZSBub2RlLgoKSSBzZWUgdGhpcyBpbiBSb2IncyBmb3ItbmV4dCBhcyA3
NjFkZTc5YWRjMmMgKCJkdC1iaW5kaW5nczogaHdtb246IGFkZApUSSBEQy1EQyBjb252ZXJ0ZXJz
IiksIHNvIEknbSBnb2luZyB0byBob2xkIG9mZiBvbiB0aGlzIG9uZSB1bnRpbCB0aGUKYmluZGlu
Z3MgbGFuZC4KCkkndmUgcHV0IHRoZSBvdGhlcnMgb24gZml4ZXMuCgpUaGFua3MhCgo+IC0tLQo+
ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMgfCA1
ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMKPiBpbmRl
eCAyNzAzNjBiMjU4YjcuLjZlNzc3NWZkYWUzMiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMKPiArKysgYi9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMKPiBAQCAtNTEsNiArNTEs
MTEgQEAgJnVhcnQxIHsKPiAgJmkyYzAgewo+ICAJc3RhdHVzID0gIm9rYXkiOwo+Cj4gKwlyZWd1
bGF0b3JAMWUgewo+ICsJCWNvbXBhdGlibGUgPSAidGksdHBzNTQ0YjIwIjsKPiArCQlyZWcgPSA8
MHgxZT47Cj4gKwl9Owo+ICsKPiAgCXRlbXBlcmF0dXJlLXNlbnNvckA0YyB7Cj4gIAkJY29tcGF0
aWJsZSA9ICJ0aSx0bXA0NTEiOwo+ICAJCXJlZyA9IDwweDRjPjsKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
