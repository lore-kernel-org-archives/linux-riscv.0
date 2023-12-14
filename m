Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D774C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 05:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wt2BJA8Yf+uiwxvC0OIvlM3q1neRf+aYh1THNcswNpw=; b=AxOjhigN9jw8ze
	5sPXCv1FVPeZCK/HHRr6pA4M/rXZ2g05ufdxV+XDqXqid0mxOpz4Yi6nEhnaBMMQsKX3+Orc/AkWi
	oG0FLbOtCOKK4Dcwo3g/Sq/AVdhXmc+Heha27O//xY1qd6cAkPHmacMR0nPGLokeq2QHOCQCUEmNu
	PgEEY0zs46AqCWOafjNWzXdFH28xmdFUg4eKmLQzpMMIj2hLZt1EmSbGQuJpbdVDsHqO4q80gAE3V
	y1Lcrb4QmI5zQKRYZb6Z0jZ53rpX0FmYXZB+KFdOjFqCKruLO2w/wLuvNK8ZqzGhBQORaUMEiIF02
	qS3IaFdTrHqfxXpLWu4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDe8C-00GmMy-03;
	Thu, 14 Dec 2023 05:19:32 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDe89-00GmML-0B
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 05:19:30 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-58dd3528497so4879627eaf.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 21:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702531167; x=1703135967; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZ5LJsuIpc2ywZzsWONJUwLQnWCBkWBFVVRz6w8SfhI=;
        b=sG2g+ZPxlpoIQSVi5L5n45HyAt5MBWXSUU6qZu+vvXzqmWb2ebEnBXCIMrC8kMWLu2
         AXajc+dUoJxrYWCxa8iUiLNbCJ/RnCckQVeNgSS+X7BjjFjbBPR1IhJh2vZ8mU625ic8
         WkwKtaqS/vCtxI/5f0ya6ZsxAHmic0PAMWT683lNaq2e6WaQs0YOKuG7XbAMDRAh/sBN
         TScLDY2rZ6teuwlIXZQsvlNMsTz185lOJ4y0VqLY+3oFUbXTQypaEWVpUFhSrUjh+nXi
         Uz0cO1lO56/YmgOnnrMQLxSi3KazTiTa/ennJtlAdunMhdKjUluyIoq+UQpgL9DnP2yX
         xZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702531167; x=1703135967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZ5LJsuIpc2ywZzsWONJUwLQnWCBkWBFVVRz6w8SfhI=;
        b=BZqpIcUKDsXwjh+YisFj+vJ6tEpFno2qMb9vnwsHxS/KzpZ2VKrej7wbRGkbpOCpBb
         WUa81OiLKYRpmGoiD22ZgT//4JvQ77JXYgHgV/oyiF6biqREWFYxxZ+gkNzu5r934MXZ
         5pde8PycDUBZMGPLakQjYDNPFjRgG2IU/C62u6Wm44XOEtmdD6sUvfukL+CjRuab0Lom
         Pf0x5Acfgt02f34tuEXMOXE29yvdhmUb4sUqe6CiZgLv71P81o8HDAxaPBlRgaxIqwkH
         xSVBO4jJn6VnPKW1pSTdbADtpaSFixIB5Gr3rqj5GDQpbZZObHvuN53mASHQNtyvDilU
         pEEw==
X-Gm-Message-State: AOJu0YxStsZTVj+Bs18kxicY6LNWfYbC180RBA0J0ONFyzvJOLiVUYYB
	vE8Qr8tuylwbw2B1/V8xECnxMQdOeA4tf8Y10pPT/HfKE5gzqs1tUG4=
X-Google-Smtp-Source: AGHT+IHZh16uwjTlbyPSRMfVlBhSXsJg7GOxL73NesnE9PeEihyrSajnKVUWGfFCP4VTSYN3XPZFcievngFqoSGudeM=
X-Received: by 2002:a05:6359:a1a:b0:170:52eb:af31 with SMTP id
 el26-20020a0563590a1a00b0017052ebaf31mr9806515rwb.56.1702531167113; Wed, 13
 Dec 2023 21:19:27 -0800 (PST)
MIME-Version: 1.0
References: <20231213170951.93453-8-ajones@ventanamicro.com>
In-Reply-To: <20231213170951.93453-8-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Dec 2023 10:49:15 +0530
Message-ID: <CAAhSdy1N2BaExXsTJnxn=UJ4G5cLQv0WY8mK41miZA9WNFO26w@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] RISC-V: KVM: Make SBI uapi consistent with ISA uapi
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	atishp@atishpatra.org, palmer@dabbelt.com, haibo1.xu@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_211929_313679_F0D425A9 
X-CRM114-Status: GOOD (  13.56  )
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

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMTA6MznigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFNCSSBleHRlbnNpb24gVUFQSSBpcyBjdXJyZW50
bHkgYWxtb3N0IHRoZSBzYW1lIGFzIHRoZSBJU0EgZXh0ZW5zaW9uCj4gVUFQSS4gVGhpcyBzZXJp
ZXMgY2xvc2VzIHRoZSByZW1haW5pbmcgZ2FwIGJ5IGVuc3VyaW5nIHdoZW4gYW4gU0JJCj4gZXh0
ZW5zaW9uIGlzIG5vdCBhdmFpbGFibGUgdGhhdCBpdHMgcmVnaXN0ZXIgcmV0dXJucyBFTk9FTlQg
d2hlbgo+IGFjY2Vzc2VkIGJ5IHVzZXJzcGFjZS4gV2UgYWxzbyBkcm9wIHRoZSBTQkkgbXVsdGkg
cmVnaXN0ZXJzIGZyb20KPiBnZXQtcmVnLWxpc3QgKElTQSBtdWx0aSByZWdpc3RlcnMgYXJlbid0
IHRoZXJlIGVpdGhlcikgYW5kIG1ha2UKPiBzZXZlcmFsIGltcHJvdmVtZW50cyB0byB0aGUgZ2V0
LXJlZy1saXN0IGtzZWxmdGVzdC4KPgo+IFRoaXMgc2VyaWVzIGlzIGJhc2VkIG9uIEFudXAncyBy
aXNjdl9rdm1fbW9yZV9leHRzX3YxIGJyYW5jaC4KPgo+IEJhc2VkIG9uIGt2bS1yaXNjdi9yaXNj
dl9rdm1fcXVldWUKPgo+IHYyOgo+ICAtIFJlYmFzZWQgb24ga3ZtLXJpc2N2L3Jpc2N2X2t2bV9x
dWV1ZSB3aGljaCBpcyBiYXNlZCBvbiB2Ni43LXJjNQo+Cj4gVGhhbmtzLAo+IGRyZXcKPgo+Cj4g
QW5kcmV3IEpvbmVzICg2KToKPiAgIFJJU0MtVjogS1ZNOiBEb24ndCBhZGQgU0JJIG11bHRpIHJl
Z3MgaW4gZ2V0LXJlZy1saXN0Cj4gICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IERyb3AgU0JJIG11
bHRpIHJlZ2lzdGVycwo+ICAgUklTQy1WOiBLVk06IE1ha2UgU0JJIHVhcGkgY29uc2lzdGVudCB3
aXRoIElTQSB1YXBpCj4gICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBSSVNDVl9TQklfRVhU
X1JFRwo+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBVc2UgcmVnaXN0ZXIgc3VidHlwZXMKPiAg
IFJJU0MtVjogS1ZNOiBzZWxmdGVzdHM6IFRyZWF0IFNCSSBleHQgcmVncyBsaWtlIElTQSBleHQg
cmVncwoKUXVldWVkIHRoaXMgc2VyaWVzIGZvciBMaW51eC02LjgKClRoYW5rcywKQW51cAoKPgo+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oICAgICAgICAgfCAgMTAgKy0K
PiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyAgICAgICAgICAgICAgICAgIHwgIDUzICsr
LS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgICAgICAgICAgICAgICAgICAgICB8ICA3
NSArKystLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jICAgICAgICAgICAg
IHwgICAyICstCj4gIC4uLi9zZWxmdGVzdHMva3ZtL2luY2x1ZGUva3ZtX3V0aWxfYmFzZS5oICAg
ICB8ICAgMSArCj4gIC4uLi9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmgg
ICB8ICA0MCArKy0tCj4gIC4uLi9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYyAg
ICAgICB8ICAgNCArLQo+ICAuLi4vc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAg
ICAgICAgfCAyMjAgKysrKysrKysrKysrKy0tLS0tCj4gIDggZmlsZXMgY2hhbmdlZCwgMjU0IGlu
c2VydGlvbnMoKyksIDE1MSBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi40My4wCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
