Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56C4C25B75
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 02:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0+kbiUXjJhW0jd+21u4p8ZPryELBOKMm3I8pQeTtn4=; b=GfML+3eMCqo4NG
	g0mXj+/fUhZh9oA3HO4bj6+z1U/rt9mjpI0xsETRPZ8SGPvvP8ar6N3+TSDGA6a7ZgZ5pFoLL96K2
	myIpnVDGbNTm3oGPZ9nXOpXfB2+u6Gg3u3jbx2miWb5O5fa9/vKTmBTqjPhVMug0PK88yTNoi+cCT
	izVFmz2pNTgCP+ZGgNM3ywjUjAaaz5clxO9PgAeTK0i1IsDvhlKF/V4E8kf1Nu0nkPgMg30ojlNVk
	sDE9NmAMkC0k743ohugHelZfegNcpGK9nTUvzDtiMxErU/OJEgAb++OZxwhSWt1O6pJ2uy5RN9TqY
	aRzjKTvMoKMRTbexda1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEJsh-00000000vsb-1ZDf;
	Tue, 04 Jun 2024 02:26:35 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEJsd-00000000vrC-3hYx
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 02:26:33 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6f935c8758fso592081a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jun 2024 19:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717467990; x=1718072790; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4PmXD5MowMat90zUSKPgQAiN+HLbim4SCmw5MkJujg=;
        b=AuGkU9ydQDehE0dkeK+I/PP1bgdeHgYurRAor5VtNcyLi4xwNQdfiAEzEcVfEqaSrJ
         xwNpG+8Q4o9m6HL2FWzV8H7OAyGY/qtEwLU7jNGlyuwFOWFB+C1aSGp547ijqHTnKLN8
         A83/vPbyJ3EgmOH1aqdhgaDFbkqjPhbS/vDD6eBf4+F8meNJ4j/cXH0vkXytp1hbzT2i
         AH2O5xCMUCXrpuI00agA61U2s5X60QiKxG+MyYD1sOJ1YLJRnZgxLH2aGxJwS+dowdO6
         XQtXal0ZpPeVSR0I49jXikjpqGnZQPa7okQrnQ4i7gHOR2zUFPwISTh4OlEkVtKWQ6B3
         5jZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717467990; x=1718072790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4PmXD5MowMat90zUSKPgQAiN+HLbim4SCmw5MkJujg=;
        b=ojfhOJZkzrsgGlePIwfDWtG9bch7VWh4IYkqTSCcY/jLBeuCsUSEJOkn3yJkbFPucy
         HA2TUlubtYcCqfbOJ0W8dwXpuNTOZf/70oQ3xDXlxi1Nlk1Q2zAYtkd0hxBuavNBgvkt
         LEYMEXkNurWy+IZgxwoLzK83DuVSBqDDLLuLJ5r5O0cgKvzxWFkmAj+rqqDdf37HK2kg
         mBBScEH9pp3oHrBIs/2KWLVFvW+QuYnYZS0w29M/pgz3AdkPRHnNXQJJCyNTtNyzVR1/
         iIkZKs9x2uDrfHDPdXbE/gMWdk8KaR5WNEIXCo/cD5VZjqTdJ8bI5EGHGmnWyKYtMVv1
         ffIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOsyzTeYqj+WZc0HH2tWGY1R1lpzrDgFD93L35170AaXOSkNsdgvipRxaiGvTDi37vGnub5wW+s7LdpFPsqZwQZtafoOnBmeEzpCxq2UVf
X-Gm-Message-State: AOJu0YzHQccsSjrRgKePCBO502r19RiB2hizKyadLbzdZKQgxaXrk/gD
	9lrTli6mzVzIkJaFw3TsHT0Le+sA8FonEIEW/pxpwWiOmdQb5QgUJfmXrH4G0cr3Xm+mm35XFja
	lzdD+QdMY45LUXEcMK8bd2Jz0cXSmQP0k1Hcs3Q==
X-Google-Smtp-Source: AGHT+IF8osrWQw9+CtjSacKGaxmnj6mLifvKaK2i0qkCZu+VsezKa8w3LpXFIRo/H5fvWDp3fsIXnpfMZDYhhmvEt7A=
X-Received: by 2002:a05:6830:3a0f:b0:6f0:e381:77b1 with SMTP id
 46e09a7af769-6f911fa42d3mr11510807a34.27.1717467989658; Mon, 03 Jun 2024
 19:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
 <20240524103307.2684-2-yongxuan.wang@sifive.com> <20240527-41b376a2bfedb3b9cf7e9c7b@orel>
 <ec110587-d557-439b-ae50-f3472535ef3a@ghiti.fr> <20240530-3e5538b8e4dea932e2d3edc4@orel>
 <3b76c46f-c502-4245-ae58-be3bd3f8a41f@ghiti.fr> <20240530-de1fde9735e6648dc34654f3@orel>
 <f2016305-e24b-41ea-8c48-cfdeb8ee6b48@ghiti.fr>
In-Reply-To: <f2016305-e24b-41ea-8c48-cfdeb8ee6b48@ghiti.fr>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 4 Jun 2024 10:26:18 +0800
Message-ID: <CAMWQL2htSNer6zZe2SNoRfmF1wF7EVGHeqwNE3pkfSnS3sa7=Q@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/5] RISC-V: Detect and Enable Svadu Extension Support
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, cleger@rivosinc.com, Jinyu Tang <tjytimi@163.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Samuel Ortiz <sameo@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Charlie Jenkins <charlie@rivosinc.com>, Leonardo Bras <leobras@redhat.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_192632_200850_F61CB102 
X-CRM114-Status: GOOD (  40.98  )
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

SGkgQWxleGFuZHJlLAoKT24gTW9uLCBKdW4gMywgMjAyNCBhdCA3OjI54oCvUE0gQWxleGFuZHJl
IEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90ZToKPgo+IE9uIDMwLzA1LzIwMjQgMTE6MjQsIEFu
ZHJldyBKb25lcyB3cm90ZToKPiA+IE9uIFRodSwgTWF5IDMwLCAyMDI0IGF0IDExOjAxOjIwQU0g
R01ULCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPj4gSGkgQW5kcmV3LAo+ID4+Cj4gPj4gT24g
MzAvMDUvMjAyNCAxMDo0NywgQW5kcmV3IEpvbmVzIHdyb3RlOgo+ID4+PiBPbiBUaHUsIE1heSAz
MCwgMjAyNCBhdCAxMDoxOToxMkFNIEdNVCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4+Pj4g
SGkgWW9uZy1YdWFuLAo+ID4+Pj4KPiA+Pj4+IE9uIDI3LzA1LzIwMjQgMTg6MjUsIEFuZHJldyBK
b25lcyB3cm90ZToKPiA+Pj4+PiBPbiBGcmksIE1heSAyNCwgMjAyNCBhdCAwNjozMzowMVBNIEdN
VCwgWW9uZy1YdWFuIFdhbmcgd3JvdGU6Cj4gPj4+Pj4+IFN2YWR1IGlzIGEgUklTQy1WIGV4dGVu
c2lvbiBmb3IgaGFyZHdhcmUgdXBkYXRpbmcgb2YgUFRFIEEvRCBiaXRzLgo+ID4+Pj4+Pgo+ID4+
Pj4+PiBJbiB0aGlzIHBhdGNoIHdlIGRldGVjdCBTdmFkdSBleHRlbnNpb24gc3VwcG9ydCBmcm9t
IERUQiBhbmQgZW5hYmxlIGl0Cj4gPj4+Pj4+IHdpdGggU0JJIEZXRlQgZXh0ZW5zaW9uLiBBbHNv
IHdlIGFkZCBhcmNoX2hhc19od19wdGVfeW91bmcoKSB0byBlbmFibGUKPiA+Pj4+Pj4gb3B0aW1p
emF0aW9uIGluIE1HTFJVIGFuZCBfX3dwX3BhZ2VfY29weV91c2VyKCkgaWYgU3ZhZHUgZXh0ZW5z
aW9uIGlzCj4gPj4+Pj4+IGF2YWlsYWJsZS4KPiA+Pj4+IFNvIHdlIHRhbGtlZCBhYm91dCB0aGlz
IHllc3RlcmRheSBkdXJpbmcgdGhlIGxpbnV4LXJpc2N2IHBhdGNod29yayBtZWV0aW5nLgo+ID4+
Pj4gV2UgY2FtZSB0byB0aGUgY29uY2x1c2lvbiB0aGF0IHdlIHNob3VsZCBub3Qgd2FpdCBmb3Ig
dGhlIFNCSSBGV0ZUIGV4dGVuc2lvbgo+ID4+Pj4gdG8gZW5hYmxlIFN2YWR1IGJ1dCBpbnN0ZWFk
LCBpdCBzaG91bGQgYmUgZW5hYmxlZCBieSBkZWZhdWx0IGJ5IG9wZW5TQkkgaWYKPiA+Pj4+IHRo
ZSBleHRlbnNpb24gaXMgcHJlc2VudCBpbiB0aGUgZGV2aWNlIHRyZWUuIFRoaXMgaXMgYmVjYXVz
ZSB3ZSBkaWQgbm90IGZpbmQKPiA+Pj4+IGFueSBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IGlzc3Vl
cywgbWVhbmluZyB0aGF0IGVuYWJsaW5nIFN2YWR1IHNob3VsZCBub3QKPiA+Pj4+IGJyZWFrIGFu
eSBTLW1vZGUgc29mdHdhcmUuCj4gPj4+IFVuZm9ydHVuYXRlbHkgSSBqb2luZWQgeWVzdGVyZGF5
J3MgcGF0Y2h3b3JrIGNhbGwgbGF0ZSBhbmQgbWlzc2VkIHRoaXMKPiA+Pj4gZGlzY3Vzc2lvbi4g
SSdtIHN0aWxsIG5vdCBzdXJlIGhvdyB3ZSBhdm9pZCBjb25jZXJucyB3aXRoIFMtbW9kZSBzb2Z0
d2FyZQo+ID4+PiBleHBlY3RpbmcgZXhjZXB0aW9ucyBieSBwdXJwb3NlbHkgbm90IHNldHRpbmcg
QS9EIGJpdHMsIGJ1dCB0aGVuIG5vdAo+ID4+PiBnZXR0aW5nIHRob3NlIGV4Y2VwdGlvbnMuCj4g
Pj4KPiA+PiBNb3N0IG90aGVyIGFyY2hpdGVjdHVyZXMgaW1wbGVtZW50IGhhcmR3YXJlIEEvRCB1
cGRhdGVzLCBzbyBJIGRvbid0IHNlZQo+ID4+IHdoYXQncyBzcGVjaWZpYyBpbiByaXNjdi4gSW4g
YWRkaXRpb24sIGlmIGFuIE9TIHJlYWxseSBuZWVkcyB0aGUgZXhjZXB0aW9ucywKPiA+PiBpdCBj
YW4gYWx3YXlzIHBsYXkgd2l0aCB0aGUgcGFnZSB0YWJsZSBwZXJtaXNzaW9ucyB0byBhY2hpZXZl
IHN1Y2gKPiA+PiBiZWhhdmlvdXIuCj4gPiBIbW0sIHllYWggd2UncmUgcHJvYmFibHkgcHJldHR5
IHNhZmUgc2luY2Ugc29ydGluZyB0aGlzIG91dCBpcyBqdXN0IG9uZSBvZgo+ID4gbWFueSB0aGlu
Z3MgYW4gT1Mgd2lsbCBoYXZlIHRvIGxlYXJuIHRvIG1hbmFnZSB3aGVuIGdldHRpbmcgcG9ydGVk
LiBBbHNvLAo+ID4gaGFuZGxpbmcgYm90aCBzdmFkZSBhbmQgc3ZhZHUgYXQgYm9vdCBpcyB0cml2
aWFsIHNpbmNlIHRoZSBPUyBzaW1wbHkgbmVlZHMKPiA+IHRvIHNldCB0aGUgQS9EIGJpdHMgd2hl
biBjcmVhdGluZyB0aGUgUFRFcyBvciBoYXZlIGV4Y2VwdGlvbiBoYW5kbGVycwo+ID4gd2hpY2gg
ZG8gbm90aGluZyBidXQgc2V0IHRoZSBiaXRzIHJlYWR5IGp1c3QgaW4gY2FzZS4KPiA+Cj4gPj4K
PiA+Pj4+IFRoaXMgaXMgd2hhdCB5b3UgZGlkIGluIHlvdXIgcHJldmlvdXMgdmVyc2lvbnMgb2YK
PiA+Pj4+IHRoaXMgcGF0Y2hzZXQgc28gdGhlIGNoYW5nZXMgc2hvdWxkIGJlIGVhc3kuIFRoaXMg
YmVoYXZpb3VyIG11c3QgYmUgYWRkZWQgdG8KPiA+Pj4+IHRoZSBkdGJpbmRpbmcgZGVzY3JpcHRp
b24gb2YgdGhlIFN2YWR1IGV4dGVuc2lvbi4KPiA+Pj4+Cj4gPj4+PiBBbm90aGVyIHRoaW5nIHRo
YXQgd2UgZGlzY3Vzc2VkIHllc3RlcmRheS4gVGhlcmUgZXhpc3QgMiBzY2hlbWVzIHRvIG1hbmFn
ZQo+ID4+Pj4gdGhlIEEvRCBiaXRzIHVwZGF0ZXMsIFN2YWRlIGFuZCBTdmFkdS4gSWYgYSBwbGF0
Zm9ybSBzdXBwb3J0cyBib3RoCj4gPj4+PiBleHRlbnNpb25zIGFuZCBib3RoIGFyZSBwcmVzZW50
IGluIHRoZSBkZXZpY2UgdHJlZSwgaXQgaXMgTS1tb2RlIGZpcm13YXJlJ3MKPiA+Pj4+IHJlc3Bv
bnNpYmlsaXR5IHRvIHByb3ZpZGUgYSAic2FuZSIgZGV2aWNlIHRyZWUgdG8gdGhlIFMtbW9kZSBz
b2Z0d2FyZSwKPiA+Pj4+IG1lYW5pbmcgdGhlIGRldmljZSB0cmVlIGNhbiBub3QgY29udGFpbiBi
b3RoIGV4dGVuc2lvbnMuIEFuZCBiZWNhdXNlIG9uIHN1Y2gKPiA+Pj4+IHBsYXRmb3JtcywgU3Zh
ZHUgaXMgbW9yZSBwZXJmb3JtYW50IHRoYW4gU3ZhZGUsIFN2YWR1IHNob3VsZCBiZSBlbmFibGVk
IGJ5Cj4gPj4+PiB0aGUgTS1tb2RlIGZpcm13YXJlIGFuZCBvbmx5IFN2YWR1IHNob3VsZCBiZSBw
cmVzZW50IGluIHRoZSBkZXZpY2UgdHJlZS4KPiA+Pj4gSSdtIG5vdCBzdXJlIGZpcm13YXJlIHdp
bGwgYmUgYWJsZSB0byBjaG9vc2Ugc3ZhZHUgd2hlbiBpdCdzIGF2YWlsYWJsZS4KPiA+Pj4gRm9y
IGV4YW1wbGUsIHBsYXRmb3JtcyB3aGljaCB3YW50IHRvIGNvbmZvcm0gdG8gdGhlIHVwY29taW5n
ICJTZXJ2ZXIKPiA+Pj4gUGxhdGZvcm0iIHNwZWNpZmljYXRpb24gbXVzdCBhbHNvIGNvbmZvcm0g
dG8gdGhlIFJWQTIzIHByb2ZpbGUsIHdoaWNoCj4gPj4+IG1hbmRhdGVzIFN2YWRlIGFuZCBsaXN0
cyBTdmFkdSBhcyBhbiBvcHRpb25hbCBleHRlbnNpb24uIFRoaXMgaW1wbGllcyB0bwo+ID4+PiBt
ZSB0aGF0IFMtbW9kZSBzaG91bGQgYmUgYm9vdCB3aXRoIGJvdGggc3ZhZGUgYW5kIHN2YWR1IGlu
IHRoZSBEVCBhbmQgd2l0aAo+ID4+PiBzdmFkZSBiZWluZyB0aGUgYWN0aXZlIG9uZS4gVGhlbiwg
Uy1tb2RlIGNhbiBjaG9vc2UgdG8gcmVxdWVzdCBzd2l0Y2hpbmcKPiA+Pj4gdG8gc3ZhZHUgd2l0
aCBGV0ZULgo+ID4+Cj4gPj4gVGhlIHByb2JsZW0gaXMgdGhhdCBGV0ZUIGlzIG5vdCB0aGVyZSBh
bmQgd29uJ3QgYmUgdGhlcmUgZm9yIH4xeSAoYWNjb3JkaW5nCj4gPj4gdG8gQW51cCkuIFNvIGlu
IHRoZSBtZWFudGltZSwgd2UgcHJldmVudCBhbGwgdWFyY2hzIHRoYXQgc3VwcG9ydCBTdmFkdSB0
bwo+ID4+IHRha2UgYWR2YW50YWdlIG9mIHRoaXMuCj4gPiBJIHRoaW5rIHdlIHNob3VsZCBoYXZl
IGRvY3VtZW50ZWQgYmVoYXZpb3JzIGZvciBhbGwgZm91ciBwb3NzaWJpbGl0aWVzCj4gPgo+ID4g
ICAxLiBOZWl0aGVyIHN2YWRlIG5vciBzdmFkdSBpbiBEVCAtLSBjdXJyZW50IGJlaGF2aW9yCj4g
PiAgIDIuIE9ubHkgc3ZhZGUgaW4gRFQgLS0gY3VycmVudCBiZWhhdmlvcgo+ID4gICAzLiBPbmx5
IHN2YWR1IGluIERUIC0tIGV4cGVjdCBoYXJkd2FyZSBBL0QgdXBkYXRpbmcKPiA+ICAgNC4gQm90
aCBzdmFkZSBhbmQgc3ZhZHUgaW4gRFQgLS0gY3VycmVudCBiZWhhdmlvciwgYnV0LCBpZiB3ZSBo
YXZlIEZXRlQsCj4gPiAgICAgIHRoZW4gdXNlIGl0IHRvIHN3aXRjaCB0byBzdmFkdS4gSWYgd2Ug
ZG9uJ3QgaGF2ZSBGV0ZULCB0aGVuLCBvaCB3ZWxsLi4uCj4gPgo+ID4gUGxhdGZvcm1zL2Zpcm13
YXJlcyB0aGF0IGFyZW4ndCBjb25jZXJuZWQgd2l0aCB0aGUgcHJvZmlsZXMgY2FuIGNob29zZSAo
MykKPiA+IGFuZCBMaW51eCBpcyBmaW5lLiBUaG9zZSB0aGF0IGRvIHdhbnQgdG8gY29uZm9ybSB0
byB0aGUgcHJvZmlsZSB3aWxsCj4gPiBjaG9vc2UgKDQpIGJ1dCBMaW51eCB3b24ndCBnZXQgdGhl
IGJlbmVmaXQgb2Ygc3ZhZHUgdW50aWwgaXQgYWxzbyBnZXRzCj4gPiBGV0ZULgo+Cj4KPiBJIHRo
aW5rIHRoaXMgc29sdXRpb24gcGxlYXNlcyBldmVyeW9uZSBzbyBJJ2Qgc2F5IHdlIHNob3VsZCBn
byBmb3IgaXQsCj4gdGhhbmtzIEFuZHJldyEKPgo+IEBZb25nLVh1YW4gZG8geW91IHRoaW5rIHlv
dSBjYW4gcHJlcGFyZSBhbm90aGVyIHNwaW4gd2l0aCBBbmRyZXcncwo+IHByb3Bvc2FsIGltcGxl
bWVudGVkPwo+CgpPaywgdGhlIG5leHQgdmVyc2lvbiB3aWxsIGJlIGJhc2VkIG9uIHRoaXMgcHJv
cG9zYWwuCgpSZWdhcmRzLApZb25nLVh1YW4KCj4gVGhhbmtzLAo+Cj4gQWxleAo+Cj4KPiA+Cj4g
PiBJT1csIEkgdGhpbmsgeW91ciBwcm9wb3NhbCBpcyBmaW5lIGV4Y2VwdCBmb3Igd2FudGluZyB0
byBkb2N1bWVudCBpbiB0aGUKPiA+IERUIGJpbmRpbmdzIHRoYXQgb25seSBzdmFkZSBvciBzdmFk
dSBtYXkgYmUgcHJvdmlkZWQsIHNpbmNlIEkgdGhpbmsgd2UnbGwKPiA+IHdhbnQgYm90aCB0byBi
ZSBhbGxvd2VkIGV2ZW50dWFsbHkuCj4gPgo+ID4gVGhhbmtzLAo+ID4gZHJldwo+ID4KPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
