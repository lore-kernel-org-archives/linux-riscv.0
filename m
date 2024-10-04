Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17231CF8854
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 18:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NMZw2JGbQfcbfp8bJujhaeATFVu2tnLKF86HUkkGSMg=; b=pa2hw/05uk6fUQ
	rmITsVa/DJD/H2VGGL8FxMEXzT1gXShup3toRV6ljKn5MQB1+UFCSmFlG+dPjO9W1/UvwXnC9e7I5
	TgFYqTsi8bzadA3z5Dh6DVEP4I9QJx9rDPFDQIrgxFZBYqomOXDUr6RtM4fL2iA60t7ZJV75cnubq
	qr2byhtfOFOjpKhqbE5DxmB01/4+9kkYa5zqnbkyAvOTBv0NpU3AscJRed9fA9wvdqaim8N5bnov2
	gps8ck9RfCtrjMyfJQrkRCBysxEgK9lnO4vc7DyiA+GP8sYN16IwCJ9l5MSXutfGxIU/zW1i46XHe
	TZy3nju8qlZDPmkEpe9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swnFU-0000000DkK8-4Aqv;
	Fri, 04 Oct 2024 18:41:57 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swnFR-0000000DkJ1-0IaW
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 18:41:55 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3a34517248dso9401605ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Oct 2024 11:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728067311; x=1728672111; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wwwzeEiJ51opqJhPS5gdsXb8wf45NCbyQcZ446sEan4=;
        b=Q6KQmQtmBNuQ+KwGoj5KLWsmNrtFZ1howtJVUNo0ZMZN7a9avLNUJHkD4qF4hI+FNI
         Yh360d/BKJ1OlxNRC01pNxSEIH6Pc2R0kwuDW8lJvj8YstOd8o+3tRhbu06zd5FQ7Neo
         TgFWb0QB7woSUZxJx0jLZICfja+R6WLxMiWp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728067311; x=1728672111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wwwzeEiJ51opqJhPS5gdsXb8wf45NCbyQcZ446sEan4=;
        b=XzJxU+BMR9uFbfxNqKo7xSfyLkiqVXe3L5ZTtOGDuHsSbj18ujZw+QEZZu4QlGM/hZ
         DKcui6uEiYVTJ6W6xrzrZHLRf1viCux9yUqFrVIAmOn+gOeRH8c9MCJHOkybxNC2N2YV
         cx2faVJ5jbsYf4g2NTgBl3xFKwFCEPWM5wXYEQSI9kt5p8UVTwYioM40toBXHqxK7K06
         PEcetHrhAF9m31r9WGeTV9QVmByT+K8UBfKyrnbwwegq75yb3fA6Z6Q4V1KeAGHoH/FD
         mJswZm6Ct560XDrc8EKHzyS7y896phIwprjtkQuLXeIxLAP5o4PjF5Uisl0tlZwn1irk
         y3LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQzePv8qsRkF/y5ngMldMsvFo8ThGdwFAxJ+SmIcqfrsFgLvKXnQniqg87GEjQsTN6mGCCNroITiP0jQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5TpOUG2BKy/Rd7n8cUE+m0idwHx+eges0qJsPKNqufUQtotG1
	GYmGiSInRNtvPSTf1B0C+cQ0KxWjnK6nw9dH0BG0af307Jft4jhEwZu/sWuo25w=
X-Google-Smtp-Source: AGHT+IH6mnLmqEkMpwU9kQVlZPZu54bW9Eh6OfVXFm/vCfvFb75bqD/YaW5wJrThyLGG3oGPjMxzCQ==
X-Received: by 2002:a05:6e02:190e:b0:3a0:8eb3:5160 with SMTP id e9e14a558f8ab-3a3759a102dmr37743035ab.11.1728067311627;
        Fri, 04 Oct 2024 11:41:51 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4db6eb868e3sm84295173.75.2024.10.04.11.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 11:41:51 -0700 (PDT)
Message-ID: <67224962-4ea4-4d78-923f-2c520488a090@linuxfoundation.org>
Date: Fri, 4 Oct 2024 12:41:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: sched_ext: Add sched_ext as proper selftest
 target
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 Anders Roxell <anders.roxell@linaro.org>
References: <20241004094247.795385-1-bjorn@kernel.org>
 <60dd0240-8e45-4958-acf2-7eeee917785b@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <60dd0240-8e45-4958-acf2-7eeee917785b@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_114153_142208_3D96AAE7 
X-CRM114-Status: GOOD (  13.27  )
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

T24gMTAvNC8yNCAxMTo0NiwgU2h1YWggS2hhbiB3cm90ZToKPiBPbiAxMC80LzI0IDAzOjQyLCBC
asO2cm4gVMO2cGVsIHdyb3RlOgo+PiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2lu
Yy5jb20+Cj4+Cj4+IFRoZSBzY2hlZF9leHQgc2VsZnRlc3RzIGlzIG1pc3NpbmcgcHJvcGVyIGNy
b3NzLWNvbXBpbGF0aW9uIHN1cHBvcnQsIGEKPj4gcHJvcGVyIHRhcmdldCBlbnRyeSwgYW5kIG91
dC1vZi10cmVlIGJ1aWxkIHN1cHBvcnQuCj4+Cj4+IFdoZW4gYnVpbGRpbmcgdGhlIGtzZWxmdGVz
dCBzdWl0ZSwgZS5nLjoKPj4KPj4gwqDCoCBtYWtlIEFSQ0g9cmlzY3YgQ1JPU1NfQ09NUElMRT1y
aXNjdjY0LWxpbnV4LWdudS0gXAo+PiDCoMKgwqDCoCBTS0lQX1RBUkdFVFM9IiIgTz0vb3V0cHV0
L2ZvbyAtQyB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cyBpbnN0YWxsCj4+Cj4+IFRoZSBleHBlY3Rh
dGlvbiBpcyB0aGF0IHRoZSBzY2hlZF9leHQgaXMgaW5jbHVkZWQsIGNyb3NzLWJ1aWx0LCBhbmQK
Pj4gcGxhY2VkIGludG8gL291dHB1dC9mb28uCj4+Cj4+IEFkZCBDUk9TU19DT01QSUxFLCBPVVRQ
VVQsIGFuZCBUQVJHRVRTIHN1cHBvcnQgdG8gdGhlIHNjaGVkX2V4dAo+PiBzZWxmdGVzdC4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+PiAt
LS0KPj4gwqAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgMSArCj4+IMKgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3NjaGVkX2V4dC9NYWtl
ZmlsZSB8IDU5ICsrKysrKysrKysrKysrKy0tLS0tLS0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA0
MSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKPj4KPiAKPiBUaGFuayB5b3UgZm9yIHRo
ZSBmaW5kLiBJdCBhcHBlYXJzICpzY2hlZCogaXMgYWxzbyBtaXNzaW5nCj4gZnJvbSB0aGUgZGVm
YXVsdCBUQVJHRVRTIGluIHNlbGZ0ZXN0cy9NYWtlZmlsZQo+IAo+IFRoaXMgY2hhbmdlIGxvb2tz
IGdvb2QgdG8gbWUuCj4gCj4gUmV2aWV3ZWQtYnk6IFNodWFoIEtoYW4gPHNraGFuQGxpbnV4Zm91
bmRhdGlvbi5vcmc+Cj4gCj4gVGVqdW4sIERvIGxldCBtZSBrbm93IGlmIHlvdSBsaWtlIG1lIHRv
IHRha2UgdGhpcyB0aHJvdWdoIGtzZWxmdGVzdCB0cmVlLgo+IAoKUGxlYXNlIGRvbid0IHRha2Ug
dGhpcyBwYXRjaCBhdCB0aGUgbW9tZW50LgoKQWRkaW5nIE1hcmsuCgpBZnRlciBjYXRjaGluZyB1
cCB3aXRoIG15IEluYm94IC0gdGhpcyBpcyBhIG5vIGZvciBtZS4gVGhpcyB0ZXN0CmRlcGVuZHMg
b24gYnBmIGFuZCB3aWxsIGZhaWwgaW4gQ0lzIHRoYXQgZG9uJ3QgaGF2ZSB0aGUgc3VwcG9ydC4K
CldlIGFyZSBkaXNjdXNzaW5nIHRoZSBpc3N1ZSBoZXJlIGluIHRoaXMgdGhyZWFkLgoKaHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWtzZWxmdGVzdC9wYXRjaC8yMDI0
MTAwNDA5NTM0OC43OTcwMjAtMS1iam9ybkBrZXJuZWwub3JnLwoKdGhhbmtzLAotLSBTaHVhaAoK
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
