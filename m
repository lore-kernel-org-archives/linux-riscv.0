Return-Path: <SRS0=+XCi=PL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CCA5C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Oct 2021 20:14:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F354D60F4B
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Oct 2021 20:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F354D60F4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=w3zTy4wIMiL5EdijSh6MsbED1ijZxnxgeAm1sK4yj9Y=; b=T3kknhe4m4dLoUAkFvcTkR4+je
	IVKYW4Y6nI8ARwiW++X995J77RqtQ52x9EGvUpidsVIzg19pyTaOniyMEQTxpj+OY8zaPhs4o6aj2
	xn6ZYB9IuUXUforinVGsULPmyD1g1etsSCaSsS72yLihsECQFNPqE1vjf3IMhsMy8bJzopAmtl8jO
	2lhEU6bi8Ei6gsqobT9w/4WFS6M5aJ0fN4qmpCPNQWW6kAlN0y5X7RuqxCLv7yaevXkgGFDg1jjAf
	uqMbZpz+PwZavdDe9a/9bSJYEXQcg1ogsqW+pal/51UAVAKcWLrGTURRxp19ZMEL2CJq0QcdXU/lF
	+RxjWrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meNPE-00DFDF-JC; Sat, 23 Oct 2021 20:14:16 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meNPB-00DFCC-CG
 for linux-riscv@lists.infradead.org; Sat, 23 Oct 2021 20:14:14 +0000
Received: by mail-pf1-x435.google.com with SMTP id d9so6778372pfl.6
 for <linux-riscv@lists.infradead.org>; Sat, 23 Oct 2021 13:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=2q2Ai1W7zLMeyRuJVIqJmYh8Gpg5gJL9O2P05Fxiya8=;
 b=jDXIeRw2lMvP9QXCRDr98k0E3NG6kVLbc6ibvQMLhmNJyYeTgi4pPlxhZcjbZJk4i0
 IyQm7LA87ns61cISjW228eZeKxZX/ER4AgwIF/+WHCjuXZfUYFPEKppPOzh2aZ+d694B
 3ha3oMnfaNs0Bg9g9NZ/V5ReGH7gGeb5VROrVGM5yVuv044NomMEUZvHZtLJ0ZoJvJCf
 oyf1uFtcZVb2eFeH5yDs9W4QWqBC9p05Tzmf2LP6bEws0Zyyg/7aofj26QQ+Qd4Tyz4s
 9gNeXHwZtVHL59ZDzTVkUHqn3ofTNxjOG4GQv4x7Z+P6uh311NhS3FBoydSMXNvB/WWK
 GkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=2q2Ai1W7zLMeyRuJVIqJmYh8Gpg5gJL9O2P05Fxiya8=;
 b=APsEYsWudlawYoC/suJB5t6f5uVCn28hvART4vKXC+rYwNR9d0iNtQE1CDXjswt8HV
 XIl96wNUNLSMILTfF+5XirQMneBUiecC0lwDB2at0ALjbQM4F8fIzRdM4JG9ddMynnHq
 K+1UeEYO3LFr8iLzoj8i1lHRXat7Bu/zzFZLLHXrr26XdsW3HqWRtCNjQj8/r38Kzeny
 9M/rW5tANETBVb9Rme7M30l/z5MiYxXsUfhnEwZpwT6yTikAsDDPIJa7EUq0v6xD1DXR
 x3vYuaIB0bOX8aCf1Qm5uFiTCZoGUuJTYeOJ16ytUal4bJYhS68cLJglC4F1EG7TXIkQ
 JRtg==
X-Gm-Message-State: AOAM5333DN+17PesatmgIyXYg0cBEk+x9510fLP41Dr3qp7AX+Cnpmk7
 ehUKRBPhAzS4s38Jcxs//BLitQ==
X-Google-Smtp-Source: ABdhPJw4wq16pwdD9R69riGYv3v4DtTpscpbmhP+5/EUwMF5d/exuQRw/i3eOSBVVEhc8KDGM0yrrQ==
X-Received: by 2002:a63:7e42:: with SMTP id o2mr6020435pgn.296.1635020051809; 
 Sat, 23 Oct 2021 13:14:11 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a11sm15191155pfv.11.2021.10.23.13.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 13:14:11 -0700 (PDT)
Date: Sat, 23 Oct 2021 13:14:11 -0700 (PDT)
X-Google-Original-Date: Sat, 23 Oct 2021 13:13:38 PDT (-0700)
Subject: Re: [PATCH] riscv: Don't use va_pa_offset on kdump
In-Reply-To: <ae122f06f0de1075cf266b639ce36da3@mailhost.ics.forth.gr>
CC: alexandre.ghiti@canonical.com, mick@ics.forth.gr,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mick@ics.forth.gr
Message-ID: <mhng-b28fa0cb-24ee-40d1-9f02-619605a4cc9a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_131413_490148_4296CE98 
X-CRM114-Status: GOOD (  23.77  )
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

T24gU2F0LCAwOSBPY3QgMjAyMSAwNjoxODo0OCBQRFQgKC0wNzAwKSwgbWlja0BpY3MuZm9ydGgu
Z3Igd3JvdGU6Cj4gzqPPhM65z4IgMjAyMS0xMC0wNiAxNDoxMywgQWxleGFuZHJlIEdoaXRpIM6t
zrPPgc6xz4jOtToKPj4+ICsKPj4+ICsgICAgICAgLyogVGhpcyB3aWxsIHRyaWdnZXIgYSBqdW1w
IHRvIENTUl9TVFZFQyBhbnl3YXkgKi8KPj4+ICAgICAgICAgamFsciAgICB6ZXJvLCBhMiwgMAo+
Pgo+PiBUaGUgbGFzdCBqdW1wIHRvIGEyIGNhbiBiZSByZW1vdmVkIHNpbmNlIHRoZSBmYXVsdCB3
aWxsIGJlIHRyaWdnZXJlZAo+PiBiZWZvcmUgZXZlbiByZWFjaGluZyB0aGlzIGluc3RydWN0aW9u
Lgo+Pgo+Cj4gSnVzdCBzd2l0Y2hpbmcgU0FUUCB0byB6ZXJvIGRvZXNuJ3QgZ2VuZXJhdGUgYSB0
cmFwIHVubGVzcyBtc3RhdHVzLlRWTQo+IGlzIHNldCAoZm9yIHZpc3VhbGl6YXRpb24gcHVycG9z
ZXMpLiBUaGUgaGFydCB3aWxsIHRyeSBhbmQgZXhlY3V0ZSB0aGUKPiBuZXh0IGluc3RydWN0aW9u
IGJ1dCBpdCdzIG5vdCBjbGVhciBpbiB0aGUgc3BlYyB3aGF0IGhhcHBlbnMgaW4gY2FzZSB0aGUK
PiBjb2RlIGlzIGNhY2hlZCwgSSBkb24ndCB3YW50IHRvIHJlbHkgc29sZWx5IG9uIFNUVkVDLiBJ
IHByZWZlciBoYXZpbmcKPiB0aGlzIGluc3RydWN0aW9uIHRoZXJlLCBub3RlIHRoYXQgc29tZSBl
YXJsaWVyIFFFTVUgdmVyc2lvbnMgYWxzbyBoYWQKPiB0aGlzIGJlaGF2aW9yICh0aGUgb3JpZ2lu
YWwga2R1bXAgcGF0Y2ggZGlkbid0IHNldCBTVFZFQyBhbmQgaXQgd29ya2VkCj4gZmluZSBhZnRl
ciBzZXR0aW5nIFNBVFAgdG8gemVybykuCgpJSVJDIHRoaXMgY2FtZSBkb3duIHRvIHNvbWUgdmVy
eSBzcGVjaWZpYyB3b3JkaW5nIGluIHRoZSBzcGVjLiAgClNvbWV0aGluZyBhbG9uZyB0aGUgbGlu
ZXMgb2YgdGhlIDAgaW4gU0FUUCBtZWFuaW5nICJubyB0cmFuc2xhdGlvbiIsIApTRkVOQ0UuVk1B
IG9yZGVyaW5nIHRyYW5zbGF0aW9ucywgYW5kIHRoZSBnZW5lcmFsICJpZiB0aGUgc3BlYyBkb2Vz
bid0IAptZW50aW9uIGl0IHRoZW4gaXQgaGFzIHRvIHdvcmsiIGxvZ2ljLiAgSSB0aG91Z2h0IEkg
b3BlbmVkIGEgc3BlYyBpc3N1ZSAKYWJvdXQgdGhpcyBmb3IgY2xhcmlmaWNhdGlvbiwgYnV0IEkg
Y2FuJ3QgZmluZCBpdC4KClRoYXQgc2FpZCwgSSdtIHBlcmZlY3RseSBmaW5lIHRha2luZyB0aGUg
c2FmZSBhcHByb2FjaCBoZXJlIGFzIGl0J3Mgbm90IApsaWtlIHRoZSBwZXJmb3JtYW5jZSBtYXR0
ZXJzIGhlcmUuICBXYXJyYW50cyBhIGNvbW1lbnQsIHRob3VnaC4KCj4KPj4KPj4gVGhpcyBwYXRj
aCBmaXhlcyBhIHJlZ3Jlc3Npb24gaW50cm9kdWNlZCB3aGVuIG1vdmluZyB0aGUga2VybmVsIHRv
IHRoZQo+PiBlbmQgb2YgdGhlIGFkZHJlc3Mgc3BhY2UsIHNvIHdlIHNob3VsZCBhZGQ6Cj4+IEZp
eGVzOiAyYmZjNmNkODFiZDEgKCJyaXNjdjogTW92ZSBrZXJuZWwgbWFwcGluZyBvdXRzaWRlIG9m
IGxpbmVhcgo+PiBtYXBwaW5nIikKPj4KPj4gQW5kIGl0IHNob3VsZCBiZSBiYWNrcG9ydGVkIHRv
IDUuMTMgYW5kIDUuMTQuIEl0IHNlZW1zIHRoYXQgdGhlCj4+IGZvbGxvd2luZyB0YWdzIHNob3Vs
ZCBiZSBlbm91Z2g6Cj4+Cj4+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyA1LjEzCj4+
IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyA1LjE0Cj4+Cj4+IEFuZCBmaW5hbGx5LCB5
b3UgY2FuIGFkZDoKPj4KPj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0
aS5mcj4KPj4KPgo+IEFDSywgdGhhbmtzICEgSSdsbCByZXNlbmQgdGhlIHBhdGNoIHdpdGggdGhl
IHRhZ3MgeW91IG1lbnRpb25lZC4KCkkgZG9uJ3QgaGF2ZSBhIHYyIGluIG15IGluYm94LCBkaWQg
SSBtaXNzIHNvbWV0aGluZz8gIEFsc28sIGlmIGl0J3MganVzdCAKdGhlIHRhZ3MgdGhlbiBpdCdz
IGdlbmVyYWxseSBub3QgbmVjZXNzYXJ5IHRvIHJlLXNlbmQgc29tZXRoaW5nLiAgVGhlIApjb21t
ZW50IGRvZXMsIHRob3VnaC4KCkxNSyBpZiB5b3Ugd2FudCBtZSB0byBkZWFsIHdpdGggdGhpcywg
b3IgaWYgdGhlcmUncyBnb2luZyB0byBiZSBhIHYyLgoKVGhhbmtzIQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
