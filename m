Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07E0C4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 08:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d96IT2OMz/ye7UTIZz9p4UFKK/BSWF1A2i3ffGfZ2MY=; b=rCEGnmSFo1T5JS
	1tQqqZN2BgUuy4S2I6RMmV2jacZcamOJOO5gJ8VlfKdiAInhSiyOyvHNA9ddT+jOqeIzxysXef87Y
	FB0kSzZutvd3lOvu2no4DHu0+GZqt4QvUZSQSPjuG/xxVBLW63kgHfQ+WVuC7AJUoqNDAvcCCvX8R
	0JBYObsQcZuOn1pLWluQT9O3TzxPEcdKFRf2OEpwuN24XoD6qMVHCm1KM0Aas0459iWHLcX0WMRbQ
	ECzIuX9eda7genwrzH/8ELQCd/HPokimB19Urr4Y0Dsjtzu1hr9y85C98iM4lvDXmwUja0cNBuenj
	HfMs1MtTnSyG8PYEn45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpkN-00B53B-1q;
	Mon, 22 Jan 2024 08:33:35 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpkI-00B518-1F
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 08:33:34 +0000
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6e0e08c70f7so1107502a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 00:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705912347; x=1706517147; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtZqJ4B2FZGMNOG4yGL0LqaMUtfMJG6rR103zhhA9JQ=;
        b=cpI5CkMxagsi3DQXiQlo2FwJKjJTgR2GW16jMzBTTjE8StloQWGv2rx8n9arIwDr39
         W99EuOndOBlu0qW7YyxpIfN1uEn3rJl6jeB87q22TTwM1GN2JtuF/u9WP10RSoI+z/x4
         74sGDlzuwm4Mb68dw/PTw+Tqia9Q0IBJ7Gy8mGdclnNejJ9iAyYpE58RICqHUBlErBof
         jkQG58vbLFNs3fPptN6fc5jUAcUbk+d0wYQZXWJaxfOYceMdbOtEsm9Vg+O1xPSrJOHt
         OGJS3TCSbcHboTthEBmOA9jZXMRwjzSRAxYOmH0ZDyD/bTUZEGstwg5fB4BDN05K+hR3
         uDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705912347; x=1706517147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtZqJ4B2FZGMNOG4yGL0LqaMUtfMJG6rR103zhhA9JQ=;
        b=w5+MHW1aKHSG/nwqYGtv42TzdhnU7Og3ONZE2HB68DTy+HWQslb9YPl2/p4lk9z9zC
         uHG5q8cV8eBboOYGzWPwVbHnBhRRH14gwQF2g9RE+L7K0mjP6E0xI+hrucSs0xbL/QU3
         nY1JGTuv0pDuBSBWtabCanTQNgSruuUFIEFQ9jWDuA507UDb7TF0WYv8hA47VA5ztAzT
         F7z1MholkeX3o+Rd/HSaorOcTAyznASYWNBlYFHr/L+xgopl+cglLui9NLG/XjF7xK3W
         4NmJ9QBN2WxWL7Ml+wB+m8Y31/sGuANsmv/Py/zRWV5du3fEFnyKxop/B4nFyzsZsg3H
         6nug==
X-Gm-Message-State: AOJu0YwSXBFCRA22eG3xrDKVnu9V2PHWqqhC/zQr0oU/0LH9XSnSswOC
	VZQYCRskyOlpaIZu71YlepUlS4zrV3xhbCXRWpqr2y9uuYpAftZFRlNPLCHIH8g+A7JWPys1fRD
	ks+cqxCXB3HvzSOZX96bcn99k5NjZz/Z9v6G6jg==
X-Google-Smtp-Source: AGHT+IFnq3h8ethTPUxLz6Ya3PNnAQJ5O4TRAx+X0AmSFv8u3tvvhEcM78yKIkf+FYTTqsGGlgcwgNrYHjSv6VXjxEg=
X-Received: by 2002:a05:6871:494:b0:210:a266:68e4 with SMTP id
 f20-20020a056871049400b00210a26668e4mr1768579oaj.9.1705912347326; Mon, 22 Jan
 2024 00:32:27 -0800 (PST)
MIME-Version: 1.0
References: <20240122013510.55788-1-cuiyunhui@bytedance.com> <20240122-boxcar-conical-c728a709aa5c@spud>
In-Reply-To: <20240122-boxcar-conical-c728a709aa5c@spud>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 22 Jan 2024 16:32:15 +0800
Message-ID: <CAEEQ3wmX7_VP-YM9NkesAhd+5zetw79AW9bo0YO7KGAeJX4eRQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: cacheinfo: add init_cache_level()
To: Conor Dooley <conor@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, robh@kernel.org, sudeep.holla@arm.com, 
	pierre.gondois@arm.com, suagrfillet@gmail.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_003330_421890_92233B89 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

SGkgQ29ub3IsCgpPbiBNb24sIEphbiAyMiwgMjAyNCBhdCA0OjA54oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSmFuIDIyLCAyMDI0IGF0IDA5
OjM1OjEwQU0gKzA4MDAsIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiBXaGVuIGNhY2hlaW5mb19zeXNm
c19pbml0KCkgaXMgZXhlY3V0ZWQsIHRoZSBnZW5lcmFsIHdlYWsgZnVuY3Rpb24KPiA+IGluaXRf
Y2FjaGVfbGV2ZWwoKSByZXR1cm5zIC1FTk9FTlQsIGNhdXNpbmcgZmFpbHVyZSB0byBhZGQgdGhl
ICJjYWNoZSIKPiA+IG5vZGUgdG8gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1eC8uIEltcGxl
bWVudCB0aGUgaW5pdF9jYWNoZV9sZXZlbCgpCj4gPiBmdW5jdGlvbiBvbiBSSVNDLVYgdG8gZml4
IGl0Lgo+Cj4gSWYgeW91IHJlY2FsbCBjb3JyZWN0bHksIEkgYXNrZWQgeW91IHRvIGV4cGxhaW4g
aG93IHRvIHJlcHJvZHVjZSB0aGlzCj4gd2hlbiB5b3Ugc2VudCB0aGUgcGF0Y2guCgpJbiBmYWN0
LCB0aGUgcmVhc29uIGhhcyBiZWVuIGV4cGxhaW5lZCBpbiB0aGUgY29tbWl0IGxvZy4gQXMgZm9y
IGhvdwp0byByZXByb2R1Y2UgaXQsIHlvdSBjYW4gY2hlY2sgd2hldGhlciB0aGVyZSBpcyBhICJj
YWNoZSIgbm9kZSBpbgovc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHV4LyBvbiB0aGUgcmlzY3Yg
cGxhdGZvcm0uCgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
