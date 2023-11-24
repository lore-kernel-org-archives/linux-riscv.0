Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864F5C61D97
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 10:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9UtUfmt1wbgDS9IIY4pjwKJ0HRgbk06t0BBNWIp2Uic=; b=RtB6OUSe0Lum1w
	odBxomE/Slk+j2qrt20vL4fpKrWLpz1QgQRMd4x/v5r1YRUK3WJrYfjF8jEXe5lhmqvHOY+zrXENt
	TZ4PSI4QMtrp5NyC2sjizC7ZgTyB2eInTpqf32GqNqv5DkBWx3TD6Vah+ideRzNCaJ+7HPMGjp63P
	P7I8YTVl9e7FvighELd2qHqViNm05Pfi2Ha3rEgIMB0TXiSJbRjG2O99NGyCG7rOcDSxcxAWLN4gz
	kULKSkP2GaYMbg22pnNIhIxWOqb09TfYfNE4K3lLYJ74cYIzfSPs5Iggqpinw0LxCqvj4iWdM86a/
	isoo4GGrtqs/OQxj++kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Thy-006uZJ-0T;
	Fri, 24 Nov 2023 10:46:50 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Thv-006uY1-2M
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 10:46:49 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-332e11a977bso360714f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Nov 2023 02:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700822803; x=1701427603; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=44pJYG7VrtXx5lOTjT3hEDyjUe6m6/HlDjLNzhiVO6M=;
        b=kSFsu8o+cS2oj25g7AQvQK/F/jwe2A02MOwIVvoCbYsDRI2cXfzURlovzj9bo78NBa
         Q3mqN20lZ/22lAzqJE0MrQa0HjoMpJXr8IN5YHtUVd/fHe6V/xepydv9SKHGAHthfBbX
         U9mFrIgr4s3lzrluJAfzIL4GlE2qNbbRW6tLwp0ZRFNvB3h/CNoesvIQAdxBxJfzbiiK
         aXOpwT8NEydUs9J0HTirp6RJb2ePuNSQNMNt86Z9TGjMvRdVpJ5yrfYrzVA37ZxzPHTk
         Vui9DBVMovfbjW0/kftvTRKYXuReYdSknSvTqBllZzjBOGyGswybL9WcAMIrRJIrM7gA
         lOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700822803; x=1701427603;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44pJYG7VrtXx5lOTjT3hEDyjUe6m6/HlDjLNzhiVO6M=;
        b=mSsNox50Za+9BqxH0MsjhJV6HnO+R2KAiPDAmknvwCU2bO0NdzMlbRlZ+GoM8cF7Q7
         AsrcXjX0bAHIHN3F28LTJ1J4OtMER0KNFSbGIgNImr0hV3lIwbhtJx82z/VCO7E4hlUa
         K3pk86H0GrgA7rRZV4PChjkvSxde3zrlHuxreh8SNRvZ2RgsVnl1Eugdi3VrOqMjCbgJ
         FMEeMx4Ggv5AA//5Lyl03p2ygt6JqBULUC0fLr5naJDZeLm3xGn8VnygBIiTFa4XG/If
         +8Rj8LiPe4fDdUDRNA4wvtPoQSm15rjDdRv2p3bQPdqmIJgOuR0OM/7VhlXiMSQxr7mQ
         ougQ==
X-Gm-Message-State: AOJu0YxtKSdfFGUx27E5FzRPQMIKAxlP0DKTdgtViEQTqty92hIF2Lv5
	4lXICX/f8R8yWp5QeWjI+niE9g==
X-Google-Smtp-Source: AGHT+IHoZucoU3rr3MCXHd26VKz8Du9qGoZZpci75PKfi9pjdstzMQQZg2fA6S9qpau453e3PuUKjA==
X-Received: by 2002:a7b:cc87:0:b0:404:72f9:d59a with SMTP id p7-20020a7bcc87000000b0040472f9d59amr1832150wma.0.1700822803693;
        Fri, 24 Nov 2023 02:46:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:3471:930b:671b:cf77? ([2a01:e0a:999:a3a0:3471:930b:671b:cf77])
        by smtp.gmail.com with ESMTPSA id y16-20020a5d4ad0000000b0032d9f32b96csm3975301wrs.62.2023.11.24.02.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 02:46:43 -0800 (PST)
Message-ID: <de9c1287-9be0-40bf-8dbd-717c56ea0d7e@rivosinc.com>
Date: Fri, 24 Nov 2023 11:46:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: fix __user annotation in traps_misaligned.c
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
References: <20231123141617.259591-1-ben.dooks@codethink.co.uk>
 <ZWA9HwUNHDFIw0wP@infradead.org>
 <7232f08e-dfe3-43d6-a4f7-abf8360bbfc1@rivosinc.com>
 <ZWB+rPU4nm+Zxd7d@infradead.org>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <ZWB+rPU4nm+Zxd7d@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_024647_765530_E1095A33 
X-CRM114-Status: GOOD (  12.10  )
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

CgpPbiAyNC8xMS8yMDIzIDExOjQ1LCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBGcmks
IE5vdiAyNCwgMjAyMyBhdCAxMToyODowOEFNICswMTAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4+IEkgc2VudCBhIHNpbWlsYXIgcGF0Y2ggdHdvIGRheXMgYWdvIHdpdGggdGhlIHNhbWUgbW9k
aWZpY2F0aW9uLiBJJ20gbm90Cj4+IHN1cmUgdG8gZ2V0IGl0LiBXaHkgaXMgaXQgYmV0dGVyIHRv
IHBhc3MgdGhlICJ1bnNpZ25lZCBsb25nIiB0eXBlIGZyb20KPj4gdGhlIGNhbGxlciA/IEkgbWVh
biwgdGhlIHJlc3VsdGluZyBjb2RlIHdvdWxkIGxvb2sgbGlrZSB0aGlzIHJpZ2h0ID8KPiAKPiBC
ZWNhdXNlIHlvdSdyZSBsZWdpbWl0aXppbmcgY2FzdGluZyBiZXR3ZWVuIGFkZHJlc3Nfc3BhY2Us
IHdoaWNoIGlzIGEKPiBob3JyaWJsZSBpZGVhLiAgQnkgY2FzdGluZyBlaXRoZXIgZnJvbSB0aGUg
dW5zaWduZWQgbG9uZyB5b3UgbWFrZSBpdAo+IHZlcnkgY2xlYXIgdGhhdCBkZWVwIG1hZ2ljIGlz
IGNvbWluZyBpbiBhbmQgeW91IG1ha2UgYW4gaW5mb3JtZWQKPiBkZWNpc2lvbnMgYmFzZWQgb24g
dGhlIHVzZXJfbW9kZSgpIHByZWRpY2F0ZS4gIFdpdGh0IGEgYmxpbmQgY2FzdAo+IHRvIGFkZC9y
ZW1vdmUgYSBfX3VzZXIgeW91IGRvbid0LgoKTWFrZXMgc2Vuc2UgaW5kZWVkLCB0aGFua3MgIQoK
Q2zDqW1lbnQKCj4gCj4gSSdtIGFjdHVhbGx5IHN1cnByaXNlZCBzcGFyc2UgZXZlbiBhbGxvd3Mg
X191c2VyIGNhc3RzIHdpdGhvdXQgX19mb3JjZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
