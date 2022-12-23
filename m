Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4865C3DA79
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 19:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hpvFv2PgwgGYpvSlAYj+rg3p7hSXUOU+q5/hdV2PPpg=; b=DjaSfj09JBU3LX
	4qE/50hkdRWezta9QJ2DHIrco1mg5ggaWkj50GBrziKB92QuBjB3iv1KXY3nveUop/ZY3h/krh2UD
	cWjjuQKdZtQ4XEUSV+Ed9BvdU7baIvXgs9Vc8xICnxw3wI4ul3HZ7UhFu7T98LQFsJ8uowpVyXyrf
	kTfuVR82/I6bfYw+J+dv6nLfszafsC1DuEi/2cczK8uTbJ+BDXWyMWshxma9U3tG1kKomOEFUwhA6
	b+XabawFrCWDi6i8z91InaPam38SCGdwQlgxfYPKT1xeLjcTH4joo3KAM28TAo8y5FGy3UrrimsRA
	01EtWTkvGADPHw0P1CwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8nwW-00BeaV-Ln; Fri, 23 Dec 2022 19:42:56 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8nwS-00BeVp-NT
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 19:42:54 +0000
Received: by mail-pj1-x102b.google.com with SMTP id o2so256027pjh.4
        for <linux-riscv@lists.infradead.org>; Fri, 23 Dec 2022 11:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GMGcXWg/9VSqvsLgeD+24GVNZfVQVo5EdFEoV4EOZQU=;
        b=iE9/8BXbfBdMg6SOF31aFBhvC1wxPhvJW/GKwALYr7byIwbUzEQ1k3EhX6iOJ13oKZ
         JdOsK5Hxg8cHxN6fwr7qJnsyAPmo67YQ7VjaLGsijPJsdBoJaB0cHR4zC5WTNrp0DU4p
         Gso1Uj/YeTuc+wsm4Yj/TpoHNCCkdwSnKEebAlX61Wyqjd/F07hw81HMjdBy2ZHPo2B/
         XYu6IfcyZ1zjdAKStKQIrFX9ayE+vfQDxjoUsXx8A4FhVVMvCDY7rPbiidi99arTX5B3
         BpgtdZNsF0/4kbZBbmddWEMKtcQHgjjIA/LSmnGUTOznKVwdpoWfzBgerS8m10PLiBMM
         DQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMGcXWg/9VSqvsLgeD+24GVNZfVQVo5EdFEoV4EOZQU=;
        b=nc3s652sK/VbyRJaXNqfZELYOv1FVKxC39cUTRlINzvxJNF5ZUqx6so9e0EjvVjEi/
         sY0gcVD45eyD1elUq/49ZwSfwfCLR4NIRGPVh5OPRk0SCZxMvRt1nbUrXZrWEgzFPcee
         o/CIAm8lB/OXkpgZ/Y+oHI+hVme3kP+QQ5OS6r0uIEX9cbt4R+FUwQ6ZR11lqncCNPL7
         GrYI7dmcnlV9gWy6gb5zxeYSpAKPIOB9gKLvqewA1zy9JLnhD8kMMW9oFlj5trmJ7euv
         qbosq2aFXPRbQ6jS03Fna1uOzS1PnPTgTzoFjcQ2UVwSN0xSqmHxhgMkp0gRHOKZGzGF
         J8lw==
X-Gm-Message-State: AFqh2kpW0lQvKS7bZtULvm4kfztovySZTaNgOU6eGud8qN5oKuwD36Ih
	IA+pM/XAykcKMkQFV9vn/Y1ckA==
X-Google-Smtp-Source: AMrXdXuEwFw+81xptC8OZYxx39EK6393vWlNr4zEycvkzKxOzvNey9po4b6lBzC9T9wpBqKsDomykg==
X-Received: by 2002:a17:902:ee13:b0:189:13df:9d86 with SMTP id z19-20020a170902ee1300b0018913df9d86mr13068324plb.14.1671824568169;
        Fri, 23 Dec 2022 11:42:48 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id w15-20020a1709026f0f00b0018699e6afd8sm2697085plk.265.2022.12.23.11.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Dec 2022 11:42:47 -0800 (PST)
Message-ID: <3274f2e3-ec6d-98a6-add4-eeb78f003a05@rivosinc.com>
Date: Fri, 23 Dec 2022 11:42:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
Content-Language: en-US
To: Vincent Chen <vincent.chen@sifive.com>
Cc: Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>,
 Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>,
 davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, Andy Chiu <andy.chiu@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>,
 Andrew de los Reyes <adlr@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <1631497278-29829-3-git-send-email-vincent.chen@sifive.com>
 <871r5sd1zq.fsf@oldenburg.str.redhat.com>
 <20210913135247.GL13220@brightrain.aerifal.cx>
 <CABvJ_xjGZ3S0oAkT08x4DToQFdcUH06omk2OTT1EHDZRJ-2wKg@mail.gmail.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com>
 <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com>
 <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com>
 <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <CABvJ_xg--0Gia9Za9endcz5kaqfDugrcdpkg-f1u=2mt7AE2cA@mail.gmail.com>
 <fa18d2a8-92bd-8e01-fce2-d5af9455558e@rivosinc.com>
 <CABvJ_xjXAj+d2hr4yY821+YDYkbJMNppOeG1c6dJWeh4fVwydg@mail.gmail.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <CABvJ_xjXAj+d2hr4yY821+YDYkbJMNppOeG1c6dJWeh4fVwydg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_114253_045073_46B4F1D0 
X-CRM114-Status: GOOD (  12.74  )
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

Ck9uIDEyLzIyLzIyIDE4OjI3LCBWaW5jZW50IENoZW4gd3JvdGU6Cj4gSWYgSSB1bmRlcnN0YW5k
IGNvcnJlY3RseSwgaW4geW91ciBwYXRjaCwgdGhlIGtlcm5lbCB1c2VzIHJ0X3NpZ2ZyYW1lCj4g
dG8gYmFjayB1cCBhbGwgcmVnaXN0ZXIgY29udGV4dHMgaW4gdGhlIHVzZXIgc3BhY2UsIGluY2x1
ZGluZyBSVlYKPiByZWdpc3RlcnMuCgpEaXNjdXNzaW5nIHRoaXMgYWxsIG1vb3QgcG9pbnQgYnV0
IHN0aWxsLi4uCgo+IFRoZXJlZm9yZSwgdGhlIHVzZXIgcHJvZ3JhbSBuZWVkcyB0byByZXNlcnZl
IGVub3VnaCBtZW1vcnkKPiBzcGFjZSBmb3IgdGhlIGtlcm5lbCwgd2hpY2ggZW5vdWdoIHNpemUg
b2YgdGhpcyBtZW1vcnkgc3BhY2UgaXMgdGhlCj4gc2l6ZW9mKHJ0X3NpZ2ZyYW1lKSBwbHVzIHJ2
dl9zY19zaXplLgoKSW4gbXkgcGF0Y2gsIHJ0X3NpZ2ZyYW1lIGhhcyB0aGUgYzk5IGZsZXhpYmxl
IGFycmF5LiBTbyBpdCBkb2Vzbid0IGFkZCAKYW55IGV4dHJhIHNwYWNlIG9uIGl0cyBvd24uClRo
ZSB0b3RhbCBzaXplIGluY3JlYXNlIGlzIHNhbWUgd2hldGhlciB3ZSBhZGQgaXQgdG8ga2VybmVs
IHNpZ2NvbnRleHQgCm9yIHJ0X3NpZ2ZyYW1lLiBBbmQgc2luY2UgZ2xpYmMgc2lnY29udGV4dCBp
cyBub3QgY2hhbmdlZCwgYXBwbGljYXRpb24gCmlzIHVuYXdhcmUgb2YgcnZ2X3NjX3NpemUgaW4g
ZWl0aGVyIGNhc2UuCgo+IEhvd2V2ZXIsIHRoZSBydnZfc2Nfc2l6ZSBpcwo+IHVuZXhwZWN0ZWQg
dG8gZXhpc3RpbmcgUklTQy1WIHByb2dyYW1zLgoKQWdhaW4gbm90IHN1cmUgaG93IGl0IGlzIGRp
ZmZlcmVudCBpbiBib3RoIGNhc2VzLgoKPiBUaGVyZWZvcmUsIHNvbWUgbWVtb3J5IG9mIHRoZQo+
IGV4aXN0aW5nIHByb2dyYW0gbWF5IGJlIGNvcnJ1cHRlZCBieSB0aGUga2VybmVsIHdoZW4gdGhl
IGtlcm5lbCBiYWNrcwo+IHVwIHRoZSBSVlYgcmVnaXN0ZXJzIGNvbnRleHQuCgprZXJuZWwgYnVp
bGRzIHNpZ25hbCBmcmFtZSBvbiB0b3Agb2YgZXhpc3RpbmcgdXNlciBzdGFjay4KCnNldHVwX3J0
X2ZyYW1lCiDCoMKgwqAgZ2V0X3NpZ2ZyYW1lCiDCoMKgwqDCoMKgwqDCoMKgwqAgc3AgPSByZWdz
LT5zcDsKClNvIGl0IGNhbid0IHBvc3NpYmx5IGNvcnJ1cHQgYW55IGV4aXN0aW5nIHVzZXIgc3Rh
Y2sgYXJlYS4gU3VyZSB3aGVuIApleHBhbmRpbmcgdGhlIHN0YWNrIHVzZXIgc3RhY2sgcmxpbWl0
IGV0YyBtYXkgaGl0IHdoZW4gZG9pbmcgcHV0X3VzZXIuIApCdXQgYWdhaW4gdGhhdCBpcyBzYW1l
IGZvciBib3RoIGFwcHJvYWNoZXMuCgpGV0lXIGtlcm5lbCB3aXRoIG15IHBhdGNoIGNhbiBiZSBm
b3VuZCBiZWxvdzogaXQgc3Vydml2ZXMgZnVsbCBnbGliYyAKdGVzdHN1aXRlIHJ1biB3L28gYW55
IHJlZ3Jlc3Npb24gc28gaXQgZGVmaW5pdGVseSB3b3JrcyB3L28gYW55IG9idmlvdXMgCnVzZXIg
bWVtb3J5IGNvcnJ1cHRpb24uCgpnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdmd1cHRhL2xpbnV4LmdpdCAKI3J2di12MTMuMi11c2UtcnRfc2lnZnJhbWUKCi1W
aW5lZXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
