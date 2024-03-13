Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2320C54791
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 11:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+YhHlAYagk6fK+cLdXa1cLsMTUpgATPVETX8lA3i9Aw=; b=NBOjzXcXqqGpiS
	suxHlkQTn9EVGetzocJrkqxw8kHBSPsIpZdhoY6FWBgeY52BjjaGfsw9d5F/ddSiMveRI48cBxchb
	WVbObw0Tr+4Ja/Y1l/r9ofc7O/LK3pT2FsvcCjVeG3ZLN7MZuzAL6Gv3edTJ7GZmMghhfELD6r4I9
	YzdW7AWHCQ+gWRPn0U2hJgSOmA+akc+Be1B97qaPKDKe+gMNgAUGGo3ZcY1ZKvq+8nq6DIQUnLY41
	CNkhBdRezSJgtGt2W2LwLKINJcT4QlV6IAoEbjASFPlmZic+fDPtrz+l9wGE2CFa7sbVEKYrG0AaO
	gYJ1GWj6ohZ82Qh2zPcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkMWQ-00000009rtG-2HhU;
	Wed, 13 Mar 2024 11:11:46 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkMWM-00000009rrF-0AbZ
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 11:11:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-413ea3219feso2846555e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2024 04:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710328300; x=1710933100; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iGu108ok/BlzqaUsJF63tRhDYVja7ZGknjz9bScPQ20=;
        b=ttaW6xdzzkJRGPMWbq8yegYSzZW1zBHkjKryad+4wwzk+eBxE8+yLshBvwCCzt/E3V
         cGHbtvXWw7LXslHeCWB+WWvwf9dlDrIJ/D218tkxIeJv6Kcot4bS/QOefbCx3a9FBdiJ
         QKlKibMtP+uuVyW4EK5AOatxuezfrC8TCrRV+ioWO0OzPRsiKQjccqC0HBOBUKh25lH7
         brJFPbuixbGMS3/fG7oAnXsxd/ILJ63YS++a+S7PndJU4aV77F//cBrHQe43ZNaJcIHG
         G1Ruhv/h+AkhgkF5crGd3jf2webhuUFrJyEuPeiX6D2ZsE0dbFQ5wQg9DLnsiFlyvs9s
         kzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710328300; x=1710933100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGu108ok/BlzqaUsJF63tRhDYVja7ZGknjz9bScPQ20=;
        b=X1C+CCTzGs9xEktPXl0676/EBJ5FlhvGM7H/QngEIiRhQvYRh/EkAwHY27w5Cax+E6
         Bp16O9QMNKPeBQm3gIVmevKcdwWZmAl/IACsMv11ryhNuGmHWdoJuwYD/2Q8qA2oQZOo
         KT62u8PPifHLbfdhcrJSrhCk8da0CWyXZFw+Q5G6grg/jQk0Kdb/X1rxY0JpeWUcxylB
         oAaZY3kRiEy6cbjwv4s6PGht3Qnz07Wb/Prw60PAX86A9MeJLno5AeqjvMEMWWYvIwnp
         ymCSLVJP/JrqZhYqplTDNwilE5uxY68bKOmJd2ENasJHHBANzf2hKBPzH329t5JfnSXz
         NXAg==
X-Forwarded-Encrypted: i=1; AJvYcCUfmSxgkAueHYKyX7/qAtmRnNIS7moAW9q42cxfIsniAVymyKMSSJ0bb/dxn9pDI3gzWdvsrV0vAptTXg+hUy3YYtKrcuA54EZzvYu5WZ2I
X-Gm-Message-State: AOJu0YxktwJbwcqxu8i4v9GWXlfJygAWhSbedsXXogg0ZhQyblVb8LIY
	QjtqIqX2zqyKanZhJ47c47Gyekp6wLY1zLXHqyxNRllwz0tLtioAAgn1avjSxFY=
X-Google-Smtp-Source: AGHT+IF4G9WZUEvlQlxg4UeXBzioTEl5qAud9Gps6pFQCLKtagQAg4Fwxva6RxmsZhVomOPQZ0+pUg==
X-Received: by 2002:a5d:408a:0:b0:33e:9311:5fda with SMTP id o10-20020a5d408a000000b0033e93115fdamr1338958wrp.29.1710328300192;
        Wed, 13 Mar 2024 04:11:40 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id q11-20020adff94b000000b0033e95bf4796sm7905988wrr.27.2024.03.13.04.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 04:11:39 -0700 (PDT)
Message-ID: <932168cb-b1a5-43f7-a138-90ec8552c577@linaro.org>
Date: Wed, 13 Mar 2024 12:11:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/timer-sun4i: Partially convert to a
 platform driver
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <apatel@ventanamicro.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240312192519.1602493-1-samuel.holland@sifive.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240312192519.1602493-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_041142_107333_E67A7DC8 
X-CRM114-Status: GOOD (  10.96  )
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

T24gMTIvMDMvMjAyNCAyMDoyNSwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4gQ29tbWl0IDhlYzk5
YjAzMzE0NyAoImlycWNoaXAvc2lmaXZlLXBsaWM6IENvbnZlcnQgUExJQyBkcml2ZXIgaW50byBh
Cj4gcGxhdGZvcm0gZHJpdmVyIikgYnJva2UgdGhlIE1NSU8gdGltZXIgb24gdGhlIEFsbHdpbm5l
ciBEMSBTb0MgYmVjYXVzZQo+IHRoZSBJUlEgZG9tYWluIGlzIG5vIGxvbmdlciBhdmFpbGFibGUg
d2hlbiB0aW1lcl9wcm9iZSgpIGlzIGNhbGxlZDoKPiAKPiAgICBbICAgIDAuMDAwMDAwXSBpcnE6
IG5vIGlycSBkb21haW4gZm91bmQgZm9yIGludGVycnVwdC1jb250cm9sbGVyQDEwMDAwMDAwICEK
PiAgICBbICAgIDAuMDAwMDAwXSBGYWlsZWQgdG8gbWFwIGludGVycnVwdCBmb3IgL3NvYy90aW1l
ckAyMDUwMDAwCj4gICAgWyAgICAwLjAwMDAwMF0gRmFpbGVkIHRvIGluaXRpYWxpemUgJy9zb2Mv
dGltZXJAMjA1MDAwMCc6IC0yMgo+IAo+IEZpeCB0aGlzIGJ5IHdyYXBwaW5nIHRoZSB0aW1lciBp
bml0aWFsaXphdGlvbiBpbiBhIHBsYXRmb3JtIGRyaXZlci4KPiBidWlsdGluX3BsYXRmb3JtX2Ry
aXZlcl9wcm9iZSgpIG11c3QgYmUgdXNlZCBiZWNhdXNlIHRoZSBkcml2ZXIgdXNlcwo+IHRpbWVy
X29mX2luaXQoKSwgd2hpY2ggaXMgbWFya2VkIGFzIF9faW5pdC4gT25seSBjb252ZXJ0IHRoZSBz
dW44aQo+IHZhcmlhbnRzIG9mIHRoZSBoYXJkd2FyZSwgYmVjYXVzZSBzb21lIG9sZGVyIFNvQ3Mg
c3RpbGwgbmVlZCB0aGUgdGltZXIKPiBwcm9iZWQgZWFybHkgZm9yIHNjaGVkX2Nsb2NrKCkuCj4g
Cj4gRml4ZXM6IDhlYzk5YjAzMzE0NyAoImlycWNoaXAvc2lmaXZlLXBsaWM6IENvbnZlcnQgUExJ
QyBkcml2ZXIgaW50byBhIHBsYXRmb3JtIGRyaXZlciIpCj4gU2lnbmVkLW9mZi1ieTogU2FtdWVs
IEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gLS0tCgpBcHBsaWVkLCB0aGFu
a3MKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3Vy
Y2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFj
ZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMh
L2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cv
PiBCbG9nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
