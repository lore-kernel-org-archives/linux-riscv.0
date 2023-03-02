Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727D5C678D4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 16:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JbnurZ1fnJt6noGae6LVb8EkVw+paxaV+xTPOz8L0Fc=; b=m9DSr63ZkG8xXW
	Z9K2OzOs124le37RmejaibPkpodjg/hC84DBUnRDCb+XM0rosYS9pWHS2Sjl7xCb8VChiLl7Az82W
	FMp/sEozRv1E7W7a2loNR1rGfpgIEub+MQVwrxb49WEzhLxTYK73PS0Dyawqvq+Y+eWqQZsA2t9KQ
	A6c1iicBUy3NjIfrm2mEcTHXg4cfDrnXxvTtsmglh1zAoxaDmM9Bkl+ix7aXHVup61VoqpW1q4GSy
	i0QvXloTjL2jv0qHIO2sNx39XnRTB0BDNQhn9/2nv8lPwm59Vtew8E2t/FnXtAIcWNpnwJ24kUyEF
	24pCh3B57aPj/t12UEoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXlkK-002oio-TV; Thu, 02 Mar 2023 16:25:32 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXlkI-002ohP-Mz
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 16:25:32 +0000
Received: by mail-lf1-x12c.google.com with SMTP id j11so7148118lfg.13
        for <linux-riscv@lists.infradead.org>; Thu, 02 Mar 2023 08:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKac1TkrhoTDCdBYLfmUdEgrSPbT28oEnnjUI0V7tgc=;
        b=Pm+4D44IVaoJ/vHTtKD28wJY8IDgule4ljLhTARvR2hJuB9dHMQGknJgJmvHFAw7uM
         0VCWQ7hBB4wECCBe51NHA1RV0HtdYKeCv6raGdllWJ2+CWxUrT3qVHamjWjpRtcUoIHA
         5F11h5JzDbiBzWoz3WRiOrVOD/rm9Z7q0xnsygv6jc0wX2zzzjHFfmNkXoOaIhY9L1WX
         CBrWuDaSbP/NOK2WeyVY7A/lHaT03URrXVn7a6cAcCugpmPPhkptWg7RQ92ODJtTyr5s
         49XRu0EnJNSQ7ytcY3XWZUjaIw33/QNgPNMmqOPDMZ5ho5C5gSjsttAOtDZ8mPYYWOcs
         0W+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKac1TkrhoTDCdBYLfmUdEgrSPbT28oEnnjUI0V7tgc=;
        b=ERf5O3W2PKQl9j+DeVa/v0AZ5HZo1jHcIzrE7DCGgByQvzjo2jNXuXaH6TI7jOgtZ4
         m21/cQNLyb5JdyzbIuDSABUfDBr4KOJy1tcHPCFQEMrcpht5t7OQGYXlssnXgSNWa7NW
         vI3rQA8N47txgH+f1qexkwXRuDYHx5ieT2uKdNLY1MvWaYw+I2G9LT72MqEANacs5H7+
         Lexm81RVuA+Zc3VIRuuoNduGv/gAB4PYiN1BgkF711QKJjcVdTHnd+OhpbBpRfap22Ki
         GTGbMVJVmJ2H8OmXm2U04id2rhIPoyqH4m5uPrO4Mnn2A/p97PE7ayjnrtG+zTRoQsAi
         RMOg==
X-Gm-Message-State: AO0yUKUqZ7Ie6inXJYwiUdBekhz8LuHYM4YnTSc1eusMTBl6+xHWaC9E
	gUvycY3kChJ7ItdiqNX1zjytYJLHrIsLYLnGZ7RGKHmGb1/WShG9
X-Google-Smtp-Source: AK7set9B6Jdosayf0u8+yl0UPOk41c04M0E3YZlv28DdqAsMcrCOs5eTWtyhD1oDOAupNYDs2ytL9GVZLO9Y3U9twSo=
X-Received: by 2002:ac2:4437:0:b0:4e1:d025:789e with SMTP id
 w23-20020ac24437000000b004e1d025789emr3236275lfl.13.1677774326082; Thu, 02
 Mar 2023 08:25:26 -0800 (PST)
MIME-Version: 1.0
References: <CAD7mqryyz0PGHotBxvME7Ff4V0zLS+OcL8=9z4TakaKagPBdLw@mail.gmail.com>
 <789371c4-47fd-3de5-d6c0-bb36b2864796@ghiti.fr>
In-Reply-To: <789371c4-47fd-3de5-d6c0-bb36b2864796@ghiti.fr>
From: Chathura Rajapaksha <chathura.abeyrathne.lk@gmail.com>
Date: Thu, 2 Mar 2023 11:25:14 -0500
Message-ID: <CAD7mqrzv-jr_o2U3Kz7vTgcsOYPKgwHW-L=ARAucAPPJgs4HCw@mail.gmail.com>
Subject: Re: RISC-V Linux kernel not booting up with KASAN enabled
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_082530_792098_7FC58F44 
X-CRM114-Status: GOOD (  19.37  )
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

SGkgQWxleCwKClRoYW5rIHlvdSB2ZXJ5IG11Y2gsIGtlcm5lbCBib290ZWQgdXAgd2l0aCB0aGUg
cGF0Y2hlcyB5b3UgbWVudGlvbmVkLgpCb290dXAgd2FzIHByZXR0eSBzbG93IGNvbXBhcmVkIHRv
IGJlZm9yZSB0aG91Z2ggKG9uIGEgZGV2IGJvYXJkKS4KSSBndWVzcyB0aGF0IGlzIGtpbmQgb2Yg
ZXhwZWN0ZWQgd2l0aCBLQVNBTiBlbmFibGVkLgpUaGFua3MgYWdhaW4uCgpSZWdhcmRzLApDaGF0
aAoKT24gVGh1LCBNYXIgMiwgMjAyMyBhdCAyOjUw4oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4
QGdoaXRpLmZyPiB3cm90ZToKPgo+IEhpIENoYXR1cmEsCj4KPiBPbiAzLzIvMjMgMDQ6MTMsIENo
YXRodXJhIFJhamFwYWtzaGEgd3JvdGU6Cj4gPiBIaSBBbGwsCj4gPgo+ID4gSSBvYnNlcnZlZCB0
aGF0IFJJU0MtViBMaW51eCBoYW5ncyB3aGVuIEkgZW5hYmxlIEtBU0FOLgo+ID4gV2l0aG91dCBL
QVNBTiBpdCB3b3JrcyBmaW5lIHdpdGggUUVNVS4KPiA+IEkgYW0gdXNpbmcgdGhlIGNvbW1pdCBh
ZTM0MTlmYmFjODQ1YjRkM2YzYTlmYWU0Y2M4MGM2OGQ4MmNkZjZlCj4gPgo+ID4gV2hlbiBLQVNB
TiBpcyBlbmFibGVkLCBRRU1VIGhhbmdzIGFmdGVyIE9wZW5TQkkgcHJpbnRzLgo+ID4KPiA+IEkg
bm90aWNlZCBhIHNpbWlsYXIgaXNzdWUgd2FzIHJlcG9ydGVkIGJlZm9yZSBpbgo+ID4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9DQUNUNFkrWm11T3B5Zl8wdkhUVDR0M3drbUp1VzhFenZj
Zzd2NnlEVmQ4WU9WaVM9R0FAbWFpbC5nbWFpbC5jb20vdC8KPiA+IEJ1dCBJIGJlbGlldmUgSSBo
YXZlIHRoZSBwYXRjaCBtZW50aW9uZWQgaW4gdGhhdCB0aHJlYWQuCj4KPgo+IEkgcHJvcG9zZWQg
YSBzZXJpZXMgdGhhdCB3aWxsIGJlIGluY2x1ZGVkIGluIDYuMyByZWdhcmRpbmcgS0FTQU4gaXNz
dWVzCj4gaGVyZTogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJp
c2N2L2xpc3QvP3Nlcmllcz03MTg0NTgKPgo+IENhbiB5b3UgZ2l2ZSBpdCBhIHRyeSBhbmQgdGVs
bCBtZSBpZiBpdCB3b3JrcyBiZXR0ZXI/Cj4KPiBUaGFua3MsCj4KPiBBbGV4Cj4KPgo+ID4KPiA+
IE15IGtlcm5lbCBjb25maWc6Cj4gPiBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFq
OW5VN2Y5TXhDY19pLVVIVUNUdm83bzZuRHJjVXowdy92aWV3P3VzcD1zaGFyaW5nCj4gPgo+ID4g
QmVzdCByZWdhcmRzLAo+ID4gQ2hhdGgKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBs
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
