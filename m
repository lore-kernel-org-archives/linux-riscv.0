Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4303FCA1013
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 18:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PEyV6DKrbl6M0XWB5ajBzZ128YvL/Qad4jpYEjUZM2Y=; b=e4m90/eGpHab78
	oQgBpauZgCPig8xyHf2NjGonCsiBnG9iDsVl9/cLSgmfdATmTzSxGMLX0bI16zbDMfvhKrlcrNU2M
	sLCyfa5DF2tJvGyrJEH4twpkkAlbuHSeeGT25GDVl6KHurp9m5PVOlKQSKiu+iLJWHDWWRuvVLmzO
	YoARIIRYIBTMdjSatchmfUFEGQVPXe5gmzctoWipaWlt3pIz1W7DH1ov/OpupV2WJ9vqGsP6xJfb4
	W1JBcDaau4NyZm6tEP7MPhkNk6Qt+33kRmH9Q+s7i7y+t26BS9PowTlvkkVlk+WQJ2EWii8zDBCZa
	6WEeZaz80jHYKU1ZSKlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEkZ-0000000Dao4-2mB6;
	Thu, 04 Sep 2025 18:31:59 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAMH-0000000C0Bl-3X8P
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 13:50:39 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-24c786130feso10262895ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Sep 2025 06:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756993836; x=1757598636; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hlQ4Sx6+JNm7Anzsg6uLNnjJoKTjxwqCeqz7s3XShYk=;
        b=b1rMR3BngHz7+krJj9KLld2DHaCQzr954C+YntvwIpMxq9Odu6Qe/8kY+SLS+tEh8b
         R0kdiu9D6WAJX8oEd8yzONEP0X6dwcSXYt3rHMrmI0dpeyL5MpxH5V7VRVruaDHA5Kxg
         drZDpnPj6zPBA2r/Ef0rz4uXq/yIddT0Ywvz7nd1rjBAAKmBFbm3BOTa5OECjt4EwsOb
         eJvRKu0rY8UWGDYnL2ZuPzlyqJx6oglAtOX79d9ZGUMRoym+P1HGf7YAq2izExMlcCkS
         YZU4Qk6i24Eq5JIOmUDLOTUG69pM672ReTtiY5NecAmUHAUbCI6oVw9x/TXGOJS86taa
         KT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756993836; x=1757598636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hlQ4Sx6+JNm7Anzsg6uLNnjJoKTjxwqCeqz7s3XShYk=;
        b=TT7dPRHAdY89LwL2wqOZAfOudD5Dk3kEMkMzdeslnJt4yDDK/MlZunKge3D8TKFGVG
         16EA0KR/Kq2ZWojGZ3zv9pACNcLJFqt7icNfPD2/X17lyYn2d0i5xH7Os8NGljD5JJsL
         gAUveSG2Q6VaXNxnx1payiqiwR/oohJbbywtdJpBUpFpUvTGOLbGx6IDBPpdYwzL5MDv
         F0r+jUU3flCqoKQEGBOe1nEfm/6sznskY4sDtNzZndp2wG85E6v+V6OzZfPsaZNY7OUN
         weIFODAbe3P1yYkYIZbpXBwPsR003WwXOFTwtKx/s2mDmoFISU7nqmpzYTrl91FWVFCy
         JR2A==
X-Gm-Message-State: AOJu0YyGbKqSDVS8kFeAR3dWJEkyIU4WgMbFp5WpthtzTG71XoRYN0V3
	JZg4h/xxA4Y6RZs2sYmuFwSsxwmQShOxZotUbMoFH0H5U8SNSlm7vRNikeimzSevMHk=
X-Gm-Gg: ASbGncspVK6jRcFQ6RBG+xb38IELtg4UFusUm59H6RHGkMRKY7kQQKGEw/sEn1boXsm
	Kz64C9Q4iV3ernVgXOgheuDVdecb+398wSKB+F5GZXtzc23cc+hs9NuXzIdvmarIICpiNyMOlcj
	o3eLo830eyKH/6BBKTFTXP1wS+APCLQzgeY+kF4bPYqrdQ7ZN8dMjS0xe9xPUvp2BE3zLoP2kGW
	IQLMKiSMdn4xSAdGU3pmffwE63SHc4qtg+ajwlBNYeVM7yBcIABJ/W23KMK/oyQmL5XFUK01q4U
	RMG3a1B3ivXo2NkNw6hPkCZJzR0ycLsPuI5D9aIDc4Q2/KRT7XVrriKU4I+xCWLr9v9Zftz8bHu
	VAHbhYjg71oyidPaE23y+4N9jMXhY1X6lvI2I+TiUPWjkcEenlTAwl5Q8vdPHAhbEwH0=
X-Google-Smtp-Source: AGHT+IE++qNRXBiBncRgnIXQY1GziFXTwGi/APCNRK270AtfnhaMl41kWTSkHeIknkyFSIhHul9yOw==
X-Received: by 2002:a17:903:37cf:b0:246:9a2c:7ecd with SMTP id d9443c01a7336-24944a9afe6mr259693895ad.29.1756993836464;
        Thu, 04 Sep 2025 06:50:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c9952bccasm44979405ad.105.2025.09.04.06.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 06:50:35 -0700 (PDT)
Message-ID: <49bdcd0c-18ef-42ec-a71d-497bc6d6414d@rivosinc.com>
Date: Thu, 4 Sep 2025 15:50:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: Fix sparse warning in __get_user_error()
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 kernel test robot <lkp@intel.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Cyril Bur <cyrilbur@tenstorrent.com>,
 Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250903-dev-alex-sparse_warnings_v1-v1-0-7e6350beb700@rivosinc.com>
 <20250903-dev-alex-sparse_warnings_v1-v1-1-7e6350beb700@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250903-dev-alex-sparse_warnings_v1-v1-1-7e6350beb700@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_065037_945113_131F0935 
X-CRM114-Status: GOOD (  17.53  )
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

CgpPbiAwMy8wOS8yMDI1IDIwOjUzLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gV2UgdXNlZCB0
byBhc3NpZ24gMCB0byB4IHdpdGhvdXQgYW4gYXBwcm9wcmlhdGUgY2FzdCB3aGljaCByZXN1bHRz
IGluCj4gc3BhcnNlIGNvbXBsYWluaW5nIHdoZW4geCBpcyBhIHBvaW50ZXI6Cj4gCj4+PiBibG9j
ay9pb2N0bC5jOjcyOjM5OiBzcGFyc2U6IHNwYXJzZTogVXNpbmcgcGxhaW4gaW50ZWdlciBhcyBO
VUxMIHBvaW50ZXIKPiAKPiBTbyBmaXggdGhpcyBieSBjYXN0aW5nIDAgdG8gdGhlIGNvcnJlY3Qg
dHlwZSBvZiB4Lgo+IAo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVs
LmNvbT4KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAy
NTA4MDYyMzIxLmdIdjRrdnVZLWxrcEBpbnRlbC5jb20vCj4gRml4ZXM6IGY2YmZmNzgyN2E0OCAo
InJpc2N2OiB1YWNjZXNzOiB1c2UgJ2FzbV9nb3RvX291dHB1dCcgZm9yIGdldF91c2VyKCkiKQo+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdo
aXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3VhY2Nlc3MuaCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFj
Y2Vzcy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiBpbmRleCAyMmUzZjUy
YTc2M2QxYzAzNTBlODE4NTIyNWU0Yzk5YWFjM2ZjNTQ5Li41NTFlNzQ5MDczN2VmZmIyYzIzOGU2
YTRkYjUwMjkzZWNlN2M5ZGY5IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dWFjY2Vzcy5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiBAQCAt
MjA5LDcgKzIwOSw3IEBAIGRvIHsJCQkJCQkJCQlcCj4gIAkJZXJyID0gMDsJCQkJCQlcCj4gIAkJ
YnJlYWs7CQkJCQkJCVwKPiAgX19ndV9mYWlsZWQ6CQkJCQkJCQlcCj4gLQkJeCA9IDA7CQkJCQkJ
CVwKPiArCQl4ID0gKF9fdHlwZW9mX18oeCkpMDsJCQkJCVwKPiAgCQllcnIgPSAtRUZBVUxUOwkJ
CQkJCVwKPiAgfSB3aGlsZSAoMCkKPiAgCj4gCgpIaSBBbGV4LAoKSSBhcHBsaWVkIHRoYXQgYW5k
IGNoZWNrZWQgdGhhdCB0aGUgc3BhcnNlIHdhcm5pbmdzIHdlcmUgZml4ZWQgYXMgd2VsbCwKbG9v
a3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZv
c2luYy5jb20+CgpUaGFua3MsCgpDbMOpbWVudAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
