Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209A0C3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 17:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=faKV7ibg5Cw2SedGEXXKmV1POwyZYw/DXzN4dNbkFvM=; b=T+fnylgqqN8gZDrTNJ/V52NJOw
	N1Snm/Rn1NWhgjJ5QBvj538pJJzrbRLwyxcfSbFGUp+VuioY4YpYP23jhKAu2WHKapizlMshGf/Mq
	WcStnaoIJtALHLLcJL1fL1vBYfQER6hWCAYA4R94APL8jvyob7eAuZ3gu7ClhGICkGGdSp0huStca
	K/NHk2NxKBC1N9zfkUg09i8Ur5mkeO8lIzF17CLtliY8sP3chs6mmzsWaHztMqrY5SCt1oNnI9UEj
	3ta46RePFA2gqiTmnS4WnC0HhSefFxxuEgOfIk/w4TShw4XgqWRa9xceHdxdqa3AKuxYivwxMmJxC
	UL6vQhGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2w8o-0000000BShg-0JLL;
	Thu, 10 Apr 2025 17:56:42 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vMs-0000000BJZf-2qR7
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 17:07:12 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso1086704b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 10:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1744304829; x=1744909629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ua88Q2c6cFD3jQVD5oRdkJQt+9qRrvpHDA0207C5PVw=;
        b=doZaqvIRFWFXPWC/0ZoiwMt4jbS3Z8uZi/L0IxYzEuTawhhOONG/4FsAJFdyRBk4i/
         6WyYSarja/WeACdl29tu/aHqupbTGKJRTBLHkBwpDjzJud9iiouAnqqLb/dUZanQdY1r
         VSrPLusX6cbJ9+CWf4rQDRO57kbjkrs3dr036UcdBNAl+EVIfGsjZj/RKvBz9ghn+SEE
         9REuZCpp5W92CI6WLDWbCs3ljpwVM0fLUg8H9KDuI2lhn7BcgTa8JTlGDc6olqOXAaTu
         PFPQtqYx+f1CoH4q51Gw9Vg03ar9BeNZqUE1Wp7I5q4LN6mRgFg4IFWCuliaGfzGOARI
         7B9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744304829; x=1744909629;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ua88Q2c6cFD3jQVD5oRdkJQt+9qRrvpHDA0207C5PVw=;
        b=kRXcf7p4/NPANL2L+DXxi6lamet9RNoYVsEyBrNOdHBFboaum+ZLirbDQjowLYyPBd
         v1gFOHHDBNPxxdASRTc6lEfL8Qx0uAhFQuKpdzyRQOKjLcUa0dm92fJb+pEtbI7mpnwS
         62D28WpMXap8NTUJ7+TIk97NWtXOtWWa8zmcWB8+Of3dxm10Jt6eMn443x1AZs2CMUxl
         QEOqm8gsv+WmPR2vq1mvkC79CFpN4j+6Rh47dbq1kF9VvTqgUr5sbR9zEa+p6GoHR8W4
         mwqu/wh08hntTni0+0KLZK/HGIMBOfqByRGD/PNJSJqLnU2cSz/D+7ovjVCZ+h+SAsA5
         s80g==
X-Gm-Message-State: AOJu0Yx76MjHN0dvJgtKTmxwKZrA9sIydxLgIqLzBocy/k8vtltiiSS0
	7h1qednIO/n5Q7Tj0yoG2W4QoHtcI0fPRtBnwkcqSbJfXLgnWDDMwWPfBC3J8GORxYGrsReNZSj
	dcgc=
X-Gm-Gg: ASbGncu/Z2g5n6yWXH11DPBRDPjrKHACto4Du4esvqmu2glbbcwS8r3OI1kvYwdKA/N
	7Lj/ZETe17k3JHU9XE3+JGY6lWsAPWtnfglvW077WzLC3UomYAUoy0AGziyfiTounAXog2JRSXp
	/Zx3or50RzXq/wW9kwcZ6Tt/VCyv8yZ12ixloqj+KA14e4AnslRyElC61YS/pFd0o1qs94HPDQv
	A2WgXms1LwFxJM2y/CltSsVeHUGfaGNqW7ivbzn4ula85D7gKq/17ASWzrqOUb8QnY4NMmtFhQP
	aLwb0wDPynyob6vl06S6UW1j6Fw9PJYXVg==
X-Google-Smtp-Source: AGHT+IGI942bYAAOupZiu+LKQ1F8y6mEctf1+kc3hAgePjekfQOaPWl9rC2190XXNS/qW30szEYF0A==
X-Received: by 2002:a05:6a00:240a:b0:736:ab1d:83c4 with SMTP id d2e1a72fcca58-73bbec49f99mr4911278b3a.0.1744304828943;
        Thu, 10 Apr 2025 10:07:08 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e4d974sm3615157b3a.135.2025.04.10.10.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 10:07:08 -0700 (PDT)
Date: Thu, 10 Apr 2025 10:07:08 -0700 (PDT)
X-Google-Original-Date: Thu, 10 Apr 2025 10:07:07 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.15-rc2
In-Reply-To: <745d5aaa-e527-487c-a62c-212ad6ef2cc9@ghiti.fr>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-3e5217fd-f5ba-406b-94a6-2949eb6a0706@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_100710_939982_072377F2 
X-CRM114-Status: GOOD (  17.41  )
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

T24gV2VkLCAwOSBBcHIgMjAyNSAwMTozMjowMiBQRFQgKC0wNzAwKSwgYWxleEBnaGl0aS5mciB3
cm90ZToKPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDBhZjJmNmJlMWI0Mjgx
Mzg1YjYxOGNiODZhZDk0NmVkZWQwODlhYzg6Cj4KPiAgwqAgTGludXggNi4xNS1yYzEgKDIwMjUt
MDQtMDYgMTM6MTE6MzMgLTA3MDApCj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3Np
dG9yeSBhdDoKPgo+ICDCoCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvYWxleGdoaXRpL2xpbnV4IAo+IHRhZ3MvcmlzY3YtZml4ZXMtNi4xNS1yYzIKPgo+IGZv
ciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA3MGZjMDNjZDc2MzExYTA2YzhjODRkZWI3MGIy
ZTE2ODM3NDk3Nzc0Ogo+Cj4gIMKgIERvY3VtZW50YXRpb246IHJpc2N2OiBGaXggdHlwbyBNSU1Q
TElEIC0+IE1JTVBJRCAoMjAyNS0wNC0wNyAwODoyMToxOSAKPiArMDAwMCkKPgo+IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiByaXNjdiBmaXhlcyBmb3IgNi4xNS1yYzIKPgo+ICogQ29ycmVjdCB0eXBvcyBpbiB0aGUgZG9j
dW1lbnRhdGlvbgo+ICogUHJldmVudCBtb2R1bGUgaW5zZXJ0aW9uIGZhaWx1cmVzIGJ5IHVzaW5n
IGt2bWFsbG9jIHRvIGFsbG9jYXRlIHRoZSAKPiByZWxvY2F0aW9uIGhhc2h0YWJsZQo+Cj4gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+Cj4gQWxsIHRoZSBwYXRjaGVzIGhhdmUgYmVlbiB0ZXN0ZWQgb24gb3VyIGdpdGh1YiBD
SSBhbmQgbm8gcmVncmVzc2lvbnMgCj4gd2VyZSBmb3VuZCBhZ2FpbnN0IDYuMTUtcmMxIAo+ICho
dHRwczovL2dpdGh1Yi5jb20vbGludXgtcmlzY3YvbGludXgvcHVsbC8yNDAvY2hlY2tzIHdob3Nl
IHJlc3VsdHMgY2FuIAo+IGJlIHNlZW4gaGVyZSAKPiBodHRwczovL21hemFyaW5lbi50YWlsMWM2
MjMudHMubmV0L3Jpc2N2LWxpbnV4L2xpbnV4LWFsbC9idWlsZC9yaXNjdi1maXhlcy02LjE1LXJj
MikuIAo+Cj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4KPiBOYW0gQ2FvICgxKToKPiAgwqDCoMKgwqDCoCBEb2N1bWVu
dGF0aW9uOiByaXNjdjogRml4IHR5cG8gTUlNUExJRCAtPiBNSU1QSUQKPgo+IFdpbGwgUGllcmNl
ICgxKToKPiAgwqDCoMKgwqDCoCByaXNjdjogVXNlIGt2bWFsbG9jX2FycmF5IG9uIHJlbG9jYXRp
b25faGFzaHRhYmxlCj4KPiAgwqBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3Qg
fCAyICstCj4gIMKgYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxlLmPCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8IDkgKysrKystLS0tCj4gIMKgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCgpUaGVzZSBsb29rIGZpbmUsIGJ1dCBJJ20gc3RpbGwgc3R1Y2sgaW4gdGhp
cyBJQ0Ugc28gSSBoYXZlbid0IGdvdHRlbiBhIApjbGVhbiBidWlsZCByZWNlbnRseS4gIExvb2tz
IGxpa2UgaXQncyBqdXN0IHRoZSBzYW1lIGlzc3VlIGFzIAo8MjAyNTA0MDcta2J1aWxkLWRpc2Fi
bGUtZ2NjLXBsdWdpbnMtdjEtMS01ZDQ2YWU1ODNmNWVAa2VybmVsLm9yZz4sIAp0aG91Z2gsIHNv
IGhvcGVmdWxseSBpdCdsbCBnZXQgc29ydGVkIG91dCBzb29uLi4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
