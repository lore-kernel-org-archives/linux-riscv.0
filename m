Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78740C98325
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHNU5XfrWZ/PVn84V0b76W1lxGZ9A0z1G7fOtymdMVE=; b=gcPzp1+tuOYb0x
	NfA7D2dsSX+r7/SNoRe8dSzoY+ReKTuD5b1BFbOPWV1Gfuqn7i3UOgkg8LdvlmRwZ0F1oc3SdjQ8E
	a6nCBTbtdh/rF3gZ2DcUzsiW0QZHYcA/1y79onqDXFDDsd7KJ6yiPQfS4IEYG6k6ndKw35eeqSa1u
	rBalfcO6rOt/I1110V4X8DknvBikG8uQUXHFX24YCDl7npvgb4+tLFevD3Ha3mwt7IUZsptNYdQmH
	yq/xVt/YwDyFv5kOx5d6gq8FapGBjlSGKtLkC6uX/P0PY5yJ37CoPn3hek2tQg7uyG+9sBQ1rLkZu
	/NtBUCLEsTx7hiLKsXGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8Ct-0000000DrGD-3n1s;
	Fri, 25 Sep 2026 15:51:27 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8Cq-0000000DrF6-43rX
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:51:26 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d3920so8079735e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790351482; cv=none;
        d=google.com; s=arc-20260327;
        b=NXmOIWywoEvL8KiJIyUAWIQK6lBHerG223Y8jTBDVJusdl4PDVAqoHVIHU/R72EbnZ
         OZDR8MlSAZJFXCQ85eoaM4I6dZFU4dasiOWHnmW16f+Rq7tqlowEuCbhLcUfh1i9jWSO
         XNcomAmM+jBLUNQVXLsfY/lOVeU8/M3VwwlmU1hxcxjHcdIwnSaTUIzHZ/wYxvgZMXMG
         T0ujD33bxKI/EQgdQJ1bRYjNLg/IUf1I3s1CckyKMqpfBJdao3fbQtuFc2sRt/iOYahl
         QXKdUvrbeRmgVr6I6gLtvMpkbjoUdFi7OdrAHKG/0rlqSQnogXd/CfSGNxwqEsFgbRLU
         MHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v7p/CXRNed6Ee5EzOeUUhXw4TYzwEpF8rokaKaV5e+Q=;
        fh=cvBQ7SQQp5XABBbkqMsxg/TrtBzCU5Ish3hmBsXL8YA=;
        b=IpqNKNXaDgKbTg0t5KGrSV4jQwdgl8oVlGPfl3KLVBJ2sKWZqFFq6/KqmWKRzv35i3
         bGVToen9LaHU8alhLKHyGRFZRNIu5M+DVZ10E7qogTQ0Ntctwe8zlp0RLZf6knft5a0Z
         R65Csjee7xClCWizSS8ZpTCxR+VybVukOj9qrtItGnvasGaN17Y0KJ0ZcWiSTXGRO19J
         7tC5NZVGf2TPGdPb+TwAYn6mOrmnr0jdfKvIsnqaH+hE+0chOuoO8OGYxV9qUH4Keq4S
         +sS1bYctCQ4iAzSoFLhXIGOqZlYtyaSne2HRzEM9pEtb78iQXSI07FNxjux7L2dzeYE/
         U4Pg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790351482; x=1790956282; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v7p/CXRNed6Ee5EzOeUUhXw4TYzwEpF8rokaKaV5e+Q=;
        b=UGj73pWnM1FK+CmiNqCAX0tOcMFT2bVFi8EwnDPMkmhjHqriZwcgW8qA2m5pdhULi5
         iEe8HuQckAWPYKZ5vodWSj+wTFOG7tDW/7rSsMKFUGWBNmOl6AkD725SQZpvuUxxOVKQ
         KAk/3MLaO7bbV3gLaYtIVSapp9NW/0VzZTt2AlXQGp4CEzz49V5arSu7I9Dwv7q/qEkN
         DARH514ogOoe1xweGKsPZsOukZPWWFBCLeWtLHWUhg7G5fv38xO9rXe5tm+zkXPIISmQ
         VDCA5FjOxSn5WzMAZYR7OT+o8Br4vMdKyL4M81SlyIlo8Dba6PNubyjww7fFQ7713iPY
         lkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351482; x=1790956282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7p/CXRNed6Ee5EzOeUUhXw4TYzwEpF8rokaKaV5e+Q=;
        b=xdJJ/4+6IlC/z4wO0AwFywEYZAq8pqVl2CuCfWgViEfUnRwRJKUCCOWx+VcbgKBIM7
         vXInf4lTb4D92BwizIUWFMDo/dWOfyUP4BWIiZLHWptFgDQ9kS1NDsSxRzylZKDUCWKv
         bwdEo0UVX3oiG/UtEV9bGxQQsBg/KI5yF1Q7nAmxQpMC+QPPoAp85KST0BMYMjUck+sJ
         3+HsGdWUItS1gQNqQq/tSjSXnJ4JQOHOoqg3QkSGGJm4hF6/4RkPdj4kNYM954VJ2sg6
         UHO825rYbBhN5rXbLporwOZfcgCJ+MsARx9ppMzcUYAiiTTXoW4Ds6ERBtUnD/Nhnhn/
         gXFg==
X-Gm-Message-State: AFuF++lh5/CHRmHRPaxkEh8YN6OsjvI/rPF43+OtCAULcaIFnpWRb1gq
	7z92w7i3c3n+kI2rzCBm15LUXxSqz76WqGDtYOhgM03YhViKf6mHiiD6ncNJBUNgqkRlV4+HNbN
	DBs0QQvsIPZaWXgH9UEhz2ZM5ncCl3AOSuFgjREVqNQ==
X-Gm-Gg: AYBFou0WsHxnP8Wd2vxIBLCW0XOksni475CkGTKYjKZGuJHEZWFjA8GlFBorHQSUjRs
	ITi01mVg6HQvdfNH5AvWrEOPDbYp8duUFuBPjmsuxUh/JDM5jPM7Y5gLjZwJWWiLMMsKp2IGktC
	Jv97JGumloPuIF2N2XC+LIMu8ujm9TIgzenKX0pmWkncMl4TAgw83fM5Y9qAsPKnSD16+7XycMY
	qDBMBZ57sUNeH+7ttdLQdW18HExj5pH2Fu78QwjdY9pFuVTVVN3r+HStJ51D2qgyBYYjtvTvZZc
	U6GtnflLEVhISVqv4mBbGLGxlpisqcT9ZUM1cv2975jcUdobNZ8No9+QvQtPCDfIsCnu0AwZP2z
	tjkp1ymLUbaAmj1ApyxFt8sbUzJpL6AlPGcAqT95ad6J9KO07j20htMpFjGnz7bqNmnLuzPa3kk
	w=
X-Received: by 2002:a5d:5888:0:b0:488:57ad:d5c8 with SMTP id
 ffacd0b85a97d-4887171423cmr11459377f8f.3.1790351482096; Fri, 25 Sep 2026
 08:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com> <20260925151659.419512-15-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260925151659.419512-15-andrew.jones@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 25 Sep 2026 21:21:09 +0530
X-Gm-Features: AclHuK-IHMdTsA8jz2IcBn7rlhmgx5DYTuZzwV1GUkqdkciiE-3lPooZDFeq3zM
Message-ID: <CAAhSdy2WLpd7rA0+cUi-oLgDePsZV_4zr4v8rnxp=y=RkObuCA@mail.gmail.com>
Subject: Re: [PATCH v6 14/16] RISC-V: KVM: Enable KVM_VFIO interfaces on
 RISC-V arch
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev, tjeznach@rivosinc.com, 
	jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com, tglx@kernel.org, 
	kevin.tian@intel.com, fangyu.yu@linux.alibaba.com, 
	Nutty Liu <nutty.liu@hotmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_085125_032889_BD86E850 
X-CRM114-Status: GOOD (  14.01  )
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

T24gRnJpLCBTZXAgMjUsIDIwMjYgYXQgODo0N+KAr1BNIEFuZHJldyBKb25lcwo8YW5kcmV3Lmpv
bmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogVG9tYXN6IEplem5hY2ggPHRq
ZXpuYWNoQHJpdm9zaW5jLmNvbT4KPgo+IEVuYWJsZSBLVk0vVkZJTyBzdXBwb3J0IG9uIFJJU0Mt
ViBhcmNoaXRlY3R1cmUsIG5vdyB0aGF0IFZGSU8gZGV2aWNlCj4gYXNzaWdubWVudCBpcyBhdmFp
bGFibGUgb24gUklTQy1WIHRocm91Z2ggVkZJT19JT01NVV9UWVBFMSwgc28gYQo+IFJJU0MtViBL
Vk0gZ3Vlc3QgY2FuIGJlIG5vdGlmaWVkIGFib3V0IFZGSU8tYXNzaWduZWQgZGV2aWNlcy4KPgo+
IFNpZ25lZC1vZmYtYnk6IFRvbWFzeiBKZXpuYWNoIDx0amV6bmFjaEByaXZvc2luYy5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9uZXNAb3NzLnF1YWxjb21tLmNv
bT4KPiBSZXZpZXdlZC1ieTogTnV0dHkgTGl1IDxudXR0eS5saXVAaG90bWFpbC5jb20+Cj4gVGVz
dGVkLWJ5OiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KCkxHTVQuCgpS
ZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KQWNrZWQtYnk6IEFu
dXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFy
Y2gvcmlzY3Yva3ZtL0tjb25maWcgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vS2NvbmZpZyBiL2FyY2gvcmlzY3Yv
a3ZtL0tjb25maWcKPiBpbmRleCBlYzJjZWUwYTM5ZTAuLjQ5MTc5YWFlOTUwNCAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2t2bS9LY29uZmlnCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vS2NvbmZp
Zwo+IEBAIC0yOSw2ICsyOSw3IEBAIGNvbmZpZyBLVk0KPiAgICAgICAgIHNlbGVjdCBLVk1fR0VO
RVJJQ19ESVJUWUxPR19SRUFEX1BST1RFQ1QKPiAgICAgICAgIHNlbGVjdCBLVk1fR0VORVJJQ19I
QVJEV0FSRV9FTkFCTElORwo+ICAgICAgICAgc2VsZWN0IEtWTV9NTUlPCj4gKyAgICAgICBzZWxl
Y3QgS1ZNX1ZGSU8KPiAgICAgICAgIHNlbGVjdCBWSVJUX1hGRVJfVE9fR1VFU1RfV09SSwo+ICAg
ICAgICAgc2VsZWN0IFNDSEVEX0lORk8KPiAgICAgICAgIHNlbGVjdCBHVUVTVF9QRVJGX0VWRU5U
UyBpZiBQRVJGX0VWRU5UUwo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
