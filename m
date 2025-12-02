Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008B7CFD2F6
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 04:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKL1dv6+31asTSWYAo3AqnafQYfZmNvfzQ6ERgUTOiQ=; b=WWBHbGWiOc0Ovd
	c6kcNbZW4wf5IxEU7SJu2rv53rWR1CpRSUB/jKf1Q3hfboYrFRSAGZ1FNAa+yy3Bijyhu1MHVMJoi
	cLXfPna4YZV0rlJdcwnTb7OcNbIXdIYKk7jSOB4rHHn9Q/wKe1lhtHO/1CTy0yRZYnThrLXhdZuP3
	uUDSyxucMmNXU/pqZFrV+o/d8rzzAmJMQjrgFtRdD3rR4dnGjN0SP1QDJNK8+jTS10qceN25Y9lFH
	/YVr0lBRPpWcwHyYw0KOK50rWEEK/C0Z3myY+95JfZSUxZVgDOUE/BLIAZiTN6xMWwI9yJGalXk31
	tIxTy2t4Mvly7SuN55DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQI04-00000004mn1-3yi0;
	Tue, 02 Dec 2025 04:28:28 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQI02-00000004mmL-2VEy
	for linux-riscv@lists.infradead.org;
	Tue, 02 Dec 2025 04:28:27 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2a45877bd5eso7562047eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Dec 2025 20:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764649706; x=1765254506; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uv873R59GF4pDUvydCooybALtCJ2h5ZZnBbEItimlbk=;
        b=h5vQZlavjKrk6eMvWjQ2qpKVbBzjYt/p8JIm5B+ghLeGnAcpf/6SQaFYVLHNgmQU0T
         uGe6KelBvEQ4jlWC7aSKuV9yrrkQlkjkGtmH0bH/Bg/ssohhf8TGQKj/WTmNfb3rBjIK
         /HBVdkGDYREkuCRiKHzIw4EIjJq9s+woupsW3Ez57KgN4apt/nSnz0uXQiD7AEpEfA7p
         Jbb3nXLYIynFpkv8J/MwIB1yA10JW2Bmym2HH+5lXdBEvjqdpCNNWbcQ6+ZfRuMM0+Kx
         /JZb5XV1TlSJ0Jc0CqFO2nl39EjjjNBXzsE2xT3o8qINOeFDIRH5/4s0ptZ1LK1F1Efm
         LWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764649706; x=1765254506;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uv873R59GF4pDUvydCooybALtCJ2h5ZZnBbEItimlbk=;
        b=UW/CYURmQ2Y9Lvx0/D/pIb26rus7t+9ho1U3e9iXYUjmCyIMf4ecKv9Lb6IchZbx1s
         hoR+9Xt7KgNaX9TDG+39ryXaFON3UlJgVJaj1cU+jyvtjD79htzlyhzCHEaFZxj3Rr5w
         fbJm0hk/Pc2VAS3BtQzD79TX2LMlYSdgDghLi8ul29fXBWYQEVp9ODIelZvqLiHqoQtl
         4E5QrGITcOfTfNTOjUuIT5N9moO6GH6gA6jZiHVRpD5CAbiC2CVOT5CfUgy3bExQyXT8
         +2KaG4xGoQPK95+tG0t/YPSMUhPiR2NLfT/Q558OVooARWcQ5gZiHRnFazE3EYC0Ml3j
         uXtA==
X-Forwarded-Encrypted: i=1; AJvYcCVcyMQsOOBX1b4ihO2GD+/cn5b/3Urol8BcR5r0zRQEh5X1BiBc+pH/4BJuWIi2UO1DYPRod2LVo0rvnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtkmSguN1ItaMhQMCox0xmumWENKLE18btclGo99oH7TqPneNL
	QYs3Pj81txLVZ+eDAwRDVUrQCRVucDQJedt2yUvR07XzF3NrcuZ5q7QXWSbtNrNm2wA=
X-Gm-Gg: ASbGnctBRh8fooZa1IJgVfePknQiw3kSbjc63qpvQzb0FlFo/HYOjjWf4DMicj62Ai8
	csYKGXpRhFsM0/wZXHtYgv7PCRNHEA9sdEJKjARZncKH2VgkhM3AaRY5Jt+O3M1YVxNjnVwu9Fw
	0akm2ORb5PLI9nCA8oCX6IEVf4FTThAErQlm+qWDWjWF9rphvA5MkLa+j6+9l0DBAEuCq//Ps0V
	fPGLshOi4KfhA2cWXPltEGCgiNxEl3Z8Ls+aruvMSJrRBEqwEAqA8lSwcYw4SIarWZjpLVCR1xv
	Ea9VEzy3LotJsY7fXXjwaswHS5SaTrXplravvpftFAkJ9F4bf7Nu1eHQRj5FwxyzEtVjC5+GHU6
	r1dWDTjFB0IPiy+wQzVijQK8LaK1b+ogTlFAl9XaFaHQ6vK4hG0sfg/o7yryYVqf3B+rN3cJ8m9
	syAeP/OPKYdYAlo53Uqg==
X-Google-Smtp-Source: AGHT+IHz9/5MGJKnqrRQBBG71Tv8qvd7//uMmkLyg5Z6fy/L0/ZDmN2B0A/dYTxnaQjFO5ur+16uhA==
X-Received: by 2002:a05:7300:e10f:b0:2a4:3593:ccbb with SMTP id 5a478bee46e88-2ab7e661990mr930517eec.2.1764649705538;
        Mon, 01 Dec 2025 20:28:25 -0800 (PST)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a96560986csm77426225eec.2.2025.12.01.20.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 20:28:24 -0800 (PST)
Date: Tue, 2 Dec 2025 09:58:11 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: huyuye <huyuye812@163.com>
Cc: ajones@ventanamicro.com, anup@brainfault.org, aou@eecs.berkeley.edu,
	atishp@rivosinc.com, bhelgaas@google.com, catalin.marinas@arm.com,
	conor.dooley@microchip.com, dfustini@tenstorrent.com,
	haibo1.xu@intel.com, lenb@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, rafael@kernel.org, robert.moore@intel.com,
	samuel.holland@sifive.com, tglx@linutronix.de, will@kernel.org,
	dai.hualiang@zte.com.cn, deng.weixian@zte.com.cn,
	guo.chang2@zte.com.cn, liu.qingtao2@zte.com.cn,
	wu.jiabao@zte.com.cn, lin.yongchun@zte.com.cn, hu.yuye@zte.com.cn,
	zhang.longxiang@zte.com.cn
Subject: Re: [PATCH v7 08/17] ACPI: pci_link: Clear the dependencies after
 probe
Message-ID: <aS5q28HPYLzK6h8r@sunil-laptop>
References: <20240729142241.733357-9-sunilvl@ventanamicro.com>
 <20251201141230.12656-1-huyuye812@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251201141230.12656-1-huyuye812@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_202826_668078_5ACAD47D 
X-CRM114-Status: GOOD (  13.59  )
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

T24gTW9uLCBEZWMgMDEsIDIwMjUgYXQgMTA6MTI6MjlQTSArMDgwMCwgaHV5dXllIHdyb3RlOgo+
ID4gSGksIHN1bmlsdmwKPiAKPiA+IEJhc2VkIG9uIHRoZSBhYm92ZSBwYXRjaCwgSSB1bmRlcnN0
YW5kIHRoYXQgeW91IHByZXZpb3VzbHkgPnJlc29sdmVkIGRlcGVuZGVuY2llcyBiZXR3ZWVuIExp
bmsgZGV2aWNlcyBhbmQgUENJIEhvc3QgQnJpZGdlcyBieSA+Y2FsbGluZyBhY3BpX2Rldl9jbGVh
cl9kZXBlbmRlbmNpZXMoZGV2aWNlKS4gSSB3b3VsZCBsaWtlIHRvIGFzazogPm9uIFJJU0PigJFW
IHBsYXRmb3JtcywgaWYgd2UgbmVlZCB0byBtYW5hZ2UgZGVwZW5kZW5jaWVzIGJldHdlZW4gPm11
bHRpcGxlIFBDSSBIb3N0IEJyaWRnZXMsIGNvdWxkIHRoaXMgYmUgYWRkcmVzc2VkIGJ5IGFkZGlu
ZyBhID5jYWxsIHRvIGFjcGlfZGV2X2NsZWFyX2RlcGVuZGVuY2llcyhkZXZpY2UpIGF0IHRoZSBl
bmQgb2YgdGhlID5hY3BpX3BjaV9yb290X2FkZCBlbnVtZXJhdGlvbiBmdW5jdGlvbj8KPiAKPiA+
IEluaXRpYWxpemF0aW9uIG9yZGVyIGRlcGVuZGVuY2llcyBjYW4gYmUgZGVmaW5lZCB2aWEgdGhl
IEFDUEkgPl9ERVAgbWV0aG9kIGluIHRoZSBEU0RULiBGb3IgZXhhbXBsZSwgaWYgaG9zdCBicmlk
Z2UgQiBkZXBlbmRzIG9uID5ob3N0IGJyaWRnZSBBLCBicmlkZ2UgQiBzaG91bGQgbm90IGJlIGVu
dW1lcmF0ZWQgdW50aWwgYnJpZGdlIEEgaXMgPmZ1bGx5IGluaXRpYWxpemVkLgo+IAo+ID4gWWVz
LCB0aGF0IHNob3VsZCB3b3JrLgo+ID4gUmVnYXJkcywKPiA+IFN1bmlsCj4gCj4gSGksU3VuaWwK
PiAKPiBJJ20gdHJ1bHkgaG9ub3JlZCBieSB5b3VyIGFmZmlybWF0aW9uIG9mIG15IGFuc3dlci5E
byB5b3UgdGhpbmsgdGhpcyBzb2x1dGlvbiBoYXMgYSBjaGFuY2Ugb2YgYmVpbmcgYWNjZXB0ZWQg
aW50byB0aGUgdXBzdHJlYW0ga2VybmVsPyBBcmUgdGhlcmUgYW55IHVuaW50ZW5kZWQgc2lkZSBl
ZmZlY3RzIHdlIG1heSBoYXZlIG92ZXJsb29rZWQ/Cj4gCkFjY2VwdGFuY2Ugb2YgdGhpcyBzb2x1
dGlvbiBkZXBlbmRzIG9uIHRoZSBQQ0kvQUNQSSBtYWludGFpbmVycy4gVG8gaGVscAp0aGVtIGV2
YWx1YXRlIGl0LCB5b3Ugc2hvdWxkIGNsZWFybHkgZGVzY3JpYmUgd2h5IHlvdXIgcGxhdGZvcm0g
cmVxdWlyZXMKdGhpcyBkZXBlbmRlbmN5IGluIHRoZSBwYXRjaC4KClJlZ2FyZHMKU3VuaWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
