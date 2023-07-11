Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D379EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 20:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=nCAQXIBgKuXxsBBIbBC/XKkisT02kYa+CV93lkdl9a0=; b=bB4TwbqCBnTeRr/GU+LyK1m1xe
	A5PNJWhUM446bOSxzSx0MfwFQCSqYpI/vqwZsumnVXAZiOBOS8Thd3NcT9Ii5/qXezu3gA8vn6hN2
	bm2Z1/fAoRTKoXhX/9wTYlUZ+E0o/j2ooXABkXBIZqxGAoOZp3BZhSEZWHjVFcpTtvO7slFjN5BZZ
	NMLiBiw5EFSxx9odQh6OfcZI9YchcYDqFS2BASeFV0LLbKz6ZGVZO+dmVoNFYqjQrRQG9m1wtPdEx
	r21IUOhGjnd3vJiOExqqB8HfqtUr4TQYy2Ml4QUSM/UOwxGrI94kHmGWqAIlHJoa+jk+VAmFcudU2
	60qvW9HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJJeJ-00Focj-2o;
	Tue, 11 Jul 2023 20:07:51 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJJeG-00Foaj-0X
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 20:07:50 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3461163c0b6so30998515ab.2
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 13:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1689106056; x=1691698056;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7TG1lUj0yJWDC5b+2n3oNphhdUmDaepbVWboQ5kMxE=;
        b=Eb1w8ReYUnJelgvbnGD4EywSbvbMPEAuj/XVCUCFp5PSuJpPBxkYmxDqnS8XaOBy6l
         JaxlTH2+vK23MB8MpLTQQA2M6NcCIYdFSpeyt9LAmN4XpUFD3G1GfnnvFIltR8l2kRFM
         N5tuokQflFtLoa5tybN9tOHUSyj5TReRMI71qwpaVQNg3GG84uRGQR+5/BJT4Ud35IhF
         GXqsIxQjwJuKzEpgtZ6xVQzF8bGzctmoWXmVELD1ainWZs1QHnN44AkJiJ28FUi6h+FE
         d57lQb+RIV9/1t6QHGtdurqt8QJJMYdhjrFoSqMbP6rPXu2rDFzXJXBkKvPNOb6FNDrt
         9AIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689106056; x=1691698056;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7TG1lUj0yJWDC5b+2n3oNphhdUmDaepbVWboQ5kMxE=;
        b=O3VI03KgR0QIWE6uJh6shsE0vcNBoM5u3Fv6twdRiHKZEv2ybSEx8QdEw/FYGvQ/jQ
         OHlaGX3Glwygwoc1/dW+ITlmy4Ex4Yxam/X1o3+jpVddfCZ4wMkS2EAYMuxgNjwNrXMY
         d2v1Vl3ynKosXyptZhraNawBLYHvlnpFZgFDDGQhzeL79INKo9EGpYwPO+7MR00HZfVf
         IETmkXMgRGNIl8/r2g+gYFAw2sNzzrCs0AQByQJYR/bRJBZjtP/jt9oogSn5qmSoPFvy
         /KQ73oEwO1m+8yRfnLPRuTrRya9ObHRLCDK/u4TNPZsfRv6zeC1advtR5Ue0y5LC4nyW
         VHWg==
X-Gm-Message-State: ABy/qLatZA1ywjDm3WOerI3GNRbRonIQf6ZOdfMrg1yBmeN3vas8+aGF
	RhFxbk8QJcG0QWo+8FHj8SZJQw==
X-Google-Smtp-Source: APBJJlHH/A0ynEPhulRc0XOXsfd8vCwRXOP8X4iPwibR6XfghVL81TfEMun2W6skCVBnX6vWXsq+TQ==
X-Received: by 2002:a92:dac7:0:b0:346:732f:2d20 with SMTP id o7-20020a92dac7000000b00346732f2d20mr2606616ilq.2.1689106055732;
        Tue, 11 Jul 2023 13:07:35 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id v2-20020a17090a960200b00262e9fbd5fbsm8416378pjo.32.2023.07.11.13.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 13:07:35 -0700 (PDT)
Date: Tue, 11 Jul 2023 13:07:35 -0700 (PDT)
X-Google-Original-Date: Tue, 11 Jul 2023 13:06:45 PDT (-0700)
Subject: Re: [PATCH bpf] riscv, bpf: Fix inconsistent JIT image generation
In-Reply-To: <830ab76b-ea2a-d522-73f9-b9392aecd0a4@iogearbox.net>
CC: bjorn@kernel.org, ast@kernel.org, andrii@kernel.org, bpf@vger.kernel.org,
  netdev@vger.kernel.org, Bjorn Topel <bjorn@rivosinc.com>, martin.lau@linux.dev, song@kernel.org,
  yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
  haoluo@google.com, jolsa@kernel.org, pulehui@huawei.com, luke.r.nels@gmail.com, xi.wang@gmail.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: daniel@iogearbox.net
Message-ID: <mhng-23e85b35-238d-4274-b1b2-aed4a7f9a600@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_130748_732174_A4BFA5E8 
X-CRM114-Status: GOOD (  22.42  )
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

T24gVHVlLCAxMSBKdWwgMjAyMyAxMzowMzo0NyBQRFQgKC0wNzAwKSwgZGFuaWVsQGlvZ2VhcmJv
eC5uZXQgd3JvdGU6Cj4gT24gNy8xMS8yMyA3OjUwIFBNLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToK
Pj4gT24gTW9uLCAxMCBKdWwgMjAyMyAwMDo0MTozMSBQRFQgKC0wNzAwKSwgYmpvcm5Aa2VybmVs
Lm9yZyB3cm90ZToKPj4+IEZyb206IEJqw4PCtnJuIFTDg8K2cGVsIDxiam9ybkByaXZvc2luYy5j
b20+Cj4+Pgo+Pj4gSW4gb3JkZXIgdG8gZ2VuZXJhdGUgdGhlIHByb2xvZ3VlIGFuZCBlcGlsb2d1
ZSwgdGhlIEJQRiBKSVQgbmVlZHMgdG8KPj4+IGtub3cgd2hpY2ggcmVnaXN0ZXJzIHRoYXQgYXJl
IGNsb2JiZXJlZC4gVGhlcmVmb3JlLCB0aGUgZHVyaW5nCj4+PiBwcmUtZmluYWwgcGFzc2VzLCB0
aGUgcHJvbG9ndWUgaXMgZ2VuZXJhdGVkIGFmdGVyIHRoZSBib2R5IG9mIHRoZQo+Pj4gcHJvZ3Jh
bSBib2R5LXByb2xvZ3VlLWVwaWxvZ3VlLiBUaGVuLCBpbiB0aGUgZmluYWwgcGFzcywgYSBwcm9w
ZXIKPj4+IHByb2xvZ3VlLWJvZHktZXBpbG9ndWUgSklUdGVkIGltYWdlIGlzIGdlbmVyYXRlZC4K
Pj4+Cj4+PiBUaGlzIHNjaGVtZSBoYXMgd29ya2VkIG1vc3Qgb2YgdGhlIHRpbWUuIEhvd2V2ZXIs
IGZvciBzb21lIGxhcmdlCj4+PiBwcm9ncmFtcyB3aXRoIG1hbnkganVtcHMsIGUuZy4gdGhlIHRl
c3Rfa21vZC5zaCBCUEYgc2VsZnRlc3Qgd2l0aAo+Pj4gaGFyZGVuaW5nIGVuYWJsZWQgKGJsaW5k
aW5nIGNvbnN0YW50cyksIHRoaXMgaGFzIHNob3duIHRvIGJlCj4+PiBpbmNvcnJlY3QuIEZvciB0
aGUgZmluYWwgcGFzcywgd2hlbiB0aGUgcHJvcGVyIHByb2xvZ3VlLWJvZHktZXBpbG9ndWUKPj4+
IGlzIGdlbmVyYXRlZCwgdGhlIGltYWdlIGhhcyBub3QgY29udmVyZ2VkLiBUaGlzIHdpbGwgbGVh
ZCB0byB0aGF0IHRoZQo+Pj4gZmluYWwgaW1hZ2Ugd2lsbCBoYXZlIGluY29ycmVjdCBqdW1wIG9m
ZnNldHMuIFRoZSBmb2xsb3dpbmcgaXMgYW4KPj4+IGV4Y2VycHQgZnJvbSBhbiBpbmNvcnJlY3Qg
aW1hZ2U6Cj4+Pgo+Pj4gICAgfCAuLi4KPj4+ICAgIHwgICAgIDNiODogICAgICAgMDBjNTA2NjMg
ICAgICAgICAgICAgICAgYmVxICAgICBhMCxhMiwzYzQgPC50ZXh0KzB4M2M0Pgo+Pj4gICAgfCAg
ICAgM2JjOiAgICAgICAwMDIwZTMxNyAgICAgICAgICAgICAgICBhdWlwYyAgIHQxLDB4MjBlCj4+
PiAgICB8ICAgICAzYzA6ICAgICAgIDQ5NjMwMDY3ICAgICAgICAgICAgICAgIGphbHIgICAgemVy
bywxMTc0KHQxKSAjIDIwZTg1MiA8LnRleHQrMHgyMGU4NTI+Cj4+PiAgICB8IC4uLgo+Pj4gICAg
fCAgMjBlODRjOiAgICAgICA4Nzk2ICAgICAgICAgICAgICAgICAgICBjLm12ICAgIGE1LHQwCj4+
PiAgICB8ICAyMGU4NGU6ICAgICAgIDY0MjIgICAgICAgICAgICAgICAgICAgIGMubGRzcCAgczAs
OChzcCkgICAgIyBFcGlsb2d1ZSBzdGFydAo+Pj4gICAgfCAgMjBlODUwOiAgICAgICA2MTQxICAg
ICAgICAgICAgICAgICAgICBjLmFkZGkxNnNwICAgICAgc3AsMTYKPj4+ICAgIHwgIDIwZTg1Mjog
ICAgICAgODUzZSAgICAgICAgICAgICAgICAgICAgYy5tdiAgICBhMCxhNSAgICAgICAjIEluY29y
cmVjdCBqdW1wIHRhcmdldAo+Pj4gICAgfCAgMjBlODU0OiAgICAgICA4MDgyICAgICAgICAgICAg
ICAgICAgICBjLmpyICAgIHJhCj4+Pgo+Pj4gVGhlIGltYWdlIGhhcyBzaHJ1bmssIGFuZCB0aGUg
ZXBpbG9ndWUgb2Zmc2V0IGlzIGluY29ycmVjdCBpbiB0aGUKPj4+IGZpbmFsIHBhc3MuCj4+Pgo+
Pj4gQ29ycmVjdCB0aGUgcHJvYmxlbSBieSBhbHdheXMgZ2VuZXJhdGluZyBwcm9wZXIgcHJvbG9n
dWUtYm9keS1lcGlsb2d1ZQo+Pj4gb3V0cHV0cywgd2hpY2ggbWVhbnMgdGhhdCB0aGUgZmlyc3Qg
cGFzcyB3aWxsIG9ubHkgZ2VuZXJhdGUgdGhlIGJvZHkKPj4+IHRvIHRyYWNrIHdoYXQgcmVnaXN0
ZXJzIHRoYXQgYXJlIHRvdWNoZWQuCj4+Pgo+Pj4gRml4ZXM6IDIzNTNlY2M2ZjkxZiAoImJwZiwg
cmlzY3Y6IGFkZCBCUEYgSklUIGZvciBSVjY0RyIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBCasODwrZy
biBUw4PCtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+Pj4gLS0tCj4+PiAgIGFyY2gvcmlzY3Yv
bmV0L2JwZl9qaXQuaCAgICAgIHwgIDYgKysrLS0tCj4+PiAgIGFyY2gvcmlzY3YvbmV0L2JwZl9q
aXRfY29yZS5jIHwgMTkgKysrKysrKysrKysrKy0tLS0tLQo+Pj4gICAyIGZpbGVzIGNoYW5nZWQs
IDE2IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvbmV0L2JwZl9qaXQuaCBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaAo+Pj4gaW5k
ZXggYmY5ODAyYTYzMDYxLi4yNzE3ZjU0OTA0MjggMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2
L25ldC9icGZfaml0LmgKPj4+ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaAo+Pj4gQEAg
LTY5LDcgKzY5LDcgQEAgc3RydWN0IHJ2X2ppdF9jb250ZXh0IHsKPj4+ICAgCXN0cnVjdCBicGZf
cHJvZyAqcHJvZzsKPj4+ICAgCXUxNiAqaW5zbnM7CQkvKiBSViBpbnNucyAqLwo+Pj4gICAJaW50
IG5pbnNuczsKPj4+IC0JaW50IGJvZHlfbGVuOwo+Pj4gKwlpbnQgcHJvbG9ndWVfbGVuOwo+Pj4g
ICAJaW50IGVwaWxvZ3VlX29mZnNldDsKPj4+ICAgCWludCAqb2Zmc2V0OwkJLyogQlBGIHRvIFJW
ICovCj4+PiAgIAlpbnQgbmV4ZW50cmllczsKPj4+IEBAIC0yMTYsOCArMjE2LDggQEAgc3RhdGlj
IGlubGluZSBpbnQgcnZfb2Zmc2V0KGludCBpbnNuLCBpbnQgb2ZmLCBzdHJ1Y3QgcnZfaml0X2Nv
bnRleHQgKmN0eCkKPj4+ICAgCWludCBmcm9tLCB0bzsKPj4+Cj4+PiAgIAlvZmYrKzsgLyogQlBG
IGJyYW5jaCBpcyBmcm9tIFBDKzEsIFJWIGlzIGZyb20gUEMgKi8KPj4+IC0JZnJvbSA9IChpbnNu
ID4gMCkgPyBjdHgtPm9mZnNldFtpbnNuIC0gMV0gOiAwOwo+Pj4gLQl0byA9IChpbnNuICsgb2Zm
ID4gMCkgPyBjdHgtPm9mZnNldFtpbnNuICsgb2ZmIC0gMV0gOiAwOwo+Pj4gKwlmcm9tID0gKGlu
c24gPiAwKSA/IGN0eC0+b2Zmc2V0W2luc24gLSAxXSA6IGN0eC0+cHJvbG9ndWVfbGVuOwo+Pj4g
Kwl0byA9IChpbnNuICsgb2ZmID4gMCkgPyBjdHgtPm9mZnNldFtpbnNuICsgb2ZmIC0gMV0gOiBj
dHgtPnByb2xvZ3VlX2xlbjsKPj4+ICAgCXJldHVybiBuaW5zbnNfcnZvZmYodG8gLSBmcm9tKTsK
Pj4+ICAgfQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvcmUu
YyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29yZS5jCj4+PiBpbmRleCA3MzdiYWY4NzE1ZGEu
LjdhMjZhM2UxYzczYyAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29y
ZS5jCj4+PiArKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvcmUuYwo+Pj4gQEAgLTQ0LDcg
KzQ0LDcgQEAgc3RydWN0IGJwZl9wcm9nICpicGZfaW50X2ppdF9jb21waWxlKHN0cnVjdCBicGZf
cHJvZyAqcHJvZykKPj4+ICAgCXVuc2lnbmVkIGludCBwcm9nX3NpemUgPSAwLCBleHRhYmxlX3Np
emUgPSAwOwo+Pj4gICAJYm9vbCB0bXBfYmxpbmRlZCA9IGZhbHNlLCBleHRyYV9wYXNzID0gZmFs
c2U7Cj4+PiAgIAlzdHJ1Y3QgYnBmX3Byb2cgKnRtcCwgKm9yaWdfcHJvZyA9IHByb2c7Cj4+PiAt
CWludCBwYXNzID0gMCwgcHJldl9uaW5zbnMgPSAwLCBwcm9sb2d1ZV9sZW4sIGk7Cj4+PiArCWlu
dCBwYXNzID0gMCwgcHJldl9uaW5zbnMgPSAwLCBpOwo+Pj4gICAJc3RydWN0IHJ2X2ppdF9kYXRh
ICpqaXRfZGF0YTsKPj4+ICAgCXN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4Owo+Pj4KPj4+IEBA
IC04Myw2ICs4MywxMiBAQCBzdHJ1Y3QgYnBmX3Byb2cgKmJwZl9pbnRfaml0X2NvbXBpbGUoc3Ry
dWN0IGJwZl9wcm9nICpwcm9nKQo+Pj4gICAJCXByb2cgPSBvcmlnX3Byb2c7Cj4+PiAgIAkJZ290
byBvdXRfb2Zmc2V0Owo+Pj4gICAJfQo+Pj4gKwo+Pj4gKwlpZiAoYnVpbGRfYm9keShjdHgsIGV4
dHJhX3Bhc3MsIE5VTEwpKSB7Cj4+PiArCQlwcm9nID0gb3JpZ19wcm9nOwo+Pj4gKwkJZ290byBv
dXRfb2Zmc2V0Owo+Pj4gKwl9Cj4+PiArCj4+PiAgIAlmb3IgKGkgPSAwOyBpIDwgcHJvZy0+bGVu
OyBpKyspIHsKPj4+ICAgCQlwcmV2X25pbnNucyArPSAzMjsKPj4+ICAgCQljdHgtPm9mZnNldFtp
XSA9IHByZXZfbmluc25zOwo+Pj4gQEAgLTkxLDEyICs5NywxNSBAQCBzdHJ1Y3QgYnBmX3Byb2cg
KmJwZl9pbnRfaml0X2NvbXBpbGUoc3RydWN0IGJwZl9wcm9nICpwcm9nKQo+Pj4gICAJZm9yIChp
ID0gMDsgaSA8IE5SX0pJVF9JVEVSQVRJT05TOyBpKyspIHsKPj4+ICAgCQlwYXNzKys7Cj4+PiAg
IAkJY3R4LT5uaW5zbnMgPSAwOwo+Pj4gKwo+Pj4gKwkJYnBmX2ppdF9idWlsZF9wcm9sb2d1ZShj
dHgpOwo+Pj4gKwkJY3R4LT5wcm9sb2d1ZV9sZW4gPSBjdHgtPm5pbnNuczsKPj4+ICsKPj4+ICAg
CQlpZiAoYnVpbGRfYm9keShjdHgsIGV4dHJhX3Bhc3MsIGN0eC0+b2Zmc2V0KSkgewo+Pj4gICAJ
CQlwcm9nID0gb3JpZ19wcm9nOwo+Pj4gICAJCQlnb3RvIG91dF9vZmZzZXQ7Cj4+PiAgIAkJfQo+
Pj4gLQkJY3R4LT5ib2R5X2xlbiA9IGN0eC0+bmluc25zOwo+Pj4gLQkJYnBmX2ppdF9idWlsZF9w
cm9sb2d1ZShjdHgpOwo+Pj4gKwo+Pj4gICAJCWN0eC0+ZXBpbG9ndWVfb2Zmc2V0ID0gY3R4LT5u
aW5zbnM7Cj4+PiAgIAkJYnBmX2ppdF9idWlsZF9lcGlsb2d1ZShjdHgpOwo+Pj4KPj4+IEBAIC0x
NjIsMTAgKzE3MSw4IEBAIHN0cnVjdCBicGZfcHJvZyAqYnBmX2ludF9qaXRfY29tcGlsZShzdHJ1
Y3QgYnBmX3Byb2cgKnByb2cpCj4+Pgo+Pj4gICAJaWYgKCFwcm9nLT5pc19mdW5jIHx8IGV4dHJh
X3Bhc3MpIHsKPj4+ICAgCQlicGZfaml0X2JpbmFyeV9sb2NrX3JvKGppdF9kYXRhLT5oZWFkZXIp
Owo+Pj4gLQkJcHJvbG9ndWVfbGVuID0gY3R4LT5lcGlsb2d1ZV9vZmZzZXQgLSBjdHgtPmJvZHlf
bGVuOwo+Pj4gICAJCWZvciAoaSA9IDA7IGkgPCBwcm9nLT5sZW47IGkrKykKPj4+IC0JCQljdHgt
Pm9mZnNldFtpXSA9IG5pbnNuc19ydm9mZihwcm9sb2d1ZV9sZW4gKwo+Pj4gLQkJCQkJCSAgICAg
IGN0eC0+b2Zmc2V0W2ldKTsKPj4+ICsJCQljdHgtPm9mZnNldFtpXSA9IG5pbnNuc19ydm9mZihj
dHgtPm9mZnNldFtpXSk7Cj4+PiAgIAkJYnBmX3Byb2dfZmlsbF9qaXRlZF9saW5mbyhwcm9nLCBj
dHgtPm9mZnNldCk7Cj4+PiAgIG91dF9vZmZzZXQ6Cj4+PiAgIAkJa2ZyZWUoY3R4LT5vZmZzZXQp
Owo+Pj4KPj4+IGJhc2UtY29tbWl0OiA0OTY3MjBiN2NmYjY1NzRhOGY2ZjRkNDM0ZjIzZTNkMWU2
Y2ZhZWI5Cj4+Cj4+IEFja2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNv
bT4KPj4gUmV2aWV3ZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+
Pgo+PiBJJ20gYXNzdW1pbmcgdGhpcyBpcyBhaW1lZCBhdCB0aGUgQlBGIHRyZWUsIGJ1dCBMTUsg
aWYgeW91IGd1eXMgd2FudCBtZQo+PiB0byBwaWNrIGl0IHVwIC0tIEkndmUgYWxyZWFkeSBnb3Qg
c29tZXRoaW5nIGZvciB0aGlzIHdlZWssIHNvIGl0J3MgZWFzeQo+PiBvbiBteSBlbmQuICBJJ20g
ZHJvcHBpbmcgaXQgZnJvbSBteSBxdWV1ZSBhbmQgcGF0Y2h3b3JrIGZvciBub3csIHRob3VnaC4K
Pgo+IFNvdW5kcyBnb29kLCB3ZSBhcHBsaWVkIGl0IHRvIGJwZiBhbHJlYWR5LgoKVGhhbmtzIQoK
Pgo+IFRoYW5rcywKPiBEYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
