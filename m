Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD66C369CB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 03:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5i5ywIDj5zBaiXYfGvpgHydyMZTD6lxRJYQWJrHR+Cc=; b=JsGtGWWAv/GRB37teXJKfzGr35
	zvWkY+HuNkFnbG+h75+Vfs5ZrFkxBLMmMqHL1fka3qDoKbtXm7TzLf1Zuw8UeOtw64yRhpYD2zyMI
	MB6JsQsPBhd4BQwYkl0tYtlZ6CgKIHX0x8HgFirD4hT+DWvBXt4atR79sSY2f687MySElLcAVMqQk
	/MYWcI1iaWMuJCxRW1HkU9adrz5JUuMDViQrImrijLdWvz6/kmWdvrI4GggM1jOxBia5UYNmHTY9h
	7brdfNIzFslviS+nafJst/dZZ4eVcDG98TkAnPezWvUnsRf5pOtu7iIOnoIARhlOsta+7qGXBRAH6
	jtO7rt7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7n5I-0000000Cibp-2QRC;
	Thu, 24 Apr 2025 03:17:08 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7n5D-0000000CiZT-1rRz
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 03:17:06 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-73bb647eb23so414834b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 20:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745464622; x=1746069422; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XUAwJhWsStgPPiYel2m5dmuZ8PujmZM+CaGE2sUsiqI=;
        b=nhkF/jho2Madi3YXqORbl2kcyg8Hw+dYHej8bt0UxIGvpqj7+Nxx5SuFqb1kGJiXeO
         o9/YShjcGKrYE9DzQQB9lZBdg36VfeS671todLqK9jvbBa+5mmUFW/RtqucOCq5TUSn7
         pQqmB/u5/NJSDOKc/BewYa6+MtD+oNbXBTpXkgvfNvS3C1VCCCF4tVCGCxlcdhNWgqKv
         hc8lJWOYIWeCAHT9TIVa4yUklvDdHQuiZwJmFY/qdim+dRADeGV+7SO3iZO4bjGSUfFi
         Z5KQbaZnGBPozbGCawIqQreO9Ik7OODnpQwB8xL/pvGspXVDiJZirkd1Z8tXFSZzQmGi
         ExQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745464622; x=1746069422;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XUAwJhWsStgPPiYel2m5dmuZ8PujmZM+CaGE2sUsiqI=;
        b=sImbV0kdjJ+CIzPz0/73cqu8zLwIu+zK0xlPNNOSfCisgCdMaxr9Uu0DvjRPBn9nRX
         IfnZJmTiYwWASAV0gP9jKzTtN43+Rbux4pPF0Vk6Iq+o3SyB2zC3NdAkRDCp/UfdqiH9
         yDFbC+LCK6uKw12Wh0zkvZ6YNMEXh++gpPK6vo4pWlPfE/YnwingawqPPUDpPafFYP3j
         Eozk/15hlzqbpq333J5CuCmtdhvWMmbPJqmiS/vGvUIrZccp7HMqtvGM0Cff/4N9d85l
         fKckwaIvpnQh24qadQ5lTGXvOKFnD3JtwSXh20dN9lWf2LgDntsXVAJsglomDIQxeClz
         /1dA==
X-Forwarded-Encrypted: i=1; AJvYcCXrf60paSK5xWxznjc1cwE5iYa0BeHkVbMaOYON4eU1yov7AOBQhtdN1RpOT5vIqsV7kCmU5uoEcX17vA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwgVqsG8oDfIvvqxRXdrGffPgiPn6JsVEU5SBzwtb9f0TfA3Eu
	dPQGI8x80oh0+DoOC9Sy7bc1ul4X20Qe9h4zuDf1PX33mKFDHUj9cSKnq2Q7+XY=
X-Gm-Gg: ASbGnctv+hTOInluO6PRDfe/OH+MPWcG5TCAynBnnK5WZ55NpttTtzkuqSBr5+yaE+D
	sqnusJLgvX8avYj6i93iLcMFak2frMk6CvfrHJkep2p7nSGRAPoe2lkcsr1cla/D7JNZR9IL8UZ
	U6Y1+YCO9DbYU0xiNIODV6ioXhsEzWQT4pjNxhzz5eEP/GGovRvlPTrF7JgcQS3vjUp5CxLl7Cw
	Zlpko5vgOb0Zvfm1v8PepRWr5dEzgbnFJzwOe6rLdlqZv0+/Z0bCEFsEOnHNV4l25cX2ZC+eFjQ
	AHbJfBgwIHyBsVHzph2lPc3Ya0w3XauSBdqt1mlvjCZ2wKAgQNE=
X-Google-Smtp-Source: AGHT+IHFdvA0DlIcVCkE1m7fhwPnPK/+qUF0hzp1UIxp5PRqy2sOJJ28/GW1knmKmyzytkf5QLtSrA==
X-Received: by 2002:a05:6a20:9f4f:b0:1f5:9208:3ad6 with SMTP id adf61e73a8af0-20444f9f316mr1339520637.41.1745464622463;
        Wed, 23 Apr 2025 20:17:02 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941fd9sm354190b3a.53.2025.04.23.20.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 20:17:02 -0700 (PDT)
Date: Wed, 23 Apr 2025 20:16:58 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, Zong Li <zong.li@sifive.com>,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v12 10/28] riscv/mm: Implement map_shadow_stack() syscall
Message-ID: <aAmtKhlwKV7oz7RF@debug.ba.rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-10-e51202b53138@rivosinc.com>
 <D92VAWLM8AGD.3CF1VH6NYHCYV@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D92VAWLM8AGD.3CF1VH6NYHCYV@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_201703_689645_560A6C4E 
X-CRM114-Status: GOOD (  27.03  )
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

T24gVGh1LCBBcHIgMTAsIDIwMjUgYXQgMTE6NTY6NDRBTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+MjAyNS0wMy0xNFQxNDozOToyOS0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0By
aXZvc2luYy5jb20+Ogo+PiBBcyBkaXNjdXNzZWQgZXh0ZW5zaXZlbHkgaW4gdGhlIGNoYW5nZWxv
ZyBmb3IgdGhlIGFkZGl0aW9uIG9mIHRoaXMKPj4gc3lzY2FsbCBvbiB4ODYgKCJ4ODYvc2hzdGs6
IEludHJvZHVjZSBtYXBfc2hhZG93X3N0YWNrIHN5c2NhbGwiKSB0aGUKPj4gZXhpc3RpbmcgbW1h
cCgpIGFuZCBtYWR2aXNlKCkgc3lzY2FsbHMgZG8gbm90IG1hcCBlbnRpcmVseSB3ZWxsIG9udG8g
dGhlCj4+IHNlY3VyaXR5IHJlcXVpcmVtZW50cyBmb3Igc2hhZG93IHN0YWNrIG1lbW9yeSBzaW5j
ZSB0aGV5IGxlYWQgdG8gd2luZG93cwo+PiB3aGVyZSBtZW1vcnkgaXMgYWxsb2NhdGVkIGJ1dCBu
b3QgeWV0IHByb3RlY3RlZCBvciBzdGFja3Mgd2hpY2ggYXJlIG5vdAo+PiBwcm9wZXJseSBhbmQg
c2FmZWx5IGluaXRpYWxpc2VkLiBJbnN0ZWFkIGEgbmV3IHN5c2NhbGwgbWFwX3NoYWRvd19zdGFj
aygpCj4+IGhhcyBiZWVuIGRlZmluZWQgd2hpY2ggYWxsb2NhdGVzIGFuZCBpbml0aWFsaXNlcyBh
IHNoYWRvdyBzdGFjayBwYWdlLgo+Pgo+PiBUaGlzIHBhdGNoIGltcGxlbWVudHMgdGhpcyBzeXNj
YWxsIGZvciByaXNjdi4gcmlzY3YgZG9lc24ndCByZXF1aXJlIHRva2VuCj4+IHRvIGJlIHNldHVw
IGJ5IGtlcm5lbCBiZWNhdXNlIHVzZXIgbW9kZSBjYW4gZG8gdGhhdCBieSBpdHNlbGYuIEhvd2V2
ZXIgdG8KPj4gcHJvdmlkZSBjb21wYXRpYmlsaXR5IGFuZCBwb3J0YWJpbGl0eSB3aXRoIG90aGVy
IGFyY2hpdGVjdHVlcywgdXNlciBtb2RlCj4+IGNhbiBzcGVjaWZ5IHRva2VuIHNldCBmbGFnLgo+
Cj5SSVNDLVYgc2hhZG93IHN0YWNrIGNvdWxkIHVzZSBtbWFwKCkgYW5kIG1hZHZpc2UoKSBwZXJm
ZWN0bHkgd2VsbC4KCkRldmlhdGluZyBmcm9tIHdoYXQgb3RoZXIgYXJjaGVzIGFyZSBkb2luZyB3
aWxsIGNyZWF0ZSBtb3JlIHRocmFzaC4gSSBleHBlY3QKdGhlcmUgd2lsbCBiZSBtZXJnaW5nIG9m
IGNvbW1vbiBsb2dpYyBiZXR3ZWVuIHg4NiwgYXJtNjQgYW5kIHJpc2N2LiBJbmZhY3QgSQpkaWQg
cG9zdCBvbmUgc3VjaCBSRkMgcGF0Y2ggc2V0IGxhc3QgeWVhciAoZGlkbid0IGZvbGxvdyB1cCBv
biBpdCkuIFVzaW5nCmBtbWFwL21hZHZpc2VgIGRlZmVhdHMgdGhhdCBwdXJwb3NlIG9mIGNyZWF0
aW5nIGNvbW1vbiBsb2dpYyBiZXR3ZWVuIGFyY2hlcy4KClRoZXJlIGFyZSBwaXRmYWxscyBhcyBt
ZW50aW9uZWQgd2l0aCByZXNwZWN0IHRvIG1tYXAvbWFkaXZzZSBiZWNhdXNlIG9mCnVuaXF1ZSBu
YXR1cmUgb2Ygc2hhZG93IHN0YWNrLiBBbmQgdGh1cyBpdCB3YXMgYWNjZXB0ZWQgdG8gY3JlYXRl
IGEgbmV3IHN5c2NhbGwKdG8gY3JlYXRlIHN1Y2ggbWFwcGluZ3MuIFJJU0MtViB3aWxsIHN0aWNr
IHRvIHRoYXQuCgo+VXNlcnNwYWNlIGNhbiBhbHdheXMgaW5pdGlhbGl6ZSB0aGUgc2hhZG93IHN0
YWNrIHByb3Blcmx5IGFuZCB0aGUgc2hhZG93Cj5zdGFjayBtZW1vcnkgaXMgbmV2ZXIgcHJvdGVj
dGVkIGZyb20gb3RoZXIgbWFsaWNpb3VzIHRocmVhZHMuCgpTaGFkb3cgc3RhY2sgbWVtb3J5IGlz
IHByb3RlY3RlZCBmcm9tIGluYWR2ZXJ0ZW50IHN0b3JlcyAoYmUgaXQgc2FtZSB0aHJlYWQKb3Ig
YSBkaWZmZXJlbnQgdGhyZWFkIGluIHNhbWUgYWRkcmVzcyBzcGFjZSkuIE1hbGljaW91cyBjb2Rl
IHdoaWNoIGNhbiBkbwpgc3NwdXNoL3NzYW1vc3dhcGAgYWxyZWFkeSBhc3N1bWVzIHRoYXQgY29k
ZSBpbnRlZ3JpdHkgcG9saWNpZXMgYXJlIGJyb2tlbi4KCj4KPkkgdGhpbmsgdGhhdCB0aGUgY29t
cGF0aWJpbGl0eSBhcmd1bWVudCBpcyByZWFzb25hYmxlLiAgV2UnZCBuZWVkIHRvCj5tb2RpZnkg
dGhlIG90aGVyIHN5c2NhbGxzIHRvIGFsbG93IGEgd3JpdGUtb25seSBtYXBwaW5nIGFueXdheS4K
Cgo+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC91c2VyY2ZpLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC91c2VyY2ZpLmMKPj4gK3N0YXRpYyBub2lubGluZSB1bnNpZ25lZCBsb25nIGFt
b191c2VyX3Noc3RrKHVuc2lnbmVkIGxvbmcgKmFkZHIsIHVuc2lnbmVkIGxvbmcgdmFsKQo+PiAr
ewo+PiArCS8qCj4+ICsJICogTmV2ZXIgZXhwZWN0IC0xIG9uIHNoYWRvdyBzdGFjay4gRXhwZWN0
IHJldHVybiBhZGRyZXNzZXMgYW5kIHplcm8KPj4gKwkgKi8KPj4gKwl1bnNpZ25lZCBsb25nIHN3
YXAgPSAtMTsKPj4gKwlfX2VuYWJsZV91c2VyX2FjY2VzcygpOwo+PiArCWFzbSBnb3RvKAo+PiAr
CQkiLm9wdGlvbiBwdXNoXG4iCj4+ICsJCSIub3B0aW9uIGFyY2gsICt6aWNmaXNzXG4iCj4KPlNo
b3VsZG4ndCBjb21waWxlciBhY2NlcHQgc3NhbW9zd2FwLmQgb3Bjb2RlIGV2ZW4gd2l0aG91dCB6
aWNmaXNzIGFyY2g/CgpJdHMgaWxsZWdhbCBpbnN0cnVjdGlvbiBpZiBzaGFkb3cgc3RhY2sgYXJl
bid0IGF2YWlsYWJsZS4gQ3VycmVudCB0b29sY2hhaW4KZW1pdHMgaXQgb25seSBpZiB6aWNmaXNz
IGlzIHNwZWNpZmllZCBpbiBtYXJjaC4KCj4KPj4gKwkJIjE6IHNzYW1vc3dhcC5kICVbc3dhcF0s
ICVbdmFsXSwgJVthZGRyXVxuIgo+PiArCQlfQVNNX0VYVEFCTEUoMWIsICVsW2ZhdWx0XSkKPj4g
KwkJUklTQ1ZfQUNRVUlSRV9CQVJSSUVSCj4KPldoeSBpcyB0aGUgYmFycmllciBoZXJlPwoKSUlS
QywgSSB3YXMgZm9sbG93aW5nIGBhcmNoX2NtcHhjaGdfYWNxdWlyZWAuCkJ1dCBJIHRoaW5rIHRo
YXQncyBub3QgbmVlZGVkLiAKV2hhdCB3ZSBhcmUgZG9pbmcgaXMgYGFyY2hfeGNoZ19yZWxheGVk
YCBhbmQgYmFycmllciBpcyBub3QgbmVlZGVkLgoKSSBkaWQgY29uc2lkZXIgYWRkaW5nIGl0IHRv
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oIGJ1dCB0aGVyZSBpcwpsaW1pdGVkIHVz
YWdlIG9mIHRoaXMgcHJpbWl0aXZlIGFuZCB0aHVzIGtlcHQgaXQgbGltaXRlZCB0byB1c2VyY2Zp
LmMKCkFueXdheXMgSSdsbCByZS1zcGluIHJlbW92aW5nIHRoZSBiYXJyaWVyLgoKPgo+PiArCQki
Lm9wdGlvbiBwb3BcbiIKPj4gKwkJOiBbc3dhcF0gIj1yIiAoc3dhcCksIFthZGRyXSAiK0EiICgq
YWRkcikKPj4gKwkJOiBbdmFsXSAiciIgKHZhbCkKPj4gKwkJOiAibWVtb3J5Igo+PiArCQk6IGZh
dWx0Cj4+ICsJCSk7Cj4+ICsJX19kaXNhYmxlX3VzZXJfYWNjZXNzKCk7Cj4+ICsJcmV0dXJuIHN3
YXA7Cj4+ICtmYXVsdDoKPj4gKwlfX2Rpc2FibGVfdXNlcl9hY2Nlc3MoKTsKPj4gKwlyZXR1cm4g
LTE7Cj4KPkkgdGhpbmsgd2Ugc2hvdWxkIHJldHVybiAwIGFuZCAtRUZBVUxULgo+V2UgY2FuIGln
bm9yZSB0aGUgc3dhcHBlZCB2YWx1ZSwgb3IgcmV0dXJuIGl0IHRocm91Z2ggYSBwb2ludGVyLgoK
Q29uc3VtZXIgb2YgdGhpcyBkZXRlY3RzIC0xIGFuZCB0aGVuIHJldHVybiAtRUZBVUxULgpXZSB3
b3VsZCBldmVudHVhbGx5IG5lZWQgdGhpcyB3aGVuIGNyZWF0aW5nIHNoYWRvdyBzdGFjayB0b2tl
bnMgZm9yCmtlcm5lbCBzaGFkb3cgc3RhY2suIEkgYmVsaWV2ZSBgLTFgIGlzIHNhZmUgcmV0dXJu
IHZhbHVlIHdoaWNoIGNhbid0CmJlIGNvbnN0cnVlZCBhcyBuZWdhdGl2ZSBrZXJuZWwgYWRkcmVz
cyAoLUVGQVVMVCB3aWxsIGJlKQoKCj4KPj4gK30KPj4gKwo+PiArc3RhdGljIHVuc2lnbmVkIGxv
bmcgYWxsb2NhdGVfc2hhZG93X3N0YWNrKHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9u
ZyBzaXplLAo+PiArCQkJCQkgICB1bnNpZ25lZCBsb25nIHRva2VuX29mZnNldCwgYm9vbCBzZXRf
dG9rKQo+PiArewo+PiArCWludCBmbGFncyA9IE1BUF9BTk9OWU1PVVMgfCBNQVBfUFJJVkFURTsK
Pgo+SXMgTUFQX0dST1dTRE9XTiBwb2ludGxlc3M/CgpOb3Qgc3VyZS4gRGlkbid0IHNlZSB0aGF0
IGluIHg4NiBvciBhcm02NCBzaGFkb3cgc3RhY2sgY3JlYXRpb24uCkxldCBtZSBrbm93IGlmIGl0
cyB1c2VmdWwuCgo+Cj4+ICsJc3RydWN0IG1tX3N0cnVjdCAqbW0gPSBjdXJyZW50LT5tbTsKPj4g
Kwl1bnNpZ25lZCBsb25nIHBvcHVsYXRlLCB0b2tfbG9jID0gMDsKPj4gKwo+PiArCWlmIChhZGRy
KQo+PiArCQlmbGFncyB8PSBNQVBfRklYRURfTk9SRVBMQUNFOwo+PiArCj4+ICsJbW1hcF93cml0
ZV9sb2NrKG1tKTsKPj4gKwlhZGRyID0gZG9fbW1hcChOVUxMLCBhZGRyLCBzaXplLCBQUk9UX1JF
QUQsIGZsYWdzLAo+Cj5QUk9UX1JFQUQgaW1wbGllcyBWTV9SRUFELCBzbyB3b24ndCB0aGlzIHNl
bGVjdCBQQUdFX0NPUFkgaW4gdGhlCj5wcm90ZWN0aW9uX21hcCBpbnN0ZWFkIG9mIFBBR0VfU0hB
RE9XU1RBQ0s/CgpQUk9UX1JFQUQgaXMgcG9pbnRsZXNzIGhlcmUgYW5kIHJlZHVuZGFudC4gSSBo
YXZlbid0IGNoZWNrZWQgaWYgSSByZW1vdmUgaXQKd2hhdCBoYXBwZW5zLgoKYFZNX1NIQURPV19T
VEFDS2AgdGFrZXMgcHJlY2VkZW5jZSAodGFrZSBhIGxvb2sgYXQgcHRlX21rd3JpdGUgYW5kIHBt
ZF9ta3dyaXRlLgpPbmx5IHdheSBgVk1fU0hBRE9XX1NUQUNLYCBpcyBwb3NzaWJsZSBpbiB2bWZs
YWdzIGlzIHZpYSBgbWFwX3NoYWRvd19zdGFja2Agb3IKYGZvcmsvY2xvbmVgIG9uIGV4aXN0aW5n
IHRhc2sgd2l0aCBzaGFkb3cgc3RhY2sgZW5hYmxlZC4KCkluIGEgbnV0c2hlbGwgdXNlciBjYW4n
dCBzcGVjaWZ5IGBWTV9TSEFET1dfU1RBQ0tgIGRpcmVjdGx5IChpbmRpcmVjdGx5IHZpYQptYXBf
c2hhZG93X3N0YWNrIHN5c2NhbGwgb3IgZm9yay9jbG9uZSkgLiBCdXQgaWYgc2V0IGluIHZtYWZs
YWdzIHRoZW4gaXQnbGwKdGFrZSBwcmVjZWRlbmNlLgoKPgo+V291bGRuJ3QgYXZvaWRpbmcgVk1f
UkVBRCBhbHNvIGFsbG93IHVzIHRvIGdldCByaWQgb2YgdGhlIHVnbHkgaGFjayBpbgo+cHRlX21r
d3JpdGU/ICAoVk1fV1JJVEUgd291bGQgbmF0dXJhbGx5IHNlbGVjdCB0aGUgcmlnaHQgWFdSIGZs
YWdzLikKCj4KPj4gKwkJICAgICAgIFZNX1NIQURPV19TVEFDSyB8IFZNX1dSSVRFLCAwLCAmcG9w
dWxhdGUsIE5VTEwpOwo+PiArCW1tYXBfd3JpdGVfdW5sb2NrKG1tKTsKPj4gKwo+PiArU1lTQ0FM
TF9ERUZJTkUzKG1hcF9zaGFkb3dfc3RhY2ssIHVuc2lnbmVkIGxvbmcsIGFkZHIsIHVuc2lnbmVk
IGxvbmcsIHNpemUsIHVuc2lnbmVkIGludCwgZmxhZ3MpCj4+ICt7Cj4+IFsuLi5dCj4+ICsJaWYg
KGFkZHIgJiYgKGFkZHIgJiAoUEFHRV9TSVpFIC0gMSkpKQo+Cj5pZiAoIVBBR0VfQUxJR05FRChh
ZGRyKSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
