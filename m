Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FDDD597AA
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 22:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wy2kSVssHncDz4S/4PW+bt42vNyDg4Gs8QmToJ5rYU=; b=XCx5/v4uhxCeLT
	yxhk5mQCsb95FCSnm8jQufxrb78Z3F9g6vRGlBdvc447Rw0L+a3DqYHN6nr3A9db6UQRoy439B2ba
	VwOE4vHxjvjxCMbYoXsoYcqCNTPmwmGarUySgiD06UD2wDbBWnL/fe9Ziy/pZaxckB2JJmzH7CPe3
	gtqJNUs1y4xBkyty9VW/JH10hHW3K1dKpJcJ5pi1+eOpqPxzgpP/7w61bq0E3EBijTXBnI0koSmvQ
	repwDDt3+mgBw51kN0+3A+na3khE0eGrhAsj1aXdNRJopFcPbeyhN4mMu3qrbF97qzdyhTsluvalw
	GIjQ9x4GVZNRDIpAtZ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzJH-000000058dL-24Hk;
	Tue, 12 Nov 2024 22:24:31 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzJD-000000058bl-2uK3
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 22:24:30 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20ca03687fdso61275ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Nov 2024 14:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731450266; x=1732055066; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrbUWlz/10HI8HCWywPHxZR9oOzLRJKPdLGJRk3v8wY=;
        b=AFApxChcN33crCimCyfpEPV0gOAPtWQpmSjTG3ShiKQoXbliExkqAdJl8eVU4rMt+5
         1+HL7231REaKKGK0Vvvt8TmSZd8TAnHegAnFlryJKaPq1oy7kPsTDNEBaaxJmY0G1tZY
         IEPUgPmPdj+GYowzurT0EdoowRHm9wEXiYigpzhMAooiDwYCxjBczg3lC+8JboztIQzE
         9Q+X6B0lpDsqJ5qE2hq8xiGABp9s5Bp9O+crnJduq1f4Cp3QF5y4zRBpJbJTkNoonazI
         YUxIKRNAWi0L2eCTa4YMXyGYQi+FA8S6K0UDVjOzvJTI8eTX+6KTeRSV/ZDiKG+M849o
         9pWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731450266; x=1732055066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrbUWlz/10HI8HCWywPHxZR9oOzLRJKPdLGJRk3v8wY=;
        b=vRPVEZ7B4kUl7WFE3mMc1F/AdfnZD0xsbt8yQvZJOuw4Q6IxPu2UX6DOzgA5xs5oBd
         hNB8PSa2EyKkw3Jtx3Mz1TmbNfQfnU8wt9611nIgWhRoNgaDw2/iz1Y2Elsk/xWmOJ2L
         qwwbwqe8i+L7DwjZTSoB9wmyH+z6MK3nT6yUmrFi4SI2Zskh1dMBhML9dc9W33AUlFo8
         ME/yytzIw2uI5xQZMVEUyYD4FhEH0VwsBN6o6cFYSbnY7tzyy3U/j6A3G5mwPvM2wTbY
         EWXZsZh7R+eQIRXjDPYs3E5XrSAEzXxYHkKLaMAp+NaneYQJp3lEDZNO6b/uLYiwxouh
         /EUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3sAyfe6LTiyo9exssOj0R0KL7C0pneqg1c3cf2SSlG28iJhLZ2FANrlnltzqllMe3PJRw4vDaWlQZxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhfoxCoZ8cIdtThQiNTpNuK8dagQvrlONUkIZU3+EfZn2w1LtS
	ZU4dMMOb/UmMjVgLjK/GJzEn9/XPm/q9QaSqsDKBLE1NRRBs7qCQNclk8pkDkGI4zC9u+D7b6hy
	Dv93xqO8tGfaGpLzKW81WXbCfydfnSIaTZw1I
X-Gm-Gg: ASbGnctTdNFGg0iKgPWMeje0vGTvl9VPli9dpVsv8rQifvnsS1U4MwNQqvNUYjO1QqM
	koIxt33dBMAzMOViq2MsH2mVU2YpnU7Ux/4UhtLsud/J2yEKlnOoOrpMSoYQUBcM=
X-Google-Smtp-Source: AGHT+IHVjOXDPek3bTfzpcjqhyl6dO+VgXJqAYZyQMTiOm5YzMnjDVAcfOTw1GP054zeGixwaVYPsd6ThcCJdKkbUoY=
X-Received: by 2002:a17:903:2449:b0:20b:81bb:4a81 with SMTP id
 d9443c01a7336-211b70725d1mr132885ad.7.1731450266232; Tue, 12 Nov 2024
 14:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20241026121758.143259-1-irogers@google.com> <20241026121758.143259-4-irogers@google.com>
 <20241112195343.GA404636@e132581.arm.com>
In-Reply-To: <20241112195343.GA404636@e132581.arm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 12 Nov 2024 14:24:15 -0800
Message-ID: <CAP-5=fXuyZbn3Jiq=RQaLTqybgji50Ko8jrpsinFqo+OOPBeRw@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] perf record: Skip don't fail for events that don't open
To: Leo Yan <leo.yan@arm.com>
Cc: Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org, 
	beeman@rivosinc.com, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	James Clark <james.clark@linaro.org>, Ze Gao <zegao2021@gmail.com>, 
	Weilin Wang <weilin.wang@intel.com>, Ben Gainey <ben.gainey@arm.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Junhao He <hejunhao3@huawei.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_142427_855249_FEE49F2C 
X-CRM114-Status: GOOD (  22.62  )
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

T24gVHVlLCBOb3YgMTIsIDIwMjQgYXQgMTE6NTPigK9BTSBMZW8gWWFuIDxsZW8ueWFuQGFybS5j
b20+IHdyb3RlOgo+Cj4gT24gU2F0LCBPY3QgMjYsIDIwMjQgYXQgMDU6MTc6NTdBTSAtMDcwMCwg
SWFuIFJvZ2VycyB3cm90ZToKPiA+Cj4gPiBXaGlsc3QgZm9yIG1hbnkgdG9vbHMgaXQgaXMgYW4g
ZXhwZWN0ZWQgYmVoYXZpb3IgdGhhdCBmYWlsdXJlIHRvIG9wZW4KPiA+IGEgcGVyZiBldmVudCBp
cyBhIGZhaWx1cmUsIEFSTSBkZWNpZGVkIHRvIG5hbWUgUE1VIGV2ZW50cyB0aGUgc2FtZSBhcwo+
ID4gbGVnYWN5IGV2ZW50cyBhbmQgdGhlbiBmYWlsZWQgdG8gcmVuYW1lIHN1Y2ggZXZlbnRzIG9u
IGEgc2VydmVyIHVuY29yZQo+ID4gU0xDIFBNVS4gQXMgcGVyZidzIGRlZmF1bHQgYmVoYXZpb3Ig
d2hlbiBubyBQTVUgaXMgc3BlY2lmaWVkIGlzIHRvCj4gPiBvcGVuIHRoZSBldmVudCBvbiBhbGwg
UE1VcyB0aGF0IGFkdmVydGlzZS8iaGF2ZSIgdGhlIGV2ZW50LCB0aGlzCj4gPiB5aWVsZGVkIGZh
aWx1cmVzIHdoZW4gdHJ5aW5nIHRvIG1ha2UgdGhlIHByaW9yaXR5IG9mIGxlZ2FjeSBhbmQKPiA+
IHN5c2ZzL2pzb24gZXZlbnRzIHVuaWZvcm0gLSBzb21ldGhpbmcgcmVxdWVzdGVkIGJ5IFJJU0Mt
ViBhbmQgQVJNLiBBCj4gPiBsZWdhY3kgZXZlbnQgdXNlciBvbiBBUk0gaGFyZHdhcmUgbWF5IGZp
bmQgdGhlaXIgZXZlbnQgb3BlbmVkIG9uIGFuCj4gPiB1bmNvcmUgUE1VIHdoaWNoIGZvciBwZXJm
IHJlY29yZCB3aWxsIGZhaWwuIEFybmFsZG8gc3VnZ2VzdGVkIHNraXBwaW5nCj4gPiBzdWNoIGV2
ZW50cyB3aGljaCB0aGlzIHBhdGNoIGltcGxlbWVudHMuIFJhdGhlciB0aGFuIGhhdmUgdGhlIHNr
aXBwaW5nCj4gPiBjb25kaXRpb25hbCBvbiBydW5uaW5nIG9uIEFSTSwgdGhlIHNraXBwaW5nIGlz
IGRvbmUgb24gYWxsCj4gPiBhcmNoaXRlY3R1cmVzIGFzIHN1Y2ggYSBmdW5kYW1lbnRhbCBiZWhh
dmlvcmFsIGRpZmZlcmVuY2UgY291bGQgbGVhZAo+ID4gdG8gcHJvYmxlbXMgd2l0aCB0b29scyBi
dWlsdC9kZXBlbmRpbmcgb24gcGVyZi4KPiA+Cj4gPiBBbiBleGFtcGxlIG9mIHBlcmYgcmVjb3Jk
IGZhaWxpbmcgdG8gb3BlbiBldmVudHMgb24geDg2IGlzOgo+ID4gYGBgCj4gPiAkIHBlcmYgcmVj
b3JkIC1lIGRhdGFfcmVhZCxjeWNsZXMsTExDLXByZWZldGNoLXJlYWQgLWEgc2xlZXAgMC4xCj4g
PiBFcnJvcjoKPiA+IEZhaWx1cmUgdG8gb3BlbiBldmVudCAnZGF0YV9yZWFkJyBvbiBQTVUgJ3Vu
Y29yZV9pbWNfZnJlZV9ydW5uaW5nXzAnIHdoaWNoIHdpbGwgYmUgcmVtb3ZlZC4KPiA+IFRoZSBz
eXNfcGVyZl9ldmVudF9vcGVuKCkgc3lzY2FsbCByZXR1cm5lZCB3aXRoIDIyIChJbnZhbGlkIGFy
Z3VtZW50KSBmb3IgZXZlbnQgKGRhdGFfcmVhZCkuCj4gPiAiZG1lc2cgfCBncmVwIC1pIHBlcmYi
IG1heSBwcm92aWRlIGFkZGl0aW9uYWwgaW5mb3JtYXRpb24uCj4gPgo+ID4gRXJyb3I6Cj4gPiBG
YWlsdXJlIHRvIG9wZW4gZXZlbnQgJ2RhdGFfcmVhZCcgb24gUE1VICd1bmNvcmVfaW1jX2ZyZWVf
cnVubmluZ18xJyB3aGljaCB3aWxsIGJlIHJlbW92ZWQuCj4gPiBUaGUgc3lzX3BlcmZfZXZlbnRf
b3BlbigpIHN5c2NhbGwgcmV0dXJuZWQgd2l0aCAyMiAoSW52YWxpZCBhcmd1bWVudCkgZm9yIGV2
ZW50IChkYXRhX3JlYWQpLgo+ID4gImRtZXNnIHwgZ3JlcCAtaSBwZXJmIiBtYXkgcHJvdmlkZSBh
ZGRpdGlvbmFsIGluZm9ybWF0aW9uLgo+ID4KPiA+IEVycm9yOgo+ID4gRmFpbHVyZSB0byBvcGVu
IGV2ZW50ICdMTEMtcHJlZmV0Y2gtcmVhZCcgb24gUE1VICdjcHUnIHdoaWNoIHdpbGwgYmUgcmVt
b3ZlZC4KPiA+IFRoZSBMTEMtcHJlZmV0Y2gtcmVhZCBldmVudCBpcyBub3Qgc3VwcG9ydGVkLgo+
ID4gWyBwZXJmIHJlY29yZDogV29rZW4gdXAgMSB0aW1lcyB0byB3cml0ZSBkYXRhIF0KPiA+IFsg
cGVyZiByZWNvcmQ6IENhcHR1cmVkIGFuZCB3cm90ZSAyLjE4OCBNQiBwZXJmLmRhdGEgKDg3IHNh
bXBsZXMpIF0KPiA+Cj4gPiAkIHBlcmYgcmVwb3J0IC0tc3RhdHMKPiA+IEFnZ3JlZ2F0ZWQgc3Rh
dHM6Cj4gPiAgICAgICAgICAgICAgICBUT1RBTCBldmVudHM6ICAgICAgMTcyNTUKPiA+ICAgICAg
ICAgICAgICAgICBNTUFQIGV2ZW50czogICAgICAgIDI4NCAgKCAxLjYlKQo+ID4gICAgICAgICAg
ICAgICAgIENPTU0gZXZlbnRzOiAgICAgICAxOTYxICAoMTEuNCUpCj4gPiAgICAgICAgICAgICAg
ICAgRVhJVCBldmVudHM6ICAgICAgICAgIDEgICggMC4wJSkKPiA+ICAgICAgICAgICAgICAgICBG
T1JLIGV2ZW50czogICAgICAgMTk2MCAgKDExLjQlKQo+ID4gICAgICAgICAgICAgICBTQU1QTEUg
ZXZlbnRzOiAgICAgICAgIDg3ICAoIDAuNSUpCj4gPiAgICAgICAgICAgICAgICBNTUFQMiBldmVu
dHM6ICAgICAgMTI4MzYgICg3NC40JSkKPiA+ICAgICAgICAgICAgICBLU1lNQk9MIGV2ZW50czog
ICAgICAgICA4MyAgKCAwLjUlKQo+ID4gICAgICAgICAgICBCUEZfRVZFTlQgZXZlbnRzOiAgICAg
ICAgIDM2ICAoIDAuMiUpCj4gPiAgICAgICBGSU5JU0hFRF9ST1VORCBldmVudHM6ICAgICAgICAg
IDIgICggMC4wJSkKPiA+ICAgICAgICAgICAgIElEX0lOREVYIGV2ZW50czogICAgICAgICAgMSAg
KCAwLjAlKQo+ID4gICAgICAgICAgIFRIUkVBRF9NQVAgZXZlbnRzOiAgICAgICAgICAxICAoIDAu
MCUpCj4gPiAgICAgICAgICAgICAgQ1BVX01BUCBldmVudHM6ICAgICAgICAgIDEgICggMC4wJSkK
PiA+ICAgICAgICAgICAgVElNRV9DT05WIGV2ZW50czogICAgICAgICAgMSAgKCAwLjAlKQo+ID4g
ICAgICAgIEZJTklTSEVEX0lOSVQgZXZlbnRzOiAgICAgICAgICAxICAoIDAuMCUpCj4gPiBjeWNs
ZXMgc3RhdHM6Cj4gPiAgICAgICAgICAgICAgIFNBTVBMRSBldmVudHM6ICAgICAgICAgODcKPiA+
IGBgYAo+Cj4gVGhhbmtzIGZvciBKYW1lcyByZW1pbmRpbmcgbWUuICBUZXN0ZWQgb24gQVZBIHBs
YXRmb3JtOgo+Cj4gIyB0cmVlIC9zeXMvYnVzL2V2ZW50X3NvdXJjZS9kZXZpY2VzL2FybV9kc3Vf
Ki9ldmVudHMKPiAgIC4uLgo+ICAgL3N5cy9idXMvZXZlbnRfc291cmNlL2RldmljZXMvYXJtX2Rz
dV85L2V2ZW50cwo+ICAg4pSc4pSA4pSAIGJ1c19hY2Nlc3MKPiAgIOKUnOKUgOKUgCBidXNfY3lj
bGVzCj4gICDilJzilIDilIAgY3ljbGVzCj4gICDilJzilIDilIAgbDNkX2NhY2hlCj4gICDilJzi
lIDilIAgbDNkX2NhY2hlX2FsbG9jYXRlCj4gICDilJzilIDilIAgbDNkX2NhY2hlX3JlZmlsbAo+
ICAg4pSc4pSA4pSAIGwzZF9jYWNoZV93Ygo+ICAg4pSU4pSA4pSAIG1lbW9yeV9lcnJvcgo+Cj4g
IyAuL3BlcmYgcmVjb3JkIC0tIHNsZWVwIDAuMQo+ICBFcnJvcjoKPiAgRmFpbHVyZSB0byBvcGVu
IGV2ZW50ICdjeWNsZXM6UEgnIG9uIFBNVSAnYXJtX2RzdV8wJyB3aGljaCB3aWxsIGJlCj4gIHJl
bW92ZWQuCj4gIGN5Y2xlczpQSDogUE1VIEhhcmR3YXJlIGRvZXNuJ3Qgc3VwcG9ydCBzYW1wbGlu
Zy9vdmVyZmxvdy1pbnRlcnJ1cHRzLgo+ICBUcnkgJ3BlcmYgc3RhdCcKPiAgRXJyb3I6Cj4gIEZh
aWx1cmUgdG8gb3BlbiBldmVudCAnY3ljbGVzOlBIJyBvbiBQTVUgJ2FybV9kc3VfMScgd2hpY2gg
d2lsbCBiZQo+ICByZW1vdmVkLgo+ICBjeWNsZXM6UEg6IFBNVSBIYXJkd2FyZSBkb2Vzbid0IHN1
cHBvcnQgc2FtcGxpbmcvb3ZlcmZsb3ctaW50ZXJydXB0cy4KPiAgVHJ5ICdwZXJmIHN0YXQnCj4g
IC4uLgo+ICBFcnJvcjoKPiAgRmFpbHVyZSB0byBvcGVuIGV2ZW50ICdjeWNsZXM6UEgnIG9uIFBN
VSAnYXJtX2RzdV8xNScgd2hpY2ggd2lsbCBiZQo+ICByZW1vdmVkLgo+ICBjeWNsZXM6UEg6IFBN
VSBIYXJkd2FyZSBkb2Vzbid0IHN1cHBvcnQgc2FtcGxpbmcvb3ZlcmZsb3ctaW50ZXJydXB0cy4K
PiAgVHJ5ICdwZXJmIHN0YXQnCj4gIFsgcGVyZiByZWNvcmQ6IFdva2VuIHVwIDEgdGltZXMgdG8g
d3JpdGUgZGF0YSBdCj4gIFsgcGVyZiByZWNvcmQ6IENhcHR1cmVkIGFuZCB3cm90ZSAwLjAwOCBN
QiBwZXJmLmRhdGEgKDggc2FtcGxlcykgXQo+Cj4gIyAuL3BlcmYgcmVwb3J0IC0tc3RhdHMKPgo+
ICBBZ2dyZWdhdGVkIHN0YXRzOgo+ICAgICAgICAgICAgICAgICBUT1RBTCBldmVudHM6ICAgICAg
ICAgNjcKPiAgICAgICAgICAgICAgICAgIE1NQVAgZXZlbnRzOiAgICAgICAgIDQwICAoNTkuNyUp
Cj4gICAgICAgICAgICAgICAgICBDT01NIGV2ZW50czogICAgICAgICAgMSAgKCAxLjUlKQo+ICAg
ICAgICAgICAgICAgIFNBTVBMRSBldmVudHM6ICAgICAgICAgIDggICgxMS45JSkKPiAgICAgICAg
ICAgICAgIEtTWU1CT0wgZXZlbnRzOiAgICAgICAgICA2ICAoIDkuMCUpCj4gICAgICAgICAgICAg
QlBGX0VWRU5UIGV2ZW50czogICAgICAgICAgNiAgKCA5LjAlKQo+ICAgICAgICBGSU5JU0hFRF9S
T1VORCBldmVudHM6ICAgICAgICAgIDEgICggMS41JSkKPiAgICAgICAgICAgICAgSURfSU5ERVgg
ZXZlbnRzOiAgICAgICAgICAxICAoIDEuNSUpCj4gICAgICAgICAgICBUSFJFQURfTUFQIGV2ZW50
czogICAgICAgICAgMSAgKCAxLjUlKQo+ICAgICAgICAgICAgICAgQ1BVX01BUCBldmVudHM6ICAg
ICAgICAgIDEgICggMS41JSkKPiAgICAgICAgICAgICBUSU1FX0NPTlYgZXZlbnRzOiAgICAgICAg
ICAxICAoIDEuNSUpCj4gICAgICAgICBGSU5JU0hFRF9JTklUIGV2ZW50czogICAgICAgICAgMSAg
KCAxLjUlKQo+ICBjeWNsZXM6UCBzdGF0czoKPiAgICAgICAgICAgICAgICBTQU1QTEUgZXZlbnRz
OiAgICAgICAgICA4Cj4KPiAjIC4vcGVyZiBzdGF0IC0tIHNsZWVwIDAuMQo+Cj4gIFBlcmZvcm1h
bmNlIGNvdW50ZXIgc3RhdHMgZm9yICdzbGVlcCAwLjEnOgo+Cj4gICAgICAgICAgICAgICAwLjg3
IG1zZWMgdGFzay1jbG9jayAgICAgICAgICAgICAgICAgICAgICAgIyAgICAwLjAwOSBDUFVzIHV0
aWxpemVkCj4gICAgICAgICAgICAgICAgICAxICAgICAgY29udGV4dC1zd2l0Y2hlcyAgICAgICAg
ICAgICAgICAgIyAgICAxLjE0OCBLL3NlYwo+ICAgICAgICAgICAgICAgICAgMCAgICAgIGNwdS1t
aWdyYXRpb25zICAgICAgICAgICAgICAgICAgICMgICAgMC4wMDAgL3NlYwo+ICAgICAgICAgICAg
ICAgICA1MiAgICAgIHBhZ2UtZmF1bHRzICAgICAgICAgICAgICAgICAgICAgICMgICA1OS42ODUg
Sy9zZWMKPiAgICAgICAgICAgIDg3Nyw4MzUgICAgICBpbnN0cnVjdGlvbnMgICAgICAgICAgICAg
ICAgICAgICAjICAgIDEuMTQgIGluc24gcGVyIGN5Y2xlCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjICAgIDAuMjUgIHN0YWxsZWQgY3ljbGVzIHBl
ciBpbnNuCj4gICAgICAgICAgICA3NzIsMTAyICAgICAgY3ljbGVzICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIyAgODg2LjIxMCBNL3NlYwo+ICAgICAgICAgICAgMTkxLDkxNCAgICAgIHN0YWxs
ZWQtY3ljbGVzLWZyb250ZW5kICAgICAgICAgICMgICAyNC44NiUgZnJvbnRlbmQgY3ljbGVzIGlk
bGUKPiAgICAgICAgICAgIDIxOSwxODMgICAgICBzdGFsbGVkLWN5Y2xlcy1iYWNrZW5kICAgICAg
ICAgICAjICAgMjguMzklIGJhY2tlbmQgY3ljbGVzIGlkbGUKPiAgICAgICAgICAgIDE4NCwwOTkg
ICAgICBicmFuY2hlcyAgICAgICAgICAgICAgICAgICAgICAgICAjICAyMTEuMzA3IE0vc2VjCj4g
ICAgICAgICAgICAgIDgsNTQ4ICAgICAgYnJhbmNoLW1pc3NlcyAgICAgICAgICAgICAgICAgICAg
IyAgICA0LjY0JSBvZiBhbGwgYnJhbmNoZXMKPgo+ICAgICAgICAwLjEwMTYyMzUyOSBzZWNvbmRz
IHRpbWUgZWxhcHNlZAo+Cj4gICAgICAgIDAuMDAxNjQ1MDAwIHNlY29uZHMgdXNlcgo+ICAgICAg
ICAwLjAwMDAwMDAwMCBzZWNvbmRzIHN5cwo+Cj4gVGVzdGVkLWJ5OiBMZW8gWWFuIDxsZW8ueWFu
QGFybS5jb20+CgpUaGFua3MgTGVvISBBcyB0aGUgVGVzdGVkLWJ5IG1ha2VzIHNlbnNlIG9ubHkg
aWYgeW91J3ZlIGFwcGxpZWQgYWxsIDQKcGF0Y2hlcywgd2hpY2ggeW91ciB0ZXN0aW5nIGFuZCBK
YW1lcycgdGVzdGluZyBzaG93cyB5b3UndmUgYm90aCBkb25lLApJJ2xsIGFkZCB0aGUgdGFncyB0
byBhbGwgNCBwYXRjaGVzLiBJJ2xsIGRvIGxpa2V3aXNlIHdpdGggQXRpc2gsCnJlYmFzZSBhbmQg
cmVzZW5kIHRoZSBwYXRjaGVzLgoKVGhhbmtzLApJYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
