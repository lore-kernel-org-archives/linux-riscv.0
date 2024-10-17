Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8922D3C52C
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 18:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dj3f99QCgS+HwqXfz/Zdpue6Z7HzuR1ShjU4ip0j2Jc=; b=XVhnVFZ8wOb6hR
	AgTkCpeDhqwl/ZAZLS2+5aUTYdYgWVBxsV1gWnJaVX8HXrb0KDbuszheWyAuuheI6yxa1oem9DdUB
	ddWIE8RbMbAocGzbXyc+0dbhRPEZc+Y1Xxy+EGHWcs0Bx8iX7Kdl3flnrlZ+cdoYQVLW7Cxmof0Yc
	KCeKokqKu5yf6nWIwwakE2LTGCHt55uvAlSi9BphXA0KrKSRROtlT4botX/uJcvGr7gE4bHoIP/at
	SAPl8QuUc0HWPvkYi5w6cETrEX4FuFi5o+TrlR65uEZrp6Qjlt1SGaYcWthb+fs70o/JpPGi0zN1b
	CV2nKX2L44U8AtXMq6XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Uo7-0000000Fnzj-2pNV;
	Thu, 17 Oct 2024 18:01:07 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Tct-0000000FYoQ-1NeH
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 16:45:30 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3a39cabb9b8so4331065ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 09:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729183525; x=1729788325; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/+hKz9Utv8LPO0aGsn01ZA038qHbKiaHK+Sj+rHiIo=;
        b=oPzotuVwj3yPaifI6sDXGSDBGoD7hkFNSD0TCyAd6xrx5gEPHka4FYkn9kqYRljRRa
         VvmtC3ILRuDEFW3NLHxLL3jZWvLUVdK8FmtpSYRlZtmhoIkS8Ahe7kduwtAXmwctzx3j
         ka4XoSsdSj5E7AjZdnzJRw3K9fJAB4TL6nX0H8gOazfkSoSgQIhuA6s6PrNYH9Mgfp+3
         IkxOfkH8HQ1Pp07M/lptA5msE/6TFW4PNITEQM6R5Fa4oH+Ws4/X7aA/ODCdY2z3aauv
         q365G9AREpO+8E8RhubmsLK5RodCs7/7N8gvXaRASn8wSGyiRF82csGudMxmYDrX675Z
         oVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729183525; x=1729788325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/+hKz9Utv8LPO0aGsn01ZA038qHbKiaHK+Sj+rHiIo=;
        b=TBxTZFXdTOFMtf12PA+lchlZmX4miP4MjPkdHOZGo9UdyBswUq1jFvMX+ODzG9dI+j
         HnTI4yBXmUQVcfrqhYqxCdpDV8SVXavSqJbamkwGygxhanqzT+EWFLDUivdbUx7pD21z
         YCx8cAgfKl53Qqjdu0XYVhjApYUo2xiZHcHy2yMZpGQZIQj7HJf1VxONWe9pWcr6dt4J
         +VE/dnnDtWNq1UHpy3h2BgQNRmExoFUYadAChF1zuHb6wtUS1OEZ1oSK9ttpot7I4Cvj
         yKRcXs0E0S//quvlZpPQZg3n28seNc4GLAXHY+SKGgjRd+uYkxuG7uRLIgOIqUwnb319
         rvtw==
X-Forwarded-Encrypted: i=1; AJvYcCXaHNI6VWiuWlQ+/FThGRUcnz4/09HMMKLL8XXpKnEK2ZoSWInZzhuBN8i5a+85JqQwijTF5MejC02LAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgRpKhevyDNbblVW6rUOuev0NpNm2ofUgMC18C9eIv3ILKEP7n
	qxv8Ee67daNWhmO09jTDAxhpp4vr3EZ2n3tRg1lj/vkDeteSJZ/2i06oe3h+3Iuglnldl7rrwhq
	vVD2Ct1UM7dcVX56KV8C1jgsUGL+QzdMxBjCGUA==
X-Google-Smtp-Source: AGHT+IEyjFo+SIWSJWyVZBGV5zs/J+99C1GHNHOGAoKVR2hwF/wgFiuTrcZJ9nhmSqqLjMiUKewGgdAueOpzvhLZuL0=
X-Received: by 2002:a05:6e02:1786:b0:3a0:7687:8c2d with SMTP id
 e9e14a558f8ab-3a3dc5030b3mr70463775ab.26.1729183525560; Thu, 17 Oct 2024
 09:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1728579958.git.tjeznach@rivosinc.com> <b8da2b00aec3f7b4b2e3a7cc194f7961bf656f24.1728579958.git.tjeznach@rivosinc.com>
 <lagj6ljulmfjogrzhfd3jrf5fnngev63q2g3bmvftwfzc3s6mb@gw6oz4yriyjf>
In-Reply-To: <lagj6ljulmfjogrzhfd3jrf5fnngev63q2g3bmvftwfzc3s6mb@gw6oz4yriyjf>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Thu, 17 Oct 2024 09:45:14 -0700
Message-ID: <CAH2o1u4BYyHhi3dVcBrB8T2JpXdxStsfYodmOT-6a8KMHAot8w@mail.gmail.com>
Subject: Re: [PATCH v9 2/7] iommu/riscv: Add RISC-V IOMMU platform device driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_094527_653514_7AEDF559 
X-CRM114-Status: GOOD (  13.91  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8gVXdlLAoKT24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMjozNeKAr0FNIFV3ZSBLbGVpbmUt
S8O2bmlnCjx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPiB3cm90ZToKPgo+IEhlbGxvLAo+
Cj4gT24gVGh1LCBPY3QgMTAsIDIwMjQgYXQgMTI6NDg6MDVQTSAtMDcwMCwgVG9tYXN6IEplem5h
Y2ggd3JvdGU6Cj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcmlzY3ZfaW9t
bXVfb2ZfbWF0Y2hbXSA9IHsKPiA+ICsgICAgIHsuY29tcGF0aWJsZSA9ICJyaXNjdixpb21tdSIs
fSwKPgo+IG5pdHBpY2s6IFVudXN1YWwgaW5kZW50aW9uOgo+Cj4gdXdlQHRhdXJ1czp+L2dzcmMv
bGludXgkIGdpdCBncmVwIC1sICd7LmNvbXBhdGlibGUgPScgfCB3YyAtbAo+IDE5Mgo+IHV3ZUB0
YXVydXM6fi9nc3JjL2xpbnV4JCBnaXQgZ3JlcCAtbCAneyAuY29tcGF0aWJsZSA9JyB8IHdjIC1s
Cj4gNDE5Nwo+Cj4gKEh1LCBJIGV4cGVjdGVkIHRoZSBkaWZmZXJlbmNlIHRvIGJlIGJpZ2dlciB0
aGFuIGEgZmFjdG9yIG9mIH4yMC4pCj4KPiBJJ2QgZ28gZm9yIGEgc3BhY2UgYmVmb3JlICIuY29t
cGF0aWJsZSIgYW5kIG9uZSBhZnRlciB0aGUgdHJhaWxpbmcKPiBjb21tYS4KPgo+ID4gKyAgICAg
e30sCj4gPiArfTsKPiA+ICsKPiA+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciByaXNj
dl9pb21tdV9wbGF0Zm9ybV9kcml2ZXIgPSB7Cj4gPiArICAgICAucHJvYmUgPSByaXNjdl9pb21t
dV9wbGF0Zm9ybV9wcm9iZSwKPiA+ICsgICAgIC5yZW1vdmVfbmV3ID0gcmlzY3ZfaW9tbXVfcGxh
dGZvcm1fcmVtb3ZlLAo+ID4gKyAgICAgLmRyaXZlciA9IHsKPiA+ICsgICAgICAgICAgICAgLm5h
bWUgPSAicmlzY3YsaW9tbXUiLAo+ID4gKyAgICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBy
aXNjdl9pb21tdV9vZl9tYXRjaCwKPiA+ICsgICAgICAgICAgICAgLnN1cHByZXNzX2JpbmRfYXR0
cnMgPSB0cnVlLAo+ID4gKyAgICAgfSwKPiA+ICt9Owo+Cj4gQWZ0ZXIgY29tbWl0IDBlZGI1NTVh
NjVkMSAoInBsYXRmb3JtOiBNYWtlIHBsYXRmb3JtX2RyaXZlcjo6cmVtb3ZlKCkKPiByZXR1cm4g
dm9pZCIpIC5yZW1vdmUoKSBpcyAoYWdhaW4pIHRoZSByaWdodCBjYWxsYmFjayB0byBpbXBsZW1l
bnQgZm9yCj4gcGxhdGZvcm0gZHJpdmVycy4gUGxlYXNlIGp1c3QgZHJvcCAiX25ldyIuCj4KClRo
YW5rIHlvdSBmb3IgdGhvc2UgY29tbWVudHMsIHRoZXkgbG9vayByZWFzb25hYmxlLgpDYW4gd2Ug
cG9zdHBvbmUgdGhvc2UgY2hhbmdlcyBhZnRlciB2MTAgaXMgbWVyZ2VkIGludG8gdGhlIGlvbW11
IHN1YnN5c3RlbSB0cmVlPwoKPiBCZXN0IHJlZ2FyZHMKPiBVd2UKCkJlc3QgcmVnYXJkcywKLSBU
b21hc3oKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
