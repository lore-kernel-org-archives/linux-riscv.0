Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A557C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 06:45:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C450B61406
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 06:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C450B61406
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=aowOZSX3a5YmsolrzR1EwsynZnmAJdq498nc3sJRWa4=; b=jl5oFfVBvueSHaI90LXBXC7sM
	6IiycapxNLKUxyfOs5MY03Hff4iKnnV34uwTE3A7F6hozsjGhEqbjAJjNmc6ZMrth+mXdrdUBbh5a
	XOEjLdrOFDRjGcr/z5VSZkhMk4qNuuyakQ8qVkLnQ+LFJztsJH2Yo+ei+CvH3MGhz7RRjXowKyOwf
	rMBajNX5JC/TBN+SY0UTiVa2J+x/nh2+kmMLR5OEL5QAc+g+by6LCsyLAJjLzk1EkDGe9PpFkcHSr
	UjX6+jYutRlxwBqJXzs0ZurIzX5oREKaQmIktd8i7ioWWikIEawUSlEclb3LvNQHG4bvLy1A36Mi8
	+wgiZHllw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZpYc-000tit-FO; Fri, 23 Apr 2021 06:44:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZpYK-000the-Mn
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 06:44:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=6YoIQjJWg5x7FZWmpJBpQajt6d11jA53yTkq2GJ52Fg=; b=qb891AB3qQxmhxvJMBBnChYIcG
 1O0sUG060wkz7IhKjUqWbCfHgBHykX6TTgkt12QgrIWG0+3umsMYBe5Cigmm3rVTe7DQz5rs4a3Pa
 eNYzoVq7b7gZa/l2qgPyTIhkZ65B08xwgaqEtUkZ4enKlkh5N9rsmwUj3vusf+fkkA6XJPp298e0e
 po8aWeS1EH8KKHdcmD8uaYOyZEQo6sQjmjIQfzFsXcK9x5vcmMkbHvNGgggoj89dqJ6Mdf1hO+ytQ
 aHbReAcWqhUeE+WfD1NUz9QN5Q78H9tjxD0GmRQ+pEMhYfqp8Ih/8I+hEiyYnnPNkDLhTJV1zp49+
 iMDWFDEA==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZpYH-00EC8V-QQ
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 06:44:35 +0000
Received: by mail-pf1-x435.google.com with SMTP id c17so33470502pfn.6
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 23:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6YoIQjJWg5x7FZWmpJBpQajt6d11jA53yTkq2GJ52Fg=;
 b=y4/quQnZ1+5z+yB/eGjzy+zP6Z50stAAkESnRNjicJXA11+LKirXlkPBil32I6rZ4p
 oHggD4ZIpZM8YnqcbbtmXPnotZXsYJLVOrgI2zFhvgC/0b45I0iZlontqyO5yNdihE3x
 vEtvwqOiY5tdMMZbb4WD1MrgPbjbfdFH716BfwjjDV1MVWtHZkTAWHSxWUiCZ1vUco0T
 ctnREYxeRTagE9T8v+Niu0nWVn/fyd8p2vCWc00/FH4/IwopL4JO9aTYNQkIw85ZE4FC
 vT9ST7MKO0INBjL/wk4vBOEZ6LM+KRHdbP8hrqkrVa3fKhgt9/b3C4cSASWNxbPqFkPm
 QsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6YoIQjJWg5x7FZWmpJBpQajt6d11jA53yTkq2GJ52Fg=;
 b=aOwP5XW5bQrX+HX/Y6ZMMD/MA0H9IgOyEQUDN2AdsxCutxEvT4le49T5m/s3CYSE4W
 HPdH11U18GAaHUIwl6JZ24ssAdn7jxm2vTe56cdYUrfbIRVGDn1Le+hIByMoC8d/O3gt
 mr/LLiyUFZzZeYroVH7dwKz8xPzqZne6ui9jrtj0RU8wn4aRG35KgGiv4gBRdqDnF1lf
 wQaAUe2M4BXiS+mIj/vt6WnPF7w2xeAm+JWvuGNloOlxhBMKdGjQRYoOu3c0IuKjAl4e
 dcjlZMf91I6DoZnefb5XU4VMvsGyqmUWJ+KzDwoMKTBULud9NjDsbIgshrFYLFSSHG9I
 SMSA==
X-Gm-Message-State: AOAM532EiVhB8lyamoOsFod/x0qusorcgMCBz4Ox3naXnT9OFwTF3yyB
 USedQrMu3HjoUmEA3kARyeKA8Q==
X-Google-Smtp-Source: ABdhPJxRevAvGl2q18+obbeGUay+tkR2dWQQiyLd0LGRnMNxD7HWEX01B5M90uQMGXPp2uceQIzFwQ==
X-Received: by 2002:a05:6a00:854:b029:25c:8f19:c4ed with SMTP id
 q20-20020a056a000854b029025c8f19c4edmr2663840pfk.40.1619160272078; 
 Thu, 22 Apr 2021 23:44:32 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u12sm7188607pji.45.2021.04.22.23.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 23:44:31 -0700 (PDT)
Date: Thu, 22 Apr 2021 23:44:31 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Apr 2021 23:44:30 PDT (-0700)
Subject: Re: [PATCH v4 1/2] binfmt_flat: allow not offsetting data start
In-Reply-To: <f1faaadb-8ba5-6cff-4bba-928141936040@linux-m68k.org>
CC: Damien Le Moal <Damien.LeMoal@wdc.com>, uclinux-dev@uclinux.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <Anup.Patel@wdc.com>, Christoph Hellwig <hch@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: gerg@linux-m68k.org
Message-ID: <mhng-7ec86909-1d6f-4cb8-b5f3-02f21cc6d904@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_234433_883076_EF48EBEE 
X-CRM114-Status: GOOD (  23.45  )
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

T24gVGh1LCAyMiBBcHIgMjAyMSAyMjozODozNiBQRFQgKC0wNzAwKSwgZ2VyZ0BsaW51eC1tNjhr
Lm9yZyB3cm90ZToKPgo+Cj4gT24gMjMvNC8yMSAyOjA0IHBtLCBQYWxtZXIgRGFiYmVsdCB3cm90
ZToKPj4gT24gVGh1LCAyMiBBcHIgMjAyMSAwNTowMDozMiBQRFQgKC0wNzAwKSwgRGFtaWVuIExl
IE1vYWwgd3JvdGU6Cj4+Pj4gT24gMjAyMS8wNC8xOCAxMTozOCwgR3JlZyBVbmdlcmVyIHdyb3Rl
Ogo+Pj4+Cj4+Pj4KPj4+PiBPbiAxNy80LzIxIDI6NTQgcG0sIERhbWllbiBMZSBNb2FsIHdyb3Rl
Ogo+Pj4+PiBPbiAyMDIxLzA0LzE3IDEzOjUyLCBHcmVnIFVuZ2VyZXIgd3JvdGU6Cj4+Pj4+Pgo+
Pj4+Pj4gT24gMTcvNC8yMSAxMToxMCBhbSwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj4+Pj4+Pj4g
Q29tbWl0IDIyMTdiOTgyNjI0NiAoImJpbmZtdF9mbGF0OiByZXZlcnQgImJpbmZtdF9mbGF0OiBk
b24ndCBvZmZzZXQKPj4+Pj4+PiB0aGUgZGF0YSBzdGFydCIiKSByZXN0b3JlZCBvZmZzZXR0aW5n
IHRoZSBzdGFydCBvZiB0aGUgZGF0YSBzZWN0aW9uIGJ5Cj4+Pj4+Pj4gYSBudW1iZXIgb2Ygd29y
ZHMgZGVmaW5lZCBieSBNQVhfU0hBUkVEX0xJQlMuIEFzIGEgcmVzdWx0LCBzaW5jZQo+Pj4+Pj4+
IE1BWF9TSEFSRURfTElCUyBpcyBuZXZlciAwLCBhIGdhcCBiZXR3ZWVuIHRoZSB0ZXh0IGFuZCBk
YXRhIHNlY3Rpb25zCj4+Pj4+Pj4gYWx3YXlzIGV4aXN0cy4gRm9yIGFyY2hpdGVjdHVyZXMgd2hp
Y2ggY2Fubm90IHN1cHBvcnQgYSBzdWNoIGdhcAo+Pj4+Pj4+IGJldHdlZW4gdGhlIHRleHQgYW5k
IGRhdGEgc2VjdGlvbnMgKGUuZy4gcmlzY3Ygbm9tbXUpLCBmbGF0IGJpbmFyeQo+Pj4+Pj4+IHBy
b2dyYW1zIGNhbm5vdCBiZSBleGVjdXRlZC4KPj4+Pj4+Pgo+Pj4+Pj4+IFRvIGFsbG93IGFuIGFy
Y2hpdGVjdHVyZSB0byByZXF1ZXN0IG5vIGRhdGEgc3RhcnQgb2Zmc2V0IHRvIGFsbG93IGZvcgo+
Pj4+Pj4+IGNvbnRpZ3VvdXMgdGV4dCBhbmQgZGF0YSBzZWN0aW9ucyBmb3IgYmluYXJpZXMgZmxh
Z2dlZCB3aXRoCj4+Pj4+Pj4gRkxBVF9GTEFHX1JBTSwgaW50cm9kdWNlIHRoZSBuZXcgY29uZmln
IG9wdGlvbgo+Pj4+Pj4+IENPTkZJR19CSU5GTVRfRkxBVF9OT19EQVRBX1NUQVJUX09GRlNFVC4g
VXNpbmcgdGhpcyBuZXcgb3B0aW9uLCB0aGUKPj4+Pj4+PiBtYWNybyBEQVRBX1NUQVJUX09GRlNF
VF9XT1JEUyBpcyBjb25kaXRpb25hbGx5IGRlZmluZWQgaW4gYmluZm10X2ZsYXQuYwo+Pj4+Pj4+
IHRvIE1BWF9TSEFSRURfTElCUyBmb3IgYXJjaGl0ZWN0dXJlcyB0b2xlcmF0aW5nIG9yIG5lZWRp
bmcgdGhlIGRhdGEKPj4+Pj4+PiBzdGFydCBvZmZzZXQgKENPTkZJR19CSU5GTVRfRkxBVF9OT19E
QVRBX1NUQVJUX09GRlNFVCBkaXNhYmxlZCBjYXNlKQo+Pj4+Pj4+IGFuZCB0byAwIHdoZW4gQ09O
RklHX0JJTkZNVF9GTEFUX05PX0RBVEFfU1RBUlRfT0ZGU0VUIGlzIGVuYWJsZWQuCj4+Pj4+Pj4g
REFUQV9TVEFSVF9PRkZTRVRfV09SRFMgaXMgdXNlZCBpbiBsb2FkX2ZsYXRfZmlsZSgpIHRvIGNh
bGN1bGF0ZSB0aGUKPj4+Pj4+PiBkYXRhIHNlY3Rpb24gbGVuZ3RoIGFuZCBzdGFydCBwb3NpdGlv
bi4KPj4+Pj4+Pgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IERhbWllbiBMZSBNb2FsIDxkYW1pZW4u
bGVtb2FsQHdkYy5jb20+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gwqDCoCBmcy9LY29uZmlnLmJpbmZt
dCB8wqAgMyArKysKPj4+Pj4+PiDCoMKgIGZzL2JpbmZtdF9mbGF0LmPCoCB8IDE5ICsrKysrKysr
KysrKysrLS0tLS0KPj4+Pj4+PiDCoMKgIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKPj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9LY29uZmln
LmJpbmZtdCBiL2ZzL0tjb25maWcuYmluZm10Cj4+Pj4+Pj4gaW5kZXggYzZmMWM4YzE5MzRlLi4w
NmZiN2E5M2ExYmQgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvZnMvS2NvbmZpZy5iaW5mbXQKPj4+Pj4+
PiArKysgYi9mcy9LY29uZmlnLmJpbmZtdAo+Pj4+Pj4+IEBAIC0xMTIsNiArMTEyLDkgQEAgY29u
ZmlnIEJJTkZNVF9GTEFUX0FSR1ZQX0VOVlBfT05fU1RBQ0sKPj4+Pj4+PiDCoMKgIGNvbmZpZyBC
SU5GTVRfRkxBVF9PTERfQUxXQVlTX1JBTQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBib29sCj4+Pj4+
Pj4gK2NvbmZpZyBCSU5GTVRfRkxBVF9OT19EQVRBX1NUQVJUX09GRlNFVAo+Pj4+Pj4+ICvCoMKg
wqAgYm9vbAo+Pj4+Pj4+ICsKPj4+Pj4+PiDCoMKgIGNvbmZpZyBCSU5GTVRfRkxBVF9PTEQKPj4+
Pj4+PiDCoMKgwqDCoMKgwqAgYm9vbCAiRW5hYmxlIHN1cHBvcnQgZm9yIHZlcnkgb2xkIGxlZ2Fj
eSBmbGF0IGJpbmFyaWVzIgo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBkZXBlbmRzIG9uIEJJTkZNVF9G
TEFUCj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2JpbmZtdF9mbGF0LmMgYi9mcy9iaW5mbXRfZmxh
dC5jCj4+Pj4+Pj4gaW5kZXggYjljNjU4ZTA1NDhlLi4xZGM2OGRmYmEzZTAgMTAwNjQ0Cj4+Pj4+
Pj4gLS0tIGEvZnMvYmluZm10X2ZsYXQuYwo+Pj4+Pj4+ICsrKyBiL2ZzL2JpbmZtdF9mbGF0LmMK
Pj4+Pj4+PiBAQCAtNzQsNiArNzQsMTIgQEAKPj4+Pj4+PiDCoMKgICNkZWZpbmXCoMKgwqAgTUFY
X1NIQVJFRF9MSUJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoMSkKPj4+Pj4+PiDCoMKgICNlbmRp
Zgo+Pj4+Pj4+ICsjaWZkZWYgQ09ORklHX0JJTkZNVF9GTEFUX05PX0RBVEFfU1RBUlRfT0ZGU0VU
Cj4+Pj4+Pj4gKyNkZWZpbmUgREFUQV9TVEFSVF9PRkZTRVRfV09SRFPCoMKgwqDCoMKgwqDCoCAo
MCkKPj4+Pj4+PiArI2Vsc2UKPj4+Pj4+PiArI2RlZmluZSBEQVRBX1NUQVJUX09GRlNFVF9XT1JE
U8KgwqDCoMKgwqDCoMKgIChNQVhfU0hBUkVEX0xJQlMpCj4+Pj4+Pj4gKyNlbmRpZgo+Pj4+Pj4+
ICsKPj4+Pj4+PiDCoMKgIHN0cnVjdCBsaWJfaW5mbyB7Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIHN0
cnVjdCB7Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBzdGFydF9j
b2RlO8KgwqDCoMKgwqDCoMKgIC8qIFN0YXJ0IG9mIHRleHQgc2VnbWVudCAqLwo+Pj4+Pj4+IEBA
IC01NjAsNiArNTY2LDcgQEAgc3RhdGljIGludCBsb2FkX2ZsYXRfZmlsZShzdHJ1Y3QgbGludXhf
YmlucHJtICpicHJtLAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgICogaXQgYWxsIHRvZ2V0aGVyLgo+
Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgICovCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIGlmICghSVNfRU5B
QkxFRChDT05GSUdfTU1VKSAmJiAhKGZsYWdzICYgKEZMQVRfRkxBR19SQU18RkxBVF9GTEFHX0da
SVApKSkgewo+Pj4+Pj4+ICsKPj4+Pj4+Cj4+Pj4+PiBSYW5kb20gd2hpdGUgc3BhY2UgY2hhbmdl
Li4uCj4+Pj4+PiBEb24ndCB3b3JyeSBhYm91dCByZS1zcGlubmluZyB0aG91Z2gsIEkgd2lsbCBq
dXN0IGVkaXQgdGhpcyBjaHVuayBvdXQuCj4+Pj4+Cj4+Pj4+IE9vcHMuIFNvcnJ5IGFib3V0IHRo
YXQuIEkgc2hvdWxkIGhhdmUgYmV0dGVyIGNoZWNrZWQgOikKPj4+Pj4KPj4+Pj4+Cj4+Pj4+Pgo+
Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqIHRoaXMgc2hvdWxkIGdpdmUgdXMgYSBST00gcHRyLMKgIGJ1dCBpZiBpdCBkb2Vzbid0
IHdlIGRvbid0Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHJlYWxseSBjYXJlCj4+
Pj4+Pj4gQEAgLTU3Niw3ICs1ODMsOCBAQCBzdGF0aWMgaW50IGxvYWRfZmxhdF9maWxlKHN0cnVj
dCBsaW51eF9iaW5wcm0gKmJwcm0sCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBnb3RvIGVycjsKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+Pj4gLcKgwqDC
oMKgwqDCoMKgIGxlbiA9IGRhdGFfbGVuICsgZXh0cmEgKyBNQVhfU0hBUkVEX0xJQlMgKiBzaXpl
b2YodW5zaWduZWQgbG9uZyk7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGxlbiA9IGRhdGFfbGVu
ICsgZXh0cmEgKwo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERBVEFfU1RBUlRfT0ZG
U0VUX1dPUkRTICogc2l6ZW9mKHVuc2lnbmVkIGxvbmcpOwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGxlbiA9IFBBR0VfQUxJR04obGVuKTsKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZWFsZGF0YXN0YXJ0ID0gdm1fbW1hcChOVUxMLCAwLCBsZW4sCj4+Pj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBQUk9UX1JFQUR8UFJPVF9XUklURXxQUk9UX0VYRUMsIE1BUF9Q
UklWQVRFLCAwKTsKPj4+Pj4+PiBAQCAtNTkxLDcgKzU5OSw3IEBAIHN0YXRpYyBpbnQgbG9hZF9m
bGF0X2ZpbGUoc3RydWN0IGxpbnV4X2JpbnBybSAqYnBybSwKPj4+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyOwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0K
Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkYXRhcG9zID0gQUxJR04ocmVhbGRhdGFzdGFy
dCArCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBNQVhfU0hBUkVEX0xJ
QlMgKiBzaXplb2YodW5zaWduZWQgbG9uZyksCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBEQVRBX1NUQVJUX09GRlNFVF9XT1JEUyAqIHNpemVvZih1bnNpZ25lZCBsb25n
KSwKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRkxBVF9EQVRB
X0FMSUdOKTsKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcl9kZWJ1ZygiQWxsb2NhdGVk
IGRhdGErYnNzK3N0YWNrICgldSBieXRlcyk6ICVseFxuIiwKPj4+Pj4+PiBAQCAtNjIyLDcgKzYz
MCw4IEBAIHN0YXRpYyBpbnQgbG9hZF9mbGF0X2ZpbGUoc3RydWN0IGxpbnV4X2JpbnBybSAqYnBy
bSwKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZW1wX3NpemUgPSBsZW47Cj4+Pj4+Pj4g
wqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGxlbiA9IHRleHRf
bGVuICsgZGF0YV9sZW4gKyBleHRyYSArIE1BWF9TSEFSRURfTElCUyAqIHNpemVvZih1MzIpOwo+
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBsZW4gPSB0ZXh0X2xlbiArIGRhdGFfbGVuICsgZXh0cmEg
Kwo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERBVEFfU1RBUlRfT0ZGU0VUX1dPUkRT
ICogc2l6ZW9mKHUzMik7Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGVuID0gUEFHRV9B
TElHTihsZW4pOwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRleHRwb3MgPSB2bV9tbWFw
KE5VTEwsIDAsIGxlbiwKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBST1Rf
UkVBRCB8IFBST1RfRVhFQyB8IFBST1RfV1JJVEUsIE1BUF9QUklWQVRFLCAwKTsKPj4+Pj4+PiBA
QCAtNjM4LDcgKzY0Nyw3IEBAIHN0YXRpYyBpbnQgbG9hZF9mbGF0X2ZpbGUoc3RydWN0IGxpbnV4
X2JpbnBybSAqYnBybSwKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWFsZGF0YXN0YXJ0
ID0gdGV4dHBvcyArIG50b2hsKGhkci0+ZGF0YV9zdGFydCk7Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZGF0YXBvcyA9IEFMSUdOKHJlYWxkYXRhc3RhcnQgKwo+Pj4+Pj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTUFYX1NIQVJFRF9MSUJTICogc2l6ZW9mKHUzMiksCj4+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBEQVRBX1NUQVJUX09GRlNFVF9X
T1JEUyAqIHNpemVvZih1MzIpLAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBGTEFUX0RBVEFfQUxJR04pOwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
bG9jID0gKF9fYmUzMiBfX3VzZXIgKikKPj4+Pj4+PiBAQCAtNzE0LDcgKzcyMyw3IEBAIHN0YXRp
YyBpbnQgbG9hZF9mbGF0X2ZpbGUoc3RydWN0IGxpbnV4X2JpbnBybSAqYnBybSwKPj4+Pj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHJlc3VsdDsKPj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByX2VycigiVW5hYmxlIHRvIHJlYWQgY29kZStkYXRhK2Jz
cywgZXJybm8gJWRcbiIsIHJldCk7Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB2bV9tdW5tYXAodGV4dHBvcywgdGV4dF9sZW4gKyBkYXRhX2xlbiArIGV4dHJhICsKPj4+Pj4+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE1BWF9TSEFSRURfTElCUyAqIHNpemVv
Zih1MzIpKTsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBEQVRB
X1NUQVJUX09GRlNFVF9XT1JEUyAqIHNpemVvZih1MzIpKTsKPj4+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyOwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0K
Pj4+Pj4+PiDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gVGhhbmtzLCBvdGhl
cndpc2UgbG9va3MgZ29vZC4KPj4+Pj4+Cj4+Pj4+PiBBY2tlZC1ieTogR3JlZyBVbmdlcmVyIDxn
ZXJnQGxpbnV4LW02OGsub3JnPgo+Pj4+Pj4KPj4+Pj4+IEkgd2lsbCBwdXNoIHRoaXMgaW50byBt
eSBtNjhrbm9tbXUgdHJlZSwgZm9yLW5leHQgYnJhbmNoLgo+Pj4+Pj4gSSBqdXN0IGNhcnJ5IHRo
ZSBmbGF0IGZvcm1hdCBjaGFuZ2VzIGluIHRoYXQgdHJlZSBub3cgdG8gbWFrZSBteSBsaWZlIGVh
c2llci4KPj4+Pj4KPj4+Pj4gR3JlYXQuIFRoYW5rcyAhCj4+Pj4+IEFyZSB5b3UgdGFraW5nIGJv
dGggcGF0Y2hlcyBvciBzaG91bGQgUGxhbWVyIHRha2UgdGhlIHJpc2N2IEtjb25maWcgY2hhbmdl
Cj4+Pj4+IHRocm91Z2ggaGlzIHRyZWUgPwo+Pj4+Cj4+Pj4gSSBhbSBoYXBweSB0byB0YWtlIGJv
dGguCj4+Pj4gUGFsbWVyPwo+Pj4KPj4+IFBhbG1lciwKPj4+Cj4+PiBQaW5nICEKPj4KPj4gSSBh
bHJlYWR5IEFjaydkIGl0LCBpbiB0aGUgdGhyZWFkIHdoZXJlIHdlIGNvdWxkbid0IGZpbmQgdGhl
IG1haW50YWluZXIuIEtlZXBpbmcgdGhlc2UgdG9ndGhlciBpcyBmaW5lIHdpdGggbWUsIGFuZCBp
dCBzZWVtcyBlYXNpZXN0Lgo+Cj4gVGhlIDIvMiBwYXRjaCBoYXMgYmVlbiBhcHBsaWVkIHRvIHRo
ZSBtNjhrbm9tbXUgZ2l0IHRyZWUsIGZvci1uZXh0IGJyYW5jaC4KClRoYW5rcyEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
