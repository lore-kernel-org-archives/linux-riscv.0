Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7726AC6FD20
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 02:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i21sdbe+s3wol19YPN/sbatE/GREoG3/2qmXFUzhiAE=; b=zhDuzquzNRsOO4
	KIq5u019xtx6mH7WdcBddRu9yPVnLgekumFJkY7phBtQNy/YupC1qqN4/zqb7SY3ibgkPzQCLsNs5
	yxk1Evf93yaPv+H2QaGysxXAmSDzNaKSMPf/fAP8qtKolUt1+2+ych5i4ouQaFN8tpnntSi399gQC
	0s7lLK3nRS6eLC2vkghfgp+ItYkT/6vbgxhtcFPaDxwx7uT8sx4uODmKamRbGVaxBvcgc8gP9vaE6
	i32dcZLz0l1E5Z+2MeuPyzjqlNgvs81YJOQ2gKB7tATfs2K5IxFfyUdhkWCZd6RK3wduWiBqlFTfp
	2CGZPouvF3XT0mH8i/aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZjwl-003Ejb-SE; Wed, 08 Mar 2023 02:54:31 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZjwi-003Eir-RY
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 02:54:30 +0000
Received: by mail-qv1-xf29.google.com with SMTP id ff4so10332470qvb.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 18:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678244067;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=96nRitXXABGOXpVS0aSB6wCBLIuREpSpzba47Egz9KA=;
        b=ZyJy478U/EIxnQEgkHvq6j7IA4lX7DXBRMB3RgY1Ytxt0ku1qElBxA6jNoI0Fv0V1c
         d5bhydNHBBfdXx8u8vyOZu59Ywj0w4NEQdcXEkj5bIjsrryoK7/3lveC3w3RFoQDwTxp
         p+s5/tUC5zRsZElKRppZUZV7VgBwoY07Nc/pKRFoCkPLW7+cRjYrjjOwBAvsQbcKcP04
         lYOt7PQC+/0qQUyYBdBespXNIVwui0/iEmqahIHUjh4Aw7td9HdnLhVsCso4W/rt61xX
         2gdsGiAT960e/qxhnCAnjVRrEmU/OtmzkVAVRiBDbMDznx9B5AXfNHpe8UCbA9TG+OWt
         JFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678244067;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=96nRitXXABGOXpVS0aSB6wCBLIuREpSpzba47Egz9KA=;
        b=lqT2g8v0O2aWDsuD5Bfbs7Z3irDTrRe5tLGkx2sPGbEpXbH2L+KKkdtvwBoERkmFPZ
         WvlylqRwONMUYU31BWKFxG4OG5inqf5xbbhlgi1k//n3W3RhPYSF9dagbbvjFoM//b9Q
         KikJ4kSZHk/l/QbwUzwQgFiy4vIcGq7bVZhtW6FPcDb71mSrqd1vl62viimSUD7Vd6wb
         K8b+djzeCIhOoWSRh0uOxsQMBcHysH3RFAqGA2NbkqXfRBONFtH/4v/IPA+nLA2ifbf8
         b9v7gELd0LpSlmYrc1eQoNCTxBZeJmZHZ7XpiA5J1qIq/+6/Qqw922xXTIiQzd6WFXCo
         Y9UA==
X-Gm-Message-State: AO0yUKWANNxxwRTM4isjZ64h+PiOdeo1xRQOE7j13Qnygs3O3+omVz1p
	Lti+igcCS5KwEkEya6LGovg=
X-Google-Smtp-Source: AK7set8L3OEORXhcnFkSDGO1VM/i5FFhi7QOZmDS+2urUpMfw8GZhzylnJIB32fSoQWw2fTuJuYLvw==
X-Received: by 2002:a05:6214:5012:b0:537:6e29:e9e9 with SMTP id jo18-20020a056214501200b005376e29e9e9mr30960704qvb.21.1678244066699;
        Tue, 07 Mar 2023 18:54:26 -0800 (PST)
Received: from [10.4.10.38] (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
        by smtp.gmail.com with ESMTPSA id s4-20020a372c04000000b0074283b87a4esm10546013qkh.90.2023.03.07.18.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 18:54:26 -0800 (PST)
Message-ID: <7280914e-59e3-ba6d-4324-a29c1c0b4ce8@gmail.com>
Date: Tue, 7 Mar 2023 21:54:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/3] Add RISC-V 32 NOMMU support
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yimin Gu <ustcymgu@gmail.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Waldemar Brodkorb <wbx@openadk.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
 <42446784-a88b-df09-41e9-5f685b4df6ee@infradead.org>
 <556ce787-80eb-dc48-f8d6-83e415538e36@opensource.wdc.com>
 <f8f291d9-2723-4ab8-3020-49018757d470@gmail.com>
 <62852ee1-3763-3323-c3a8-f1e84f70204a@infradead.org>
 <c7941231-8ebd-dea5-81f8-3180cfc3f286@gmail.com>
 <1d858dbb-ae85-95a0-3e46-b67017733c04@infradead.org>
 <db3b3412-9616-d13c-3374-48647325e057@infradead.org>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <db3b3412-9616-d13c-3374-48647325e057@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_185428_917690_4E599ED1 
X-CRM114-Status: GOOD (  21.61  )
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

CgpPbiAzLzcvMjMgMjE6NTEsIFJhbmR5IER1bmxhcCB3cm90ZToKPiAKPiAKPiBPbiAzLzcvMjMg
MTg6MzMsIFJhbmR5IER1bmxhcCB3cm90ZToKPj4KPj4KPj4gT24gMy83LzIzIDE4OjMwLCBKZXNz
ZSBUYXViZSB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gMy83LzIzIDIxOjE2LCBSYW5keSBEdW5sYXAg
d3JvdGU6Cj4+Pj4gSGktLQo+Pj4+Cj4+Pj4gT24gMy83LzIzIDE3OjI2LCBKZXNzZSBUYXViZSB3
cm90ZToKPj4+Pj4KPj4+Pj4KPj4+Pj4gT24gMi8yOC8yMyAyMzo0MiwgRGFtaWVuIExlIE1vYWwg
d3JvdGU6Cj4+Pj4+PiBPbiAzLzEvMjMgMTM6MDcsIFJhbmR5IER1bmxhcCB3cm90ZToKPj4+Pj4+
PiBIaS0tCj4+Pj4+Pj4KPj4+Pj4+PiBPbiAyLzI4LzIzIDE2OjI2LCBKZXNzZSBUYXViZSB3cm90
ZToKPj4+Pj4+Pj4gVGhpcyBwYXRjaC1zZXQgYWltcyB0byBhZGQgTk9NTVUgc3VwcG9ydCB0byBS
VjMyLgo+Pj4+Pj4+PiBNYW55IHBlb3BsZSB3YW50IHRvIGJ1aWxkIHNpbXBsZSBlbXVsYXRvcnMg
b3IgSERMCj4+Pj4+Pj4+IG1vZGVscyBvZiBSSVNDLVYgdGhpcyBwYXRjaCBtYWtlcyBpdCBwb3Nz
aWJsZSB0bwo+Pj4+Pj4+PiBydW4gbGludXggb24gdGhlbS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gWWlt
aW4gR3UgaXMgdGhlIG9yaWdpbmFsIGF1dGhvciBvZiB0aGlzIHNldC4KPj4+Pj4+Pj4gU3VibWl0
dGVkIGhlcmU6Cj4+Pj4+Pj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwv
YnVpbGRyb290LzIwMjItTm92ZW1iZXIvNjU2MTM0Lmh0bWwKPj4+Pj4+Pj4KPj4+Pj4+Pj4gVGhv
dWdoIEplc3NlIFQgcmV3cm90ZSB0aGUgRGNvbmYuCj4+Pj4+Pj4KPj4+Pj4+PiBEY29uZj8KPj4+
Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGUgbmV3IHNldDoKPj4+Pj4+Pj4gaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMi1EZWNlbWJlci82NTgyNTgu
aHRtbAo+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4gVjEtPlYyOgo+Pj4+Pj4+PiAgwqDCoCAtIEFkZCBD
b25vcidzIGNsb2NrIHBhdGNoIGZvciBpbXBsaWNpdCBkaXY2NAo+Pj4+Pj4+PiAgwqDCoCAtIEZp
eCB0eXBvIGluIGNvbW1pdCB0aXRsZSAzLzMKPj4+Pj4+Pj4gIMKgwqAgLSBGaXggdHlwbyBpbiBj
b21taXQgZGVzY3JpcHRpb24gMi8zCj4+Pj4+Pj4+IFYyLT5WMwo+Pj4+Pj4+PiAgwqDCoCAtIENo
YW5nZSBmcm9tIGRlZmNvbmZpZyBmaWxlIHRvIGEgUEhPTlkgY29uZmlnCj4+Pj4+Pj4+IC0tLQo+
Pj4+Pj4+Cj4+Pj4+Pj4gSXMgdGhpcyAncnYzMl9ub21tdV92aXJ0X2RlZmNvbmZpZycgdGFyZ2V0
IHRoZSBvbmx5IGJ1aWxkIHRhcmdldAo+Pj4+Pj4+IHRoYXQgaXMgc3VwcG9ydGVkPwo+Pj4+Pj4+
Cj4+Pj4+Pj4gSSBhc2sgYmVjYXVzZSBJIGFwcGxpZWQgdGhlIDMgcGF0Y2hlcyBhbmQgZGlkIDI1
IHJhbmRjb25maWcgYnVpbGRzLgo+Pj4+Pj4+IDUgb2YgdGhlbSBmYWlsZWQgdGhlIHNhbWUgd2F5
Ogo+Pj4+Pj4+Cj4+Pj4+Pj4gcmlzY3YzMi1saW51eC1sZDogZHJpdmVycy9zb2MvY2FuYWFuL2sy
MTAtc3lzY3RsLm86IGluIGZ1bmN0aW9uIGBrMjEwX3NvY19lYXJseV9pbml0JzoKPj4+Pj4+PiBr
MjEwLXN5c2N0bC5jOiguaW5pdC50ZXh0KzB4NzgpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBr
MjEwX2Nsa19lYXJseV9pbml0Jwo+Pj4+PiBJIGNhbiBub3QgcmVjcmVhdGUgdGhpcyBlcnJvci4K
Pj4+Pj4gY2FuIHlvdSBzZW5kIG1lIHRoZSAuY29uZmlnIHlvdSB1c2VkLgo+Pj4+Pgo+Pj4+PiBU
aGFua3MsCj4+Pj4+IEplc3NlIFRhdWJlCj4+Pj4KPj4+PiBTdXJlLCBpdCdzIGF0dGFjaGVkLgo+
Pj4KPj4+IEhtbW0sIGl0IGxpbmtzIGZpbmUgZm9yIG1lLgo+Pj4KPj4+IG9iamR1bXAgLXggdm1s
aW51eCB8IGdyZXAgazIxMF9jbGtfZWFybHlfaW5pdAo+Pj4gODFlNDAxMjQgZ8KgwqDCoMKgIEYg
LmluaXQudGV4dMKgwqDCoMKgIDAwMDAwMDg4IGsyMTBfY2xrX2Vhcmx5X2luaXQKPj4+Cj4+PiBn
Y2MgdmVyc2lvbiAxMS4zLjAgKEJ1aWxkcm9vdCAyMDIyLjExLTM2MS1nMWJlMGQ0MzhmNykKPj4+
IEdOVSBhc3NlbWJsZXIgdmVyc2lvbiAyLjM4IChyaXNjdjMyLWJ1aWxkcm9vdC1saW51eC11Y2xp
YmMpCj4+PiBHTlUgbGQgKEdOVSBCaW51dGlscykgMi4zOAo+Pj4KPj4+IHdoYXQgZ2NjIHZlcnNp
b24gYXJlIHlvdSB1c2luZz8KPj4KPj4KPj4gZ2NjIChTVVNFIExpbnV4KSAxMi4yLjEgMjAyMzAx
MjQgW3JldmlzaW9uIDE5M2Y3ZTYyODE1YjQwODlkZmFlZDRjMmJkMzRmZDRmMTAyMDllMjddCj4+
IGZyb20gb3BlbnN1c2UgVHVtYmxld2VlZC4KPj4KPj4gSSdsbCB0cnkgaXQgb24gYSBjdXJyZW50
IHRyZWUuLi4KPiAKPiBPSywgSSBkb24ndCBrbm93IGhvdyBpdCBoYXBwZW5lZC4gSSBjYW5ub3Qg
cmVwcm9kdWNlIGl0IG5vdy4KPiBUaGUgZmFpbGluZyAuY29uZmlnIGZpbGVzIGhhcyBDT05GSUdf
TU1VIGlzIG5vdCBzZXQgKGZvciBSVjMySSksIHdoaWNoCj4gYXBwZWFycyB0byBiZSBpbXBvc3Np
YmxlLgpUaGVzZSBwYXRjaGVzIGFkZCBgQ09ORklHX01NVSBpcyBub3Qgc2V0YCAoZm9yIFJWMzJJ
KS4KQnV0IG5vIHdvcnJpZXMgaXQgc2VlbXMgdG8gYmUgYSBub24gaXNzdWUgIG5vdy4KCllvdXIg
dGhvdWdodHMgRGFtaWVuPwoKVGhhbmtzLApKZXNzZSBUYXViZQo+IAo+IFNvcnJ5IHRvIGJvdGhl
ciB5b3UuCj4gCj4gVGhhbmtzLgo+IAo+Pj4+Cj4+Pj4+PiBBcmcuIEZvcmdvdCBhYm91dCB0aGF0
LiBrMjEwIGlzIHJ2NjQgb25seSBhbmQgd2hpbGUgdGhlIGNsayBkcml2ZXIgY291bGQgc3RpbGwK
Pj4+Pj4+IGNvbXBpbGUgdGVzdCB3aXRoIHJ2MzIgKG9yIGFueSBhcmNoKSwgdGhhdCBkcml2ZXIg
cHJvdmlkZXMgdGhlCj4+Pj4+PiBrMjEwX2Nsa19lYXJseV9pbml0KCkgZnVuY3Rpb24gd2hpY2gg
aXMgY2FsbGVkIHZlcnkgZWFybHkgaW4gdGhlIGJvb3QgcHJvY2Vzcwo+Pj4+Pj4gZnJvbSBrMjEw
X3NvY19lYXJseV9pbml0KCksIHdoaWNoIGlzIGFuIFNPQ19FQVJMWV9JTklUX0RFQ0xBUkUoKSBj
YWxsLiBUaGUKPj4+Pj4+IHByb2JsZW0gbWF5IGJlIHRoZXJlLiBQcm9iYWJseSBzaG91bGQgYmUg
ZGlzYWJsZWQgZm9yIHJ2MzIgaWYgbm8gU29DIG5lZWQgdGhhdAo+Pj4+Pj4gc29ydCBvZiBlYXJs
eSBpbml0IGNhbGwuCj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gYmVjYXVzZQo+Pj4+Pj4+ICMgQ09O
RklHX0NPTU1PTl9DTEtfSzIxMCBpcyBub3Qgc2V0Cj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IE1h
eWJlIFNPQ19DQU5BQU4gbmVlZHMgc29tZSBtb3JlIHNlbGVjdHMgZm9yIHJlcXVpcmVkIGNvZGU/
Cj4+Pj4+Pj4KPj4+Pj4+Pj4gQ29ub3IgRG9vbGV5ICgxKToKPj4+Pj4+Pj4gIMKgwqDCoCBjbGs6
IGsyMTA6IHJlbW92ZSBhbiBpbXBsaWNpdCA2NC1iaXQgZGl2aXNpb24KPj4+Pj4+Pj4KPj4+Pj4+
Pj4gSmVzc2UgVGF1YmUgKDEpOgo+Pj4+Pj4+PiAgwqDCoMKgIHJpc2N2OiBjb25maWdzOiBBZGQg
bm9tbXUgUEhPTlkgZGVmY29uZmlnIGZvciBSVjMyCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFlpbWluIEd1
ICgxKToKPj4+Pj4+Pj4gIMKgwqDCoCByaXNjdjogS2NvbmZpZzogQWxsb3cgUlYzMiB0byBidWls
ZCB3aXRoIG5vIE1NVQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAgwqDCoCBhcmNoL3Jpc2N2L0tjb25maWfC
oMKgwqDCoCB8IDUgKystLS0KPj4+Pj4+Pj4gIMKgwqAgYXJjaC9yaXNjdi9NYWtlZmlsZcKgwqDC
oCB8IDQgKysrKwo+Pj4+Pj4+PiAgwqDCoCBkcml2ZXJzL2Nsay9jbGstazIxMC5jIHwgMiArLQo+
Pj4+Pj4+PiAgwqDCoCAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4KPj4+Pgo+Pgo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
