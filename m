Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A9DC3ABA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 05:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AX/yWlTKtQQEpkvF1FxRjScn/0RwQcrd6n5P8McpIOo=; b=w4O+TW4dxk8T4L
	YWA+Tv4ilpNm/gC0MYtvEPQot8aWJy8CQQBElE4IWdPIrKyPF4UYFLHnYVGMY6DAoqFJ8tC07v2Cw
	IaruVMBK/rTRArok9mkJtv7o4smVio9uFQ5PmP1WzgvfQ2qlGUt9uuxb1J0SaVoM4eBbNbXP8Z+uI
	ApGphu60rksIb+GNmiSHGLM3clOjtgu6iE15VOSbg2a3miW9daikPdPVN3re/MeA7VyAT72c4bHYC
	A9J4s9itT8l07l/afdYBPRozFtr4/U59XjhkWgrGiuin3MtKXP9BrmsE3lOJIDHO5oGd/dD7xroOr
	75v7fpTV4BvSs5w6QV6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9drE-00000008R8L-2HYa;
	Tue, 29 Apr 2025 05:50:16 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9drB-00000008R5f-3Gtq
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 05:50:15 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-31062172698so58468091fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Apr 2025 22:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745905812; x=1746510612; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWfOibW0zJXCdtORmeJHJfO7jAlDvwO4GvsgR2VT7fc=;
        b=dBFWHtKgBibY8hYdAK1PTIaLqV5EU9RpBlMbVkRwnq95NJW6QnpUsLtaHzm00iPsRB
         uj1SD34Q/LBwtXyro0kgHwS7naZvjH/xIGNaDM7LoPvuFTu8v8QRNDoZIv8ucAoA2Edf
         /TsgY/Hx17AN0Lf/JAsxzNL0SprgCESwxcWR6mpXmMO6uMFyizmtVdwKX2ek6L7SSZlg
         HtRMXyeNjD6TCh/cEuQuDaFuS/gEchl+TTFVqOt8bdfjEX2aDcjp8XqtkgR9u7MSdyNi
         /aN3OW7YbwxuuHZhM5msODnjP99c9mP+crCISLV6Z8IlJf4UXwYgMB7QhcztQg5syLvE
         0MaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745905812; x=1746510612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWfOibW0zJXCdtORmeJHJfO7jAlDvwO4GvsgR2VT7fc=;
        b=Mx85AixX+mfLShBw11rLg1oGwzVT26WllBbNss6fTNMXb+HExDykInSWUdm56/WN/N
         XEsGnOtDCs144PD9lsAyx1kD0YIxaz1N6C1Cv4l8GWakPWJoAEgI2F5NfLBi4LkeQsT7
         QH4YrLR2sfP03T01Mc73uL9jNCTKRDFAUSJw+vGXQZCWPVYdIIX7Nh1JJ4iKetY6Wquq
         0zKRPZl9rvdvu09FLRp+1zh+PPHTkvtHJ/gqbTADK1ESd2WlqRzV8+EV8RZweQs31Zd1
         pT8xWHqfI2OHS3PkVBhNXmdVUeHo7+c5RaW9v5oXqbYDfSIKZq7l7luWpsMbQio3+ls1
         BIaw==
X-Forwarded-Encrypted: i=1; AJvYcCUgRyeSvm97DU9fKQSoLCblYzulfMWs1ydzmqMKfds8AqcLO52JdJj2GVh6++W8gq+x3Lv2lmP++x62Aw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXPzcTCPmBtt5XQTl11RzJo5oddV2B6ncEA6uIKYuymFIJnqp5
	UM1NMMtRQqXQhNawlT2uOqQkxEPmj0L8ZdYOSAI+WWgL0GkRpA+90zCofIC2m9xNtnfe8PMbuVI
	QHvpAIAkNY0A1vfHqeouYm5n8f6xFgtnqcgGhmg==
X-Gm-Gg: ASbGnctR2m54pqLfgpZk8vSGQWxXq7cBbs4mJaK92qPFt8wIQErb4wDOujTJ2sykrXH
	zd5m5su2z02AfP7E9kb1HxDF+ktS9L8Llw2V7kByfIJ9pvpTb3xQez0d99cqqzb/+ymDIMgQFI6
	d8bWDk8lVrWtc8RnJx1j7BAxLgXSlrMRcnzw==
X-Google-Smtp-Source: AGHT+IEXIWagJECOG4RLoTrQYomZ3sHcSOAll8CYP8clhn9zHjblZNubHzN3OqgFWmMSijyY1wb9UjZJkI4zeEP4uLw=
X-Received: by 2002:a2e:be9e:0:b0:30c:460f:f56 with SMTP id
 38308e7fff4ca-31d34d60533mr6426041fa.20.1745905811969; Mon, 28 Apr 2025
 22:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-6-rkrcmar@ventanamicro.com> <CAAhSdy1RSpVCUzD+Aqbhh7aiQPmC2zdvuQfuOsmYNJrF3HxCsA@mail.gmail.com>
 <D9IGVF0OY4WJ.1O1BX0M2LWUVM@ventanamicro.com>
In-Reply-To: <D9IGVF0OY4WJ.1O1BX0M2LWUVM@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 29 Apr 2025 11:20:00 +0530
X-Gm-Features: ATxdqUGsRoK2KaLKI32KI2F__RZN-02oqDCocnMiqzg_aZlzW8XBSk76LkacWdo
Message-ID: <CAK9=C2W3gLpeOmOcX3sp+J1zuBkWek7nO8tV79=gaWx+QZ6rgQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] KVM: RISC-V: remove unnecessary SBI reset state
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_225013_818234_9849000F 
X-CRM114-Status: GOOD (  24.21  )
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

T24gTW9uLCBBcHIgMjgsIDIwMjUgYXQgMTE6MzHigK9QTSBSYWRpbSBLcsSNbcOhxZkgPHJrcmNt
YXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiAyMDI1LTA0LTI4VDE3OjQ2OjAxKzA1OjMw
LCBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPjoKPiA+IE9uIFRodSwgQXByIDMsIDIw
MjUgYXQgNTowMuKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29t
PiB3cm90ZToKPiA+Pgo+ID4+IFRoZSBTQkkgcmVzZXQgc3RhdGUgaGFzIG9ubHkgdHdvIHZhcmlh
YmxlcyAtLSBwYyBhbmQgYTEuCj4gPj4gVGhlIHJlc3QgaXMga25vd24sIHNvIGtlZXAgb25seSB0
aGUgbmVjZXNzYXJ5IGluZm9ybWF0aW9uLgo+ID4+Cj4gPj4gVGhlIHJlc2V0IHN0cnVjdHVyZXMg
bWFrZSBzZW5zZSBpZiB3ZSB3YW50IHVzZXJzcGFjZSB0byBjb250cm9sIHRoZQo+ID4+IHJlc2V0
IHN0YXRlICh3aGljaCB3ZSBkbyksIGJ1dCBJJ2Qgc3RpbGwgcmVtb3ZlIHRoZW0gbm93IGFuZCBy
ZWludHJvZHVjZQo+ID4+IHdpdGggdGhlIHVzZXJzcGFjZSBpbnRlcmZhY2UgbGF0ZXIgLS0gd2Ug
Y291bGQgcHJvYmFibHkgaGF2ZSBqdXN0IGEKPiA+PiBzaW5nbGUgcmVzZXQgc3RhdGUgcGVyIFZN
LCBpbnN0ZWFkIG9mIGEgcmVzZXQgc3RhdGUgZm9yIGVhY2ggVkNQVS4KPiA+Cj4gPiBUaGUgU0JJ
IHNwZWMgZG9lcyBub3QgZGVmaW5lIHRoZSByZXNldCBzdGF0ZSBvZiBDUFVzLiBUaGUgU0JJCj4g
PiBpbXBsZW1lbnRhdGlvbnMgKGFrYSBLVk0gUklTQy1WIG9yIE9wZW5TQkkpIG9yIHBsYXRmb3Jt
Cj4gPiBmaXJtd2FyZXMgYXJlIGZyZWUgdG8gY2xlYXIgYWRkaXRpb25hbCByZWdpc3RlcnMgYXMg
cGFydCBzeXN0ZW0KPiA+IHJlc2V0IG9yIENQVS4KPiA+Cj4gPiBBcyBwYXJ0IG9mIHJlc2V0dGlu
ZyB0aGUgVkNQVSwgdGhlIGluLWtlcm5lbCBLVk0gY2xlYXJzIGFsbAo+ID4gdGhlIHJlZ2lzdGVy
cy4KPgo+IFllcywgYnV0IGluc3RlYWQgb2YgZG9pbmcgYSBzaW1wbGUgbWVtc2V0KDApLCBLVk0g
Y2FycmllcnMgYXJvdW5kIGEgbG90Cj4gb2YgZGF0YSB3aXRoIG1pbmltYWwgaW5mb3JtYXRpb24g
dmFsdWUuICBSZXNldCBpcyBub3QgcmVhbGx5IGEgZmFzdAo+IHBhdGgsIHNvIEkgdGhpbmsgaXQg
d291bGQgYmUgZ29vZCB0byBoYXZlIHRoZSBjb2RlIHRoZXJlIGFzIHNpbXBsZSBhcwo+IHBvc3Np
YmxlLgo+Cj4gPiBUaGUgc2V0dGluZyBvZiBQQywgQTAsIGFuZCBBMSBpcyBvbmx5IGFuIGVudHJ5
IGNvbmRpdGlvbiBkZWZpbmVkCj4gPiBmb3IgQ1BVcyBicm91Z2h0LXVwIHVzaW5nIFNCSSBIU00g
c3RhcnQgb3IgU0JJIFN5c3RlbSBzdXNwZW5kLgo+Cj4gVGhhdCBpcyB3aHkgdGhpcyBwYXRjaCBo
YXMgdG8gYWRkIGt2bV92Y3B1X3Jlc2V0X3N0YXRlLCB0byByZW1lbWJlciB0aGUKPiBzdGF0ZSBv
ZiBwYyBhbmQgYTEuICAoYTAgaXMgaGFydCBpZCBhbmQgY2FuIGJlIGZpZ3VyZWQgb3V0LikKPgo+
ID4gV2Ugc2hvdWxkIG5vdCBnbyBhaGVhZCB3aXRoIHRoaXMgcGF0Y2guCj4KPiBUaGlzIHBhdGNo
IG9ubHkgZG9lcyByZWZhY3RvcmluZy4gIERvIHlvdSB0aGluayB0aGUgY3VycmVudCByZXNldAo+
IHN0cnVjdHVyZXMgYXJlIGJldHRlcj8KPgoKSSBhbSBmaW5lIGdldHRpbmcgcmlkIG9mIHJlc2V0
IHN0cnVjdHVyZXMgYXMgbG9uZyBhcyB3ZSBoYXZlCm1lbXNldCgwKSBpbi1wbGFjZSB0byBhY2hp
ZXZlIHRoZSBzYW1lIHRoaW5nLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
