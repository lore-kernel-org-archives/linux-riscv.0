Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D5AD5C0C1
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 12:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0tMSudaanhTc7czVzWSmkkulnOQbOe8uyPUIM4wkb+o=; b=JL3mBBzB2Ri3dG
	oQdyPiJ3L8x9r+w5dEiuZtLGwg6QU4VnUzAsL/znb+JWh4EPxtZekcyBn73HtpG62PwA2xlefIdVj
	obHRbMTZNwwJvdt4buo81mFt/t5dx/YfdWVoYOflJPP2LFqq3fDjAn8P77eSXuPMrQS8El2g7Xq36
	mxcjBa7w4GXgRO5NnwCwQpJUbFhBNBDLSGD1t6QGu6dJEhOfbjWS3BY+M9zXpVWOV36GLJvAamNb9
	vw21WvKYShJi1ZsUQcdZ0H7TowTjrH3H0V4kK94ijwkPi85IkRYpachit3Pw6995nxHQQbzabcrBD
	aWcw7vtSMTVvNY0+lefw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9O1B-0000000AVEk-0aU9;
	Fri, 08 Nov 2024 12:23:13 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Nuy-0000000ATuj-0Tum
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 12:16:49 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539f7606199so2043742e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 04:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731068205; x=1731673005; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JZ3fBc9vrdhfjlvvoxQNCflIXe7o6g5VS5PYdFJEVS8=;
        b=ja+1aMRtAymy6h22heVnrp+wKDuM9AdQPwjHzO62StcNdZrhhvRr0zPswsaDSKl5f9
         dxr8Jl6K4QEsezeS9Td9J3T3mJuiUE4f5R4Zl9U5iRYwDW0lNFYmnCT7LekygiS87D9W
         70lInDMN82pO44zTd/v7q2Q/mnrNJq1U5LrpJi6tyKWoZLYtOz8RtNbZm3b5LyWTDdvH
         Yc4Qpj0sbtr0zziQTmmlxQD8mK1oUT3jyH0yUdEUXyKCCoDp6lk9qv7I1WBIdPwU5FLa
         iwBHXGd44c1Iti37eb0Am6J6O/ygi4jXz+oHnqiHcY25UzMQdsKkHX5dlirzxMTPozdJ
         zEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731068205; x=1731673005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZ3fBc9vrdhfjlvvoxQNCflIXe7o6g5VS5PYdFJEVS8=;
        b=jHscCqWg5ekVUo2tQnmWP/6EnjG2nI551RVM/Kjs6//TolJLlTiJqYmUnhhc1Bu2RR
         E9iYfNH5ZG5kHKNvfZH7UcjSJn4u4E1ZZGLi9xdB2FT3/PWhCogcvoqdrK6zkh2lI99P
         lIFkLCkqNnLnjDNKXeKhQAmqP/vuDdAsmJtekqoAx8OHqNt2Zaqwi3mt1iHq7msh9QCT
         mA40islhC1MbU/QEYXmgV0A10OQtGIh4Rv81e1WEZafDVfqezojODLo39LkRjRPYUach
         IVh8pRa48WTgYQpBlnel2VvXjW78Prsnmg0bud0xoApMUEW7zWV0LUFF5sJ3BWoP77C3
         Gw+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0xYUxIU5fXmDleqbLaq7p1h3PmUlHhGyCo9On3+wV8+VbQCqRQK15JkCl3C9pimpQdyPfa9QGQdV4bQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUW57Aa9fuweKDzh24X/AjoI84yAxPyxHHH2EutGhW+sEGfpgX
	0I3FJ0HBY5tKW5FaKooUcWx3G9TJBGJNhNXMGOswg3AK0Fq2/DZh+u9FIYGwPsI=
X-Google-Smtp-Source: AGHT+IH1zvqcdZ/LuDqh+mCVw6B8DRN5b7XSyMB+43BYdxRmxl6Kvigd3I21b2SuUwGtr/lV246iLg==
X-Received: by 2002:a05:6512:3da5:b0:536:7362:5923 with SMTP id 2adb3069b0e04-53d862275c6mr1434785e87.1.1731068205513;
        Fri, 08 Nov 2024 04:16:45 -0800 (PST)
Received: from [172.20.144.15] ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa523a0esm96371185e9.0.2024.11.08.04.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 04:16:45 -0800 (PST)
Message-ID: <78eb729c-7594-460f-9d79-97fb683d8b5e@linaro.org>
Date: Fri, 8 Nov 2024 12:16:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] Prefer sysfs/JSON events also when no PMU is
 provided
To: Ian Rogers <irogers@google.com>, Atish Patra <atishp@rivosinc.com>,
 linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ben Gainey <ben.gainey@arm.com>,
 Junhao He <hejunhao3@huawei.com>, linux-riscv@lists.infradead.org,
 beeman@rivosinc.com, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Olsa <jolsa@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Kan Liang <kan.liang@linux.intel.com>, Ze Gao <zegao2021@gmail.com>,
 Weilin Wang <weilin.wang@intel.com>,
 Dominique Martinet <asmadeus@codewreck.org>
References: <20241026121758.143259-1-irogers@google.com>
 <CAP-5=fXf9HtqKZyvfXNbKLTB-dL_Ax5Hd0_Gn1J-y0T1SE9wLQ@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fXf9HtqKZyvfXNbKLTB-dL_Ax5Hd0_Gn1J-y0T1SE9wLQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_041648_499202_A57CC2F7 
X-CRM114-Status: GOOD (  33.26  )
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

CgpPbiAwNy8xMS8yMDI0IDE4OjUxLCBJYW4gUm9nZXJzIHdyb3RlOgo+IE9uIFNhdCwgT2N0IDI2
LCAyMDI0IGF0IDU6MTjigK9BTSBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+IHdyb3Rl
Ogo+Pgo+PiBBdCB0aGUgUklTQy1WIHN1bW1pdCB0aGUgdG9waWMgb2YgYXZvaWRpbmcgZXZlbnQg
ZGF0YSBiZWluZyBpbiB0aGUKPj4gUklTQy1WIFBNVSBrZXJuZWwgZHJpdmVyIGNhbWUgdXAuIFRo
ZXJlIGlzIGEgcHJlZmVyZW5jZSBmb3Igc3lzZnMvSlNPTgo+PiBldmVudHMgYmVpbmcgdGhlIHBy
aW9yaXR5IHdoZW4gbm8gUE1VIGlzIHByb3ZpZGVkIHNvIHRoYXQgbGVnYWN5Cj4+IGV2ZW50cyBt
YXliZSBzdXBwb3J0ZWQgdmlhIGpzb24uIE9yaWdpbmFsbHkgTWFyayBSdXRsYW5kIGFsc28KPj4g
ZXhwcmVzc2VkIGF0IExQQyAyMDIzIHRoYXQgZG9pbmcgdGhpcyB3b3VsZCByZXNvbHZlIGJ1Z3Mg
b24gQVJNIEFwcGxlCj4+IE0/IHByb2Nlc3NvcnMsIGJ1dCBKYW1lcyBDbGFyayBtb3JlIHJlY2Vu
dGx5IHRlc3RlZCB0aGlzIGFuZCBiZWxpZXZlcwo+PiB0aGUgZHJpdmVyIGlzc3VlcyB0aGVyZSBt
YXkgbm90IGhhdmUgZXhpc3RlZCBvciBoYXZlIGJlZW4gcmVzb2x2ZWQuIEluCj4+IGFueSBjYXNl
LCBpdCBpcyBpbmNvbnNpc3RlbnQgdGhhdCB3aXRoIGEgUE1VIGV2ZW50IG5hbWVzIGF2b2lkIGxl
Z2FjeQo+PiBlbmNvZGluZ3MsIGJ1dCB3aGVuIHdpbGRjYXJkaW5nIFBNVXMgKGllIHdpdGhvdXQg
YSBQTVUgd2l0aCB0aGUgZXZlbnQKPj4gbmFtZSkgdGhlIGxlZ2FjeSBlbmNvZGluZ3MgaGF2ZSBw
cmlvcml0eS4KPj4KPj4gVGhlIHBhdGNoIGRvaW5nIHRoaXMgd29yayB3YXMgcmV2ZXJ0ZWQgaW4g
YSB2Ni4xMCByZWxlYXNlIGNhbmRpZGF0ZQo+PiBhcywgZXZlbiB0aG91Z2ggdGhlIHBhdGNoIHdh
cyBwb3N0ZWQgZm9yIHdlZWtzIGFuZCBoYWQgYmVlbiBvbgo+PiBsaW51eC1uZXh0IGZvciB3ZWVr
cyB3aXRob3V0IGlzc3VlLCBMaW51cyB3YXMgaW4gdGhlIGhhYml0IG9mIHVzaW5nCj4+IGV4cGxp
Y2l0IGxlZ2FjeSBldmVudHMgd2l0aCB1bnN1cHBvcnRlZCBwcmVjaXNpb24gb3B0aW9ucyBvbiBo
aXMKPj4gTmVvdmVyc2UtTjEuIFRoaXMgbWFjaGluZSBoYXMgU0xDIFBNVSBldmVudHMgZm9yIGJ1
cyBhbmQgQ1BVIGN5Y2xlcwo+PiB3aGVyZSBBUk0gZGVjaWRlZCB0byBjYWxsIHRoZSBldmVudHMg
YnVzX2N5Y2xlcyBhbmQgY3ljbGVzLCB0aGUgbGF0dGVyCj4+IGJlaW5nIGFsc28gYSBsZWdhY3kg
ZXZlbnQgbmFtZS4gQVJNIGhhdmVuJ3QgcmVuYW1lZCB0aGUgY3ljbGVzIGV2ZW50Cj4+IHRvIGEg
bW9yZSBjb25zaXN0ZW50IGNwdV9jeWNsZXMgYW5kIGF2b2lkZWQgdGhlIHByb2JsZW0uIFdpdGgg
dGhlc2UKPj4gY2hhbmdlcyB0aGUgcHJvYmxlbWF0aWMgZXZlbnQgd2lsbCBub3cgYmUgc2tpcHBl
ZCwgYSBsYXJnZSB3YXJuaW5nCj4+IHByb2R1Y2VkLCBhbmQgcGVyZiByZWNvcmQgd2lsbCBjb250
aW51ZSBmb3IgdGhlIG90aGVyIFBNVSBldmVudHMuIFRoaXMKPj4gc29sdXRpb24gd2FzIHByb3Bv
c2VkIGJ5IEFybmFsZG8uCj4+Cj4+IFR3byBtaW5vciBjaGFuZ2VzIGhhdmUgYmVlbiBhZGRlZCB0
byBoZWxwIHdpdGggdGhlIGVycm9yIG1lc3NhZ2UgYW5kCj4+IHRvIHdvcmsgYXJvdW5kIGlzc3Vl
cyBvY2N1cnJpbmcgd2l0aCAicGVyZiBzdGF0IG1ldHJpY3MgKHNoYWRvdyBzdGF0KQo+PiB0ZXN0
Ii4KPj4KPj4gVGhlIHBhdGNoZXMgaGF2ZSBvbmx5IGJlZW4gdGVzdGVkIG9uIG15IHg4NiBub24t
aHlicmlkIGxhcHRvcC4KPiAKPiBIaSBBdGlzaCBhbmQgSmFtZXMsCj4gCj4gQ291bGQgSSBnZXQg
eW91ciB0YWdzIGZvciB0aGlzIHNlcmllcz8KPiAKPiBUaGUgcGF0Y2hlcyB3ZXJlIG9yaWdpbmFs
bHkgbW90aXZhdGVkIGJ5IHdhbnRpbmcgdG8gbWFrZSB0aGUgYmVoYXZpb3IKPiBvZiBldmVudHMg
cGFyc2VkIGxpa2UgImN5Y2xlcyIgbWF0Y2ggdGhhdCBvZiAiY3B1L2N5Y2xlcy8iLCB0aGUgUE1V
IGlzCj4gd2lsZGNhcmRlZCB0byAiY3B1IiBpbiB0aGUgZmlyc3QgY2FzZS4gVGhpcyB3YXMgZGl2
ZXJnZW50IGJlY2F1c2Ugb2YKPiBBUk0gd2Ugc3dpdGNoZWQgZnJvbSBwcmVmZXJyaW5nIGxlZ2Fj
eSAodHlwZSA9IFBFUkZfVFlQRV9IQVJEV0FSRSwKPiBjb25maWcgPSBQRVJGX0NPVU5UX0hXX0NQ
VV9DWUNMRVMpIHRvIHN5c2ZzL2pzb24gKHR5cGU9PGNvcmUgUE1VJ3MKPiB0eXBlPiwgY29uZmln
PTxlbmNvZGluZyBmcm9tIGV2ZW50Pikgd2hlbiBhIFBNVSBuYW1lIHdhcyBnaXZlbi4gVGhpcwo+
IGFsaWducyB3aXRoIFJJU0MtViB3YW50aW5nIHRvIHVzZSBqc29uIGVuY29kaW5ncyB0byBhdm9p
ZCBjb21wbGV4aXR5Cj4gaW4gdGhlIFBNVSBkcml2ZXIuCj4gCgpJIGNvdWxkbid0IGZpbmQgdGhl
IHRocmVhZCwgYnV0IEkgcmVtZW1iZXIgZmFpcmx5IHJlY2VudGx5IGl0IHdhcyAKbWVudGlvbmVk
IHRoYXQgUklTQy1WIHdvdWxkIGJlIHN1cHBvcnRpbmcgdGhlIGxlZ2FjeSBldmVudHMgYWZ0ZXIg
YWxsLCAKbWF5YmUgaXQgd2FzIGEgY29tbWVudCBmcm9tIEF0aXNoPyBJJ20gbm90IHN1cmUgaWYg
dGhhdCBjaGFuZ2VzIHRoZSAKcmVxdWlyZW1lbnRzIGZvciB0aGlzIG9yIG5vdD8KCkkgc3RpbGwg
Y2FuJ3QgcmVhbGx5IGltYWdpbmUgaG93IHRvb2xpbmcgd291bGQgd29yayBpZiBldmVyeSB0b29s
IGhhcyB0byAKbWFpbnRhaW4gdGhlIG1hcHBpbmdzIG9mIGJhc2ljIGV2ZW50cyBsaWtlIGluc3Ry
dWN0aW9ucyBhbmQgYnJhbmNoZXMuIApGb3IgZXhhbXBsZSBhbGwgdGhlIHBlcmZfZXZlbnRfb3Bl
biB0ZXN0cyBpbiBsdHAgdXNlIHRoZSBsZWdhY3kgZXZlbnRzLgoKQW5kIHdvdWxkbid0IHBvcnRp
bmcgZXhpc3Rpbmcgc29mdHdhcmUgdG8gUklTQy1WIHdvdWxkIGJlIGFuIGlzc3VlIGlmIGl0IApk
b2Vzbid0IGJlaGF2ZSBpbiBhIHNpbWlsYXIgd2F5IHRvIHdoYXQncyB0aGVyZSBhbHJlYWR5PwoK
PiBKYW1lcywgY291bGQgeW91IHNob3cgdGhlIG5lb3ZlcnNlIHdpdGggdGhlIGNtbiBQTVUgYmVo
YXZpb3IgZm9yIHBlcmYKPiByZWNvcmQgb2YgImN5Y2xlczpwcCIgZHVlIHRvIHNlbnNpdGl2aXRp
ZXMgdGhlcmUuCj4gCgpZZXAgSSBjYW4gY2hlY2sgdGhpcyBvbiBNb25kYXkuCgo+IFRoYW5rcywK
PiBJYW4KPiAKCgo+IAo+IAo+IAo+PiBJYW4gUm9nZXJzICg0KToKPj4gICAgcGVyZiBldnNlbDog
QWRkIHBtdV9uYW1lIGhlbHBlcgo+PiAgICBwZXJmIHN0YXQ6IEZpeCBmaW5kX3N0YXQgZm9yIG1p
eGVkIGxlZ2FjeS9ub24tbGVnYWN5IGV2ZW50cwo+PiAgICBwZXJmIHJlY29yZDogU2tpcCBkb24n
dCBmYWlsIGZvciBldmVudHMgdGhhdCBkb24ndCBvcGVuCj4+ICAgIHBlcmYgcGFyc2UtZXZlbnRz
OiBSZWFwcGx5ICJQcmVmZXIgc3lzZnMvSlNPTiBoYXJkd2FyZSBldmVudHMgb3Zlcgo+PiAgICAg
IGxlZ2FjeSIKPj4KPj4gICB0b29scy9wZXJmL2J1aWx0aW4tcmVjb3JkLmMgICAgfCAyMiArKysr
KysrLS0tCj4+ICAgdG9vbHMvcGVyZi91dGlsL2V2c2VsLmMgICAgICAgIHwgMTAgKysrKysKPj4g
ICB0b29scy9wZXJmL3V0aWwvZXZzZWwuaCAgICAgICAgfCAgMSArCj4+ICAgdG9vbHMvcGVyZi91
dGlsL3BhcnNlLWV2ZW50cy5jIHwgMjYgKysrKysrKysrLS0tCj4+ICAgdG9vbHMvcGVyZi91dGls
L3BhcnNlLWV2ZW50cy5sIHwgNzYgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQo+
PiAgIHRvb2xzL3BlcmYvdXRpbC9wYXJzZS1ldmVudHMueSB8IDYwICsrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLQo+PiAgIHRvb2xzL3BlcmYvdXRpbC9wbXVzLmMgICAgICAgICB8IDIwICsrKysr
KystLQo+PiAgIHRvb2xzL3BlcmYvdXRpbC9zdGF0LXNoYWRvdy5jICB8ICAzICstCj4+ICAgOCBm
aWxlcyBjaGFuZ2VkLCAxNDUgaW5zZXJ0aW9ucygrKSwgNzMgZGVsZXRpb25zKC0pCj4+Cj4+IC0t
Cj4+IDIuNDcuMC4xNjMuZzEyMjZmNmQ4ZmEtZ29vZwo+PgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
