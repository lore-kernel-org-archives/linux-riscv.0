Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CF4C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:49:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FE82613CB
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FE82613CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=vWMzESoJAhHpGYaPu09ZaxtdYB3ClQ+rLuTii9f9YVk=; b=ZqNRgpY5xG7sS7UY6QADnFQ5r
	Gn3tgYAaP/3R66Ep8tvTtas5y+P8ict0kHMlwpeHDnGHwgL8bfcvSYeHcHN887cjlbcNnHdHVq1OP
	0L+tGnwts3QlGbYwUV5PjF6tkI2qs6m4EtJL8295qzdzzxMrnWPh8E12tTOsncW9hEBOOPlag/s6V
	Mw6zMhEVD1YYie/YFcZdKMohs6CkCgz+vONhBB+g7Q5dLCpCwP0sNZCfVjCLnhRh4eg/Ki7BBLFLs
	+1NdlLDRWiNkI31Ymg04EiFIynl3lzFQdyxpbHpkk5dslRMl09gwK73z6DKT+bRfymEo9KoHnYwhJ
	2UFMa0wiQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZmo8-000WWR-9V; Fri, 23 Apr 2021 03:48:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmnr-000WTr-36
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 03:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=+ntpVuO8X+igpPibq9Gc+rNStHJCK1DeGnF4sSyHqys=; b=dU/3roSI1YIO7sm14oVKBvx0OG
 pvmeqTlPdvTXNvLMZj0eYr1VRdC+57uWC029HUQOLoaF70QcWQKFNLBEw4zv8xpcbuSMJGn/UvmZG
 bpLQMdXMYXbMJDeIYPP3p/rcxVDi3kndnooVnl/jO2hX2HkqWCYhGloSCNN6zZVOyoe2ewDlFaNcT
 kblftI9TawCrt35awhmwwBAok85cWrfaaNYszuH3gcP1UWrPWbivmV7WlLz0ZIbNilwz03Ddo1xEg
 gH+qbjxEEx38DwVARW1YmwdPzmAv5nKPDtyQynltD1yuqyXLT/2qWTMGO1KMx1g5UcIUHue71s9SM
 vPCh69IA==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmno-00E7lc-8w
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 03:48:25 +0000
Received: by mail-pg1-x534.google.com with SMTP id f29so34289626pgm.8
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 20:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+ntpVuO8X+igpPibq9Gc+rNStHJCK1DeGnF4sSyHqys=;
 b=q+8tLAClXdoKZoxwH6aoS8dhA2mAeIiEAz7jxIDqN0n9qnE03NAy3X0j1MrEkrgCTN
 HcSUZKyKOYTMLFzO7PBxcrdMLSXwhozbg3PmqMP4lHT8uCS1AdwGK6GdkQzlUC3wFHNv
 OK6FzK79xQOJ6Gxtx17C8RKo24JbajOBtUoLslGTSNmwaD+QGQBULbQVvimxv83x2W1R
 rVlvBcawqR8zMjVh5HAZhN2kBVsbRfiTLeJ/FWozXbFuIqEfrEoIjzIBQyk0+gkUPMbS
 S/GPgWLDL5Z+PvJrVxHdku9Hi8HTzuRTpy4nBlNJZZQpcZn/cJftbs4j+ZU+w+hTEbvF
 FNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+ntpVuO8X+igpPibq9Gc+rNStHJCK1DeGnF4sSyHqys=;
 b=XYXJ7IdWGtqxsBFGxgkdtfWlZvuoa2z8qIsiYi7Q9NH0MeCT5xW1huhSPHAjQtOrF7
 MhMEhMVvQNMkhpJosItylw/GHd+vKMyu+/u9c7YO8364p1LniPL36Rmer6tJ+fu3bEHT
 amxzN99xnO2UqGx8HBxCE1Co7Ez9eR7xl3nMTqQQqQycpIy7uMkb1/X9iWJK3uFOz5sY
 WPxSCR5jDdDhmMzYmmvvpkoKkxc3YNDFDBxrVRO5SV4PhpkxNFgZCZojMZvJELIdJKR/
 XuhqOlFot0fKSND938l1StuPRCb46Y1ypEVyRdBa8YEVjMOaCpw9YPcx5TiwJ9L46mxy
 AvlA==
X-Gm-Message-State: AOAM532RwjxS4HRIoFfnF5UpVj6L6SX/DcsHk05HeAMCg5mel9SpFlHX
 1stDFvmtYzUY9e6gUksYeo2ABA==
X-Google-Smtp-Source: ABdhPJy+LWkhzAtNZnx/H+Ie1yN35G2kCRwKnOPrL35GhAul1IUChWItJHtRTzAuC7QT3ZwbD5SXbw==
X-Received: by 2002:a62:1b50:0:b029:257:da1e:837f with SMTP id
 b77-20020a621b500000b0290257da1e837fmr1756576pfb.57.1619149702227; 
 Thu, 22 Apr 2021 20:48:22 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id kk9sm3416763pjb.23.2021.04.22.20.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 20:48:21 -0700 (PDT)
Date: Thu, 22 Apr 2021 20:48:21 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Apr 2021 20:48:20 PDT (-0700)
Subject: Re: [PATCH v3 0/5] RISC-V: Add kexec/kdump support
In-Reply-To: <0ce30336b7dfaaf14a20e72e990d70f5@mailhost.ics.forth.gr>
CC: mick@ics.forth.gr, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mick@ics.forth.gr
Message-ID: <mhng-c073ca02-d152-4ef5-86c5-4bcf58154afc@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_204824_337243_B4AEB512 
X-CRM114-Status: GOOD (  18.28  )
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

T24gVGh1LCAyMiBBcHIgMjAyMSAyMDozNjo1NiBQRFQgKC0wNzAwKSwgbWlja0BpY3MuZm9ydGgu
Z3Igd3JvdGU6Cj4gzqPPhM65z4IgMjAyMS0wNC0yMyAwNjozMCwgUGFsbWVyIERhYmJlbHQgzq3O
s8+BzrHPiM61Ogo+PiBPbiBNb24sIDA1IEFwciAyMDIxIDAxOjU3OjA3IFBEVCAoLTA3MDApLCBt
aWNrQGljcy5mb3J0aC5nciB3cm90ZToKPj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMga2V4ZWMv
a2R1bXAgYW5kIGNyYXNoIGtlcm5lbAo+Pj4gc3VwcG9ydCBvbiBSSVNDLVYuIEZvciB0ZXN0aW5n
IHRoZSBwYXRjaGVzIGEgcGF0Y2hlZAo+Pj4gdmVyc2lvbiBvZiBrZXhlYy10b29scyBpcyBuZWVk
ZWQgKHN0aWxsIGEgd29yayBpbgo+Pj4gcHJvZ3Jlc3MpIHdoaWNoIGNhbiBiZSBmb3VuZCBhdDoK
Pj4+Cj4+PiBodHRwczovL3Jpc2N2Lmljcy5mb3J0aC5nci9rZXhlYy10b29scy1wYXRjaGVkLnRh
ci54ego+Pj4KPj4+IHYzOgo+Pj4gICogUmViYXNlIG9uIG5ld2VyIGtlcm5lbCB0cmVlCj4+PiAg
KiBNaW5vciBjbGVhbnVwcwo+Pj4gICogU3BsaXQgVUFQSSBjaGFuZ2VzIHRvIGEgc2VwYXJhdGUg
cGF0Y2gKPj4+ICAqIEltcHJvdmUgLyBjbGVhbnVwIGluaXRfcmVzb3VyY2VzCj4+PiAgKiBSZXNv
bHZlIFBhbG1lcidzIGNvbW1lbnRzCj4+Pgo+Pj4gdjI6Cj4+PiAgKiBSZWJhc2Ugb24gbmV3ZXIg
a2VybmVsIHRyZWUKPj4+ICAqIE1pbm9yIGNsZWFudXBzCj4+PiAgKiBQcm9wZXJseSBwb3B1bGF0
ZSB0aGUgaW9yZXNvdXJjZXMgdHJlLCBzbyB0aGF0IGl0Cj4+PiAgICBjYW4gYmUgdXNlZCBsYXRl
ciBvbiBmb3IgaW1wbGVtZW50aW5nIHN0cmljdCAvZGV2L21lbQo+Pj4gICogVXNlIGxpbnV4LHVz
YWJsZS1tZW1vcnkgb24gL21lbW9yeSBpbnN0ZWFkIG9mIGEgbmV3IGJpbmRpbmcKPj4+ICAqIFVT
ZSBhIHJlc2VydmVkLW1lbW9yeSBub2RlIGZvciBFTEYgY29yZSBoZWFkZXIKPj4+Cj4+PiBOaWNr
IEtvc3NpZmlkaXMgKDUpOgo+Pj4gICBSSVNDLVY6IEFkZCBFTV9SSVNDViB0byBrZXhlYyBVQVBJ
IGhlYWRlcgo+Pj4gICBSSVNDLVY6IEFkZCBrZXhlYyBzdXBwb3J0Cj4+PiAgIFJJU0MtVjogSW1w
cm92ZSBpbml0X3Jlc291cmNlcwo+Pj4gICBSSVNDLVY6IEFkZCBrZHVtcCBzdXBwb3J0Cj4+PiAg
IFJJU0MtVjogQWRkIGNyYXNoIGtlcm5lbCBzdXBwb3J0Cj4+Pgo+Pj4gIGFyY2gvcmlzY3YvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgIHwgIDI1ICsrKysKPj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2VsZi5oICAgICAgICB8ICAgNiArCj4+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rZXhl
Yy5oICAgICAgfCAgNTQgKysrKysrKwo+Pj4gIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICAg
ICAgICAgIHwgICA2ICsKPj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcmFzaF9kdW1wLmMgICAgICB8
ICA0NiArKysrKysKPj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcmFzaF9zYXZlX3JlZ3MuUyB8ICA1
NiArKysrKysrCj4+PiAgYXJjaC9yaXNjdi9rZXJuZWwva2V4ZWNfcmVsb2NhdGUuUyAgfCAyMjIK
Pj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9t
YWNoaW5lX2tleGVjLmMgICB8IDE5MyArKysrKysrKysrKysrKysrKysrKysrKysKPj4+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9zZXR1cC5jICAgICAgICAgICB8IDExMyArKysrKysrKy0tLS0tLQo+Pj4g
IGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgICAgICAgIHwgMTEwICsrKysrKysrKysrKysr
Cj4+PiAgaW5jbHVkZS91YXBpL2xpbnV4L2tleGVjLmggICAgICAgICAgfCAgIDEgKwo+Pj4gIDEx
IGZpbGVzIGNoYW5nZWQsIDc4NyBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkKPj4+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rZXhlYy5oCj4+PiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL2NyYXNoX2R1bXAuYwo+Pj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9jcmFzaF9zYXZlX3JlZ3MuUwo+Pj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9rZXhlY19yZWxvY2F0ZS5TCj4+PiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWMuYwo+Pgo+
PiBUaGFua3MuICBUaGVyZSB3ZXJlIHNvbWUgbWlub3IgaXNzdWVzIGFuZCBzb21lIG1lcmdlIGNv
bmZsaWN0cywgSSBwdXQKPj4gdGhpcyBvbiBmb3ItbmV4dCB3aXRoIHNvbWUgZml4dXBzLgo+Cj4g
SSd2ZSBzZW50IGEgdjQgdGhhdCBzaG91bGRuJ3QgaGF2ZSBtZXJnZSBjb25mbGljdHMsIGFkZHJl
c3Npbmcgc29tZQo+IGNvbW1lbnRzIGZyb20gQWxleCBhcyB3ZWxsLCBjb3VsZCB5b3UgdXNlIHRo
YXQgaW5zdGVhZCBvciBpcyBpdCB0b28gbGF0ZQo+ID8KClRoYW5rcywgZm9yIHNvbWUgcmVhc29u
IEkgZGlkbid0IHNlZSBpdCB3aGVuIHBva2luZyBhcm91bmQuICBUaGVyZSB3YXMgCnN0aWxsIHRo
YXQgb25lIGluaXRfcmVzb3VyY2VzKCkgbWVyZ2UgY29uZmxpY3QgYW5kIEkgZml4ZWQgdXAgc29t
ZSBvZiAKdGhlIGNvbW1pdCB0ZXh0cywgaXQncyBub3cgb24gZm9yLW5leHQgYXMKCmI5NDM5NDEx
OTgwNCAoSEVBRCAtPiBmb3ItbmV4dCwgcmlzY3YvZm9yLW5leHQpIFJJU0MtVjogQWRkIGNyYXNo
IGtlcm5lbCBzdXBwb3J0CjZlODQ1MTc4MmM5MCBSSVNDLVY6IEFkZCBrZHVtcCBzdXBwb3J0CjBh
MDY1MjQyOWJkYiBSSVNDLVY6IEltcHJvdmUgaW5pdF9yZXNvdXJjZXMoKQpkOWE4ODk3ZDZiNWQg
UklTQy1WOiBBZGQga2V4ZWMgc3VwcG9ydApmNTk5MzgwOTViOTQgUklTQy1WOiBBZGQgRU1fUklT
Q1YgdG8ga2V4ZWMgVUFQSSBoZWFkZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
