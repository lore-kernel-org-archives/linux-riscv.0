Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F12BC021BF
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 02:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QvSazbJ0YoUEt4HRXE/11pcrXWlqF3gv/vwb9Af8CyI=; b=kFCsLw5KNvhsES
	h5UhemEmjXJIyc3ogUwBGVg8LpAKRIiCjj0xXUO9IHD9yoQbCfv6o99YAL99R5wOuCOgiGep266YU
	40CP9waCqce4lcvcPqJzQ5nPoQJnoL+ra37OpeaOeGu4Y2c++yDSIY45vW0DEGataTDzmEVsJvnA8
	8Y9cysarc4hC/yo/UP/es2SYF2v1fk4oL5KhYD96A9adod5XKbqGhbyVpjicX4mfLydn5DoMOVH7a
	5i3eysDLYaGUb9o9BztE5e1z2y+3mlQ5XX3DhTiYqdfpi1HaMxDP1NmNqIW2/m8HiCPfd//3Nt9nl
	cVekBCOhNhDTy/W/Q1+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7MA-00000002CB5-307t;
	Wed, 26 Feb 2025 02:41:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7M8-00000002CAX-3oju
	for linux-riscv@bombadil.infradead.org;
	Wed, 26 Feb 2025 02:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=faw8k4TIY5A7eHVQZOGgzqUSa20esi5XC3jgrNGM418=; b=HsuZTonoXX+5yrSNnVRt7on46P
	e9XZF8ABBPURW4bTqOBlJWnFZiT7oS7mvUbBjbtM7KaaJT+4PjKecZblfj1BvhCdKv9IcyEgaKFYx
	9k5ATL7wc+DfIE8shLE7imsCQFoNqwNzN70r5sBh7b9MD52iaeFoQEgMnxXssOQ0dJNa3gENeTiEs
	mRnDlP23JrT9yFhAGro3oX39dA/7x9VSn3dDK2xGTDDBjUX6iHVidJIGqJkx4nD3/syNIyQwkPsXh
	8yctkz75O+C9uCfn4yLUJAcbxxcnak9b4/d35/M7U2ufbht8fJdzFXVwxOqY0nhUFpbuMynK44P33
	cPCYp3BA==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7M2-00000003Utq-1eLJ
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 02:41:02 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2fa8ada6662so12422552a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 18:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740537654; x=1741142454; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faw8k4TIY5A7eHVQZOGgzqUSa20esi5XC3jgrNGM418=;
        b=adTEbqWQuaMb5KvOhIDE2nDNNYo3I+4WUIyz39VKa2W6OdN/XEp7ycdhG5/hq19U3c
         UHckt29rq8Q1k4IP8iXxCAHruvyVzkQiVx7EO+tvATzxF0YCzrsimuB7kJEykqxidssR
         Y9m5DcQKejEqMKxrM2hLf5M4b9+r2zUFkXpgtOxNw/CEy1mk3C84NfFdoIjkXTwNGYN2
         e9nPOjZKlEyw6vA55adqHo/YA7UWD0zfQ02MKe6TWD3Getbc5u3/xLr9E7dLo0d1Gsn3
         s4UDaGqbekqi2W9MKaCcTzsY83q2688cxAg51zVl/5b5iNEwpfscJQjekK9xthRuffLa
         f1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740537654; x=1741142454;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=faw8k4TIY5A7eHVQZOGgzqUSa20esi5XC3jgrNGM418=;
        b=HoxQ9oKMDLXOLk687uxKj2bWrzk4TJ66OyWvKM9qa1bCGvHkIQJr9JcU2xhg1vDI8w
         fGEko38ZKO7bhH2ehMhO1MN5mBdFAx/wZLFiiS87VvHVmShedgGP1oIixRN/AZycM471
         7cZWQBWwJDOFNBrhzUW2uKhB0Qe2suT/lKivX8ZRvE/XApHLFTknb/7VcQvifhMBXUtF
         svZa47qC94Lxdwmn7fnQ9oVzuwj7MieUQs5dONMuTp3LSv544TCHNsLPAjojPb5/TyFr
         soil47iIOgnxptLKOIn0hnK4sm7EQUDUwgNQ6KaGEAp6NTBEWh0TbC/0gOGnJDh00Mup
         vIWg==
X-Forwarded-Encrypted: i=1; AJvYcCUV0Dd87KkWekPv9VzEybjRpVCQxCTV6CUukiol1/DcQgcBiksyP8ynYhgUoUc3vWKDVRTRCvcbExGf/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyI2Ay2k1USr+ghbtR6mnJB0AlaVpzXFOxuTX8LosFSVIptJU33
	3q3unHu5kKbnbp1pAO8Qh1OzGnr1DGh5rlerMv1xRSr7iZ9pFQk3d0s3y4Nh2Yw=
X-Gm-Gg: ASbGnctndmk1eSd/Hud3docQWEzcaGVxf+Vdhunwtede+HIvGHIRvj5nwkoL2Vs1/7A
	S5XrFfxplOnHL0k3B2eq2LjUIwo4NrUX+Ed25EtFNdeTkUz0COU8PZbGvJOhNlwLLaj7StOVws+
	TaWuhTP13wGThUF0KuqPmkuz9d0sDvnOc47biIM8IRBRjHA0PRbMXfT31LARRZ4uYgAjvs6EnsG
	95UaZCcQCEZ4L8e08zQrRd4XaA/A5q9vKYqANIYwXn+zcTXCLzVJODylyVLn6zUsO+UHc42Rsvg
	FfOhd7D5rHSDJJ2yHfE39DTDNniy5UcllnYRpOsF6DgLYHoU1w==
X-Google-Smtp-Source: AGHT+IGBavOro6p44pm0knw7epDm1Ms4/cRCm5nI7A9v1bvB0aFlwIUaa3TK9A89BXdQQHklrRCMwg==
X-Received: by 2002:a17:90b:2242:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-2fce868c4f9mr34212880a91.7.1740537654049;
        Tue, 25 Feb 2025 18:40:54 -0800 (PST)
Received: from [10.68.122.90] ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a000a01sm21742845ad.40.2025.02.25.18.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 18:40:53 -0800 (PST)
Message-ID: <3e3ab5b0-4669-4d7a-a7bd-6f5963662757@bytedance.com>
Date: Wed, 26 Feb 2025 10:40:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] x86: pgtable: convert to use tlb_remove_ptdesc()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com,
 vishal.moola@gmail.com, david@redhat.com, jannh@google.com,
 hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, arnd@arndb.de, dave.hansen@linux.intel.com,
 rppt@kernel.org, alexghiti@rivosinc.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, x86@kernel.org, linux-riscv@lists.infradead.org
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
 <36ad56b7e06fa4b17fb23c4fc650e8e0d72bb3cd.1740454179.git.zhengqi.arch@bytedance.com>
 <20250225183519.91a5b75b13c0df6954c68576@linux-foundation.org>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250225183519.91a5b75b13c0df6954c68576@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_024100_238886_979182B7 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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

CgpPbiAyLzI2LzI1IOS4iuWNiDEwOjM1LCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+IE9uIFR1ZSwg
MjUgRmViIDIwMjUgMTE6NDU6NTUgKzA4MDAgUWkgWmhlbmcgPHpoZW5ncWkuYXJjaEBieXRlZGFu
Y2UuY29tPiB3cm90ZToKPiAKPj4gVGhlIHg4NiBoYXMgYWxyZWFkeSBiZWVuIGNvbnZlcnRlZCB0
byB1c2Ugc3RydWN0IHB0ZGVzYywgc28gY29udmVydCBpdCB0bwo+PiB1c2UgdGxiX3JlbW92ZV9w
dGRlc2MoKSBpbnN0ZWFkIG9mIHRsYl9yZW1vdmVfdGFibGUoKS4KPj4KPiAKPiBUaGlzIGlzIGRl
cGVuZGVudCB1cG9uIFJpaydzIGEzNzI1OTczMmE3ZGMgKCJ4ODYvbW06IE1ha2UKPiBNTVVfR0FU
SEVSX1JDVV9UQUJMRV9GUkVFIHVuY29uZGl0aW9uYWwiKSBmcm9tIHRoZSB4ODYgdHJlZS4gIEkn
bGwgYWRkCgpZZXMuCgo+IFJpaydzIHBhdGNoIHRvIG1tLXVuc3RhYmxlIGFsc28gYW5kIHNoYWxs
IGZpZ3VyZSBpdCBvdXQgZHVyaW5nIHRoZQo+IG1lcmdlIHdpbmRvdy4KClRoYW5rcyEKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
