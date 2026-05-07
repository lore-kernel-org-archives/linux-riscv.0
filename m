Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C28CD3427
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 08:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3D+uaPfSSDUTRDiCHY+tULkeOejBBlN900FH/pQ4sZo=; b=VsmtzSrGkIOiA2
	mYdXixWRg/8l2XbWfI87Qeknrr9UPigUaqfMWGZmEofGsgtvNFg+vrHYiXJuSRwcpUia2droLIr5r
	xOJAjH3f0qxd7V8XnWVNsR+DCCQYOxZlFtLi+g2a2QFqjGAGjJ47QsDnkSU8BlBtO3Y9GySSMQ+pc
	C2KV+n2Nr/27gDLVEubA6TrOkQBr91Av347wQaghF/m8cs/snGUlGLLuytwzL8rkXQ4gFeW4xLGlQ
	nbiNxYJUESYb9Jl/8DSWHwqyWnLNsKd0B2T1FcEU7hf/q126irRXij9Vi7mWMrNP2+EUUA9YAd8O+
	9wR5xn7WG/aNmjJx5lpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuIW-00000003Cx5-2oYu;
	Thu, 07 May 2026 08:41:32 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuIT-00000003Cuw-1t8S
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 08:41:31 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-c822652f82aso377262a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 May 2026 01:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778143287; x=1778748087; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tYLd8a4rOgJ0HgA5aFHjScXvqopFgzBf/Pbs3wYF8a8=;
        b=ej2U1T871X7xAnfuXp3jCB/0CtLmoAPt0yLVPD98LEq+DyvGiml1Vr9qEMyBEWghsf
         CgbFbdL35C7Dachi4grlvMV3zBKQBfJgjZyO1cKag5QSdh94sY+x5dXDCyKRnXW7b1ze
         BtLcHc6Wy3KrB33IEesAiLOPtbQHS2kZnyrj4FfNmVtx55pxV2Q6xpCcz5kERDShuG1H
         PifSX6mfC9vH4q/MKMngJYt6DxQRahAqOy8euFbhzyFWHbAZYmbzFNXeVCV1zmmNPadN
         m7EJfiWjf2oAd9CysBVr+g67HEhwv8J+6Z/xf07zsTOllNS86IutCXc4sw5otl9Sr957
         rkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143287; x=1778748087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYLd8a4rOgJ0HgA5aFHjScXvqopFgzBf/Pbs3wYF8a8=;
        b=SoZK7xBeNcti2ZN0QAsVLncbWFceH8YuJs7t0mhul6rHP4CpyuXKrMBvcqSSIfyFB7
         hBdGx1wWZhekQWeVRmXQRPmPyUNM2/Vu0eWONi7x4gZfdS1d1YIab/y5alvAwAwMcZjE
         IPEOtIiQaba/cWOrleWStnZfMCNFF1XPNV/kKTsIeI2aaohwulFB/ovPJVTlLTxwepjn
         BcX5U8iBSbqEM3plQorL8UDMnfpeqsseJQXSHpQtlMv3JjsKevq8+23GdpWA+AnpMzgi
         m2SytEnNXWDjfvyxDFMg76H8DL/mY3GEk/t+X3b8xUG66Uv3DZPkF+nNYQ8Y63bQoTtm
         fAFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KwW/Kjd8k1V3Y5fm3zxjJBMk6Es/djVARGNL/KQjyhXdgfhuQHI4NpPXzN8DUSXgLRLdmYrhZdI559g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwO+fB+P1PSshkhHij/h5sapdqM2f5G2KU7hkTZwBQOnpWoV3gI
	TYqBJx2betpzJP/M8HZqxoQzpTcaDtxSJ4+8LrNzU9Xrdlo3KyJdHZla
X-Gm-Gg: AeBDiesWf5CCNV3dSy9wPozKVZ9OoGFkylK9oyW1Y3Puthp4tG6UW6ajBxufvczjv7R
	/M8gbsL3eE6pBwancXcoVVJFBVvXK+A/5u2qiBdYBllM3ua47j60dFxgRhMMBuG9sRIiTDMz/HL
	942FExtfm7TTH4r8Dn0lPK17gc73T4kHwOViUD2x7j++RT8E5/EjdjaFZyQII9qsiSJRwoUD8c5
	6h+dJVq0CaU3ED6pTp7PqwS6ypUzIAjTp3t6xfePpPucXFKz0gvIF6XrrG2WPqJK8i3QURP1Yqq
	8LJF0bB0Rim+8Q1O6L1b4WqV3z7sqfu1HiUEUS8DHPrmdgZhGVD/N225MJwYXaO7Dsv/bDDY749
	4jSrSDxBnYgZK9Td6CPWIeZt6njBqibOSIj15W3VZu/USh3pcBEaAvhS/mcdn5xrNghO1f+h3IQ
	s1H1XAj12VZ5z0CK+nTT0rHFJ+lRLoQqk8d7g/3kvNeQ==
X-Received: by 2002:a05:6a20:a106:b0:3a2:dc51:445 with SMTP id adf61e73a8af0-3aa5ab6853cmr7732684637.36.1778143287552;
        Thu, 07 May 2026 01:41:27 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253586c6asm1305583a12.4.2026.05.07.01.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:41:26 -0700 (PDT)
Message-ID: <126f4fd0-0a1c-41e0-8746-fa7ab85d6773@gmail.com>
Date: Thu, 7 May 2026 16:41:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] of: reserved_mem: fix region count for nodes with
 multiple reg entries
To: Rob Herring <robh@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, saravanak@kernel.org, chenwandun@lixiang.com,
 zhaomeijing@lixiang.com, everyzhao@126.com
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
 <20260429065831.1510858-2-chenwandun@lixiang.com>
 <20260506014752.GA280279-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260506014752.GA280279-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_014129_493944_9275C505 
X-CRM114-Status: GOOD (  14.05  )
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

CuWcqCAyMDI2LzUvNiAwOTo0NywgUm9iIEhlcnJpbmcg5YaZ6YGTOgo+IE9uIFdlZCwgQXByIDI5
LCAyMDI2IGF0IDAyOjU4OjIxUE0gKzA4MDAsIENoZW4gV2FuZHVuIHdyb3RlOgo+PiBXaGVuIGEg
cmVzZXJ2ZWQtbWVtb3J5IG5vZGUgY29udGFpbnMgbXVsdGlwbGUgcmVnIGVudHJpZXMgKGUuZy4s
Cj4+IHJlZyA9IDxiYXNlMSBzaXplMT4sIDxiYXNlMiBzaXplMj4pLCB0aGUgY291bnQgdXNlZCBm
b3IKPj4gdG90YWxfcmVzZXJ2ZWRfbWVtX2NudCBpcyB3cm9uZyBpbiB0d28gcGxhY2VzOgo+Pgo+
PiAxKSBfX3Jlc2VydmVkX21lbV9yZXNlcnZlX3JlZygpIHJldHVybnMgMCBvbiBzdWNjZXNzIHJl
Z2FyZGxlc3Mgb2YgaG93Cj4+ICAgICBtYW55IHJlZ2lvbnMgaXQgcmVzZXJ2ZWQgaW4gbWVtYmxv
Y2suIFRoZSBjYWxsZXIgaW4KPj4gICAgIGZkdF9zY2FuX3Jlc2VydmVkX21lbSgpIHRoZW4gaW5j
cmVtZW50cyBjb3VudCBieSBqdXN0IDEuCj4gSnVzdCB0byBtYWtlIHN1cmUsIG1vcmUgdGhhbiAx
IHdvcmtlZCBiZWZvcmUgdGhlIHJlZmVyZW5jZWQgY29tbWl0cz8gSXQKPiB3b3VsZCBiZSBlYXNp
ZXIgdG8ganVzdCBkZWZpbmUgd2Ugb25seSBleHBlY3Qvc3VwcG9ydCAxIGVudHJ5LgpMb29raW5n
IGF0IHRoZSBwcmUtOGE2ZTAyZDBjMDBlIGNvZGUsIF9fcmVzZXJ2ZWRfbWVtX3Jlc2VydmVfcmVn
KCkKcmVzZXJ2ZWQgbWVtYmxvY2sgbWVtb3J5IGZvciBhbGwgcmVnwqBlbnRyaWVzLCBidXQgb25s
eSBjYWxsZWQKZmR0X3Jlc2VydmVkX21lbV9zYXZlX25vZGUoKSBmb3IgdGhlIGZpcnN0IG9uZSAo
Z3VhcmRlZCBieSBhbiAnaWYgCihmaXJzdCknIGZsYWcpLgoKU28gbXVsdGlwbGUgcmVnIGVudHJp
ZXPCoHdlcmUgbmV2ZXIgZnVsbHkgc3VwcG9ydGVkOiBzdWJzZXF1ZW50IGVudHJpZXMKZ290IHRo
ZWlyIG1lbW9yeSByZXNlcnZlZCBpbiBtZW1ibG9jaywgYnV0IHRoZWlyIG1ldGFkYXRhIHdhcyBs
b3N0CmFuZCBkcml2ZXItc3BlY2lmaWMgaW5pdCBjYWxsYmFja3Mgd2VyZSBuZXZlciBpbnZva2Vk
IGZvciB0aGVtLgoKVGhlIHJlZmVyZW5jZWQgY29tbWl0cyBtYWRlIHRoaXMgd29yc2UgYnkgYWxz
byBicmVha2luZyB0aGUgY291bnQKdHJhY2tpbmcsIGJ1dCB0aGUgcm9vdCBsaW1pdGF0aW9uIHBy
ZWRhdGVzIHRoZW0uCgpJIHN1cHBvcnQgZG9jdW1lbnRpbmcgIm9ubHkgMSBlbnRyeSBzdXBwb3J0
ZWQiIGJhc2VkIG9uIHRoZQpmb2xsb3dpbmfCoHJlYXNvbnM6CgogwqAgLSBvZl9yZXNlcnZlZF9t
ZW1fbG9va3VwKCkgZG9lcyBhIG5hbWUtYmFzZWQgbGluZWFyIHNjYW4gYW5kIHJldHVybnMKIMKg
IMKgIHRoZSAqZmlyc3QqIG1hdGNoaW5nIGVudHJ5LiBBIG5vZGUgd2l0aCBOIHJlZyBlbnRyaWVz
IHdvdWxkIGNyZWF0ZQogwqAgwqAgTiBlbnRyaWVzIHdpdGggaWRlbnRpY2FsIG5hbWVzOyBlbnRy
aWVzIFsxLi5OLTFdIGFyZSBwZXJtYW5lbnRseQogwqAgwqAgdW5yZWFjaGFibGUgdmlhIGxvb2t1
cC4KCiDCoCAtIERyaXZlcnMgbGlrZSBDTUEgYW5kIERNQSBjb2hlcmVudCBhcmUgZGVzaWduZWQg
dG8gaW5pdGlhbGl6ZSBhCiDCoCDCoCBzaW5nbGUgY29udGlndW91cyBwb29sIHBlciBub2RlX2lu
aXQgY2FsbC4gQ2FsbGluZyBub2RlX2luaXQKIMKgIMKgIG11bHRpcGxlIHRpbWVzIHdpdGggdGhl
IHNhbWUgRkRUIG5vZGUgaXMgbm90IGEgc3VwcG9ydGVkIHVzYWdlLgoKCj4KPj4gMikgZmR0X3Nj
YW5fcmVzZXJ2ZWRfbWVtX2xhdGUoKSB1c2VzIG9mX2ZsYXRfZHRfZ2V0X2FkZHJfc2l6ZSgpIHdo
aWNoCj4+ICAgICBvbmx5IHJlYWRzIHRoZSBmaXJzdCByZWcgZW50cnkuIFN1YnNlcXVlbnQgZW50
cmllcyBhcmUgbmV2ZXIKPj4gICAgIGluaXRpYWxpemVkIHZpYSBmZHRfaW5pdF9yZXNlcnZlZF9t
ZW1fbm9kZSgpLCBzbyB0aGVpciBtZXRhZGF0YSBpcwo+PiAgICAgbG9zdC4KPj4KPj4gRml4IGJv
dGggaXNzdWVzOgo+PiAgIC0gTWFrZSBfX3Jlc2VydmVkX21lbV9yZXNlcnZlX3JlZygpIHJldHVy
biB0aGUgYWN0dWFsIG51bWJlciBvZgo+PiAgICAgcmVnaW9ucyBzdWNjZXNzZnVsbHkgcmVzZXJ2
ZWQuIFVwZGF0ZSB0aGUgY2FsbGVyIHRvIGFjY3VtdWxhdGUKPj4gICAgIHRoZSByZXR1cm5lZCBj
b3VudC4KPj4gICAtIFJld3JpdGUgZmR0X3NjYW5fcmVzZXJ2ZWRfbWVtX2xhdGUoKSB0byB1c2UK
Pj4gICAgIG9mX2ZsYXRfZHRfZ2V0X2FkZHJfc2l6ZV9wcm9wKCkgYW5kIGl0ZXJhdGUgYWxsIHJl
ZyBlbnRyaWVzLAo+PiAgICAgaW5pdGlhbGl6aW5nIGVhY2ggb25lIHZpYSBmZHRfaW5pdF9yZXNl
cnZlZF9tZW1fbm9kZSgpLgo+Pgo+PiBGaXhlczogOGE2ZTAyZDBjMDBlICgib2Y6IHJlc2VydmVk
X21lbTogUmVzdHJ1Y3R1cmUgaG93IHRoZSByZXNlcnZlZCBtZW1vcnkgcmVnaW9ucyBhcmUgcHJv
Y2Vzc2VkIikKPj4gRml4ZXM6IDAwYzlhNDUyYTIzNSAoIm9mOiByZXNlcnZlZF9tZW06IEFkZCBj
b2RlIHRvIGR5bmFtaWNhbGx5IGFsbG9jYXRlIHJlc2VydmVkX21lbSBhcnJheSIpCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
