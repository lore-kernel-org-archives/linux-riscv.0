Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99661E743D2
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 00:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7PMv25rGBiFzHJ31l+t/VJ2UC0/BVGdbxVH0ll6Wyg=; b=vqQ9P2Jj3XFNUJ
	fcKcFNzf+zxyQIlJXm7c8/CcizZImtWDcCXsKBCg8SZmV4+EVSmL30hE7gurnw6uCMkM1VVki3Syl
	U4q+XVa6Ytp6HRyUE/E7ov4cTjJDgqua1MDgn/5YhwDaWKSgGWdeKrn7MpmKlJL556VZrzhsViPVG
	nAUhiXqQiI/1Blts0K533BIymeL5I0ujQjC1fxArmOKZc41/5Lpd5UvNi5iuMxEysQmv62QAP0gwa
	bm5gDcHfESNdT6AkruDPAYDLGsFVp2FFQr2IzT96qJ1DPvgnOCzi+CoWt6LZuAHM1aiiF0Wcw5sEy
	MOgjqw++HyrtKVP/GClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm15B-006uJG-0D;
	Fri, 29 Sep 2023 00:10:13 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm157-006uHh-2k
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 00:10:11 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-41958410e5cso183541cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 17:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695946205; x=1696551005; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzvTFN75+iA4NEl0LJCBH/BP6Z5NQCZHvtY+oNVE+gw=;
        b=uurrzIugj/gE3O3p8zRoBC9Q8bxV5ecbdPaNEsQ1YnGB74U1EBOPtK8ulb7O7tULF4
         ZablzXiOqhz44EK/zY3F64k/BF4IGDZ62QGp862fsozTz36pP6xObG34sFG0fNgyIII9
         0xtuQbt6bVpaTO2YnadGdRNNWE3sbKDd8uRmCjEYMvTB35EDYbihEJE8uOijg9x/+DXE
         yhOKnwsG0z7vpN+3bGxeGNxKAOgPAW5JRgZzKls1qh/YJliX2tgONczcCpfnbMfgqEyn
         XYyk/TcYEstEGy6807OGOL5b9nsRoj89DXMyfTgTY4tQ3sib0eEIE4doCWKf9I8f7Ihj
         4jaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695946205; x=1696551005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LzvTFN75+iA4NEl0LJCBH/BP6Z5NQCZHvtY+oNVE+gw=;
        b=alSDYD3Lswdj6xPWofEebpXdLTkBMKidQONtdtff9Zj8Jv8LEu7a3LWcDPy+9QFhlq
         e6kz3W8hxyu70mamIvejEP8z09ZIIqfohw/fllxLTsa4WNBhVsrT04aQf2Fe3FA4RmJj
         enN6un4Ipj0SSZw/F3vGxYF+z3iobKIORkB7a0NYiVz4YmfEdCgjOGH86TChotwWV1MU
         8T0zpGjLI4mXvhwjsxmXgM9AlIWIzVtsPHrKbjLIZrBQBlnxlCOtj47mhSbehxLbGJ8O
         Yw0ihIG+3pf8TqZezXtL0LjC5XGlvBUo9gE4biNiU2p6qgkAeZgYqp1MnwcCcfBKFVVc
         4G8g==
X-Gm-Message-State: AOJu0YwbspJHPjKty6Jj/x/ub4urCYp8WrdQxRMXtpjdRjrExVDZ7h14
	bDGmp5YudeO3LrN7WSlu1RuBN296InZfR0Tea9GnqQ==
X-Google-Smtp-Source: AGHT+IH4jwtz94nsixUZlli6bJCxlt1xjILkhR2GybMC88NTjRXEj7Vlfpt7diniCxJex6zUjQlOAOBjKfTfS7/tbTc=
X-Received: by 2002:a05:622a:100f:b0:417:9238:5a30 with SMTP id
 d15-20020a05622a100f00b0041792385a30mr1067632qte.29.1695946204321; Thu, 28
 Sep 2023 17:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230928061207.1841513-1-apatel@ventanamicro.com>
 <20230928061207.1841513-3-apatel@ventanamicro.com> <CAL_JsqL6LvfQQi4AqJpDPKwC76Xap4Re4o+bzviyb--dUOG7vQ@mail.gmail.com>
In-Reply-To: <CAL_JsqL6LvfQQi4AqJpDPKwC76Xap4Re4o+bzviyb--dUOG7vQ@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 28 Sep 2023 17:09:27 -0700
Message-ID: <CAGETcx_1sKjyMR4Vkx4maVy+jopHtjuzO7n8zzOnj9u9G5s1mw@mail.gmail.com>
Subject: Re: [PATCH v9 02/15] of: property: Add fw_devlink support for msi-parent
To: Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_171009_896401_A836F503 
X-CRM114-Status: GOOD (  11.82  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBTZXAgMjgsIDIwMjMgYXQgNzo0MOKAr0FNIFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBTZXAgMjgsIDIwMjMgYXQgMToxMuKAr0FNIEFu
dXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBUaGlzIGFs
bG93cyBmd19kZXZsaW5rIHRvIGNyZWF0ZSBkZXZpY2UgbGlua3MgYmV0d2VlbiBjb25zdW1lcnMg
b2YKPiA+IGEgTVNJIGFuZCB0aGUgc3VwcGxpZXIgb2YgdGhlIE1TSS4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4g
IGRyaXZlcnMvb2YvcHJvcGVydHkuYyB8IDIgKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCj4KPiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KClJl
dmlld2VkLWJ5OiBTYXJhdmFuYSBLYW5uYW4gPHNhcmF2YW5ha0Bnb29nbGUuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
