Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E87DC36002
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 20:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=abYlgIC/K67KL2im9qaPba+QZN3HZOWsQw9xL54vjUk=; b=lefekjENqEDnRW
	X3fK1EVVjQlhDNhy9HA9fSp+MTvCQzJxctz5vJNgnzZUjihoytLWUA0wWr+fp+//36/ceWA27aoiE
	X5tBEzHK+CpDFLRv5PbQb+l6prhQD6OOk2kScS8Hv5mijxIqlhZeOqmoSQ8RfuP0YJzz/v/pm3f2N
	9bMQ9PSeGJEWOtD8pGux7DlHLD1z8IBgq2EAOY0faMgnRyRMdS/0VvP4SEnsxKM6FtPZMj/9uN4r5
	zeO7w7GI2D5enX/WrG6UrS2vziD0EJDZKn40jaipFy8wWC0zMGhR/Ulz+CuCr52YPBNkHPvFTRoJo
	Q+GTh+aKcxaCrhMPpgiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvjQZ-0000000GGrs-1kzO;
	Fri, 21 Mar 2025 20:57:15 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvjQW-0000000GGqg-2SAu
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 20:57:13 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-85ad83ba141so105227039f.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Mar 2025 13:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1742590631; x=1743195431; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9+5tlGWdTjjnvMyRFuoxH5wURyyyxF85+K/XRxuX8I=;
        b=cnZi5BOYCWqxF2hhdM0dDU3+i6y5YNs+gHKXhHJdsdL9Vt/1u59bz5z2bPXGy8BwGR
         uaM5gNNLyNFOouz5RIBiR8MI9x4D/ZZauTrlUgW9zwNtXRBDgmxQwhLvtnRcIhcHBuZB
         v1ot4qm4VGbXBFQxuYSilzBbOzPa6MTJxo4ZDEOKxUqBATaFW7z9HYsM/EnZBiDxuBoB
         EnAjQUXv+v+kptA+qtxI1re+B4gwTLi60qvD0V8RHuvvwMOuGTt8sHKNieDJXJKcwTEc
         H/wIraCKa3q4md+1I3wNOTYXRguP9W6WPNoXYMZ6dgv32i4bJlGzdGumHaCiY+FMBIxb
         PJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742590631; x=1743195431;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9+5tlGWdTjjnvMyRFuoxH5wURyyyxF85+K/XRxuX8I=;
        b=jggqC587P7csWbim7K8rOnrqLF5plNfPrVuOlFqcUVHBU3UzOh6IAPFBtekn07GuFC
         h2yMGY4EChDAN+DX9phKN3qHftv9GpKDPH080NSruc+IR1s3xBF14M/7weYGarSPqVXY
         Mp2vRkLQqHnMGob3tVYzgo5aq7kb+hVOoQLhkzYBX/2BEnwnjYf+X7OnwckZZyhhb9uV
         wJ1KxH9Gz+Jm7L86dcmh08p1jz8KN/W+3Kjbp8USfxne/ZzeBpqjVrKTFnIDbHTkYkUs
         2vSeEqX+vehMDgXBR8a+lqxxGUVzQOx4/U868m+TqMlVQiXTh1l0YgQCTiZ5jI8zQUOJ
         6aIQ==
X-Gm-Message-State: AOJu0Yxgja7G2I9QbnSV2+HabxNx0eG8EmAB8SCskfJmFQUJTNYJuJOk
	D83hl4Arvs2zj710LztZyqV6JJ+YgkZFA2J7Ys76JUit5cASKKbmVeLDaUVSd/4=
X-Gm-Gg: ASbGncu1iwSLD9ZS0s1i+IgZhK67OhunD3oWKfggoP5WaeYLJse8eFqCruDvoDgf2e6
	ZqQ/szKM2KtcLyXyEDoHW2uZWCR0UYqxdp5LiTFJZgRPacWA9+LR0yfQ2vAi+KJGcDd3DFtS4ba
	NZFghgZe7YW5cYz/aMWt0dHh7mPmYZO7DWFdV1X2uwylOWiWucyaejKyblzobVuKnm/IfuN5iv6
	GYfHkBy4kmbDmZ0tRtnQmAhpCcF+AcUcPxVguFxgQMnGMPZI3e2gaMPWavY2/F0MrAxd0YdQwQx
	ulBgVikq9Cb/QqHy0gL46nMqLCcpY0VUD75sp6NCAP+oL9xvDtHJ00nhvrPjnw==
X-Google-Smtp-Source: AGHT+IGIhc6f43oVUMs3yKpZ/Qi3MN06te1GZdlnQ8JYifCqR1/BD6VFgf6pM5hzDXs+HJFOuNTjfg==
X-Received: by 2002:a05:6602:4c03:b0:85d:a211:9883 with SMTP id ca18e2360f4ac-85e2cb59528mr567711439f.10.1742590631162;
        Fri, 21 Mar 2025 13:57:11 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbdcfef4sm613828173.31.2025.03.21.13.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 13:57:10 -0700 (PDT)
Message-ID: <7c42afed-e877-4136-a6d6-8ebc9864cc04@sifive.com>
Date: Fri, 21 Mar 2025 15:57:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 0/7] perf vendor events riscv: Update SiFive CPU
 PMU events
To: Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>, Ian Rogers <irogers@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-perf-users@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>, Adrian Hunter
 <adrian.hunter@intel.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Atish Patra <atishp@rivosinc.com>
References: <20250213220341.3215660-1-samuel.holland@sifive.com>
 <Z7ZLB-wZY9wTZSBZ@google.com>
 <CAOnJCUJYKkGXOJiLTnPOgPSnEiCeXFaoGQRiT5Au+rbvP1unZQ@mail.gmail.com>
 <1198d3ac-d715-4f82-853e-bf9d0ad9dde7@sifive.com>
 <CAOnJCUKUY8YQ0UtLa39EkGEjckiOqdnuqEsf2ak4Dcp779iY+Q@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <CAOnJCUKUY8YQ0UtLa39EkGEjckiOqdnuqEsf2ak4Dcp779iY+Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_135712_645496_AF32A5C0 
X-CRM114-Status: GOOD (  23.99  )
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

SGkgQXRpc2gsCgpPbiAyMDI1LTAzLTIxIDE6MzEgUE0sIEF0aXNoIFBhdHJhIHdyb3RlOgo+IE9u
IEZyaSwgTWFyIDcsIDIwMjUgYXQgMToxOeKAr0FNIFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9s
bGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPj4gT24gMjAyNS0wMy0wMSAzOjIxIEFNLCBBdGlzaCBQ
YXRyYSB3cm90ZToKPj4+IE9uIFdlZCwgRmViIDE5LCAyMDI1IGF0IDE6MjfigK9QTSBOYW1oeXVu
ZyBLaW0gPG5hbWh5dW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+IE9uIFdlZCwgRmViIDEyLCAy
MDI1IGF0IDA1OjIxOjMzUE0gLTA4MDAsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+Pj4+PiBUaGlz
IHNlcmllcyB1cGRhdGVzIHRoZSBQTVUgZXZlbnQgSlNPTiBmaWxlcyB0byBhZGQgc3VwcG9ydCBm
b3IgbmV3ZXIKPj4+Pj4gU2lGaXZlIENQVXMsIGluY2x1ZGluZyB0aG9zZSB1c2VkIGluIHRoZSBI
aUZpdmUgUHJlbWllciBQNTUwIGJvYXJkLgo+Pj4+PiBTaW5jZSBtb3N0IGNoYW5nZXMgYXJlIGlu
Y3JlbWVudGFsLCBzeW1ib2xpYyBsaW5rcyBhcmUgdXNlZCB3aGVuIGEgc2V0Cj4+Pj4+IG9mIGV2
ZW50cyBpcyB1bmNoYW5nZWQgZnJvbSB0aGUgcHJldmlvdXMgQ1BVIHNlcmllcy4KPj4+Pj4KPj4+
Pj4gSSBvcmlnaW5hbGx5IHNlbnQgdGhpcyBzZXJpZXMgYWJvdXQgYSB5ZWFyIGFnb1sxXSwgYnV0
IHJlY2VpdmVkIG5vCj4+Pj4+IGZlZWRiYWNrLiBUaGUgUDU1MCBib2FyZCBpcyBub3cgYXZhaWxh
YmxlIChhbmQgSSBoYXZlIHRlc3RlZCB0aGlzIHNlcmllcwo+Pj4+PiBvbiBpdCksIHNvIGl0IHdv
dWxkIGJlIGdvb2QgdG8gZ2V0IHBlcmYgc3VwcG9ydCBmb3IgaXQgdXBzdHJlYW0uCj4+Pj4+Cj4+
Pj4+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcGVyZi11c2Vycy8yMDI0MDUw
OTAyMTUzMS42ODA5MjAtMS1zYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tLwo+Pj4+Pgo+Pj4KPj4+
IFRlc3RlZCB0aGUgcGF0Y2hlcyB0aGF0IGFyZSBwYXJ0IG9mIHNpZml2ZSdzIHJlbGVhc2UgdHJl
ZSBmb3IgcDU1MC4KPj4+IEJvdGggcGVyZiBzdGF0L3JlY29yZCBzZWVtcyB0byB3b3JrIGZpbmUK
Pj4+IGZvciBhIGJ1bmNoIG9mIGV2ZW50cy4KPj4+Cj4+PiBCYXNlZCBvbiB0aGF0Cj4+PiBUZXN0
ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+Pgo+PiBUaGFua3MgZm9y
IHRlc3RpbmchCj4+Cj4+PiBAU2FtdWVsIEhvbGxhbmQgOiBwZXJmIHJlcG9ydCB0aGF0IHRoZSBm
b2xsb3dpbmcgdHdvIGV2ZW50cyBhcmUgbm90Cj4+PiBzdXBwb3J0ZWQgb24gdGhlIHA1NTAgYm9h
cmQuCj4+Pgo+Pj4gY3ljbGUgYW5kIGluc3RydWN0aW9uIGNvdW50Ogo+Pj4gICBjb3JlX2Nsb2Nr
X2N5Y2xlcwo+Pj4gICAgICAgIFtDb3VudHMgY29yZSBjbG9jayBjeWNsZXNdCj4+PiAgIGluc3Ry
dWN0aW9uc19yZXRpcmVkCj4+PiAgICAgICAgW0NvdW50cyBpbnN0cnVjdGlvbnMgcmV0aXJlZF0K
Pj4+Cj4+PiBJIGFzc3VtZWQgdGhhdCB0aGVzZSBhcmUgcmF3IGV2ZW50cyBjeWNsZS9pbnN0cnVj
dGlvbiByZXRpcmVkIGV2ZW50cwo+Pj4gdGhhdCBjYW4gc3VwcG9ydAo+Pj4gcGVyZiBzYW1wbGlu
ZyBhcyB3ZWxsLiBNYXliZSBJIGFtIG1pc3Npbmcgc29tZXRoaW5nID8gRFQgYmluZGluZyA/Cj4+
Cj4+IHBlcmYgaXMgY29ycmVjdC4gVGhvc2UgdHdvIGV2ZW50cyBhcmUgbm90IHN1cHBvcnRlZCBv
biBQNTUwLCBvbmx5IGJ5IHRoZSBuZXdlcgo+PiBjb3JlcyAoYnVsbGVkLTBkIGFuZCBwNjUwKS4g
WWVzLCB0aG9zZSBhcmUgYWxpYXNlcyBvZiBjeWNsZXMgYW5kIGluc3RydWN0aW9ucwo+PiB0aGF0
IHdlcmUgYWRkZWQgdG8gc3VwcG9ydCBzYW1wbGluZy4KPj4KPiAKPiBUaGFua3MgZm9yIHRoZSBj
b25maXJtYXRpb24uIEFyZSB0aGVyZSBvdGhlciBldmVudHMgdGhhdCBjYW4gYmUgdXNlZCB0byBz
YW1wbGUKPiBpbnN0cnVjdGlvbiBjb3VudCBvbiBQNTUwID8gSSBkaWQgbm90IGZpbmQgYW55dGhp
bmcgaW4gdGhlIHBlcmYgbGlzdAo+IG9yIHRoZSBqc29uIGZpbGUuCj4gSSBhbSBub3Qgc3VyZSBp
ZiBJIG1pc3NlZCBzb21ldGhpbmcuCgpMaWtlbHkgdGhlIGNsb3Nlc3QgYXBwcm94aW1hdGlvbiBp
cyBPUmluZyB0b2dldGhlciB0aGUgaW5zdHJ1Y3Rpb24gY2xhc3MKcmV0aXJlbWVudCBldmVudHMg
ZnJvbSBpbnN0cnVjdGlvbi5qc29uOiBjcHUvcjB4M2ZmZmUwMC8uIFRoZSBkaWZmZXJlbmNlIGJl
dHdlZW4KdGhhdCBhbmQgImluc3RydWN0aW9ucyIgbG9va3MgdG8gYmUgd2VsbCB3aXRoaW4gMSUg
Zm9yIENQVS1pbnRlbnNpdmUgd29ya2xvYWRzLgpNYXliZSBpdCBtYWtlcyBzZW5zZSB0byBhZGQg
YW4gZW50cnkgZm9yIHRoaXMgY29tYmluYXRpb24gaW4gdGhlIEpTT04/IFdvdWxkIGl0CmJlIGFw
cHJvcHJpYXRlIHRvIGNhbGwgaXQgImluc3RydWN0aW9uc19yZXRpcmVkIj8gVGhlIHNhbWUgdGhp
bmcgY291bGQgYmUgZG9uZQpmb3IgdGhlIG9sZGVyIFNpRml2ZSBjb3Jlcy4KClJlZ2FyZHMsClNh
bXVlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
