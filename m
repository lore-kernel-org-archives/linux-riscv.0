Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3C1CA5FA7
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 16:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eR6FhkPS8xlC9TvhYfA1er38cxHW04SXDL0Jnrkh6ds=; b=UyF/ehd+Sn7SwX
	x6SkHstQjHGRDtqByd2zvtmsCcVoRYJijhB2LMKiDcAC9CWN/LbQeaXFCUAzx6VwV4ZCiQXIrCpWF
	Cusjav/Z0uFrx44M2BwOw7hJxv9xvuPRdSGwRl9TLMqvPhDFtEipjq5z1NqDc5/eREBDi0g1Neagh
	MB1tj+CyTuNStaPjaT4Qzi9QQLOxeFHrY6hfGoHmjeRg6NK2bSnKAx/FVJ3IQy8KOq84skryhoL7J
	aDm/FYfxVroWIHrS9nUrYadk8MtLp+yW6FFB8L4FEbSDNTR+PY7euKx1D4/u+7UbES3KF2+6qNiLM
	d/XFsofZFUBmqPHIctaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBajL-000000043lM-2CeT;
	Tue, 29 Sep 2026 16:30:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBajK-000000043kl-16c6
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Sep 2026 16:30:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Vn3/Z2DdvynqvHJ/P+ee00azyAyRLA5sp7pyzKMdaqg=; b=Z7biyU8T3/ZKmKedIWqGYHXJr/
	3O9pUDhATopEaaoq+heQ7mJhLsLMEWaqiS6ohRZMwPYMiJOlydJBprN1H5v9InTif7MxwbuyIz/s3
	BYKsAEsRLSbP35Gj6wUcqdewwZEEPZ4dl4fhMIzvhUwxjD5op4krijuCg7Lt/JSEMvkCl4lFMjBFj
	VlQBWR9agHGDay2yNzV4B4Uh1L+IAGRIA9SIIBgZwfIcaYHjACCaeywDdHOxDDwZsBwTqaRGXf0q1
	BRBv204q4G6YfsqF9/oimo6P6UM/+ZxUe7ozhYeggfaZSPE5QYc1skysLmFMqkKTrBIOircGSXQQm
	JYmSzJmg==;
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBajH-00000002qoJ-0PUL
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 16:30:57 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2157A40264
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 16:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1790699453;
	bh=Vn3/Z2DdvynqvHJ/P+ee00azyAyRLA5sp7pyzKMdaqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=F93ajY+17xMPVWY0RKWQEtIOTnd/V8JSALoUkpyO6X5gwggAEmXev7MUzo0Zp10gN
	 6/QwQSKfjzrbk3+YwWiUQY8ZW7P63ktVo032pBKe72V1ybUR1HNq4WRcJHcesQmqFi
	 sPoVcuoKjn3XKw9kOdzuX11BWy+hOManHW0k0Io0nfIq+s/7YEzuzKLWJtdbKiyEWo
	 BZql7t5qdeXXmPsANUJ71+dV6HON0SrG4XpBxHblyNQ1aFlwWi++BGQHoFIFyCTftl
	 0eGJ4qpMo8u+BIFp+/U9hKkiE1bN51oxOFq9TkGZWVTeQ7TnaYpIlwEfhfdav5ct/N
	 ll64Ff2vtF5YlAUbLpYEjEhg86YubTHuDEQwLJterMdkRKDyNY8kQs5sShXFHW3u+0
	 f2U4/fbK0Lr7B5ZX00Szic/5DuV5h08/FQZnJQYgZimZklfJfTMhFZGDCa2Cqja7/A
	 Wu4ANlpa/XA2piv6q3L6juOE/s6pTH/VzraMzjcrVUML4pDq9wSPw6+u8n7s1799YD
	 NrXY5dpZHAfONxh07VqvpGE6WfUHgL3CtaB1u/jV2U2naYSNF/1bY5BUlortP9PxqL
	 imLovw0bgRnUe1AZQZNGkX4+VqavKU2Y/B3DlLGTUSmswaMCBIfjEOnGSEIVOVfLuu
	 gVlws5dW/MhQnXSsi+u2/SNQ=
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49cdc4080ddso6581365e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 09:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699453; x=1791304253;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vn3/Z2DdvynqvHJ/P+ee00azyAyRLA5sp7pyzKMdaqg=;
        b=kSAEtBPu43eb9vKVaXQ0iYmbduxkjenGP1fKGaZ50Osw8Ldyx6zkdpq5FeJR53nZqy
         kVHlE8JnZpYfepLqOVC4AGhYPcOsQyXXQk0RZEnYwK32EUqFWLE+b90DmmoplxabKaqY
         x5DyQlBwv83qHKFoGWdxnPZvqLiMWjgIB1+xKzMAnjQAt5qYJBpO5DHMgwIBIYZNoh1k
         sTTlYn70vsZMwywBLKgTRv/Y/m+43YNnAbDbuNrOE8hG67IoR6dpZ53E4JZTq+b8h2ai
         dDfYlR3xX+7uL4Us+iCwbDLiziaVOPE1TyDn5E8mDtcnggMkoxMeyh/i4tT0Lvd/an3Q
         BJBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIg/7TXYP09mtxiGB8mQbfH3hXPuQ501+rMiv3dHiY+ZYaU/aBmennE/TKiEW5FSsjYohKJhim3Qd6Qg==@lists.infradead.org
X-Gm-Message-State: AFuF++nj5kyczh7dbb9yt3IDM5D/nwye4JOsAsuoSQ5KyJ2GteA2RDEb
	XvQig6vzCWiZJ/R6X6NdeP8G0av+ni8QIFPSbgX9QWhDZ13sIcfv5emva/d2QU5idP6EKbJV5+D
	5jvus5uPyBVBRUQF38gotQf4/pAuABzsxNJxQ2dCGEoxTwePPvcZD12uUkLwaQb6wk31Zww9E50
	6M/3nl18/1uw==
X-Gm-Gg: AYBFou2GD0r2Szb9fK81asoZcY29ES7mJNv9C1QueKMAV9p6HMnKvvVBYHyfQrNsoAf
	4pxVAvau8jkt3HrnHUzPvKd0xano81gn3pfH+TnLxjpJpoVyo40ZZme+74p6bN51mcSznU6EcnI
	pdeP/JU7ysFHnFkqvd+p9UPRyBB0VdlXmN496v0BtVc0pUPzRzUahclrqOmGSvOeJN21si/HcHA
	4sRHOJbnoFjzcWbxctVB5oDE53tqTZjZ9riLdcx+2MCz1Sp8epcFvZzD2RmiNGEI1HsTGPsLM7U
	Wc/KwL8DhJHgafsAUslc1iL13dbv61GXZUEFcesu/z3eeeEdhlPVNa/u5yAmZoIIUaLPkdA5VGy
	7XNA0Ys60/ltf4YFPwPjy8cV1GaNJMA2N6Kkk+OiUc9NfaPlUNzxbVZ2fRyJs0iNxfNGNlrPlj5
	EEU3TA267R9e1c+BckQWkySA==
X-Received: by 2002:a05:600c:8b10:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a00d780b78mr58589675e9.17.1790699452751;
        Tue, 29 Sep 2026 09:30:52 -0700 (PDT)
X-Received: by 2002:a05:600c:8b10:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a00d780b78mr58589205e9.17.1790699452395;
        Tue, 29 Sep 2026 09:30:52 -0700 (PDT)
Received: from ?IPV6:2a02:908:1242:30e0:769:5000:73ee:deb3? ([2a02:908:1242:30e0:769:5000:73ee:deb3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9dfdbsm130957335e9.1.2026.09.29.09.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:30:51 -0700 (PDT)
Message-ID: <70a3451c-db31-41d0-af9d-8c9e123557f6@canonical.com>
Date: Tue, 29 Sep 2026 18:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
To: Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
 Peter Bergner <bergner@oss.tenstorrent.com>,
 Zihong Yao <zihong.plct@isrc.iscas.ac.cn>, Mark Harris <mark.hsj@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Conor Dooley <conor.dooley@microchip.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>,
 Guodong Xu <guodong.xu@oss.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
 <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
 <15151b8ab012ca7444d4117e393cf999.guodong.xu@oss.qualcomm.com>
 <DLRWB8R7P6SF.1XIL0OXLZ2F23@qti.qualcomm.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <DLRWB8R7P6SF.1XIL0OXLZ2F23@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_173055_644898_944A2D3F 
X-CRM114-Status: GOOD (  25.02  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 9/29/26 17:12, Radim Krcmar wrote:
> 2026-09-24T06:38:17-04:00, Guodong Xu <guodong.xu@oss.qualcomm.com>:
>> On Mon, 21 Sep 2026 16:24:53 +0200, Heinrich Schuchardt wrote:
>>> On 9/20/26 09:18, Guodong Xu wrote:
>>>> [ ... ]
>>>>    	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
>>>>    	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
>>>> +	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
>>>
>>> Hello Guodong,
>>>
>>> The RISC-V Unpriviledged ISA specification has this description of
>>> extension B:
>>>
>>> "The B standard extension comprises instructions provided by the Zba,
>>> Zbb, and Zbs extensions."
>>>
>>> __RISCV_ISA_EXT_SUPERSET would imply that something else but
>>> riscv_b_exts is in B. But such an extra seems not to exist.
>>>
>>> So shouldn't __RISCV_ISA_EXT_BUNDLE be used here? Some code further
>>> change may be needed to set extension B if riscv_b_exts is fulfilled.
>>
>> Thanks for the review. Intentional, and the difference between the two
>> macros is whether the extension gets a bit of its own.
>>
>> __RISCV_ISA_EXT_BUNDLE carries RISCV_ISA_EXT_INVALID as its id: parsing
>> the name only sets the bits of its parts. That fits zk, zkn names, which
>> are shorthands with no identity of their own beyond the ISA string.
>>
>> B is different: it is a single-letter standard extension with its own
>> misa bit (in the same way as A), and AT_HWCAP on RISC-V is the bitmask
>> of exactly those single letters, so the kernel needs a bit for B itself.
>>
>> A is declared the same way; with the spec defines A in the same words as
>> B. If I can take that as a precedence.
>>
>> IMHO, "superset" in this table means "also sets these subset bits", not
>> "contains something extra".
> 
> Zba, Zbb, and Zbs are equivalent to B for our purposes.
> 
> Are we sure that B will always be listed in the ISA string when Zba,
> Zbb, and Zbs are present?
> 
> We could incorrectly lose RVA23U64 bit otherwise, and I think this was
> Heinrich's concern as well...
> 
> (The "A" extension has the same issue...)
> 
> Thanks.

If Zba, Zbb, and Zbs are present the kernel should set the B flag in 
hwprobe. This is why RISCV_ISA_EXT_SUPERSET() cannot be used to describe 
the B extension. RISCV_ISA_EXT_BUNDLE looks more appropriate but may 
lack functionality.

RVA23U64 looks like an RISCV_ISA_EXT_BUNDLE() to me, too.

Unfortunately these macros are not properly documented.

It would be helpful to first align on the meaning and usage of the 
macros and document them properly.

---

The benefit of an additional hwprobe flags for B is limited. When I want 
to check for B I can already use:

RISCV_HWPROBE_EXT_B =
RISCV_HWPROBE_EXT_ZBA | RISCV_HWPROBE_EXT_ZBB | RISCV_HWPROBE_EXT_ZBS;

if ((value & RISCV_HWPROBE_EXT_B) == RISCV_HWPROBE_EXT_B) {
	// Hurray, I have the B extension.
}

There is more utility in the RVA23U64 flag because it combines values 
from RISCV_HWPROBE_KEY_BASE_BEHAVIOR, RISCV_HWPROBE_KEY_IMA_EXT_0, and 
RISCV_HWPROBE_KEY_IMA_EXT_1.

Best regards

Heinrich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
