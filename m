Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFE7E7718B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Dec 2024 08:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DcbuFa6Z5XWvPuxC6TookI+EPy6Cy6PJnuO/p3fqBQ=; b=ZceA/lBihgs82v
	DRrphB+VcheJ7vDapXTZeppF3oXs6WaZaDTmIIG7C9/EYTmgvMwexZgFpxbk3ieg3sIRx/t75j5rh
	tJRvuvqAvIKDlvlGyYY032jxakgkDPYNhIfSHzjWh4hhND3mq2pZyrKzKrcw4tZCO45cCpnWTWyeG
	LTShhkZfcdycT0Bw6OTktwYx4IE2e/6hTS5LDorxYOYueYPi8Ikw5y81tVa2XCzVbUtI62ZeUK/wp
	Ot1IYfUGC7CFuD3QmzM5oeg8+wo4ODMAa7LcRC5wbBNp+SNORj2w0Zr2xMWaEY5q9gC7XvBvvIKWw
	+RUiKKr8N/cU+Q8h3Yhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQMmK-0000000DS3C-2Dye;
	Wed, 25 Dec 2024 08:30:04 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQMmH-0000000DS22-0shQ
	for linux-riscv@lists.infradead.org;
	Wed, 25 Dec 2024 08:30:02 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2f441904a42so6417132a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Dec 2024 00:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735115400; x=1735720200; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsYQE4hZMTehA39cPjSjOF4aLwAGpnoC+msR/Fspsvs=;
        b=bVrH19bPDRvbsEr5RdctJHbLze+vW778DoDHguU95cb4o8x+umG7ghkpLOhXkBzgyY
         HgV31QAKeDtfPFw9Gd2cyXPrvgnlZRWeDFC+61bNJ4BmHHDmQ9NwYRK6Hce+dYjIo8SZ
         zjofwndrmsJW/iICcT+2BnfuyIxrcHnVBs26tA/lVjitT7LxIhpS8Dm/QWHWEROyNrmg
         DfS7/+k4dv5vGFqLenfUjDbPoIyy7fuEcdzs96N4Ugr/3lM1ciNQzmLWfcRrSqR7HvB1
         obPSiUaqcseVI55DRPMWULPIcsnuOhUQ3Hq9j0/AGCRN3cQSFMBhO0S2CMyh+HZUi557
         7Q8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735115400; x=1735720200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsYQE4hZMTehA39cPjSjOF4aLwAGpnoC+msR/Fspsvs=;
        b=hqXhVpoKH03Eyplz+pGwaUCHWTaZZjsVgeCPt548lElWFK6bXRe18twbfIayKzXJLD
         SmqfEqxB2B7nBpzZ6vzgGjGQw0t94gvSpb5KodXR28TkLtCeVFF+ol2fC/j2evN7et14
         5DsjMc3Brp9I6rbc5tzB1gFL8JXCrOCxTloAGo+c6ZW6WrXRcdaJ/Rk0KPO7It4JTOUA
         ild/iB/90jXkFx+sgASML5ckPlUiLHuUfcuDjEUhzQBz3xUJyEoog0ktCie3Ysak/Zk/
         O/TwI631HjBVTX3lXKdE+t0+u0ufDN8BhWwK+L5YIY6emdrTMCjysjHZAHZrcyoxVD22
         TP9A==
X-Gm-Message-State: AOJu0YwxtIe05TIkaYQBUPQfAFMWtx4goVxoaqBUHwarWMebKtvolSEX
	TofJ9mud4uCm3rVMH5Em0g4+Q9PvE/R1kucFxrGWJ4J4pmDtwM0gAfk3B6Q1FAdNjh5Qc8tALf/
	8YJs67mHZaWhVzYeOMSHxIRJB7qQ=
X-Gm-Gg: ASbGnctKOeu0CyvYd0rfFIxGP9xLvvIO1Cqw68IMAv0RmtUjzVH4R7GUrXJC8/nbapw
	ucrR1czewXUnj+3bq5XU6ZyFU8LewDUiTbPVKjKQ=
X-Google-Smtp-Source: AGHT+IEOZFz/yXMb9a6rES17Dj57hojUtaeSZBV1w2v8Fu09/dsPnBxzT6ko3PJI5Y2HL1jwiKpbkMSH2anT867rKks=
X-Received: by 2002:a17:90a:c88b:b0:2f2:a9f0:40b0 with SMTP id
 98e67ed59e1d1-2f452eb3dd9mr25475868a91.23.1735115400241; Wed, 25 Dec 2024
 00:30:00 -0800 (PST)
MIME-Version: 1.0
References: <20241129144319.74257-1-arikalo@gmail.com> <20241129-antivirus-blunderer-efcbd49cfeb6@spud>
In-Reply-To: <20241129-antivirus-blunderer-efcbd49cfeb6@spud>
From: Aleksandar Rikalo <arikalo@gmail.com>
Date: Wed, 25 Dec 2024 09:29:48 +0100
Message-ID: <CAGQJe6pDaWVy9a70_4beoyLJbrL13zd--HGFqJAzW7Sgjttpug@mail.gmail.com>
Subject: Re: [PATCH] riscv: Rewrite AMO instructions via lr and sc.
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Andrea Parri <parri.andrea@gmail.com>, Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Eric Chan <ericchancf@google.com>, 
	linux-kernel@vger.kernel.org, 
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_003001_263588_14B10177 
X-CRM114-Status: GOOD (  19.82  )
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

T24gRnJpLCBOb3YgMjksIDIwMjQgYXQgNToyOeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gT24gRnJpLCBOb3YgMjksIDIwMjQgYXQgMDM6NDM6MTlQTSArMDEw
MCwgQWxla3NhbmRhciBSaWthbG8gd3JvdGU6Cgo+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmln
Cj4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+IEBAIC03MTUsNiArNzE1LDE2IEBAIGNv
bmZpZyBSSVNDVl9JU0FfWkFDQVMKPiA+Cj4gPiAgICAgICAgIElmIHlvdSBkb24ndCBrbm93IHdo
YXQgdG8gZG8gaGVyZSwgc2F5IFkuCj4gPgo+ID4gK2NvbmZpZyBSSVNDVl9JU0FfWkFMUlNDX09O
TFkKPiA+ICsgICAgIGJvb2wgIlphbHJzYyBleHRlbnNpb24gc3VwcG9ydCBvbmx5Igo+Cj4gSSBk
b24ndCBhZ3JlZSB3aXRoIHRoZSBuYW1pbmcgb2YgYW5kIGRlc2NyaXB0aW9uIGZvciB0aGlzIG9w
dGlvbi4KPiBGcm9tIHRoZSBkZXNjcmlwdGlvbiBiZWxvdyBJJ2QgaW1hZ2luZSB0aGF0IHlvdSBv
bmx5IGNhcmUgYWJvdXQgYQo+IHBsYXRmb3JtIHdoZXJlIHVzZSBvZiBBTU8gaW5zdHJ1Y3Rpb25z
IGlzIG9ubHkgdW5kZXNpcmFibGUsIGJ1dCBvdmVyYWxsCj4gdGhlIG9wdGlvbiBpbXBsaWVzIHRo
YXQgaXQgY2FuIGJlIHVzZWQgdG8gYnVpbGQgYSBrZXJuZWwgdGhhdCBjYW4gYmUKPiB1c2VkIG9u
IHN5c3RlbXMgdGhhdCBvbmx5IGltcGxlbWVudCBaYWxyc2MsIHdoaWNoLCBldmVuIHdpdGggeW91
ciBwYXRjaAo+IGFwcGxpZWQsIGl0IGNhbm5vdC4gSSB0aGluaywgaWYgd2UgYXJlIGdvaW5nIHRv
IG1lcmdlIHNvbWV0aGluZyBsaWtlIHRoaXMsCj4gd2Ugc2hvdWxkIGdvIHRoZSB3aG9sZSB3YXkg
YW5kIHBlcm1pdCBwbGF0Zm9ybXMgdGhhdCBkb24ndCBldmVuIGVtdWxhdGUKPiB0aGUgYSBleHRl
bnNpb24uIElmIG5vdCwgdGhlIEtjb25maWcgb3B0aW9uIHNob3VsZCBiZSBleHBsaWNpdGx5IGNs
ZWFyCj4gdGhhdCB0aGUgYSBleHRlbnNpb24gaXMgc3RpbGwgbWFuZGF0b3J5LgoKPiBTaW5jZSB5
b3UgbWVudGlvbiB0cmFwIGhhbmRsZXJzIGhlcmUsIGl0IHNvdW5kcyBsaWtlIGl0IG1heSBub3Qg
YmUgdGhlCj4gQ1BVIGl0c2VsZiB0aGF0IGVtdWxhdGVzIGl0LCBidXQgcmF0aGVyIGZpcm13YXJl
PwoKCkhlbGxvLAoKV2UgY2FuIGZvcmdldCBhYm91dCBlbXVsYXRpb24gZm9yIG5vdy4gVGhpcyBw
YXRjaCBvbmx5IGFmZmVjdHMgdGhlIHdheQp0aGUga2VybmVsIGltcGxlbWVudHMgYXRvbWljIGZ1
bmN0aW9ucy4gSXQncyBuZWVkZWQgZm9yIE1JUFMgcDg3MDAuCkkndmUgY2hhbmdlZCB0aGUgZGVz
Y3JpcHRpb24gaW4gdjI6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0
MTIyNTA4MjQxMi4zNjcyNy0xLWFyaWthbG9AZ21haWwuY29tCgpCZXN0IFJlZ2FyZHMsCkFsZWtz
YW5kYXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
