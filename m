Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA708C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 11:05:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 976F263225
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 11:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 976F263225
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2lFKCq4LCvVi0Td3Xppjtnhe5N5xmyMSyZ+OEcxYlY=; b=0N74F/3QHgBpyJ
	8/oyPj6KhJGlodS8LTdAMzaGmdr4crfXrBLidBudneBIhSVtJQgf1gol7+fqajj6+aMnqCX82WxM8
	utovVXLgt4DFdhICG94sLWplF8/40WcXWAy8uCARGSXwj8Fl6RUsGmTU977tx7OtT0Yf6Vjsv1SfE
	AlZoIs2+ojof4GCqNx7eqL+FWVlfMcCe18cnB/PMU89eqaWStQHNtc2xuvLUhF4S9Edemkunxdr9J
	DFmQYu+UAcKCZ/sRuOFAauGxb4FBQvwz6uFyH8yPSCAhRtvstCNnQDYbHZUfjK1bP/U1KcI08UtUz
	bCzzuIeSr77HxndWfYgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmwHW-001KKh-SL; Tue, 16 Nov 2021 11:05:42 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmwHT-001KJM-HL
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 11:05:40 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4C5F64081B
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 11:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637060735;
 bh=Z3pn3GdeY94Crx51QDkqArGQtoPgeuK++dovgb7tusc=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=BULQGQbpKlKw9yaPXH9w1nBU1khRAR4qQgp41BZWj5i8+Oh92BXCC/S14lbkyOvvh
 LbjXSNS3FxvomYz72j7FYVBzNUD5nZuVdppM6O92/MJvl7qaXf+8jgunEl66D/5QrY
 W+jWOmQc7ss00+tH5e8c+qimCETtywAFosAdVSewLl6Lqu2ZSX6+wrU3KuRPYwCwWc
 I99y+P6feYlQWEX0zk77XTZJwQKuGT0+G7aYNb+QyiDOAsNkxO2I47WnSbunrurdeU
 PEafw51lV1waGgZC8D6oWfdBNm1HV66RzmBrjMvbf4X/4MrKZZE6tf4iUcfcNeYZXV
 SyziWmQrLFsYg==
Received: by mail-lf1-f69.google.com with SMTP id
 s18-20020ac25c52000000b004016bab6a12so8051075lfp.21
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 03:05:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z3pn3GdeY94Crx51QDkqArGQtoPgeuK++dovgb7tusc=;
 b=rbOlp/HB80K/G3QMJs6cPeNDh0bNDK9mVDPvKbqGVs0Tog/hVpxkQ3JgNCROW6H7/a
 EWMBYgOI1Hy5/OCGk/Gd/9k1MAGfNdzYeorh+IoTiV1N4P3zP0sBzKtJpSCgQZxBwpNh
 EGNitDGO0+3Wvb1SamHv+nYRaHVDFb7LOBgi+QyloovjX17KEPUZgBLC8M3e6nGnlBbV
 nqjPYiSQtfNRIZGsEvfZMNM/bhrqdIiijmXw8Vs1rYgK+Y4rhwLHY06JUCPSd8h9XXyC
 hgBhjmAM+4FyCsHHBAR2Wu3NJ4384ksIWNGNjzSowuwkNksN3PvSrdrMAKM11xwza5Be
 xlXA==
X-Gm-Message-State: AOAM533k8ZmPtdyeRnqNxf+ggLg2VjwyKrKlyyWFpcfzqpRY56VxaGF0
 4eLVqXr2w+9bc1jhsErGwu7DYHQykUNqzzyPMzpT0t+d/oxLlmpqewKJMQ4lMYEb6ubKhfxn2bl
 91waTRnzDw0JAuOQRLGaj5CriG5Hkj7MthKUNcEKFdseGzg==
X-Received: by 2002:a2e:a726:: with SMTP id s38mr4983306lje.415.1637060734287; 
 Tue, 16 Nov 2021 03:05:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGsVBgU4j2SaQSu3RItSe0Dm79nyIMrOE90s4v9rVKeB/zfelrLbFZad1bqrUOnXEdWDNpVg==
X-Received: by 2002:a2e:a726:: with SMTP id s38mr4983289lje.415.1637060734138; 
 Tue, 16 Nov 2021 03:05:34 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 bt11sm1725283lfb.208.2021.11.16.03.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 03:05:33 -0800 (PST)
Message-ID: <ce1618f9-3b56-8670-387c-bca6181089b1@canonical.com>
Date: Tue, 16 Nov 2021 12:05:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] riscv: dts: sifive unmatched: Name gpio lines.
Content-Language: en-US
To: Vincent Pelletier <plr.vincent@gmail.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
References: <f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com>
 <11612716.TMCrJ2abzX@diego> <20211116101713.77a0df69@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211116101713.77a0df69@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_030539_743301_783FE8CB 
X-CRM114-Status: GOOD (  14.95  )
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

T24gMTYvMTEvMjAyMSAxMToxNywgVmluY2VudCBQZWxsZXRpZXIgd3JvdGU6Cj4gSGVsbG8sCj4g
Cj4gT24gVHVlLCAxNiBOb3YgMjAyMSAxMDozOTowNCArMDEwMCwgSGVpa28gU3TDvGJuZXIgPGhl
aWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4+IEhpIFZpbmNlbnQsCj4+Cj4+IEFtIERpZW5zdGFnLCAx
Ni4gTm92ZW1iZXIgMjAyMSwgMDE6NTI6NTYgQ0VUIHNjaHJpZWIgVmluY2VudCBQZWxsZXRpZXI6
Cj4+PiBGb2xsb3cgdGhlIHBpbiBkZXNjcmlwdGlvbnMgZ2l2ZW4gaW4gdGhlIHZlcnNpb24gMyBv
ZiB0aGUgYm9hcmQgc2NoZW1hdGljcy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFBl
bGxldGllciA8cGxyLnZpbmNlbnRAZ21haWwuY29tPiAgCj4+Cj4+IHdoZW4gc2VuZGluZyBhIHBh
dGNoIHNlcmllcyB3aXRoICJnaXQgZm9ybWF0LXBhdGNoIC02IiBhbmQgZnJpZW5kcyB3aWxsCj4+
IGF1dG9tY2F0aWNhbGx5IGdlbmVyYXRlIHgveSBhZGRpdGlvbnMgbGlrZSAiW1BBVENIIDEvNl0i
IGFuZCBzbyBvbi4KPj4KPj4gUGxlYXNlIHRyeSB0byBrZWVwIHRoZW0gYXJvdW5kIHdoZW4gc2Vu
ZGluZywgYXMgYXV0b21hdGVkIHRvb2xzIGZvciBwYXRjaAo+PiBoYW5kbGluZyBsaWtlICJiNCIs
IHN0dW1ibGUgd2hlbiB0aGV5IGVuY291bnRlciBhIHBhdGNoIHNlcmllcyB3aXRob3V0IHRoZW0u
Cj4gCj4gQWN0dWFsbHkgbXkgaW50ZW50IHdhcyB0byBub3QgbWFrZSB0aGlzIGEgc2VyaWVzLCBh
cyBpbiBteSB1bmRlcnN0YW5kaW5nCj4gaW5kZXBlbmRlbnQgcGF0Y2hlcyBzaG91bGQvbWF5IGJl
IHN1Ym1pdHRlZCBzZXBhcmF0ZWx5IGZyb20gZWFjaCBvdGhlci4KPiBUaGV5IGp1c3QgaGFwcGVu
IHRvIGJlIHN0YWNrZWQsIGFuZCBpbiB0aGlzIG9yZGVyLCBpbiBteSB3b3JraW5nIGNvcHksCj4g
YnV0IHNob3VsZCBub3QgZnVuY3Rpb25hbGx5IGhhdmUgYW55IGRlcGVuZGVuY3kgb24gb25lIGFu
b3RoZXIgKEkKPiBiZWxpZXZlIHRoZXkgc2hvdWxkIGV2ZW4gYXBwbHkgY2xlYW5seSBpbiBhbnkg
b3JkZXIpLgo+IAoKVGhpcyBzaG91bGQgYmUgYSBzZXJpZXMgYmVjYXVzZSB0aGUgcGF0Y2hlcywg
ZXZlbiB0aG91Z2ggaW5kZXBlbmRlbnQsCmFyZSBsb2dpY2FsbHkgY29ubmVjdGVkL2dyb3VwZWQg
YXMgb25lIHdvcmsuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
