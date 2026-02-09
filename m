Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7E9E81BA6
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 11:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWAq1IkKwegyoNCOUouhNrSJ1O3LJJT9U/TYag0pudY=; b=tnUk57k5+hQWg4
	M/71zIzfni9ZWC6jf3rfGOsv/NT3HdLVnt47Bcsu6U2WhSN6fK8vXN+BL1Wv9RQQuKO8uBEV2AjoB
	OeUWbgVlfKCF6RRzVdXOZAzuF8vY7ISibzZ9L852r4MB7PAo3Iu7pmoXt8Hxbmxq82wIWaLUaGG8S
	TOp32h13l463HiQmC9CF+BuDq98vpZ6/TydlpZT7UQZ8Rctq8lSK3CBbg8ckLnsq3h8jrokWbFJF9
	iFvwVJ+e6R32xZ0eeCpiW+anVgU/qRvb7kg4Am9/QUuflIc4gA69bB9hE6KoXkC6AsAYU9b5wiJyl
	zvb8MJrqMDPHfJY2nNzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPsm-0000000FKmv-1VAv;
	Mon, 09 Feb 2026 11:56:48 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPsj-0000000FKma-2czw
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 11:56:47 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2ba6aa57d5fso953596eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Feb 2026 03:56:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770638204; cv=none;
        d=google.com; s=arc-20240605;
        b=BrDVrvjISxDeG9JdTq9SAAJ+2g/4gAav/oSOg/JxReq8zSl0ZTQIIVgwzLSF42Tp44
         iG+eUgGE9jr0G/nxWOn1rNt603vbB1eV6zA5+zwFJuloV2IBhEzLlrfK6WnuBjpczXMo
         +FBCBf1443WRqLts+f6cs90EXd47XgG7vhW7EjOzz4B6v/2ZDvq4yNex6ECNV4CD+6AE
         jEpTFTgqpcU9XwXjCwTwJ90URfSVedUPhMBrpjIPIfga3F3U0XUSQrGN64+1pARgJpZE
         rTRKCkHCDNNbzbQ5rvi8Wl7TavAKDIRJ+PBii2whmToP/kVumKF5Ll4euVBduXHxKr+S
         pOkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UsYcHGylDjeAV44BY1Tm3axsmC/oOGFzSeWdtTEtrb8=;
        fh=oZRqOqNVKhk6qp+wtgazocbB7ucFscpzT4np6HtkrpU=;
        b=jP2QV72Ja2tWtOATF/7aVN/Yx2YnH+Z9A0cUKHx7f4IsbnhEHxP84Nk/Q5Hj48TcjO
         6XKgkit3Pq9z1THC9yp/VhuO1s4k88WSpIUvdB7JmbZh+c80qVCXHiu53r7LZEvyVWZ+
         d+uky4VwzE3Fsl29zgzi7X0EWyEnafR/BcN0+ILum8Ob9t5ph/XMowKRS6LNtKXa7Y7/
         /t13TxXMS9ev5IGjPlbn9uUdtnrxrHNYWE7llQU/475Ng+m8FUTrQktrmJAXztJMgjNQ
         Ttla9RvoUoYqCyavquD7x46ON8RyaG3mNO7RfhT7QwtzYM0cwPI+qq9hHX6vn5dY1ntc
         EJqw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1770638204; x=1771243004; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsYcHGylDjeAV44BY1Tm3axsmC/oOGFzSeWdtTEtrb8=;
        b=bnMEqK2bz+8iBAaKbW1NJM/Oj5qLZNTIbq3QiqSDceaQTOjBYIsDG6hbiWqwfjcrPh
         BBT+S+GiflgZQHFOMqMV7bDrTKoh5yn4RtVIO4e2StG+he/oE9mQQDTozzS6ltnFILP8
         kqxyAh44nP+krzMcPIDoTy0oQZQjzwvktNVVfk0Sr+6ZYdRTV+eourve/hFvv8c1hIre
         I/QzNvGgc1DMTfdv6DT4yfvnUm6zkMRow05JgB0CgF6EpE4pVNsZqNcUBqFOzC0sIFon
         ckie4g8dLLl14WqLoE867CO1b4GldFK44T2alY0YAthE7sNsqwu8MPeNr9xzxES9sCu2
         yjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770638204; x=1771243004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UsYcHGylDjeAV44BY1Tm3axsmC/oOGFzSeWdtTEtrb8=;
        b=GcmdG+2/+x05CwPasF2kHfUf7X8mBCLa0rvzfxvpxYF4OSInb1dsexjfuaU20cRbOR
         dpAT41JvhgP6MLtZ5CsO/sjc8VJXTfgs1WVcYYVCvoIG4aMGwgDacIJ/rGc6mG9P2E0b
         /EvJRS2HlYnyS3eCilJOgAFpXFPLlQ/h9PJHfxE5iEnK4dDrdakJoA3JPmD9mtiiZF58
         J9aeyyLRITQVSV56T3yuMBz/FqgGzHREQCqmLPJO2MlvqIkbPliVb/dVaN+HIUzsZc4j
         uKhZwockCvplF4FW3xi5x371DTl3XjsXi1arH7hQBvWvjV5RzUBJBZ1y53omp7PvIAAc
         W6kQ==
X-Forwarded-Encrypted: i=1; AJvYcCU88GpN0m4LT3P1DF9VKL6GMSO9WbySaX8CO6WaC82O8cIOnEN4yw9nzJaj5Wip3q5/SA5nklASZE9Xvw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq5Yrg+TQKEhbZz9R1ic4th9KElDN9vQKDT/HtffCbgXjLUhR9
	vDVt0iOlqocF5Dc01oKMwo2LH/ZN8XbPQhA6J2DVL+TLyMOYdFGhzI6/iEzHm84kNGXGB08pkRY
	YWKGBne9yb8e9gFTKZYojhh70MaDb4R7tTbtFv6VgFA==
X-Gm-Gg: AZuq6aJj1HQRLmNTHj2uY4b4X90QMK0tiqjifYmsrPk+IqdKVVDYxBmGZgD4ljYiaKx
	VCcquNbAW+EZzpnPu8xRsfw/XVivajfk9DhLv36hrtOo26+9wdt7SujjjqHrnhF78mBeIzfZlVh
	GlYXWYzjht/KnO66GcP5XkF76V3sBWaY8jjrKtzukd0ge4xtIxX3pTHTGw0+FbFrnslTbnvItxN
	7v6ZAphMeiaRGROigoRtLsEmFz2cxM/8uan4aVGO/G8/vd7eQR2Zu5skKKEq8ZHhhTJCDy8LEog
	ifMbHI/8QRb6+Zhvkgjkt8mpZ8nE
X-Received: by 2002:a05:7300:e426:b0:2b4:5514:38fd with SMTP id
 5a478bee46e88-2b8567240camr5031587eec.20.1770638203674; Mon, 09 Feb 2026
 03:56:43 -0800 (PST)
MIME-Version: 1.0
References: <20251101154245.162492-1-apatel@ventanamicro.com>
 <20251101154245.162492-12-apatel@ventanamicro.com> <CAPqJEFodbAyHcLTL3UCQ6rKvRmbVDNm-zK9D5esg-ek9n4VeUw@mail.gmail.com>
In-Reply-To: <CAPqJEFodbAyHcLTL3UCQ6rKvRmbVDNm-zK9D5esg-ek9n4VeUw@mail.gmail.com>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Mon, 9 Feb 2026 17:26:07 +0530
X-Gm-Features: AZwV_QhsxWqf_vsAc2K8pZSMqDE1E14LK7XTmZUxXDF5aJXvVARuJa6W3RIGhXo
Message-ID: <CAN37VV5bn6XiO0ykX8-WJLNE8447r7=zU1hy=KU+Z4RcoYtMOA@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] perf tools: Initial support for RISC-V trace decoder
To: Eric Lin <eric.lin@sifive.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Greg KH <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, 
	linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, 
	Liang Kan <kan.liang@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_035645_700077_6639769B 
X-CRM114-Status: GOOD (  29.57  )
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

SGkgRXJpYywKCk9uIEZyaSwgRmViIDYsIDIwMjYgYXQgNjoyNeKAr1BNIEVyaWMgTGluIDxlcmlj
LmxpbkBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiBTYXQsIE5vdiAxLCAy
MDI1IGF0IDExOjQ14oCvUE0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdy
b3RlOgo+ID4KPiA+IEZyb206IE1heXVyZXNoIENoaXRhbGUgPG1jaGl0YWxlQHZlbnRhbmFtaWNy
by5jb20+Cj4gPgo+ID4gQWRkIGJhcmUgYm9uZXMgc3VwcG9ydCBmb3IgUklTQy1WIHRyYWNlIGRl
Y29kZXIgc28gdGhhdCB0aGUgZGF0YSByZWNlaXZlZAo+ID4gZnJvbSB0aGUgaGFyZHdhcmUgYnkg
dGhlIFJJU0MtViB0cmFjZSBwZXJmIGRyaXZlciBjYW4gYmUgd3JpdHRlbiB0byB0aGUKPiA+IHBl
cmYgcmVjb3JkIG91dHB1dCBmaWxlLgo+ID4KPiA+IENvLWRldmVsb3BlZC1ieTogQW51cCBQYXRl
bCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVs
IDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IE1heXVyZXNoIENo
aXRhbGUgPG1jaGl0YWxlQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0KPiA+ICB0b29scy9wZXJm
L3V0aWwvQnVpbGQgICAgICAgICAgICAgfCAgMSArCj4gPiAgdG9vbHMvcGVyZi91dGlsL2F1eHRy
YWNlLmMgICAgICAgIHwgIDMgKwo+ID4gIHRvb2xzL3BlcmYvdXRpbC9ydnRyYWNlLWRlY29kZXIu
YyB8IDkxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICB0b29scy9wZXJmL3V0
aWwvcnZ0cmFjZS5oICAgICAgICAgfCAgMiArCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA5NyBpbnNl
cnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvdXRpbC9ydnRyYWNl
LWRlY29kZXIuYwo+ID4KPiA+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3V0aWwvQnVpbGQgYi90
b29scy9wZXJmL3V0aWwvQnVpbGQKPiA+IGluZGV4IDRiZTMxM2NkMTE1YS4uZjczNmNlYTUxZmQ4
IDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvcGVyZi91dGlsL0J1aWxkCj4gPiArKysgYi90b29scy9w
ZXJmL3V0aWwvQnVpbGQKPiA+IEBAIC0xNDUsNiArMTQ1LDcgQEAgcGVyZi11dGlsLSQoQ09ORklH
X0FVWFRSQUNFKSArPSBjcy1ldG0ubwo+ID4gIHBlcmYtdXRpbC0kKENPTkZJR19BVVhUUkFDRSkg
Kz0gY3MtZXRtLWRlY29kZXIvCj4gPiAgZW5kaWYKPiA+ICBwZXJmLXV0aWwtJChDT05GSUdfQVVY
VFJBQ0UpICs9IGNzLWV0bS1iYXNlLm8KPiA+ICtwZXJmLXV0aWwtJChDT05GSUdfQVVYVFJBQ0Up
ICs9IHJ2dHJhY2UtZGVjb2Rlci5vCj4gPgo+ID4gIHBlcmYtdXRpbC15ICs9IHBhcnNlLWJyYW5j
aC1vcHRpb25zLm8KPiA+ICBwZXJmLXV0aWwteSArPSBkdW1wLWluc24ubwo+ID4gZGlmZiAtLWdp
dCBhL3Rvb2xzL3BlcmYvdXRpbC9hdXh0cmFjZS5jIGIvdG9vbHMvcGVyZi91dGlsL2F1eHRyYWNl
LmMKPiA+IGluZGV4IGM5MDU1NjNlMGQ4YS4uMjk5OTkxZDVkMzA1IDEwMDY0NAo+ID4gLS0tIGEv
dG9vbHMvcGVyZi91dGlsL2F1eHRyYWNlLmMKPiA+ICsrKyBiL3Rvb2xzL3BlcmYvdXRpbC9hdXh0
cmFjZS5jCj4gPiBAQCAtNTQsNiArNTQsNyBAQAo+ID4gICNpbmNsdWRlICJhcm0tc3BlLmgiCj4g
PiAgI2luY2x1ZGUgImhpc2ktcHR0LmgiCj4gPiAgI2luY2x1ZGUgInMzOTAtY3B1bXNmLmgiCj4g
PiArI2luY2x1ZGUgInJ2dHJhY2UuaCIKPiA+ICAjaW5jbHVkZSAidXRpbC9tbWFwLmgiCj4gPiAg
I2luY2x1ZGUgInBvd2VycGMtdnBhZHRsLmgiCj4gPgo+ID4gQEAgLTEzOTUsNiArMTM5Niw4IEBA
IGludCBwZXJmX2V2ZW50X19wcm9jZXNzX2F1eHRyYWNlX2luZm8oc3RydWN0IHBlcmZfc2Vzc2lv
biAqc2Vzc2lvbiwKPiA+ICAgICAgICAgICAgICAgICBlcnIgPSBwb3dlcnBjX3ZwYWR0bF9wcm9j
ZXNzX2F1eHRyYWNlX2luZm8oZXZlbnQsIHNlc3Npb24pOwo+ID4gICAgICAgICAgICAgICAgIGJy
ZWFrOwo+ID4gICAgICAgICBjYXNlIFBFUkZfQVVYVFJBQ0VfUklTQ1ZfVFJBQ0U6Cj4gPiArICAg
ICAgICAgICAgICAgZXJyID0gcnZ0cmFjZV9fcHJvY2Vzc19hdXh0cmFjZV9pbmZvKGV2ZW50LCBz
ZXNzaW9uKTsKPiA+ICsgICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgICAgY2FzZSBQRVJG
X0FVWFRSQUNFX1VOS05PV046Cj4gPiAgICAgICAgIGRlZmF1bHQ6Cj4gPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi91dGlsL3J2dHJh
Y2UtZGVjb2Rlci5jIGIvdG9vbHMvcGVyZi91dGlsL3J2dHJhY2UtZGVjb2Rlci5jCj4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi41OGRiNWNhNjJjMWEKPiA+
IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3Rvb2xzL3BlcmYvdXRpbC9ydnRyYWNlLWRlY29kZXIu
Ywo+ID4gQEAgLTAsMCArMSw5MSBAQAo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wCj4gPiArLyoKPiA+ICsgKiBSSVNDLVYgdHJhY2UgRGVjb2Rlcgo+ID4gKyAqLwo+ID4g
Kwo+ID4gKyNpbmNsdWRlIDxlcnJuby5oPgo+ID4gKyNpbmNsdWRlIDxpbnR0eXBlcy5oPgo+ID4g
KyNpbmNsdWRlICJldmxpc3QuaCIKPiA+ICsjaW5jbHVkZSA8aW50ZXJuYWwvbGliLmg+Cj4gPiAr
I2luY2x1ZGUgInJ2dHJhY2UuaCIKPiA+ICsKPiA+ICtzdHJ1Y3QgcnZ0cmFjZV9kZWNvZGVyIHsK
PiA+ICsgICAgICAgc3RydWN0IGF1eHRyYWNlIGF1eHRyYWNlOwo+ID4gKyAgICAgICB1MzIgYXV4
dHJhY2VfdHlwZTsKPiA+ICsgICAgICAgc3RydWN0IHBlcmZfc2Vzc2lvbiAqc2Vzc2lvbjsKPiA+
ICsgICAgICAgc3RydWN0IG1hY2hpbmUgKm1hY2hpbmU7Cj4gPiArICAgICAgIHUzMiBwbXVfdHlw
ZTsKPiA+ICt9Owo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgcnZ0cmFjZV9wcm9jZXNzX2V2ZW50KHN0
cnVjdCBwZXJmX3Nlc3Npb24gKnNlc3Npb24gX19tYXliZV91bnVzZWQsCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1bmlvbiBwZXJmX2V2ZW50ICpldmVudCBfX21heWJlX3Vu
dXNlZCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwZXJmX3Nh
bXBsZSAqc2FtcGxlIF9fbWF5YmVfdW51c2VkLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29uc3Qgc3RydWN0IHBlcmZfdG9vbCAqdG9vbCBfX21heWJlX3VudXNlZCkKPiA+
ICt7Cj4gPiArICAgICAgIHJldHVybiAwOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW50IHJ2
dHJhY2VfcHJvY2Vzc19hdXh0cmFjZV9ldmVudChzdHJ1Y3QgcGVyZl9zZXNzaW9uICpzZXNzaW9u
IF9fbWF5YmVfdW51c2VkLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5pb24gcGVyZl9ldmVudCAqZXZlbnQgX19tYXliZV91bnVzZWQsCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgcGVyZl90b29s
ICp0b29sIF9fbWF5YmVfdW51c2VkKQo+ID4gK3sKPiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiAr
fQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgcnZ0cmFjZV9mbHVzaChzdHJ1Y3QgcGVyZl9zZXNzaW9u
ICpzZXNzaW9uIF9fbWF5YmVfdW51c2VkLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHN0cnVjdCBwZXJmX3Rvb2wgKnRvb2wgX19tYXliZV91bnVzZWQpCj4gPiArewo+ID4gKyAg
ICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHZvaWQgcnZ0cmFjZV9mcmVl
X2V2ZW50cyhzdHJ1Y3QgcGVyZl9zZXNzaW9uICpzZXNzaW9uIF9fbWF5YmVfdW51c2VkKQo+ID4g
K3sKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHZvaWQgcnZ0cmFjZV9mcmVlKHN0cnVjdCBwZXJm
X3Nlc3Npb24gKnNlc3Npb24pCj4gPiArewo+ID4gKyAgICAgICBzdHJ1Y3QgcnZ0cmFjZV9kZWNv
ZGVyICpwdHIgPSBjb250YWluZXJfb2Yoc2Vzc2lvbi0+YXV4dHJhY2UsIHN0cnVjdCBydnRyYWNl
X2RlY29kZXIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGF1eHRyYWNlKTsKPiA+ICsKPiA+ICsgICAgICAgc2Vzc2lvbi0+YXV4dHJhY2UgPSBOVUxMOwo+
ID4gKyAgICAgICBmcmVlKHB0cik7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBib29sIHJ2dHJh
Y2VfZXZzZWxfaXNfYXV4dHJhY2Uoc3RydWN0IHBlcmZfc2Vzc2lvbiAqc2Vzc2lvbiwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGV2c2VsICpldnNlbCkK
PiA+ICt7Cj4gPiArICAgICAgIHN0cnVjdCBydnRyYWNlX2RlY29kZXIgKnB0ciA9IGNvbnRhaW5l
cl9vZihzZXNzaW9uLT5hdXh0cmFjZSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBydnRyYWNlX2RlY29kZXIsIGF1eHRyYWNlKTsK
PiA+ICsKPiA+ICsgICAgICAgcmV0dXJuIGV2c2VsLT5jb3JlLmF0dHIudHlwZSA9PSBwdHItPnBt
dV90eXBlOwo+ID4gK30KPiA+ICsKPiA+ICtpbnQgcnZ0cmFjZV9fcHJvY2Vzc19hdXh0cmFjZV9p
bmZvKHVuaW9uIHBlcmZfZXZlbnQgKmV2ZW50LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgcGVyZl9zZXNzaW9uICpzZXNzaW9uKQo+ID4gK3sKPiA+ICsgICAg
ICAgc3RydWN0IHBlcmZfcmVjb3JkX2F1eHRyYWNlX2luZm8gKmF1eHRyYWNlX2luZm8gPSAmZXZl
bnQtPmF1eHRyYWNlX2luZm87Cj4gPiArICAgICAgIHN0cnVjdCBydnRyYWNlX2RlY29kZXIgKnB0
cjsKPiA+ICsKPiA+ICsgICAgICAgaWYgKGF1eHRyYWNlX2luZm8tPmhlYWRlci5zaXplIDwgUlZU
UkFDRV9BVVhUUkFDRV9QUklWX1NJWkUgKwo+ID4gKyAgICAgICAgICAgc2l6ZW9mKHN0cnVjdCBw
ZXJmX3JlY29yZF9hdXh0cmFjZV9pbmZvKSkKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPiA+ICsKPiA+ICsgICAgICAgcHRyID0gemFsbG9jKHNpemVvZigqcHRyKSk7Cj4gPiAr
ICAgICAgIGlmICghcHRyKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4g
Kwo+ID4gKyAgICAgICBwdHItPnNlc3Npb24gPSBzZXNzaW9uOwo+ID4gKyAgICAgICBwdHItPm1h
Y2hpbmUgPSAmc2Vzc2lvbi0+bWFjaGluZXMuaG9zdDsKPiA+ICsgICAgICAgcHRyLT5hdXh0cmFj
ZV90eXBlID0gYXV4dHJhY2VfaW5mby0+dHlwZTsKPiA+ICsgICAgICAgcHRyLT5wbXVfdHlwZSA9
IGF1eHRyYWNlX2luZm8tPnByaXZbMF07Cj4gPiArCj4gPiArICAgICAgIHB0ci0+YXV4dHJhY2Uu
cHJvY2Vzc19ldmVudCA9IHJ2dHJhY2VfcHJvY2Vzc19ldmVudDsKPiA+ICsgICAgICAgcHRyLT5h
dXh0cmFjZS5wcm9jZXNzX2F1eHRyYWNlX2V2ZW50ID0gcnZ0cmFjZV9wcm9jZXNzX2F1eHRyYWNl
X2V2ZW50Owo+ID4gKyAgICAgICBwdHItPmF1eHRyYWNlLmZsdXNoX2V2ZW50cyA9IHJ2dHJhY2Vf
Zmx1c2g7Cj4gPiArICAgICAgIHB0ci0+YXV4dHJhY2UuZnJlZV9ldmVudHMgPSBydnRyYWNlX2Zy
ZWVfZXZlbnRzOwo+ID4gKyAgICAgICBwdHItPmF1eHRyYWNlLmZyZWUgPSBydnRyYWNlX2ZyZWU7
Cj4gPiArICAgICAgIHB0ci0+YXV4dHJhY2UuZXZzZWxfaXNfYXV4dHJhY2UgPSBydnRyYWNlX2V2
c2VsX2lzX2F1eHRyYWNlOwo+ID4gKyAgICAgICBzZXNzaW9uLT5hdXh0cmFjZSA9ICZwdHItPmF1
eHRyYWNlOwo+ID4gKwo+ID4gKyAgICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvcGVyZi91dGlsL3J2dHJhY2UuaCBiL3Rvb2xzL3BlcmYvdXRpbC9ydnRyYWNlLmgK
PiA+IGluZGV4IDkzYzA0MWRiODY2MC4uZmRmMmU1ODY2Yzg1IDEwMDY0NAo+ID4gLS0tIGEvdG9v
bHMvcGVyZi91dGlsL3J2dHJhY2UuaAo+ID4gKysrIGIvdG9vbHMvcGVyZi91dGlsL3J2dHJhY2Uu
aAo+ID4gQEAgLTE1LDQgKzE1LDYgQEAKPiA+Cj4gPiAgI2RlZmluZSBSVlRSQUNFX0FVWFRSQUNF
X1BSSVZfU0laRSAgICAgc2l6ZW9mKHU2NCkKPiA+Cj4gPiAraW50IHJ2dHJhY2VfX3Byb2Nlc3Nf
YXV4dHJhY2VfaW5mbyh1bmlvbiBwZXJmX2V2ZW50ICpldmVudCwgc3RydWN0IHBlcmZfc2Vzc2lv
biAqc2Vzc2lvbik7Cj4gPiArc3RydWN0IGF1eHRyYWNlX3JlY29yZCAqcnZ0cmFjZV9yZWNvcmRf
aW5pdChpbnQgKmVycik7Cj4KPiBJdCBsb29rcyBsaWtlIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBg
cnZ0cmFjZV9yZWNvcmRpbmdfaW5pdGAgaW4gdGhlCj4gYXV4dHJhY2UuYyBmaWxlIGlzIHN0YXRp
YyAocHJpdmF0ZSksIGFuZCB0aGUgYXJndW1lbnRzIGRvbid0IG1hdGNoCj4gdGhpcyBkZWNsYXJh
dGlvbi4KPiBTaG91bGQgd2UgcmVtb3ZlICJzdGF0aWMiIGZyb20gYXV4dHJhY2UuYyBhbmQgdXBk
YXRlIHRoaXMgcHJvdG90eXBlCj4gdG86ICJzdHJ1Y3QgYXV4dHJhY2VfcmVjb3JkICpydnRyYWNl
X3JlY29yZGluZ19pbml0KGludCAqZXJyLCBzdHJ1Y3QKPiBwZXJmX3BtdSAqcnZ0cmFjZV9wbXUp
OyI/Cj4KPiBPciBzaG91bGQgd2Ugc2ltcGx5IHJlbW92ZSB0aGlzIGRlY2xhcmF0aW9uIGZyb20g
dGhlIGhlYWRlcj8gVGhhbmtzLgpUaGUgZGVjbGFyYXRpb24gc2hvdWxkIGJlIHJlbW92ZWQgZnJv
bSB0aGUgaGVhZGVyLgoKPgo+IFJlZ2FyZHMsCj4gRXJpYyBMaW4sCj4KPiA+ICAjZW5kaWYKPiA+
IC0tCj4gPiAyLjQzLjAKPiA+Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4gbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
