Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D27EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 23:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=sTLvsWv97dNb4oh4LViYHIjADhpv5Ha794uChW4pw+8=; b=jcJmHx3DhRfymHirDCkS1iBwDN
	lfl0hl5gCpEZLgmxDs5xGUeXgHcrKoUHDEG5n6dKxFJz65wmzvTe4kVCiivg8CHSfRM9aWilaw+2H
	4yyKxUZFMaR+B7mokPgt24mytGNWq1gde1vvCVzQ8oUTFF1rwo9o92yjMv3sOJQKcv57RZQmFUnKB
	t6sq1qD3i06LwSFu/rGPHlWXJiGgAD6/KxvJAceYUGA8ppuqUwA9HkBjevF56jpGDTFJZ3+Lhxorl
	y1YHPmmCafjKENvo3BiMnfbq1hcn2MB/PPlfjn8rm2/EiD4aRTmssG0fCRynQpLFosz2Mq0oa0j4M
	QdwiMqwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEIEb-00ENwN-1e;
	Tue, 27 Jun 2023 23:36:33 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEIEX-00ENvT-0i
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 23:36:31 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-666eef03ebdso2981819b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 16:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687908987; x=1690500987;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2rRQjfAZRzBn1nTw9Qlx1rA3+sWwdfIHKIFqPq0xFE=;
        b=VmLbCzwx/HSoM66HuTJRlxp+eH3F/CACkgqayPBT7iQGdd9ftT4it4u3IXuZ45YA9y
         PlyzaOac4w1TOx6l2cS8MMY4pJU6lSiny/PNVXgY09O3tr7Hs9jv/0RLAncggAdz2U+e
         w6tDlJS2VEKVxucr7TKaE6ieRtzZy0ycZr+wtkHSU9bbEU9gxWIXF/tfCoyW7/c0DNHB
         2JP2eMlPEWwY8r0c7bIlGuiaVM1OBIVGxMkXKvoXkPKldhiN9vp57zcm73d75P4a0ic8
         T6jJkp/2jHnC8+MKCZjwWJ6xp/n4DIPBsxV9FKbM7yNklPqo6Mb2pXb5U8raJ06KDeez
         14lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687908987; x=1690500987;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2rRQjfAZRzBn1nTw9Qlx1rA3+sWwdfIHKIFqPq0xFE=;
        b=WoSMxVrUA0THqPkVi61ED8Qizp7twbq36/2Tv4pqFZTeGwKjuHcXXzqCEGXwIhJWAR
         q8C9V3k2ntx1J4CfuYK122xBPN61+mmaDpDX/Res2QNXPsBGyLS/zUrEycPoHN+mcKKb
         QlW5iRLbDWB8TQo5fyyl/kw80bKIG7UGWvcV/APQlD8JC+KiRUnwDjy/ZD2GiI+TikLE
         B4KgDl98Z+Minh7MP7JcAuZ40o3hMtARhplb4qOxXGjhbDFqijyKta5Yduw1lFe0kSfA
         bgU3cowmsTsGr83vnmn+rpOC4huU0vqZ5VXX1reZejTZOEnhbRTjEOfgMBypIrTx12+Z
         EIgA==
X-Gm-Message-State: AC+VfDxIh97neycra6E+dwLnlOLSfQqudGNF6XE/ov7slWALC43Z8mNS
	tetRHT9z00TtTeSfgoLVl9nxz6COhTS1dKOWDcM=
X-Google-Smtp-Source: ACHHUZ4ASNbeSGa3QRS2GbFuqbk5/0ZIWBTCzbjCARoIuFpZc5CiyZq3f2M3TQpRLYC3On5tc6h1kQ==
X-Received: by 2002:a05:6a00:2394:b0:668:73f5:dce0 with SMTP id f20-20020a056a00239400b0066873f5dce0mr22062433pfc.29.1687908987263;
        Tue, 27 Jun 2023 16:36:27 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id v1-20020a634641000000b00548fb73874asm6110698pgk.37.2023.06.27.16.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 16:36:26 -0700 (PDT)
Date: Tue, 27 Jun 2023 16:36:26 -0700 (PDT)
X-Google-Original-Date: Tue, 27 Jun 2023 16:36:24 PDT (-0700)
Subject: Re: [PATCH 1/2] RISC-V: mm: Restrict address space for sv39,sv48,sv57
In-Reply-To: <473F7474-D7AA-4C9F-95A3-320F1741EC50@jrtc27.com>
CC: charlie@rivosinc.com, alexghiti@rivosinc.com, Atish Patra <atishp@rivosinc.com>,
  Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Bjorn Topel <bjorn@rivosinc.com>, anup@brainfault.org, Evan Green <evan@rivosinc.com>,
  linux-riscv@lists.infradead.org, konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
  linux-kselftest@vger.kernel.org, linux-mm@kvack.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: jrtc27@jrtc27.com
Message-ID: <mhng-7914c1d2-d671-4cc4-ba90-f85acb7c8b50@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_163629_488681_0BDA3CA9 
X-CRM114-Status: GOOD (  27.17  )
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

T24gVHVlLCAyNyBKdW4gMjAyMyAxNTozMjozNiBQRFQgKC0wNzAwKSwganJ0YzI3QGpydGMyNy5j
b20gd3JvdGU6Cj4gT24gMjcgSnVuIDIwMjMsIGF0IDIzOjIxLCBDaGFybGllIEplbmtpbnMgPGNo
YXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPj4gCj4+IE1ha2Ugc3YzOSB0aGUgZGVmYXVsdCBh
ZGRyZXNzIHNwYWNlIGZvciBtbWFwIGFzIHNvbWUgYXBwbGljYXRpb25zCj4+IGN1cnJlbnRseSBk
ZXBlbmQgb24gdGhpcyBhc3N1bXB0aW9uLgo+Cj4gVGhleSBhcmUganVzdCBwbGFpbiB3cm9uZyB0
b28uIFN2NDggd2FzIGluIGV2ZW4gUHJpdiB2MS4xMCAodGhlIGZpcnN0Cj4gc3BlYyB3aGVyZSBz
YXRwIHdhcyBuYW1lZCBhcyBzdWNoIGFuZCBjb250YWluZWQgdGhlIG1vZGUsIHJhdGhlciB0aGFu
Cj4gcmVxdWlyaW5nIE0tbW9kZeKAmXMgaGVscCBpbiBjb25maWd1cmluZyB2aXJ0dWFsIG1lbW9y
eSksIHByZWRhdGluZyB0aGUKPiByYXRpZmllZCB2MS4xMSBzcGVjLiBBIDM5LWJpdCBhZGRyZXNz
IHNwYWNlIGlzIHBhdGhldGljIGFuZCBoYXMKPiBpbXBsaWNhdGlvbnMgZm9yIEFTTFIuCj4KPiBJ
IHN0cm9uZ2x5IHN1Z2dlc3QgYXBwbGljYXRpb25zIGJlIGZvcmNlZCB0byBzdXBwb3J0IGF0IGxl
YXN0IFN2NDgsCj4gd2hpY2ggaXMgdG90YWxseSByZWFzb25hYmxlIGdpdmVuIHRoZSBhZGRyZXNz
IHNwYWNlIHNpemVzIHVzZWQgYnkgb3RoZXIKPiBhcmNoaXRlY3R1cmVzLiBTdjU3IGlzIG1vcmUg
ZGlzcnVwdGl2ZSB0byBzb21lIHJ1bnRpbWVzLCB0aG91Z2ggaWRlYWxseQo+IGV2ZW4gdGhhdCB3
b3VsZCBiZSBmcmVlIGZvciB0aGUga2VybmVsIHRvIHVzZSByYXRoZXIgdGhhbiBjb21taXR0aW5n
IHRvCj4gbm90IHVzaW5nIGl0IGZvciB0aGUgZGVmYXVsdCB1QUJJLgoKR28gYW5kIE9wZW5KREsg
Ym90aCBicm9rZSB3aGVuIHdlIGV4cGFuZGVkIHRoZSBWQSB3aWR0aC4gIEkgZG9uJ3QgbGlrZSAK
aXQgZWl0aGVyLCBidXQgaWYgdGhlIGNoYW5nZSBicmVha3MgdXNlcnNwYWNlIHRoZW4gaXQncyBh
IHJlZ3Jlc3Npb24gYW5kIAp3ZSBoYXZlIHRvIGxpdmUgd2l0aCB0aGUgYnVnLgoKPiBKZXNzCj4K
Pj4gVGhlIFJJU0MtViBzcGVjaWZpY2F0aW9uIGVuZm9yY2VzCj4+IHRoYXQgYml0cyBvdXRzaWRl
IG9mIHRoZSB2aXJ0dWFsIGFkZHJlc3MgcmFuZ2UgYXJlIG5vdCB1c2VkLCBzbwo+PiByZXN0cmlj
dGluZyB0aGUgc2l6ZSBvZiB0aGUgZGVmYXVsdCBhZGRyZXNzIHNwYWNlIGFzIHN1Y2ggc2hvdWxk
IGJlCj4+IHRlbXBvcmFyeS4gQSBoaW50IGFkZHJlc3MgcGFzc2VkIHRvIG1tYXAgd2lsbCBjYXVz
ZSB0aGUgbGFyZ2VzdCBhZGRyZXNzCj4+IHNwYWNlIHRoYXQgZml0cyBlbnRpcmVseSBpbnRvIHRo
ZSBoaW50IHRvIGJlIHVzZWQuIElmIHRoZSBoaW50IGlzIGxlc3MKPj4gdGhhbiBvciBlcXVhbCB0
byAxPDwzOCwgYSAzOS1iaXQgYWRkcmVzcyB3aWxsIGJlIHVzZWQuIEFmdGVyIGFuIGFkZHJlc3MK
Pj4gc3BhY2UgaXMgY29tcGxldGVseSBmdWxsLCB0aGUgbmV4dCBzbWFsbGVzdCBhZGRyZXNzIHNw
YWNlIHdpbGwgYmUgdXNlZC4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8
Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4+IC0tLQo+PiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Vs
Zi5oICAgICAgIHwgIDIgKy0KPj4gYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICB8
IDEzICsrKysrKysrKy0KPj4gYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCB8IDQx
ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQo+PiAzIGZpbGVzIGNoYW5nZWQsIDQ3IGlu
c2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9lbGYuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZWxmLmgKPj4gaW5k
ZXggMzBlN2QyNDU1OTYwLi4xYjU3ZjEzYTFhZmQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vZWxmLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbGYuaAo+
PiBAQCAtNDksNyArNDksNyBAQCBleHRlcm4gYm9vbCBjb21wYXRfZWxmX2NoZWNrX2FyY2goRWxm
MzJfRWhkciAqaGRyKTsKPj4gICogdGhlIGxvYWRlci4gIFdlIG5lZWQgdG8gbWFrZSBzdXJlIHRo
YXQgaXQgaXMgb3V0IG9mIHRoZSB3YXkgb2YgdGhlIHByb2dyYW0KPj4gICogdGhhdCBpdCB3aWxs
ICJleGVjIiwgYW5kIHRoYXQgdGhlcmUgaXMgc3VmZmljaWVudCByb29tIGZvciB0aGUgYnJrLgo+
PiAgKi8KPj4gLSNkZWZpbmUgRUxGX0VUX0RZTl9CQVNFICgoVEFTS19TSVpFIC8gMykgKiAyKQo+
PiArI2RlZmluZSBFTEZfRVRfRFlOX0JBU0UgKChERUZBVUxUX01BUF9XSU5ET1cgLyAzKSAqIDIp
Cj4+IAo+PiAjaWZkZWYgQ09ORklHXzY0QklUCj4+ICNpZmRlZiBDT05GSUdfQ09NUEFUCj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+IGluZGV4IDc1OTcwZWUyYmRhMi4uZTgzOTEyZTk3ODcw
IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+PiArKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+PiBAQCAtNTcsMTggKzU3LDI5IEBA
Cj4+ICNkZWZpbmUgTU9EVUxFU19FTkQgKFBGTl9BTElHTigodW5zaWduZWQgbG9uZykmX3N0YXJ0
KSkKPj4gI2VuZGlmCj4+IAo+PiArCj4+IC8qCj4+ICAqIFJvdWdobHkgc2l6ZSB0aGUgdm1lbW1h
cCBzcGFjZSB0byBiZSBsYXJnZSBlbm91Z2ggdG8gZml0IGVub3VnaAo+PiAgKiBzdHJ1Y3QgcGFn
ZXMgdG8gbWFwIGhhbGYgdGhlIHZpcnR1YWwgYWRkcmVzcyBzcGFjZS4gVGhlbgo+PiAgKiBwb3Np
dGlvbiB2bWVtbWFwIGRpcmVjdGx5IGJlbG93IHRoZSBWTUFMTE9DIHJlZ2lvbi4KPj4gICovCj4+
ICNpZmRlZiBDT05GSUdfNjRCSVQKPj4gKyNkZWZpbmUgVkFfQklUU19TVjM5IDM5Cj4+ICsjZGVm
aW5lIFZBX0JJVFNfU1Y0OCA0OAo+PiArI2RlZmluZSBWQV9CSVRTX1NWNTcgNTcKPj4gKwo+PiAr
I2RlZmluZSBWQV9VU0VSX1NWMzkgKFVMKDEpIDw8IChWQV9CSVRTX1NWMzkgLSAxKSkKPj4gKyNk
ZWZpbmUgVkFfVVNFUl9TVjQ4IChVTCgxKSA8PCAoVkFfQklUU19TVjQ4IC0gMSkpCj4+ICsjZGVm
aW5lIFZBX1VTRVJfU1Y1NyAoVUwoMSkgPDwgKFZBX0JJVFNfU1Y1NyAtIDEpKQo+PiArCj4+ICNk
ZWZpbmUgVkFfQklUUyAocGd0YWJsZV9sNV9lbmFibGVkID8gXAo+PiAtIDU3IDogKHBndGFibGVf
bDRfZW5hYmxlZCA/IDQ4IDogMzkpKQo+PiArIFZBX0JJVFNfU1Y1NyA6IChwZ3RhYmxlX2w0X2Vu
YWJsZWQgPyBWQV9CSVRTX1NWNDggOiBWQV9CSVRTX1NWMzkpKQo+PiAjZWxzZQo+PiAjZGVmaW5l
IFZBX0JJVFMgMzIKPj4gI2VuZGlmCj4+IAo+PiArI2RlZmluZSBERUZBVUxUX1ZBX0JJVFMgKChW
QV9CSVRTID49IFZBX0JJVFNfU1YzOSkgPyBWQV9CSVRTX1NWMzkgOiBWQV9CSVRTKQo+PiArCj4+
ICNkZWZpbmUgVk1FTU1BUF9TSElGVCBcCj4+IChWQV9CSVRTIC0gUEFHRV9TSElGVCAtIDEgKyBT
VFJVQ1RfUEFHRV9NQVhfU0hJRlQpCj4+ICNkZWZpbmUgVk1FTU1BUF9TSVpFIEJJVChWTUVNTUFQ
X1NISUZUKQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3Iu
aCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPj4gaW5kZXggNmZiOGJiZWM4
NDU5Li4wMTlkY2Q0ZWNhZTQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cHJvY2Vzc29yLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+
PiBAQCAtMTIsMjAgKzEyLDQ3IEBACj4+IAo+PiAjaW5jbHVkZSA8YXNtL3B0cmFjZS5oPgo+PiAK
Pj4gLS8qCj4+IC0gKiBUaGlzIGRlY2lkZXMgd2hlcmUgdGhlIGtlcm5lbCB3aWxsIHNlYXJjaCBm
b3IgYSBmcmVlIGNodW5rIG9mIHZtCj4+IC0gKiBzcGFjZSBkdXJpbmcgbW1hcCdzLgo+PiAtICov
Cj4+IC0jZGVmaW5lIFRBU0tfVU5NQVBQRURfQkFTRSBQQUdFX0FMSUdOKFRBU0tfU0laRSAvIDMp
Cj4+IC0KPj4gLSNkZWZpbmUgU1RBQ0tfVE9QIFRBU0tfU0laRQo+PiAjaWZkZWYgQ09ORklHXzY0
QklUCj4+ICsjZGVmaW5lIERFRkFVTFRfTUFQX1dJTkRPVyAoVUwoMSkgPDwgKERFRkFVTFRfVkFf
QklUUyAtIDEpKQo+PiAjZGVmaW5lIFNUQUNLX1RPUF9NQVggVEFTS19TSVpFXzY0Cj4+ICsKPj4g
KyNkZWZpbmUgYXJjaF9nZXRfbW1hcF9lbmQoYWRkciwgbGVuLCBmbGFncykgXAo+PiArICgoYWRk
cikgPT0gMCB8fCAoYWRkcikgPj0gVkFfVVNFUl9TVjU3ID8gU1RBQ0tfVE9QX01BWCA6ICAgXAo+
PiArICgoKGFkZHIpID49IFZBX1VTRVJfU1Y0OCkgJiYgKFZBX0JJVFMgPj0gVkFfQklUU19TVjQ4
KSkgPyBcCj4+ICsgVkFfVVNFUl9TVjQ4IDogXAo+PiArIFZBX1VTRVJfU1YzOSkKPj4gKwo+PiAr
I2RlZmluZSBhcmNoX2dldF9tbWFwX2Jhc2UoYWRkciwgYmFzZSkgXAo+PiArICgoKGFkZHIgPj0g
VkFfVVNFUl9TVjU3KSAmJiAoVkFfQklUUyA+PSBWQV9CSVRTX1NWNTcpKSA/ICAgXAo+PiArIGJh
c2UgKyBTVEFDS19UT1BfTUFYIC0gREVGQVVMVF9NQVBfV0lORE9XIDogXAo+PiArICgoKGFkZHIp
ID49IFZBX1VTRVJfU1Y0OCkgJiYgKFZBX0JJVFMgPj0gVkFfQklUU19TVjQ4KSkgPyBcCj4+ICsg
YmFzZSArIFZBX1VTRVJfU1Y0OCAtIERFRkFVTFRfTUFQX1dJTkRPVyA6IFwKPj4gKyBiYXNlKQo+
PiArCj4+ICNlbHNlCj4+ICsjZGVmaW5lIERFRkFVTFRfTUFQX1dJTkRPVyBUQVNLX1NJWkUKPj4g
I2RlZmluZSBTVEFDS19UT1BfTUFYIFRBU0tfU0laRQo+PiArCj4+ICsjZGVmaW5lIGFyY2hfZ2V0
X21tYXBfZW5kKGFkZHIsIGxlbiwgZmxhZ3MpIFwKPj4gKyAoKGFkZHIpID4gREVGQVVMVF9NQVBf
V0lORE9XID8gU1RBQ0tfVE9QX01BWCA6IERFRkFVTFRfTUFQX1dJTkRPVykKPj4gKwo+PiArI2Rl
ZmluZSBhcmNoX2dldF9tbWFwX2Jhc2UoYWRkciwgYmFzZSkgXAo+PiArICgoYWRkciA+IERFRkFV
TFRfTUFQX1dJTkRPVykgPyBcCj4+ICsgYmFzZSArIFNUQUNLX1RPUF9NQVggLSBERUZBVUxUX01B
UF9XSU5ET1cgOiBcCj4+ICsgYmFzZSkKPj4gKwo+PiAjZW5kaWYKPj4gI2RlZmluZSBTVEFDS19B
TElHTiAxNgo+PiAKPj4gKwo+PiArI2RlZmluZSBTVEFDS19UT1AgREVGQVVMVF9NQVBfV0lORE9X
Cj4+ICsKPj4gKy8qCj4+ICsgKiBUaGlzIGRlY2lkZXMgd2hlcmUgdGhlIGtlcm5lbCB3aWxsIHNl
YXJjaCBmb3IgYSBmcmVlIGNodW5rIG9mIHZtCj4+ICsgKiBzcGFjZSBkdXJpbmcgbW1hcCdzLgo+
PiArICovCj4+ICsjZGVmaW5lIFRBU0tfVU5NQVBQRURfQkFTRSBQQUdFX0FMSUdOKERFRkFVTFRf
TUFQX1dJTkRPVyAvIDMpCj4+ICsKPj4gI2lmbmRlZiBfX0FTU0VNQkxZX18KPj4gCj4+IHN0cnVj
dCB0YXNrX3N0cnVjdDsKPj4gLS0gCj4+IDIuMzQuMQo+PiAKPj4gCj4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
