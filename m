Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C43D42B85
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 14:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hPtNsdmFSkpsFNtOY8QXZvhtnaW8WGBZMMb/nIDmy/c=; b=w2AeAKAyNnWb73
	VAI4Bz/7UY6P0l0T0+ZW9Z9Fp16pRManbZC7JYsZKhb+ORc9AGk8r0Amh9x309OHng5/CGUlBqJac
	vr+rAEPSACcEGBpplVcqMgwXGcV5JKVUQBZ3y4rqsoZSVxP7n+XZKaqf1U/iHGSe5CYanRa2hxNcl
	WVwPLOFK9bB3Twlme40JMo7VkkwjKGVfkT/yTYZMer3sZ/6g3DzqpwxdgOILuwSljz4CclMbqB9iG
	qUVugjjV9LJMf8ptojlBPQuDopZO32XSplJIzEcECI1aibalIscixX/AYOBbi3C/Jz1NotngCo5b0
	gVBY2SqqW3SyJs3qfehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tArmS-00000003jOL-0QV3;
	Tue, 12 Nov 2024 14:22:08 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tArmO-00000003jMj-1XuR
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 14:22:06 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a9ec86a67feso988650766b.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Nov 2024 06:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731421322; x=1732026122; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=49JuiSy/r9JLkYwGyXAh5iEnbRjgdRPZ+au2eZbNRrI=;
        b=r6fq/oY4f5SiP5xs3Rx7rOxmEtsKhM1575LsJ6Ld8vB/LlWCnwxNNcW96FcdJEKwzz
         HE4X9hRLEiAUQGzMJCUpIAPtAHOs5qqb6Jql+tDQILWVey01jsigtb53Lo/VVMWWKyeK
         jIp3TfaCEOYts3DqCSIG/ZST4kh5oEjzhYAQ6MRYfflFCrVHowXwgSQJMgCz/psHAfEP
         CTxMfxYhPHPlaoagr0f+EqKK/1vt1idmgVHUAMIq5kX9/JMo+Sp1uwTvcuMnU2+U6CKB
         fkSgzN7IBFx/ewa+q7E7ZafJX9UMbSoKQv+uTUCyZmgfyzjije/sOloHCunIAOJi40Sn
         RCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731421322; x=1732026122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=49JuiSy/r9JLkYwGyXAh5iEnbRjgdRPZ+au2eZbNRrI=;
        b=gmA+yIqsYPwmHruDxb3qMnCxmtqRK3++ewF1xWBCmzz4JzouNAJYrxjurBRbTxbaJQ
         5YmzGWyBEpKLKLDDm4P8JQ4lXWJkAoFmITfSZV6HrIT3Lo/OB91BHoM4ujJKUhpb1poC
         MtM9yv05DpQUax+Ov8xlMAgz9wEHHkrz5V8Ysd76DcorKujYw4miGfFLBg8j2lUApZtr
         /Eroz4C+rIjMbT5L7kYHNyIuGL8byW5O29s4VzYHJQCp+J/dPXnvFGRP+C7Qntv/u0WK
         +jVR6komq1Qfeurkkkvo0fzDZdDLp5j8Ht/zTbRGAMf4KtY76TdQoy0XPqiz+8l4sqW4
         PilA==
X-Forwarded-Encrypted: i=1; AJvYcCWPbxdt7XVZ6wcXwxmum8RrqzlWWZa4mkzuI42by2J0EIixqM2rNpqz3eEV/Q9DvQWYuyoG+wIorH2ONA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHrPeVoCmY0WxbZO0cUxmMXyAc534DIJ80kADRGgyOsQSBbP4f
	QCrx3ejXiLKWT1Cno2NtWPIcp7gsUdJA03GfJ5/9M+b9Gw84psR+LAr+97j6v6I=
X-Google-Smtp-Source: AGHT+IETG01+m8sMSTYwKq7b6sSqzvzRvRFfCsmVZ8PvUWed37xWW7mS4gNJ68o4jFFPFcrEK3vkmw==
X-Received: by 2002:a17:907:7f28:b0:a9a:825:4c39 with SMTP id a640c23a62f3a-a9eeff0daacmr1578407566b.20.1731421321912;
        Tue, 12 Nov 2024 06:22:01 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a18539sm734101166b.27.2024.11.12.06.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 06:22:01 -0800 (PST)
Message-ID: <ccac5d65-b01f-4624-97cd-e350ce6de840@linaro.org>
Date: Tue, 12 Nov 2024 14:21:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] Prefer sysfs/JSON events also when no PMU is
 provided
To: Ian Rogers <irogers@google.com>, Atish Kumar Patra <atishp@rivosinc.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ben Gainey <ben.gainey@arm.com>, Junhao He <hejunhao3@huawei.com>,
 linux-riscv@lists.infradead.org, beeman@rivosinc.com,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Olsa <jolsa@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Kan Liang <kan.liang@linux.intel.com>, Ze Gao <zegao2021@gmail.com>,
 Weilin Wang <weilin.wang@intel.com>,
 Dominique Martinet <asmadeus@codewreck.org>
References: <20241026121758.143259-1-irogers@google.com>
 <CAP-5=fXf9HtqKZyvfXNbKLTB-dL_Ax5Hd0_Gn1J-y0T1SE9wLQ@mail.gmail.com>
 <78eb729c-7594-460f-9d79-97fb683d8b5e@linaro.org>
 <CAHBxVyFXWpczMmWJbpWoLUjQ4nfNC2_h1yZqSd7kSr6N8Rvm5Q@mail.gmail.com>
 <d9bfd75a-003a-4f65-abba-b8bcaad13682@linaro.org>
 <CAP-5=fUHjxL5QbsyQQU-3EYiVhiO6wt=F5MfSfDcAffKP7WWAg@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fUHjxL5QbsyQQU-3EYiVhiO6wt=F5MfSfDcAffKP7WWAg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_062204_423776_AEC91A72 
X-CRM114-Status: GOOD (  47.92  )
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

CgpPbiAxMS8xMS8yMDI0IDU6MTkgcG0sIElhbiBSb2dlcnMgd3JvdGU6Cj4gT24gTW9uLCBOb3Yg
MTEsIDIwMjQgYXQgMjo0NeKAr0FNIEphbWVzIENsYXJrIDxqYW1lcy5jbGFya0BsaW5hcm8ub3Jn
PiB3cm90ZToKPj4KPj4KPj4KPj4gT24gMDgvMTEvMjAyNCA2OjM3IHBtLCBBdGlzaCBLdW1hciBQ
YXRyYSB3cm90ZToKPj4+IE9uIEZyaSwgTm92IDgsIDIwMjQgYXQgNDoxNuKAr0FNIEphbWVzIENs
YXJrIDxqYW1lcy5jbGFya0BsaW5hcm8ub3JnPiB3cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4KPj4+PiBP
biAwNy8xMS8yMDI0IDE4OjUxLCBJYW4gUm9nZXJzIHdyb3RlOgo+Pj4+PiBPbiBTYXQsIE9jdCAy
NiwgMjAyNCBhdCA1OjE44oCvQU0gSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPiB3cm90
ZToKPj4+Pj4+Cj4+Pj4+PiBBdCB0aGUgUklTQy1WIHN1bW1pdCB0aGUgdG9waWMgb2YgYXZvaWRp
bmcgZXZlbnQgZGF0YSBiZWluZyBpbiB0aGUKPj4+Pj4+IFJJU0MtViBQTVUga2VybmVsIGRyaXZl
ciBjYW1lIHVwLiBUaGVyZSBpcyBhIHByZWZlcmVuY2UgZm9yIHN5c2ZzL0pTT04KPj4+Pj4+IGV2
ZW50cyBiZWluZyB0aGUgcHJpb3JpdHkgd2hlbiBubyBQTVUgaXMgcHJvdmlkZWQgc28gdGhhdCBs
ZWdhY3kKPj4+Pj4+IGV2ZW50cyBtYXliZSBzdXBwb3J0ZWQgdmlhIGpzb24uIE9yaWdpbmFsbHkg
TWFyayBSdXRsYW5kIGFsc28KPj4+Pj4+IGV4cHJlc3NlZCBhdCBMUEMgMjAyMyB0aGF0IGRvaW5n
IHRoaXMgd291bGQgcmVzb2x2ZSBidWdzIG9uIEFSTSBBcHBsZQo+Pj4+Pj4gTT8gcHJvY2Vzc29y
cywgYnV0IEphbWVzIENsYXJrIG1vcmUgcmVjZW50bHkgdGVzdGVkIHRoaXMgYW5kIGJlbGlldmVz
Cj4+Pj4+PiB0aGUgZHJpdmVyIGlzc3VlcyB0aGVyZSBtYXkgbm90IGhhdmUgZXhpc3RlZCBvciBo
YXZlIGJlZW4gcmVzb2x2ZWQuIEluCj4+Pj4+PiBhbnkgY2FzZSwgaXQgaXMgaW5jb25zaXN0ZW50
IHRoYXQgd2l0aCBhIFBNVSBldmVudCBuYW1lcyBhdm9pZCBsZWdhY3kKPj4+Pj4+IGVuY29kaW5n
cywgYnV0IHdoZW4gd2lsZGNhcmRpbmcgUE1VcyAoaWUgd2l0aG91dCBhIFBNVSB3aXRoIHRoZSBl
dmVudAo+Pj4+Pj4gbmFtZSkgdGhlIGxlZ2FjeSBlbmNvZGluZ3MgaGF2ZSBwcmlvcml0eS4KPj4+
Pj4+Cj4+Pj4+PiBUaGUgcGF0Y2ggZG9pbmcgdGhpcyB3b3JrIHdhcyByZXZlcnRlZCBpbiBhIHY2
LjEwIHJlbGVhc2UgY2FuZGlkYXRlCj4+Pj4+PiBhcywgZXZlbiB0aG91Z2ggdGhlIHBhdGNoIHdh
cyBwb3N0ZWQgZm9yIHdlZWtzIGFuZCBoYWQgYmVlbiBvbgo+Pj4+Pj4gbGludXgtbmV4dCBmb3Ig
d2Vla3Mgd2l0aG91dCBpc3N1ZSwgTGludXMgd2FzIGluIHRoZSBoYWJpdCBvZiB1c2luZwo+Pj4+
Pj4gZXhwbGljaXQgbGVnYWN5IGV2ZW50cyB3aXRoIHVuc3VwcG9ydGVkIHByZWNpc2lvbiBvcHRp
b25zIG9uIGhpcwo+Pj4+Pj4gTmVvdmVyc2UtTjEuIFRoaXMgbWFjaGluZSBoYXMgU0xDIFBNVSBl
dmVudHMgZm9yIGJ1cyBhbmQgQ1BVIGN5Y2xlcwo+Pj4+Pj4gd2hlcmUgQVJNIGRlY2lkZWQgdG8g
Y2FsbCB0aGUgZXZlbnRzIGJ1c19jeWNsZXMgYW5kIGN5Y2xlcywgdGhlIGxhdHRlcgo+Pj4+Pj4g
YmVpbmcgYWxzbyBhIGxlZ2FjeSBldmVudCBuYW1lLiBBUk0gaGF2ZW4ndCByZW5hbWVkIHRoZSBj
eWNsZXMgZXZlbnQKPj4+Pj4+IHRvIGEgbW9yZSBjb25zaXN0ZW50IGNwdV9jeWNsZXMgYW5kIGF2
b2lkZWQgdGhlIHByb2JsZW0uIFdpdGggdGhlc2UKPj4+Pj4+IGNoYW5nZXMgdGhlIHByb2JsZW1h
dGljIGV2ZW50IHdpbGwgbm93IGJlIHNraXBwZWQsIGEgbGFyZ2Ugd2FybmluZwo+Pj4+Pj4gcHJv
ZHVjZWQsIGFuZCBwZXJmIHJlY29yZCB3aWxsIGNvbnRpbnVlIGZvciB0aGUgb3RoZXIgUE1VIGV2
ZW50cy4gVGhpcwo+Pj4+Pj4gc29sdXRpb24gd2FzIHByb3Bvc2VkIGJ5IEFybmFsZG8uCj4+Pj4+
Pgo+Pj4+Pj4gVHdvIG1pbm9yIGNoYW5nZXMgaGF2ZSBiZWVuIGFkZGVkIHRvIGhlbHAgd2l0aCB0
aGUgZXJyb3IgbWVzc2FnZSBhbmQKPj4+Pj4+IHRvIHdvcmsgYXJvdW5kIGlzc3VlcyBvY2N1cnJp
bmcgd2l0aCAicGVyZiBzdGF0IG1ldHJpY3MgKHNoYWRvdyBzdGF0KQo+Pj4+Pj4gdGVzdCIuCj4+
Pj4+Pgo+Pj4+Pj4gVGhlIHBhdGNoZXMgaGF2ZSBvbmx5IGJlZW4gdGVzdGVkIG9uIG15IHg4NiBu
b24taHlicmlkIGxhcHRvcC4KPj4+Pj4KPj4+Pj4gSGkgQXRpc2ggYW5kIEphbWVzLAo+Pj4+Pgo+
Pj4+PiBDb3VsZCBJIGdldCB5b3VyIHRhZ3MgZm9yIHRoaXMgc2VyaWVzPwo+Pj4+Pgo+Pj4KPj4+
IEhpIElhbiwKPj4+IFRoYW5rcyBmb3IgeW91ciBwYXRjaGVzLiBJdCBkZWZpbml0ZWx5IGhlbHBz
IHRvIGhhdmUgYSBjbGVhbiBzbGF0ZQo+Pj4gaW1wbGVtZW50YXRpb24KPj4+IGZvciB0aGUgcGVy
ZiB0b29sLiBIb3dldmVyLCBJIGhhdmUgc29tZSBvcGVuIHF1ZXN0aW9ucyBhYm91dCBvdGhlciB1
c2UgY2FzZXMKPj4+IHRoYXQgd2UgZGlzY3Vzc2VkIGR1cmluZyB0aGUgUlZJIFN1bW1pdC4KPj4+
Cj4+Pj4+IFRoZSBwYXRjaGVzIHdlcmUgb3JpZ2luYWxseSBtb3RpdmF0ZWQgYnkgd2FudGluZyB0
byBtYWtlIHRoZSBiZWhhdmlvcgo+Pj4+PiBvZiBldmVudHMgcGFyc2VkIGxpa2UgImN5Y2xlcyIg
bWF0Y2ggdGhhdCBvZiAiY3B1L2N5Y2xlcy8iLCB0aGUgUE1VIGlzCj4+Pj4+IHdpbGRjYXJkZWQg
dG8gImNwdSIgaW4gdGhlIGZpcnN0IGNhc2UuIFRoaXMgd2FzIGRpdmVyZ2VudCBiZWNhdXNlIG9m
Cj4+Pj4+IEFSTSB3ZSBzd2l0Y2hlZCBmcm9tIHByZWZlcnJpbmcgbGVnYWN5ICh0eXBlID0gUEVS
Rl9UWVBFX0hBUkRXQVJFLAo+Pj4+PiBjb25maWcgPSBQRVJGX0NPVU5UX0hXX0NQVV9DWUNMRVMp
IHRvIHN5c2ZzL2pzb24gKHR5cGU9PGNvcmUgUE1VJ3MKPj4+Pj4gdHlwZT4sIGNvbmZpZz08ZW5j
b2RpbmcgZnJvbSBldmVudD4pIHdoZW4gYSBQTVUgbmFtZSB3YXMgZ2l2ZW4uIFRoaXMKPj4+Pj4g
YWxpZ25zIHdpdGggUklTQy1WIHdhbnRpbmcgdG8gdXNlIGpzb24gZW5jb2RpbmdzIHRvIGF2b2lk
IGNvbXBsZXhpdHkKPj4+Pj4gaW4gdGhlIFBNVSBkcml2ZXIuCj4+Pj4+Cj4+Pj4KPj4+PiBJIGNv
dWxkbid0IGZpbmQgdGhlIHRocmVhZCwgYnV0IEkgcmVtZW1iZXIgZmFpcmx5IHJlY2VudGx5IGl0
IHdhcwo+Pj4+IG1lbnRpb25lZCB0aGF0IFJJU0MtViB3b3VsZCBiZSBzdXBwb3J0aW5nIHRoZSBs
ZWdhY3kgZXZlbnRzIGFmdGVyIGFsbCwKPj4+PiBtYXliZSBpdCB3YXMgYSBjb21tZW50IGZyb20g
QXRpc2g/IEknbSBub3Qgc3VyZSBpZiB0aGF0IGNoYW5nZXMgdGhlCj4+Pj4gcmVxdWlyZW1lbnRz
IGZvciB0aGlzIG9yIG5vdD8KPj4+Pgo+Pj4+IEkgc3RpbGwgY2FuJ3QgcmVhbGx5IGltYWdpbmUg
aG93IHRvb2xpbmcgd291bGQgd29yayBpZiBldmVyeSB0b29sIGhhcyB0bwo+Pj4+IG1haW50YWlu
IHRoZSBtYXBwaW5ncyBvZiBiYXNpYyBldmVudHMgbGlrZSBpbnN0cnVjdGlvbnMgYW5kIGJyYW5j
aGVzLgo+Pj4+IEZvciBleGFtcGxlIGFsbCB0aGUgcGVyZl9ldmVudF9vcGVuIHRlc3RzIGluIGx0
cCB1c2UgdGhlIGxlZ2FjeSBldmVudHMuCj4+Pj4KPj4+Cj4+PiBObyBpdCBoYXMgbm90IGNoYW5n
ZWQuIFdoaWxlIHRoaXMgc2VyaWVzIGhlbHBzIHRvIGF2b2lkIGNsdW5reSB2ZW5kb3IKPj4+IHNw
ZWNpZmljIGVuY29kaW5ncwo+Pj4gaW4gdGhlIGRyaXZlciBmb3IgcGVyZiB0b29sLCBJIGFtIHN0
aWxsIHVuc3VyZSBob3cgd2Ugd2lsbCBtYW5hZ2UKPj4+IG90aGVyIGFwcGxpY2F0aW9ucwo+Pj4g
KGRpcmVjdGx5IHBhc3NpbmcgbGVnYWN5IGV2ZW50cyB0aHJvdWdoIHBlcmZfZXZlbnRfb3BlbiBv
cgo+Pj4gcGVyZl9ldmxpc3RfX29wZW4pIHdpbGwgd29yay4KPj4+Cj4+PiBJIGhhdmUgb25seSBh
bmVjZG90YWwgZGF0YSBhYm91dCBmb2xrcyByZWx5aW5nIHBlcmYgbGVnYWN5IGV2ZW50cwo+Pj4g
ZGlyZWN0bHkgdG8gcHJvZmlsZQo+Pj4gdGhlaXIgYXBwbGljYXRpb24uIEFsbCBvZiB0aGVtIHVz
ZSBtb3N0bHkgY3ljbGUvaW5zdHJ1Y3Rpb24gZXZlbnRzIHRob3VnaC4KPj4+IEFyZSB0aGVyZSBh
bnkgdXNlcnMgd2hvIHVzZSBvdGhlciBsZWdhY3kgZXZlbnRzIGRpcmVjdGx5IHdpdGhvdXQgcGVy
ZiB0b29sID8KPj4+Cj4+PiBJZiBub3QsIHdlIG1heSBoYXZlIG9ubHkgY3ljbGUvaW5zdHJ1Y3Rp
b24gbWFwcGluZyBpbiB0aGUgZHJpdmVyIGFuZAo+Pj4gcmVseSBvbiBqc29uIGZvciBldmVyeXRo
aW5nIGVsc2UuCj4+PiBUaGUgb3RoZXIgdXNlIGNhc2UgaXMgdmlydHVhbGl6YXRpb24uIEkgaGF2
ZSBiZWVuIHBsYXlpbmcgd2l0aCB0aGVzZQo+Pj4gcGF0Y2hlcyB0byBmaW5kIGEgY2xlYW4gc29s
dXRpb24gdG8KPj4+IGVuYWJsZSBhbGwgdGhlIHVzZSBjYXNlcy4gSWYgeW91IGhhdmUgYW55IG90
aGVyIGlkZWFzLCBwbGVhc2UgbGV0IG1lIGtub3cuCj4+Pgo+Pgo+PiBZZWFoIEkgd291bGQgZXhw
ZWN0IGl0J3MgbW9zdGx5IGN5Y2xlcyBhbmQgaW5zdHJ1Y3Rpb25zLiBJIHNlYXJjaGVkIGEKPj4g
Yml0IGZvciBQRVJGX0NPVU5UX0hXX0JSQU5DSF9NSVNTRVMgYW5kIG9ubHkgZm91bmQgdG9vbC9k
ZXZlbG9wZXIgdHlwZQo+PiB1c2FnZXMsIHdoaWNoIEkgc3VwcG9zZSB3ZSBjb3VsZCBleHBlY3Qg
dG8gaGF2ZSB0byBoYW5kbGUgdGhlIG1hcHBpbmdzCj4+IGxpa2UgcGVyZi4gQWx0aG91Z2ggaXQn
cyBub3QgdGhlIGVhc2llc3QgdGhpbmcgdG8gc2VhcmNoIGZvciBhbmQKPj4gb2J2aW91c2x5IHRo
YXQgb25seSBpbmNsdWRlcyBvcGVuIHNvdXJjZS4KPj4KPj4gVXNhZ2VzIGRvIGV4aXN0IHRob3Vn
aCwgdGhlcmUgYXJlIHBlb3BsZSBwb3N0aW5nIG9uIHN0YWNrIG92ZXJmbG93IHVzaW5nCj4+IGl0
LCBhbmQgb3RoZXIgdmFyaW91cyBidWcgdHJhY2tlciBsaXN0aW5ncy4gU28geW91IHdvdWxkIGV4
cGVjdCB0aG9zZQo+PiBzYW1lIHVzZXJzIHRvIGhhdmUgdG8gdXNlIHJhdyBldmVudCBjb2RlcyBh
bmQgc29tZSBzd2l0Y2ggc3RhdGVtZW50IHRvCj4+IHBpY2sgdGhlIHJpZ2h0IG9uZSBmb3IgdGhl
aXIgaGFyZHdhcmUsIG9yIHVzZSBQZXJmLgo+IAo+IEkgZG9uJ3QgaGF2ZSBhbnkgbWFnaWMgdG8g
c29sdmUgdGhpcy4gTXkgdGhvdWdodHM6Cj4gCj4gMSkgSSB0aG91Z2h0IGxlZ2FjeSBldmVudHMg
d2VyZSBqdXN0IGdvaW5nIHRvIGhhbmcgYXJvdW5kIGZvcmV2ZXIsCj4gYWx0aG91Z2ggdGhlIG5h
bWUgaGludGluZyB0aGV5J2Qga2luZCBvZiBiZWVuIGRlcHJlY2F0ZWQuIEF0IExQQyAnMjMKPiBB
dGlzaCBhbmQgTWFyayBSdXRsYW5kIG9yaWdpbmFsbHkgYXNrZWQgZm9yIHRoZSBzeXNmcy9qc29u
IHRvIGJlIHRoZQo+IHByZWZlcmVuY2UuIEkgdGhvdWdodCBLYW4gd2FzIGdvaW5nIHRvIHB1c2gg
YmFjayBnaXZlbiB0aGUgdXBoZWF2YWwsCj4gZXNwZWNpYWxseSB1cGRhdGluZyBldmVyeSB0ZXN0
IGV4cGVjdGF0aW9uLiBJdCB3ZW50IHRocm91Z2ggYnV0IHdlJ3JlCj4gaW4gdGhpcyB3ZWlyZCBz
dGF0ZSB3aGVyZSB3aWxkY2FyZCBldmVudHMgYXJlIGVuY29kZWQgdXNpbmcgbGVnYWN5IGFuZAo+
IFBNVSBzcGVjaWZ5aW5nIGV2ZW50cyBhcmVuJ3QuIFdoYXQgdGhpcyBzZXJpZXMgaG9wZXMgdG8g
c29sdmUuCj4gCj4gMikgSSB0aGluayBpdCBpcyBpbXBvcnRhbnQgdGhhdCBwZXJmIHRvb2wgYmUg
YSByZWZlcmVuY2UKPiBpbXBsZW1lbnRhdGlvbiB3aGVyZSBvdGhlcnMgY2FuIGxvb2sgKHN0cmFj
ZSwgZXRjLikgdG8gYmFzZSB0aGVpcgo+IGltcGxlbWVudGF0aW9uLiBNb3ZpbmcgcGVyZiB0byBz
eXNmcy9qc29uIGlzIDEgc3RlcCBjbG9zZXIgdG8gbGVnYWN5Cj4gZXZlbnQgZGVwcmVjYXRpb24u
IFBsZWFzZSB5ZWxsIGlmIGRlcHJlY2F0aW9uIGlzbid0IHdoYXQgaXMgd2FudGVkIGFzCj4gcGVy
c29uYWxseSBvdGhlciB0aGFuIGNsZWFubGluZXNzIEkgZG9uJ3QgbWluZC4gSWYgd2UgZG8gZGVj
aWRlIG5vdCB0bwo+IGhhdmUgc3lzZnMvanNvbiBiZSB0aGUgcHJpb3JpdHkgdGhlbiBJIHRoaW5r
IGl0IHNlbnNpYmxlIHRvIHJldmVydCB0aGUKPiBjaGFuZ2VzIG1ha2luZyBpdCB0aGUgcHJpb3Jp
dHkgZm9yIGV2ZW50cyB0aGF0IHNwZWNpZnkgYSBQTVUuIEknZCBsaWtlCj4gc29tZSBsZXZlbCBv
ZiBjb25zaXN0ZW5jeS4KClBlcnNvbmFsbHkgdGhpcyBjaGFuZ2UgZmVlbHMgbGlrZSBpdCdzIGVu
Y291cmFnaW5nIGZyYWdtZW50YXRpb24sIHRoZSAKY2xlYW5lc3Qgd291bGQgYmUgaWYgUklTQy1W
IHN1cHBvcnRzIHRoZSBsZWdhY3kgZXZlbnRzIGxpa2UgdGhlIG90aGVyIApwbGF0Zm9ybXMuIEl0
J3Mgbm90IGEgaHVnZSBzZXQgb2YgZXZlbnRzIGFueXdheSwgYW5kIHRoZW4gZXhpc3RpbmcgCnNv
ZnR3YXJlIGNvbnRpbnVlcyB0byB3b3JrIGluIGFkZGl0aW9uIHRvIFBlcmYgY29udGludWluZyB0
byB3b3JrLgoKSWYgd2UncmUgc3RpbGwgdGhpbmtpbmcgdGhhdCBSSVNDLVYgd2lsbCBzdXBwb3J0
IHRoZSBsZWdhY3kgZXZlbnRzIAphbnl3YXkgaW4gdGhlIGZ1dHVyZSwgdGhlbiBpdCB3ZWFrZW5z
IHRoZSBhcmd1bWVudCB0byBjaGFuZ2UgdGhpcyBhbmQgCnJpc2sgYW55IGJyZWFrYWdlcyB0aGF0
IGZhbGwgb3V0IG9mIGl0LgoKSSdtIGFsc28gbm90IHN1cmUgd2hldGhlciB0aGV5IHJlYWxseSBh
cmUgbGVnYWN5IG9yIGp1c3QgYSBjb21tb24gYmFzZSAKc2V0IG9mIGV2ZW50cy4gU2luY2UgdGhl
IGV4dGVuZGVkIHR5cGUgdGhpbmcgd2FzIGFkZGVkIGV2ZW4gdGhlIGxlZ2FjeSAKZXZlbnRzIHN1
cHBvcnQgaHlicmlkLCBzbyBpdCdzIG5vdCBsaWtlIHRoZXkgZXhwaXJlZCBmcm9tIGxhY2sgb2Yg
CmZlYXR1cmVzLiBFdmVuIGlmIHdlIGNsYWltIHRoZXkncmUgbGVnYWN5LCBpcyB0aGF0IHJlYWxs
eSBldmVyIGdvaW5nIHRvIAptYWtlIHRoZW0gZ28gYXdheT8KCkFsdGhvdWdoIEkgYWRtaXQgbm9i
b2R5IGhhcyBjb21lIG91dCB3aXRoIGEgZGVmaW5pdGl2ZSB1c2UgY2FzZSB0aGF0IApkb2Vzbid0
IHVzZSBlaXRoZXIgdGhlIGN5Y2xlcyBvciBpbnN0cnVjdGlvbnMgZXZlbnRzLCBzbyBtYXliZSBp
dHMgYWxsIGZpbmUuCgo+IAo+IDMpIEknZCBsaWtlIGV2ZW50IHBhcnNpbmcgdG8gYmUgYSBsaWJy
YXJ5IHRoYXQgaXMgYXMgZWFzeSB0byBsaW5rCj4gYWdhaW5zdCBhcyBsaWJicGYgKGkuZS4gbm90
IGEgdmlyYWwgbGljZW5zZSkuIEV2ZW50IHBhcnNpbmcgaXMgcmVhbGx5Cj4ganVzdCBtYXBwaW5n
IGFuIGV2ZW50IG5hbWUgdG8gMSBvciBtb3JlIHBlcmZfZXZlbnRfYXR0ci4gVGhlIFBNVQo+IGFi
c3RyYWN0aW9uIGlzIHRpZWQgaW50byB0aGUgZXZlbnQgcGFyc2luZywgYnV0IHRoaXMgaGFzIG9u
bHkgYmVlbgo+IG1vcmUgdHJ1ZSByZWNlbnRseS4gVGhlIGV2c2VsL2V2bGlzdCBpcyB0aWVkIGlu
dG8gZXZlbnQgcGFyc2luZyBidXQKPiB0aGF0IGZlZWxzIHNlcGFyYWJsZS4gQXMgbW9zdCBqc29u
IGlzbid0IGRpc3RyaWJ1dGVkIHVuZGVyIGEgdmlyYWwKPiBsaWNlbnNlIHRoaXMgZmVlbHMgYWNo
aWV2YWJsZSwgdGhlbiBJIHN1c3BlY3QgbW9zdCB0b29scyBjYW4gdXNlIHRoaXMKPiBsaWJyYXJ5
IHJhdGhlciB0aGFuIGhhdmUgdG8gcmVpbnZlbnQgYSB3aGVlbC4KPiAKPiBTdGlsbCBsb29raW5n
IGZvciB0YWdzIDotKQo+IAo+IFRoYW5rcywKPiBJYW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
