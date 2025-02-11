Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231D2C0219D
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 10:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kRsK4MWrjfo06shEWjQMX++EpQm4YHOhcYryxpMolGk=; b=2zGNn1jTWW3CSD
	+DeEjM9CO8LDlnxo9Fr24AbHV2EpBOpYEm3UbZaMjMqhOSn0w3g/4qUl8w7N0oyJRuRITRodSwBRd
	8m0UMYjWW/PTX5RHmQYYF5jOnwbTPuQsijgU3uARR/DWDufLnn0I6OkERH5AZbiq1yNPZjsdpVvpv
	iquVOe+bmkP9Yapss/9KGLSZitG8eQsgjKigTfI23Yes1FvobJ3O3op9fsb9q2lXCvEbALxgclhtt
	Pbupth/Rt3BINVqRGHauiUjwqSdz5QFujF8MnRMs4F4auVIOi8GDalfPoKyB5PpzTlcDYJBdvO++X
	d9kCHhrUkC1z/5fRlvXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnYD-00000003MG5-1pdw;
	Tue, 11 Feb 2025 10:31:33 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thnYB-00000003MEv-0dnl
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 10:31:32 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38de1a5f039so1443936f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 11 Feb 2025 02:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739269889; x=1739874689; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/a6P8MPGQ0avVAV5Cfpz5Ib9WVUVZW41mP8caOrUgAQ=;
        b=Z2aFDyubfGYISwkE7uRpAl9sKGOdDtE4C/ttCDmnRE++r1z4/4HXputaJJfvII03uu
         Ask+UN+ZDsSqP7CFqr15mAhbRVmni6deLC7V9/aEQiHjKaLyYRmE7F/nzYPdYxDg2zpB
         Pk8hl0sYQtc2Q8L58qg+5Tviw90PXblLaKJWiz499vIgdoo4+Qj7E0QZ8ZFo12SwWqG5
         CqtrmKGe9avNhlnW/a6OoTCn4Pd7o3W09wIutsRR5pAKlVdAFNLiN+NTGBdu7JqhC6ip
         objuxNOuuttba5FnmTSsB0J9o9BxCOapDc5hgn860PnOvXhAe3SdESSCefcpH5RG241+
         I+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739269889; x=1739874689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/a6P8MPGQ0avVAV5Cfpz5Ib9WVUVZW41mP8caOrUgAQ=;
        b=d6ZQIvQ1tz8plDJNazDceDfuJqKyUfeFVTFHvUkPZzB8iTJh+wUcwxSNXFTwxKIYBc
         F2p46yw7yz/4T4tkrlwWt51OAXZEvB1FSRCSdr4pTIdR9AKhklbvKCOjzJwoHSHAKgYe
         ppjMlHd0kuHrbxnboMFCCbUVq6/82mbKeUkuhzQDtkyGXGyAvRgtZ2J1vyihJWd51U2S
         iw6W6htRHy2sos/J6zy/s+tgXZD3XgQwXB8iz/FRP4Tkq0+/ISP0xqQdiwnXaYQwgOVl
         Q6bdiX42eWwAMY0M9W3LWcKJuOGqwlNawk2frgGFvEpsgdyJdjLujLcf3ZzT53CkehJ3
         tpPg==
X-Forwarded-Encrypted: i=1; AJvYcCWiJ7E2pXGrV+Bu6k9eTuf0pSafw0FHRgc+JqctQ4cvddeU+bTk78YIGLsfPDoFNIoDzJrdgF+CjKU+zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwV8859Z8EGmrsuu/oca3B4uci2rbdwRhinqw46XM8iY7iO/mlz
	apq6cNUpYxA7X2rOJ8+gd2rQOTcSz1n4/JHYDWbcOQek/px1VnmMzacxoD4vrwc=
X-Gm-Gg: ASbGncuTAdKbz3uH7TYNJexdYrijRfN/acy1dqrKASyW+zLoBN8fo78XtLqHZFB8PJ8
	BNcaZkWnNHnZknYTWC8b87hCF2vhEJ9GOYnL1Bj7TAJKB6Wpa6e5Y7Q1hbpmGb6VStUOrSIoMoI
	0jOyLno9OqhHWFbK/07E1zMrlSRfkr2HOToYemFKjBWQIqSkhOw8UcKVx2rThIN+CRTJ97qczbX
	w2tUb8/5/150QKkSCgpgCKygfClBG9yGhHE9bu7U1fZcYuflVEAcRXQLFkrNmYL7BaW9StAeBJf
	jzzbMlo744xy1Yirnyd6TRflvbB0e2pXwGmqN1W5HWP3gOtQL9GWDq9wsTiC
X-Google-Smtp-Source: AGHT+IGrgjPSoOFkF4U85XDHHGJCIZJGQtRmyI8bFutmDHy81O7VBQ3XMYuog+hqAiQegwH4kGE9Dg==
X-Received: by 2002:a5d:588f:0:b0:38d:d613:9bb1 with SMTP id ffacd0b85a97d-38dd6139eacmr6656232f8f.12.1739269889329;
        Tue, 11 Feb 2025 02:31:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc3a10fffsm13606012f8f.12.2025.02.11.02.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 02:31:28 -0800 (PST)
Message-ID: <a8af5d3a-e739-4f65-9e2d-d92978be9a3d@rivosinc.com>
Date: Tue, 11 Feb 2025 11:31:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] RISC-V: KVM: add support for FWFT SBI extension
To: Deepak Gupta <debug@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
 <20250210213549.1867704-15-cleger@rivosinc.com>
 <Z6rjkk5JlMlqbl2j@debug.ba.rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <Z6rjkk5JlMlqbl2j@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_023131_182683_C053FA79 
X-CRM114-Status: GOOD (  18.32  )
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

CgpPbiAxMS8wMi8yMDI1IDA2OjQzLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4+ICtzdGF0aWMgaW50
IGt2bV9zYmlfZndmdF9nZXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nCj4+
IGZlYXR1cmUsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9u
ZyAqdmFsdWUpCj4+ICt7Cj4+ICvCoMKgwqAgaW50IHJldDsKPj4gK8KgwqDCoCBzdHJ1Y3Qga3Zt
X3NiaV9md2Z0X2NvbmZpZyAqY29uZjsKPj4gKwo+PiArwqDCoMKgIHJldCA9IGt2bV9md2Z0X2dl
dF9mZWF0dXJlKHZjcHUsIGZlYXR1cmUsICZjb25mKTsKPj4gK8KgwqDCoCBpZiAocmV0KQo+PiAr
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gKwo+PiArwqDCoMKgIHJldHVybiBjb25mLT5m
ZWF0dXJlLT5nZXQodmNwdSwgY29uZiwgdmFsdWUpOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW50
IGt2bV9zYmlfZXh0X2Z3ZnRfaGFuZGxlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdAo+
PiBrdm1fcnVuICpydW4sCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX3JldHVybiAqcmV0ZGF0YSkKPj4gK3sKPj4gK8KgwqDCoCBp
bnQgcmV0ID0gMDsKPj4gK8KgwqDCoCBzdHJ1Y3Qga3ZtX2NwdV9jb250ZXh0ICpjcCA9ICZ2Y3B1
LT5hcmNoLmd1ZXN0X2NvbnRleHQ7Cj4+ICvCoMKgwqAgdW5zaWduZWQgbG9uZyBmdW5jaWQgPSBj
cC0+YTY7Cj4+ICsKPj4gK8KgwqDCoCBzd2l0Y2ggKGZ1bmNpZCkgewo+PiArwqDCoMKgIGNhc2Ug
U0JJX0VYVF9GV0ZUX1NFVDoKPj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IGt2bV9zYmlfZndmdF9z
ZXQodmNwdSwgY3AtPmEwLCBjcC0+YTEsIGNwLT5hMik7Cj4+ICvCoMKgwqDCoMKgwqDCoCBicmVh
azsKPj4gK8KgwqDCoCBjYXNlIFNCSV9FWFRfRldGVF9HRVQ6Cj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZXQgPSBrdm1fc2JpX2Z3ZnRfZ2V0KHZjcHUsIGNwLT5hMCwgJnJldGRhdGEtPm91dF92YWwpOwo+
PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICvCoMKgwqAgZGVmYXVsdDoKPj4gK8KgwqDCoMKg
wqDCoMKgIHJldCA9IFNCSV9FUlJfTk9UX1NVUFBPUlRFRDsKPj4gK8KgwqDCoMKgwqDCoMKgIGJy
ZWFrOwo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIHJldGRhdGEtPmVycl92YWwgPSByZXQ7
Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gMDsKPj4gK30KPj4gKwo+PiArc3RhdGljIGludCBrdm1f
c2JpX2V4dF9md2Z0X2luaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+PiArewo+PiArwqDCoMKg
IHN0cnVjdCBrdm1fc2JpX2Z3ZnQgKmZ3ZnQgPSB2Y3B1X3RvX2Z3ZnQodmNwdSk7Cj4+ICvCoMKg
wqAgY29uc3Qgc3RydWN0IGt2bV9zYmlfZndmdF9mZWF0dXJlICpmZWF0dXJlOwo+PiArwqDCoMKg
IHN0cnVjdCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mOwo+PiArwqDCoMKgIGludCBpOwo+PiAr
Cj4+ICvCoMKgwqAgZndmdC0+Y29uZmlncyA9IGtjYWxsb2MoQVJSQVlfU0laRShmZWF0dXJlcyks
IHNpemVvZihzdHJ1Y3QKPj4ga3ZtX3NiaV9md2Z0X2NvbmZpZyksCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgR0ZQX0tFUk5FTCk7Cj4gbml0Ogo+IAo+IEkgdW5kZXJzdGFuZCB0
aGF0IGluIG5leHQgcGF0Y2ggeW91IGdyb3cgdGhlIHN0YXRpYyBhcnJheWBmZWF0dXJlc2AuIEJ1
dAo+IGluIHRoaXMgcGF0Y2gKPiBgQVJSQVlfU0laRShmZWF0dXJlcylgIGV2YWx1YXRlcyB0byAw
LCB0aHVzIGtjYWxsb2Mgd2lsbCBiZSByZXR1cm5pbmcgYQo+IHBvaW50ZXIKPiB0byBzb21lIHNs
YWIgYmxvY2sgKElJUkMsIGtjYWxsb2Mgd2lsbCBub3QgcmV0dXJuIE5VTEwgaWYgc2l6ZQo+IGV2
ZW50dWFsbHkgZXZhbHMgdG8gMCkKPiAKPiBUaGlzIHByb2JhYmx5IHdvbid0IHJlc3VsdCBpbiBz
b21lIGJhZCBzdHVmZi4gQnV0IHN0aWxsIHRoZXJlIGlzIGEKPiBwb2ludGVyIGluCj4gZndmdC0+
Y29uZmlncyB3aGljaCBpcyBwb2ludGluZyB0byBzb21lIHJhbmRvbSBzdHVmZiBpZiBgZmVhdHVy
ZXNgIHR1cm5zCj4gb3V0IHRvIGJlCj4gZW1wdHkuCj4gCj4gTGV0IG1lIGtub3cgaWYgSSBnb3Qg
dGhhdCByaWdodCBvciBtaXNzaW5nIHNvbWV0aGluZy4KClNvIEkgYWN0dWFsbHkgc2VhcmNoZWQg
aW50byB0aGUga21hbGxvYyBjb2RlIHRvIHNlZSB3aGF0IGhhcG9wZW5zIHdpdGggYQp6ZXJvIHNp
emUgYWxsb2NhdGlvbiBhbmQgaXQgYWN0dWFsbHkgcmV0dXJuIFpFUk9fU0laRV9QVFI6CgovKgog
KiBaRVJPX1NJWkVfUFRSIHdpbGwgYmUgcmV0dXJuZWQgZm9yIHplcm8gc2l6ZWQga21hbGxvYyBy
ZXF1ZXN0cy4KICoKICogRGVyZWZlcmVuY2luZyBaRVJPX1NJWkVfUFRSIHdpbGwgbGVhZCB0byBh
IGRpc3RpbmN0IGFjY2VzcyBmYXVsdC4KICoKICogWkVST19TSVpFX1BUUiBjYW4gYmUgcGFzc2Vk
IHRvIGtmcmVlIHRob3VnaCBpbiB0aGUgc2FtZSB3YXkgdGhhdCBOVUxMCmNhbi4KICogQm90aCBt
YWtlIGtmcmVlIGEgbm8tb3AuCiAqLwoKV2hpY2ggc2VlbXMgbGlrZSBpdCdzIG5vdCByZWFsbHkg
cmFuZG9tIGFuZCB3aWxsIGZhdWx0IGlmIGFjY2Vzc2VkLiBJCnRoaW5rIHRoYXQncyBlbm91Z2gg
Zm9yIHRoYXQgY29tbWl0ICh3aGljaCB3aWxsIGJlIGJpc2VjdGFibGUgaWYgbmVlZGVkCnRoZW4p
LgoKQ2zDqW1lbnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
