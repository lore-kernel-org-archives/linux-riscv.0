Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66335C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 09:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WlTgtfwsGSTBb6qYW2bBmXpH7ef/JOYCtSI2UX+dqUg=; b=sUJ3+GBYJ+m2yi
	JCJ7aNlDyjI2KiZkPJNVxmKFE9hLRoKJQS2WUuFY6DdTGmCM3qDbmC63+BPfGg3FLiNL15FY00Nmm
	cJbKdbez4nToxRGwsK4lpXuJRBek6kgROTiGEv1gkVJCJiSClH2TbXHzbmqDMT5Cysj7wYCfQ5YSn
	YdUl+PmQBtoV3YEOAIPlZ97atU3OlTvsRYsfZOeuBj/LK5QbeJqF56T1fCkrmyyP9cBmxsClMczkD
	ZuVRW2TWimkjwabb35vhayt9ZxiWcjZ4cp606S6n3I0OmsXqqkxG+EGIRfyXColDymihjoQV/JfDD
	4QSDeEna9IjyssjFKuuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAbP-00CLMr-34;
	Thu, 07 Dec 2023 09:23:27 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAbN-00CLLB-0D
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 09:23:27 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-33334c0c0aaso62555f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 01:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701941002; x=1702545802; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l5FBiJ45iDeUXfgQxMa3i0Od/x/7WPqbPJGDEHdM0F0=;
        b=N89gLO8Bek/KttRIqcyYg1aqUeJiFbUdUpcn16ttPxyCeTDvf7T1+b2E+8+DCscvp+
         sjmDG7PTc2gs53If9MAnL1DwZM7cGoaEfkdPRfB8NxjZDZoXdATH3m6P9L8/WDbdRfSM
         W6ScS+79UxuV6PNAeQPvLYu3ryh1cGXXoTq2SVK2pt9saeKN8SgUuhUFettmbY9FQNuf
         shUwQ1mMsPBwU7JW20kxQ6EB+ar+sBkVsfsoBXQOykzSNiNw1Q5jezU//1bMRS/Jsrht
         xGaxmgKywbXEGppbeisTMXWg3rNbZOLV+Z0doVyoNto2HMIgJ2bPdfUPaayeTKkCXv9o
         nkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701941002; x=1702545802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l5FBiJ45iDeUXfgQxMa3i0Od/x/7WPqbPJGDEHdM0F0=;
        b=CcG4s+Mz6bw96HW7hFxwnH8B8YyjrMp1IZRVlUVEcoYYrjFEhWgKcFqUSWhpyS3pHQ
         bQ7yBBvRPCcag3WTsdT+YtEHPi0wfnTflmsKPJ26vmZkp4MYhkS4VTg4+q2qlFBw+eHi
         bNFVyWnY5u33Yna74IJae3/PAKNiLdfGoPcUO3fCPDdZkcnsBqyt1XPt73s/ZV9Kk8ac
         BLUt+zDXlZKL5LpZK7AfD8GECdMZVDL5NZdjS5ctjEis/Ni7EaG3RfzBXCuS3Kk4P26I
         pj5FbridPs/Nk357qltDCF5/E8uDOAu185/1Vo2GeZALbqojpViVM61Fg/rCuZy/QuTe
         Gzmg==
X-Gm-Message-State: AOJu0YzOS881c8oLqvCYavzXg/F60LlFCvlvMvl1YkCCJCkgxe+pvptA
	mDuwRGlH6o3hUR/60toY55M46g==
X-Google-Smtp-Source: AGHT+IHiSl8NR8L1J4o7p9pO4hO7ZjB/jzT8jO2oUpGxKH1pv3D7QS7UJOcLUaw5et+Kc0foXQo7Hg==
X-Received: by 2002:a05:6000:184b:b0:333:463a:b66e with SMTP id c11-20020a056000184b00b00333463ab66emr2922749wri.0.1701941001855;
        Thu, 07 Dec 2023 01:23:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:7592:dcea:a631:2772? ([2a01:e0a:999:a3a0:7592:dcea:a631:2772])
        by smtp.gmail.com with ESMTPSA id e22-20020a5d5956000000b0033334625bdbsm529774wri.13.2023.12.07.01.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 01:23:21 -0800 (PST)
Message-ID: <8a9952bf-67ff-4ab0-9e44-e2c2f2a68076@rivosinc.com>
Date: Thu, 7 Dec 2023 10:23:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] [RFC PATCH 0/3] riscv: add support for SBI Supervisor
 Software Events
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <apatel@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Himanshu Chauhan <hchauhan@ventanamicro.com>
References: <20231026143122.279437-1-cleger@rivosinc.com>
 <CAPYmKFsFLQnhXRPXpcoNfO-kEyjYLXD2Hm-F-O=Yxe1WJoSL9w@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAPYmKFsFLQnhXRPXpcoNfO-kEyjYLXD2Hm-F-O=Yxe1WJoSL9w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_012325_128045_A652E409 
X-CRM114-Status: GOOD (  30.98  )
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

CgpPbiAwNy8xMi8yMDIzIDEwOjA5LCBYdSBMdSB3cm90ZToKPiBQYXJkb24uIEl0IHNlZW1zIHRo
YXQgdGhlIGNvZGUgaW4gb3BlbnNiaVsxXSBpcyBub3QgY29tcGxldGUgZm9yIFBNVSBOTUkgbm93
Lgo+IEZvciBleGFtcGxlLCB0aGUgcG11IG92ZiBpcnEgaXMgc3RpbGwgZGVsZWdhdGVkIHRvIHN1
cGVydmlzb3IgbW9kZSBhbmQKPiB0aHVzIGNhbiBub3QgcmVhbGx5IHBsYXkgYSByb2xlIGFzIE5N
SS4gQW5kIG5laXRoZXIgdGhlIGtlcm5lbCBub3IKPiBvcGVuc2JpIHdpbGwgaW5qZWN0IGEgcG11
IGV2ZW50Lgo+IAo+IFRvIGNvbXBsZXRlIHRoZSB3b3JrLCB3ZSB0aGluayBtYXliZSAnZW5hYmxl
X2NiJyBhbmQgJ2Rpc2FibGVfY2InCj4gZnVuY3Rpb25zIGNhbiBiZSBzdXBwbGllZCBmb3Igc2Jp
X3NzZV9jYl9vcHMuCj4gV2hlbiBzYmlfc3NlX2VuYWJsZSBpcyBjYWxsZWQgdG8gZW5hYmxlIHBt
dSBldmVudCwgdGhlIGVuYWJsZV9jYiB3aWxsCj4gYmUgY2FsbGVkIHRvIHJldm9rZSB0aGUgZGVs
ZWdhdGlvbiBvZiBwbXUgb3ZmIGlycSBhbmQgZW5hYmxlIHRoaXMgaXJxCj4gaW4gQ1NSX01JRS4K
CkhpIFh1LAoKSW5kZWVkLCB0aGlzIHBhcnQgaGFzIGJlZW4gZGV2ZWxvcGVkIGJ1dCB3YXMgbGVm
dCBvdXQgZm9yIHRoZSBSRkMuIEJ1dAp5b3VyIHVuZGVyc3RhbmRpbmcgaXMgY29ycmVjdC4KCj4g
V2hlbiBwbXUgb3ZmIGlycSBvY2N1cnMsIGtlcm5lbCB0cmFwcyBpbnRvIG9wZW5zYmkgYW5kIG9w
ZW5zYmkgaW5qZWN0cwo+IHRoZSBldmVudCB2aWEgc2JpX3NzZV9pbmplY3RfZXZlbnQgYW5kIGVy
ZXQgYmFjayB0byBrZXJuZWwuCj4gCj4gUGxlYXNlIHBvaW50IGl0IG91dCBpZiB3ZSBoYXZlIGFu
eSBtaXN1bmRlcnN0YW5kaW5nLgo+IAo+IEJ5IHRoZSB3YXksIGhvdyBpcyBTU0UgZ29pbmcgbm93
PyBXZSB3aWxsIGFwcHJlY2lhdGUgaXQgdmVyeSBtdWNoIGlmCj4gd2UgY2FuIHBhcnRpY2lwYXRl
IGluIHNvbWUgZGV2ZWxvcG1lbnQgd29yayBpbiBrZXJuZWwgb3Igb3BlbnNiaSBhbmQKPiBiZSBv
ZiBhbnkgaGVscC4KClRoZSBkZXZlbG9wbWVudCBpcyBhbG1vc3QgY29tcGxldGUsIEFudXAvSGlt
YW5jaHUgd2lsbCBzZW5kIGEgbmV3CnJldmlzaW9uIG9mIHRoZSBzcGVjIGFkZHJlc3NpbmcgdmFy
aW91cyBjb21tZW50cyBhbmQgSSdsbCByZXNlbmQgdGhlIFJGQwpmb2xsb3dpbmcgdGhhdCBzcGVj
IHVwZGF0ZS4KClJlZ2FyZHMsCgpDbMOpbWVudAoKPiAKPiBSZWdhcmRzIQo+IAo+IExpbms6IGh0
dHBzOi8vZ2l0aHViLmNvbS9yaXZvc2luYy9vcGVuc2JpL3RyZWUvZGV2L2NsZWdlci9zc2UgWzFd
Cj4gCj4gT24gVGh1LCBPY3QgMjYsIDIwMjMgYXQgMTA6MzHigK9QTSBDbMOpbWVudCBMw6lnZXIg
PGNsZWdlckByaXZvc2luYy5jb20+IHdyb3RlOgo+Pgo+PiBUaGUgU0JJIFN1cGVydmlzb3IgU29m
dHdhcmUgRXZlbnRzIChTU0UpIGV4dGVuc2lvbnMgcHJvdmlkZXMgYSBtZWNoYW5pc20KPj4gdG8g
aW5qZWN0IHNvZnR3YXJlIGV2ZW50cyBmcm9tIGFuIFNCSSBpbXBsZW1lbnRhdGlvbiB0byBzdXBl
cnZpc29yCj4+IHNvZnR3YXJlIHN1Y2ggdGhhdCBpdCBwcmVlbXB0cyBhbGwgb3RoZXIgc3VwZXJ2
aXNvciBsZXZlbCB0cmFwcyBhbmQKPj4gaW50ZXJydXB0cyBbMV0uCj4+Cj4+IFZhcmlvdXMgZXZl
bnRzIGFyZSBkZWZpbmVkIGFuZCBjYW4gYmUgc2VuZCBhc3luY2hyb25vdXNseSB0byBzdXBlcnZp
c29yCj4+IHNvZnR3YXJlIChSQVMsIFBNVSwgREVCVUcsIEFzeW5jaHJvbm91cyBwYWdlIGZhdWx0
KSBmcm9tIFNCSSBhcyB3ZWxsCj4+IGFzIHBsYXRmb3JtIHNwZWNpZmljIGV2ZW50cy4gRXZlbnRz
IGNhbiBiZSBlaXRoZXIgbG9jYWwgKHBlci1oYXJ0KSBvcgo+PiBnbG9iYWwuIEV2ZW50cyBjYW4g
YmUgbmVzdGVkIG9uIHRvcCBvZiBlYWNoIG90aGVyIGJhc2VkIG9uIHByaW9yaXR5IGFuZAo+PiBj
YW4gaW50ZXJydXB0IHRoZSBrZXJuZWwgYXQgYW55IHRpbWUuCj4+Cj4+IEZpcnN0IHBhdGNoIGFk
ZHMgdGhlIFNTRSBkZWZpbml0aW9ucy4gU2Vjb25kIG9uZSBhZGRzIHN1cHBvcnQgZm9yIFNTRQo+
PiBpdHNlbGYuIEltcGxlbWVudGF0aW9uIGlzIHNwbGl0IGJldHdlZW4gYXJjaCBzcGVjaWZpYyBj
b2RlIGFuZCBnZW5lcmljCj4+IHBhcnQgKHNpbWlsYXJseSB0byB3aGF0IGlzIGRvbmUgZm9yIEFS
TSBTREVJKS4gRmluYWxseSwgdGhlIGxhc3QgcGF0Y2gKPj4gYWRkIHN1cHBvcnQgZnJvIFNTRSBl
dmVudCBpbiB0aGUgU0JJIFBNVSBkcml2ZXIuIElmIHRoZSBTU0UgZXZlbnQgaXMKPj4gYXZhaWxh
YmxlIGZyb20gdGhlIFNCSSB0aGVuLCBpdCB3aWxsIGJlIHVzZWQgaW5zdGVhZCBvZiB0aGUgbm9y
bWFsCj4+IGludGVycnVwdC4KPj4KPj4gQW1vbmdzdCB0aGUgc3BlY2lmaWMgcG9pbnRzIHRoYXQg
bmVlZHMgdG8gYmUgaGFuZGxlIGlzIHRoZSBpbnRlcnJ1cHRpb24KPj4gYXQgYW55IHBvaW50IG9m
IHRoZSBrZXJuZWwgZXhlY3V0aW9uIGFuZCBtb3JlIHNwZWNpZmljYWxseSBkdXJpbmcKPj4gZXhj
ZXB0aW9uIGhhbmRsaW5nLiBEdWUgdG8gdGhlIGZhY3QgdGhhdCB0aGUgZXhjZXB0aW9uIGVudHJ5
Cj4+IGltcGxlbWVudGF0aW9uIHVzZXMgdGhlIFNDUkFUQ0ggQ1NSIGFzIGJvdGggdGhlIGN1cnJl
bnQgdGFzayBzdHJ1Y3QgYW5kCj4+IGFzIHRoZSB0ZW1wb3JhcnkgcmVnaXN0ZXIgdG8gc3dpdGNo
IHRoZSBzdGFjayBhbmQgc2F2ZSByZWdpc3RlciwgaXQgaXMKPj4gZGlmZmljdWx0IHRvIHJlbGlh
Ymx5IGdldCB0aGUgY3VycmVudCB0YXNrIHN0cnVjdCBpZiB3ZSBnZXQgaW50ZXJydXB0ZWQKPj4g
YXQgdGhpcyBzcGVjaWZpYyBtb21lbnQuIEEgZml4dXAtbGlrZSBtZWNoYW5pc20gYWxsb3dzIHRv
IG1hcmsgdGhlCj4+IGxvY2F0aW9uIG9mIHRoZSBjdXJyZW50IHRhc2sgc3RydWN0IGRlcGVuZGlu
ZyBvbiB0aGUgZW50cnkgbGV2ZWwKPj4gKHVzZXIva2VybmVsKSBhbmQgdGhlIGxvY2F0aW9uLiBU
aGlzIGlzIHRoZW4gdXNlZCBpbiB0aGUgU1NFIGFzc2VtYmx5IHRvCj4+IGRldGVybWluZSB3aGVy
ZSBpcyBsb2NhdGVkIHRoZSBjdXJyZW50IHRhc2tfc3RydWN0Lgo+Pgo+PiBDb250cmFyeSB0byBw
c2V1ZG8gTk1JIFsyXSwgU1NFIGRvZXMgbm90IG1vZGlmaWVzIHRoZSB3YXkgaW50ZXJydXB0cyBh
cmUKPj4gaGFuZGxlZCBhbmQgZG9lcyBub3QgYWRkcyBhbnkgb3ZlcmhlYWQgdG8gZXhpc3Rpbmcg
Y29kZS4gTW9yZW92ZXIsIGl0Cj4+IHByb3ZpZGVzICJ0cnVlIiBOTUktbGlrZSBpbnRlcnJ1cHRz
IHdoaWNoIGNhbiBpbnRlcnJ1cHQgdGhlIGtlcm5lbCBhdAo+PiBhbnkgdGltZSAoZXZlbiBpbiBl
eGNlcHRpb24gaGFuZGxpbmcpLiBUaGlzIGlzIHBhcnRpY3VsYXJseSBjcnVjaWFsIGZvcgo+PiBS
QVMgZXJyb3JzIHdoaWNoIG5lZWRzIHRvIGJlIGhhbmRsZWQgYXMgZmFzdCBhcyBwb3NzaWJsZSB0
byBhdm9pZCBhbnkKPj4gZmF1bHQgcHJvcGFnYXRpb24uIEFkZGl0aW9uYWxseSwgU1NFIGV2ZW50
IGhhbmRsaW5nIGlzIGZhc3RlciB0aGF0IHRoZQo+PiBzdGFuZGFyZCBJUlEgaGFuZGxpbmcgcGF0
aCB3aXRoIGFsbW9zdCBoYWxmIGV4ZWN1dGVkIGluc3RydWN0aW9uICg3MDAgdnMKPj4gMTU5MCku
IFNvbWUgY29tcGxlbWVudGFyeSB0ZXN0cy9wZXJmIG1lYXN1cmVtZW50cyB3aWxsIGJlIGRvbmUu
Cj4+Cj4+IEZvciB0ZXN0aW5nIHB1cnBvc2UsIG9uZSBjYW4gdXNlIHRoZSBwcm92aWRlZCBTQkkg
aW1wbGVtZW50YXRpb24gYXQgWzNdLgo+PiBUaGlzIHNlcmllcyBhbHNvIG5lZWRzIHBhdGNoIFs0
XSB0byBmaXggYSBidWcgaW4gdGhlIFBNVSBkcml2ZXIuCj4+Cj4+IExpbms6IGh0dHBzOi8vbGlz
dHMucmlzY3Yub3JnL2cvdGVjaC1wcnMvbWVzc2FnZS81MTUgWzFdCj4+IExpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzEwMjMwODI5MTEuMjMyNDItMTAtbHV4dS5rZXJuZWxA
Ynl0ZWRhbmNlLmNvbS9ULyBbMl0KPj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jpdm9zaW5j
L29wZW5zYmkvdHJlZS9kZXYvY2xlZ2VyL3NzZSBbM10KPj4gTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDIzMTAyNjA4NDAxMC4xMTg4OC0xLWFsZXhnaGl0
aUByaXZvc2luYy5jb20vIFs0XQo+Pgo+PiAtLS0KPj4KPj4gQ2zDqW1lbnQgTMOpZ2VyICgzKToK
Pj4gICByaXNjdjogYWRkIFNCSSBTU0UgZXh0ZW5zaW9uIGRlZmluaXRpb25zCj4+ICAgcmlzY3Y6
IGFkZCBzdXBwb3J0IGZvciBTQkkgU3VwZXJ2aXNvciBTb2Z0d2FyZSBFdmVudHMgZXh0ZW5zaW9u
Cj4+ICAgcGVyZjogUklTQy1WOiBhZGQgc3VwcG9ydCBmb3IgU1NFIGV2ZW50Cj4+Cj4+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmggfCAgIDUgKwo+PiAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9zYmkuaCAgICAgICAgICAgIHwgIDQwICsrCj4+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3NzZS5oICAgICAgICAgICAgfCAgOTQgKysrKysKPj4gIGFyY2gvcmlzY3Yva2Vy
bmVsL01ha2VmaWxlICAgICAgICAgICAgICB8ICAgMSArCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9h
c20tb2Zmc2V0cy5jICAgICAgICAgfCAgMTcgKwo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvZW50cnku
UyAgICAgICAgICAgICAgIHwgMTU2ICsrKysrKysrCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zYmku
YyAgICAgICAgICAgICAgICAgfCAgIDQgKwo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvc3NlLmMgICAg
ICAgICAgICAgICAgIHwgIDk3ICsrKysrCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zdGFja3RyYWNl
LmMgICAgICAgICAgfCAgMTMgKwo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvdm1saW51eC5sZHMuUyAg
ICAgICAgIHwgICA2ICsKPj4gIGRyaXZlcnMvZmlybXdhcmUvS2NvbmZpZyAgICAgICAgICAgICAg
ICB8ICAxMCArCj4+ICBkcml2ZXJzL2Zpcm13YXJlL01ha2VmaWxlICAgICAgICAgICAgICAgfCAg
IDEgKwo+PiAgZHJpdmVycy9maXJtd2FyZS9yaXNjdl9zc2UuYyAgICAgICAgICAgIHwgNDk2ICsr
KysrKysrKysrKysrKysrKysrKysrKwo+PiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyAg
ICAgICAgICAgIHwgIDUxICsrLQo+PiAgaW5jbHVkZS9saW51eC9yaXNjdl9zc2UuaCAgICAgICAg
ICAgICAgIHwgIDU2ICsrKwo+PiAgMTUgZmlsZXMgY2hhbmdlZCwgMTAzOCBpbnNlcnRpb25zKCsp
LCA5IGRlbGV0aW9ucygtKQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vc3NlLmgKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9zc2Uu
Ywo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZmlybXdhcmUvcmlzY3Zfc3NlLmMKPj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3Jpc2N2X3NzZS5oCj4+Cj4+IC0tCj4+
IDIuNDIuMAo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
