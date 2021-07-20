Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1A8C07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 06:54:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76EFA61003
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 06:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76EFA61003
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=irh60CKmIfC4UhutrK8XFvlE5q2cYINj5XSGdZOIBHc=; b=mzYLfMi9HiOH5QuHvnjz5MpQxd
	hJNU1ZI8zq8So3mvbo3Br8KmZJqn5hywRI+qAYyLr4M78tKd4ggc9rnOaJxi9XEVCA33osY/rsBYi
	JQNaeiTpayswzWkoZtOs7e9vfFcf5utXrWbcI/AqSNcOTbJ2zf1doHkGyQfsVwmdr2rroVbyV2vSd
	JS0A4hajF/rVI3Q8fD/M2+VUdyDSIXugW9jBUa4t2TPgBV+MOCPmJa+3U56xZHtoEZ+OuTjWFFv6K
	HX1oz5Rl0RP6ssJs8x3Qv7Tpm92H8OsRdnwBmad/2n5b4dgTdjEVmLC1S7i1GYW8dNPqjN21WvHbd
	xA4C+ubA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5jeG-00C3oR-Bb; Tue, 20 Jul 2021 06:54:36 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5jeD-00C3ny-7E
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 06:54:34 +0000
Received: by mail-pl1-x630.google.com with SMTP id j3so10984821plx.7
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 23:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=TGUv40RVMYXOh6KiHqrq6840FSz1qV9wifGkcdU1UIE=;
 b=sdjrxl1Wj0oJ16dSDOf7qCbB4iokjDADNt7X5W/9J1EMuFGZJzg16irOTnAIC4b/FG
 i+5iGCtDUdNOGh0qYXOnwJ6+UiO1w7YtNysblfmGzVNIEQostlRp4bwmzqIXysySqyuB
 e3EIPoWZ6iAbq+/g2uMGj9jlwYeqyA+i0LP78oTm5t5T/OK8driv1/+Ue37uhYN67SNr
 /0LiJRjYFy/SjlCvsCRdmE9u8cLlZ9DEzjWajtY0yzqUnLZ+iSK51Q8jjYkMSKunYYAB
 REDtqeRNGIHbluJM/qJYFVtalRzjrhjP3PWOVR6EoBj9QO0tEa9wTWSRgBz/apw8XckU
 2VkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TGUv40RVMYXOh6KiHqrq6840FSz1qV9wifGkcdU1UIE=;
 b=hgQiTg3DXpSM+OeY9v7rX1LJCFt/g500bGrOgRaycnTLlFxGVsxGJQhVJfkEd0ovRi
 cZuGrvR6HQUZqaR8lQYhi3RVO7kAYMb9NZU+L++GtjKDZM+rUQtspm9QHqFS4tuXOKWy
 G3FZzCAvtDnDT808CQbJd9BK9HcNDY0bUPd6oq8DD7lnJHaF0iMsu5pbTWezaGs9EFyL
 JQLT6Z8CFOUSeDifB6Xw4gNak1RTpvcG+BBKtVuia6VXpliCOnCSTi5UEP6opkcvxehO
 ztTYZe7abKB107Htl++NtIBjFi3G8Te+Az5N8EQqGQIuIRzndGYL+aOznQVYf5SRyM8H
 5X+g==
X-Gm-Message-State: AOAM532jWVcMUtbEbuSjTe/WRCmxfK1884W9OS5mvIZ6ZaY5xu//T8K+
 qr+wfJgE1Fzyt4NF0MAngso=
X-Google-Smtp-Source: ABdhPJw/zdSDh0HwVmqBC8zH0slokjPAmbpjxwyQGgzcAobkwXE7LX3UdBaMqTX91UiGyNLGKJQcDg==
X-Received: by 2002:a17:90b:128a:: with SMTP id
 fw10mr28594223pjb.116.1626764071284; 
 Mon, 19 Jul 2021 23:54:31 -0700 (PDT)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id i18sm23006194pfa.149.2021.07.19.23.54.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 23:54:30 -0700 (PDT)
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
 <e1bb4768-5517-8ef3-eaf3-bbfc103fa918@gmail.com>
 <9a2bf544-2aaa-d175-bc0a-c8bcefd8141a@roeck-us.net>
 <718c5a83-de9f-3b5a-ef36-e52ad5bb4d67@gmail.com>
 <c19f05f0-985e-ca6e-7cfc-af5c69e155fd@roeck-us.net>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <616a5e92-4225-6793-fa0c-02ff831e26df@gmail.com>
Date: Tue, 20 Jul 2021 15:54:27 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c19f05f0-985e-ca6e-7cfc-af5c69e155fd@roeck-us.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_235433_307366_C0583C84 
X-CRM114-Status: GOOD (  29.37  )
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

CgpPbiA3LzIwLzIxIDAwOjE2LCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+IE9uIDcvMTkvMjEgNzo0
OSBBTSwgQWtpcmEgVHN1a2Ftb3RvIHdyb3RlOgo+Pgo+PiBPbiA3LzE5LzIwMjEgMTE6MjQgUE0s
IEd1ZW50ZXIgUm9lY2sgd3JvdGU6Cj4+PiBPbiA3LzE5LzIxIDc6MDAgQU0sIEFraXJhIFRzdWth
bW90byB3cm90ZToKPj4+Pgo+Pj4+IE9uIDcvMTkvMjAyMSAxMDo1MSBQTSwgR3VlbnRlciBSb2Vj
ayB3cm90ZToKPj4+Pj4gSGksCj4+Pj4+Cj4+Pj4+IE9uIDcvMTkvMjEgNTo1MyBBTSwgQWtpcmEg
VHN1a2Ftb3RvIHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+IFRoaXMgcGF0Y2ggd2lsbCByZWR1Y2UgY3B1
IHVzYWdlIGRyYW1hdGljYWxseSBpbiBrZXJuZWwgc3BhY2UgZXNwZWNpYWxseQo+Pj4+Pj4gZm9y
IGFwcGxpY2F0aW9uIHdoaWNoIHVzZSBzeXMtY2FsbCB3aXRoIGxhcmdlIGJ1ZmZlciBzaXplLCBz
dWNoIGFzCj4+Pj4+PiBuZXR3b3JrIGFwcGxpY2F0aW9ucy4gVGhlIG1haW4gcmVhc29uIGJlaGlu
ZCB0aGlzIGlzIHRoYXQgZXZlcnkKPj4+Pj4+IHVuYWxpZ25lZCBtZW1vcnkgYWNjZXNzIHdpbGwg
cmFpc2UgZXhjZXB0aW9ucyBhbmQgc3dpdGNoIGJldHdlZW4gcy1tb2RlCj4+Pj4+PiBhbmQgbS1t
b2RlIGNhdXNpbmcgbGFyZ2Ugb3ZlcmhlYWQuCj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBJIGhhZCB0byBy
ZXZlcnQgdGhlIG9yaWdpbmFsIHBhdGNoIGZyb20gdGhlIG1haW5saW5lIGtlcm5lbCBwcmlvciB0
byBhcHBseWluZwo+Pj4+PiB0aGlzIHBhdGNoLiBPYnZpb3VzbHkgdGhhdCBtZWFucyB0aGF0IHRo
ZXJlIG1heSBiZSBvdGhlciBjaGFuZ2VzIGFmZmVjdGluZyB0aGUKPj4+Pj4gb3V0Y29tZS4KPj4+
Pj4KPj4+Pj4gcmlzY3Y2NCBpbWFnZXMgd29yaywgYnV0IHJpc2N2MzIgaW1hZ2VzIHN0aWxsIGZh
aWwgd2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQuCj4+Pj4+IFRoZSBlcnJvciBpcyBhIGJpdCBkaWZm
ZXJlbnQgdGhhbiBiZWZvcmUsIHRob3VnaC4KPj4+Pj4KPj4+Pj4gLi4uCj4+Pj4+IFvCoMKgIDEx
Ljg5OTk3OV0gUnVuIC9zYmluL2luaXQgYXMgaW5pdCBwcm9jZXNzCj4+Pj4+IFvCoMKgIDEyLjE1
MjY2Nl0gcmFuZG9tOiBmYXN0IGluaXQgZG9uZQo+Pj4+PiBtb3VuOiBhcHBsZXQgbm90IGZvdW5k
Cj4+Pj4+ICLvv73vv73vv73vv73vv71W77+9dDogYXBwbGV0IG5vdCBmb3VuZAo+Pj4+PiAvYmnv
v73vv73vv73vv73vv71W77+9Ri06IGFwcGxldCBub3QgZm91bmQKPj4+Pj4gbW91bjogYXBwbGV0
IG5vdCBmb3VuZAo+Pj4+PiBzd2FvbjogYXBwbGV0IG5vdCBmb3VuZAo+Pj4+PiBob3N0bmFtZS1G
OiBhcHBsZXQgbm90IGZvdW5kCj4+Pj4+Cj4+Pj4+IEFmdGVyIHRoaXMsIHRoZSBpbWFnZSBoYW5n
cy4KPj4+Pj4KPj4+Pj4gRm9yIGNvbXBhcmlzb24sIHRoZSBtYWlubGluZSBrZXJuZWwgKHY1LjE0
LXJjMikgZmFpbHMgYXMgZm9sbG93cy4KPj4+Pj4KPj4+Pj4gW8KgwqAgMTAuNzg4MTA1XSBSdW4g
L3NiaW4vaW5pdCBhcyBpbml0IHByb2Nlc3MKPj4+Pj4gU3RhcnRpbmcgc3lzbG9nZDogT0sKPj4+
Pj4gU3RhcnRpbmcga2xvZ2Q6IE9LCj4+Pj4+IC9ldGMvaW5pdC5kL1MwMnN5c2N0bDogbGluZSA2
ODogc3ludGF4IGVycm9yOiBFT0YgaW4gYmFja3F1b3RlIHN1YnN0aXR1dGlvbgo+Pj4+PiAvZXRj
L2luaXQuZC9TMjB1cmFuZG9tOiBsaW5lIDE6IHN5bnRheCBlcnJvcjogdW50ZXJtaW5hdGVkIHF1
b3RlZCBzdHJpbmcKPj4+Pj4gU3RhcnRpbmcgbmV0d29yazogL2Jpbi9zaDogc3ludGF4IGVycm9y
OiB1bnRlcm1pbmF0ZWQgcXVvdGVkIHN0cmluZwo+Pj4+PiBzZWQ6IHVubWF0Y2hlZCAnLycKPj4+
Pj4gL2Jpbi9zaDogc3ludGF4IGVycm9yOiB1bnRlcm1pbmF0ZWQgcXVvdGVkIHN0cmluZwo+Pj4+
PiBGQUlMCj4+Pj4+IC9ldGMvaW5pdC5kL1M1NXJ1bnRlc3Q6IGxpbmUgNDg6IHN5bnRheCBlcnJv
cjogRU9GIGluIGJhY2txdW90ZSBzdWJzdGl0dXRpb24KPj4+Pj4KPj4+Pj4gSSdsbCBiZSBoYXBw
eSB0byBwcm92aWRlIGluZm9ybWF0aW9uIG9uIGhvdyB0byByZXByb2R1Y2UgdGhlIHByb2JsZW0K
Pj4+Pj4gaWYgbmVlZGVkLiBQbGVhc2UgbGV0IG1lIGtub3cuCj4+Pj4KPj4+PiBZZXMsIEkgZG8g
d291bGQgbGlrZSB0byBrbm93IHRoZSBwcm9jZWR1cmUgb2YgYnVpbGQgaW5zdHJ1Y3Rpb24gb2Yg
eW91ciBydjMyIGltYWdlLgo+Pj4+IFRoZW4gSSB3b3VsZCByZXByb2R1Y2UgdGhlIGVycm9yIGFu
ZCBsb29rIGludG8gaG93IHRvIGZpeCBpdC4KPj4+Pgo+Pj4gUGxlYXNlIGhhdmUgYSBsb29rIGF0
IGh0dHA6Ly9zZXJ2ZXIucm9lY2stdXMubmV0L3FlbXUvcmlzY3YzMi8KPj4+IGFuZCBsZXQgbWUg
a25vdyBpZiB5b3UgbmVlZCBhbnl0aGluZyBlbHNlLgo+Pgo+PiBUaGFua3MgZm9yIHRoZSBsaW5r
LiBJIHdpbGwgd29yayBvbiBpdCB0b21vcnJvdyBpbiBteSB0aW1lLgo+PiBCdWlsZGluZyB0aGUg
a2VybmVsIHdpdGggZGVmY29uZmlnIGxvb2tzIG11Y2ggcXVpY2tlciB0aGFuIHRoZSBjb25maWcu
Cj4+IEkgd2lsbCB0cnkgaXQgZnJvbSBkZWZjb25maWcgYW5kIHRoZW4gY29uZmlnLgo+Pgo+PiBB
bHNvIEkgd291bGQgbGlrZSB0byB1c2UgdGhlIHNhbWUgcnYzMiB0b29sY2hhaW4uIEFyZSB5b3Ug
dXNpbmcgcHJlYnVpbHQKPj4gcmlzY3YzMi1saW51eC1nY2M/IFNob3VsZCBub3QgbWFrZSBkaWZm
ZXJlbmNlcyBidXQganVzdCBpbiBjYXNlLgo+Pgo+IAo+IEkgdXNlIGEgdG9vbGNoYWluIGJ1aWx0
IHdpdGggZWl0aGVyIGJ1aWxkcm9vdCAod2hlbiBidWlsZGluZyB0aGUgcm9vdCBmaWxlIHN5c3Rl
bSkKPiBvciB3aXRoIHRoZSBidWlsZGFsbCBzY3JpcHRzIGZyb20gaHR0cHM6Ly9naXRodWIuY29t
L2ptZXNtb24vYnVpbGRhbGwuZ2l0Cj4gKGZvciB0aGUga2VybmVsKS4gRWl0aGVyIGNhc2UsIGl0
IGlzIHRoZSBkZWZhdWx0IHJpc2N2MzIgdG9vbGNoYWluIGZyb20gYm90aC4KPiAKPj4gSXMgdGhl
cmUgYSBwdWJsaWMgcmVmZXJlbmNlIGZvciB0aGUgd2F5IG9mIGJ1aWxkaW5nIHlvdXIgcWVtdSBh
bmQgb3BlbnNiaT8KPj4gTm90IHN1cmUgd2hpY2ggdmVyc2lvbiBvZiBxZW11IHdpdGggd2hpY2gg
cnYzMiB0byBidWlsZCB0aGVtLCBydjMyaSwgcnYzMmltYWQgb3IgZWxzZS4KPiAKPiBJIGRvbid0
IGtub3cgYWJvdXQgcnYzMmkgb3IgcnYzMmltYWQsIHNvcnJ5LiBJIGJ1aWxkIHFlbXUgZnJvbSBz
b3VyY2UgdXNpbmcKPiDCoMKgwqDCoC0tZGlzYWJsZS11c2VyIC0tZGlzYWJsZS1nbnV0bHMgLS1k
aXNhYmxlLWRvY3MgXAo+IMKgwqDCoMKgwqDCoMKgIC0tZGlzYWJsZS1uZXR0bGUgLS1kaXNhYmxl
LWdjcnlwdCAtLWRpc2FibGUtdm5jLXBuZyBcCj4gwqDCoMKgwqDCoMKgwqAgLS1kaXNhYmxlLXhl
biAtLWRpc2FibGUteGVuLXBjaS1wYXNzdGhyb3VnaCBcCj4gwqDCoMKgwqDCoMKgwqAgLS1kaXNh
YmxlLWxpYnNzaAo+IGNvbmZpZ3VyYXRpb24gb3B0aW9ucy4gVGhlIGZpcm13YXJlIGltYWdlIChv
cGVuc2JpKSBpcyBidWlsdCBhcyBwYXJ0IG9mIHRoYXQuCj4gWW91IHNob3VsZCBiZSBhYmxlIHRv
IHVzZSBhIHByZS1idWlsdCB2ZXJzaW9uIG9mIHFlbXUgdjYuMCBpZiB0aGF0IGlzIGF2YWlsYWJs
ZQo+IHNvbWV3aGVyZS4KPiAKPiBIb3BlIHRoaXMgaGVscHMsCgpTdXBlciwgSSB3YXMgcGVyZmVj
dGx5IGFibGUgdG8gcmVwcm9kdWNlIHRoZSBleGFjdGx5IHRoZSBzYW1lIGVycm9yIG1lc3NhZ2Vz
CndpdGggdGhlIHRvb2xjaGFpbiBpbiBidWlsZHJvb3QgYW5kIHlvdXIgcm9vdGZzLgoKVGhlcmUg
d2VyZSB0d28gYnVncywgb25lIGlzIG92ZXJydW4gY29weSBhbmQgc2Vjb25kIGlzIHdyb25nIHNo
aWZ0aW5nIGluIC5Mc2hpZnRfY29weQpmb3IgcnYzMi4KClBsZWFzZSB3YWl0IGZvciBteSBmaXgu
CgpBa2lyYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
