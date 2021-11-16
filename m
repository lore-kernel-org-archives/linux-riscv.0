Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71494C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 10:45:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31E0A60D07
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 10:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31E0A60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dgj+CGWY3226rY430Y1aiZ8cvKAGmdDMQ5ZNMcS6ErA=; b=Fv/dhXF3lfmdRS
	fMxloX0Y7yCKXZVlOEoHYoUhfXnEzScvAjfGOmF2X8rJfkVTZeTQYGhv0g0yi2/4UYwYmWOfFz9KY
	haLJJhJXNV1jUhq4tDH9OwTHWTZuUyPoBRcU0fmzlk1ttgB8K2xundSlkdvswjieol5zLK1aR4kP5
	ddH9BOCw08t8CffVsfM9MhOAV+sHDpHrhJ0lX4NcNs7gNQfHUipk6qPk2qrMmC12+Mq4VagvCfGGO
	X99zZCeTOUpncbnI+WfzoDQMiL/WHY0WwxudRGETP1jfXI8h8I8WgCNGOUqpDuQ+SdUAYn1q+aGBu
	xVoWJu8QU95hsLcNh+Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmvxG-001G90-7s; Tue, 16 Nov 2021 10:44:46 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmvxB-001G7j-Ts
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 10:44:43 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 19F273F4B3
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637059480;
 bh=HNvZ1tf4tqT4mDgVZbm+N3k8Io7A/bebwGQCK1l5BZ0=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=gyTBVK4HV+pxzocafeXUUAb9+gjK46fkRPpXuJBLcFXqZWqvbsacVcPHs5NZ/Vgyj
 VoI9Q9qdsLNh8syUI/AkNz+7h2LVDwb/76HSKo2h0plLiYPHZRCIIhjeVAT+NmFq0M
 18jfuqww32ybMNPID2YbH2UfUOQboBqY+DHNNiOO8yQ9PswcDQ6kRfm+urdp4/qoCy
 V2caxaLsENPfFaRgVqhxs5Nu1egXEf3zhS3WMmyKOY7KMPjN27Oh2bX40cjNZC40om
 fznLhC6JOuA7XKuIbFsmcckYVBL0th9kIxnSoUFLcBF/qJQRfuPVj+CPL47LPuR6Bh
 xBFeKRCWgUHCw==
Received: by mail-lf1-f70.google.com with SMTP id
 bp10-20020a056512158a00b0040376f60e35so8037391lfb.8
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 02:44:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HNvZ1tf4tqT4mDgVZbm+N3k8Io7A/bebwGQCK1l5BZ0=;
 b=VSu/wLEI6hEDAITCSfSI9FsRSYopcOHNgFzUrTSPexkh4oECLHB+d3ESy+afFfuCBc
 CuVElkiLblifTdId2Oim+Obw3wwEaxf3pU27KoNFBaxC4klPXhLXx04aeugLUHNhnSYC
 qg3QKw2MRqlba4BZze441vwjdx0x29RNxOcF+YLdJkJ/7z7qg/tRUAeNvxsqxyfeXidz
 mEyEDK+lVSO2Sx3g04mfdmCKn+/r6Qyu0HDKkOmxd7wIinUIpGHsBnJP43xtM1ugP+eI
 xwDXSQ+3ss7k4Ge9lNoT/uo3JNW/57+6JW81m21ZujjbyBfkAVMxYl3FP9XWx6zpI+pj
 S/Hw==
X-Gm-Message-State: AOAM531FTlf09hV9BCiypjOACoIVkDSdVbYYfGWgQHi5vbytFX8gyF6r
 326avvb2ocT9k6n1+D0vg8znMTDxHELD1cSzK1pd/SZaDc69zhQejIBVhx18a+BE35QNgXW84IA
 9UNqQM4aVl+7FPL2ZeZfaGJppRuKjBEH3jUoSW0TyT6/yxQ==
X-Received: by 2002:a05:651c:1506:: with SMTP id
 e6mr6017424ljf.41.1637059479356; 
 Tue, 16 Nov 2021 02:44:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyD2/brVwmP+fxPjmH64gkeCFja1QsZELxsviHR6oPBbUhLXYbkGo8De6w06v59AluCYYjESw==
X-Received: by 2002:a05:651c:1506:: with SMTP id
 e6mr6017398ljf.41.1637059479149; 
 Tue, 16 Nov 2021 02:44:39 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 e19sm1782137ljn.82.2021.11.16.02.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 02:44:38 -0800 (PST)
Message-ID: <886518b4-de22-2443-286d-8135eeaa2ad1@canonical.com>
Date: Tue, 16 Nov 2021 11:44:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] riscv: dts: sifive unmatched: Expose the FU740 core
 supply regulator.
Content-Language: en-US
To: Vincent Pelletier <plr.vincent@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Yash Shah <yash.shah@sifive.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
References: <f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com>
 <0879c5b0c72b9bf6bf71f880def166f8804f41c7.1637023980.git.plr.vincent@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <0879c5b0c72b9bf6bf71f880def166f8804f41c7.1637023980.git.plr.vincent@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_024442_151875_CF00380A 
X-CRM114-Status: GOOD (  21.27  )
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

T24gMTYvMTEvMjAyMSAwMTo1MiwgVmluY2VudCBQZWxsZXRpZXIgd3JvdGU6Cj4gUHJvdmlkZXMg
bW9uaXRvcmluZyBvZiBjb3JlIHZvbHRhZ2UgYW5kIGN1cnJlbnQ6Cj4gdHBzNTQ0YjIwLWkyYy0w
LTFlCj4gQWRhcHRlcjogaTJjLW9jb3Jlcwo+IHZvdXQxOiAgICAgICA5MDYuMDAgbVYKPiB0ZW1w
MTogICAgICAgIC00MC4wwrBDICAoaGlnaCA9ICsxMjUuMMKwQywgY3JpdCA9ICsxNTAuMMKwQykK
PiBpb3V0MTogICAgICAgICA1LjA2IEEgIChtYXggPSArMjAuMDAgQSwgY3JpdCBtYXggPSArMjYu
MDAgQSkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFBlbGxldGllciA8cGxyLnZpbmNlbnRA
Z21haWwuY29tPgo+IAo+IC0tCj4gTm90ZSBmb3IgcmV2aWV3OiB0aGlzIHBhdGNoIGhhcyBvbmUg
d2FybmluZyBmcm9tIGNoZWNrcGF0Y2gucGw6Cj4gICBXQVJOSU5HOiBEVCBjb21wYXRpYmxlIHN0
cmluZyAidHBzNTQ0YjIwIiBhcHBlYXJzIHVuLWRvY3VtZW50ZWQgLS0gY2hlY2sgLi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvCj4gICAjMzI6IEZJTEU6IGFyY2gvcmlzY3YvYm9v
dC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQtYTAwLmR0czo1NToKPiAgICsgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gInRwczU0NGIyMCI7Cj4gVGhpcyBjaGlwIGlzIGhhbmRsZWQgYnkg
dGhlIGV4aXN0aW5nIHBtYnVzIG1vZHVsZSwgYW5kIHRoZXJlIGlzIGluZGVlZCBubwo+IG1hdGNo
aW5nIGVudHJ5IGluIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi9wbWJ1
cy4gSSBhbSBub3QKPiBlc3BlY2lhbGx5IGtub3dsZWRnZWFibGUgYWJvdXQgdGhpcyBjaGlwLCBJ
IG9ubHkga25vdyBpdCBpcyB1c2VkIGJ5IHRoaXMKPiBib2FyZCwgc28gSSBhbSBub3Qgc3VyZSBJ
IGNhbiBkbyB0aGUgYmVzdCBqb2IgaW4gcHV0dGluZyBzdWNoIGEgZmlsZQo+IHRvZ2V0aGVyLgo+
IElmIG5lZWRlZCBJIGNhbiBnaXQgaXQgYSB0cnkuCgpJdCdzIG5vdCByZXF1aXJlZC4gSSBjYW4g
dHJ5IGFkZGluZyBpdC4KCj4gLS0tCj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2
ZS11bm1hdGNoZWQtYTAwLmR0cyB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZp
dmUtdW5tYXRjaGVkLWEwMC5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUt
dW5tYXRjaGVkLWEwMC5kdHMKPiBpbmRleCAyNzAzNjBiMjU4YjcuLmUzMjc4MzFkMGQ0OCAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEw
MC5kdHMKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVk
LWEwMC5kdHMKPiBAQCAtNTEsNiArNTEsMTEgQEAgJnVhcnQxIHsKPiAgJmkyYzAgewo+ICAJc3Rh
dHVzID0gIm9rYXkiOwo+ICAKPiArCXRwczU0NGIyMEAxZSB7CgpOb2RlIG5hbWUgc2hvdWxkIGJl
IGEgZ2VuZXJpYyBjbGFzcyBvZiBhIGRldmljZS4gVGhpcyBpcyBhIERDLURDCmNvbnZlcnRlciwg
c28gSSBzdXBwb3NlIHdlIHNob3VsZCBuYW1lIGl0ICJyZWd1bGF0b3IiPwoKPiArCQljb21wYXRp
YmxlID0gInRwczU0NGIyMCI7Cj4gKwkJcmVnID0gPDB4MWU+Owo+ICsJfTsKPiArCj4gIAl0ZW1w
ZXJhdHVyZS1zZW5zb3JANGMgewo+ICAJCWNvbXBhdGlibGUgPSAidGksdG1wNDUxIjsKPiAgCQly
ZWcgPSA8MHg0Yz47Cj4gCgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
