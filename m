Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A145C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 13:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+WvrylAlwF0zc6TuackPe5ABlOhcdv4VXaf/PRQIQtw=; b=rNxOYTlyLO6NdV
	kdPPr87mpuDP49Os5augmWWh7GtE5cIDS4vWoc0+T/aBUdOahV49bz8Is3n14pt2c1rqjghENZnS5
	5zfD1dL3prk2+fstCoLZlEhCuZ1bVzGgSJ/D8nnfOuu0WncpcYZQ/HsKigBdNXGCJYvAcMlWMLgDp
	SXdxm1WglAs9XfzJJE3RrFpocSrFIgA8C01zCRYUF5arT0QIhR1BnXf+azYJb+XDSvBhSwA9s1V5Q
	TWUortfMrzcBMImBb0dgvAJdTM0hAJScZemhjTe0mJv0lhbxhNJgqc+L3nk35GXNqYlsHUQpyVvw0
	FlMoxHLg+UKjCfDcCOig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSdSv-003UtM-0k;
	Wed, 24 Jan 2024 13:38:53 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSdSr-003Us3-1H
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 13:38:51 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6daf694b439so3903922b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 05:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706103525; x=1706708325; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bp7f1hEOsiV7YtpZ9AGCbB4JxicM5nyS0Cu3Hyvk+k8=;
        b=k+mv6rAxO2gS5V9S18yRNaOk83Webg8PmhSmmisHv5L/V0H81Cu0UTr63YEe+kjT3G
         gZEwoNhrSD7fDFBKnWZdIxCozc4GrxIBGVdS8K2DbhczkxalhDLZCqO88ytStOYQqLHP
         dmK0+5LxduchZn2OFD3Oo0yzkdztGV3YT9MR/qokUmqW5FICVR7wDnEC5dp9IJYvmStV
         ywhdzLZetraU/s+crPwnXS82k5mqXVSwaYKsz9Kz3jGU6CUxBCJrO/R/3a6TLnaK8NUQ
         SSvJGe+Mb6uvVn0wBRxlJiW0fXntTynj3ZQGW2YsCMczEqJfjfZtL48dFJjdqNb8pc8I
         BPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706103525; x=1706708325;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bp7f1hEOsiV7YtpZ9AGCbB4JxicM5nyS0Cu3Hyvk+k8=;
        b=MErnMvkFmOGrKfNEdPWxGvRR6ovgqFSxhOLpMy4YliSqpbQgiM891C6GOsvwPX2Noz
         tcxMLACptpHfZovHlpPo/rJK8FzxH93oSDmB7UPMwIBeBmJyW27UkY8lfLCq3CcO1Y8o
         y4IM8C/GX04fm1h2Lc2NfayGa5EDVNbwfv5VueCnRF6sCVLwjFT+e+mh57daZ6CN04JK
         +wx6Z95N57EhrgWvHiZDV+drDdWtY315i4VxAgmvjsDR45H7zhdh5nQ7nX6YTAU1C8bD
         +2mRCV3xOfcZh+0k+mKy8YGMmkoPLx3gDItGM1XQNhVpUx/hgp3YZWVexDG7Ijb+dy5/
         3jlA==
X-Gm-Message-State: AOJu0YwP7N0TwsP5d9T/N64wuUdbT10GVuTjl9oKsoPdsfTzD3E3tY6j
	TCPnLrkbrJnnn2CODVDwGn5FAZrqrA61r4meBzdEi0o4Qv8Olcl4+M20azo4O60=
X-Google-Smtp-Source: AGHT+IHPp755/3BRCAM6G4MKGo6YlH1VtDNX3Nck4jJuySDP5i3KrVaz+HMCP9Y66UR46AQ2BY2Q9Q==
X-Received: by 2002:a05:6a00:1791:b0:6db:db71:f469 with SMTP id s17-20020a056a00179100b006dbdb71f469mr3824850pfg.53.1706103525274;
        Wed, 24 Jan 2024 05:38:45 -0800 (PST)
Received: from [192.168.68.110] ([152.234.127.94])
        by smtp.gmail.com with ESMTPSA id fj2-20020a056a003a0200b006d98505dacasm13759390pfb.132.2024.01.24.05.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 05:38:44 -0800 (PST)
Message-ID: <78107c83-7035-414c-9a44-af5e234fd5c2@ventanamicro.com>
Date: Wed, 24 Jan 2024 10:38:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qemu riscv, thead c906, Linux boot regression
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Christoph_M=C3=BCllner?=
 <christoph.muellner@vrull.eu>
Cc: linux-riscv@lists.infradead.org, LIU Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Andrew Jones <ajones@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <874jf2rj4g.fsf@all.your.base.are.belong.to.us>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <874jf2rj4g.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_053849_458714_06C61AB9 
X-CRM114-Status: GOOD (  14.47  )
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

CgpPbiAxLzI0LzI0IDA5OjQ5LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IEhpIQo+IAo+IEkgYnVt
cGVkIHRoZSBSSVNDLVYgTGludXgga2VybmVsIENJIHRvIHVzZSBxZW11IDguMi4wLCBhbmQgcmVh
bGl6ZWQgdGhhdAo+IHRoZWFkIGM5MDYgZGlkbid0IGJvb3QgYW55bW9yZS4gQmlzZWN0aW9uIHBv
aW50cyB0byBjb21taXQgZDZhNDI3ZTJjMGIyCj4gKCJ0YXJnZXQvcmlzY3YvY3B1LmM6IHJlc3Ry
aWN0ICdtYXJjaGlkJyB2YWx1ZSIpCj4gCj4gUmV2ZXJ0aW5nIHRoYXQgY29tbWl0LCBvciB0aGUg
aGFjayBiZWxvdyBzb2x2ZXMgdGhlIGJvb3QgaXNzdWU6Cj4gCj4gLS04PC0tCj4gZGlmZiAtLWdp
dCBhL3RhcmdldC9yaXNjdi9jcHUuYyBiL3RhcmdldC9yaXNjdi9jcHUuYwo+IGluZGV4IDhjYmZj
N2U3ODFhZC4uZTE4NTk2YzhhNTVhIDEwMDY0NAo+IC0tLSBhL3RhcmdldC9yaXNjdi9jcHUuYwo+
ICsrKyBiL3RhcmdldC9yaXNjdi9jcHUuYwo+IEBAIC01MDUsNiArNTA1LDkgQEAgc3RhdGljIHZv
aWQgcnY2NF90aGVhZF9jOTA2X2NwdV9pbml0KE9iamVjdCAqb2JqKQo+ICAgICAgIGNwdS0+Y2Zn
LmV4dF94dGhlYWRzeW5jID0gdHJ1ZTsKPiAgIAo+ICAgICAgIGNwdS0+Y2ZnLm12ZW5kb3JpZCA9
IFRIRUFEX1ZFTkRPUl9JRDsKPiArICAgIGNwdS0+Y2ZnLm1hcmNoaWQgPSAoKFFFTVVfVkVSU0lP
Tl9NQUpPUiA8PCAxNikgfAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAoUUVNVV9WRVJTSU9O
X01JTk9SIDw8IDgpICB8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgIChRRU1VX1ZFUlNJT05f
TUlDUk8pKTsKPiAgICNpZm5kZWYgQ09ORklHX1VTRVJfT05MWQo+ICAgICAgIHNldF9zYXRwX21v
ZGVfbWF4X3N1cHBvcnRlZChjcHUsIFZNXzFfMTBfU1YzOSk7Cj4gICAjZW5kaWYKPiAtLTg8LS0K
PiAKPiBJJ20gdW5zdXJlIHdoYXQgdGhlIGNvcnJlY3QgcWVtdSB3YXkgb2YgYWRkaW5nIGEgZGVm
YXVsdCB2YWx1ZSBpcywKPiBvciBpZiBjOTA2IHNob3VsZCBoYXZlIGEgcHJvcGVyIG1hcmNoaWQu
CgpJbiBjYXNlIHlvdSBuZWVkIHRvIHNldCBhICdtYXJjaGlkJyBkaWZmZXJlbnQgdGhhbiB6ZXJv
IGZvciBjOTA2LCB0aGlzIGhhY2sgd291bGQKYmUgYSBwcm9wZXIgZml4LiBBcyBtZW50aW9uZWQg
aW4gdGhlIGNvbW1pdCBtc2cgb2YgdGhlIHBhdGNoIHlvdSBtZW50aW9uZWQ6CgoiTmFtZWQgQ1BV
cyBzaG91bGQgc2V0ICdtYXJjaGlkJyB0byBhIG1lYW5pbmdmdWwgdmFsdWUgaW5zdGVhZCwgYW5k
IGdlbmVyaWMKICBDUFVzIGNhbiBzZXQgdG8gYW55IHZhbGlkIHZhbHVlLiIKClRoYXQgbWVhbnMg
dGhhdCBhbnkgc3BlY2lmaWMgbWFyY2hpZCB2YWx1ZSB0aGF0IHRoZSBDUFUgdXNlcyBtdXN0IHRv
IGJlIHNldAppbiBpdHMgb3duIGNwdV9pbml0KCkgZnVuY3Rpb24uCgoKVGhhbmtzLAoKRGFuaWVs
CgoKPiAKPiBNYXliZSBDaHJpc3RvcGggb3IgWmhpd2VpIGNhbiBhbnN3ZXI/Cj4gCj4gcWVtdSBj
b21tYW5kLWxpbmU6Cj4gcWVtdS1zeXN0ZW0tcmlzY3Y2NCAtbm9kZWZhdWx0cyAtbm9ncmFwaGlj
IC1tYWNoaW5lIHZpcnQsYWNwaT1vZmYgXAo+ICAgICAtY3B1IHRoZWFkLWM5MDYgLi4uCj4gCj4g
Cj4gVGhhbmtzLAo+IEJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
