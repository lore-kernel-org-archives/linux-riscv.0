Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9A6CD6E57
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 01:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLbeLn0vLQzeUMGUBuxcGpwMbxP4ad7E4r2jZGxzhRs=; b=BOVogmdlut61PU
	IBoprelx6XeNGimXd5keB9Ca00MCFbV+Oh+8moofgUxjAI4fDW7BKbU5KpibIBtSOVA9hJE1y8BOP
	QOKu558fmlaMxTNSQqMwRqBlNs3D2GnsArMva3/luCDueIAx8yUbYXpecNzYz3LQrXeUQIdSD3k9z
	iuAj+8e2eySDoysbYtccWLrazHsCepwAAPTZVkzj3oM+NkM9IVZQlIP9MKUzA91GhGod7YkmA5d0G
	uy02ng0ylKM4iduAL6rHUoFm7BK4XMIStaAb/0xMzyKjWGia/DfsXSWpQ72oNUO2MS3c+ZBDPzRP3
	vn+cw+w8jdy6DhJ+xgrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUxCj-0000000G0wr-1jnC;
	Thu, 04 Jun 2026 01:49:05 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUxCg-0000000G0vV-27HN
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 01:49:03 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-842307473b5so113574b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 18:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780537741; x=1781142541; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R9vTs/JHnHpc6BmzGsq91wlnVhg5cqc1lx/XeBVEZpQ=;
        b=L4XKFYKONzxQnpbJmaajbcoZwf2Mb1ccFOtp52+V8Ox4dNkaqq+iZOgJnRViqZn82F
         d7h2bvhnSeMQqeQSFRprqdf4VfAF2+gRj4UdVOMaVTR+pqc8Du4gGuA68ty634It7mu7
         Oi1vjIjvEceEnxmEqEmE34BPY6sOpRoV1CkYvgBzEUFsH0yXGQ3wL653VQaOoksfQ0C/
         jOWTA1gImpf9aRTI86kS4HGC2RXBAUIbV3MHsPR/7DwfhHdS8duI/wc/NRol5zcRUvIa
         j/TrOdlXC+Eu7Y2yYsx32BgGfmxtlk5VOo/T0iTW5Fia6SLD7oOt8DKWQPq+pN8M/UEE
         EJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780537741; x=1781142541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9vTs/JHnHpc6BmzGsq91wlnVhg5cqc1lx/XeBVEZpQ=;
        b=UUCjAD334Qo2sBtg5SJ4iaBIR5rt5Bil5CJiV6OK5WqXwMdi7mt6habH0fXXkY3tzi
         /SszcS/SazHbju+K893fA2Quz1h3X92nElbIwg2p7dV2Z3d3D54mEcxc0/SP8h64yaJi
         S1ZbkUT0JlxXaUtgA9uSyngnA+GNmTLAgv8xKuJrlETNH1Sd6A0XCT1Lj4Poo8UlH/NN
         ko+x5QPjbYRRQF/Q4ihc79oudFEcssy50XJG64dnEsqn6r7Rd2xFN9XwLNTJM3UEwi0f
         9SX+BW8zqYpDTSw/Flr+ayDUfnBG3h2km/f7+vuguUZfpLkMPCdlIjcFmQmSgNAqw9E6
         af2w==
X-Forwarded-Encrypted: i=1; AFNElJ8Uo8vpjv65Yq5fNzdOeza+ZzWwVbnNjJA8h0mfM8g7w39NSE7wEI81cMNcYaFRCcyXxI2rOPflXzRSeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCkWvwIV9P1NvGppQ3V8leMkjX97jLkvKGAf7NbL3TuIhbxIFv
	hzSatp+PQYt2OIaaEwzUrhVvZz4WXg1zlci/kQdflfkGzfKko7qDycBM
X-Gm-Gg: Acq92OHrGXsSzE7U0G3ecXaL2Bj2tUpSb64CN2PndYknzQ6MzuMfD8HpoTJFXGJlw3I
	7llElaGRm5bxL5Sn5XOMkaMsuXVQhmuIPaWls3SP2+pPCH31V1ak9jWmViELmyr37lNur34JLtu
	79m3vtWrzVSVcSMx07JGcwX/iLT/4FCZUgSYo29HIyZTQ0UB2v+dQEg46xAks1/15XV7M/0NMVc
	OUJ8klTMmioDIB63U5wa5Xv72c9rKFV3PRPRDeIyBVJ+YxpCvyT29nvjKmHQ42oSHn5ACZ3BqIh
	rrZIH/MojKMVq/msOVfZUdK/GMMJ3IUbdRUUZCwPl/qiAmKh0ad6s7KkCOt5gWsMxgz4JOzxBY+
	xF0q2qBniEQXWKA9bnF7pC0RB4+UUKjJLFfEkoP5JAxWAfwlQViRy2SeEi2Gqh7r530Lu0IoCJU
	9i+JzqhkofOTR2YShKVJs/ilIMMteMIUTTO97d/EVNkQ==
X-Received: by 2002:aa7:8882:0:b0:842:38d2:a35f with SMTP id d2e1a72fcca58-84284e8dc75mr6032800b3a.31.1780537741272;
        Wed, 03 Jun 2026 18:49:01 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282350f8csm4439444b3a.14.2026.06.03.18.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 18:49:00 -0700 (PDT)
Message-ID: <8e088395-c22d-4bc8-9e58-84235af1e56b@gmail.com>
Date: Thu, 4 Jun 2026 09:48:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] of: reserved_mem: avoid post-init UAF when
 alloc_reserved_mem_array() fails
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org,
 iommu@lists.linux.dev, zhaomeijing@lixiang.com, catalin.marinas@arm.com,
 will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, m.szyprowski@samsung.com, robin.murphy@arm.com,
 quic_obabatun@quicinc.com
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
 <20260527032917.3385849-4-chenwandun1@gmail.com>
 <20260602162450.GA442759-robh@kernel.org>
 <79932afc-2e91-4a54-aff9-f550be784c36@gmail.com>
 <CAL_JsqJOC1ko1Len3Dyc5SNKrHmhQn9uiDAkFfVbYa2wAfFUTg@mail.gmail.com>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <CAL_JsqJOC1ko1Len3Dyc5SNKrHmhQn9uiDAkFfVbYa2wAfFUTg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_184902_547893_70BF5052 
X-CRM114-Status: GOOD (  19.86  )
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

CgpPbiA2LzQvMjYgMDE6NDQsIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIFdlZCwgSnVuIDMsIDIw
MjYgYXQgMTo0NOKAr0FNIFdhbmR1biA8Y2hlbndhbmR1bjFAZ21haWwuY29tPiB3cm90ZToKPj4K
Pj4KPj4gT24gNi8zLzI2IDAwOjI0LCBSb2IgSGVycmluZyB3cm90ZToKPj4+IE9uIFdlZCwgTWF5
IDI3LCAyMDI2IGF0IDExOjI5OjA5QU0gKzA4MDAsIFdhbmR1biBDaGVuIHdyb3RlOgo+Pj4+IEZy
b206IFdhbmR1biBDaGVuIDxjaGVud2FuZHVuQGxpeGlhbmcuY29tPgo+Pj4+Cj4+Pj4gVGhlIGds
b2JhbCBwb2ludGVyICdyZXNlcnZlZF9tZW0nIGNvbnRpbnVlcyB0byByZWZlcmVuY2UgdGhlCj4+
Pj4gcmVzZXJ2ZWRfbWVtX2FycmF5IHdoaWNoIGxpdmVzIGluIF9faW5pdGRhdGEgaWYKPj4+PiBh
bGxvY19yZXNlcnZlZF9tZW1fYXJyYXkoKSBmYWlscy4gb2ZfcmVzZXJ2ZWRfbWVtX2xvb2t1cCgp
IGlzCj4+Pj4gZXhwb3J0ZWQgZm9yIHBvc3QtaW5pdCB1c2UsIHRoYXQgd291bGQgZGVyZWZlcmVu
Y2UgZnJlZWQgbWVtb3J5Cj4+Pj4gYW5kIHRyaWdnZXIgYSB1c2UtYWZ0ZXItZnJlZS4KPj4+Pgo+
Pj4+IFNvIHJlc2V0IHJlc2VydmVkX21lbV9jb3VudCB0byAwIHdoZW4gYWxsb2NfcmVzZXJ2ZWRf
bWVtX2FycmF5KCkKPj4+PiBmYWlscy4KPj4+Pgo+Pj4+IEZpeGVzOiAwMGM5YTQ1MmEyMzUgKCJv
ZjogcmVzZXJ2ZWRfbWVtOiBBZGQgY29kZSB0byBkeW5hbWljYWxseSBhbGxvY2F0ZSByZXNlcnZl
ZF9tZW0gYXJyYXkiKQo+Pj4gRml4ZXMgc2hvdWxkIGNvbWUgZmlyc3QgaW4gYSBzZXJpZXMuCj4+
IFVuZGVyc3Rvb2QsIHdpbGwgZG8gaW4gZnV0dXJlIHN1Ym1pc3Npb25zLgo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFdhbmR1biBDaGVuIDxjaGVud2FuZHVuQGxpeGlhbmcuY29tPgo+Pj4+IC0tLQo+Pj4+
ICAgIGRyaXZlcnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMgfCAyMCArKysrKysrKysrKysrKy0tLS0t
LQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMgYi9k
cml2ZXJzL29mL29mX3Jlc2VydmVkX21lbS5jCj4+Pj4gaW5kZXggMzEzY2JjNTdhYTQ1Li42ZDQ3
OTM4MWZmMWYgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9vZi9vZl9yZXNlcnZlZF9tZW0uYwo+
Pj4+ICsrKyBiL2RyaXZlcnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMKPj4+PiBAQCAtNjksMjkgKzY5
LDMxIEBAIHN0YXRpYyBpbnQgX19pbml0IGVhcmx5X2luaXRfZHRfYWxsb2NfcmVzZXJ2ZWRfbWVt
b3J5X2FyY2gocGh5c19hZGRyX3Qgc2l6ZSwKPj4+PiAgICAgKiB0aGUgaW5pdGlhbCBzdGF0aWMg
YXJyYXkgaXMgY29waWVkIG92ZXIgdG8gdGhpcyBuZXcgYXJyYXkgYW5kCj4+Pj4gICAgICogdGhl
IG5ldyBhcnJheSBpcyB1c2VkIGZyb20gdGhpcyBwb2ludCBvbi4KPj4+PiAgICAgKi8KPj4+PiAt
c3RhdGljIHZvaWQgX19pbml0IGFsbG9jX3Jlc2VydmVkX21lbV9hcnJheSh2b2lkKQo+Pj4+ICtz
dGF0aWMgYm9vbCBfX2luaXQgYWxsb2NfcmVzZXJ2ZWRfbWVtX2FycmF5KHZvaWQpCj4+Pj4gICAg
ewo+Pj4+ICAgICAgIHN0cnVjdCByZXNlcnZlZF9tZW0gKm5ld19hcnJheTsKPj4+PiAgICAgICBz
aXplX3QgYWxsb2Nfc2l6ZSwgY29weV9zaXplLCBtZW1zZXRfc2l6ZTsKPj4+Pgo+Pj4+ICsgICAg
aWYgKCF0b3RhbF9yZXNlcnZlZF9tZW1fY250KQo+Pj4+ICsgICAgICAgICAgICByZXR1cm4gdHJ1
ZTsKPj4+PiArCj4+Pj4gICAgICAgYWxsb2Nfc2l6ZSA9IGFycmF5X3NpemUodG90YWxfcmVzZXJ2
ZWRfbWVtX2NudCwgc2l6ZW9mKCpuZXdfYXJyYXkpKTsKPj4+PiAgICAgICBpZiAoYWxsb2Nfc2l6
ZSA9PSBTSVpFX01BWCkgewo+Pj4+ICAgICAgICAgICAgICAgcHJfZXJyKCJGYWlsZWQgdG8gYWxs
b2NhdGUgbWVtb3J5IGZvciByZXNlcnZlZF9tZW0gYXJyYXkgd2l0aCBlcnI6ICVkIiwgLUVPVkVS
RkxPVyk7Cj4+Pj4gLSAgICAgICAgICAgIHJldHVybjsKPj4+PiArICAgICAgICAgICAgZ290byBm
YWlsOwo+Pj4+ICAgICAgIH0KPj4+Pgo+Pj4+ICAgICAgIG5ld19hcnJheSA9IG1lbWJsb2NrX2Fs
bG9jKGFsbG9jX3NpemUsIFNNUF9DQUNIRV9CWVRFUyk7Cj4+Pj4gICAgICAgaWYgKCFuZXdfYXJy
YXkpIHsKPj4+PiAgICAgICAgICAgICAgIHByX2VycigiRmFpbGVkIHRvIGFsbG9jYXRlIG1lbW9y
eSBmb3IgcmVzZXJ2ZWRfbWVtIGFycmF5IHdpdGggZXJyOiAlZCIsIC1FTk9NRU0pOwo+Pj4+IC0g
ICAgICAgICAgICByZXR1cm47Cj4+Pj4gKyAgICAgICAgICAgIGdvdG8gZmFpbDsKPj4+PiAgICAg
ICB9Cj4+Pj4KPj4+PiAgICAgICBjb3B5X3NpemUgPSBhcnJheV9zaXplKHJlc2VydmVkX21lbV9j
b3VudCwgc2l6ZW9mKCpuZXdfYXJyYXkpKTsKPj4+PiAgICAgICBpZiAoY29weV9zaXplID09IFNJ
WkVfTUFYKSB7Cj4+Pj4gICAgICAgICAgICAgICBtZW1ibG9ja19mcmVlKG5ld19hcnJheSwgYWxs
b2Nfc2l6ZSk7Cj4+Pj4gLSAgICAgICAgICAgIHRvdGFsX3Jlc2VydmVkX21lbV9jbnQgPSBNQVhf
UkVTRVJWRURfUkVHSU9OUzsKPj4+PiAgICAgICAgICAgICAgIHByX2VycigiRmFpbGVkIHRvIGFs
bG9jYXRlIG1lbW9yeSBmb3IgcmVzZXJ2ZWRfbWVtIGFycmF5IHdpdGggZXJyOiAlZCIsIC1FT1ZF
UkZMT1cpOwo+Pj4gVGhlc2UgcHJpbnRzIGNvdWxkIGJlIG1vdmVkIHRvICdmYWlsJy4gUGVyaGFw
cyBpbnN0ZWFkIG9mIGp1c3QgcHJpbnRpbmcKPj4+IGFuIGVycm9yIHZhbHVlLCB5b3UgY2FuIHJl
dHVybiB0aGUgZXJyb3IgdmFsdWUgaW5zdGVhZCBvZiBib29sZWFuLgo+PiBXaWxsIGRvLCBjb25z
b2xpZGF0aW5nIHByX2VycigpIHVuZGVyICdmYWlsJyBhbmQgY2hhbmdpbmcgdGhlIHJldHVybiB0
eXBlCj4+IHRvIGludC4KPj4+IElmIHlvdSByZXNwaW4ganVzdCB0aGlzIHBhdGNoLCBJIGNhbiBw
aWNrIGl0IHVwIGZvciA3LjIuCj4+IEJlZm9yZSBJIHJlc3BpbiwgSSdkIGxpa2UgdG8gZmxhZyBh
IGRlcGVuZGVuY3k6Cj4+IHBhdGNoIDA1LzA3IGluIHRoaXMgc2VyaWVzIGJ1aWxkIG9uIHRoZSBz
aWduYXR1cmUgY2hhbmdlIGludHJvZHVjZWQgYnkgdGhpcwo+PiBwYXRjaCAoInRoZSB2b2lkIC0+
IGJvb2wgcmV0dXJuIHR5cGUgY2hhbmdlIG9mIGFsbG9jX3Jlc2VydmVkX21lbV9hcnJheSgpIikK
Pj4KPj4gQ291bGQgeW91IGxldCBtZSBrbm93IHdoaWNoIG9mIHRoZSBmb2xsb3dpbmcgeW91J2Qg
cHJlZmVyOgo+PiBhKSBUYWtlIHBhdGNoIDAzIGFsb25lIHZpYSB5b3VyIHRyZWUgYXMgeW91IHN1
Z2dlc3RlZCwgYWZ0ZXIgaXQgbGFuZHMsIEknbGwKPj4gICAgICByZXNwaW4gdGhlIHJlbWFpbmlu
ZyBwYXRjaGVzIG9mIHRoaXMgc2VyaWVzLgo+IEkgd291bGQgZ28gd2l0aCB0aGlzIG9wdGlvbi4g
QUlVSSwgdGhpcyBzZXJpZXMgaXNuJ3QgZ29pbmcgdG8gbGFuZCBpbgo+IDcuMiwgc28gdWx0aW1h
dGVseSB5b3Ugd2lsbCByZWJhc2Ugb24gdjcuMi1yYzEgd2hpY2ggd2lsbCBoYXZlIHRoZQo+IGZp
eC4KT0ssIHdpbGwgc2VuZCB2NC4KCkJlc3QgcmVnYXJkcywKV2FuZHVuCj4KPj4gYikgS2VlcCBw
YXRjaCAwMyBpbiB0aGUgdjQgcmVzcGluIG9mIHRoZSBmdWxsIHNlcmllcywgcmVvcmRlcmVkIHRv
IHRoZSBmcm9udAo+PiAgICAgIHBlciB5b3VyIGVhcmxpZXIgY29tbWVudC4KPgo+IFJvYgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
