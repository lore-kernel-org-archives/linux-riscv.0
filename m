Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF7AC07E9B
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 21:19:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9352560C41
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 21:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9352560C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fuPeF88JiBcO971w/ABu2Hc1ik3zVIIi7o94FedzOi8=; b=Ku8xJJxQj2t0i/dJpGYB9awHKX
	133cgvXQf4HEKR0cM+oD5NeVhV/uoT3GN3WqiU8Vt7ZKLvc9J/bRRNEdxUzVjU6J3jC01bvAD8FNH
	3nAWR25fxqpGlunxfKETX135/zalkDVqZJg76vVwfaLfYHXXj5dY+BPuQFdOClhbokpq93WW71Bjw
	TIzHLd7fYVumDS9x/pk7g8lSrglpi1pCbWfqNNVIyGRVqwpv8ZwSKW8JXkQ4U8yPePTmEcXKvYjG8
	KnxN8CnarOqaj0atqAVIDTzNQ1kABBQs7ui3U5rFDXKLpS/YRvkAAM4P1Zlk9FKJyMgw1+qMjMEek
	GeS7LSJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5x8s-00DxOZ-TX; Tue, 20 Jul 2021 21:19:06 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5x8p-00DxOC-PN
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 21:19:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id o8so12051449plg.11
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 14:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=B8o/q41XapjmWGG21qetVfphUKyjf05uB802S7fF9ZM=;
 b=Gyu9Rp2Ezpcx5BaIxnfzn8hRTJC1EMlzn1CqHWx6Q/LOtJVOUXjk7eVdhvsqkPM7Bl
 7KlyvPz3twYGDgHE3fhz0rD5H1Cu9MKwgBboEOOD3svRv/leaq3mbTLTia8J9dFF1Fyq
 9GpJDeZiIvgcuMzqYDvyGbowGZDQMKGOV62t0Mq0QK8D8ieo5N7moHFoEJvNDgQbmrkE
 rztnaKkryw3pM+B3WTRRGRpiBFswIKKhmhP6BQr/39WzKfDFm10qEj/aPuIb751zgmeo
 t5x7pnFLrlMSeehgB+dzt1qZb6VR6iktr0lVnskjicaQIzN6jjnxRcTrcSMedwiaW3Du
 goag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=B8o/q41XapjmWGG21qetVfphUKyjf05uB802S7fF9ZM=;
 b=GB0qqYWqp0B/hVFurF+hHBA5ep0qgvsvdchqS+Z/+JSfBMy5/h69NZacpLhwKt/DCU
 3ig8vZIQG3vKkvdePfyjj6TQbnwM6Ezn8/oHMeBaxTuEig2+lyqME0eGckehSn/c1Quo
 2ws9F3W0Kc+kyCST7TB2DSPv0oHk2A3rDf5GrMS/xkcugddB30OSInJY5JnOG1pafLxZ
 61Sr3X4rhL+9/v/rfDRb2pMuplMaD0cIOGNz6/ddMy9cAvamwawjNtEWCP/hg9u1OFTD
 KHYmfkngTehNY53+Y1Vp4hc8jAiDL2QqCs4jIjmHMVDN6/F5PGtuLJqNnDfRrtnEzuom
 +w+A==
X-Gm-Message-State: AOAM533ojj9UDgqosMK33+fLnNhvqpXFm8Yujhfz5TZ70JZzX2mQenMq
 cLSMZddAHzmAZyewigXwRb4=
X-Google-Smtp-Source: ABdhPJxgfIaiqVJmLAxSMRgnwZnd/tJ0D4Rce5OWQuSm38SyHyViu5yH83PCzdPJruKKOQH3QRoN8A==
X-Received: by 2002:a17:902:e807:b029:12b:43ce:18dc with SMTP id
 u7-20020a170902e807b029012b43ce18dcmr24801837plg.70.1626815942597; 
 Tue, 20 Jul 2021 14:19:02 -0700 (PDT)
Received: from [0.0.0.0] (jp.bgp.twd2.net. [2a0c:b641:571::1])
 by smtp.gmail.com with ESMTPSA id d2sm25025439pfa.84.2021.07.20.14.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 14:19:01 -0700 (PDT)
Subject: Re: [PATCH 3/3] RISC-V: build: Allow LTO to be selected
From: twd2 <twd2.me@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com,
 Nathan Chancellor <nathan@kernel.org>, arnd@arndb.de
References: <20210719205339.1023572-1-twd2.me@gmail.com>
 <CAKwvOd=H-UN7dgHYgsvubv7t82UiPaOHCF09GAi6kTvjxpT4iA@mail.gmail.com>
 <475c3797-e048-97bb-095a-c55aff38bc42@gmail.com>
Message-ID: <970c36ea-c5a6-2b47-3024-7cbbf428ebfa@gmail.com>
Date: Wed, 21 Jul 2021 05:18:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <475c3797-e048-97bb-095a-c55aff38bc42@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_141903_897990_D22E3854 
X-CRM114-Status: GOOD (  16.55  )
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

QWxzbywgSSB0cmllZCBgZGVmY29uZmlnYCB3aXRoIEZ1bGwvVGhpbiBMVE8uwqAgSXQgY2FuIGJv
b3QgYW5kIHRoZQpidXN5Ym94IHNoZWxsIHdvcmtzLgoKSSdsbCBwdXQgdGhpcyBpbmZvcm1hdGlv
biBpbnRvIHRoZSBuZXh0IHZlcnNpb24gb2YgdGhlIHBhdGNoIHNlcmllcy4KCgpUaGFua3MuCldl
bmRlCgoKT24gMjAyMS83LzIxIDI6MjksIHR3ZDIgd3JvdGU6Cj4gSGksIEkganVzdCB0cmllZCB0
byBjb21waWxlIHdpdGggdGhpcyBwYXRjaCBhbmQgYGFsbHllc2NvbmZpZ2AgZXhjZXB0Cj4gQ09N
UElMRV9URVNULCBGVFJBQ0UsIEtBU0FOLCBHQ09WLCBhbmQgWEZTIFsxXS7CoCBJdCBmaW5pc2hl
cyB3aXRoIG5vCj4gaXNzdWUsIGFuZCB0YWtlcyB+MjIgbWluIGFuZCB+MjUgR2lCLsKgIEJUVywg
dGhlIGtlcm5lbCBwYW5pY3MgZHVyaW5nIGJvb3QKPiBldmVuIGJ1aWx0IHdpdGggR0NDLCBzbyBJ
IGRpZG4ndCBkbyBmdXJ0aGVyIHRlc3RzIDooIC4KPgo+IENvbW1hbmQgdXNlZDogQVJDSD1yaXNj
diBMTFZNPTEgTExWTV9JQVM9MSBtYWtlIEhPU1RDQz1nY2Mgdm1saW51eCAtajE2Cj4gS2VybmVs
IHZlcnNpb246IGNvbW1pdCAyNzM0ZDZjMWIxYTAgKCJMaW51eCA1LjE0LXJjMiIpCj4gTExWTSB2
ZXJzaW9uOiBjb21taXQgMWI2MWQ4MzdiOWQwICgiW0lubGluZV0gQWRkIHRlc3QgZm9yIFBSNTA1
ODkgKE5GQykiKQo+IFRoZSBgLmNvbmZpZ2AgZmlsZSBpcyBhdHRhY2hlZC4KPgo+IFsxXSBodHRw
czovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy8xMjE1Cj4KPiBPbiAy
MDIxLzcvMjAgNToyNSwgTmljayBEZXNhdWxuaWVycyB3cm90ZToKPj4gT24gTW9uLCBKdWwgMTks
IDIwMjEgYXQgMTo1MyBQTSBXZW5kZSBUYW4gPHR3ZDIubWVAZ21haWwuY29tPiB3cm90ZToKPj4K
Pj4gQ29uc2lkZXIgYWRkaW5nIGEgbGl0dGxlIG1vcmUgZGV0YWlsIHRvIHRoZSBjb21taXQgbWVz
c2FnZS4KPj4KPj4gSW4gb3VyIGV4cGVyaWVuY2Ugd2l0aCBvdGhlciBhcmNoaXRlY3R1cmVzLCB3
ZSd2ZSBoaXQgbnVtZXJvdXMKPj4gY29tcGlsZXIgYW5kIGtlcm5lbCBpc3N1ZXMgZXNwZWNpYWxs
eSB3aXRoIGFsbHllc2NvbmZpZ3MuIEhhcyB0aGF0Cj4+IGJlZW4geW91ciBleHBlcmllbmNlIHdp
dGggcmlzY3Y/ICBJdCB3b3VsZCBiZSBnb29kIHRvIGtub3cgaWYgeW91J3ZlCj4+IGhpdCBpc3N1
ZXMgd2l0aCBMVE8gcGx1cyBjZXJ0YWluIGNvbmZpZ3MsIHNvIHRoYXQgd2UgaGF2ZSBjb25maXJt
YXRpb24KPj4gb3RoZXJzIGhhdmUgc2VlbiB0aGVzZSBpc3N1ZXMgYW5kIHNvIHRoYXQgd2UgY2Fu
IHRyaWFnZSBmaXhlcy4KPj4KPj4+IFNpZ25lZC1vZmYtYnk6IFdlbmRlIFRhbiA8dHdkMi5tZUBn
bWFpbC5jb20+Cj4+PiAtLS0KPj4+ICBhcmNoL3Jpc2N2L0tjb25maWcgfCAyICsrCj4+PiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4+IGluZGV4IDhmY2NlYjhlZGEwNy4u
YjU5M2U1MDMxYzc5IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4+PiArKysg
Yi9hcmNoL3Jpc2N2L0tjb25maWcKPj4+IEBAIC0zNCw2ICszNCw4IEBAIGNvbmZpZyBSSVNDVgo+
Pj4gICAgICAgICBzZWxlY3QgQVJDSF9PUFRJT05BTF9LRVJORUxfUldYIGlmIEFSQ0hfSEFTX1NU
UklDVF9LRVJORUxfUldYCj4+PiAgICAgICAgIHNlbGVjdCBBUkNIX09QVElPTkFMX0tFUk5FTF9S
V1hfREVGQVVMVAo+Pj4gICAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19IVUdFVExCRlMgaWYg
TU1VCj4+PiArICAgICAgIHNlbGVjdCBBUkNIX1NVUFBPUlRTX0xUT19DTEFORwo+Pj4gKyAgICAg
ICBzZWxlY3QgQVJDSF9TVVBQT1JUU19MVE9fQ0xBTkdfVEhJTgo+Pj4gICAgICAgICBzZWxlY3Qg
QVJDSF9VU0VfTUVNVEVTVAo+Pj4gICAgICAgICBzZWxlY3QgQVJDSF9XQU5UX0RFRkFVTFRfVE9Q
RE9XTl9NTUFQX0xBWU9VVCBpZiBNTVUKPj4+ICAgICAgICAgc2VsZWN0IEFSQ0hfV0FOVF9GUkFN
RV9QT0lOVEVSUwo+Pj4gLS0KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
