Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4586BFC617E
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 15:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJKXvUeo+AbQ56aakRvNSFN1BdTZIBMMAPdCRuMyEhk=; b=AkPBc7TctwYwbV
	GWXBncTJOBFHRaFO4AD77zrN595MaUW9IRaxNeBgGPJw1ZSG+vSVD1cXLhSn4PkNsDy2xfiYRqMDe
	RxD+PBUWObb8h8Nh5mTsL9wnP2yZT6UH+hzVJ0b9r3wPWOlhRNSxEzX2KFmxjNUewp7gRdSyNjtVN
	kQWGapaj5XKwe3R3yOmj2w6LNUwFrLr3QZ4AyQi2PfVMwL55Yz2hylz+KptW1jBuqYE6Kph8tkjiI
	+AufdQxRwVjmo2SfSodOadWw57wK5EUL5RUbQSCZ1rgOt0YnslOmNO1uBWCxC5fi6NTSEyk0Ip/q4
	nOCnGTdTlfD0lGiDuIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3Xw-00000009RQ3-3vyv;
	Sat, 03 Jan 2026 15:28:04 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3Xr-00000009ROb-3hiI
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 15:28:01 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-55b26461e78so3308491e0c.3
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 07:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767454079; x=1768058879; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruX6hkZHpdO19qjzRbCVwQHVnwKXr2Vj+4KOiXtfqv4=;
        b=mtV5hS24HRCFQKWW7kV7xoJ3NFLRYBVlUUgKRVQDsvOinKYDXWu4+aBq2pCVqD/8AM
         F/F/fZShSJwTEweKEvVkVG00QwJGurncs8tr8UQomuD7aH3OTLiXcaRygTUHv5yBlm/1
         1NtGV6Ued4G/ySVFFG0YqjDsE7m4u887aLdMsrO370SMSTM3cllTHlfzen56llwj6t98
         SOXPKSw4zOl1ainYIaN9mVmZWSoXuzaC7f563WlHJcHOYFLpRiJQBQ/LRGRuJCpg60GA
         gj4FAv6A2mD4QSD20f3EZiRxNNyU5HEXODi//MZy99U6M7rvUzSGZ5F9Y0XdP2t+YTAM
         lNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767454079; x=1768058879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ruX6hkZHpdO19qjzRbCVwQHVnwKXr2Vj+4KOiXtfqv4=;
        b=sGPX3RDcghp+iLotTxNMCl9N/xYC4og4dLr6pcbeLsUhMfgHMjMIMjU0d8ZZ5JXzXE
         oWVb6ctN/mL27yYEHnAuqkNkcFXhXpQwYaZrzY+0VOVUuhQk7uxgbclIKztFwJh+hIeA
         pfHkGSdmS4kQZ/jcAbqtHpmnwfZQ57GdvVF91LniLSo0V/V0KtkuFNZN0v04tcAFr8tz
         0LL8nlthNMJV9sxwlztR+Z7oov3K17HTGHedoxqYkBlDJZ6R9O67ZRdQqmpcOcSyMV2X
         dcCqpSeed1QaIka7IwaWdVMwjYeGwW+2CS6zN7cUWZAMX3F+0gU65kxKC4mUAANbSLNw
         XTig==
X-Forwarded-Encrypted: i=1; AJvYcCVxI7PK7Oes7c5sEwIvaPeINzp8gYZcdGCK/qSHf8e7/wWRgCTIUoA4eg8G85a53AAjr4DrjwDBIWZZtw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpdcyX50Y+KYUuyXYSHWH1L6xCHJy02YPzlDBqOZVScYHcyzo1
	CZzgs3iSq/DsPSVx/mEwkja3QxVoDYAlLsDlxe9X1YnAX60ijTSFEQ2IPQxLIe1+G89KrlR1dfH
	C3fyhswu4S4/CqhiIovioIoNSOY7H9cU=
X-Gm-Gg: AY/fxX7w4jgfkKjd1lPEMINprLwoVnVe4Nhf9P8sol0p8yviz+wfK6ekjP5CPxtJ29x
	4o1VvxRfDb//Ek3C1bKiHIrZsfWlzPa0ghBYBx7R9u9YW3htBnnAGsKEfuwvTi8fZz7s6JT1jLZ
	C8ZPKKGIAXencgB2mS3+kGU/mXcRDpBmMHsNvFr0Ed+C6VP91WPW18lhHtt9BL1CyVsuVQ8IzLp
	wDW33q6BPtbfgWUuTRSLjf5HgIseSCPXWtQS0Rf3+/jdlNvenzea/fLcLKeR2/okEJrbfwz/XcG
	68bk8yfHPBD2ZEYSB8DGvkmdc9YMgw==
X-Google-Smtp-Source: AGHT+IH4gY4RfbC6mCW6a26ygEBFnWc5dKuuMqfKZP9/F7nbOwJpx2ZHveFzv9IC2z6uJv1SWOQB2aZTEup8AesAsu8=
X-Received: by 2002:a05:6122:1d06:b0:559:6d5c:9722 with SMTP id
 71dfb90a1353d-5615bbaa53bmr12417664e0c.0.1767454078672; Sat, 03 Jan 2026
 07:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20260103094501.5625-1-naohiko.shimizu@gmail.com>
 <20260103094501.5625-2-naohiko.shimizu@gmail.com> <CAK9=C2XTi9Gjy0oJExGyaVvPbh2+cJzmeea5JnMR4d3kbvDJDA@mail.gmail.com>
In-Reply-To: <CAK9=C2XTi9Gjy0oJExGyaVvPbh2+cJzmeea5JnMR4d3kbvDJDA@mail.gmail.com>
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
Date: Sun, 4 Jan 2026 00:27:49 +0900
X-Gm-Features: AQt7F2rlTBHoChBm3AeMEsf79WeYBG_gY4U7DCYfbuqICMO-T2SE5U5F85_BEa0
Message-ID: <CAA7_YY_WuAR7-VUEuu8D5=aZZSqASGwShawxbC-jKp+S2WRd5Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: clocksource: Fix stimecmp update hazard on RV32
To: Anup Patel <apatel@ventanamicro.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	anup@brainfault.org, atish.patra@linux.dev, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, nick.hu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_072759_925825_AA41EEB5 
X-CRM114-Status: GOOD (  15.28  )
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

SGkgQW51cCwKCkkgaGF2ZSBqdXN0IHN1Ym1pdHRlZCB0aGUgdjIgc2VyaWVzIHdpdGggdGhlIGRl
dGFpbGVkIGRlc2NyaXB0aW9ucyBhcwp5b3Ugc3VnZ2VzdGVkLgoKdjIgbGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC8yMDI2MDEwMzE1MjQwMC41NTItMS1uYW9oaWtvLnNoaW1penVA
Z21haWwuY29tL1QvI3UKClJlZ2FyZHMsIE5hb2hpa28gU2hpbWl6dQoKCk9uIFNhdCwgSmFuIDMs
IDIwMjYgYXQgMTE6NDbigK9QTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4g
d3JvdGU6Cj4KPiBPbiBTYXQsIEphbiAzLCAyMDI2IGF0IDM6MTbigK9QTSBOYW9oaWtvIFNoaW1p
enUKPiA8bmFvaGlrby5zaGltaXp1QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBQbGVhc2UgYWRkIGEg
ZGV0YWlsZWQgY29tbWl0IGRlc2NyaXB0aW9uIGFib3V0IHdoeSB0aGUKPiBuZXcgd2F5IG9mIHBy
b2dyYW1taW5nIHN0aW1lY21wIGlzIGJldHRlci4gQWxzbywgZXhwbGFpbgo+IHdoYXQgdGhlIGN1
cnJlbnQgUHJpdiBzcGVjIHNheXMgaW4gdGhpcyBjb250ZXh0Lgo+Cj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogTmFvaGlrbyBTaGltaXp1IDxuYW9oaWtvLnNoaW1penVAZ21haWwuY29tPgo+ID4gLS0t
Cj4gPiAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIHwgMyArKy0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYyBiL2RyaXZlcnMvY2xvY2tz
b3VyY2UvdGltZXItcmlzY3YuYwo+ID4gaW5kZXggNGQ3Y2YzMzg4MjRhLi5jZmM0ZDgzYzQyYzAg
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPiA+ICsr
KyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+ID4gQEAgLTUwLDggKzUwLDkg
QEAgc3RhdGljIGludCByaXNjdl9jbG9ja19uZXh0X2V2ZW50KHVuc2lnbmVkIGxvbmcgZGVsdGEs
Cj4gPgo+ID4gICAgICAgICBpZiAoc3RhdGljX2JyYW5jaF9saWtlbHkoJnJpc2N2X3NzdGNfYXZh
aWxhYmxlKSkgewo+ID4gICNpZiBkZWZpbmVkKENPTkZJR18zMkJJVCkKPiA+IC0gICAgICAgICAg
ICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QLCBuZXh0X3R2YWwgJiAweEZGRkZGRkZGKTsKPiA+
ICsgICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QLCBVTE9OR19NQVgpOwo+ID4g
ICAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVDTVBILCBuZXh0X3R2YWwgPj4gMzIp
Owo+ID4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVDTVAsIG5leHRfdHZhbCAm
IDB4RkZGRkZGRkYpOwo+ID4gICNlbHNlCj4gPiAgICAgICAgICAgICAgICAgY3NyX3dyaXRlKENT
Ul9TVElNRUNNUCwgbmV4dF90dmFsKTsKPiA+ICAjZW5kaWYKPiA+IC0tCj4gPiAyLjM5LjUKPiA+
Cj4gPgo+Cj4gUmVnYXJkcywKPiBBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
