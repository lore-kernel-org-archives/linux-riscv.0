Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08785D2A538
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 17:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzsFQdRX14Pcp/2vdAl0ozO3PRX12UrZudx5gj47ksw=; b=akjCT4foWCTmqI
	VEnb0bR4kuL81+d6S53TR3/PZ9yfRUX8IrXgkS0oxn8/KN8KxEQKCt2x2aQ9B9o9ZZIhPu8+BR18K
	F6WovGiP/ea1Ennq9ZOMHME6u4TjB70dexBc3T1bR97QR8e4o+7LG4npWa8SVZmqRwyjhTBzwE4yx
	MifYUoNAFJHAb6gICfmmJyc9XBR6Nwg51RLVrBCtE5cfC7SlQEh0zk5q3FkKAJyFZnBwQpf2nxzZs
	ZNFH9M+T07D1K9kKrMs7o9p4z+rnVS4pFczp0BNtdHsYRgqw+7ugUDGYaadQFo3G3LU8DzfKDKNDH
	aR2aeLfYYMSFMxMFUYtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t18Gd-0000000CcI2-43gy;
	Wed, 16 Oct 2024 17:57:03 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t18Ga-0000000CcHi-2SwW
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 17:57:02 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-207115e3056so635785ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 10:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729101420; x=1729706220; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZWGjvGxfX8EEAliHKilZCZ2TS/WFRhd2LTCSNsE6xI=;
        b=O0IFFo/0JvmMLc9yzShfP+yTtbD4ddLlB8fNmtHYksE/rdQBQDz4/F25/Bkrf5qPmi
         71H6H81hYDkBKTYokt+xAU3V88a2yeZqQlRkwuHqWeGL6ZSgJaCuV3Ik2TiHUyynLBhr
         9U0g4H+2OPyO1jxs8tZt+VZeZsrdcd+lfoNPW75EF6OaNwOalqtLfR2PIBPP0Mt11W8D
         Fnt99HanG18LQIPESrUEemR4XX1oI9+CXVXQLPQVqCluFvl85RnVeNmdd2mDNAJqOpbf
         SwSjJ+4rnXI91B66UDB8JbW+xqBWPMoj9vq/IP8SFzfeHc1bBuFcKO4fASBC+yR3Nvuk
         fnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729101420; x=1729706220;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZWGjvGxfX8EEAliHKilZCZ2TS/WFRhd2LTCSNsE6xI=;
        b=PHjAxs2SpvXvGxcPdBzdgryKFblsaXH7BoDpu0qaZt7uJBkhHfSIG4k9U670DVE4GT
         8367p+asF9stzsdEEjEniVOTlmlMXQhVcynWVTDMS3Ij1QHuxsKMNo5qXZ9KlXVhnsXz
         XeHYwLM2KAJBXS2v3S7OXdse/oKSsDADHu0+Mj0Qcg3ueIk5Sr0e5dFFmcZ1Y0rNK22L
         bQlY6QHrw+itCEGccOJUAcunv9izoLqjosJgIFPGS7a0ZUIy/icNkHTlsTyVyfEDy/S4
         W2s8KXEdsv0PbCxlyCha4zKtjavphPosxY/6Wct7Du0XudWnKcTaIDSjz2KKjVuoitc5
         lT1g==
X-Forwarded-Encrypted: i=1; AJvYcCV/tIY6Saxwu3I5VEOM8BEjTk22HZY2f5Xv6y44YHS9/TzbwYZHD1JS57LBhlvU4p6CiXmbRZ8XmEf/Gw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5R9B8brapODQIRRd4jFAgBPCumDIJW60s+IaAqV/s4WSM6ALR
	yPUS8Ld6MGr/hkql4sPKEBv72Szmmupoj3R1Q2QO6VxB0gTcfNjV
X-Google-Smtp-Source: AGHT+IFNGTY1Y7m+BkDSa9oA7wwuSFo3SqxArhkrrEGWefeZEweHFiqP/GUnA1YN3djsQQrFlYqoag==
X-Received: by 2002:a17:903:124b:b0:20c:e1f5:48c7 with SMTP id d9443c01a7336-20d27f2faf7mr57971925ad.55.1729101419457;
        Wed, 16 Oct 2024 10:56:59 -0700 (PDT)
Received: from [127.0.0.1] ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f994c5sm31660585ad.71.2024.10.16.10.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 10:56:58 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <1a481785-a874-4b13-8f1d-f7a1f233da50@gmail.com>
Date: Thu, 17 Oct 2024 01:56:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] riscv/entry: issue about a0/orig_a0 register and ENOSYS
Content-Language: en-GB-large
To: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Oleg Nesterov <oleg@redhat.com>, "Dmitry V. Levin" <ldv@strace.io>
Cc: Andrea Bolognani <abologna@redhat.com>, WANG Xuerui <git@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
 Yao Zi <ziyao@disroot.org>, Yangyu Chen <cyy@cyyself.name>,
 Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 rsworktech@outlook.com
References: <59505464-c84a-403d-972f-d4b2055eeaac@gmail.com>
 <6b2ff48a-ab43-4866-af5a-b8b7d3c23582@ghiti.fr>
 <6b744fa3-5c1d-460d-bb09-5bc48379d598@gmail.com>
 <7375212b-2e40-4f39-a1ca-291c0975b529@ghiti.fr>
 <707db338-4429-49a6-bcab-39ab44c4f770@gmail.com>
In-Reply-To: <707db338-4429-49a6-bcab-39ab44c4f770@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_105700_653814_77B7A576 
X-CRM114-Status: GOOD (  32.14  )
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

T24gMjAyNC0xMC0xNiAyMTowNywgQ2VsZXN0ZSBMaXUgd3JvdGU6Cgo+IAo+IE9uIDIwMjQtMTAt
MTYgMjA6NTYsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4gT24gMTYvMTAvMjAyNCAxNDoyMywg
Q2VsZXN0ZSBMaXUgd3JvdGU6Cj4+PiBPbiAyMDI0LTEwLTE2IDIwOjAwLCBBbGV4YW5kcmUgR2hp
dGkgd3JvdGU6Cj4+Pj4gSGkgQ2VsZXN0ZSwKPj4+Pgo+Pj4+IFRoYW5rIHlvdSBmb3IgbG9va2lu
ZyBpbnRvIHRoaXMgYW5kIHJlYWxseSBzb3JyeSBhYm91dCB0aGUgbGF0ZSByZXNwb25zZS4KPj4+
Pgo+Pj4+IE9uIDE3LzA5LzIwMjQgMDY6MDksIENlbGVzdGUgTGl1IHdyb3RlOgo+Pj4+PiBCZWZv
cmUgUFRSQUNFX0dFVF9TWVNDQUxMX0lORk8gd2FzIGltcGxlbWVudGVkIGluIHY1LjMsIHRoZSBv
bmx5IHdheSB0bwo+Pj4+PiBnZXQgc3lzY2FsbCBhcmd1bWVudHMgd2FzIHRvIGdldCB1c2VyX3Jl
Z3Nfc3RydWN0IHZpYSBQVFJBQ0VfR0VUUkVHU0VULgo+Pj4+PiBPbiBzb21lIGFyY2hpdGVjdHVy
ZXMgd2hlcmUgYSByZWdpc3RlciBpcyB1c2VkIGFzIGJvdGggdGhlIGZpcnN0Cj4+Pj4+IGFyZ3Vt
ZW50IGFuZCB0aGUgcmV0dXJuIHZhbHVlIGFuZCB0aHVzIHdpbGwgYmUgY2hhbmdlZCBhdCBzb21l
IHN0YWdlIG9mCj4+Pj4+IHRoZSBzeXNjYWxsIHByb2Nlc3MsIHNvbWV0aGluZyBsaWtlIG9yaWdf
YTAgaXMgcHJvdmlkZWQgdG8gc2F2ZSB0aGUKPj4+Pj4gb3JpZ2luYWwgYXJndW1lbnQgcmVnaXN0
ZXIgdmFsdWUuIEJ1dCBSSVNDLVYgZG9lc24ndCBleHBvcnQgb3JpZ19hMCBpbgo+Pj4+PiB1c2Vy
X3JlZ3Nfc3RydWN0IChUaGlzIEFCSSB3YXMgZGVzaWduZWQgYXQgZTJjMGNkZmJhN2Y2ICgiUklT
Qy1WOgo+Pj4+PiBVc2VyLWZhY2luZyBBUEkiKS4pIHNvIHVzZXJzcGFjZSBhcHBsaWNhdGlvbiBs
aWtlIHN0cmFjZSB3aWxsIGdldCB0aGUKPj4+Pj4gcmlnaHQgb3Igd3JvbmcgcmVzdWx0IGRlcGVu
ZHMgb24gdGhlIG9wZXJhdGlvbiBvcmRlciBpbiBkb190cmFwX2VjYWxsX3UoKQo+Pj4+PiBmdW5j
dGlvbi4KPj4+Pj4KPj4+Pj4gVGhpcyByZXF1aXJlcyB3ZSBwdXQgdGhlIEVOT1NZUyBwcm9jZXNz
IGFmdGVyIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKQo+Pj4+PiBvciBzeXNjYWxsX2hh
bmRsZXIoKVsxXS4gVW5mb3J0dW5hdGVseSwgdGhlIGdlbmVyaWMgZW50cnkgQVBJCj4+Pj4+IHN5
c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKSByZXF1aXJlcyB3ZQo+Pj4+Pgo+Pj4+PiAqwqAg
cHJvY2VzcyBFTk9TWVMgYmVmb3JlIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKQo+Pj4+
Cj4+Pj4gV2hlcmUgZG9lcyB0aGlzIHJlcXVpcmVtZW50IGNvbWUgZnJvbT8KPj4+Pgo+Pj4+Cj4+
Pj4+ICrCoCBvciBvbmx5IHNldCBhMCB0byBFTk9TWVMgd2hlbiB0aGUgcmV0dXJuIHZhbHVlIG9m
Cj4+Pj4+IMKgwqDCoMKgIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKSAhPSAtMQo+Pj4+
Pgo+Pj4+PiBBZ2FpbiwgaWYgd2UgY2hvb3NlIHRoZSBsYXR0ZXIgd2F5IHRvIGF2b2lkIGNvbmZs
aWN0IHdpdGggdGhlIGZpcnN0Cj4+Pj4+IGlzc3VlLCB3ZSB3aWxsIG1lZXQgdGhlIHRoaXJkIHBy
b2JsZW06IHN0cmFjZSBkZXBlbmRzIG9uIHRoYXQga2VybmVsCj4+Pj4+IHdpbGwgcmV0dXJuIEVO
T1NZUyB3aGVuIHN5c2NhbGwgbnIgaXMgLTEgdG8gaW1wbGVtZW50IHRoZWlyIHN5c2NhbGwKPj4+
Pj4gdGFtcGVyaW5nIGZlYXR1cmVbMl0uCj4+Pj4KPj4+PiBJSVVDLCBzZWNjb21wIGFuZCBvdGhl
cnMgaW4gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSgpIGNvdWxkIHJldHVybiAtMSBhbmQg
dGhlbiB3ZSBjb3VsZCBub3QgZGlmZmVyZW50aWF0ZSB3aXRoIHRoZSBzeXNjYWxsIG51bWJlciBi
ZWluZyAtMS4KPj4+Pgo+Pj4+IEJ1dCBjb3VsZCB3ZSBpbWFnaW5lLCB0byBkaXN0aW5ndWlzaCBi
ZXR3ZWVuIGFuIGVycm9yIGFuZCB0aGUgc3lzY2FsbCBudW1iZXIgYmVpbmcgLTEsIGNoZWNraW5n
IGFnYWluIHRoZSBzeXNjYWxsIG51bWJlciBhZnRlciB3ZSBjYWxsIHN5c2NhbGxfZW50ZXJfZnJv
bV91c2VyX21vZGUoKT8gSWYgdGhlIHN5c2NhbGwgbnVtYmVyIGlzIC0xLCB0aGVuIHdlIHNldCBF
Tk9TWVMgb3RoZXJ3aXNlIHdlIGRvbid0IGRvIGFueXRoaW5nIChhIGJpdCBsaWtlIHdoYXQgeW91
IGRpZCBpbiA1MjQ0OWMxN2JkZDEgKCJyaXNjdjogZW50cnk6IHNldCBhMCA9IC1FTk9TWVMgb25s
eSB3aGVuIHN5c2NhbGwgIT0gLTEiKSkuCj4+Pj4KPj4+PiBMZXQgbWUga25vdyBpZiBJIGNvbXBs
ZXRlbHkgbWlzdW5kZXJzdG9vZCBoZXJlIQo+Pj4gWWVhaC4gSSBmb3VuZCB0aGlzIGEgYml0IGxh
dGVyIGFmdGVyIEkgcG9zdCB0aGlzIFJGQy4gSSBpbmNsdWRlIGl0IGluIGEgdXBkYXRlIHJlcGx5
LAo+Pj4gY29weSBoZXJlIGFzIHdlbGw6Cj4+Pgo+Pj4+IEJ1dCBmcm9tIGFub3RoZXIgYW5nbGUs
IHN5c2NhbGwgbnVtYmVyIGlzIGluIGE3IHJlZ2lzdGVyLCBzbyB3ZSBjYW4gY2FsbCB0aGUKPj4+
PiBnZXRfc3lzY2FsbF9ucigpIGFmdGVyIGNhbGxpbmcgdGhlIHN5c2NhbGxfZW50ZXJfZnJvbV91
c2VyX21vZGUoKSB0byBieXBhc3MgdGhlCj4+Pj4gaW5mb3JtYXRpb24gbG9zdCBvZiB0aGUgcmV0
dXJuIHZhbHVlIG9mIHRoZSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkuIEJ1dAo+Pj4+
IGluIHRoaXMgd2F5LCB0aGUgc3lzY2FsbCBudW1iZXIgaW4gdGhlIHN5c2NhbGxfZW50ZXJfZnJv
bV91c2VyX21vZGUoKSByZXR1cm4KPj4+PiB2YWx1ZSBpcyB1c2VsZXNzLCBhbmQgd2UgY2FuIHJl
bW92ZSBpdCBkaXJlY3RseS4KPj4+IFNvIGlmIHdlIGdldCBzeXNjYWxsIG51bWJlciBmcm9tIGE3
IHJlZ2lzdGVyIGFnYWluLCB0aGUgc3lzY2FsbCBudW1iZXIgcGFydCBvZgo+Pj4gdGhlIHJldHVy
biB2YWx1ZSBvZiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkgaXMgdXNlbGVzcyBjb21w
bGV0ZWx5Lgo+Pj4gSSB0aGluayBpdCdzIGJldHRlciB0byBkcm9wIGl0IHNvIHRoZSBsYXRlciBu
ZXcgYXJjaGl0ZWN0dXJlIGRldmVsb3BlciB3aWxsIG5vdAo+Pj4gcnVuIGludG8gdGhlIHNhbWUg
aXNzdWUuIChBY3R1YWxseSwgdGhlIHN5c2NhbGwgbnVtYmVyIHJldHVybmVkIGJ5Cj4+PiBzeXNj
YWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkgaXMgYWxzbyB0aGUgcmVzdWx0IG9mIGdldF9zeXNj
YWxsX25yKCkgYXQgdGhlIGVuZAo+Pj4gb2YgaXQuKSBCdXQgaXQgd2lsbCBhZmZlY3Qgb3RoZXIg
YXJjaGl0ZWN0dXJlJ3MgY29kZSBzbyBJIHRoaW5rIHRoZXJlIHN0aWxsIG5lZWQKPj4+IHNvbWUg
ZGlzY3Vzc2lvbnMuCj4+Pgo+Pj4gT3IgaWYgeW91IHRoaW5rIGl0J3MgYmV0dGVyIHRvIHBvc3Qg
YSBwYXRjaCBhbmQgdGhlbiBkaXNjdXNzIGluIHBhdGNoIHRocmVhZAo+Pj4gZGlyZWN0bHksIEkn
bSBnbGFkIHRvIGRvIHRoaXMuCj4+Cj4+Cj4+IEdyZWF0IHRoYXQgd2UgaGF2ZSBhIHNvbHV0aW9u
IHRoYXQgZG9lcyBub3QgbmVlZCB0byBjaGFuZ2UgdGhlIEFCSSA6KQo+Pgo+PiBJIHRoaW5rIHdl
IHNob3VsZCBzdGFydCBieSBpbXBsZW1lbnRpbmcgYSBmaXggZm9yIHJpc2N2IG9ubHkgdGhhdCBp
bXBsZW1lbnRzIHRoZSBnZXRfc3lzY2FsbF9ucigpIGFmdGVyIHN5c2NhbGxfZW50ZXJfZnJvbV91
c2VyX21vZGUoKSBzbyB0aGF0IHdlIGNhbiBtZXJnZSB0aGF0IGluIDYuMTItcmNYLgo+Pgo+PiBB
bmQgYWZ0ZXIgdGhhdCwgeW91IGNvdWxkIGNvbWUgd2l0aCB0aGUgbmljZXIgc29sdXRpb24geW91
IHByb3Bvc2UuCj4+Cj4+IERvIHlvdSB0aGluayB5b3UgY2FuIHNlbmQgYSBwYXRjaCBmb3IgdGhl
IHF1aWNrIGZpeCBzb29uPyBJbiB0aGUgbWVhbnRpbWUsIEknbSBhZGRpbmcgdGhlIHN0cmFjZSB0
ZXN0c3VpdGUgdG8gbXkgQ0kgdG8gbWFrZSBzdXJlIGl0IHdvcmtzIGFuZCB3ZSBkb24ndCBicmVh
ayBpdCBhZ2FpbiA6KQo+IAo+IE9rLiBJIHdpbGwgc2VuZCBwYXRjaCBzb29uLgoKUGF0Y2ggaGFz
IGJlZW4gc2VudC4gU2VlIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MTAxNy1maXgt
cmlzY3Ytc3lzY2FsbC1uci12MS0xLTRlZGI0Y2EwN2YwN0BnbWFpbC5jb20vVC8KCj4gCj4+Cj4+
IFRoYW5rcyEKPj4KPj4gQWxleAo+Pgo+Pgo+Pj4KPj4+PiBUaGFua3MgYWdhaW4gZm9yIHRoZSB0
aG9yb3VnaCBleHBsYW5hdGlvbiwKPj4+Pgo+Pj4+IEFsZXgKPj4+Pgo+Pj4+Cj4+Pj4+IEFjdHVh
bGx5LCB3ZSB0cmllZCB0aGUgYm90aCB3YXlzIGluIDUyNDQ5YzE3YmRkMSAoInJpc2N2OiBlbnRy
eTogc2V0Cj4+Pj4+IGEwID0gLUVOT1NZUyBvbmx5IHdoZW4gc3lzY2FsbCAhPSAtMSIpIGFuZCA2
MTExOTM5NDYzMWYgKCJyaXNjdjogZW50cnk6Cj4+Pj4+IGFsd2F5cyBpbml0aWFsaXplIHJlZ3Mt
PmEwIHRvIC1FTk9TWVMiKSBiZWZvcmUuCj4+Pj4+Cj4+Pj4+IE5hdHVyYWxseSwgdGhlcmUgaXMg
YSBzb2x1dGlvbjoKPj4+Pj4KPj4+Pj4gMS4gSnVzdCBhZGQgb3JpZ19hMCBpbiB1c2VyX3JlZ3Nf
c3RydWN0IGFuZCBsZXQgc3RyYWNlIHVzZSBpdCBhcwo+Pj4+PiDCoMKgwqDCoCBsb29uZ2FyY2gg
ZG9lcy4gU28gb25seSB0d28gcHJvYmxlbXMsIHdoaWNoIGNhbiBiZSByZXNvbHZlZCB3aXRob3V0
Cj4+Pj4+IMKgwqDCoMKgIGNvbmZsaWN0LCBhcmUgbGVmdCBoZXJlLgo+Pj4+Pgo+Pj4+PiBUaGUg
Y29uZmxpY3RzIGFyZSB0aGUgZGlyZWN0IHJlc3VsdCBvZiB0aGUgbGltaXRhdGlvbiBvZiBnZW5l
cmljIGVudHJ5Cj4+Pj4+IEFQSSwgc28gd2UgaGF2ZSBhbm90aGVyIHR3byBzb2x1dGlvbnM6Cj4+
Pj4+Cj4+Pj4+IDIuIEdpdmUgdXAgdGhlIGdlbmVyaWMgZW50cnkgQVBJLCBhbmQgc3dpdGNoIGJh
Y2sgdG8gdGhlCj4+Pj4+IMKgwqDCoMKgIGFyY2hpdGVjdHVyZS1zcGVjaWZpYyBzdGFuZGFyZGFs
b25lIGltcGxlbWVudGF0aW9uLgo+Pj4+PiAzLiBSZWRlc2lnbiB0aGUgZ2VuZXJpYyBlbnRyeSBB
UEk6IHRoZSBwcm9ibGVtIHdhcyBjYXVzZWQgYnkKPj4+Pj4gwqDCoMKgwqAgc3lzY2FsbF9lbnRl
cl9mcm9tX3VzZXJfbW9kZSgpIHVzaW5nIHRoZSB2YWx1ZSAtMSAod2hpY2ggaXMgdW51c2VkCj4+
Pj4+IMKgwqDCoMKgIG5vcm1hbGx5KSBvZiBzeXNjYWxsIG5yIHRvIGluZm9ybSBzeXNjYWxsIHdh
cyByZWplY3QgYnkgc2VjY29tcC9icGYuCj4+Pj4+Cj4+Pj4+IEluIHRoZW9yeSwgdGhlIFNvbHV0
aW9uIDEgaXMgYmVzdDoKPj4+Pj4KPj4+Pj4gKsKgIGEwIHdhcyB1c2VkIGZvciB0d28gcHVycG9z
ZXMgaW4gQUJJLCBzbyB1c2luZyB0d28gdmFyaWFibGVzIHRvIHN0b3JlCj4+Pj4+IMKgwqDCoMKg
IGl0IGlzIG5hdHVyYWwuCj4+Pj4+ICrCoCBVc2Vyc3BhY2UgY2FuIGltcGxlbWVudCBmZWF0dXJl
cyB3aXRob3V0IGRlcGVuZGluZyBvbiB0aGUgaW50ZXJuYWwKPj4+Pj4gwqDCoMKgwqAgYmVoYXZp
b3Igb2YgdGhlIGtlcm5lbC4KPj4+Pj4KPj4+Pj4gVW5mb3J0dW5hdGVseSwgaXQncyBkaWZmaWN1
bHQgdG8gaW1wbGVtZW50IGJhc2VkIG9uIHRoZSBjdXJyZW50IGNvZGUuCj4+Pj4+IFRoZSBSSVND
LVYgZGVmaW5lZCBzdHJ1Y3QgcHRfcmVncyBhcyBiZWxvdzoKPj4+Pj4KPj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBwdF9yZWdzIHsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGVwYzsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC4u
Lgo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcg
dDY7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogU3VwZXJ2aXNv
ci9NYWNoaW5lIENTUnMgKi8KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB1bnNpZ25lZCBsb25nIHN0YXR1czsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB1bnNpZ25lZCBsb25nIGJhZGFkZHI7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBjYXVzZTsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBhMCB2YWx1ZSBiZWZvcmUgdGhlIHN5c2NhbGwgKi8KPj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIG9yaWdf
YTA7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+Pj4+Pgo+Pj4+PiBBbmQgdXNlcl9yZWdz
X3N0cnVjdCBuZWVkcyB0byBiZSBhIHByZWZpeCBvZiBzdHJ1Y3QgcHRfcmVncywgc28gaWYgd2UK
Pj4+Pj4gd2FudCB0byBpbmNsdWRlIG9yaWdfYTAgaW4gdXNlcl9yZWdzX3N0cnVjdCwgd2Ugd2ls
bCBuZWVkIHRvIGluY2x1ZGUKPj4+Pj4gU3VwZXJ2aXNvci9NYWNoaW5lIENTUnMgYXMgd2VsbC4g
SXQncyBub3QgYSBiaWcgcHJvYmxlbS4gU2luY2UKPj4+Pj4gc3RydWN0IHB0X3JlZ3MgaXMgdGhl
IGludGVybmFsIEFCSSBvZiB0aGUga2VybmVsLCB3ZSBjYW4gcmVvcmRlciBpdC4KPj4+Pj4gVW5m
b3J0dW5hdGVseSwgc3RydWN0IHVzZXJfcmVnc19zdHJ1Y3QgaXMgZGVmaW5lZCBhcyBiZWxvdzoK
Pj4+Pj4KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB1c2VyX3JlZ3Nfc3RydWN0IHsK
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHBj
Owo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLi4uCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyB0NjsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
IH07Cj4+Pj4+Cj4+Pj4+IEl0IGRvZXNuJ3QgY29udGFpbiBzb21ldGhpbmcgbGlrZSByZXNlcnZl
ZFtdIGFzIHBhZGRpbmcgdG8gbGVhdmUgdGhlCj4+Pj4+IHNwYWNlIHRvIGFkZCBtb3JlIHJlZ2lz
dGVycyBmcm9tIHN0cnVjdCBwdF9yZWdzIQo+Pj4+PiBUaGUgbG9vbmdhcmNoIGRvIHRoZSByaWdo
dCB0aGluZyBhcyBiZWxvdzoKPj4+Pj4KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB1
c2VyX3B0X3JlZ3Mgewo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8q
IE1haW4gcHJvY2Vzc29yIHJlZ2lzdGVycy4gKi8KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHJlZ3NbMzJdOwo+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgLi4uCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWdu
ZWQgbG9uZyByZXNlcnZlZFsxMF07Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9IF9fYXR0cmli
dXRlX18oKGFsaWduZWQoOCkpKTsKPj4+Pj4KPj4+Pj4gUklTQy1WIGNhbid0IGluY2x1ZGUgb3Jp
Z19hMCBpbiB1c2VyX3JlZ3Nfc3RydWN0IHdpdGhvdXQgYnJlYWtpbmcgVUFCSS4KPj4+Pj4KPj4+
Pj4gTmVlZCBhIGRpc2N1c3Npb24gdG8gZGVjaWRlIHRvIHVzZSB3aGljaCBzb2x1dGlvbiwgb3Ig
aXMgdGhlcmUgYW55Cj4+Pj4+IG90aGVyIGJldHRlciBzb2x1dGlvbj8KPj4+Pj4KPj4+Pj4gWzFd
OiBodHRwczovL2dpdGh1Yi5jb20vc3RyYWNlL3N0cmFjZS9pc3N1ZXMvMzE1Cj4+Pj4+IFsyXTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNDA2MjcwNzE0MjIuR0EyNjI2
QGFsdGxpbnV4Lm9yZy8KPj4+Pj4KPj4+Pj4KPj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPj4+Pj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+
Pj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+Pj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+IAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
