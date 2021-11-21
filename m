Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D723FC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Nov 2021 17:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JioqIaKRYPCO9KuthdgvvW4jhWfTaSTeWG0oNREO5P4=; b=eDjnLA6HKxBAOI
	o/2pzJLcw4w7XwqomPBOInLDLYFWeixvezS8UCRYslb5DfnJW9ZP9+lODCxOp2Vrt/YlSoOaoTCn7
	961zQ81qfOOk6SdJkzQ9cn66nAYAxAZjXBQ8tUGdSbJAvG9SPbT8T/P901pdcG69ITJ2OrVSbyCGI
	4OsnNRNQl/tOEbhs39sOibP7iOUPdGbMa3FqYrzHueZCnRTYnW8dJESSbIvFCFrfG8ELskGbPFPPK
	Qi5VedUf4y/P41gkZywgooG8fFo53QtPZudF2U6MPSMwu+BqLLZqyPYAzN0++gdTY+uLh5wLSBGfb
	BEjdAHtLRNieVbRyCwFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moqZd-00E37X-Ko; Sun, 21 Nov 2021 17:24:17 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moqZa-00E36T-Rz
 for linux-riscv@lists.infradead.org; Sun, 21 Nov 2021 17:24:16 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0A7AC3F1B0
 for <linux-riscv@lists.infradead.org>; Sun, 21 Nov 2021 17:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637515452;
 bh=C44TFo8JxPdM2eUinnKvaXNLXVNdYVKAzbpzrRKKHKk=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=HJBXJGOYH42swqS8g/mg3NpapHt+iltD2TouSRbfbMDPUC++JZT6VEkGLdr7NDUkl
 VDRZM1oA19uQoyx/Mu0GOWfGSdJaLvpwVmEJzdp6yodNQXWH9LO7b3fqHEaAjknfSj
 r4MlUXzIO85jlyjaZ/45ujGbdYWanNS9VHzBqdhn2eHsYxMGeLmOg7Adsih8Z4WKIE
 KYQGVXuyYFzvher9qkSDX6lpBrZBnr3EA1cUQSVSJtQzstFTc1Dr0q0oIMnciv9X/6
 /Vy1R3fa0Bmen5T8xX0xhjSzfcnYn+pAIm5QJ60ZKGrlGlhbEFW6DQpqrZFp3ybp0F
 n3D9GPSwMu2wg==
Received: by mail-lf1-f71.google.com with SMTP id
 k5-20020a05651210c500b0040934a07fbdso10354689lfg.22
 for <linux-riscv@lists.infradead.org>; Sun, 21 Nov 2021 09:24:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C44TFo8JxPdM2eUinnKvaXNLXVNdYVKAzbpzrRKKHKk=;
 b=GH07WdQ7eQEyybLoPmrab+IHa0TH3F44uoM0kx6djHqNlyfa3RIdZknv2jAU+DR8fX
 QrRG4MPN/abt8R8YRTRtvNSuW2Y2bkZFcnRdgVy8kq7wvQI3rYL3B1232hzI8OPuKtNc
 lxRO6D04f/s7i1XwVOnMSfI2d772S7R6hwaKRXHyfxD+Vz6q1whJnGef8s3JP6ZotVi6
 2z2n8q+tGAhHbrOJGrt6If4m73v2laTw7R88NpzmNp5+5TALS0SfZxH52btJyW3au/hs
 7zBQTnkPJJzmyoHIyRobJevAePUrWxg0WgnvbYApM7ozjvjxclkFA/aAavC0XHkTkcLM
 R8IA==
X-Gm-Message-State: AOAM532led9ubrN6BHs5e/dA1vFiA6K++7ncXWz7ujaoATu7zEGFUo+O
 3+hs2yYnxcxE12G1Bno2BNFOPZab88yFxKV0Ezi/BgauX7TowbVE603pdkI1Mpv/hZa7OL4wYc/
 yT0EIw0E6V5KO0Bj99deVSX/KS+CobK4O1ILpIYS63AmMoA==
X-Received: by 2002:a05:6512:150c:: with SMTP id
 bq12mr47862935lfb.628.1637515451553; 
 Sun, 21 Nov 2021 09:24:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxA3eYwToqKzDYJiKtG9lz9teUUb/nMfDtS5bw4e8HgOIZIKfqUi4kB+gaSTJrYMCLvpv+HRg==
X-Received: by 2002:a05:6512:150c:: with SMTP id
 bq12mr47862915lfb.628.1637515451408; 
 Sun, 21 Nov 2021 09:24:11 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 o22sm699541lfu.274.2021.11.21.09.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Nov 2021 09:24:10 -0800 (PST)
Message-ID: <d1bbf5a0-7120-4991-0bb6-7094e238c2a3@canonical.com>
Date: Sun, 21 Nov 2021 18:24:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 4/6] riscv: dts: sifive unmatched: Expose the FU740
 core supply regulator
Content-Language: en-US
To: Vincent Pelletier <plr.vincent@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
References: <378c64fb868b595430b0068a9af10fdbeceb8e12.1637362542.git.plr.vincent@gmail.com>
 <5ab111e71e88d545d7f03233f10b6d84ef3d6c21.1637362542.git.plr.vincent@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <5ab111e71e88d545d7f03233f10b6d84ef3d6c21.1637362542.git.plr.vincent@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_092415_061755_D5AA9236 
X-CRM114-Status: GOOD (  11.33  )
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

T24gMTkvMTEvMjAyMSAyMzo1NSwgVmluY2VudCBQZWxsZXRpZXIgd3JvdGU6Cj4gUHJvdmlkZXMg
bW9uaXRvcmluZyBvZiBjb3JlIHZvbHRhZ2UgYW5kIGN1cnJlbnQ6Cj4gdHBzNTQ0YjIwLWkyYy0w
LTFlCj4gQWRhcHRlcjogaTJjLW9jb3Jlcwo+IHZvdXQxOiAgICAgICA5MDYuMDAgbVYKPiB0ZW1w
MTogICAgICAgIC00MC4wwrBDICAoaGlnaCA9ICsxMjUuMMKwQywgY3JpdCA9ICsxNTAuMMKwQykK
PiBpb3V0MTogICAgICAgICA1LjA2IEEgIChtYXggPSArMjAuMDAgQSwgY3JpdCBtYXggPSArMjYu
MDAgQSkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFBlbGxldGllciA8cGxyLnZpbmNlbnRA
Z21haWwuY29tPgo+IAo+IC0tLQo+IE5vdGU6IGNoZWNrcGF0Y2gucGwgY29tcGxhaW5zIGFib3V0
IHVuZG9jdW1lbnRlZCBkZXZpY2V0cmVlIGJpbmRpbmcsCj4gd2hpY2ggaXMgZml4ZWQgYnk6Cj4g
ICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1kZXZpY2V0cmVlLzIwMjExMTE2MTEwMjA3
LjY4NDk0LTEta3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tL1QvI3UKPiAKPiBDaGFu
Z2VzIHNpbmNlIHYyOgo+IC0gRml4IGVuZC1vZi1jb21taXQtbWVzc2FnZSBzZXBhcmF0b3Igc28g
Y2hhbmdlIGxpc3RzIGRvIG5vdCBlbmQgdXAgaW4gdGhlbS4KPiBDaGFuZ2VzIHNpbmNlIHYxOgo+
IC0gQWRkZWQgbWlzc2luZyAidGksIiBwcmVmaXggaW4gY29tcGF0aWJsZSBzdHJpbmcuCj4gLSBS
ZW1vdmUgdHJhaWxpbmcgIi4iIG9uIHN1YmplY3QgbGluZS4KPiAtIFJlbmFtZSB0cmVlIG5vZGUu
Cj4gLS0tCj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQtYTAw
LmR0cyB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+IAoKClJl
dmlld2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNhbm9u
aWNhbC5jb20+CgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
