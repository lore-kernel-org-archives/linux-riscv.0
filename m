Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1D8CCD1BF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 02:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tf1r7TD7wpH7B+JDrJ3TxuFkY4Xy5aBqbqtnkKSqlQ0=; b=v9/lBSrkwuXBcH
	vVi6Szyl/iU5H+1cNOu9v6opmqKcD02AycJ0efwYgJ0m3VEAPdWYoAvvCSQogb0IPgm0AojVHNO9I
	K3RGTTPj4oqSVmIcACBWpkusj7OqZ6RWKupFU+Jg1GHppTCARjSsZ5baiHCRzqtG/gLyj4lsQzq2s
	c9TY3Rp8zxXwSsGOLS9KuA50SP474tCxRnlKYvEcZKxymajxy5gsxx8rmKvi/LAs9EzHVf5S7221u
	sEOG5rQK4ibtQg6FF8clF6BfIFhLzmXuMxlkt6onFV+GSpQ4XX5WyIwdINzalgDt5Ch59ES56BMaY
	huZ/+1ShfINoqBHOn3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCTjb-0000000Aog7-41bv;
	Sat, 25 Oct 2025 02:10:23 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCTjZ-0000000Aofm-2I52
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 02:10:22 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-77f67ba775aso3398973b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 19:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761358221; x=1761963021; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9/FBYChVgWVnYtUmsOY0fMq3eM8ZJMPYKb26HoqCuHQ=;
        b=AiZR2H22R1yzEbVbWciLLXPmQqV2nd06hWSSzGv6mukj9rAvZMEE/KTITLTE9kzhgw
         CY6odi6Ra/TSEo08XLZwMosohUb8qf+E1XF/IIWFd5GYnjE09hMX0obtDrP/V9DUNDfp
         jeTwl9eu2Vh7vXsuIt/Ly5Ywe+mslMvccdE7GKdFEwaAD1oZu4o7vF+0tHW7T2XdiKiN
         2kGk03Xcub7ukme5bIvgnqXAdTptXFNjsNrQkJ8sYILDsnF/+DEwDx3mTpy5WluKVUKa
         tIfLRRUJRdXiwrqsg+8UNLO5JhwIwzvdLjTOS6oSUQWGIAHNkRR6tRcXP4wKe46BQKdQ
         xM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761358221; x=1761963021;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/FBYChVgWVnYtUmsOY0fMq3eM8ZJMPYKb26HoqCuHQ=;
        b=oQAu3gAGgRvto6knO6ALetEyMFNdVnYYQSC4xWesw1aBdoqL8wXEq6ywIvpHxm7jpa
         LX7xnHaxiD/3FiTREeB6vR3Ciy6vff9Oj1Rg0DZ/tUhLQBBfDgQe0C/6lLVQCk3Ey+3I
         Xz1k4XHbRMaExsFTScOTsPLYjLeQ+ON/7xGucghNJvWQX1McMpxrMHUWRgV4fPWOc6QL
         vi6Jtn+BZjsFjFbWKKKa6YfQgprXWEPEHVtgb3WXVxHQjHb0P/ITsJBUteRPF+mDV1pC
         AZ9x2UWcN5r3oN4FIFXy6op56kTT7o7G5/iZ8fZGXDl0l4Z5T5otz2DpQC7INXBa7WSD
         nr6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqliUrJemut7/+FKmAdhP8MqqiJx04Jnrcl4FkJzEDPHr8HthQa1Inw+rYl+Mg/Qpd9TrK8JtR9/S80g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaT0tmf+V4lIZobyJMORGLeZcgEikvQZQBVfhSJXplLJsEpXGX
	2q9RBdc8TPh2auJe/u87pj8adKgfU8BU7foWyJXCucelQ6JPY6Wl88pG
X-Gm-Gg: ASbGncvfVWAVrbANThre/plmqRy/QD9oOPqoP2J9vjpxKUZ+pGhnoYBr2qNIbwVcqVf
	RNzFjN/PpWlaCMyeg/hj0dEeSrAwAN5GpTSg4JmNMB1hKdrMwlNrHAZtJtPmN2h2WWzmM5Qxr4z
	UQp2KlGMIdchhjUXpipXer/rPGyXSz/6ofVaFU/OdeIqmMkz04Q2GRsXI7vYw0xnBO7fhVc5Tju
	QMaWIy3KO2uyuczPA9H48NdyInpqPl7xK+2XNpyjBQYixUzt1Ll30Kri508wk4TO4RdTVMBWkk4
	hv6qtjsrsLVCjr7tishk21hZy9wq41MAoTPLk8DLemlZxYA8HtReUVQ519G1ntrDAusXvGdCEkV
	74EL1sfiHJwA26AQhWZNl29G2oRT/1KhlOTaBhOb9lJ2LV2KTWF0eg+dfd38cGFknLjt1+0XIqb
	gf
X-Google-Smtp-Source: AGHT+IGxdF3j6/BMru43Wtt8roJ9EkCuO4V8hWSOev8tC8y9D9Mkhnf7FOrlQlXfV5+SHKSZlrr6MA==
X-Received: by 2002:a05:6a00:94d5:b0:780:7eaa:938 with SMTP id d2e1a72fcca58-7a220a7f285mr39262909b3a.12.1761358220535;
        Fri, 24 Oct 2025 19:10:20 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414068cdcsm639966b3a.47.2025.10.24.19.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 19:10:20 -0700 (PDT)
Date: Sat, 25 Oct 2025 10:10:17 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <3pyukscivyj6iarozoll3jmavjleyqe44fu7xhimot4xorm3tw@rjybzefmfkui>
References: <20251024030528.25511-1-looong.bin@gmail.com>
 <20251024030528.25511-2-looong.bin@gmail.com>
 <20251024-hangout-designing-33e96c0d35fc@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251024-hangout-designing-33e96c0d35fc@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_191021_591188_A236AB4A 
X-CRM114-Status: GOOD (  15.37  )
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

T24gRnJpLCBPY3QgMjQsIDIwMjUgYXQgMDU6NDY6MDNQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIEZyaSwgT2N0IDI0LCAyMDI1IGF0IDExOjA1OjE0QU0gKzA4MDAsIExvbmdiaW4g
TGkgd3JvdGU6Cj4gPiBUaGUgU29waGdvIENWMTgwMC9TRzIwMDAgU29DIHRvcCBtaXNjIHN5c3Rl
bSBjb250cm9sbGVyIHByb3ZpZGVzIHJlZ2lzdGVyCj4gCj4gUGxlYXNlIHJlbWluZCBtZSBob3cg
aXQgd29ya3MsIHNnMjAwMCBpcyBqdXN0IGEgcmViYWRnZSBhbmQgcmVhbGx5IHRoaXMKPiBqdXN0
IHJlZmVycyB0byBvbmUgZGV2aWNlPwo+CgpTRzIwMDAgYW5kIENWMTgwMCBiZWxvbmcgdG8gdGhl
IHNhbWUgU29DIHNlcmllcy4KU28gaXQncyBtb3JlIGFjY3VyYXRlIHRvIGRlc2NyaWJlIGFzIOKA
nENWMThYWC9TRzIwMFjigJ0uCiAKPiA+IGFjY2VzcyB0byBjb25maWd1cmUgcmVsYXRlZCBtb2R1
bGVzLiBJdCBpbmNsdWRlcyBhIHVzYjIgcGh5IGFuZCBhIGRtYQo+ID4gbXVsdGlwbGV4ZXIuCj4g
Pgo+ID4gLi4uLgo+ID4gCj4gPiArCj4gPiArZGVzY3JpcHRpb246Cj4gPiArICBUaGUgU29waGdv
IENWMThYWC9TRzIwMFggU29DIHRvcCBtaXNjIHN5c3RlbSBjb250cm9sbGVyIHByb3ZpZGVzCj4g
PiArICByZWdpc3RlciBhY2Nlc3MgdG8gY29uZmlndXJlIHJlbGF0ZWQgbW9kdWxlcy4KPiAKPiBI
ZXJlIGFuZCBpbiB0aGUgdGl0bGUgeW91IGhhdmUgWHMsIGFyZSB0aG9zZSBwbGFjZWhvbGRlciBv
ciBpcyB0aGlzCj4gZ29pbmcgaW50byBjdjE4MHguZHRzaSBhbmQgZ29pbmcgdG8gYmUgdXNlZCBv
biBtdWx0aXBsZSBkZXZpY2VzPwo+IAoKWWVzLCB0aGUg4oCcWFjigJ0gaXMgZ29pbmcgdG8gYmUg
dXNlZCBpbiB0aGUgd2hvbGUgQ1YxOFhYL1NHMjAwWCBTb0Mgc2VyaWVzLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
