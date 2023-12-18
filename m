Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896D9C46CA2
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 20:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXiGkauUJki4kaGvkpbDh3uLxFQSvRJLWIOYtBSqJbE=; b=FKX5fk7u01XMvY
	uycDbuMIz+mjiSW9Djz2JEMH2tZYLw6YHJbwAZ6OcdlMoxgv2gDNpM+slzko8WiS4yT7y+kz3zJGj
	1bDVgrt6nQjEhXzK7w8zQKjU+5umpol+vFIb6LkqBfWmjI5qPaIyPhNCtYR/HwljPqQdQDJt+bD3W
	Y2SPywzX5f7qqulgAHEmSw34XYuya9nPjqIdfjUeJ0ccSd9yRrIC9+SsRypbRqjGW1cv1R0RjgtNp
	sgBKtMcXAX6gbrHwmda3RdpKc1LbWDVnDiW1WGp8+G62vD6gS4fgSgCrNYUDBOLtiM0hU1uI4v6ZX
	Hptd+TmvGOag3MvXOuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFKKr-00C2B6-24;
	Mon, 18 Dec 2023 20:35:33 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFKKo-00C29h-0P;
	Mon, 18 Dec 2023 20:35:31 +0000
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6da35e84719so856569a34.1;
        Mon, 18 Dec 2023 12:35:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702931727; x=1703536527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5muLLdvnEWK5GQ123Z96eJyI+5glad1JcNNdF8H1Jg=;
        b=u3/XKCm9IsoEqoLACaPH0BQ6LtFbrsJvu+P56FK+OoSyO8OJcED1lJqz1IC32sbdW9
         oEJesy69pAeEDIrYyCK29a4kntVSNlU8JEyOslbfLUncFHxN8FQ1DJxeQRd2/PBUa5/Q
         xHycbdYppdMxquvSSfeVDZikZyiT+FZc8HdoxvlX6OqmyXDcrFb0zzMbEvwZj1bFKH/d
         UFTz/1QReW4orJe+7BKIMWyvHXojpERMdwFp5o85nMXLkou5kozpdqv3dwJX/zagyXab
         XabSQhBbHoKxkWR7XA7LyRUNv65c142YWu+U0e2YeCNrWB/4TcLnezjOdXlrmhVaChSc
         xaeA==
X-Gm-Message-State: AOJu0YybnNbiPX92KPBN4W8wVXFVn++kqPTu+TWQa4Lp4xUgOWNOKn1L
	yHcmGNxbUhpMIsdksRonJ40y0VpYseN4dTCRTRg=
X-Google-Smtp-Source: AGHT+IF1MjB6QbmwWfc3T+5pLabp0AF+8g7RLCoeqeEABS9CAvETyoAN6o6rB15S5OlZOByT2E647igWVuJN9yCJ/4I=
X-Received: by 2002:a05:6870:71ca:b0:203:e75d:a2c2 with SMTP id
 p10-20020a05687071ca00b00203e75da2c2mr729668oag.1.1702931727130; Mon, 18 Dec
 2023 12:35:27 -0800 (PST)
MIME-Version: 1.0
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk> <E1rDOgD-00Dvk2-3h@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1rDOgD-00Dvk2-3h@rmk-PC.armlinux.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 18 Dec 2023 21:35:16 +0100
Message-ID: <CAJZ5v0g9nfLrEf9u4Ksw6BOWJQ9iv8Z-O8RsLU6jR5zk0ahxRw@mail.gmail.com>
Subject: Re: [PATCH RFC v3 05/21] ACPI: Rename ACPI_HOTPLUG_CPU to include 'present'
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_123530_159550_174E0AF7 
X-CRM114-Status: GOOD (  12.01  )
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

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMTo0OeKAr1BNIFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5l
bEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gRnJvbTogSmFtZXMgTW9yc2UgPGphbWVzLm1v
cnNlQGFybS5jb20+Cj4KPiBUaGUgY29kZSBiZWhpbmQgQUNQSV9IT1RQTFVHX0NQVSBhbGxvd3Mg
YSBub3QtcHJlc2VudCBDUFUgdG8gYmVjb21lCj4gcHJlc2VudC4KClJpZ2h0LgoKPiBUaGlzIGlz
bid0IHRoZSBvbmx5IHVzZSBvZiBIT1RQTFVHX0NQVS4gT24gYXJtNjQgYW5kIHJpc2N2Cj4gQ1BV
cyBjYW4gYmUgdGFrZW4gb2ZmbGluZSBhcyBhIHBvd2VyIHNhdmluZyBtZWFzdXJlLgoKQnV0IHN0
aWxsIHRoZXJlIGlzIHRoZSBjYXNlIGluIHdoaWNoIGEgbm9uLXByZXNlbnQgQ1BVIGNhbiBiZWNv
bWUKcHJlc2VudCwgaXNuJ3QgaXQgdGhlcmU/Cgo+IE9uIGFybTY0IGFuIG9mZmxpbmUgQ1BVIG1h
eSBiZSBkaXNhYmxlZCBieSBmaXJtd2FyZSwgcHJldmVudGluZyBpdCBmcm9tCj4gYmVpbmcgYnJv
dWdodCBiYWNrIG9ubGluZSwgYnV0IGl0IHJlbWFpbnMgcHJlc2VudCB0aHJvdWdob3V0Lgo+Cj4g
QWRkaW5nIGNvZGUgdG8gcHJldmVudCB1c2VyLXNwYWNlIHRyeWluZyB0byBvbmxpbmUgdGhlc2Ug
ZGlzYWJsZWQgQ1BVcwo+IG5lZWRzIHNvbWUgYWRkaXRpb25hbCB0ZXJtaW5vbG9neS4KPgo+IFJl
bmFtZSB0aGUgS2NvbmZpZyBzeW1ib2wgQ09ORklHX0FDUElfSE9UUExVR19QUkVTRU5UX0NQVSB0
byByZWZsZWN0Cj4gdGhhdCBpdCBtYWtlcyBwb3NzaWJsZSBDUFVzIHByZXNlbnQuCgpIb25lc3Rs
eSwgSSBkb24ndCB0aGluayB0aGF0IHRoaXMgY2hhbmdlIGlzIG5lY2Vzc2FyeSBvciBldmVuIHVz
ZWZ1bC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
