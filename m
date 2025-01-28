Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45174C02190
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 08:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+AwMfRBcA1L5ddWOvqU0jjL+XzSiBFuaN3d/eSVbME=; b=x3jxIbKAmV+RZy
	/nYAXrilGBj8stUeuKts0+6RMFpF6Y4Pmb2eraUXcsBfTkeKkYCC91yaievWMnGQgPK7Z7Atk127s
	plKMQ+BYGnjwOlyqm7TKiJdwJrt/VvXqWJGgfxYGWP9hRCDVPK+uXfko23SghTKXH1TD4+bLiFUD/
	CIP2AqI3W7QzRTQveEC4VQR/8KGAq64zo8QPH3NQkgpqCh4HW+ARBQWOWo5XSTI/+aKYO6nHXmZF1
	O3uqC4ndP1JHQ2UB7za6kHvS3aTY7pWI1jjplNjuBQI5RqSkSE0GbyCn3neHp4wdvMYgPAWD9T+Fl
	tX5SDrx4s7gPQKfgCxpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcgg8-00000004L51-38zM;
	Tue, 28 Jan 2025 08:10:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcgg6-00000004L4N-1Pkv
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 08:10:35 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21636268e43so116891445ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jan 2025 00:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738051833; x=1738656633; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m258w8dJxz5HR+kMdkqF8oyJmKeGuzgT5afDJjiYj2I=;
        b=JZYHOIzEa4QSM/oeG7KzAyEP99efiMjP9dzzRPp2Ji0rN4wCwfaWbCjiCG0cp0vzAP
         0x1mZq8QDK7fSOETvIAMo8XL6+JCMw4Lw8zjNf0tCP0pYTQg6QtJQ4c8OnReiWNGBYyu
         EiPIfco9jduMXk4o1olZZ/oFl848nQ7f6UnyAcjZahu1v2TgMaG88r9kGiPxaKdFMp37
         +ijqLbKBQ0heb6u8RqgasTxVFwBHDhYZHlKPQ0VXdRxW2X2DIhuEWYqatsNbzkSWJdOG
         agqiNyIrwxxgBAfW7vRbjuVJyTHP+aFoKkUdvlx6CXKhgDBJfMDjmK20lPabCWYiWvss
         hfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738051833; x=1738656633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m258w8dJxz5HR+kMdkqF8oyJmKeGuzgT5afDJjiYj2I=;
        b=tLZEHJeaExpuCf1kbACwaPboylhwK7HlD0kI8j4FnYphpMp6iRnrO994ZPMvFwjRWY
         lj/rggJCLrJ32HP5kJUPx2mPhTiuU9MWpmHWvTqc4F0kKzvvdxL9j8NMg/r4k12F+LMU
         zt2n1NEskLdxSAUW5EbQXdV4h/1SmBXF297Tufe0HxLDJXwdEFFEnAPXR84PhdNnf5zR
         gRtrVH6zhCSu5V9E3v8mrfQttdJs05bYLHOui3DJHxEmUZBMzzeEawLv0xG/XQm6fwmT
         ACFFtrNnodtlE/ZZSdok2foW22LfAMGG2bqKC4F3Yu+JDOG8erYRHyQCVy54mVwuAZFK
         fb3w==
X-Forwarded-Encrypted: i=1; AJvYcCXikMZl4cNWGWxnlpr52wwPbqqIyScnqSo/Woxdf0oCeswzEXVWf7Hajx2+fwl/BwL96OVIO9Hn0xFR+A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7yVHD5jTFVNzolhRwqfbzT0h3xIsmEPYy/Kvy2A6OWgV06D86
	vXMPqw1h5LLvwQ2WggYmH+hYu6JK52tTH2Ti0TD/9v5VEByGpyNk3oozllhfOSldovWnaVGTrE6
	7Qnk=
X-Gm-Gg: ASbGnctwalA3Pn7lSk60b9wXS84sEwLeTKoiFOi5ZiMVRTqgOTvrHHsg0+9nQLSshrn
	Gg6EB9rUmvuI2uIjMGFb/QTn3SHJyDThKIqSuIH/lKWRtY4N0S1q0Bzp+6BBvIuFSfU45Isz++8
	vi0KlzezGCD3Dgea482+wB1dVjooqLNOtqsFm43x8EmZbEyeOvZq9j6IRlq5N9eAQPRNrwkghSW
	hKyFSQnTFtpRkmNWklvT1s1fScse6Cv+lx7iKp8QoYMNdwbMW+FPfoXU8eyzB1SFPwZsK7Uq8Mg
	I15V3AtpCPUNgzB95GXFK6ztqbak/fb9bElObHWo7/WkEkKdXVa92fH2BlaR
X-Google-Smtp-Source: AGHT+IHDmEOcULSXx6v19eA35NSq2IM7B/YhvJ1Sx1iHSXvE2QmuT8LtSkzPnBOxM5b/dOdaKXN7Yw==
X-Received: by 2002:a17:903:22ca:b0:215:603e:2141 with SMTP id d9443c01a7336-21c35511d01mr714453715ad.19.1738051832955;
        Tue, 28 Jan 2025 00:10:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da413f474sm76611115ad.130.2025.01.28.00.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 00:10:32 -0800 (PST)
Message-ID: <32cc0753-a033-4f55-8aca-09416f62faa8@rivosinc.com>
Date: Tue, 28 Jan 2025 09:10:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] riscv: add support for SBI Supervisor Software
 Events extension
To: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>
References: <20241206163102.843505-1-cleger@rivosinc.com>
 <20241206163102.843505-3-cleger@rivosinc.com>
 <a21df8a8-a50f-49df-a098-69faa51ed8cb@ghiti.fr>
 <649fdead-09b0-4f94-a6ff-099fc970d890@rivosinc.com>
 <a0012a8d-0c2b-4948-b5c7-7d8efdf1cab0@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <a0012a8d-0c2b-4948-b5c7-7d8efdf1cab0@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_001034_651176_3E4A6D02 
X-CRM114-Status: GOOD (  12.39  )
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

CgpPbiAyNy8wMS8yMDI1IDA5OjA5LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+IEkgYmVsaWV2
ZSB0aGUgZ29hbCBpcyBub3QgdGhlIHNhbWUuIFVzaW5nIENPTkZJR19WTUFQX1NUQUNLIGFsbG93
cyB0aGUKPj4ga2VybmVsIGV4Y2VwdGlvbiBoYW5kbGluZyB0byBjYXRjaCBhbnkgc3RhY2sgb3Zl
cmZsb3cgd2hlbiBlbnRlcmluZyB0aGUKPj4ga2VybmVsIGFuZCB0aHVzIHVzaW5nIHZtYWxsb2Mg
aXMgcmVxdWlyZWQgdG8gYWxsb2NhdGUgdHdpY2UgdGhlIHBhZ2UKPj4gc2l6ZSAob3ZlcmZsb3cg
aXMgd2hlbiBzcCBpcyBsb2NhdGVkIGluIHRoZSB1cHBlciBoYWxmIG9mIHRoZSBhbGxvY2F0ZWQK
Pj4gdm1hbGxvYyBzdGFjay4gU28gYmFzaWNhbGx5LCB0aGlzIGlzIHR3byBkaXN0aW5jdCBwdXJw
b3Nlcy4KPj4KPj4gQUZBSVUsIGt2bWFsbG9jIGFsbG93cyB0byBmYWxsYmFjayB0byB2bWFsbG9j
IGlmIGttYWxsb2MgZmFpbHMuIFRoaXMgaXMKPj4gbm90IHdoYXQgd2UgYXJlIGxvb2tpbmcgZm9y
IGhlcmUgc2luY2Ugb3VyIGFsbG9jYXRpb24gc2l6ZSBpcyBhbHdheXMKPj4gcXVpdGUgc21hbGwg
YW5kIGtub3duIChTVEFDS19TSVpFIGJhc2ljYWxseSkuCj4+Cj4+IEJ1dCBJIG1pZ2h0IGJlIG1p
c3Npbmcgc29tZXRoaW5nLgo+IAo+IAo+IGFyY2hfYWxsb2Nfdm1hcF9zdGFjaygpIG9ubHkgdm1h
bGxvYyB0aGUgc3RhY2sgYW5kIGRvZXMgbm90IGltcGxlbWVudAo+IGFueSBzdGFjayBvdmVyZmxv
dyBtZWNoYW5pc20sIHNvIEknbSBzdGlsbCB1bnN1cmUgd2UgbmVlZCB0aGUgZGVmaW5lLgoKSGkg
QWxleCwKClNvIGFjdHVhbGx5LCB0aGUgc3RhY2sgb3ZlcmZsb3cgY2hlY2sgaXRzZWxmIGlzIGRv
bmUgaW4gdGhlIGV4Y2VwdGlvbgplbnRyeS4gSXQgY2hlY2sgaWYgdGhlIHN0YWNrIHBvaW50ZXIg
ZGlkIHBhc3NlZCBpbiB0aGUgdXBwZXIgcGFydCBvZiB0aGUKdm1hbGxvYyBhbGxvY2F0aW9uIChz
ZWUgZW50cnkuUzoxMjIpLiBJbiB0aGlzIGFsbG9jYXRpb24sIHRoZSBzdGFjayBzaXplCmlzIGFj
dHVhbGx5ICogMjoKCiNpZmRlZiBDT05GSUdfVk1BUF9TVEFDSwojZGVmaW5lIFRIUkVBRF9BTElH
TiAgICAgICAgICAgICgyICogVEhSRUFEX1NJWkUpCiNlbHNlCiNkZWZpbmUgVEhSRUFEX0FMSUdO
ICAgICAgICAgICAgVEhSRUFEX1NJWkUKI2VuZGlmCgpTbyBldmVuIHRob3VnaCBpdCBkb2VzIG5v
dGhpbmcgc3BlY2lhbCBieSBpdHNlbGYsIGl0IGNlbnRyYWxpemUgdGhlCmFsbG9jYXRpb24gc2l6
ZS9tZXRob2QuIEFuZCBzaXplIHRoZSBzaXplIGlzIGxhcmdlciwgdXNpbmcgdmFtbGxvYyBtYWtl
cwpzZW5zZSBJIGd1ZXNzLiBUaGUgc2FtZSBtZWNoYW5pc20gaXMgdXNlZCB0byBhbGxvY2F0ZSBp
cnEgc3RhY2sgYXMgd2VsbC4KClRoYW5rcywKCkNsw6ltZW50Cgo+IAo+IFRoYW5rcywKPiAKPiBB
bGV4CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
