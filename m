Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1E2C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 15:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8qX/aoDOkhYloFf5lKWOeKJs0eXx0Svt6+RFFH6FgbM=; b=KJYK/0VUYFUgi2
	nPUPzfcA2hVW+75K0aG3HvQ5QeZCOZqYkgrSRf6KnQkHUjAC9TTaoebIaSXGuJEiYBTd8NFOdj99+
	j9yWxBhz/qSaJdWd7DrW4fOvNqwY2lVLOtV5BgNvLSRagKx/dv1DBolx89jqMx3RZYLCh/D+9Ozml
	ppL3pbGs2JdWLDdP/Jlyb/QXlqaC1NqqLAx2bKCBvMvJLoscjG36Zo7BwH2qBsa8x/3ZY6XlYdWYy
	z/GLwVg8TzpOuo7UchSIWhclFcPtH7TZwfHhWTa3McMiqvDIdPDZxcDKRcqqmONUXqa3hRRZT3ovj
	G1G49vK95MMkJsm2KfQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPmBy-00G33G-2f; Wed, 08 Feb 2023 15:17:02 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPmBu-00G329-QS
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 15:17:00 +0000
Received: by mail-oi1-x22c.google.com with SMTP id c15so15584116oic.8
        for <linux-riscv@lists.infradead.org>; Wed, 08 Feb 2023 07:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H+RbRXOLUU6+UZO7OoxhjMctOLam4crQMBnQ9AxC4ac=;
        b=IJle+7Lzi186mRM0YgYzOHlQNJfUpw3j7vc7/YKoCXmPu1swuXA5v6qmLL/8/fXa2g
         51p4pRdsrjDXRYGRjXR7uMb5mbqTJ39KYgW4S01FHEhXGq3qsYR7gEwlDsBFisYgD7hd
         sn2n6kcQmji5WfkxAWbDHdXZOudOoef4uNIhagSvu0rY3ZgsTrzSK+2mZzgJ9omt1wHR
         hI/K7MnSoPt6oYFXtd8fFGFY60I029q/OyornHUNw9cIOtv6r1qyXk/xs4SBG1/eUJdB
         N6YQQAl/YJi/FsDApTqNhl2Yc62TW0bTj6gR59INlKMtFhxlC6aiT7vs7RP6q9GuSacS
         NAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H+RbRXOLUU6+UZO7OoxhjMctOLam4crQMBnQ9AxC4ac=;
        b=yvqII/mXt+0ntHRaMHtlj+ufHGqOUoRJa4hdt4DRu8jiQu8mahSnKCJm6Bv0KcwS0k
         TcXRAC7wYTisuPEW8DEJbAd8wJ68Tbs9pso1q0/EABA8g6Y5Nno2rjfnXdRHGUwGOLii
         FxuogqJvezJPElsG8cyP3ofFCnmaBxaqUW9O10ZztwySVR/L22PkrhLqcjBFfuUXbyz7
         2i5vQZTBSJqgfSfZs+gyUClvuxgnnxbT7yNjZS1t48OumYfO40nXJ9XtBqbGc5j8/vJY
         wzSLxLTdglw8eH50VDs30T4kz+O1EdJiEr3090zY/GEyabqV/Bi4wEQgPlpbl8+epD/V
         UzOA==
X-Gm-Message-State: AO0yUKVTz1NcD8sR9xrG3JqtyYGP9FMYjxgaeAbCHMFYmncCt7l13aRR
	Y4IQkHur5lNW/W7k0nJPbkk=
X-Google-Smtp-Source: AK7set+b0jDaR/fYF5qTzuvaY9VOyOaSc96/Pf0oBUGKKFCRgrtJTqb0bfjJBZU7biaoWk9GBvOSQA==
X-Received: by 2002:aca:210a:0:b0:37a:fa7d:972e with SMTP id 10-20020aca210a000000b0037afa7d972emr3461129oiz.41.1675869415900;
        Wed, 08 Feb 2023 07:16:55 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p11-20020a9d744b000000b00684c5211c58sm8134637otk.60.2023.02.08.07.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 07:16:55 -0800 (PST)
Message-ID: <7c375ccf-509a-aea3-62a3-d4f43d6b6c8a@roeck-us.net>
Date: Wed, 8 Feb 2023 07:16:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20230103013145.9570-1-hal.feng@starfivetech.com>
 <20230103013145.9570-3-hal.feng@starfivetech.com>
 <20230103221017.GA217155@roeck-us.net>
 <ddb197c3-9c77-c8c2-1d41-1691de05847e@starfivetech.com>
 <7580df6b-e97f-0036-8f7f-63acde8cd42a@roeck-us.net>
 <629e070a-5138-8754-e86c-3458ae5d7a16@starfivetech.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 2/4] hwmon: (sfctemp) Add StarFive JH71x0 temperature
 sensor
In-Reply-To: <629e070a-5138-8754-e86c-3458ae5d7a16@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_071658_906966_9DA4AE9E 
X-CRM114-Status: GOOD (  36.32  )
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

T24gMi84LzIzIDA0OjQwLCBIYWwgRmVuZyB3cm90ZToKPiBPbiBNb24sIDYgRmViIDIwMjMgMTE6
MjE6MzggLTA4MDAsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6Cj4+IE9uIDIvNi8yMyAwOToxMiwgSGFs
IEZlbmcgd3JvdGU6Cj4+PiBPbiBUdWUsIDMgSmFuIDIwMjMgMTQ6MTA6MTcgLTA4MDAsIEd1ZW50
ZXIgUm9lY2sgd3JvdGU6Cj4+Pj4gT24gVHVlLCBKYW4gMDMsIDIwMjMgYXQgMDk6MzE6NDNBTSAr
MDgwMCwgSGFsIEZlbmcgd3JvdGU6Cj4gWy4uLl0KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aHdtb24vc2ZjdGVtcC5jIGIvZHJpdmVycy9od21vbi9zZmN0ZW1wLmMKPj4+Pj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5lNTY3MTZhZDk1ODcKPj4+Pj4g
LS0tIC9kZXYvbnVsbAo+Pj4+PiArKysgYi9kcml2ZXJzL2h3bW9uL3NmY3RlbXAuYwo+Pj4+PiBA
QCAtMCwwICsxLDM1MCBAQAo+Pj4+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAKPj4+Pj4gKy8qCj4+Pj4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjEgRW1pbCBSZW5uZXIgQmVy
dGhpbmcgPGtlcm5lbEBlc21pbC5kaz4KPj4+Pj4gKyAqIENvcHlyaWdodCAoQykgMjAyMSBTYW1p
biBHdW8gPHNhbWluLmd1b0BzdGFyZml2ZXRlY2guY29tPgo+Pj4+PiArICovCj4+Pj4+ICsjaW5j
bHVkZSA8bGludXgvY2xrLmg+Cj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvY29tcGxldGlvbi5oPgo+
Pj4+PiArI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+Cj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvaHdt
b24uaD4KPj4+Pj4gKyNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KPj4+Pj4gKyNpbmNsdWRl
IDxsaW51eC9pby5oPgo+Pj4+PiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+Pj4+PiArI2lu
Y2x1ZGUgPGxpbnV4L211dGV4Lmg+Cj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvb2YuaD4KPj4+Pj4g
KyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPj4+Pj4gKyNpbmNsdWRlIDxsaW51
eC9yZXNldC5oPgo+Pj4+PiArCj4+Pj4+ICsvKgo+Pj4+PiArICogVGVtcFNlbnNvciByZXNldC4g
VGhlIFJTVE4gY2FuIGJlIGRlLWFzc2VydGVkIG9uY2UgdGhlIGFuYWxvZyBjb3JlIGhhcwo+Pj4+
PiArICogcG93ZXJlZCB1cC4gVHJzdChtaW4gMTAwbnMpCj4+Pj4+ICsgKiAwOnJlc2V0wqAgMTpk
ZS1hc3NlcnQKPj4+Pj4gKyAqLwo+Pj4+PiArI2RlZmluZSBTRkNURU1QX1JTVE7CoMKgwqAgQklU
KDApCj4+Pj4KPj4+PiBNaXNzaW5nIGluY2x1ZGUgb2YgbGludXgvYml0cy5oCj4+Pgo+Pj4gV2ls
bCBhZGQgaXQuIFRoYW5rcy4KPj4+Cj4+Pj4KPj4+Pj4gKwo+Pj4+PiArLyoKPj4+Pj4gKyAqIFRl
bXBTZW5zb3IgYW5hbG9nIGNvcmUgcG93ZXIgZG93bi4gVGhlIGFuYWxvZyBjb3JlIHdpbGwgYmUg
cG93ZXJlZCB1cAo+Pj4+PiArICogVHB1KG1pbiA1MHVzKSBhZnRlciBQRCBpcyBkZS1hc3NlcnRl
ZC4gUlNUTiBzaG91bGQgYmUgaGVsZCBsb3cgdW50aWwgdGhlCj4+Pj4+ICsgKiBhbmFsb2cgY29y
ZSBpcyBwb3dlcmVkIHVwLgo+Pj4+PiArICogMDpwb3dlciB1cMKgIDE6cG93ZXIgZG93bgo+Pj4+
PiArICovCj4+Pj4+ICsjZGVmaW5lIFNGQ1RFTVBfUETCoMKgwqAgQklUKDEpCj4+Pj4+ICsKPj4+
Pj4gKy8qCj4+Pj4+ICsgKiBUZW1wU2Vuc29yIHN0YXJ0IGNvbnZlcnNpb24gZW5hYmxlLgo+Pj4+
PiArICogMDpkaXNhYmxlwqAgMTplbmFibGUKPj4+Pj4gKyAqLwo+Pj4+PiArI2RlZmluZSBTRkNU
RU1QX1JVTsKgwqDCoCBCSVQoMikKPj4+Pj4gKwo+Pj4+PiArLyoKPj4+Pj4gKyAqIFRlbXBTZW5z
b3IgY29udmVyc2lvbiB2YWx1ZSBvdXRwdXQuCj4+Pj4+ICsgKiBUZW1wKEMpPURPVVQqWS80MDk0
IC0gSwo+Pj4+PiArICovCj4+Pj4+ICsjZGVmaW5lIFNGQ1RFTVBfRE9VVF9QT1PCoMKgwqAgMTYK
Pj4+Pj4gKyNkZWZpbmUgU0ZDVEVNUF9ET1VUX01TS8KgwqDCoCBHRU5NQVNLKDI3LCAxNikKPj4+
Pj4gKwo+Pj4+PiArLyogRE9VVCB0byBDZWxjaXVzIGNvbnZlcnNpb24gY29uc3RhbnRzICovCj4+
Pj4+ICsjZGVmaW5lIFNGQ1RFTVBfWTEwMDDCoMKgwqAgMjM3NTAwTAo+Pj4+PiArI2RlZmluZSBT
RkNURU1QX1rCoMKgwqAgNDA5NEwKPj4+Pj4gKyNkZWZpbmUgU0ZDVEVNUF9LMTAwMMKgwqDCoCA4
MTEwMEwKPj4+Pj4gKwo+Pj4+PiArc3RydWN0IHNmY3RlbXAgewo+Pj4+PiArwqDCoMKgIC8qIHNl
cmlhbGl6ZSBhY2Nlc3MgdG8gaGFyZHdhcmUgcmVnaXN0ZXIgYW5kIGVuYWJsZWQgYmVsb3cgKi8K
Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgbXV0ZXggbG9jazsKPj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgY29t
cGxldGlvbiBjb252ZXJzaW9uX2RvbmU7Cj4+Pj4+ICvCoMKgwqAgdm9pZCBfX2lvbWVtICpyZWdz
Owo+Pj4+PiArwqDCoMKgIHN0cnVjdCBjbGsgKmNsa19zZW5zZTsKPj4+Pj4gK8KgwqDCoCBzdHJ1
Y3QgY2xrICpjbGtfYnVzOwo+Pj4+PiArwqDCoMKgIHN0cnVjdCByZXNldF9jb250cm9sICpyc3Rf
c2Vuc2U7Cj4+Pj4+ICvCoMKgwqAgc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdF9idXM7Cj4+Pj4+
ICvCoMKgwqAgYm9vbCBlbmFibGVkOwo+Pj4+PiArfTsKPj4+Pj4gKwo+Pj4+PiArc3RhdGljIGly
cXJldHVybl90IHNmY3RlbXBfaXNyKGludCBpcnEsIHZvaWQgKmRhdGEpCj4+Pj4+ICt7Cj4+Pj4+
ICvCoMKgwqAgc3RydWN0IHNmY3RlbXAgKnNmY3RlbXAgPSBkYXRhOwo+Pj4+PiArCj4+Pj4+ICvC
oMKgwqAgY29tcGxldGUoJnNmY3RlbXAtPmNvbnZlcnNpb25fZG9uZSk7Cj4+Pj4+ICvCoMKgwqAg
cmV0dXJuIElSUV9IQU5ETEVEOwo+Pj4+PiArfQo+Pj4+PiArCj4+Pj4+ICtzdGF0aWMgdm9pZCBz
ZmN0ZW1wX3Bvd2VyX3VwKHN0cnVjdCBzZmN0ZW1wICpzZmN0ZW1wKQo+Pj4+PiArewo+Pj4+PiAr
wqDCoMKgIC8qIG1ha2Ugc3VyZSB3ZSdyZSBwb3dlcmVkIGRvd24gZmlyc3QgKi8KPj4+Pj4gK8Kg
wqDCoCB3cml0ZWwoU0ZDVEVNUF9QRCwgc2ZjdGVtcC0+cmVncyk7Cj4+Pj4+ICvCoMKgwqAgdWRl
bGF5KDEpOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgd3JpdGVsKDAsIHNmY3RlbXAtPnJlZ3MpOwo+
Pj4+PiArwqDCoMKgIC8qIHdhaXQgdF9wdSg1MHVzKSArIHRfcnN0KDEwMG5zKSAqLwo+Pj4+PiAr
wqDCoMKgIHVzbGVlcF9yYW5nZSg2MCwgMjAwKTsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIC8qIGRl
LWFzc2VydCByZXNldCAqLwo+Pj4+PiArwqDCoMKgIHdyaXRlbChTRkNURU1QX1JTVE4sIHNmY3Rl
bXAtPnJlZ3MpOwo+Pj4+PiArwqDCoMKgIHVkZWxheSgxKTsgLyogd2FpdCB0X3N1KDUwMHBzKSAq
Lwo+Pj4+PiArfQo+Pj4+PiArCj4+Pj4+ICtzdGF0aWMgdm9pZCBzZmN0ZW1wX3Bvd2VyX2Rvd24o
c3RydWN0IHNmY3RlbXAgKnNmY3RlbXApCj4+Pj4+ICt7Cj4+Pj4+ICvCoMKgwqAgd3JpdGVsKFNG
Q1RFTVBfUEQsIHNmY3RlbXAtPnJlZ3MpOwo+Pj4+PiArfQo+Pj4+PiArCj4+Pj4+ICtzdGF0aWMg
dm9pZCBzZmN0ZW1wX3J1bl9zaW5nbGUoc3RydWN0IHNmY3RlbXAgKnNmY3RlbXApCj4+Pj4+ICt7
Cj4+Pj4+ICvCoMKgwqAgd3JpdGVsKFNGQ1RFTVBfUlNUTiB8IFNGQ1RFTVBfUlVOLCBzZmN0ZW1w
LT5yZWdzKTsKPj4+Pj4gK8KgwqDCoCB1ZGVsYXkoMSk7Cj4+Pj4+ICvCoMKgwqAgd3JpdGVsKFNG
Q1RFTVBfUlNUTiwgc2ZjdGVtcC0+cmVncyk7Cj4+Pj4KPj4+PiBUaGUgZGF0YXNoZWV0IChvciwg
cmF0aGVyLCBwcm9ncmFtbWluZyBtYW51YWwpIGRvZXMgbm90IGFwcGVhcgo+Pj4+IHRvIGJlIHB1
YmxpYywgc28gSSBoYXZlIHRvIGd1ZXNzIGhlcmUuCj4+Pj4KPj4+PiBUaGUgY29kZSBzdWdnZXN0
cyB0aGF0IHJ1bm5pbmcgYSBzaW5nbGUgY29udmVyc2lvbiBtYXkgYmUgYSBjaG9pY2UsCj4+Pj4g
bm90IGEgcmVxdWlyZW1lbnQuIElmIGl0IGlzIGluZGVlZCBhIGNob2ljZSwgdGhlIHJlYXNvbmlu
ZyBuZWVkcyB0byBiZQo+Pj4+IGV4cGxhaW5lZCBzaW5jZSBpdCBhZGRzIGEgbG90IG9mIGNvbXBs
ZXhpdHkgYW5kIGRlcGVuZGVuY2llcyB0byB0aGUKPj4+PiBkcml2ZXIgKGZvciBleGFtcGxlLCBp
bnRlcnJ1cHQgc3VwcG9ydCBpcyBvbmx5IG1hbmRhdG9yeSBvciBldmVuIG5lZWRlZAo+Pj4+IGR1
ZSB0byB0aGlzIGNob2ljZSkuIEl0IGFsc28gYWRkcyBhIHNpZ25pZmljYW50IGRlbGF5IHRvIHRl
bXBlcmF0dXJlCj4+Pj4gcmVhZCBvcGVyYXRpb25zLCB3aGljaCBtYXkgaGF2ZSBwcmFjdGljYWwg
aW1wYWN0IG9uIHRoZXJtYWwgY29udHJvbAo+Pj4+IHNvZnR3YXJlLgo+Pj4+Cj4+Pj4gSWYgdGhl
IGNoaXAgb25seSBzdXBwb3J0cyBzaW5nbGUgdGVtcGVyYXR1cmUgcmVhZGluZ3MsIHRoYXQgbmVl
ZHMgdG8gYmUKPj4+PiBleHBsYWluZWQgYXMgd2VsbCAoYW5kIHdoeSBTRkNURU1QX1JVTiBoYXMg
dG8gYmUgcmVzZXQgaW4gdGhhdCBjYXNlKS4KPj4+Cj4+PiBUaGUgY2hpcCBzdXBwb3J0cyBjb250
aW51b3VzIGNvbnZlcnNpb24uIFdoZW4geW91IHNldCBTRkNURU1QX1JVTiwgdGhlCj4+PiB0ZW1w
ZXJhdHVyZSByYXcgZGF0YSB3aWxsIGJlIGdlbmVyYXRlZCBhbGwgdGhlIHRpbWUuIEhvd2V2ZXIs
IGl0IHdpbGwKPj4+IGFsc28gZ2VuZXJhdGUgaW50ZXJydXB0cyBhbGwgdGhlIHRpbWUgd2hlbiB0
aGUgY29udmVyc2lvbiBpcyBmaW5pc2hlZCwKPj4+IGJlY2F1c2Ugb2YgdGhlIGhhcmR3YXJlIGxp
bWl0YXRpb24uIFNvIGluIHRoaXMgZHJpdmVyLCB3ZSBqdXN0IHN1cHBvcnQKPj4+IHRoZSBzaW5n
bGUgY29udmVyc2lvbi4KPj4+Cj4+Cj4+IFNvcnJ5LCBJIGRvbid0IGZvbGxvdyB0aGUgbG9naWMu
IFRoZSBpbnRlcnJ1cHQgaXMsIGZvciBhbGwgcHJhY3RpY2FsCj4+IHB1cnBvc2VzLCB1c2VsZXNz
IGJlY2F1c2UgdGhlcmUgYXJlIG5vIGxpbWl0cyBhbmQgZXhjZWVkaW5nIGFueSBzdWNoCj4+IGxp
bWl0cyBpcyB0aGVyZWZvcmUgbm90IHN1cHBvcnRlZC4gVGhlIG9ubHkgcmVhc29uIHRvIGhhdmUg
YW5kIGVuYWJsZQo+PiB0byBpbnRlcnJ1cHQgaXMgYmVjYXVzZSBjb250aW51b3VzIG1vZGUgaXMg
ZGlzYWJsZWQuCj4+Cj4+IFRoZSBjb2RlIGNvdWxkIGJlIHNpbXBsaWZpZWQgYSBsb3QgaWYgaW50
ZXJydXB0IHN1cHBvcnQgd291bGQgYmUKPj4gZHJvcHBlZCBhbmQgY29udGludW91cyBtb2RlIHdv
dWxkIGJlIGVuYWJsZWQuCj4gCj4gSWYgd2UgZW5hYmxlIGNvbnRpbnVvdXMgbW9kZSwgd2hpY2gg
bWVhbnMgU0ZDVEVNUF9SVU4gcmVtYWlucyBhc3NlcnRlZCwKPiB0aGUgY29udmVyc2lvbiBmaW5p
c2hlZCBpbnRlcnJ1cHQgd2lsbCBiZSByYWlzZWQgYWZ0ZXIgZWFjaCBzYW1wbGUKPiB0aW1lICg4
LjE5MiBtcykuIFdpdGhpbiBhIGZldyBtaW51dGVzLCBhIGxvdCBvZiBpbnRlcnJ1cHRzIGFyZSBy
YWlzZWQsCj4gYXMgc2hvd2VkIGJlbG93Lgo+IAo+ICMgY2F0IC9wcm9jL2ludGVycnVwdHMKPiAg
ICAgICAgICAgICBDUFUwICAgICAgIENQVTEgICAgICAgQ1BVMiAgICAgICBDUFUzCj4gICAgMTog
ICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgU2lGaXZlIFBMSUMg
ICAxIEVkZ2UgICAgICBjY2FjaGVfZWNjCj4gICAgMjogICAgICAgICAgMSAgICAgICAgICAwICAg
ICAgICAgIDAgICAgICAgICAgMCAgU2lGaXZlIFBMSUMgICAzIEVkZ2UgICAgICBjY2FjaGVfZWNj
Cj4gICAgMzogICAgICAgICAgMSAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgU2lG
aXZlIFBMSUMgICA0IEVkZ2UgICAgICBjY2FjaGVfZWNjCj4gICAgNDogICAgICAgICAgMCAgICAg
ICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgU2lGaXZlIFBMSUMgICAyIEVkZ2UgICAgICBj
Y2FjaGVfZWNjCj4gICAgNTogICAgICAgMTExNiAgICAgICAxNjcwICAgICAgICA0MTEgICAgICAg
MTQ2NiAgUklTQy1WIElOVEMgICA1IEVkZ2UgICAgICByaXNjdi10aW1lcgo+ICAgIDY6ICAgICAg
MzIwOTMgICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAgIFNpRml2ZSBQTElDICA4MSBF
ZGdlICAgICAgMTIwZTAwMDAudGVtcGVyYXR1cmUtc2Vuc29yCj4gICAxMDogICAgICAgMTIzMyAg
ICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgU2lGaXZlIFBMSUMgIDMyIEVkZ2UgICAg
ICB0dHlTMAo+IElQSTA6ICAgICAgIDExNyAgICAgICAgIDYyICAgICAgICAxMjMgICAgICAgIDEx
NyAgUmVzY2hlZHVsaW5nIGludGVycnVwdHMKPiBJUEkxOiAgICAgICAyNzggICAgICAgIDM1MyAg
ICAgICAgMTA1ICAgICAgICAyNzMgIEZ1bmN0aW9uIGNhbGwgaW50ZXJydXB0cwo+IElQSTI6ICAg
ICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgQ1BVIHN0b3AgaW50ZXJy
dXB0cwo+IElQSTM6ICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAg
Q1BVIHN0b3AgKGZvciBjcmFzaCBkdW1wKSBpbnRlcnJ1cHRzCj4gSVBJNDogICAgICAgICAwICAg
ICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICBJUlEgd29yayBpbnRlcnJ1cHRzCj4gSVBJ
NTogICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICBUaW1lciBicm9h
ZGNhc3QgaW50ZXJydXB0cwo+IAo+IElmIHdlIGVuYWJsZSBjb250aW51b3VzIG1vZGUgYW5kIGRy
b3AgdGhlIGludGVycnVwdCBzdXBwb3J0IGluIHRoZQo+IGRyaXZlciwgdGhlIGtlcm5lbCB3aWxs
IG5vdCBrbm93IHRoZSBpbnRlcnJ1cHRzIGJ1dCBhIGxvdCBvZiBpbnRlcnJ1cHRzCj4gYXJlIHN0
aWxsIHJhaXNlZCBpbiBoYXJkd2FyZS4gQ2FuIHdlIGRvIHN1Y2ggbGlrZSB0aGF0PwoKV2h5IG5v
dCA/IEl0IGp1c3Qgc3RheXMgcmFpc2VkLiBUaGF0IGhhcHBlbnMgYSBsb3QuCgo+IFdpdGhvdXQg
dGhlIGludGVycnVwdCBzdXBwb3J0LCB0aGUgdGVtcGVyYXR1cmUgd2UgcmVhZCBtYXkgYmUgdGhl
IHZhbHVlCj4gZ2VuZXJhdGVkIGluIHRoZSBsYXN0IGN5Y2xlLgoKVGhhdCB3b3VsZCBiZSBoaWdo
bHkgdW51c3VhbCBhbmQgc2hvdWxkIGJlIGRvY3VtZW50ZWQuCgoKPiAKPiBJIHRoaW5rIHRoZSB0
ZW1wZXJhdHVyZSBoYXMgaXRzIHZhbHVlIG9ubHkgd2hlbiB3ZSByZWFkIGl0LCBzbyB3ZSBzdGFy
dAoKIm1heSBiZSIgPyAiSSB0aGluayIgPyBUaGF0IG1lYW5zIHlvdSBkb24ndCBrbm93ID8gTWF5
YmUgdGVzdCBpdCwgb3IgYXNrCnRoZSBjaGlwIGRlc2lnbmVycy4KCj4gY29udmVyc2lvbiBvbmx5
IHdoZW4gd2UgcmVhZCB0aGUgdGVtcGVyYXR1cmUuIEZ1cnRoZXIgbW9yZSwgaXQgd2lsbAo+IGNv
bnN1bWUgbW9yZSBwb3dlciBpZiB3ZSBlbmFibGUgY29udGludW91cyBtb2RlLgo+IAoKVXN1YWxs
eSB0aGF0IGlzIG5vdCBhIGNvbmNlcm4sIG11Y2ggbGVzcyBzbyB0aGFuIGRlbGF5aW5nIGVhY2gg
cmVhZGVyLgoKVWx0aW1hdGVseSwgc3VyZSwgeW91IGNhbiBkbyB3aGF0ZXZlciB5b3Ugd2FudC4g
SSdsbCBzdGlsbCBhY2NlcHQgdGhlIGRyaXZlci4KSSBkbyBleHBlY3QgeW91IHRvIGV4cGxhaW4g
eW91ciByZWFzb25zIChhbGwgb2YgdGhlbSkgaW4gdGhlIGRyaXZlciwgdGhvdWdoLgoKSWYgeW91
IGRvbid0IF9rbm93XyBpZiB0aGUgdGVtcGVyYXR1cmUgaXMgdXBkYXRlZCBpbiBjb250aW51b3Vz
IG1vZGUsCnBsZWFzZSBzdGF0ZSBleGFjdGx5IHRoYXQgaW4gdGhlIGNvbW1lbnRzLiBBbHNvIGV4
cGxhaW4gaG93IG11Y2ggcG93ZXIKaXMgc2F2ZWQgYnkgbm90IHJ1bm5pbmcgaW4gY29udGludW91
cyBtb2RlLiBJIGRvbid0IHdhbnQgYW55b25lIHRvIGNvbWUKYmFjayBsYXRlciBvbiBhbmQgY2hh
bmdlIHRoZSBjb2RlIGJlY2F1c2UgdGhleSBkb24ndCBrbm93IHRoZSByZWFzb25zCndoeSBpdCBk
b2Vzbid0IHVzZSBjb250aW51b3VzIG1vZGUuCgpUaGFua3MsCkd1ZW50ZXIKCj4gQmVzdCByZWdh
cmRzLAo+IEhhbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
