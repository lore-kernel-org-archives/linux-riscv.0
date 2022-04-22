Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5123FC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 21:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qG2OPcWUE5EejuK924408aMG2wu2LcdXmNKVtr48pCw=; b=trSIf5UH8cMYaF
	zkBOwYeWpK8fr/VjjuK7TXM9z1vmvD+LJE2Oh0NR7PYJ3dfjqEyGRNpXNfdPjvPx92Ts+v6kGj+Xm
	Yr2V8gDJ4xVdDdhDUMuZ4KpxAOAnJOFBHO7vWmY7qQ9CEf/+PxM4mTuoqou7OFrsQz+q4G4r1wLMm
	OpceOJPMMqrttAZAS04WGVGEu0Y9WpwD5KGXxqCn/x2xfkUVD7qzhUrZnQdyYJKk6zZVYUGg/o+yy
	O7LDJ6q91NDk7h4Hi4rku70JMNWXGJI8YW2sySfmU2JRQzQCkI4kW4ux17RZD1A1JUQqbuSrtYGAD
	FgvgXKYOipRKe1v+DnKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni0ZS-002MND-1y; Fri, 22 Apr 2022 21:12:06 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni0YO-002Lov-0t
 for linux-riscv@lists.infradead.org; Fri, 22 Apr 2022 21:11:01 +0000
Received: by mail-wr1-x434.google.com with SMTP id e2so6437169wrh.7
 for <linux-riscv@lists.infradead.org>; Fri, 22 Apr 2022 14:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Nv090Fcw5CRXAaqf5egbVl68mvzRIHG6Z9TCjtt4enM=;
 b=PIt2cs6jOIOUgaIna9c9dpTesElZzi3jz1neSNkXEomyGjBVvXOjSMkMZa20d8GjHn
 erpB9HYm3lg9hrfn1M//0zFVvG+EbcFUubN1KHYOhKenQOPxFNLOqqLsCuWhiWkeElBE
 Jqs9U9EJMCcXPLC6GdUw63M9JCWvA9OKaNdPswN7ACPgo8/PBXFusy870BIyn5yhw36I
 CvUzyiq/XEzRjXKDo9XzuH7K414dVacWP5Pnyx+uNEbDw8+/BaHeb28uUfs7NZcBIAMV
 jdRLpuFPPVZaiR4KJSA/dKfpp+lRyIHFxkB4PAtAWBoGVYJDC7kjOhS/E39JWtnZXP0C
 2v7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Nv090Fcw5CRXAaqf5egbVl68mvzRIHG6Z9TCjtt4enM=;
 b=VE/C4zBwrwAsHOAdV0329zxNzYMriGZompNGh6SdObbK0+sXZFjZANEXTBADTEzYbv
 r8o4YvjK/6CEoX3WNXJxtOp1K2bSj8BjlpukOHJ0p+h4P2uMNxcT/tXMmUXg+Pc69yNG
 2jD6qYwRo7BW2xrLAuUdP9cgd2zS/vcybFWTTrsycvLL6J/YFH8Tojrbp2J1lm6Lw5un
 0YbiIvQrTA98YEQvWr6U9RV0w40qrm7tA3flw5bQlWBQPxxL/Wo3zJTzzsWiXJ6hqx+b
 ONsAuvE5XL5csdxxaNhyfmoAzPthDLyKSQn0YUPOCUnO6NDe4N/ZthvYPpB31FKOxmDs
 yyhA==
X-Gm-Message-State: AOAM530DJnldFA2SyUffcfpkdU1PrxhrmAPZKFv7/AM9J7foIeHSY52x
 BTPjyTo3sxyfARVXIWwATLP+fw==
X-Google-Smtp-Source: ABdhPJwxuOWuvmk+e3OO09OIMy4zsdVziUGh9Xv6Vja6F3VDwf9pI5Otah7WhFWcP1DDUrl34YXANA==
X-Received: by 2002:a05:6000:1547:b0:20a:79dd:289f with SMTP id
 7-20020a056000154700b0020a79dd289fmr5406068wry.56.1650661857407; 
 Fri, 22 Apr 2022 14:10:57 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.209.28])
 by smtp.gmail.com with ESMTPSA id
 n2-20020adfc602000000b0020ac8335e46sm2970537wrg.99.2022.04.22.14.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 14:10:56 -0700 (PDT)
Message-ID: <986c73df-9634-d18b-eed3-37584fa2ea89@conchuod.ie>
Date: Fri, 22 Apr 2022 22:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 0/9] More PolarFire SoC Fixes for 5.18
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: mturquette@baylibre.com, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, robh+dt@kernel.org, krzk+dt@kernel.org,
 daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 atulkhare@rivosinc.com
References: <mhng-185e3a61-0634-4671-adfd-a1cc223920cf@palmer-ri-x1c9>
 <0f99ec7b-0c2f-cf6c-162d-af615eb73373@conchuod.ie>
 <20220422210040.68019C385AA@smtp.kernel.org>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220422210040.68019C385AA@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_141100_111230_D237BAC6 
X-CRM114-Status: GOOD (  13.57  )
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

CgpPbiAyMi8wNC8yMDIyIDIyOjAwLCBTdGVwaGVuIEJveWQgd3JvdGU6Cj4gUXVvdGluZyBDb25v
ciBEb29sZXkgKDIwMjItMDQtMjIgMTI6NTk6MDkpCj4+IE9uIDIyLzA0LzIwMjIgMjA6MzksIFBh
bG1lciBEYWJiZWx0IHdyb3RlOgo+Pj4KPj4+IFRoYW5rcy7CoCBUaGVzZSBnZW5lcmFsbHkgbG9v
ayBnb29kIHRvIG1lLCBidXQgSSBkb24ndCBzZWUgYWNrcyBmcm9tIGV2ZXJ5b25lLsKgIEknbSBw
ZXJmZWN0bHkgZmluZSB0cmVhdGluZyB0aGVzZSBhcyBmaXhlcyBhbmQgdGFraW5nIHRoZW0gdGhy
b3VnaCB0aGUgUklTQy1WIHRyZWUsIGJ1dCBsb29rcyBsaWtlIGl0J3MgbW9zdGx5IGNsayBzdHVm
ZiBzbwo+Pj4KPj4+IEFja2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNv
bT4KPj4KPj4gWWUsIGhvcGVmdWxseSB0aGV5IGdvIHZpYSBjbGsuIFN0ZXBoZW4gcmVwbGllZCB0
byB2MSBvciAyIHNvCj4+IEkgZmlndXJlIHRoZXkncmUgaW4gaGlzIHF1ZXVlIDopCj4gCj4gSXQg
aGVscHMgdG8gYmUgZXhwbGljaXQgaW4gdGhlIGNvdmVyIGxldHRlci4gSXQncyBpbiBteSBxdWV1
ZSBidXQgSSBwdXQKPiBpdCBvbiBob2xkIGJlY2F1c2UgdGhlIGNvdmVyIGxldHRlciBkaWRuJ3Qg
Y2xhcmlmeSB3aGF0IHRyZWUgaXQgd2FzCj4gaW50ZW5kZWQgZm9yIG5vciB0aGUgcHJpb3JpdHkg
b2Ygd2hhdCBpcyBiZWluZyBmaXhlZC4KCkFoIHJpZ2h0LCBteSBiYWQuIFRoZSBjb29yZGluYXRp
bmcgdGhpbmdzIGJldHdlZW4gdHJlZXMgc3R1ZmYgaXMKc3RpbGwgcHJldHR5IG5ldyB0byBtZS4g
SWYgeW91IGNvdWxkIHRha2UgdGhlIGxvdCB2aWEgY2xrLCB0aGF0J2QKYmUgZ3JlYXQ/CiAKPiBJ
cyBib290IGJyb2tlbj8gRG8gSSBuZWVkIHRvIHNlbmQgdGhlc2UgdXAgdG8gTGludXMgbmV4dCB3
ZWVrIGFzIHBhcnQgb2YKPiBmaXhlcyBmb3IgdGhpcyBtZXJnZSB3aW5kb3c/CgpCb290IGlzIG5v
dCBicm9rZW4sIEkgd2FzIGhvcGluZyB0aGlzIHdvdWxkIGdvIGludG8gNS4xOCB0byBhdm9pZApo
YXZpbmcgdG8gZGVhbCB3aXRoIHR3byBkaWZmZXJlbnQgc29ydHMgb2YgcmVmZXJlbmNlIGNsb2Nr
IERUCmVudHJpZXMgLSA1LjE4IHdoZXJlIHRoZSBEVCBwcm92aWRlcyB0aGUgbXNzIHBsbCAmIDUu
MTgrbiB3aGVyZQp0aGUgRFQgcHJvdmlkZXMgdGhlIGlucHV0IHRvIHRoZSBtc3MgcGxsLgoKU28s
IG5vdCBuZXh0IHdlZWsgdXJnZW50LCBidXQgYXMgZml4ZXMgZm9yIHRoaXMgd2luZG93IHBsZWFz
ZS4KClRoYW5rcywKQ29ub3IuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
