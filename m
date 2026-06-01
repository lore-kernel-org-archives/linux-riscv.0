Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B772FCD6E4C
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 06:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8robwSTeGHyqFfjflZejMb9W+LyvtO/lTU57umIBOfw=; b=u6nNzgzlZd9Uuu
	9mCKfHb4aXrbd2hsaO1FRsRE1uJyDqYNLSX31zc28KpfcNyeMWqUwT8D3iTCc+mt+k/hZuVRKccfW
	UWnSWVCfMHEG4DZRO967W8+2Lf1yInxeNeS1fq89vmlmwqYP/1VtC0P7A49AeNJ2sLgx681snRD78
	qQaoWCHp1FHg/aAzUaVJkE8K/kEBe95w8xwEwNdj+1JnMcAuLuLheULGNbwBH5nOfODkk8dGt89yC
	eK1o2LCB7pAZugC0tEEOvgHsdtoc6Tdxebfowi0abuC+jjtiI3pMxtQOJeNzA8g5Z/TPOoLT4luaZ
	uWb9rZ9s3qfuwn3fiPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTw3X-0000000ACNb-2Sqg;
	Mon, 01 Jun 2026 06:23:23 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTw3V-0000000ACMP-1BFj
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 06:23:22 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7e6b571750bso902904a34.1
        for <linux-riscv@lists.infradead.org>; Sun, 31 May 2026 23:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780295000; cv=none;
        d=google.com; s=arc-20240605;
        b=OdvkCfhpeu8RFSOGTDbQgBPeEsfVS7VMck5Haj2Jf09dwb+rKai8/sfSCQBoytc4Yk
         vhBUp2KiMI+aQj9MJ/sjXtLFgBg7Ri7BS2eXJK0DfgIog29+ohlR47HajQZH54bJnBVA
         VslheqO996Hu6y9ipv7UFEzZ6NiSMyhLcLbt87kM575Pu9E0n8XZMg2K/Zww57UNZd16
         UtFouxtYzTOXKCFRUyXfAZg05O0yD7K2cSxPPt0TJ2vJbN/mcVbKkVVD4ehQJAhK8cNW
         cABjE+0GCY29OIgcBIi8IUs5niyDOOTYNJ98EYl365wMU6Xwcf07FZSyOmQlkM8Duxt1
         m6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iz7SBrm1vl57dsqbfyKBrpGP7ySQe0QBEwPa7zAZwY8=;
        fh=Ud67uaRi2Pd/ZMQXo3r9+jFf+6xj9nEiq4/NqReZWEg=;
        b=UHue/dsmLrHyFz7KK6DE/0pqFIM6B1YadtnXEzh5TZfdM4DXazxUrRXqAdMbkej6pm
         rg53ZgO4jUp77DfPHbo9FO6kjPQkv7mTsCHOr7Ix+/g2Dms05se6v+zf6UnZQjBOqGKY
         XJO5IUY1I6/B7aVQ3vzQTrSbN0XHJcLrop7yFyVusfEpDWPhZSgCMWQ0HcLPZj37jHWx
         y/h38qbKXoQikPue7SKm+lao9dcX0oyfvEz2GEMZTyFDZeobgtkaJhMNx5AyqB5e7F0F
         p2s6yFoRl6VX0BVWjg8cZTfsRX3J6Fe1nuUzmq8vW9OrJZWuLXb9+sGIGjkYkzsQpUCX
         /ntA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780295000; x=1780899800; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iz7SBrm1vl57dsqbfyKBrpGP7ySQe0QBEwPa7zAZwY8=;
        b=eXZ4u0Tj92rxezndxzGk+8ANtoIsD0sUnJ6aU3TvGL9s80+OpNkmz9yLFigoh1qYg4
         3zO4qMNTGCHEdM3EtFkyZLnle0VkXUy6B3QKsqqVvVDTqDH2u2E2C6eGgSogBNB3X67U
         VJKB4V3cZRlnCkwL2wJxnTbpTrUM6YS2VmiWI8UKk0P/gzodmClylqYKoxlQa5sZM6xy
         TneiR7fWSlGdlrsHpF1C+6FTotK2CQUTFW7VapJ3BozCp4wxLb6X9fTTKEqpygvVATUA
         r67qPJLlyj5qlTeFnEQ+q92lgn4Pes7+VRJIHvydUJug7jfmW/y2e7I02sPM4uMfky4Y
         Aftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780295000; x=1780899800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iz7SBrm1vl57dsqbfyKBrpGP7ySQe0QBEwPa7zAZwY8=;
        b=asZCaZ2Qu6o9KITKvUBMzzAt40vYskdet8IHuAUx/gwTqQlVKCw+t/BgEN0V6Lc9FV
         muZPuoc0eW3IHBYHM+YZcbgx0Ub2bPsI9pZgEdx9oWbBpG+Gsn1avE9Vw8cdsrdgy8ia
         Cvy27yAZ7DG00DSWlQiKXViwhc0weBihDf5yyM3pOLTejFBaMEsZbtBELZit+2Ka8mZq
         9zmGe3L6Fo4ty30D4zr9coZjueEeJ+QoT2xEzBlUcE2Vt/J7IA/GQXxD/c035iblHpDA
         tBc88+SfRdj2xaEqZ9zcGEdHMliqn/W5L9HNsfTtavlMNvRs1WAxQeDMGhoThMrfRSG6
         Jbvw==
X-Forwarded-Encrypted: i=1; AFNElJ8iNtOd9s6WEM6emFc8UuOMcUfgmLWqvQJ+QROjjm8DijjPAriWNQFz2frN7+eFQ58F+auzQ70Ct9zpJA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6un+1r2c31iKLhBPBq8ZAJNJGT+B1TW+hLq586BZxUvPG3F17
	j7cCxKWops55Lh8lArIlwn5CLH2xEPR9AwcJBtLTyCDHb6bC+GsJ3U4yhZfhYNQ6BztF0E3G1dG
	9N1HwwZDGVgnz25ywQDY7pR2o/BGjmLvzjosOd6UHuA==
X-Gm-Gg: Acq92OFbRBSJjtKcWgudSH4IxaHtOwPUDqZVC9N1o6pVNT9N+HEqU/9RURSyl3XsNDB
	FV3SHAEzrpSfjdOTWQBklcmcHSxwZqAOTVvZgp0nGL6tls8oZ6KMGASGstJZ3RLfKPx/jZVEp17
	35jzc9yLg372cIsgcOrapeudNMvq/ZBFcZZFHIQuJ8gpu/MczPW5u45p1/PZBPap/6TzQC+BZYs
	wqMuy8zw+OqkBoEyUG1un1Ys+W7p1NFE9qf2Vk4IJ4AwRJm0DgwEXEjX8hBxvblrcHZkVQiK7fi
	yqZ5oQCJLA4sW65OvoHelqSDrmakeVSb0gjlxFaUIaON/KZoaAd9ayI66juQQWkmDBQ8hi8TEMS
	zlisQGb+U55TwziXUUD8uFNEQY6irURdk6F8JWxLOtLmY9rIz
X-Received: by 2002:a4a:edc6:0:b0:69d:9e9d:b000 with SMTP id
 006d021491bc7-69e102bff96mr4763041eaf.23.1780295000445; Sun, 31 May 2026
 23:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260429173002565bdp1o7P0bvOs6yTz64yNx@zte.com.cn> <20260429173529259zFOx-ZsqSl_DS82KLXv0S@zte.com.cn>
In-Reply-To: <20260429173529259zFOx-ZsqSl_DS82KLXv0S@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Jun 2026 11:53:07 +0530
X-Gm-Features: AVHnY4IK8KCCerdq2ROMJ7Vw6kUdLfOeVHB9CyJGSx470faQyO8EQ5cmziGag78
Message-ID: <CAAhSdy3W4U_wYuH_pKq-V6iP6UE7e9h9Zhv=hKLykvWpiTEGVg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] RISC-V: KVM: Refactor kvm_arch_commit_memory_region()
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_232321_326841_B5A66149 
X-CRM114-Status: GOOD (  21.42  )
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

T24gV2VkLCBBcHIgMjksIDIwMjYgYXQgMzowNeKAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4gUmVmYWN0b3Iga3ZtX2FyY2hfY29tbWl0X21lbW9yeV9yZWdpb24oKSBhcyBhIHBy
ZXBhcmF0aW9uIGZvciBhIGZ1dHVyZQo+IGNvbW1pdCB0byBsb29rIGNsZWFuZXIgYW5kIG1vcmUg
dW5kZXJzdGFuZGFibGUuIEFsc28sIGl0IGxvb2tzIG1vcmUKPiBsaWtlIGl0cyBhcm02NCBhbmQg
eDg2IGNvdW50ZXJwYXJ0cy4KClRoaXMgY2xhaW0gb2YgbWFraW5nIGl0IHNpbWlsYXIgdG8gYXJt
NjQgYW5kIHg4NiBpcyBpbmNvcnJlY3QuIFNlZSBiZWxvdy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBX
YW5nIFllY2hhbyA8d2FuZy55ZWNoYW8yNTVAenRlLmNvbS5jbj4KPiAtLS0KPiAgYXJjaC9yaXNj
di9rdm0vbW11LmMgfCAxMiArKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9t
bXUuYyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gaW5kZXggMmQzZGVmMDI0MjcwLi5kYzZhOGVm
ZGU5OWUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiArKysgYi9hcmNoL3Jp
c2N2L2t2bS9tbXUuYwo+IEBAIC0xNDEsMTIgKzE0MSwyMiBAQCB2b2lkIGt2bV9hcmNoX2NvbW1p
dF9tZW1vcnlfcmVnaW9uKHN0cnVjdCBrdm0gKmt2bSwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKm5ldywKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGVudW0ga3ZtX21yX2NoYW5nZSBjaGFuZ2UpCj4gIHsKPiAr
ICAgICAgIGJvb2wgbG9nX2RpcnR5X3BhZ2VzID0gbmV3ICYmIG5ldy0+ZmxhZ3MgJiBLVk1fTUVN
X0xPR19ESVJUWV9QQUdFUzsKPiArICAgICAgIGJvb2wgcmVhZF9vbmx5ID0gbmV3ICYmIG5ldy0+
ZmxhZ3MgJiBLVk1fTUVNX1JFQURPTkxZOwo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBO
b3RoaW5nIG1vcmUgdG8gZG8gZm9yIFJPIHNsb3RzICh3aGljaCBjYW4ndCBiZSBkaXJ0aWVkIGFu
ZCBjYW4ndCBiZQo+ICsgICAgICAgICogbWFkZSB3cml0YWJsZSkgb3IgQ1JFQVRFL01PVkUvREVM
RVRFIG9mIGEgc2xvdC4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKChjaGFuZ2UgIT0gS1ZN
X01SX0ZMQUdTX09OTFkpIHx8IHJlYWRfb25seSkKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+
ICsKCkkgZG9uJ3Qgc2VlIGhvdyB0aGlzIGlzIHNhbWUgYXMgd2hhdCB4ODYgYW5kIGFybTY0IGRv
ZXMuIFRoZXJlIGlzCm5vIHNwZWNpYWwgY2FzaW5nIGZvciBLVk1fTVJfRkxBR1NfT05MWSBpbiB4
ODYgYW5kIGFybTY0LgoKPiAgICAgICAgIC8qCj4gICAgICAgICAgKiBBdCB0aGlzIHBvaW50IG1l
bXNsb3QgaGFzIGJlZW4gY29tbWl0dGVkIGFuZCB0aGVyZSBpcyBhbgo+ICAgICAgICAgICogYWxs
b2NhdGVkIGRpcnR5X2JpdG1hcFtdLCBkaXJ0eSBwYWdlcyB3aWxsIGJlIHRyYWNrZWQgd2hpbGUK
PiAgICAgICAgICAqIHRoZSBtZW1vcnkgc2xvdCBpcyB3cml0ZSBwcm90ZWN0ZWQuCj4gICAgICAg
ICAgKi8KPiAtICAgICAgIGlmIChjaGFuZ2UgIT0gS1ZNX01SX0RFTEVURSAmJiBuZXctPmZsYWdz
ICYgS1ZNX01FTV9MT0dfRElSVFlfUEFHRVMpIHsKPiArICAgICAgIGlmIChsb2dfZGlydHlfcGFn
ZXMpIHsKCldoeSBkcm9wICJjaGFuZ2UgIT0gS1ZNX01SX0RFTEVURSIgPwoKPiAgICAgICAgICAg
ICAgICAgaWYgKGt2bV9kaXJ0eV9sb2dfbWFudWFsX3Byb3RlY3RfYW5kX2luaXRfc2V0KGt2bSkp
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ICAgICAgICAgICAgICAgICBtbXVf
d3BfbWVtb3J5X3JlZ2lvbihrdm0sIG5ldy0+aWQpOwo+IC0tCj4gMi40My41CgpSZWdhcmRzLApB
bnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
