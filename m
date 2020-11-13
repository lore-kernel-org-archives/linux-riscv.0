Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE0EFC4742C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 13:17:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40E802223C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 13:17:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hn06e8Ia";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXZWaDNC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40E802223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lmcc3uTIBtRK8cvq/6mIFU/NuZ/6tAHEn4n3gq1sjFY=; b=Hn06e8IaZ6Rjshft4F8CKjVsB
	aCpzDmYrFAVD6RdnDaO2ghWQoIn2+dWyZ5u03aDdj69wogb/oE4PZVytorlc0sp3lN/xMoxvjvTPN
	qZDAesb5f7M903ay9zDSI3p7UqXlcPSmdqiK63rRMPJJZ9WSvHMy4tBwLP3sN1I3/LXnC8fGw7den
	7nYSOYuhAi+zm7XqTJ1mPXmei2IuFQZWNL8OCddrRQq33fqklhQUma66AOeMCL9kfAvVWkuQwUrRO
	zB/iFZZh8lObjMjkL4z6uk1cWBtd4G4NNv8L9VlerafLsIE0a4g6bAJrGa1VD3cTP+l/qo87uKZRQ
	gQHfU2MEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdYx7-0003TG-Qa; Fri, 13 Nov 2020 13:17:21 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYx5-0003S2-6X
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 13:17:20 +0000
Received: by mail-wm1-x329.google.com with SMTP id 23so8045535wmg.1
 for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2020 05:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ic34olRO1gILB7gSPiIOtGJOG1ezfBO762HyFmKeo4c=;
 b=dXZWaDNCupkDEDcP1H9UDTiR9J/VrkhBgMPk4QKQYSvM7rxl3Qkp7dmVINcMV6c0aY
 9QxJXa4iVHj1Sl6wypkrImhD2uc/vSV9uA1GUk6UN+bfZYRxQl5pTSEOs34RMYdG6Gg2
 PDsWnYsc6qTKO+vPmAzLQ5pC8FXj549C6lV6wF0Zrs7zzbmovyDPZtu7PbFcYWR0EBF3
 1irRsmew9DFvezAFeKCtqp24f1iDIfjY3mdUoAIE8s8pwlSmB/CwKp+DjgMgWikjelum
 +HtwkJ21H+vqUwvcP8gHSaEsQLgrbrKo/gmmUMJphZGf9tJlwom8KzPrjZ1YO0yDjRS5
 /Cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ic34olRO1gILB7gSPiIOtGJOG1ezfBO762HyFmKeo4c=;
 b=GxLx2MxSvQ57PbG8GlLoa84fWTWyOF7/uwl6XSAX3eKmVf6+b7cFj0C9vKF5DQKIFL
 zpbxVxNMKuDzSfLKHUI11ApRp8s7qeOtDpufykVb4bG50PM1JT+0Z3sAQm6hX7QZRbBV
 w5PaFZV6nvSzoPKpZvmJZOiukMKMMbtMpQPt+9NSaF71CpVjoRGRYV5QbJYdv/IP7sCf
 RqUz3tM5hRcBJuzukIfq85tm5G2J0PMwOZSUtQ/o0ayGI3rgU6u5oIe1gYEgBspxNuAM
 XZ5kwy6p5cjr46T1vx0KMI5FL7kSvN5V1RXJgkeDpR0qVfgdnSHPB3ApA0Bo1TANBbK1
 aSRw==
X-Gm-Message-State: AOAM5326dqUUAC15cF4zo0QriKsb/gDI8Oq5gJiTIcRaqwTTaKSbvJJq
 z5WxdxRKxplC1Y/AAOgBneAA2bemVXO6WCgSmOk=
X-Google-Smtp-Source: ABdhPJyR9jcrE71G44eJv6n4mvmESr0CggEl3JIC2AlR0fXpd5EBaeDBh86nGWe0VRO7sJ0/vssfGi6UCiFOVKiI4D8=
X-Received: by 2002:a7b:c08e:: with SMTP id r14mr2592872wmh.165.1605273437363; 
 Fri, 13 Nov 2020 05:17:17 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+HfNiQbOcqCLxFUP2FMm5QrLXUUaj852Fxe3hn_2JNiucn6g@mail.gmail.com>
 <e23c63dd-5f90-c273-615f-d5d67991529c@gmail.com>
In-Reply-To: <e23c63dd-5f90-c273-615f-d5d67991529c@gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Fri, 13 Nov 2020 14:17:04 +0100
Message-ID: <CAJ+HfNgDwsNP_yM1_NH066JUfqMNPc-Q-K_yxqDaCQztEtwuZA@mail.gmail.com>
Subject: Re: csum_partial() on different archs (selftest/bpf)
To: Eric Dumazet <eric.dumazet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_081719_395035_5055704C 
X-CRM114-Status: GOOD (  16.19  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
 Anders Roxell <anders.roxell@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Tom Herbert <tom@herbertland.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxMyBOb3YgMjAyMCBhdCAxMjozNCwgRXJpYyBEdW1hemV0IDxlcmljLmR1bWF6ZXRA
Z21haWwuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAxMS8xMy8yMCAxMTozNiBBTSwgQmrDtnJuIFTD
tnBlbCB3cm90ZToKPiA+IEkgd2FzIHJ1bm5pbmcgdGhlIHNlbGZ0ZXN0L2JwZiBvbiByaXNjdiwg
YW5kIGhhZCBhIGNsb3NlciBsb29rIGF0IG9uZQo+ID4gb2YgdGhlIGZhaWxpbmcgY2FzZXM6Cj4g
Pgo+ID4gICAjMTQvcCB2YWxpZCByZWFkIG1hcCBhY2Nlc3MgaW50byBhIHJlYWQtb25seSBhcnJh
eSAyIEZBSUwgcmV0dmFsCj4gPiA2NTUwNyAhPSAtMjkgKHJ1biAxLzEpCj4gPgo+ID4gVGhlIHRl
c3QgZG9lcyBhIGNzdW1fcGFydGlhbCgpIGNhbGwgdmlhIGEgQlBGIGhlbHBlci4gcmlzY3YgdXNl
cyB0aGUKPiA+IGdlbmVyaWMgaW1wbGVtZW50YXRpb24uIGFybTY0IHVzZXMgdGhlIGdlbmVyaWMg
Y3N1bV9wYXJ0aWFsKCkgYW5kIGZhaWwKPiA+IGluIHRoZSBzYW1lIHdheSBbMV0uIGFybSAoMzIt
Yml0KSBoYXMgYSBhcmNoIHNwZWNmaWMgaW1wbGVtZW50YXRpb24sCj4gPiBhbmQgZmFpbCBpbiBh
bm90aGVyIHdheSAoRkFJTCByZXR2YWwgMTMxMDQyICE9IC0yOSkgWzJdLgo+ID4KPiA+IEkgbWlt
aWNrZWQgdGhlIHRlc3QgY2FzZSBpbiBhIHVzZXJsYW5kIHByb2dyYW0sIGNvbXBhcmluZyB0aGUg
Z2VuZXJpYwo+ID4gY3N1bV9wYXJ0aWFsKCkgdG8gdGhlIHg4NiBpbXBsZW1lbnRhdGlvbiBbM10s
IGFuZCB0aGUgZ2VuZXJpYyBhbmQgeDg2Cj4gPiBpbXBsZW1lbnRhdGlvbiBkb2VzIHlpZWxkIGEg
ZGlmZmVyZW50IHJlc3VsdC4KPiA+Cj4gPiB4ODYgICAgIDogICAgLTI5IDogMHhmZmZmZmZlMwo+
ID4gZ2VuZXJpYyA6ICA2NTUwNyA6IDB4MDAwMGZmZTMKPiA+IGFybSAgICAgOiAxMzEwNDIgOiAw
eDAwMDFmZmUyCj4gPgo+ID4gV2hvIGlzIGNvcnJlY3Q/IDotKSBJdCB3b3VsZCBiZSBuaWNlIHRv
IGdldCByaWQgb2YgdGhpcyBmYWlsZWQgY2FzZS4uLgo+ID4KPgo+IFRoZXJlIGFyZSBhbGwgdGhl
IHNhbWUgdmFsdWUgOiksIHRoZXkgYWxsIGZvbGQgdG8gdTE2ICAweEZGRTMKPgo+IE1heWJlIHRo
ZSB0ZXN0IG5lZWRzIGEgZml4LCB0aGVyZSBpcyBhIG1pc3NpbmcgZm9sZGluZy4KPgoKQWgsIG1h
a2VzIHNlbnNlLiBUaGFuayB5b3UhCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
