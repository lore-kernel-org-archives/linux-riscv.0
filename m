Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65650CDB474
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 16:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VHmCdvBGOUEHBAvxszCY8MrA1hjMNvcCDW2MHVL+m8Q=; b=XeuHSXqXRexqYn
	hTJy0yTwjneHPBlBwOUPC8lguoye9g+900xWMhtX9Xp87mfq5fN+dUK91QIoarosvzfDAQRREtfZH
	mi3lQfVHlQFLcw5c4vfcHqIGab2uGiqLZXpsBj+5cEEk9duHHf37UphcFQIl1HZOLNuHqtMiMohqL
	qgq8k1OxIVjBW6rj4h5R0S+c4e0Gi8ZWGu4IYaV1DKD/hObjCxOrTd/Jx5akdQL5WhEzost/8shsP
	qbHmmstOpJux4Ts3WW8/0nzamZsW3HHaMryoSbYEk+DT6gwVgQhepedkiFz8S4HQKrNUaYv6kHZpz
	XTkSat6hwCDKXt/KmE7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtsjU-002iyI-1j;
	Fri, 20 Oct 2023 16:52:20 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtsjR-002ix2-1P;
	Fri, 20 Oct 2023 16:52:19 +0000
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-584081ad442so92677eaf.0;
        Fri, 20 Oct 2023 09:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697820734; x=1698425534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psILNHinFhubd7kf1xu/dppnYDWKXA3Ybjqll4DLjw0=;
        b=krMi+i/SFTxRv9YwWO7fixiNLMdpEnGdblMnkgMLbUIcJHcVO5wixGnq31jsHZQA3+
         CJDu4p//ggK1qjJhnvb+A0HDwvDRoPzkamxWnmnmhrcFrmnqTLv+PdIGS3mk0uUB8rlY
         4DVAgLYv01c8EpcixIBgHXDTUP+natHmKTtMWs0CBJyDSO8egKaCj7rsG0db7Loa/OXH
         be0KxUATtfnFrnIz92W8AQIJLheGiqWTRP8z+TyuLUwJtTHpB4zuF26F0rkoBMchwXIE
         hHnuVWLRqK3wuxIe9IS/V8Kk2wcfiacW2IxyRLJDcfKR1PpfznuU8wXimLkIjDxQyplg
         2uHQ==
X-Gm-Message-State: AOJu0YzS/7p3gk8kxio2Fe/EuALgUY3wn1sdWG+3nx2sfwlG3A5mugc6
	l86Qg24FMz+esHARIF4yFOJrTY9CSLLloINM8wU=
X-Google-Smtp-Source: AGHT+IGh0cmdaOOYZFwyTinjpHRLVyGaQdJ8C+chdN0KihO5maTrIgG7O0UmbbjbnDR2+SuI/Pn6JwhLUpC07VMZzYY=
X-Received: by 2002:a4a:e7d1:0:b0:583:ec88:e0 with SMTP id y17-20020a4ae7d1000000b00583ec8800e0mr2657273oov.0.1697820730971;
 Fri, 20 Oct 2023 09:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <E1qtq2W-00AJ8T-Mm@rmk-PC.armlinux.org.uk> <95A91316-0210-41D6-B8E2-4EE958066FFB@oracle.com>
In-Reply-To: <95A91316-0210-41D6-B8E2-4EE958066FFB@oracle.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 20 Oct 2023 18:52:00 +0200
Message-ID: <CAJZ5v0hfJkbE=TNpNWnVZsxzB4Hd-BCwQrJ+Lc3B95S9-KQezg@mail.gmail.com>
Subject: Re: [PATCH] ACPI: Use the acpi_device_is_present() helper in more places
To: Miguel Luis <miguel.luis@oracle.com>, Russell King <rmk+kernel@armlinux.org.uk>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "x86@kernel.org" <x86@kernel.org>, 
	James Morse <james.morse@arm.com>, Salil Mehta <salil.mehta@huawei.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, "jianyong.wu@arm.com" <jianyong.wu@arm.com>, 
	"justin.he@arm.com" <justin.he@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_095217_477354_1A366D7D 
X-CRM114-Status: GOOD (  19.06  )
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

T24gRnJpLCBPY3QgMjAsIDIwMjMgYXQgNDo1MuKAr1BNIE1pZ3VlbCBMdWlzIDxtaWd1ZWwubHVp
c0BvcmFjbGUuY29tPiB3cm90ZToKPgo+IEhpIFJ1c3NlbGwsCj4KPiA+IE9uIDIwIE9jdCAyMDIz
LCBhdCAxMzo1OSwgUnVzc2VsbCBLaW5nIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3Jv
dGU6Cj4gPgo+ID4gRnJvbTogSmFtZXMgTW9yc2UgPGphbWVzLm1vcnNlQGFybS5jb20+Cj4gPgo+
ID4gYWNwaV9kZXZpY2VfaXNfcHJlc2VudCgpIGNoZWNrcyB0aGUgcHJlc2VudCBvciBmdW5jdGlv
bmFsIGJpdHMKPiA+IGZyb20gdGhlIGNhY2hlZCBjb3B5IG9mIF9TVEEuCj4gPgo+ID4gQSBmZXcg
cGxhY2VzIG9wZW4tY29kZSB0aGlzIGNoZWNrLiBVc2UgdGhlIGhlbHBlciBpbnN0ZWFkIHRvCj4g
PiBpbXByb3ZlIHJlYWRhYmlsaXR5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIE1vcnNl
IDxqYW1lcy5tb3JzZUBhcm0uY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEpvbmF0aGFuIENhbWVyb24g
PEpvbmF0aGFuLkNhbWVyb25AaHVhd2VpLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBHYXZpbiBTaGFu
IDxnc2hhbkByZWRoYXQuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nIChPcmFj
bGUpIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KPiA+IC0tLQo+ID4gSm9uYXRoYW4gQ2Ft
ZXJvbiBzdWdnZXN0cyAiUHVsbCB0aGlzIG9uZSBvdXQgYW5kIHNlbmQgaXQgdXBzdHJlYW0gaW4K
PiA+IGFkdmFuY2Ugb2YgdGhlIHJlc3QiIHNvIGxldCdzIGRvIHRoYXQuIFNlZQo+ID4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIzMDkxNDEzMDQ1NS4wMDAwNDQzNEBIdWF3ZWkuY29tLwo+
ID4KPiA+IFNvLCBsZXQncyBnZXQgdGhpcyB1cHN0cmVhbSB0byByZWR1Y2UgdGhlIG51bWJlciBv
ZiBvdXRzdGFuZGluZyBwYXRjaGVzCj4gPiBmb3IgYWFyY2g2NCB2Y3B1IGhvdHBsdWcuCj4gPgo+
ID4gZHJpdmVycy9hY3BpL3NjYW4uYyB8IDQgKystLQo+ID4gMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9h
Y3BpL3NjYW4uYyBiL2RyaXZlcnMvYWNwaS9zY2FuLmMKPiA+IGluZGV4IDY5MWQ0Yjc2ODZlZS4u
ZWQwMWUxOTUxNGVmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9hY3BpL3NjYW4uYwo+ID4gKysr
IGIvZHJpdmVycy9hY3BpL3NjYW4uYwo+ID4gQEAgLTMwNCw3ICszMDQsNyBAQCBzdGF0aWMgaW50
IGFjcGlfc2Nhbl9kZXZpY2VfY2hlY2soc3RydWN0IGFjcGlfZGV2aWNlICphZGV2KQo+ID4gaW50
IGVycm9yOwo+ID4KPiA+IGFjcGlfYnVzX2dldF9zdGF0dXMoYWRldik7Cj4gPiAtIGlmIChhZGV2
LT5zdGF0dXMucHJlc2VudCB8fCBhZGV2LT5zdGF0dXMuZnVuY3Rpb25hbCkgewo+ID4gKyBpZiAo
YWNwaV9kZXZpY2VfaXNfcHJlc2VudChhZGV2KSkgewo+ID4gLyoKPiA+ICogVGhpcyBmdW5jdGlv
biBpcyBvbmx5IGNhbGxlZCBmb3IgZGV2aWNlIG9iamVjdHMgZm9yIHdoaWNoCj4gPiAqIG1hdGNo
aW5nIHNjYW4gaGFuZGxlcnMgZXhpc3QuICBUaGUgb25seSBzaXR1YXRpb24gaW4gd2hpY2gKPiA+
IEBAIC0zMzgsNyArMzM4LDcgQEAgc3RhdGljIGludCBhY3BpX3NjYW5fYnVzX2NoZWNrKHN0cnVj
dCBhY3BpX2RldmljZSAqYWRldiwgdm9pZCAqbm90X3VzZWQpCj4gPiBpbnQgZXJyb3I7Cj4gPgo+
ID4gYWNwaV9idXNfZ2V0X3N0YXR1cyhhZGV2KTsKPiA+IC0gaWYgKCEoYWRldi0+c3RhdHVzLnBy
ZXNlbnQgfHwgYWRldi0+c3RhdHVzLmZ1bmN0aW9uYWwpKSB7Cj4gPiArIGlmICghYWNwaV9kZXZp
Y2VfaXNfcHJlc2VudChhZGV2KSkgewo+Cj4gUmV2aWV3ZWQtYnk6IE1pZ3VlbCBMdWlzIDxtaWd1
ZWwubHVpc0BvcmFjbGUuY29tPgoKQXBwbGllZCBhcyA2LjcgbWF0ZXJpYWwsIHRoYW5rcyEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
