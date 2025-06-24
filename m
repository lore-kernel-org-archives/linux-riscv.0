Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37565C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 14:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Yl58kHV+i99Wk4QKwsnx5e9qomSNoXRFhK70gE+Nsg=; b=gRcOOUBrblbdlE
	NNZVT1fnFvUfYN6xWCeQWyQBcQOWkzcWoARt9Q77KgNrZBsA2sS3v3Bp3axzT3UPwiSuQaOa8yJyQ
	Au9vUdGO6p/uSaPv3FgTSvdXBwLMC/8xrEKhgQpvnp6I3ySJeed7tSwldq5WOLf9aTUVX3xNWyVF2
	GA59ynRcp9jFsJdmz8jFs1RfKRHpLSf/z7067nKX/m3QjrdVSfJa2Jap8Aase0p829Cj0gvQm2Rwd
	OZondW1drRTgW4hZCFNfzPrbrC5YF2k/+lHHILK0PU4l3Qz7ZxsB5yYFt0cDzfWgAJ6314ALmtXMc
	W+1JgZujpfobazpCokqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4U8-00000005sTj-3A6x;
	Tue, 24 Jun 2025 14:18:52 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU40o-00000005m2P-1Wd1
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 13:48:35 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-23633a6ac50so6574185ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 06:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750772913; x=1751377713; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H99QKyWxgJFviR9gCoeMBJLsUrcpUyL0OAKfLepv64s=;
        b=1B4L9SvE8BR76JyrZvsr20AxqnExqwRVrlt4SCJ7ervXq4KfhwnLsE2y/g7a7XMPFk
         XWtMir2KeM/G2d7dL7neQOmFttGjLFt8VqysIY+tbxD8PL1UzefLRNv8flKlH4C0JpCe
         s67aCyrbyzPP0XBpLJog0XUQv0aEs9gNTvwOujPsd49uy2qf4m20PhUmdtXHBfqxhRKH
         N4HCpBmVRpx3KDk6O7yl0M78kLBw/m3VWQjwrSDZVOVQD9kJ6/8UrcWv3PTMN/E9kCM+
         BM2dp9Y07Li0ZBIw/jbJLOILfGjDZCk8Bwy2YHsm3iFvkedXHrmXmn+mf/wcWzHLTYKv
         tNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772913; x=1751377713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H99QKyWxgJFviR9gCoeMBJLsUrcpUyL0OAKfLepv64s=;
        b=CD/lq49dfKmKhEH5vdHnnsovOHsIoNAkfojLeC00oEbrScVm/7t8QdEbNjBerqh5Qf
         eXgnl/Fv3tWY1G1uF4W9VsP6LTYd88WvrKMe2WFqGKm1nXmG/zSVHSnkJJ3slW3QidQS
         r2hg64dLHdY1feOzN5NAlwORN6/Ui1zK2bFnbht/C070mKHije87k0GorHzcsNGQgIbN
         wgnDK2H9S5KITGRojJAk5WzGriklTEdFvgdz5loDFSaPnk8ZTlmwvtR0mR9T8zFs8AxR
         DTAuCobu4VWtWrBcrDSp4i72OMd6HbhlSAdTu/5x4E4qxtFzsXr7mvtVisjUG5ZCEHd5
         /49Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeuyD5ZKbpGewXHSgPgG1NkN0S98mGVlnnWWN4GwnQnzC8U+zIg0gx5aSPTJDH0ZbGV1Fl/Y+BVwnb5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxehRn5QRB8JLewwB3wUAQPlJx+lvtJLwl8lPP4CNTvPle+nLrw
	hNM5kiwz9UB+oCsFALxNDcchSQXijJcRpt3OrHAELRE1jU+aOn+oe8tXBN0BmO17XUU=
X-Gm-Gg: ASbGncvsnNTgtlDtKUuxqm2Lq0fcIziB9OzmmPblUabvzw8AjUoHuImtaIcoVV9cLlu
	ZLzbS/MfMOChsyTcKGdyh3+1BSwcxufSrKJe1nEtFCtxgVehD1WUdze+JCrP3OB11zRx89k/cfr
	kMylPtB21RCGAV5k6QXDC/oWnkH0rIUK5kyCLxqhjGgQKT2sBN+1nSsy3KQJeZljEfNL1zRFAmQ
	AaBnyX0aq+mFeC11Ju5fDnTEPZEFSdZO0r2dxKjjdLeh3kV/ux1VAuuhaCBuO0WGbY+G5Iqsjkj
	aN9frFhIKtiA/ME2rGCiBkGJCJ7R2u8jjpwhPBab77e9Wo3/HIlMGXKFUMJdfa+KuzCMRR5q4nd
	HorcriNq4bMB8JuXFkE19IXG0Rm/3T4w=
X-Google-Smtp-Source: AGHT+IH3VVcKlPmQAwhvEtRsqViiUOznLNr6sCLhqQcLQB4C7EhcexsF4UBAe4n2C1iZkbDQyg+oRw==
X-Received: by 2002:a17:903:4b30:b0:234:8c3d:2912 with SMTP id d9443c01a7336-237d96b6361mr256983115ad.11.1750772913474;
        Tue, 24 Jun 2025 06:48:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d87391e5sm106566055ad.244.2025.06.24.06.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:48:33 -0700 (PDT)
Message-ID: <d135d6cc-5117-4b3a-9abe-2e5fd9e3e490@rivosinc.com>
Date: Tue, 24 Jun 2025 15:48:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Enable interrupt during exception handling
To: Nam Cao <namcao@linutronix.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Alexandre Ghiti <alex@ghiti.fr>, bigeasy@linutronix.de,
 clrkwllms@kernel.org, rostedt@goodmis.org, linux-rt-devel@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
References: <mhng-60581B88-6FC7-4349-96B6-730D908ABF4A@palmerdabbelt-mac>
 <alpine.DEB.2.21.2506240303170.61655@angie.orcam.me.uk>
 <19cf2371-7293-4e71-a17d-669db4c8270a@rivosinc.com>
 <20250624131730.XqPd1HUR@linutronix.de>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250624131730.XqPd1HUR@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_064834_504903_4C9411BD 
X-CRM114-Status: GOOD (  14.54  )
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

CgpPbiAyNC8wNi8yMDI1IDE1OjE3LCBOYW0gQ2FvIHdyb3RlOgo+IE9uIFR1ZSwgSnVuIDI0LCAy
MDI1IGF0IDAxOjM3OjEzUE0gKzAyMDAsIENsw6ltZW50IEzDqWdlciB3cm90ZToKPj4gT24gMjQv
MDYvMjAyNSAwNDowOSwgTWFjaWVqIFcuIFJvenlja2kgd3JvdGU6Cj4+PiBPbiBNb24sIDIzIEp1
biAyMDI1LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPj4+PiBJJ20ga2luZCBvZiBzcGxpdCBvbiBh
IEZpeGVzIHRhZyBoZXJlLiAgT25lIGNvdWxkIGFyZ3VlIGl0J3MgYSByZWdyZXNzaW9uLCBhcwo+
Pj4+IGhhdmluZyBpbnRlcnJ1cHRzIGRpc2FibGVkIGR1cmluZyBleGNlcHRpb25zIGlzIGdvaW5n
IHRvIGNhdXNlIGFsbCBzb3J0cyBvZgo+Pj4+IHBlcmZvcm1hbmNlIGlzc3VlcyBmb3IgdXNlcnMu
ICBTZWVtcyBhIGJpdCByaXNrIHRvIGp1c3QgYmFja3BvcnQsIHRob3VnaC4uLgo+Pj4+Cj4+Pj4g
VGhhdCBzYWlkLCBpZiBub2JvZHkgbm90aWNlZCB0aGVuIGl0J3MgcHJvYmFibHkgYSBnb29kIHNp
Z24gbm9ib2R5IGlzIHJlYWxseQo+Pj4+IHBheWluZyBhdHRlbnRpb24gYW5kIHdlIHNob3VsZCBq
dXN0IGJhY2twb3J0IGl0IGJlZm9yZSBhbnlvbmUgbm90aWNlcy4uLgo+Pj4KPj4+ICBPaCwgc29t
ZW9uZSBkaWQgbm90aWNlIGFuZCBpdCdzIG5vdCBvbmx5IHBlcmZvcm1hbmNlLCBjZi4gCj4+PiA8
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9hbHBpbmUuREVCLjIuMjEuMjUwMTA3MDE0MzI1MC4x
ODg4OUBhbmdpZS5vcmNhbS5tZS51ay8+Lgo+Pgo+PiBJIGFsc28gaGFkIGEgc2VyaWVzIHdoaWNo
IHdhcyBkb2luZyBzbyBmb3IgbWlzYWxpZ25lZCBhY2Nlc3NlcyBoYW5kbGluZywKPj4gYnV0IGFm
dGVyIGRpc2N1c3Npb24sIGl0IHdhcyBub3Qgb2sgdG8gZG8gc28uOgo+Pgo+PiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDQyMjA5NDQxOS5HQzE0MTcwQG5vaXN5LnBy
b2dyYW1taW5nLmtpY2tzLWFzcy5uZXQvCj4gCj4gSWYgSSB1bmRlcnN0YW5kIHRoYXQgcmlnaHQs
IGV4Y2VwdGlvbnMgZnJvbSBrZXJuZWwgc2hvdWxkIGJlIHRyZWF0ZWQgYXMKPiBOTUksIHNvIHRo
YXQgbG9ja2RlcCBjYW4gdGVsbCB1cyBpZiBleGNlcHRpb24gaGFuZGxlcnMgdG91Y2ggbG9ja3Mu
Cj4gCj4gQnV0IChjb25kaXRpb25hbGx5KSBlbmFibGluZyBpbnRlcnJ1cHRzIGRvZXMgbm90IGxv
c2UgdXMgdGhhdCBiZW5lZml0LiBJdAo+IGlzIHN0aWxsIGNvbnNpZGVyZWQgTk1JIGJ5IGxvY2tk
ZXAuCj4gCj4gVW5sZXNzIEkgbWlzcyBzb21ldGhpbmcsIHRoZSBwYXRjaCBpcyBmaW5lIGFzIGlz
LgoKSGkgTmFtLAoKWWVhaCBpbmRlZWQsIHByb3ZpZGluZyB0aGF0IGFsbCB0cmFwcyBoYW5kbGVy
cyByZWFsbHkgYXJlIHJlZW50cmFudCwgSQp0aGluayBpdCdzIGZpbmUuCgpUaGFua3MsCgpDbMOp
bWVudAoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gTmFtCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
