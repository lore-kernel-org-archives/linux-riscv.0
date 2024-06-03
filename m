Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38685C25B75
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 11:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXIk1I36Ja6dG/9djyVsZXnxFu0w8vzieow+y74T/xQ=; b=WDrX54nfbAp26r
	m3/XZ//cppciCRD7VeBzD6sFUGp3/p7DxBFeyljcNcx81x6OJyJFetariIYKElyrrY9qNnbuXJvR7
	v2dHmQvrkRdLwj5Z4S0JGV86V0PPTevOpNw+oy0R/GPNcTlGtNx4IvNRTq4Alo5mvdPOvcMOhEPeh
	ValTffc/j/qmaXti2FhdqN8OHQKWweAApy9K1acNpvlb1ZNKquB6qqJfar/1w4CUd5OvC3DslnPX+
	zw3+3Tn1V1jugu9hBjqkXPCHGxG5d7ETB6cJxmsEkGMMYXoLZzFqrfcufST7qMVgpzisNOcu3kyc4
	qimH+fZoWqIdSYPjdiXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE63A-0000000GYuh-3L2p;
	Mon, 03 Jun 2024 11:40:28 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE636-0000000GYsK-23q8
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 11:40:26 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-371cc143f6aso19925425ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jun 2024 04:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1717414822; x=1718019622; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jznY1UA7/SXmEB87TeYXPvswNX7BAys1PkdQILLo1MY=;
        b=KGr/HVQe4L9HxNnbn9VSi+3hyVjfJ9Ku004HP1pWZt/zbQLx8NnzJns2x/OCGarDrE
         dzr1P0xTMUCOZpYS2IY0BRtfILbUVIFOeZNyPVmWttiSA+31mDebHGmfS3PvDZ5sIJlr
         auMu71wrwGNzjtNFQCFUHdNHE0Lq5X1Y2lvVfZYkYvBb92j5ij2VagGhdzItFMc2huxr
         7ksrovjXplMVIEUVxxfHcpPGFdHzBiXi13Bpen/5VOQk0ZCAgUCXi5cydg56o4a7yZtV
         91QLmQ8dkBhSG11o0IIe074xS4uB7uySazY59PWAPwP4l1U4xtxWPEN0fm1I4PL0hkE4
         BqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717414822; x=1718019622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jznY1UA7/SXmEB87TeYXPvswNX7BAys1PkdQILLo1MY=;
        b=pbR+kFPNe/EJES+zIDv7Z1OlV9cxa/kIAaarIZCOO2XE0BLQ9+/h0ytSWx5ddjhgI7
         3bjDIbH4YsI7orodbfc1HHUUG497suYkHWlwxy2yudqn64vhDiZQABd/Z+Haq9+f6+NG
         fnfxqCTHmSe+h8xOUT5xpCAllCbqaxioIFCklaI2WkoF/pFTAomW37uVCTVro+TAPOc0
         /oxotndO6jVeb+3HIff6GuEyUKtKg0oBCmlCcbzYURkLchn/joZ6sKkq9XE++No3lrYd
         Vg3iRHb8YR7FswXxjDZ4a9FtyVlwEuVewdno9K+OfdNUg7oIK9QYwbSJunyyn9cR1ggC
         ZU8g==
X-Forwarded-Encrypted: i=1; AJvYcCXMH0iUsy/YbWpFqjpWCPOcH+5/JP1z1E9wF8ymNS+FOxKyco6go5g6JcYnvYxEcDlC6qKRh9kgtNsdbF8WJ1D1TpbnZhYaF49Odh27o/EA
X-Gm-Message-State: AOJu0Yxo8fbvXkEW2O7FaGhKJk//tXrFwrLHmTCrB3hAa/8W5hvT25jT
	8qUcT6KzCecsVVl2uTSatKQnIQu5GenEZW14aX22Yw20Ut/twCpHdS8HFiKDTg+xPiWgtwBZAaR
	d6lQZyOGnlj1vozLGg01ardQCufjso+nhAwURLQ==
X-Google-Smtp-Source: AGHT+IGJ9Mvf8z85SE/NFg8HuQmyPGDBsDk+Yroy5ITFqpG+kRyKvmd5ME6X9GIu0azVzqIEgdBbQinMEvImFyXLYtw=
X-Received: by 2002:a05:6e02:216a:b0:374:9995:b369 with SMTP id
 e9e14a558f8ab-3749995b506mr46562275ab.4.1717414822141; Mon, 03 Jun 2024
 04:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
 <20240524103307.2684-2-yongxuan.wang@sifive.com> <20240527-41b376a2bfedb3b9cf7e9c7b@orel>
 <ec110587-d557-439b-ae50-f3472535ef3a@ghiti.fr> <20240530-3e5538b8e4dea932e2d3edc4@orel>
 <3b76c46f-c502-4245-ae58-be3bd3f8a41f@ghiti.fr> <20240530-de1fde9735e6648dc34654f3@orel>
 <f2016305-e24b-41ea-8c48-cfdeb8ee6b48@ghiti.fr>
In-Reply-To: <f2016305-e24b-41ea-8c48-cfdeb8ee6b48@ghiti.fr>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 3 Jun 2024 17:10:10 +0530
Message-ID: <CAAhSdy2dJaNWYH88RhjiUktX5n4-ZfFuXsjyYeJ-+Y8qOf7zRA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/5] RISC-V: Detect and Enable Svadu Extension Support
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Andrew Jones <ajones@ventanamicro.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	cleger@rivosinc.com, Jinyu Tang <tjytimi@163.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Samuel Ortiz <sameo@rivosinc.com>, Evan Green <evan@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Charlie Jenkins <charlie@rivosinc.com>, 
	Leonardo Bras <leobras@redhat.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_044024_810143_5445727B 
X-CRM114-Status: GOOD (  41.29  )
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

T24gTW9uLCBKdW4gMywgMjAyNCBhdCA0OjU54oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdo
aXRpLmZyPiB3cm90ZToKPgo+IE9uIDMwLzA1LzIwMjQgMTE6MjQsIEFuZHJldyBKb25lcyB3cm90
ZToKPiA+IE9uIFRodSwgTWF5IDMwLCAyMDI0IGF0IDExOjAxOjIwQU0gR01ULCBBbGV4YW5kcmUg
R2hpdGkgd3JvdGU6Cj4gPj4gSGkgQW5kcmV3LAo+ID4+Cj4gPj4gT24gMzAvMDUvMjAyNCAxMDo0
NywgQW5kcmV3IEpvbmVzIHdyb3RlOgo+ID4+PiBPbiBUaHUsIE1heSAzMCwgMjAyNCBhdCAxMDox
OToxMkFNIEdNVCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4+Pj4gSGkgWW9uZy1YdWFuLAo+
ID4+Pj4KPiA+Pj4+IE9uIDI3LzA1LzIwMjQgMTg6MjUsIEFuZHJldyBKb25lcyB3cm90ZToKPiA+
Pj4+PiBPbiBGcmksIE1heSAyNCwgMjAyNCBhdCAwNjozMzowMVBNIEdNVCwgWW9uZy1YdWFuIFdh
bmcgd3JvdGU6Cj4gPj4+Pj4+IFN2YWR1IGlzIGEgUklTQy1WIGV4dGVuc2lvbiBmb3IgaGFyZHdh
cmUgdXBkYXRpbmcgb2YgUFRFIEEvRCBiaXRzLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBJbiB0aGlzIHBh
dGNoIHdlIGRldGVjdCBTdmFkdSBleHRlbnNpb24gc3VwcG9ydCBmcm9tIERUQiBhbmQgZW5hYmxl
IGl0Cj4gPj4+Pj4+IHdpdGggU0JJIEZXRlQgZXh0ZW5zaW9uLiBBbHNvIHdlIGFkZCBhcmNoX2hh
c19od19wdGVfeW91bmcoKSB0byBlbmFibGUKPiA+Pj4+Pj4gb3B0aW1pemF0aW9uIGluIE1HTFJV
IGFuZCBfX3dwX3BhZ2VfY29weV91c2VyKCkgaWYgU3ZhZHUgZXh0ZW5zaW9uIGlzCj4gPj4+Pj4+
IGF2YWlsYWJsZS4KPiA+Pj4+IFNvIHdlIHRhbGtlZCBhYm91dCB0aGlzIHllc3RlcmRheSBkdXJp
bmcgdGhlIGxpbnV4LXJpc2N2IHBhdGNod29yayBtZWV0aW5nLgo+ID4+Pj4gV2UgY2FtZSB0byB0
aGUgY29uY2x1c2lvbiB0aGF0IHdlIHNob3VsZCBub3Qgd2FpdCBmb3IgdGhlIFNCSSBGV0ZUIGV4
dGVuc2lvbgo+ID4+Pj4gdG8gZW5hYmxlIFN2YWR1IGJ1dCBpbnN0ZWFkLCBpdCBzaG91bGQgYmUg
ZW5hYmxlZCBieSBkZWZhdWx0IGJ5IG9wZW5TQkkgaWYKPiA+Pj4+IHRoZSBleHRlbnNpb24gaXMg
cHJlc2VudCBpbiB0aGUgZGV2aWNlIHRyZWUuIFRoaXMgaXMgYmVjYXVzZSB3ZSBkaWQgbm90IGZp
bmQKPiA+Pj4+IGFueSBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IGlzc3VlcywgbWVhbmluZyB0aGF0
IGVuYWJsaW5nIFN2YWR1IHNob3VsZCBub3QKPiA+Pj4+IGJyZWFrIGFueSBTLW1vZGUgc29mdHdh
cmUuCj4gPj4+IFVuZm9ydHVuYXRlbHkgSSBqb2luZWQgeWVzdGVyZGF5J3MgcGF0Y2h3b3JrIGNh
bGwgbGF0ZSBhbmQgbWlzc2VkIHRoaXMKPiA+Pj4gZGlzY3Vzc2lvbi4gSSdtIHN0aWxsIG5vdCBz
dXJlIGhvdyB3ZSBhdm9pZCBjb25jZXJucyB3aXRoIFMtbW9kZSBzb2Z0d2FyZQo+ID4+PiBleHBl
Y3RpbmcgZXhjZXB0aW9ucyBieSBwdXJwb3NlbHkgbm90IHNldHRpbmcgQS9EIGJpdHMsIGJ1dCB0
aGVuIG5vdAo+ID4+PiBnZXR0aW5nIHRob3NlIGV4Y2VwdGlvbnMuCj4gPj4KPiA+PiBNb3N0IG90
aGVyIGFyY2hpdGVjdHVyZXMgaW1wbGVtZW50IGhhcmR3YXJlIEEvRCB1cGRhdGVzLCBzbyBJIGRv
bid0IHNlZQo+ID4+IHdoYXQncyBzcGVjaWZpYyBpbiByaXNjdi4gSW4gYWRkaXRpb24sIGlmIGFu
IE9TIHJlYWxseSBuZWVkcyB0aGUgZXhjZXB0aW9ucywKPiA+PiBpdCBjYW4gYWx3YXlzIHBsYXkg
d2l0aCB0aGUgcGFnZSB0YWJsZSBwZXJtaXNzaW9ucyB0byBhY2hpZXZlIHN1Y2gKPiA+PiBiZWhh
dmlvdXIuCj4gPiBIbW0sIHllYWggd2UncmUgcHJvYmFibHkgcHJldHR5IHNhZmUgc2luY2Ugc29y
dGluZyB0aGlzIG91dCBpcyBqdXN0IG9uZSBvZgo+ID4gbWFueSB0aGluZ3MgYW4gT1Mgd2lsbCBo
YXZlIHRvIGxlYXJuIHRvIG1hbmFnZSB3aGVuIGdldHRpbmcgcG9ydGVkLiBBbHNvLAo+ID4gaGFu
ZGxpbmcgYm90aCBzdmFkZSBhbmQgc3ZhZHUgYXQgYm9vdCBpcyB0cml2aWFsIHNpbmNlIHRoZSBP
UyBzaW1wbHkgbmVlZHMKPiA+IHRvIHNldCB0aGUgQS9EIGJpdHMgd2hlbiBjcmVhdGluZyB0aGUg
UFRFcyBvciBoYXZlIGV4Y2VwdGlvbiBoYW5kbGVycwo+ID4gd2hpY2ggZG8gbm90aGluZyBidXQg
c2V0IHRoZSBiaXRzIHJlYWR5IGp1c3QgaW4gY2FzZS4KPiA+Cj4gPj4KPiA+Pj4+IFRoaXMgaXMg
d2hhdCB5b3UgZGlkIGluIHlvdXIgcHJldmlvdXMgdmVyc2lvbnMgb2YKPiA+Pj4+IHRoaXMgcGF0
Y2hzZXQgc28gdGhlIGNoYW5nZXMgc2hvdWxkIGJlIGVhc3kuIFRoaXMgYmVoYXZpb3VyIG11c3Qg
YmUgYWRkZWQgdG8KPiA+Pj4+IHRoZSBkdGJpbmRpbmcgZGVzY3JpcHRpb24gb2YgdGhlIFN2YWR1
IGV4dGVuc2lvbi4KPiA+Pj4+Cj4gPj4+PiBBbm90aGVyIHRoaW5nIHRoYXQgd2UgZGlzY3Vzc2Vk
IHllc3RlcmRheS4gVGhlcmUgZXhpc3QgMiBzY2hlbWVzIHRvIG1hbmFnZQo+ID4+Pj4gdGhlIEEv
RCBiaXRzIHVwZGF0ZXMsIFN2YWRlIGFuZCBTdmFkdS4gSWYgYSBwbGF0Zm9ybSBzdXBwb3J0cyBi
b3RoCj4gPj4+PiBleHRlbnNpb25zIGFuZCBib3RoIGFyZSBwcmVzZW50IGluIHRoZSBkZXZpY2Ug
dHJlZSwgaXQgaXMgTS1tb2RlIGZpcm13YXJlJ3MKPiA+Pj4+IHJlc3BvbnNpYmlsaXR5IHRvIHBy
b3ZpZGUgYSAic2FuZSIgZGV2aWNlIHRyZWUgdG8gdGhlIFMtbW9kZSBzb2Z0d2FyZSwKPiA+Pj4+
IG1lYW5pbmcgdGhlIGRldmljZSB0cmVlIGNhbiBub3QgY29udGFpbiBib3RoIGV4dGVuc2lvbnMu
IEFuZCBiZWNhdXNlIG9uIHN1Y2gKPiA+Pj4+IHBsYXRmb3JtcywgU3ZhZHUgaXMgbW9yZSBwZXJm
b3JtYW50IHRoYW4gU3ZhZGUsIFN2YWR1IHNob3VsZCBiZSBlbmFibGVkIGJ5Cj4gPj4+PiB0aGUg
TS1tb2RlIGZpcm13YXJlIGFuZCBvbmx5IFN2YWR1IHNob3VsZCBiZSBwcmVzZW50IGluIHRoZSBk
ZXZpY2UgdHJlZS4KPiA+Pj4gSSdtIG5vdCBzdXJlIGZpcm13YXJlIHdpbGwgYmUgYWJsZSB0byBj
aG9vc2Ugc3ZhZHUgd2hlbiBpdCdzIGF2YWlsYWJsZS4KPiA+Pj4gRm9yIGV4YW1wbGUsIHBsYXRm
b3JtcyB3aGljaCB3YW50IHRvIGNvbmZvcm0gdG8gdGhlIHVwY29taW5nICJTZXJ2ZXIKPiA+Pj4g
UGxhdGZvcm0iIHNwZWNpZmljYXRpb24gbXVzdCBhbHNvIGNvbmZvcm0gdG8gdGhlIFJWQTIzIHBy
b2ZpbGUsIHdoaWNoCj4gPj4+IG1hbmRhdGVzIFN2YWRlIGFuZCBsaXN0cyBTdmFkdSBhcyBhbiBv
cHRpb25hbCBleHRlbnNpb24uIFRoaXMgaW1wbGllcyB0bwo+ID4+PiBtZSB0aGF0IFMtbW9kZSBz
aG91bGQgYmUgYm9vdCB3aXRoIGJvdGggc3ZhZGUgYW5kIHN2YWR1IGluIHRoZSBEVCBhbmQgd2l0
aAo+ID4+PiBzdmFkZSBiZWluZyB0aGUgYWN0aXZlIG9uZS4gVGhlbiwgUy1tb2RlIGNhbiBjaG9v
c2UgdG8gcmVxdWVzdCBzd2l0Y2hpbmcKPiA+Pj4gdG8gc3ZhZHUgd2l0aCBGV0ZULgo+ID4+Cj4g
Pj4gVGhlIHByb2JsZW0gaXMgdGhhdCBGV0ZUIGlzIG5vdCB0aGVyZSBhbmQgd29uJ3QgYmUgdGhl
cmUgZm9yIH4xeSAoYWNjb3JkaW5nCj4gPj4gdG8gQW51cCkuIFNvIGluIHRoZSBtZWFudGltZSwg
d2UgcHJldmVudCBhbGwgdWFyY2hzIHRoYXQgc3VwcG9ydCBTdmFkdSB0bwo+ID4+IHRha2UgYWR2
YW50YWdlIG9mIHRoaXMuCj4gPiBJIHRoaW5rIHdlIHNob3VsZCBoYXZlIGRvY3VtZW50ZWQgYmVo
YXZpb3JzIGZvciBhbGwgZm91ciBwb3NzaWJpbGl0aWVzCj4gPgo+ID4gICAxLiBOZWl0aGVyIHN2
YWRlIG5vciBzdmFkdSBpbiBEVCAtLSBjdXJyZW50IGJlaGF2aW9yCj4gPiAgIDIuIE9ubHkgc3Zh
ZGUgaW4gRFQgLS0gY3VycmVudCBiZWhhdmlvcgo+ID4gICAzLiBPbmx5IHN2YWR1IGluIERUIC0t
IGV4cGVjdCBoYXJkd2FyZSBBL0QgdXBkYXRpbmcKPiA+ICAgNC4gQm90aCBzdmFkZSBhbmQgc3Zh
ZHUgaW4gRFQgLS0gY3VycmVudCBiZWhhdmlvciwgYnV0LCBpZiB3ZSBoYXZlIEZXRlQsCj4gPiAg
ICAgIHRoZW4gdXNlIGl0IHRvIHN3aXRjaCB0byBzdmFkdS4gSWYgd2UgZG9uJ3QgaGF2ZSBGV0ZU
LCB0aGVuLCBvaCB3ZWxsLi4uCj4gPgo+ID4gUGxhdGZvcm1zL2Zpcm13YXJlcyB0aGF0IGFyZW4n
dCBjb25jZXJuZWQgd2l0aCB0aGUgcHJvZmlsZXMgY2FuIGNob29zZSAoMykKPiA+IGFuZCBMaW51
eCBpcyBmaW5lLiBUaG9zZSB0aGF0IGRvIHdhbnQgdG8gY29uZm9ybSB0byB0aGUgcHJvZmlsZSB3
aWxsCj4gPiBjaG9vc2UgKDQpIGJ1dCBMaW51eCB3b24ndCBnZXQgdGhlIGJlbmVmaXQgb2Ygc3Zh
ZHUgdW50aWwgaXQgYWxzbyBnZXRzCj4gPiBGV0ZULgo+Cj4KPiBJIHRoaW5rIHRoaXMgc29sdXRp
b24gcGxlYXNlcyBldmVyeW9uZSBzbyBJJ2Qgc2F5IHdlIHNob3VsZCBnbyBmb3IgaXQsCj4gdGhh
bmtzIEFuZHJldyEKClllcywgdGhpcyBsb29rcyBnb29kIHRvIG1lIGFzIHdlbGwuIFRoZSBrZXkg
YXNwZWN0IGlzIGRvY3VtZW50aW5nCnRoZSBiZWhhdmlvdXIgb2YgdGhlc2UgZm91ciBwb3NzaWJp
bGl0aWVzLgoKUmVnYXJkcywKQW51cAoKPgo+IEBZb25nLVh1YW4gZG8geW91IHRoaW5rIHlvdSBj
YW4gcHJlcGFyZSBhbm90aGVyIHNwaW4gd2l0aCBBbmRyZXcncwo+IHByb3Bvc2FsIGltcGxlbWVu
dGVkPwo+Cj4gVGhhbmtzLAo+Cj4gQWxleAo+Cj4KPiA+Cj4gPiBJT1csIEkgdGhpbmsgeW91ciBw
cm9wb3NhbCBpcyBmaW5lIGV4Y2VwdCBmb3Igd2FudGluZyB0byBkb2N1bWVudCBpbiB0aGUKPiA+
IERUIGJpbmRpbmdzIHRoYXQgb25seSBzdmFkZSBvciBzdmFkdSBtYXkgYmUgcHJvdmlkZWQsIHNp
bmNlIEkgdGhpbmsgd2UnbGwKPiA+IHdhbnQgYm90aCB0byBiZSBhbGxvd2VkIGV2ZW50dWFsbHku
Cj4gPgo+ID4gVGhhbmtzLAo+ID4gZHJldwo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+
IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
