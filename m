Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01145C6FA99
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 02:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfSfOdaKh7vc9kgQhZdAeS8GJXvUse3H2Gwp3sKA7+M=; b=vbsak5rtrhdcha
	7x3IzPg2cvCMFhx+X40O2OdxKZh0xHY6r62tz0/FHB+c/B+zy2SH9eb0YMfX14/+p73RMQWr8ADYV
	5RavEDRf/VfZhllDS0Xsqk/2KCUluE1ohHmiGU0P1PHhKLttLftRg8LeI/RutTB5MZUebhFWirVXN
	QgmZBzy8FWt3fOp6QmmUPDCtaN2g009vEddi5eQN5ELv+9KqMUghfkdViPiXpa176K+ycDOESMsIh
	oc/bft1g5DeF6cIfkkacN8J4Xzfqd57onKg5Di1sO+gi3ki3f0QRS++L7RnA8ddJgn6OXCUjGuN1S
	yTKZlYDXiAXnNqcx6XnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZjZV-003CjW-0L; Wed, 08 Mar 2023 02:30:29 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZjZR-003Cij-MR
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 02:30:27 +0000
Received: by mail-qt1-x831.google.com with SMTP id l18so16859019qtp.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 18:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678242622;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vwm1K4ols2eiQIRxOttu3y7Xz4azJwmHdDxzSRJ6x94=;
        b=fm6c2F6neK6PHR42UlUD9L4qBI5U6gfj8j2gNX0YJzRcR7njORuBrRvl7vURZ8fbqS
         rCtgJw/x9OQHumm48Vr6OA64s7RfjTvrDJKlm0NSP+EwQ+bgfU3tSxRSZLggJsClqZnT
         BsS0QzjjjHkEbWWhRmZ2haaHVaHWVWQv1bF9s1M1qDULrCbimMkzOziKIIK2CUmbhdc3
         L2eEUftSYDo3gQXgnD2q4d8bGtaz3VyuzwcXh413L4lB2iowAplsjiR/RoJKni/ZJA09
         8xq+OcOkjpLvhv5ok+ULaoCtmpXWcLUx9gsa7aZQPB1/tjdDdBXNMkluQ3iGbOauBEaz
         zJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678242622;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vwm1K4ols2eiQIRxOttu3y7Xz4azJwmHdDxzSRJ6x94=;
        b=i7hPufS2bGb0HVGakHX2OsTEe1IAOb4Xt2OKOrNkK6gF1f0DDFRCsjy0/XCXUikHfn
         GbLZS55QTpgtpyPkMzu7g7y1r5H7+AKe0068D0SLfjZgQBLvI3Ubfqw7pvKs9to7KPsX
         KzCxTE34ShrOdNYpi2XG135ihRB60O0qI1esD87h1YH2Yh5eOBIuT6U3kL0UeyOfxyoZ
         zwhN8k0rZAYpICff3n6gl19K4CR5n/Rs5BHqE5Al61t2kDuY5HQ7e0u07g3TDtWUepA0
         KkW+6/nrLct6LWhkNYj/YHNw9TIrBS98ZVNndFadz+u/eZdYlamMg/Kds6InxOcE6kS6
         3KgA==
X-Gm-Message-State: AO0yUKUwXs4GDtnuEWzJ5v2NrPhOyE45hxinyDds3IO/SEtItc1uc6BF
	mn95MFQXTIsPCkfRWqt4TrI=
X-Google-Smtp-Source: AK7set/ztpYCMMWq+qAXTagXXx6tlvdbYERArp/gIov2QhPzggq89VtCbEToC1JcjXZWkBKMNXllkw==
X-Received: by 2002:ac8:7fd5:0:b0:3bf:b75a:d7a7 with SMTP id b21-20020ac87fd5000000b003bfb75ad7a7mr38122459qtk.7.1678242622031;
        Tue, 07 Mar 2023 18:30:22 -0800 (PST)
Received: from [10.4.10.38] (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
        by smtp.gmail.com with ESMTPSA id y16-20020a37f610000000b0074308a0124asm10534627qkj.50.2023.03.07.18.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 18:30:21 -0800 (PST)
Message-ID: <c7941231-8ebd-dea5-81f8-3180cfc3f286@gmail.com>
Date: Tue, 7 Mar 2023 21:30:20 -0500
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
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <62852ee1-3763-3323-c3a8-f1e84f70204a@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_183025_801544_31258E31 
X-CRM114-Status: GOOD (  17.87  )
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

CgpPbiAzLzcvMjMgMjE6MTYsIFJhbmR5IER1bmxhcCB3cm90ZToKPiBIaS0tCj4gCj4gT24gMy83
LzIzIDE3OjI2LCBKZXNzZSBUYXViZSB3cm90ZToKPj4KPj4KPj4gT24gMi8yOC8yMyAyMzo0Miwg
RGFtaWVuIExlIE1vYWwgd3JvdGU6Cj4+PiBPbiAzLzEvMjMgMTM6MDcsIFJhbmR5IER1bmxhcCB3
cm90ZToKPj4+PiBIaS0tCj4+Pj4KPj4+PiBPbiAyLzI4LzIzIDE2OjI2LCBKZXNzZSBUYXViZSB3
cm90ZToKPj4+Pj4gVGhpcyBwYXRjaC1zZXQgYWltcyB0byBhZGQgTk9NTVUgc3VwcG9ydCB0byBS
VjMyLgo+Pj4+PiBNYW55IHBlb3BsZSB3YW50IHRvIGJ1aWxkIHNpbXBsZSBlbXVsYXRvcnMgb3Ig
SERMCj4+Pj4+IG1vZGVscyBvZiBSSVNDLVYgdGhpcyBwYXRjaCBtYWtlcyBpdCBwb3NzaWJsZSB0
bwo+Pj4+PiBydW4gbGludXggb24gdGhlbS4KPj4+Pj4KPj4+Pj4gWWltaW4gR3UgaXMgdGhlIG9y
aWdpbmFsIGF1dGhvciBvZiB0aGlzIHNldC4KPj4+Pj4gU3VibWl0dGVkIGhlcmU6Cj4+Pj4+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjItTm92ZW1i
ZXIvNjU2MTM0Lmh0bWwKPj4+Pj4KPj4+Pj4gVGhvdWdoIEplc3NlIFQgcmV3cm90ZSB0aGUgRGNv
bmYuCj4+Pj4KPj4+PiBEY29uZj8KPj4+Pgo+Pj4+Pgo+Pj4+PiBUaGUgbmV3IHNldDoKPj4+Pj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMi1EZWNl
bWJlci82NTgyNTguaHRtbAo+Pj4+PiAtLS0KPj4+Pj4gVjEtPlYyOgo+Pj4+PiAgwqAgLSBBZGQg
Q29ub3IncyBjbG9jayBwYXRjaCBmb3IgaW1wbGljaXQgZGl2NjQKPj4+Pj4gIMKgIC0gRml4IHR5
cG8gaW4gY29tbWl0IHRpdGxlIDMvMwo+Pj4+PiAgwqAgLSBGaXggdHlwbyBpbiBjb21taXQgZGVz
Y3JpcHRpb24gMi8zCj4+Pj4+IFYyLT5WMwo+Pj4+PiAgwqAgLSBDaGFuZ2UgZnJvbSBkZWZjb25m
aWcgZmlsZSB0byBhIFBIT05ZIGNvbmZpZwo+Pj4+PiAtLS0KPj4+Pgo+Pj4+IElzIHRoaXMgJ3J2
MzJfbm9tbXVfdmlydF9kZWZjb25maWcnIHRhcmdldCB0aGUgb25seSBidWlsZCB0YXJnZXQKPj4+
PiB0aGF0IGlzIHN1cHBvcnRlZD8KPj4+Pgo+Pj4+IEkgYXNrIGJlY2F1c2UgSSBhcHBsaWVkIHRo
ZSAzIHBhdGNoZXMgYW5kIGRpZCAyNSByYW5kY29uZmlnIGJ1aWxkcy4KPj4+PiA1IG9mIHRoZW0g
ZmFpbGVkIHRoZSBzYW1lIHdheToKPj4+Pgo+Pj4+IHJpc2N2MzItbGludXgtbGQ6IGRyaXZlcnMv
c29jL2NhbmFhbi9rMjEwLXN5c2N0bC5vOiBpbiBmdW5jdGlvbiBgazIxMF9zb2NfZWFybHlfaW5p
dCc6Cj4+Pj4gazIxMC1zeXNjdGwuYzooLmluaXQudGV4dCsweDc4KTogdW5kZWZpbmVkIHJlZmVy
ZW5jZSB0byBgazIxMF9jbGtfZWFybHlfaW5pdCcKPj4gSSBjYW4gbm90IHJlY3JlYXRlIHRoaXMg
ZXJyb3IuCj4+IGNhbiB5b3Ugc2VuZCBtZSB0aGUgLmNvbmZpZyB5b3UgdXNlZC4KPj4KPj4gVGhh
bmtzLAo+PiBKZXNzZSBUYXViZQo+IAo+IFN1cmUsIGl0J3MgYXR0YWNoZWQuCgpIbW1tLCBpdCBs
aW5rcyBmaW5lIGZvciBtZS4KCm9iamR1bXAgLXggdm1saW51eCB8IGdyZXAgazIxMF9jbGtfZWFy
bHlfaW5pdAo4MWU0MDEyNCBnICAgICBGIC5pbml0LnRleHQgICAgIDAwMDAwMDg4IGsyMTBfY2xr
X2Vhcmx5X2luaXQKCmdjYyB2ZXJzaW9uIDExLjMuMCAoQnVpbGRyb290IDIwMjIuMTEtMzYxLWcx
YmUwZDQzOGY3KQpHTlUgYXNzZW1ibGVyIHZlcnNpb24gMi4zOCAocmlzY3YzMi1idWlsZHJvb3Qt
bGludXgtdWNsaWJjKQpHTlUgbGQgKEdOVSBCaW51dGlscykgMi4zOAoKd2hhdCBnY2MgdmVyc2lv
biBhcmUgeW91IHVzaW5nPwoKVGhhbmtzLApKZXNzZSBUYXViZQoKPiAKPj4+IEFyZy4gRm9yZ290
IGFib3V0IHRoYXQuIGsyMTAgaXMgcnY2NCBvbmx5IGFuZCB3aGlsZSB0aGUgY2xrIGRyaXZlciBj
b3VsZCBzdGlsbAo+Pj4gY29tcGlsZSB0ZXN0IHdpdGggcnYzMiAob3IgYW55IGFyY2gpLCB0aGF0
IGRyaXZlciBwcm92aWRlcyB0aGUKPj4+IGsyMTBfY2xrX2Vhcmx5X2luaXQoKSBmdW5jdGlvbiB3
aGljaCBpcyBjYWxsZWQgdmVyeSBlYXJseSBpbiB0aGUgYm9vdCBwcm9jZXNzCj4+PiBmcm9tIGsy
MTBfc29jX2Vhcmx5X2luaXQoKSwgd2hpY2ggaXMgYW4gU09DX0VBUkxZX0lOSVRfREVDTEFSRSgp
IGNhbGwuIFRoZQo+Pj4gcHJvYmxlbSBtYXkgYmUgdGhlcmUuIFByb2JhYmx5IHNob3VsZCBiZSBk
aXNhYmxlZCBmb3IgcnYzMiBpZiBubyBTb0MgbmVlZCB0aGF0Cj4+PiBzb3J0IG9mIGVhcmx5IGlu
aXQgY2FsbC4KPj4+Cj4+Pj4KPj4+PiBiZWNhdXNlCj4+Pj4gIyBDT05GSUdfQ09NTU9OX0NMS19L
MjEwIGlzIG5vdCBzZXQKPj4+Pgo+Pj4+Cj4+Pj4gTWF5YmUgU09DX0NBTkFBTiBuZWVkcyBzb21l
IG1vcmUgc2VsZWN0cyBmb3IgcmVxdWlyZWQgY29kZT8KPj4+Pgo+Pj4+PiBDb25vciBEb29sZXkg
KDEpOgo+Pj4+PiAgwqDCoCBjbGs6IGsyMTA6IHJlbW92ZSBhbiBpbXBsaWNpdCA2NC1iaXQgZGl2
aXNpb24KPj4+Pj4KPj4+Pj4gSmVzc2UgVGF1YmUgKDEpOgo+Pj4+PiAgwqDCoCByaXNjdjogY29u
ZmlnczogQWRkIG5vbW11IFBIT05ZIGRlZmNvbmZpZyBmb3IgUlYzMgo+Pj4+Pgo+Pj4+PiBZaW1p
biBHdSAoMSk6Cj4+Pj4+ICDCoMKgIHJpc2N2OiBLY29uZmlnOiBBbGxvdyBSVjMyIHRvIGJ1aWxk
IHdpdGggbm8gTU1VCj4+Pj4+Cj4+Pj4+ICDCoCBhcmNoL3Jpc2N2L0tjb25maWfCoMKgwqDCoCB8
IDUgKystLS0KPj4+Pj4gIMKgIGFyY2gvcmlzY3YvTWFrZWZpbGXCoMKgwqAgfCA0ICsrKysKPj4+
Pj4gIMKgIGRyaXZlcnMvY2xrL2Nsay1rMjEwLmMgfCAyICstCj4+Pj4+ICDCoCAzIGZpbGVzIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pgo+Pj4KPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
