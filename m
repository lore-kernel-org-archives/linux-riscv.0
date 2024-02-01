Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620A9C4828D
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 13:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3ehCwZbyaDw4rzDiRAyyDNDztIc9pTc2gWUDk+uDcQ=; b=FtED+GLUb6Udq+
	jTTsBIuoqsxkmMIMOBBP+MJwdp4M3mDX7fXvIC+rE10/C+WQjispC4jyuuASA8ZRMGQAmIV7QMeeO
	iJnsDMEEieMND1aO8GKpPGfp2i5fAggxp+B/QwOHEZyYC/Yzd5pk2GLGBVHBZU4UUYPZ3YUBZgDFo
	Pr2z4jNWxeyHMvAjHcZBgeECAlgtPH/FsuEgxACyt9osJZRLutG+lWejFD3JDGwSK5rfZ4tDuaX0e
	wiKgpfYcS+TbwpIKbtiYSaoLgAT3DyR60IedFUWL+/GBER34T/R5BUrT466Z25yKsTkxY1RYJtFv3
	wLvB7rUGVChMyXgedBkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVXMG-000000089Vl-2Qsf;
	Thu, 01 Feb 2024 13:44:00 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVXMD-000000089V7-28OT
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 13:43:58 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7c0366454eeso890039f.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 05:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706795035; x=1707399835; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KyJgY7BtPARQUZY6lELkeOQOV8fvL5HnZ8zoDjrDJkg=;
        b=mGWmaQ/QUZ1XK3CorSehMSrmJYakM79XmWIS8qqJc5HLJJOdX+Z59AfRdEWAxMVTB/
         3xoBkV7UvP0zsAIic89aX0yg4a9gm4OMNKkWu7Emm0aAQHcVr4Oo2lCKgEYcYqXW3KsE
         lUnfYKUIBpR6o8yPDp1ll2Zyfg7ZyirqoJKunLkz62gi6TvJ6ZnPK1UUWeszwdzWd16I
         ikiIPh48e2EHpBDiQANoGHFgfTi2U3YovTGPuCmJj0D9cqNvqzwB30p10jYNkihmy9oS
         xI7wmD4wgi97gBAX1nSTgo/FjkHTmsTDxG44XlUm3XOu8Mp5yO9FTZX8PmZHQ1KF6SQZ
         gb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706795035; x=1707399835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KyJgY7BtPARQUZY6lELkeOQOV8fvL5HnZ8zoDjrDJkg=;
        b=OdvFGS4xiVmytKa+o3dZBdSxMVotgh7/nKb8vq0rAroynnI50iwp418gdzKuTosz/0
         TeyC9WLhqbuAqJshD2RZC4VapBOf2A69RbTD8iDOTxCD9MgtQroWWfWHT7MIl2cI8q5v
         V9SEa+9CHYfKsDE64H69r32HFSAc8Ia9WVjDvFjPt+xf+BI9G0TKUXA/oHrQuMQcheuw
         LFAVcw72yGjYzUltYBvyGqHoq8AGLqzEyiWsNNLwn86vbhYe/Whl8S8X7jwAKs8y98r/
         YUKR5kxemie01zOkXPbyZNWWsOLxdlXJ9N74thsqqTCt3dHg3jsskdllyd48e2/SzSWd
         lsHg==
X-Gm-Message-State: AOJu0YxrYyY/mdjqVM+szD+XeriCVcJ9lq6C/K6zhktzV7PIcVbVPzLl
	DLlRE81V/8qQrzOX934NeiA1e2CklMPJhLUAB1vcZqwpH9foQ2n6XkZelRrAko8=
X-Google-Smtp-Source: AGHT+IGF9pFocTTyfuBz2hpTG0KD/XMVrNckwQlqP6WmNJAP+YRAQj1lXcnJI1tYZs7rtB9jn+eQ1g==
X-Received: by 2002:a05:6e02:2188:b0:363:8fa8:1c69 with SMTP id j8-20020a056e02218800b003638fa81c69mr5600066ila.2.1706795035164;
        Thu, 01 Feb 2024 05:43:55 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU4b5pmsyNOBSC/aHK766NQrc86SqB0LUf9wDrm/niIS1ET0Z2o/Nu4bTbrwHT3Ywgig4ePbUj30RvgeotX47o39Pt2p34dFyCLc+bFwBCr3IJtKds7D19Y98fDA8wXpJ4wpWtxXGY30Mfs5qODqJVSToPgjCCPK49M6hONichwasdcYj0nENcOAzQwtFDmMXuDcdXGhIMinsfZybmE3O4o49OgjGXTQQdUum87uGO1uBsJM5cDRsjn
Received: from ?IPV6:2a01:e0a:999:a3a0:189:f9cd:e10f:7a3f? ([2a01:e0a:999:a3a0:189:f9cd:e10f:7a3f])
        by smtp.gmail.com with ESMTPSA id a15-20020a631a0f000000b005c662e103a1sm12463130pga.41.2024.02.01.05.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 05:43:54 -0800 (PST)
Message-ID: <48e6b009-c79c-4a2e-a532-e46c7b8b6fc8@rivosinc.com>
Date: Thu, 1 Feb 2024 14:43:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: Disable misaligned access probe when
 CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240131-disable_misaligned_probe_config-v1-0-98d155e9cda8@rivosinc.com>
 <20240131-disable_misaligned_probe_config-v1-2-98d155e9cda8@rivosinc.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240131-disable_misaligned_probe_config-v1-2-98d155e9cda8@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_054357_719947_D34EFFE7 
X-CRM114-Status: GOOD (  19.62  )
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

CgpPbiAwMS8wMi8yMDI0IDA3OjQwLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gV2hlbiBDT05G
SUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUyBpcyBzZWxlY3RlZCwgdGhlIGNwdXMg
Y2FuIGJlCj4gc2V0IHRvIGhhdmUgZmFzdCBtaXNhbGlnbmVkIGFjY2VzcyB3aXRob3V0IG5lZWRp
bmcgdG8gcHJvYmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGll
QHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJl
LmggIHwgNyArKysrKysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgICB8
IDQgKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgfCA0ICsrKysK
PiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgNCArKysrCj4gIDQgZmls
ZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVh
dHVyZS5oCj4gaW5kZXggZGZkY2NhMjI5MTc0Li43ZDhkNjQ3ODNlMzggMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+IEBAIC0xMzcsMTAgKzEzNywxNyBAQCBzdGF0aWMgX19h
bHdheXNfaW5saW5lIGJvb2wgcmlzY3ZfY3B1X2hhc19leHRlbnNpb25fdW5saWtlbHkoaW50IGNw
dSwgY29uc3QgdW5zaQo+ICAJcmV0dXJuIF9fcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUo
aGFydF9pc2FbY3B1XS5pc2EsIGV4dCk7Cj4gIH0KPiAgCj4gKyNpZm5kZWYgQ09ORklHX0hBVkVf
RUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MKPiAgREVDTEFSRV9TVEFUSUNfS0VZX0ZBTFNFKGZh
c3RfbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfa2V5KTsKPiAgCj4gIHN0YXRpYyBfX2Fsd2F5c19p
bmxpbmUgYm9vbCBoYXNfZmFzdF9taXNhbGlnbmVkX2FjY2Vzc2VzKHZvaWQpCj4gIHsKPiAgCXJl
dHVybiBzdGF0aWNfYnJhbmNoX2xpa2VseSgmZmFzdF9taXNhbGlnbmVkX2FjY2Vzc19zcGVlZF9r
ZXkpOwo+ICB9Cj4gKyNlbHNlCj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBoYXNfZmFz
dF9taXNhbGlnbmVkX2FjY2Vzc2VzKHZvaWQpCj4gK3sKPiArCXJldHVybiB0cnVlOwo+ICt9Cj4g
KyNlbmRpZgo+ICAjZW5kaWYKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gaW5kZXggODk5MjBmODRk
MGEzLi5kNzg3ODQ2YzBiNjggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gQEAgLTQzLDEw
ICs0MywxMiBAQCBzdGF0aWMgREVDTEFSRV9CSVRNQVAocmlzY3ZfaXNhLCBSSVNDVl9JU0FfRVhU
X01BWCkgX19yZWFkX21vc3RseTsKPiAgLyogUGVyLWNwdSBJU0EgZXh0ZW5zaW9ucy4gKi8KPiAg
c3RydWN0IHJpc2N2X2lzYWluZm8gaGFydF9pc2FbTlJfQ1BVU107Cj4gIAo+ICsjaWZuZGVmIENP
TkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCj4gIC8qIFBlcmZvcm1hbmNlIGlu
Zm9ybWF0aW9uICovCj4gIERFRklORV9QRVJfQ1BVKGxvbmcsIG1pc2FsaWduZWRfYWNjZXNzX3Nw
ZWVkKTsKPiAgCj4gIHN0YXRpYyBjcHVtYXNrX3QgZmFzdF9taXNhbGlnbmVkX2FjY2VzczsKPiAr
I2VuZGlmCj4gIAo+ICAvKioKPiAgICogcmlzY3ZfaXNhX2V4dGVuc2lvbl9iYXNlKCkgLSBHZXQg
YmFzZSBleHRlbnNpb24gd29yZAo+IEBAIC03MDYsNiArNzA4LDcgQEAgdW5zaWduZWQgbG9uZyBy
aXNjdl9nZXRfZWxmX2h3Y2FwKHZvaWQpCj4gIAlyZXR1cm4gaHdjYXA7Cj4gIH0KPiAgCj4gKyNp
Zm5kZWYgQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MKPiAgc3RhdGljIGlu
dCBjaGVja191bmFsaWduZWRfYWNjZXNzKHZvaWQgKnBhcmFtKQo+ICB7Cj4gIAlpbnQgY3B1ID0g
c21wX3Byb2Nlc3Nvcl9pZCgpOwo+IEBAIC05NDYsNiArOTQ5LDcgQEAgc3RhdGljIGludCBjaGVj
a191bmFsaWduZWRfYWNjZXNzX2FsbF9jcHVzKHZvaWQpCj4gIH0KPiAgCj4gIGFyY2hfaW5pdGNh
bGwoY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19hbGxfY3B1cyk7Cj4gKyNlbmRpZiAvKiBDT05GSUdf
SEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUyAqLwo+ICAKPiAgdm9pZCByaXNjdl91c2Vy
X2lzYV9lbmFibGUodm9pZCkKPiAgewoKSGkgQ2hhcmxpZSwKCkdlbmVyYWxseSwgaGF2aW5nIHNv
IG11Y2ggaWZkZWYgaW4gdmFyaW91cyBwaWVjZXMgb2YgY29kZSBpcyBwcm9iYWJseQpub3QgYSBn
b29kIGlkZWEuCgpBRkFJQ1QsIGlmIENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUND
RVNTIGlzIGVuYWJsZWQsIHRoZSB3aG9sZQptaXNhbGlnbmVkIGFjY2VzcyBzcGVlZCBjaGVja2lu
ZyBjb3VsZCBiZSBvcHQtb3V0LiB3aGljaCBtZWFucyB0aGF0CnByb2JhYmx5IGV2ZXJ5dGhpbmcg
cmVsYXRlZCB0byBtaXNhbGlnbmVkIGFjY2Vzc2VzIHNob3VsZCBiZSBtb3ZlZCBpbgppdCdzIG93
biBmaWxlIGJ1aWxkIGl0IG9ubHkgZm9yIENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURf
QUNDRVNTPW4Kb25seS4KCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3By
b2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gaW5kZXggYTdjNTZiNDFl
ZmQyLi4zZjFhNmVkZmRiMDggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3
cHJvYmUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPiBAQCAtMTQ5
LDYgKzE0OSw3IEBAIHN0YXRpYyBib29sIGh3cHJvYmVfZXh0MF9oYXMoY29uc3Qgc3RydWN0IGNw
dW1hc2sgKmNwdXMsIHVuc2lnbmVkIGxvbmcgZXh0KQo+ICAKPiAgc3RhdGljIHU2NCBod3Byb2Jl
X21pc2FsaWduZWQoY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdXMpCj4gIHsKPiArI2lmbmRlZiBD
T05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUwo+ICAJaW50IGNwdTsKPiAgCXU2
NCBwZXJmID0gLTFVTEw7Cj4gIAo+IEBAIC0xNjgsNiArMTY5LDkgQEAgc3RhdGljIHU2NCBod3By
b2JlX21pc2FsaWduZWQoY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdXMpCj4gIAkJcmV0dXJuIFJJ
U0NWX0hXUFJPQkVfTUlTQUxJR05FRF9VTktOT1dOOwo+ICAKPiAgCXJldHVybiBwZXJmOwo+ICsj
ZWxzZQo+ICsJcmV0dXJuIFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9GQVNUOwo+ICsjZW5kaWYK
PiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgaHdwcm9iZV9vbmVfcGFpcihzdHJ1Y3QgcmlzY3ZfaHdw
cm9iZSAqcGFpciwKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxp
Z25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZD4gaW5kZXggOGRlZDIy
NWU4YzViLi5jMjRmNzlkNzY5ZjYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHNfbWlzYWxpZ25lZC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25l
ZC5jCj4gQEAgLTQxMyw3ICs0MTMsOSBAQCBpbnQgaGFuZGxlX21pc2FsaWduZWRfbG9hZChzdHJ1
Y3QgcHRfcmVncyAqcmVncykKPiAgCj4gIAlwZXJmX3N3X2V2ZW50KFBFUkZfQ09VTlRfU1dfQUxJ
R05NRU5UX0ZBVUxUUywgMSwgcmVncywgYWRkcik7Cj4gIAo+ICsjaWZuZGVmIENPTkZJR19IQVZF
X0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCj4gIAkqdGhpc19jcHVfcHRyKCZtaXNhbGlnbmVk
X2FjY2Vzc19zcGVlZCkgPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURUQ7Cj4gKyNl
bmRpZgoKSSB0aGluayB0aGF0IHJhdGhlciB1c2luZyBpZmRlZmVyeSBpbnNpZGUgdGhpcyBmaWxl
ICh0cmFwc19taXNhbGlnbmVkLmMpCiBpdCBjYW4gYmUgdG90YWxseSBvcHQtb3V0IGluIGNhc2Ug
d2UgaGF2ZQpDT05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUyBzaW5jZSBpdCBp
bXBsaWVzIHRoYXQgbWlzYWxpZ25lZAphY2Nlc3NlcyBhcmUgbm90IGVtdWxhdGVkIChhdCBsZWFz
dCB0aGF0IGlzIG15IHVuZGVyc3RhbmRpbmcpLgoKVGhhbmtzLAoKQ2zDqW1lbnQKCgo+ICAKPiAg
CWlmICghdW5hbGlnbmVkX2VuYWJsZWQpCj4gIAkJcmV0dXJuIC0xOwo+IEBAIC01OTYsNiArNTk4
LDcgQEAgaW50IGhhbmRsZV9taXNhbGlnbmVkX3N0b3JlKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+
ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gKyNpZm5kZWYgQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VO
QUxJR05FRF9BQ0NFU1MKPiAgYm9vbCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKGlu
dCBjcHUpCj4gIHsKPiAgCWxvbmcgKm1hc19wdHIgPSBwZXJfY3B1X3B0cigmbWlzYWxpZ25lZF9h
Y2Nlc3Nfc3BlZWQsIGNwdSk7Cj4gQEAgLTY0MCw2ICs2NDMsNyBAQCB2b2lkIHVuYWxpZ25lZF9l
bXVsYXRpb25fZmluaXNoKHZvaWQpCj4gIAl9Cj4gIAl1bmFsaWduZWRfY3RsID0gdHJ1ZTsKPiAg
fQo+ICsjZW5kaWYKPiAgCj4gIGJvb2wgdW5hbGlnbmVkX2N0bF9hdmFpbGFibGUodm9pZCkKPiAg
ewo+IAoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
