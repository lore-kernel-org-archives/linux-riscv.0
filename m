Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00632C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 09:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDJJKeN9BslCxwxeC6z/5u+Apzeg+6YPh2i4hihCwC4=; b=oLmIkNwVVJnJuV
	dDCX52o+Xs1wxT4uHKKurnURmVpjQCPiOu7zkWhS7SH9Bx9O8aiEWJR6E/PjLRDBjmUt/zITR2hc2
	9TND9Fqwmk1isT+EvKkgwuGYXd+Yopzt+tDIH1rOEgRn/F94SG90mIWpK8EQloHEi8b4mWnrwQB4x
	PZKmDWTNNm+UeaVrvlXfDQwxJd/gEOF8BBQTkvBQCI4wCr0Lk46ZsGRWd2y+qPeW/QeAcYhrQTBeF
	Vf+NVWzeny51Qc9PR+SZxiUuWK4/o1xApr3f6Wg8ru+eQJTSVfQ3aJu1wW97Bo7ji8/viyPfJf7tG
	p8do/q2ECPdkJbbLXPCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDQi-0000000GUbQ-0SA6;
	Fri, 12 Apr 2024 09:42:44 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDQf-0000000GUa4-0xGd
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 09:42:42 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-22e6b61d652so303636fac.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 02:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1712914955; x=1713519755; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ze1DWENhxjeSOlCRPZPYtxubM7dRkcTEXeXj/CC5r3A=;
        b=R59GutcM80I+p6dPaZoNxWafGlKbMhf67Ip8K40YONVJUI/s7X1Y6zMHb0Hd8Au5Cl
         1vH4Tl9hHdWJecqXFBXGv1QrH3rxHNdd6/NvDL2UrMIeGHCOBi/PlnNss2CFoVAGazJv
         yoswnT+X0LD4jqeX9LcdV6bOr0g66s8zz9k1/IHGwfPmAWohksgDomePa9ZZZhoLxUKE
         V5aubTRPIInVZUCIMLc1qNjhXJzSJ2Fz6gdJzyMiOcGNOAKCmtnkDeAsoGdtY6iKR1Tv
         n57PUK7O3wJhIFxWekFHYVg1x5qcrhWkV79h+x0vdHbBEc32mLwoGiHeFWKuYRhPUeQX
         IAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712914955; x=1713519755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ze1DWENhxjeSOlCRPZPYtxubM7dRkcTEXeXj/CC5r3A=;
        b=iv/hLv3RchgDl7L2XJsB9K8/C29/++VzxTj/YRGvUuVmd9NrAQWGlS2wpTp6K4n4vA
         1LWq1EJK2SPecMuvd6s1fBXIEknbeJdZ9k51ojA36MivOvw/4n7O4cyZ2b56neBjyh3I
         CJfKRpx9n236pfvK4MHGLBXOR1F+jqDS5LlXCSeiEuBfp75jqLDyyldGtbKrAQdVM4+C
         CNzaBOXnNyGk1ZpmQh9XZmhsct6GOVNoMAj0GpUVT+3weUzsykUtymTHE7Xhz4wWoHZH
         ljpQSg5O6LUG97GN9ehEUZ4h1P4WK/d2L1VnbWCiRFGZVReDwIHpsJVYg9mvRu1KCQjD
         Nvxw==
X-Forwarded-Encrypted: i=1; AJvYcCX+d6ot8oOnyGlMbQ/Xcig9PwoCNUR1X3krXMFVQKRrppx7ReRmf6CJX2bvPqrj5SopdepvhHJDzTr4uhS0I7rrVhDvsCApMlsWCcaYdgng
X-Gm-Message-State: AOJu0Yx425Js7m0T6kDnsO7Tk5U6GT57c9CjF1G4issZv8neL4ySE4To
	LKlzwdQjZVGLU1lnY+xLJX1RtJJqwurqpI928+ehXhaIraUa2kZP8G7PS5INE+5RTy5d222GHIW
	jcD7dE+goPHqABqCtssdMTJl0hPVat+muZHvJ6Q==
X-Google-Smtp-Source: AGHT+IH/sAzC/4m+8OjoiblQKBrR8gWNhfHFXTBCOEtjXxsaKNwMpXmrJzZaRa5j0HjVtDAPxdFhGnqZozPIYpPkLcA=
X-Received: by 2002:a05:6871:5a05:b0:21e:b4d0:9961 with SMTP id
 on5-20020a0568715a0500b0021eb4d09961mr1977670oac.55.1712914954014; Fri, 12
 Apr 2024 02:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240407123829.36474-1-cuiyunhui@bytedance.com>
 <ZhetojJewygmTf6N@bogus> <CAEEQ3wkfHvH4jXNO5NRDf0Fc3xUkY64hp7BDBmgNVdcsmYy-kA@mail.gmail.com>
 <Zhj-4C7xlklG1m5B@bogus>
In-Reply-To: <Zhj-4C7xlklG1m5B@bogus>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 12 Apr 2024 17:42:22 +0800
Message-ID: <CAEEQ3wkO4WPaY+bPidg-fDqV5MrQwh8ESbSv-+q8Odhat9XDrQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] ACPI: PPTT: Populate cacheinfo
 entirely with PPTT
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_024241_294244_8F8B9389 
X-CRM114-Status: GOOD (  14.95  )
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

SGkgU3VkZWVwLAoKT24gRnJpLCBBcHIgMTIsIDIwMjQgYXQgNToyOeKAr1BNIFN1ZGVlcCBIb2xs
YSA8c3VkZWVwLmhvbGxhQGFybS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBBcHIgMTIsIDIwMjQg
YXQgMTA6MTA6MDVBTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90ZToKPiA+IEhpIFN1ZGVlcCwKPiA+
Cj4gPiBPbiBUaHUsIEFwciAxMSwgMjAyNCBhdCA1OjMw4oCvUE0gU3VkZWVwIEhvbGxhIDxzdWRl
ZXAuaG9sbGFAYXJtLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFN1biwgQXByIDA3LCAyMDI0
IGF0IDA4OjM4OjI4UE0gKzA4MDAsIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiA+ID4gV2hlbiB0aGUg
dHlwZSBhbmQgbGV2ZWwgaW5mb3JtYXRpb24gb2YgdGhpc19sZWFmIGNhbm5vdCBiZSBvYnRhaW5l
ZAo+ID4gPiA+IGZyb20gYXJjaCwgY2FjaGVpbmZvIGlzIGNvbXBsZXRlbHkgZmlsbGVkIGluIHdp
dGggdGhlIGNvbnRlbnQgb2YgUFBUVC4KPiA+ID4gPgo+ID4gPgo+ID4gPiBXaGljaCBwbGF0Zm9y
bSBpcyB0aGlzID8gSXMgdGhpcyBhcm02NCBiYXNlZCBvciBzb21ldGhpbmcgZWxzZSBsaWtlIFJJ
U0MtVgo+ID4gPiBiYXNlZCA/IFRoYXQgd291bGQgaGVscCB0byB1bmRlcnN0YW5kIHNvbWUgY29u
dGV4dCBoZXJlLgo+ID4gPgo+ID4KPiA+IFRoYW5rcyBmb3IgeW91ciByZXNwb25zZSwgUklTQy1W
IGN1cnJlbnRseSBoYXMgdGhpcyByZXF1aXJlbWVudC4KPiA+IFBsZWFzZSBzZWU6IGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDI0MDQwNzEy
MzgyOS4zNjQ3NC0yLWN1aXl1bmh1aUBieXRlZGFuY2UuY29tLwo+ID4KPgo+IEl0IHdvdWxkIGJl
IGhlbHBmdWwgZm9yIHRoZSByZXZpZXcgaWYgeW91IGhhdmUgc3VjaCBpbmZvcm1hdGlvbiBpbiB0
aGUKPiBjb21taXQgbWVzc2FnZS4KCk9rYXksIEkgd2lsbCB1cGRhdGUgaXQgaW4gdGhlIGNvbW1p
dCBtZXNzYWdlIGluIHYyLiBEbyB5b3UgaGF2ZSBzb21lCmNvbW1lbnRzIG9uIHRoZSBjb250ZW50
IG9mIHRoZSBwYXRjaD8KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
