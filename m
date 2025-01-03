Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0421DE7718F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 09:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lCe2VpVIYmUse33jmVgPHPRp4OWyAiLb6IMoSL9iZ8o=; b=J6IXD0cll5zY9o
	pSMwLswa/9e691spoX+9x6/UHOMlyBOD87UAqkFgep1ZtqwGWrtgoHFbISAIdbxV6koc94YQwJ6Dp
	sb7AeokWTb0EzY79cfBPKkINjNogwilPaScTmkxf4KrXutSJakQ0zesiJk1I0CnDd5eUJR6DcynIS
	cDJOohVShP+G3O6SNlXizjdXUD3pOa+QHaXuiKTvKhOwl6PTqv1aUhIb7T90JTWM34U3Ub2gtifje
	HnvEX1cbe52gODEzK0QmklHhoh0CpDT/jGSOg+gPJOmqN3r3L5sKShzlTfQHGJFL4s/NLlQ2/8KaP
	18CyrcuGTWNibWCAD0vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTe76-0000000Cdca-0M5A;
	Fri, 03 Jan 2025 09:37:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTe5v-0000000CdSE-2qJS
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 Jan 2025 09:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cWtjK5g4BM/SvEXkEBPomhMpQ0cOqD61cD7+kwN1xqo=; b=Y7Fw5v52Z8e413d8xi3tnbPEig
	lzF/iOa5DNnSJSXM8Z1BfxUdkG3IO8HRy12cqLNbIpLj2q2e7QRZsmjCs+CxCqp618cxa/aCMNbnr
	RdxvvZi1IomDYK7QdrGRLUd9pBkqT4hnK8pJF4aCku/jP1DemnmltYes9fGUD5SIB6NM8988pxpG5
	oa3NORyoW9R6rx3pP7QMtikGWU3ifcaYeKKCo4D0FY1GsIvBaLkBYKmu67suYRvcnDqQTZZTkDTzC
	IHppxnn67WHV/B+ZBJsxAHUA7B7BVCVlmYlY+vYv/4myyt/wuvVQVxtfqbVcK3wnVLQ9Z2xPgzYQy
	24p0JdFA==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTe5s-00000008LxM-3L1O
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jan 2025 09:35:50 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2166022c5caso147469145ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jan 2025 01:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735896946; x=1736501746; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cWtjK5g4BM/SvEXkEBPomhMpQ0cOqD61cD7+kwN1xqo=;
        b=bLp/K5ME/RyzMxLI53y6vRZrs/+LuPtrzQNRbIgHsHKh56fOjsn9stgNG0mZLqTVGE
         l3whKzFg5b5WHR23nu9/QUT34kMLnU326OgKuYstPDs7AvAyvZ2OzRwGY/XpkGPtf3d+
         xL51GkTLkUZfq3RDeKMOIApzs74z09gaNapiGQmhyp/kV4bSi2ziSfUIHznfr7ntY0cS
         fqbkuKyKfXEtPyGCmimCV8X6TvU07Vdtbvt1fyju3hjWFTDMD5P1L12M/b2qAhY0SEWZ
         VkEMQRJd988eDzl92qMGBVIniE+LsttfeYZwTkE8flDSZ5tFP0xa0y6Yuv9eCpM1qVln
         uh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896946; x=1736501746;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cWtjK5g4BM/SvEXkEBPomhMpQ0cOqD61cD7+kwN1xqo=;
        b=QPDWIBlFDv0JfyOnafbBkTWjS7E60Gc+iNzIng9R2XcckQ/2JEoeRHucQqcU7yieWo
         9mcBGlQFqx4L05IlxzAccWtVBU8UNOiK2qXXlOLOK/j++bdfCnCT82EVNqKKfoIJu8p9
         U7YQe3vjGkd26Bweo0l8Eofa3zXktZzfkBdq5w+xXHQvAhrvR4A/rvCibYxOZtKHzbsw
         4qLfs9R6C1PcHAhWVhbBtG7ajJPQNqNHkoXNMpILDG76XJG2rwbBYFNh+38HOGJxFZHd
         Ipo3IfAnk+auEUkyxk+FsaMcnifXtiQfAnaw2WM0k1anBZAA1pH3Nx0gDndkNtxVqaoP
         3EDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNCy7Z2o7pufjqcgzIpG+sfPdtEp8KT5YCc+joLBe8OkRBcSBzMG29bkPK07dEBfzzwytCcKgJCh4neg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+AaMt+tfn1Ml5tUOHdNLr9GVrx/Sgc8Qs5DSKxolOCxIbvIpO
	Ag3hKT+hiJXi7ICW50RynnqkhgQFQxyjT6zCR2Qb+yj0IoYcP3O9dKIlL2slaww=
X-Gm-Gg: ASbGnct2PsNFBR+PhOvbdjMfEnt6BeFLTR6H4rlQR7YviIMJPOw8XED44lM73lRK1e9
	a/YEMQlvWx7onjqK4ruohP/nk5uPbL8Uv3rasZME8zgqt7DgMZUvx/1yujedjXJ6nc70+ErSyJR
	EIay5CVI/KOnhCFjxA3RHc9UUod3Nt8PlNxphXrP77HPqpx3ZUpnyfcL2q3qOtm4nTn9Xi2UdbD
	O9ZfQ1aDIW1DDxN9V6RX4hjrkNs+mg9cbpyxi8OCAZ6lVbmO1fq1Kxlnrvat17340aaX/e14XMR
	1C6kxQ==
X-Google-Smtp-Source: AGHT+IE9O96BS3RyGLgD9ozZE9cvlEJyEf8vCWPZNZOt2fNtD1RyepOtwaueaYCtTF24hvZZQqYEyw==
X-Received: by 2002:a17:902:d481:b0:215:6fcd:6cd1 with SMTP id d9443c01a7336-219e6e8c508mr551854195ad.7.1735896945927;
        Fri, 03 Jan 2025 01:35:45 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cddf2sm241537305ad.166.2025.01.03.01.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 01:35:45 -0800 (PST)
Message-ID: <31e1a033-00a7-4953-81e7-0caedd0227a9@bytedance.com>
Date: Fri, 3 Jan 2025 17:35:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] riscv: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
Content-Language: en-US
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, peterz@infradead.org
Cc: agordeev@linux.ibm.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, akpm@linux-foundation.org, rientjes@google.com,
 vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
 <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
 <ebce5e05-5e46-4c6e-94a0-bcf3655a862b@bytedance.com>
 <7e2c26c8-f5df-4833-a93f-3409b00b58fd@arm.com>
 <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
In-Reply-To: <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_093549_110029_E5282014 
X-CRM114-Status: GOOD (  35.53  )
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

CgpPbiAyMDI1LzEvMyAxNzoxMywgUWkgWmhlbmcgd3JvdGU6Cj4gCj4gCj4gT24gMjAyNS8xLzMg
MTY6MDIsIEtldmluIEJyb2Rza3kgd3JvdGU6Cj4+IE9uIDAzLzAxLzIwMjUgMDQ6NDgsIFFpIFpo
ZW5nIHdyb3RlOgo+Pj4gSGkgS2V2aW4sCj4+Pgo+Pj4gT24gMjAyNS8xLzMgMDA6NTMsIEtldmlu
IEJyb2Rza3kgd3JvdGU6Cj4+Pj4gT24gMzAvMTIvMjAyNCAxMDowNywgUWkgWmhlbmcgd3JvdGU6
Cj4+Pj4+IMKgwqAgc3RhdGljIGlubGluZSB2b2lkIHJpc2N2X3RsYl9yZW1vdmVfcHRkZXNjKHN0
cnVjdCBtbXVfZ2F0aGVyICp0bGIsCj4+Pj4+IHZvaWQgKnB0KQo+Pj4+PiDCoMKgIHsKPj4+Pj4g
LcKgwqDCoCBpZiAocmlzY3ZfdXNlX3NiaV9mb3JfcmZlbmNlKCkpCj4+Pj4+ICvCoMKgwqAgaWYg
KHJpc2N2X3VzZV9zYmlfZm9yX3JmZW5jZSgpKSB7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHRsYl9yZW1vdmVfcHRkZXNjKHRsYiwgcHQpOwo+Pj4+PiAtwqDCoMKgIGVsc2UKPj4+Pj4gK8Kg
wqDCoCB9IGVsc2Ugewo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcGFnZXRhYmxlX2R0b3IocHQpOwo+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0bGJfcmVtb3ZlX3BhZ2VfcHRkZXNjKHRsYiwgcHQp
Owo+Pj4+Cj4+Pj4gSSBmaW5kIHRoZSBpbWJhbGFuY2UgcHJldHR5IGNvbmZ1c2luZzogcGFnZXRh
YmxlX2R0b3IoKSBpcyBjYWxsZWQKPj4+PiBleHBsaWNpdGx5IGJlZm9yZSB1c2luZyB0bGJfcmVt
b3ZlX3BhZ2UoKSBidXQgbm90IHRsYl9yZW1vdmVfcHRkZXNjKCkuCj4+Pj4gRG9lc24ndCB0aGF0
IGFzc3VtZSB0aGF0IENPTkZJR19NTVVfR0FUSEVSX0hBVkVfVEFCTEVfRlJFRSBpcyBzZWxlY3Rl
ZD8KPj4+PiBDb3VsZCB3ZSBub3QgY2FsbCBwYWdldGFibGVfZHRvcigpIGZyb20gCj4+Pj4gX190
bGJfYmF0Y2hfZnJlZV9lbmNvZGVkX3BhZ2VzKCkKPj4+PiB0byBlbnN1cmUgdGhhdCB0aGUgZHRv
ciBpcyBhbHdheXMgY2FsbGVkIGp1c3QgYmVmb3JlIGZyZWVpbmcsIGFuZCAKPj4+PiByZW1vdmUK
Pj4+Cj4+PiBJbiBfX3RsYl9iYXRjaF9mcmVlX2VuY29kZWRfcGFnZXMoKSwgd2UgY2FuIGluZGVl
ZCBkZXRlY3QgUGFnZVRhYmxlKCkKPj4+IGFuZCBjYWxsIHBhZ2V0YWJsZV9kdG9yKCkgdG8gZHRv
ciB0aGUgcGFnZSB0YWJsZSBwYWdlcy4KPj4+IEJ1dCBfX3RsYl9iYXRjaF9mcmVlX2VuY29kZWRf
cGFnZXMoKSBpcyBhbHNvIHVzZWQgdG8gZnJlZSBub3JtYWwgcGFnZXMKPj4+IChub3QgcGFnZSB0
YWJsZSBwYWdlcyksIHNvIEkgZG9uJ3Qgd2FudCB0byBhZGQgb3ZlcmhlYWQgdGhlcmUuCj4+Cj4+
IEludGVyZXN0aW5nLCBjYW4gYSB0bGIgYmF0Y2ggcmVmZXIgdG8gcGFnZXMgdGhhbiBhcmUgbm90
IFBUUHMgdGhlbj8KPiAKPiBZZXMsIHlvdSBjYW4gc2VlIHRoZSBjYWxsZXIgb2YgX190bGJfcmVt
b3ZlX2ZvbGlvX3BhZ2VzKCkgb3IgCj4gdGxiX3JlbW92ZV9wYWdlX3NpemUoKS4KPiAKPj4KPj4+
Cj4+PiBCdXQgbm93IEkgdGhpbmsgbWF5YmUgd2UgY2FuIGRvIHRoaXMgaW4gdGxiX3JlbW92ZV9w
YWdlX3B0ZGVzYygpLCBsaWtlCj4+PiB0aGlzOgo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL2Nz
a3kvaW5jbHVkZS9hc20vcGdhbGxvYy5oCj4+PiBiL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9wZ2Fs
bG9jLmgKPj4+IGluZGV4IGYxY2U1YjdiMjhmMjIuLmU0NWM3ZTkxZGNiZjkgMTAwNjQ0Cj4+PiAt
LS0gYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20vcGdhbGxvYy5oCj4+PiArKysgYi9hcmNoL2Nza3kv
aW5jbHVkZS9hc20vcGdhbGxvYy5oCj4+PiBAQCAtNjMsNyArNjMsNiBAQCBzdGF0aWMgaW5saW5l
IHBnZF90ICpwZ2RfYWxsb2Moc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4+Pgo+Pj4gwqDCoCNkZWZp
bmUgX19wdGVfZnJlZV90bGIodGxiLCBwdGUsIGFkZHJlc3MpwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgXAo+Pj4gwqDCoGRvIHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFwKPj4+IC3CoMKgwqDCoMKgwqAgcGFnZXRhYmxlX2R0b3IocGFnZV9wdGRlc2MocHRl
KSk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+PiDCoMKgwqDCoMKgwqDCoMKgIHRs
Yl9yZW1vdmVfcGFnZV9wdGRlc2ModGxiLCBwYWdlX3B0ZGVzYyhwdGUpKTvCoCBcCj4+PiDCoMKg
fSB3aGlsZSAoMCkKPj4+Cj4+PiBbLi4uXQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2Fz
bS1nZW5lcmljL3RsYi5oIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy90bGIuaAo+Pj4gaW5kZXggYTk2
ZDRiNDQwZjNkYS4uYTU5MjA1ODYzZjQzMSAxMDA2NDQKPj4+IC0tLSBhL2luY2x1ZGUvYXNtLWdl
bmVyaWMvdGxiLmgKPj4+ICsrKyBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvdGxiLmgKPj4+IEBAIC01
MDYsNiArNTA2LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHRsYl9yZW1vdmVfcHRkZXNjKHN0cnVj
dAo+Pj4gbW11X2dhdGhlciAqdGxiLCB2b2lkICpwdCkKPj4+IMKgwqAvKiBMaWtlIHRsYl9yZW1v
dmVfcHRkZXNjLCBidXQgZm9yIHBhZ2UtbGlrZSBwYWdlIGRpcmVjdG9yaWVzLiAqLwo+Pj4gwqDC
oHN0YXRpYyBpbmxpbmUgdm9pZCB0bGJfcmVtb3ZlX3BhZ2VfcHRkZXNjKHN0cnVjdCBtbXVfZ2F0
aGVyICp0bGIsCj4+PiBzdHJ1Y3QgcHRkZXNjICpwdCkKPj4+IMKgwqB7Cj4+PiArwqDCoMKgwqDC
oMKgIHBhZ2V0YWJsZV9kdG9yKHB0KTsKPj4+IMKgwqDCoMKgwqDCoMKgwqAgdGxiX3JlbW92ZV9w
YWdlKHRsYiwgcHRkZXNjX3BhZ2UocHQpKTsKPj4+IMKgwqB9Cj4+Cj4+IEkgdGhpbmsgdGhpcyBp
cyBhbiBpbnRlcmVzdGluZyBpZGVhLCBpdCBkb2VzIG1ha2UgYXJjaCBjb2RlIGVhc2llciB0bwo+
PiBmb2xsb3cuIE9UT0ggaXQgd291bGQgaGF2ZSBiZWVuIG1vcmUgbmF0dXJhbCB0byBtZSB0byBj
YWxsCj4+IHBhZ2V0YWJsZV9kdG9yKCkgZnJvbSB0bGJfcmVtb3ZlX3BhZ2UoKS4gSSBjYW4gaG93
ZXZlciBzZWUgdGhhdCB0aGlzCj4+IGRvZXNuJ3Qgd29yaywgYmVjYXVzZSB0bGJfcmVtb3ZlX3Rh
YmxlKCkgaXMgZGVmaW5lZCBhcyB0bGJfcmVtb3ZlX3BhZ2UoKQo+PiBpZiBDT05GSUdfTU1VX0dB
VEhFUl9IQVZFX1RBQkxFX0ZSRUUgaXNuJ3Qgc2VsZWN0ZWQuIFdoaWNoIGJyaW5ncyBtZQo+PiBi
YWNrIHRvIG15IGVhcmxpZXIgcXVlc3Rpb246IGluIHRoYXQgY2FzZSwgYXJlbid0IHdlIG1pc3Np
bmcgYSBjYWxsIHRvCj4+IHBhZ2V0YWJsZV9kdG9yKCkgd2hlbiB1c2luZyB0bGJfcmVtb3ZlX3Rh
YmxlKCkgKG9yIHRsYl9yZW1vdmVfcHRkZXNjKCkpPwo+IAo+IFRoYW5rIHlvdSBmb3IgcG9pbnRp
bmcgdGhpcyBvdXQhCj4gCj4gTm93LCB0aGVyZSBhcmUgdGhlIGZvbGxvd2luZyBhcmNoaXRlY3R1
cmVzIHNlbGVjdGVkIAo+IENPTkZJR19NTVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFOgo+IAo+IDEu
IGFybTogc2VsZWN0IE1NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUgaWYgU01QICYmIEFSTV9MUEFF
Cj4gMi4gYXJtNjQ6IHNlbGVjdCBNTVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFCj4gMy4gcG93ZXJw
Yzogc2VsZWN0IE1NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUKPiA0LiByaXNjdjogc2VsZWN0IE1N
VV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUgaWYgU01QICYmIE1NVQo+IDUuIHMzOTA6IHNlbGVjdCBN
TVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFCj4gNi4gc3BhcmM6IHNlbGVjdCBNTVVfR0FUSEVSX1JD
VV9UQUJMRV9GUkVFIGlmIFNNUAo+IDcuIHg4Njogc2VsZWN0IE1NVV9HQVRIRVJfUkNVX1RBQkxF
X0ZSRUXCoMKgwqAgaWYgUEFSQVZJUlQKPiAKPiBJZiBDT05GSUdfTU1VX0dBVEhFUl9UQUJMRV9G
UkVFIGlzIHNlbGVjdGVkLCBhbiBhcmNoaXRlY3R1cmUgaXMgZXhwZWN0ZWQKPiB0byBwcm92aWRl
IF9fdGxiX3JlbW92ZV90YWJsZSgpLiBUaGlzIHBhdGNoIHNlcmllcyBtb2RpZmllcyB0aGUKPiBf
X3RsYl9yZW1vdmVfdGFibGUoKSBpbiBhcm0sIGFybTY0LCByaXNjdiwgczM5MCBhbmQgeDg2LiBB
bW9uZyB0aGVtLAo+IGFybTY0IGFuZCBzMzkwIHVuY29uZGl0aW9uYWxseSBzZWxlY3QgTU1VX0dB
VEhFUl9SQ1VfVEFCTEVfRlJFRSwgc28gd2UKPiBvbmx5IG5lZWQgdG8gZG91YmxlLWNoZWNrIGFy
bSwgcmlzY3YgYW5kIHg4Ni4KPiAKPiBGb3IgeDg2LCBpdCB3YXMgY2FsbGVkIHRsYl9yZW1vdmVf
cGFnZSgpIGluIHRoZSBub24tUEFSQVZJUlQgY2FzZSwgYW5kIEkKPiBhZGRlZCBwYWdldGFibGVf
ZHRvcigpIGZvciBpdCBleHBsaWNpdGx5IChzZWUgcGF0Y2ggIzExKSwgc28gdGhpcyBzaG91bGQK
PiBiZSBubyBwcm9ibGVtLgo+IAo+IEZvciByaXNjdiwgaXQgd2lsbCBvbmx5IGNhbGwgdGxiX3Jl
bW92ZV9wdGRlc2MoKSBpbiB0aGUgY2FzZSBvZgo+IFNNUCAmJiBNTVUsIHNvIHRoaXMgc2hvdWxk
IGJlIG5vIHByb2JsZW0uCj4gCj4gRm9yIGFybSwgdGhlIGNhbGwgdG8gcGFnZXRhYmxlX2R0b3Io
KSBpcyBpbmRlZWQgbWlzc2VkIGluIHRoZQo+IG5vbi1NTVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVF
IGNhc2UuIFRoaXMgbmVlZHMgdG8gYmUgZml4ZWQuIEJ1dCB3ZQo+IGNhbid0IGZpeCB0aGlzIGJ5
IGFkZGluZyBwYWdldGFibGVfZHRvcigpIHRvIHRsYl9yZW1vdmVfdGFibGUoKSwKPiBiZWNhdXNl
IHNvbWUgYXJjaGl0ZWN0dXJlcyBjYWxsIHRsYl9yZW1vdmVfdGFibGUoKSBidXQgZG9uJ3Qgc3Vw
cG9ydAo+IHBhZ2UgdGFibGUgc3RhdGlzdGljcywgbGlrZSBzcGFyYy4KPiAKPiBTbyBhIG1vcmUg
ZGlyZWN0IGZpeCBtaWdodCBiZToKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hc20tZ2VuZXJp
Yy90bGIuaCBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvdGxiLmgKPiBpbmRleCBhNTkyMDU4NjNmNDMx
Li4wYTEzMTQ0NGExOGNhIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvdGxiLmgK
PiArKysgYi9pbmNsdWRlL2FzbS1nZW5lcmljL3RsYi5oCj4gQEAgLTUwMCw2ICs1MDAsOSBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgdGxiX3JlbW92ZV9wYWdlKHN0cnVjdCBtbXVfZ2F0aGVyIAo+ICp0
bGIsIHN0cnVjdCBwYWdlICpwYWdlKQo+IAo+ICDCoHN0YXRpYyBpbmxpbmUgdm9pZCB0bGJfcmVt
b3ZlX3B0ZGVzYyhzdHJ1Y3QgbW11X2dhdGhlciAqdGxiLCB2b2lkICpwdCkKPiAgwqB7Cj4gKyNp
Zm5kZWYgQ09ORklHX01NVV9HQVRIRVJfVEFCTEVfRlJFRQo+ICvCoMKgwqDCoMKgwqAgcGFnZXRh
YmxlX2R0b3IocHQpOwo+ICsjZW5kaWYKPiAgwqDCoMKgwqDCoMKgwqAgdGxiX3JlbW92ZV90YWJs
ZSh0bGIsIHB0KTsKPiAgwqB9Cj4gCj4gT3IgZml4IGl0IGRpcmVjdGx5IGluIGFybT8gTGlrZSB0
aGUgZm9sbG93aW5nOgo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9pbmNsdWRlL2FzbS90bGIu
aCBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3RsYi5oCj4gaW5kZXggZWE0ZmJlN2IxN2Y2Zi4uY2Y1
ZDBjYTAyMTQ0MCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9pbmNsdWRlL2FzbS90bGIuaAo+ICsr
KyBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3RsYi5oCj4gQEAgLTQzLDYgKzQzLDkgQEAgX19wdGVf
ZnJlZV90bGIoc3RydWN0IG1tdV9nYXRoZXIgKnRsYiwgcGd0YWJsZV90IHB0ZSwgCj4gdW5zaWdu
ZWQgbG9uZyBhZGRyKQo+ICDCoMKgwqDCoMKgwqDCoCBfX3RsYl9hZGp1c3RfcmFuZ2UodGxiLCBh
ZGRyIC0gUEFHRV9TSVpFLCAyICogUEFHRV9TSVpFKTsKPiAgwqAjZW5kaWYKPiAKPiArI2lmbmRl
ZiBDT05GSUdfTU1VX0dBVEhFUl9UQUJMRV9GUkVFCj4gK8KgwqDCoMKgwqDCoCBwYWdldGFibGVf
ZHRvcihwdGRlc2MpOwo+ICsjZW5kaWYKPiAgwqDCoMKgwqDCoMKgwqAgdGxiX3JlbW92ZV9wdGRl
c2ModGxiLCBwdGRlc2MpOwo+ICDCoH0KCk9yIGNhbiB3ZSBqdXN0IG5vdCBsZXQgdGxiX3JlbW92
ZV90YWJsZSgpIGZhbGwgYmFjayB0bwp0bGJfcmVtb3ZlX3BhZ2UoKT8gTGlrZSB0aGUgZm9sbG93
aW5nOgoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvdGxiLmggYi9pbmNsdWRlL2Fz
bS1nZW5lcmljL3RsYi5oCmluZGV4IGE1OTIwNTg2M2Y0MzEuLjM1NGZmYWE0YmQxMjAgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvdGxiLmgKKysrIGIvaW5jbHVkZS9hc20tZ2VuZXJp
Yy90bGIuaApAQCAtMTk1LDggKzE5NSw2IEBACiAgICogIHZhcmlvdXMgcHRlcF9nZXRfYW5kX2Ns
ZWFyKCkgZnVuY3Rpb25zLgogICAqLwoKLSNpZmRlZiBDT05GSUdfTU1VX0dBVEhFUl9UQUJMRV9G
UkVFCi0KICBzdHJ1Y3QgbW11X3RhYmxlX2JhdGNoIHsKICAjaWZkZWYgQ09ORklHX01NVV9HQVRI
RVJfUkNVX1RBQkxFX0ZSRUUKICAgICAgICAgc3RydWN0IHJjdV9oZWFkICAgICAgICAgcmN1OwpA
QCAtMjE5LDE2ICsyMTcsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX190bGJfcmVtb3ZlX3RhYmxl
KHZvaWQgKnRhYmxlKQoKICBleHRlcm4gdm9pZCB0bGJfcmVtb3ZlX3RhYmxlKHN0cnVjdCBtbXVf
Z2F0aGVyICp0bGIsIHZvaWQgKnRhYmxlKTsKCi0jZWxzZSAvKiAhQ09ORklHX01NVV9HQVRIRVJf
SEFWRV9UQUJMRV9GUkVFICovCi0KLS8qCi0gKiBXaXRob3V0IE1NVV9HQVRIRVJfVEFCTEVfRlJF
RSB0aGUgYXJjaGl0ZWN0dXJlIGlzIGFzc3VtZWQgdG8gaGF2ZSAKcGFnZSBiYXNlZAotICogcGFn
ZSBkaXJlY3RvcmllcyBhbmQgd2UgY2FuIHVzZSB0aGUgbm9ybWFsIHBhZ2UgYmF0Y2hpbmcgdG8g
ZnJlZSB0aGVtLgotICovCi0jZGVmaW5lIHRsYl9yZW1vdmVfdGFibGUodGxiLCBwYWdlKSB0bGJf
cmVtb3ZlX3BhZ2UoKHRsYiksIChwYWdlKSkKLQotI2VuZGlmIC8qIENPTkZJR19NTVVfR0FUSEVS
X1RBQkxFX0ZSRUUgKi8KLQogICNpZmRlZiBDT05GSUdfTU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJF
RQogIC8qCiAgICogVGhpcyBhbGxvd3MgYW4gYXJjaGl0ZWN0dXJlIHRoYXQgZG9lcyBub3QgdXNl
IHRoZSBsaW51eCBwYWdlLXRhYmxlcyBmb3IKCj4gCj4gVGhhbmtzLAo+IFFpCj4gCj4+Cj4+IC0g
S2V2aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
