Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A892ED3B7E5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 23:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmO78vAmXGBKCRXa/AF5KlVqOwfI0SUh9tJ9Fqko5Fs=; b=HtidLvS5KQkpD5
	q+dLC/WsYhxVNN3z1KdjPbjyicuA38zLeXbuSnGzQkdcC3dut/JglBTDoTKUWXWrcQQowUbYBtsxX
	FTlrovZEBmAkCt8s2nDZ51dK7wEDytqE30WZiP6EvlYvhOE8tqjRyr6ij0h+vbf1U8JehCkBIxMwm
	YuLBxOeoRa3T/kaxOegV4yYnOyN5N+3ynCpDUsKA1guD4j4dYJALe0vDdUzV/0t9YnyGlHBoeqIn/
	ZaFUuY5aMRU6BlxUKTdHUrbp1y/jcvtYSOfCo70Q8vJhPaWByEELDz4TfNQJWKSuUpTMC8ovCLicp
	TIreCQI8H/WNXpcW+Odg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va0Wz-000000037AZ-2yOw;
	Sun, 28 Dec 2025 23:50:37 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va0Ww-0000000379z-2Q0w
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 23:50:36 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8b2a4b6876fso1269771485a.3
        for <linux-riscv@lists.infradead.org>; Sun, 28 Dec 2025 15:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766965833; x=1767570633; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=32IgmIv8zrlvmLhf4zlKlhWMKh5C1l6H+JNSEz9V4Ck=;
        b=Ad7vcyAW2dX9J6n4OX+pJ5cYaVafM76ljAyPGy5PYBxjTfVQQudhc9219pjKHR5a/P
         7ehJ7k0s0UjDQufKQcPCO9fx5k0VWUIGISckry/FOUqf/FQnnh3DwVtdbRJ89PLqIxcN
         dvRO8xCudUM6ipWLmiCoUZuw0G34W/9PvfYHhdAKK/vsHTrEmdA+pTOnElSqGdQ/ZAlJ
         RidvgnosDsFzQvsWURFCfWsYlyo2zfh/e4MolnLx8d/MLvmT8VMHtr01cBoYd3MbHUQW
         gEAcuQDyg3WEyCoCxif7Mhr43+ExAaVGosQENWYoJNAW/dn96xw5/Cw16bs1Vp7xIglj
         yv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766965833; x=1767570633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=32IgmIv8zrlvmLhf4zlKlhWMKh5C1l6H+JNSEz9V4Ck=;
        b=Ayd9JNN4EWt7rlks+4diDBMiyMauOmb/b+7M7adAH49ZO3FwKDIlnGByMfunbd0VGM
         wxY4PHJca5UYkYzMbb9iLiGXPVaNWFBWRHKDNcN133XUULhilqV2UMJr2b/6ohyJ/H0Q
         R1sxuEAvtVlgbvk/zT2oIpAjXsYVuFSpATG9PDcqTfgK5wrzIh0wLPzkvMQ2akWygSpu
         4E3rJ+7VYoj0XeyH9WOwff4W+8gK5vnOuLzife5gH6N+MSeaNrBJG58r7i0Q6npeFESZ
         eBPhuhMpAczlrETeH0zUd5Himb+GKTKM/8DfVur8S1UppyN7Vrchz71pSV45zoiTraRm
         QzMg==
X-Forwarded-Encrypted: i=1; AJvYcCUyh5nV4bOTUKc6wCw5gkOCEfUoWds3Im2XaJ2nXggfaQLJti9Zc1M+Akzuxh/hDKmEA/s7cqxsPqXkKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXirpNXvzaVvWGwjuqPBY9Ze8lT1PBaw6NJ2m0bgoXdYDWbvBt
	KU6dnwPxpmhvmNm/6pZiWhSMrs/eXKEI9WDVX8MwmBmv/JhYmJSJcPeXQavpaK7HRmE=
X-Gm-Gg: AY/fxX68y/v1ia8y6/+TrXSR8YZiH0m6/WQ3c0hrs8VNCUaHA9l6KqNELQ8luIOHlv/
	qJQmlAohiFnjbLI1fmWFsUIIaPHUSSfteJr1ya5lJpEdNPIgnS5+CG7Pto2NLZlD9rE9Tp4ac8P
	+r08bTXmSFImssFzFtQqqEjOoflTP/21StlGwdkBbKU1UOeSsaCZksF35LCbR5PHYpPhXRM3LQ0
	yFGSSgE0UmAClO8wycOJU8fvyU+y5/sDxHNMCGv5JcxSBqgGY3+AaYUDB/TxOPuRotLpTNKSOHa
	tRrAM2YO1mca0syWIk03qgwK+X/4+FiQmVC8ue2YCO794OuVQdYxBYT+KkYVknhWiQ4T6gN06gH
	tyEy+ZWv7CJ8upwFeJM9ZIa740jB98TLz4Ia7bBta/we9yItt1XD9FMXHapCwRRxfrp7xH2kPd2
	LUTccuR+9ksEkB5WI2EP2ruCKlBmsCIaHANYT6TQsZSjfno1TYib4=
X-Google-Smtp-Source: AGHT+IGO0rRMB42YAPbAxySM0mJWBXB87uK13FjFxZZQF9ufEaQWAz5zIA8GyT5HoxBqf1wj2KD+tA==
X-Received: by 2002:a05:620a:172b:b0:8b6:134e:22f3 with SMTP id af79cd13be357-8c08fab7e14mr3980633785a.61.1766965833165;
        Sun, 28 Dec 2025 15:50:33 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973f28e3sm2406423185a.45.2025.12.28.15.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 15:50:32 -0800 (PST)
Message-ID: <03f108a3-23ca-492f-8508-3a204861d063@riscstar.com>
Date: Sun, 28 Dec 2025 17:50:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/13] dt-bindings: riscv: Add Sha and its comprised
 extensions
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>, Paul Walmsley <paul.walmsley@sifive.com>,
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-10-3af3f3cd0f8a@riscstar.com>
 <0253c25d-f5fd-46f1-b4d3-ec56909d5eac@riscstar.com>
 <CAH1PCMa0NqZGQAknRZppVWUEBzKDE7tcega7bsT187+=wc-_YQ@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAH1PCMa0NqZGQAknRZppVWUEBzKDE7tcega7bsT187+=wc-_YQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_155035_832531_CB2BBDB3 
X-CRM114-Status: GOOD (  18.13  )
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

T24gMTIvMjgvMjUgNjo0MyBBTSwgR3VvZG9uZyBYdSB3cm90ZToKPiBIaSwgQWxleAo+IAo+IE9u
IFNhdCwgRGVjIDI3LCAyMDI1IGF0IDU6MjjigK9BTSBBbGV4IEVsZGVyIDxlbGRlckByaXNjc3Rh
ci5jb20+IHdyb3RlOgo+Pgo+PiBPbiAxMi8yMi8yNSA3OjA0IEFNLCBHdW9kb25nIFh1IHdyb3Rl
Ogo+Pj4gQWRkIGRlc2NyaXB0aW9ucyBmb3IgdGhlIFNoYSBleHRlbnNpb24gYW5kIHRoZSBzZXZl
biBleHRlbnNpb25zIGl0Cj4+PiBjb21wcmlzZXM6IFNoY291bnRlcmVudywgU2hnYXRwYSwgU2h0
dmFsYSwgU2h2c2F0cGEsIFNodnN0dmFsYSwgU2h2c3R2ZWNkLAo+Pj4gYW5kIFNzc3RhdGVlbi4K
Pj4+Cj4+PiBTaGEgaXMgcmF0aWZpZWQgaW4gdGhlIFJWQTIzIFByb2ZpbGVzIFZlcnNpb24gMS4w
IChjb21taXQgMDI3M2YzYzkyMWI2Cj4+PiAicnZhMjMvcnZiMjMgcmF0aWZpZWQiKSBhcyBhIG5l
dyBwcm9maWxlLWRlZmluZWQgZXh0ZW5zaW9uIHRoYXQgY2FwdHVyZXMKPj4+IHRoZSBmdWxsIHNl
dCBvZiBmZWF0dXJlcyB0aGF0IGFyZSBtYW5kYXRlZCB0byBiZSBzdXBwb3J0ZWQgYWxvbmcgd2l0
aAo+Pj4gdGhlIEggZXh0ZW5zaW9uLgo+Pj4KPj4+IEV4dGVuc2lvbnMgU2hjb3VudGVyZW53LCBT
aGdhdHBhLCBTaHR2YWxhLCBTaHZzYXRwYSwgU2h2c3R2YWxhLCBTaHZzdHZlY2QsCj4+PiBhbmQg
U3NzdGF0ZWVuIGFyZSByYXRpZmllZCBpbiB0aGUgUklTQy1WIFByb2ZpbGVzIFZlcnNpb24gMS4w
IChjb21taXQKPj4+IGIxZDgwNjYwNWY4NyAiVXBkYXRlZCB0byByYXRpZmllZCBzdGF0ZSIpLgo+
Pj4KPj4+IFRoZSByZXF1aXJlbWVudCBzdGF0dXMgZm9yIFNoYSBhbmQgaXRzIGNvbXByaXNlZCBl
eHRlbnNpb24gaW4gUklTQy1WCj4+PiBQcm9maWxlcyBhcmU6Cj4+PiAgICAtIFNoYTogTWFuZGF0
b3J5IGluIFJWQTIzUzY0Cj4+PiAgICAtIEg6IE9wdGlvbmFsIGluIFJWQTIyUzY0OyBNYW5kYXRv
cnkgaW4gUlZBMjNTNjQKPj4+ICAgIC0gU2hjb3VudGVyZW53OiBPcHRpb25hbCBpbiBSVkEyMlM2
NDsgTWFuZGF0b3J5IGluIFJWQTIzUzY0Cj4+PiAgICAtIFNoZ2F0cGE6IE9wdGlvbmFsIGluIFJW
QTIyUzY0OyBNYW5kYXRvcnkgaW4gUlZBMjNTNjQKPj4+ICAgIC0gU2h0dmFsYTogT3B0aW9uYWwg
aW4gUlZBMjJTNjQ7IE1hbmRhdG9yeSBpbiBSVkEyM1M2NAo+Pj4gICAgLSBTaHZzYXRwYTogT3B0
aW9uYWwgaW4gUlZBMjJTNjQ7IE1hbmRhdG9yeSBpbiBSVkEyM1M2NAo+Pj4gICAgLSBTaHZzdHZh
bGE6IE9wdGlvbmFsIGluIFJWQTIyUzY0OyBNYW5kYXRvcnkgaW4gUlZBMjNTNjQKPj4+ICAgIC0g
U2h2c3R2ZWNkOiBPcHRpb25hbCBpbiBSVkEyMlM2NDsgTWFuZGF0b3J5IGluIFJWQTIzUzY0Cj4+
PiAgICAtIFNzc3RhdGVlbjogT3B0aW9uYWwgaW4gUlZBMjJTNjQ7IE1hbmRhdG9yeSBpbiBSVkEy
M1M2NAo+Pj4KPj4+IEFkZCBzY2hlbWEgY2hlY2tzIHRvIGVuZm9yY2UgdGhhdCBTaGEgaW1wbGll
cyB0aGUgcHJlc2VuY2Ugb2YgYWxsIGl0cwo+Pj4gY29tcHJpc2VkIGV4dGVuc2lvbnMuCj4+Cj4+
IExpa2UgcGF0Y2ggNyBpbiB5b3VyIHNlcmllcywgSSAqdGhpbmsqIHdoYXQgeW91J3JlIGRvaW5n
Cj4+IGluIHRyeWluZyB0byBpbXBseSB0aGUgcHJlc2VuY2Ugb2YgdGhlc2Ugb3RoZXIgZXh0ZW5z
aW9ucwo+PiBpcyBhY3R1YWxseSByZXF1aXJpbmcgYWxsIHRob3NlIGV4dGVuc2lvbnMgdG8gYmUg
cHJlc2VudAo+PiAqaW4gYWRkaXRpb24qIHRvIGp1c3QgIlNoYSIuICBJIGRvbid0IHRoaW5rIHRo
YXQncyB3aGF0Cj4+IHdlIHdhbnQuCj4gCj4gSSB0ZW5kIHRvIHRoaW5rIHRoaXMgc2NoZW1hIGNo
ZWNrIGJsb2NrIHNob3VsZCBiZSByZW1vdmVkLiBDb25vciBleHByZXNzZWQKPiBzaW1pbGFyIGRl
c2lnbiBsb2dpYyBpbiBoaXMgY29tbWVudHMgdG8gbXkgUGF0Y2ggNy8xMyBvZiB2MiBzZXJpZXMu
Cj4gCj4gSWYgdGhlcmUgaXMgbm8gb2JqZWN0aW9uLCBJIHdpbGwgcmVtb3ZlIGl0LgoKU291bmRz
IGdvb2QuCS1BbGV4Cgo+IEJSLAo+IEd1b2RvbmcKPiAKPiAKPj4KPj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtQWxleAo+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogR3Vv
ZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4+PiAtLS0KPj4+IHYyOiBOZXcgcGF0Y2gu
Cj4+PiAtLS0KPj4+ICAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMu
eWFtbCAgICAgIHwgNzkgKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gICAgMSBmaWxlIGNoYW5n
ZWQsIDc5IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPj4+IGluZGV4IGVkN2E4
OGMwYWIzYjdkYzdhZDRhNGQyZmQzMDBkNmZiMzNlZjA1MGMuLjEwNjZiN2U2NWRhYjg5NzA0ZGJh
YzQ0OWRiNGFhNTYwNWM5NWI5ZDMgMTAwNjQ0Cj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4+PiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4+PiBAQCAtMTI4
LDYgKzEyOCw1NyBAQCBwcm9wZXJ0aWVzOgo+Pj4gICAgICAgICAgICAgICAgdmVyc2lvbiBvZiB0
aGUgcHJpdmlsZWdlZCBJU0Egc3BlY2lmaWNhdGlvbi4KPj4+Cj4+PiAgICAgICAgICAgICMgbXVs
dGktbGV0dGVyIGV4dGVuc2lvbnMsIHNvcnRlZCBhbHBoYW51bWVyaWNhbGx5Cj4+PiArICAgICAg
ICAtIGNvbnN0OiBzaGEKPj4+ICsgICAgICAgICAgZGVzY3JpcHRpb246IHwKPj4+ICsgICAgICAg
ICAgICBUaGUgc3RhbmRhcmQgU2hhIGV4dGVuc2lvbiBmb3IgYXVnbWVudGVkIGh5cGVydmlzb3Ig
ZXh0ZW5zaW9uIGFzCj4+PiArICAgICAgICAgICAgcmF0aWZpZWQgaW4gUlZBMjMgUHJvZmlsZXMg
VmVyc2lvbiAxLjAsIHdpdGggY29tbWl0IDAyNzNmM2M5MjFiNgo+Pj4gKyAgICAgICAgICAgICgi
cnZhMjMvcnZiMjMgcmF0aWZpZWQiKS4KPj4+ICsKPj4+ICsgICAgICAgICAgICBTaGEgY2FwdHVy
ZXMgdGhlIGZ1bGwgc2V0IG9mIGZlYXR1cmVzIHRoYXQgYXJlIG1hbmRhdGVkIHRvIGJlCj4+PiAr
ICAgICAgICAgICAgc3VwcG9ydGVkIGFsb25nIHdpdGggdGhlIEggZXh0ZW5zaW9uLiBTaGEgY29t
cHJpc2VzIHRoZSBmb2xsb3dpbmcKPj4+ICsgICAgICAgICAgICBleHRlbnNpb25zOiBILCBTaGNv
dW50ZXJlbncsIFNoZ2F0cGEsIFNodHZhbGEsIFNodnNhdHBhLCBTaHZzdHZhbGEsCj4+PiArICAg
ICAgICAgICAgU2h2c3R2ZWNkLCBhbmQgU3NzdGF0ZWVuLgo+Pj4gKwo+Pj4gKyAgICAgICAgLSBj
b25zdDogc2hjb3VudGVyZW53Cj4+PiArICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4+PiArICAg
ICAgICAgICAgVGhlIHN0YW5kYXJkIFNoY291bnRlcmVudyBleHRlbnNpb24gZm9yIHN1cHBvcnQg
d3JpdGFibGUgZW5hYmxlcwo+Pj4gKyAgICAgICAgICAgIGluIGhjb3VudGVyZW4gZm9yIGFueSBz
dXBwb3J0ZWQgY291bnRlciwgYXMgcmF0aWZpZWQgaW4gUklTQy1WCj4+PiArICAgICAgICAgICAg
UHJvZmlsZXMgVmVyc2lvbiAxLjAsIHdpdGggY29tbWl0IGIxZDgwNjYwNWY4NyAoIlVwZGF0ZWQg
dG8KPj4+ICsgICAgICAgICAgICByYXRpZmllZCBzdGF0ZS4iKQo+Pj4gKwo+Pj4gKyAgICAgICAg
LSBjb25zdDogc2hnYXRwYQo+Pj4gKyAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+Pj4gKyAgICAg
ICAgICAgIFRoZSBzdGFuZGFyZCBTaGdhdHBhIGV4dGVuc2lvbiBpbmRpY2F0ZXMgdGhhdCBmb3Ig
ZWFjaCBzdXBwb3J0ZWQKPj4+ICsgICAgICAgICAgICB2aXJ0dWFsIG1lbW9yeSBzY2hlbWUgU3ZO
TiBzdXBwb3J0ZWQgaW4gc2F0cCwgdGhlIGNvcnJlc3BvbmRpbmcKPj4+ICsgICAgICAgICAgICBo
Z2F0cCBTdk5OeDQgbW9kZSBtdXN0IGJlIHN1cHBvcnRlZC4gVGhlIGhnYXRwIG1vZGUgQmFyZSBt
dXN0Cj4+PiArICAgICAgICAgICAgYWxzbyBiZSBzdXBwb3J0ZWQuIEl0IGlzIHJhdGlmaWVkIGlu
IFJJU0MtViBQcm9maWxlcyBWZXJzaW9uIDEuMCwKPj4+ICsgICAgICAgICAgICB3aXRoIGNvbW1p
dCBiMWQ4MDY2MDVmODcgKCJVcGRhdGVkIHRvIHJhdGlmaWVkIHN0YXRlLiIpCj4+PiArCj4+PiAr
ICAgICAgICAtIGNvbnN0OiBzaHR2YWxhCj4+PiArICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4+
PiArICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFNodHZhbGEgZXh0ZW5zaW9uIGZvciBodHZhbCBi
ZSB3cml0dGVuIHdpdGggdGhlCj4+PiArICAgICAgICAgICAgZmF1bHRpbmcgZ3Vlc3QgcGh5c2lj
YWwgYWRkcmVzcyBpbiBhbGwgY2lyY3Vtc3RhbmNlcyBwZXJtaXR0ZWQgYnkKPj4+ICsgICAgICAg
ICAgICB0aGUgSVNBLiBJdCBpcyByYXRpZmllZCBpbiBSSVNDLVYgUHJvZmlsZXMgVmVyc2lvbiAx
LjAsIHdpdGgKPj4+ICsgICAgICAgICAgICBjb21taXQgYjFkODA2NjA1Zjg3ICgiVXBkYXRlZCB0
byByYXRpZmllZCBzdGF0ZS4iKQo+Pj4gKwo+Pj4gKyAgICAgICAgLSBjb25zdDogc2h2c2F0cGEK
Pj4+ICsgICAgICAgICAgZGVzY3JpcHRpb246IHwKPj4+ICsgICAgICAgICAgICBUaGUgc3RhbmRh
cmQgU2h2c2F0cGEgZXh0ZW5zaW9uIGZvciB2c2F0cCBzdXBwb3J0aW5nIGFsbCB0cmFuc2xhdGlv
bgo+Pj4gKyAgICAgICAgICAgIG1vZGVzIHN1cHBvcnRlZCBpbiBzYXRwLCBhcyByYXRpZmllZCBp
biBSSVNDLVYgUHJvZmlsZXMgVmVyc2lvbiAxLjAsCj4+PiArICAgICAgICAgICAgd2l0aCBjb21t
aXQgYjFkODA2NjA1Zjg3ICgiVXBkYXRlZCB0byByYXRpZmllZCBzdGF0ZS4iKQo+Pj4gKwo+Pj4g
KyAgICAgICAgLSBjb25zdDogc2h2c3R2YWxhCj4+PiArICAgICAgICAgIGRlc2NyaXB0aW9uOiB8
Cj4+PiArICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFNodnN0dmFsYSBleHRlbnNpb24gZm9yIHZz
dHZhbCBwcm92aWRlcyBhbGwgbmVlZGVkCj4+PiArICAgICAgICAgICAgdmFsdWVzIGFzIHJhdGlm
aWVkIGluIFJJU0MtViBQcm9maWxlcyBWZXJzaW9uIDEuMCwgd2l0aCBjb21taXQKPj4+ICsgICAg
ICAgICAgICBiMWQ4MDY2MDVmODcgKCJVcGRhdGVkIHRvIHJhdGlmaWVkIHN0YXRlLiIpCj4+PiAr
Cj4+PiArICAgICAgICAtIGNvbnN0OiBzaHZzdHZlY2QKPj4+ICsgICAgICAgICAgZGVzY3JpcHRp
b246IHwKPj4+ICsgICAgICAgICAgICBUaGUgc3RhbmRhcmQgU2h2c3R2ZWNkIGV4dGVuc2lvbiBm
b3IgdnN0dmVjIHN1cHBvcnRpbmcgRGlyZWN0IG1vZGUsCj4+PiArICAgICAgICAgICAgYXMgcmF0
aWZpZWQgaW4gUklTQy1WIFByb2ZpbGVzIFZlcnNpb24gMS4wLCB3aXRoIGNvbW1pdCBiMWQ4MDY2
MDVmODcKPj4+ICsgICAgICAgICAgICAoIlVwZGF0ZWQgdG8gcmF0aWZpZWQgc3RhdGUuIikKPj4+
ICsKPj4+ICAgICAgICAgICAgLSBjb25zdDogc21haWEKPj4+ICAgICAgICAgICAgICBkZXNjcmlw
dGlvbjogfAo+Pj4gICAgICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFNtYWlhIHN1cGVydmlzb3It
bGV2ZWwgZXh0ZW5zaW9uIGZvciB0aGUgYWR2YW5jZWQKPj4+IEBAIC0xODYsNiArMjM3LDEyIEBA
IHByb3BlcnRpZXM6Cj4+PiAgICAgICAgICAgICAgICByYXRpZmllZCBhdCBjb21taXQgZDcwMDEx
ZGRlNmMyICgiVXBkYXRlIHRvIHJhdGlmaWVkIHN0YXRlIikKPj4+ICAgICAgICAgICAgICAgIG9m
IHJpc2N2LWotZXh0ZW5zaW9uLgo+Pj4KPj4+ICsgICAgICAgIC0gY29uc3Q6IHNzc3RhdGVlbgo+
Pj4gKyAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+Pj4gKyAgICAgICAgICAgIFRoZSBzdGFuZGFy
ZCBTc3N0YXRlZW4gZXh0ZW5zaW9uIGZvciBzdXBlcnZpc29yLW1vZGUgdmlldyBvZiB0aGUKPj4+
ICsgICAgICAgICAgICBzdGF0ZS1lbmFibGUgZXh0ZW5zaW9uLCBhcyByYXRpZmllZCBpbiBSSVND
LVYgUHJvZmlsZXMgVmVyc2lvbiAxLjAsCj4+PiArICAgICAgICAgICAgd2l0aCBjb21taXQgYjFk
ODA2NjA1Zjg3ICgiVXBkYXRlZCB0byByYXRpZmllZCBzdGF0ZS4iKQo+Pj4gKwo+Pj4gICAgICAg
ICAgICAtIGNvbnN0OiBzc3RjCj4+PiAgICAgICAgICAgICAgZGVzY3JpcHRpb246IHwKPj4+ICAg
ICAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBTc3RjIHN1cGVydmlzb3ItbGV2ZWwgZXh0ZW5zaW9u
IGZvciB0aW1lIGNvbXBhcmUgYXMKPj4+IEBAIC04MTMsNiArODcwLDI4IEBAIHByb3BlcnRpZXM6
Cj4+PiAgICAgICAgICAgICAgICAgICAgY29uc3Q6IHpiYgo+Pj4gICAgICAgICAgICAgICAgLSBj
b250YWluczoKPj4+ICAgICAgICAgICAgICAgICAgICBjb25zdDogemJzCj4+PiArICAgICAgIyBz
aGEgY29tcHJpc2VzIHRoZSBmb2xsb3dpbmcgZXh0ZW5zaW9ucwo+Pj4gKyAgICAgIC0gaWY6Cj4+
PiArICAgICAgICAgIGNvbnRhaW5zOgo+Pj4gKyAgICAgICAgICAgIGNvbnN0OiBzaGEKPj4+ICsg
ICAgICAgIHRoZW46Cj4+PiArICAgICAgICAgIGFsbE9mOgo+Pj4gKyAgICAgICAgICAgIC0gY29u
dGFpbnM6Cj4+PiArICAgICAgICAgICAgICAgIGNvbnN0OiBoCj4+PiArICAgICAgICAgICAgLSBj
b250YWluczoKPj4+ICsgICAgICAgICAgICAgICAgY29uc3Q6IHNoY291bnRlcmVudwo+Pj4gKyAg
ICAgICAgICAgIC0gY29udGFpbnM6Cj4+PiArICAgICAgICAgICAgICAgIGNvbnN0OiBzaGdhdHBh
Cj4+PiArICAgICAgICAgICAgLSBjb250YWluczoKPj4+ICsgICAgICAgICAgICAgICAgY29uc3Q6
IHNodHZhbGEKPj4+ICsgICAgICAgICAgICAtIGNvbnRhaW5zOgo+Pj4gKyAgICAgICAgICAgICAg
ICBjb25zdDogc2h2c2F0cGEKPj4+ICsgICAgICAgICAgICAtIGNvbnRhaW5zOgo+Pj4gKyAgICAg
ICAgICAgICAgICBjb25zdDogc2h2c3R2YWxhCj4+PiArICAgICAgICAgICAgLSBjb250YWluczoK
Pj4+ICsgICAgICAgICAgICAgICAgY29uc3Q6IHNodnN0dmVjZAo+Pj4gKyAgICAgICAgICAgIC0g
Y29udGFpbnM6Cj4+PiArICAgICAgICAgICAgICAgIGNvbnN0OiBzc3N0YXRlZW4KPj4+ICAgICAg
ICAgICMgWmNiIGRlcGVuZHMgb24gWmNhCj4+PiAgICAgICAgICAtIGlmOgo+Pj4gICAgICAgICAg
ICAgIGNvbnRhaW5zOgo+Pj4KPj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
