Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEC1EB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 23:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=O2mjV+nUC23jIwnLK4zjs8gO+XbSi1oTNM25pIokfXo=; b=GsF+Jf/yGcJ7iR7uxwoxxkUMYu
	kwI09Y1SahiewFdxThg6urTxpL/b06jI9IxfKLK2DrS23qeADthYSEPf3/8YPNVb4Q4uRJxFgSUyP
	8H4Lcg1DQLCTYzGxMs34NOhXtdoTvuUrxZXctIJ11E2C3YQbA/qsAeXanjvHUXsLFRHSNvsuY1MOV
	uGscOD4TTFgiAqd4OJteiDF5TxF+N/RLv9JwTcRooHaVc/txVjBw1j6hc3GpOij/pfO4AOZRVY+fo
	ASHmWUAogRGNns2GpdY3ptfPytdAFx1aHf4dnCE3CjXLi3zSIfwgJ+4lkZ2z9Coch9L5iVSPNQ2LQ
	Ci0NDlDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ4c-008v30-1U;
	Sun, 25 Jun 2023 23:23:14 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ4Y-008v2F-2p
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 23:23:12 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1acfce1fc0bso2862240fac.2
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jun 2023 16:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687735389; x=1690327389;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AHZdqIgV38Dl4IVDvIfee7UBYylQY10vL0Q6Aa5jWL0=;
        b=dpKa6t13dQW0n4GN8K//S6LKlbVy4fq7wlnsEBECd3FKpilwOPnZfhJMucu93EBdz6
         L9rQ1LLuLVGuC855AHgHYgFA18x/ybGKr8reLNAkLe0J3fBUqRg9ldzIx3IHZZCVlUfC
         3HzQDLU2YAQGbkMiKCJdX12CRPctBgcr7NbWrM9zW61VjDBKs9H6XxRUU8w3wmhrB0fL
         rXdZdIJ0GRMSN0Z79j4iYjGX8OqES4guR+hzKUghDo8ij2uU4d9WPzW08R18UEGgj+F7
         aHa4dz2gJbIxfnOyAIAD31pVWrmrBiEq/9pTYhNL4727t4bHG2VjrwBnt+VVdfyepQI3
         tkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687735389; x=1690327389;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHZdqIgV38Dl4IVDvIfee7UBYylQY10vL0Q6Aa5jWL0=;
        b=SQPBPsk69s6rxBQGHoNcquZUk7BT0/kqZa/XY9Y109U8cfB/ViuNCqfzTmSasWrjJc
         lXiXZm29LKKDaz/6M1WasRf1AEDpZnRXoefh8PxozxpWYQzlfQRUG7Ilz5IaB+c+DFCI
         6QOuZohKN3oCSis4FeA67DizGWDBlqkTW46mHPA/O1cT7kwpeL0ZDA+KFkN8LU/Caivw
         Eea0WLqJUs0jRPXFVYWCgbhfSzbEs6KYi81OEI/km/vEe1tCVu2mEGqCzSV6FmZDJMGg
         U2jq8tcIDlb/F9leKwpeohg4dv4xetNOODph7DjupuIvIQ0HBnfQMGrK8LJVPRSf5kh1
         xnkA==
X-Gm-Message-State: AC+VfDzuXTL+lQCEXcmMMY3ywpa67pofGPtw8VKlZeWRISXucVPlmHoO
	u5eKN7WQdd/qtHyqbix6/LQXASXV8T1yUKQrLp8=
X-Google-Smtp-Source: ACHHUZ4eYdwBGLwhdQ0iSzyfskAIbsLYvSjBAqluWE6PRg/zyNZzyVi4h8B8S3jhHKolcxwZREmqpA==
X-Received: by 2002:a05:6808:209b:b0:3a0:58f6:c424 with SMTP id s27-20020a056808209b00b003a058f6c424mr18145867oiw.26.1687735389324;
        Sun, 25 Jun 2023 16:23:09 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jx15-20020a17090b46cf00b00262e914169csm1245422pjb.12.2023.06.25.16.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 16:23:08 -0700 (PDT)
Date: Sun, 25 Jun 2023 16:23:08 -0700 (PDT)
X-Google-Original-Date: Sun, 25 Jun 2023 16:22:27 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Fix up some vector state related build failures
In-Reply-To: <20230620-bagging-swerve-07dbcea6adbc@wendy>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-535fe149-1ffe-4893-b68a-3222b0db1df9@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_162310_933009_EDBB27AC 
X-CRM114-Status: GOOD (  19.90  )
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

T24gVHVlLCAyMCBKdW4gMjAyMyAwMDozMzo1NyBQRFQgKC0wNzAwKSwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIE1vbiwgSnVuIDE5LCAyMDIzIGF0IDEwOjIxOjAxQU0gLTA3MDAsIFBhbG1lciBE
YWJiZWx0IHdyb3RlOgo+PiBJIGdldCBhIGZldyBidWlsZCBmYWlsdXJlcyBhbG9uZyB0aGUgbGlu
ZXMgb2YKPj4KPj4gLi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vc2lnY29udGV4dC5oOjE5
OjM2OiBlcnJvcjogZmllbGQg4oCYdl9zdGF0ZeKAmSBoYXMgaW5jb21wbGV0ZSB0eXBlCj4+ICAg
IDE5IHwgICAgICAgICBzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSB2X3N0YXRlOwo+PiAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fgo+PiAuL2FyY2gv
cmlzY3YvaW5jbHVkZS91YXBpL2FzbS9zaWdjb250ZXh0Lmg6MzI6NDk6IGVycm9yOiBmaWVsZCDi
gJhzY19leHRkZXNj4oCZIGhhcyBpbmNvbXBsZXRlIHR5cGUKPj4gICAgMzIgfCAgICAgICAgICAg
ICAgICAgc3RydWN0IF9fcmlzY3ZfZXh0cmFfZXh0X2hlYWRlciBzY19leHRkZXNjOwo+Pgo+PiBU
aGUgViBzdHJ1Y3R1cmVzIGluIHF1ZXN0aW9uIGFyZSBkZWZpbmVkIGZvciAhYXNzZW1ibHksIHNv
IGxldCdzIGp1c3QgZG8KPj4gc28gZm9yIHRoZSBvdGhlcnMuCj4+Cj4+IEZpeGVzOiA4ZWUwYjQx
ODk4ZmEgKCJyaXNjdjogc2lnbmFsOiBBZGQgc2lnY29udGV4dCBzYXZlL3Jlc3RvcmUgZm9yIHZl
Y3RvciIpCj4+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMu
Y29tPgo+Cj4gTm90IHRoZSBmaXJzdCB0aW1lIHlvdSd2ZSBjYXVnaHQgdGhpcyBzb3J0IG9mIHBy
b2JsZW0gaW4gaGVhZGVycywgaXMKPiB0aGVyZSBhIHBhcnRpY3VsYXIgYnVpbGQgdGhhdCBjYXRj
aGVzIHRoZXNlPwoKSSB0aGluayB3ZSdyZSBtaXNzaW5nIHNvbWUgc29ydCBvZiBkZXBlbmRlbmN5
IHNvbWV3aGVyZSwgdGhlc2UgCmFzc2VtYmx5LXJlbGF0ZWQgaXNzdWVzIHRlbmQgdG8gb25seSBz
aG93IHVwIG9uY2Ugd2hlbiBJJ20gZG9pbmcgZGlydHkgCmJ1aWxkcy4gIEknZCBndWVzcyBpdCdz
IGJlY2F1c2UgSSdtIGJvdW5jaW5nIGJldHdlZW4gdHJlZXMgYW5kIHN1Y2gsIG5vdCAKMTAwJSBz
dXJlIHRob3VnaC4KCj4KPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlA
bWljcm9jaGlwLmNvbT4KPgo+IENoZWVycywKPiBDb25vci4KPgo+PiAtLS0KPj4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9zaWdjb250ZXh0LmggfCA0ICsrKysKPj4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS91YXBpL2FzbS9zaWdjb250ZXh0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vc2ln
Y29udGV4dC5oCj4+IGluZGV4IDhiOGE4NTQxNjczYS4uOGM4NzEyYWE5NTUxIDEwMDY0NAo+PiAt
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vc2lnY29udGV4dC5oCj4+ICsrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9zaWdjb250ZXh0LmgKPj4gQEAgLTE1LDYgKzE1LDgg
QEAKPj4gIC8qIFRoZSBzaXplIG9mIEVORCBzaWduYWwgY29udGV4dCBoZWFkZXIuICovCj4+ICAj
ZGVmaW5lIEVORF9IRFJfU0laRQkweDAKPj4KPj4gKyNpZm5kZWYgX19BU1NFTUJMWV9fCj4+ICsK
Pj4gIHN0cnVjdCBfX3NjX3Jpc2N2X3Zfc3RhdGUgewo+PiAgCXN0cnVjdCBfX3Jpc2N2X3ZfZXh0
X3N0YXRlIHZfc3RhdGU7Cj4+ICB9IF9fYXR0cmlidXRlX18oKGFsaWduZWQoMTYpKSk7Cj4+IEBA
IC0zMyw0ICszNSw2IEBAIHN0cnVjdCBzaWdjb250ZXh0IHsKPj4gIAl9Owo+PiAgfTsKPj4KPj4g
KyNlbmRpZiAvKiFfX0FTU0VNQkxZX18qLwo+PiArCj4+ICAjZW5kaWYgLyogX1VBUElfQVNNX1JJ
U0NWX1NJR0NPTlRFWFRfSCAqLwo+PiAtLQo+PiAyLjQwLjEKPj4KPj4KPj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0Cj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
