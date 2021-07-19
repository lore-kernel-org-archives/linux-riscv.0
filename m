Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3705C07E9D
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 14:00:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6BC960FEA
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 14:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6BC960FEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=A7Wr0SJj+gl6hVHAin+VkxCUnzWWzYIhQAQq+UskECI=; b=FahdZBGhAFe7afG5d5bLTM3TZY
	YFwUJMi4dUgTPfH6x/4wn5Q66gkrohQCLdXYuHDQKDeoXREFqT4nFft1nemUbwAG0PT2kbGBgsKx/
	X0260wisDKaXkYsd8BdS3dwpU/gIo4VHHOSqPepD5b3Cl7KxZRnT3tybPzibS7yFVEmGAzLHy72sM
	dNkbHs8zrA1OELk7K9nV3cBMlRxzW63rDOdtxJrh9GPuzEZdJvwgeH42FBSykorp92dSsJ6bJZyZP
	BycdN46t4htJGT9NE48eH3KAF/fzJ4W7qMemK/4ye30XtihD4R2yG3RqPIoUSEWelp6hjyAV1rDaJ
	7QY6nJHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Toj-009peZ-Aa; Mon, 19 Jul 2021 14:00:21 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5Toh-009pe1-33
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 14:00:20 +0000
Received: by mail-pf1-x435.google.com with SMTP id d12so16580714pfj.2
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 07:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=A3QE1jNI0Mn5+bxGAdS1FlqgSnYTHTQYzfnIBkSNZuw=;
 b=KPhoDCCw9qtZsThRIfu6l/wx3ELByphnnhav08bU8cmIozRL+HHyykg6WxacNC8RbB
 3kNgOG9UA+TY8JfzamekW+lQrfhXLM9USnRpVJD9W/Mx7SWgqmBqfVs/xOBdKKIHuA5Y
 dd+y47EZB6OCz8ohyYfo3Y1LpygQ1T/+Cv1EJdXx5KSoLdpj65r9ZAkrLk/18pSjTlIi
 pu3ze+p8dKokZCs3GZhEvrqY8MTt76S282b6Cwaa3jNjVPv5Q60Oh6xqPxc1RDCFZMiN
 vF/TRntFP+CEMrXK9cbfCBAFTunz/h7Q7nkz2KkxcG4Hryh7zj/cBEryZQe3jfJmDR6v
 r3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A3QE1jNI0Mn5+bxGAdS1FlqgSnYTHTQYzfnIBkSNZuw=;
 b=PJgYl4BsEW79cCXp95ePX8zbGZnqerfiDqtwvSaQ7tSaSnuCLiwo3qaxDnvBDXK24S
 UTarmoqdpiXAigcUIT6GYQmj/RgHa/BfzcoDq+8TD8xOTBpp9r9AIJNvhXfwjlBmTbrm
 uA3nkSIsmokjDThKdyYrcOoxinxoouHxYx1ZIgi/CBIFZ3pyHuMKmZmQZ5U2rIWS+Bnf
 GuEN+b9k+eWJj+8bOfP4JBM5sJe59M4TXqoIHZoRypEcP+6KTxWejWm0x4BmyxNquAzT
 GWMYstGB8s0IEFiPZz+85fv6HRmFHzy8T2ZxbrCHdjHonzUnUXU2jUKlCJigPNDXOfx1
 wMZg==
X-Gm-Message-State: AOAM533FjWdBTTbwTM6PwpIRhTG85I16UVWXv7hBmujBAkGDpwpkpTw4
 yvNCxhTP10wdxq1t0JsYDpI=
X-Google-Smtp-Source: ABdhPJxl8p5Wcex+s32vmZcMW1o6ebyMwVqDFXF3XQIf0uhiR4rwIEi+ydZLF9uEvyRuKqqYe8ZGrg==
X-Received: by 2002:a63:2fc2:: with SMTP id v185mr5533933pgv.71.1626703217936; 
 Mon, 19 Jul 2021 07:00:17 -0700 (PDT)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id n22sm19768231pff.57.2021.07.19.07.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 07:00:17 -0700 (PDT)
Subject: Re: [PATCH v4 1/1] riscv: __asm_copy_to-from_user: Optimize unaligned
 memory access and pipeline stall
To: Guenter Roeck <linux@roeck-us.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <a7a801d2-13d2-7b5b-66a5-98e7c95b00cc@gmail.com>
 <5e1b5d90-5a1e-5e9f-7b92-6c53b8589c2a@gmail.com>
 <cd14a8b0-0a27-77a8-6dc2-3268f9f09922@roeck-us.net>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <e1bb4768-5517-8ef3-eaf3-bbfc103fa918@gmail.com>
Date: Mon, 19 Jul 2021 23:00:13 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <cd14a8b0-0a27-77a8-6dc2-3268f9f09922@roeck-us.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_070019_186387_D81A14FF 
X-CRM114-Status: GOOD (  19.28  )
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

Ck9uIDcvMTkvMjAyMSAxMDo1MSBQTSwgR3VlbnRlciBSb2VjayB3cm90ZToKPiBIaSwKPiAKPiBP
biA3LzE5LzIxIDU6NTMgQU0sIEFraXJhIFRzdWthbW90byB3cm90ZToKPj4KPj4gVGhpcyBwYXRj
aCB3aWxsIHJlZHVjZSBjcHUgdXNhZ2UgZHJhbWF0aWNhbGx5IGluIGtlcm5lbCBzcGFjZSBlc3Bl
Y2lhbGx5Cj4+IGZvciBhcHBsaWNhdGlvbiB3aGljaCB1c2Ugc3lzLWNhbGwgd2l0aCBsYXJnZSBi
dWZmZXIgc2l6ZSwgc3VjaCBhcwo+PiBuZXR3b3JrIGFwcGxpY2F0aW9ucy4gVGhlIG1haW4gcmVh
c29uIGJlaGluZCB0aGlzIGlzIHRoYXQgZXZlcnkKPj4gdW5hbGlnbmVkIG1lbW9yeSBhY2Nlc3Mg
d2lsbCByYWlzZSBleGNlcHRpb25zIGFuZCBzd2l0Y2ggYmV0d2VlbiBzLW1vZGUKPj4gYW5kIG0t
bW9kZSBjYXVzaW5nIGxhcmdlIG92ZXJoZWFkLgo+Pgo+IAo+IEkgaGFkIHRvIHJldmVydCB0aGUg
b3JpZ2luYWwgcGF0Y2ggZnJvbSB0aGUgbWFpbmxpbmUga2VybmVsIHByaW9yIHRvIGFwcGx5aW5n
Cj4gdGhpcyBwYXRjaC4gT2J2aW91c2x5IHRoYXQgbWVhbnMgdGhhdCB0aGVyZSBtYXkgYmUgb3Ro
ZXIgY2hhbmdlcyBhZmZlY3RpbmcgdGhlCj4gb3V0Y29tZS4KPiAKPiByaXNjdjY0IGltYWdlcyB3
b3JrLCBidXQgcmlzY3YzMiBpbWFnZXMgc3RpbGwgZmFpbCB3aXRoIHRoaXMgcGF0Y2ggYXBwbGll
ZC4KPiBUaGUgZXJyb3IgaXMgYSBiaXQgZGlmZmVyZW50IHRoYW4gYmVmb3JlLCB0aG91Z2guCj4g
Cj4gLi4uCj4gW8KgwqAgMTEuODk5OTc5XSBSdW4gL3NiaW4vaW5pdCBhcyBpbml0IHByb2Nlc3MK
PiBbwqDCoCAxMi4xNTI2NjZdIHJhbmRvbTogZmFzdCBpbml0IGRvbmUKPiBtb3VuOiBhcHBsZXQg
bm90IGZvdW5kCj4gIu+/ve+/ve+/ve+/ve+/vVbvv710OiBhcHBsZXQgbm90IGZvdW5kCj4gL2Jp
77+977+977+977+977+9Vu+/vUYtOiBhcHBsZXQgbm90IGZvdW5kCj4gbW91bjogYXBwbGV0IG5v
dCBmb3VuZAo+IHN3YW9uOiBhcHBsZXQgbm90IGZvdW5kCj4gaG9zdG5hbWUtRjogYXBwbGV0IG5v
dCBmb3VuZAo+IAo+IEFmdGVyIHRoaXMsIHRoZSBpbWFnZSBoYW5ncy4KPiAKPiBGb3IgY29tcGFy
aXNvbiwgdGhlIG1haW5saW5lIGtlcm5lbCAodjUuMTQtcmMyKSBmYWlscyBhcyBmb2xsb3dzLgo+
IAo+IFvCoMKgIDEwLjc4ODEwNV0gUnVuIC9zYmluL2luaXQgYXMgaW5pdCBwcm9jZXNzCj4gU3Rh
cnRpbmcgc3lzbG9nZDogT0sKPiBTdGFydGluZyBrbG9nZDogT0sKPiAvZXRjL2luaXQuZC9TMDJz
eXNjdGw6IGxpbmUgNjg6IHN5bnRheCBlcnJvcjogRU9GIGluIGJhY2txdW90ZSBzdWJzdGl0dXRp
b24KPiAvZXRjL2luaXQuZC9TMjB1cmFuZG9tOiBsaW5lIDE6IHN5bnRheCBlcnJvcjogdW50ZXJt
aW5hdGVkIHF1b3RlZCBzdHJpbmcKPiBTdGFydGluZyBuZXR3b3JrOiAvYmluL3NoOiBzeW50YXgg
ZXJyb3I6IHVudGVybWluYXRlZCBxdW90ZWQgc3RyaW5nCj4gc2VkOiB1bm1hdGNoZWQgJy8nCj4g
L2Jpbi9zaDogc3ludGF4IGVycm9yOiB1bnRlcm1pbmF0ZWQgcXVvdGVkIHN0cmluZwo+IEZBSUwK
PiAvZXRjL2luaXQuZC9TNTVydW50ZXN0OiBsaW5lIDQ4OiBzeW50YXggZXJyb3I6IEVPRiBpbiBi
YWNrcXVvdGUgc3Vic3RpdHV0aW9uCj4gCj4gSSdsbCBiZSBoYXBweSB0byBwcm92aWRlIGluZm9y
bWF0aW9uIG9uIGhvdyB0byByZXByb2R1Y2UgdGhlIHByb2JsZW0KPiBpZiBuZWVkZWQuIFBsZWFz
ZSBsZXQgbWUga25vdy4KClllcywgSSBkbyB3b3VsZCBsaWtlIHRvIGtub3cgdGhlIHByb2NlZHVy
ZSBvZiBidWlsZCBpbnN0cnVjdGlvbiBvZiB5b3VyIHJ2MzIgaW1hZ2UuClRoZW4gSSB3b3VsZCBy
ZXByb2R1Y2UgdGhlIGVycm9yIGFuZCBsb29rIGludG8gaG93IHRvIGZpeCBpdC4KCkFraXJhCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
