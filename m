Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C72C3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 14:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhMLaaPqaypR8yGUCcrd+G33le5VgATmCU0lAi5+rmE=; b=kLMfPwDi5NzUtX
	sv2GQXBdXFx5QNwh7ijhzfkwvNYoySKOCK/GOCcB2+CfiZM/N0WaVopN68Q4ARW0DPW8KtN1Z6fIG
	LSPBYIMe2IbBFPKUM4EE1uhyQp1zDyzErt79pVjfcH8lVht4sng66jWTM3fL+3RcI6/U4+kKOJ+RD
	xeQBYAhZfOq9td6G3W3gk/Ws7Ern48AsNfQt15BPp4FrVnjS4TE3XAr30xgdDJH4M+xoK3Q7+fSID
	FvdkhkpI6F+S/GRSj7NgfbuUHPFmMq+mfaPAJu+eP8L5oy87RuQKOUaxH59gzBoBz0X+krOeN18Sv
	uhfLaU6qfZLn+fI6VEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sebVN-0000000ADyS-1E6e;
	Thu, 15 Aug 2024 14:31:09 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sebVJ-0000000ADxX-17NU
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 14:31:07 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2f3b8eb3df5so7573101fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 07:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723732263; x=1724337063; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mcvq8uUHmuPOGUnHdS7s6bm/DqUE1vyfs2Wujf+gaVI=;
        b=UeI8AhYUpD9w72ibyBP6FhckCTunsP+hsEZ7Cu+e+IcZxtw9f6XRM6+IpUv+IbQ1AF
         Mz4BA5XUloayrHutWVy2rAkxziA+gif8k4I01G38P+DYgZGIn/ONOXndaZpDdiPF3o9/
         hBHb5oNiqyeotTGHlaw5VCNSTD4n0E8rQ8P68W06cAi6ON3+icmLqgqCERkE97XdjK/9
         nFS22U4zwhqKTLtFSxDZ6v7nh5Af7ZXdhcFoC3mDsmFfoQjJ1sP22s/AvgOt0NxyCVg0
         T0bQbecmPXdjj1VZAAC/THqKEWjpXLUR5wkRVYgJ6Y+TmcpnCu1NMS+6CRRduIPD+ycm
         mkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723732263; x=1724337063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mcvq8uUHmuPOGUnHdS7s6bm/DqUE1vyfs2Wujf+gaVI=;
        b=liOEMBF8dT4yvvuQX6QS9rqdfM5F6xgjzfL2m46EjOZgqEBjI0GEaewFamSSR+Eqnr
         L4GjMFxZ9Honr4GSZGsDGwXKHvd/3fQr0Ui6hspHK029amHGDA6UiaOfNYjjmh6t6yky
         uu5hYNS6KEkjoZbNnmgWg9rYFVy1vvUFGTQPk1Q/vWoSIqNAWftv3HarzvKqdpExtTiF
         gAEy4hsV0ZiYPU3j+JWGPfcV84Ry8MWuHIx0oAkUoPXfkxfL1lSd+lANuKekO/v06qfX
         mDuNOUUsEfBFWoyeofZp2EEmXnujTVyDB784kmOlJZmm30UCrH0OWVdGy4e0RKGnKeWv
         iQ2g==
X-Forwarded-Encrypted: i=1; AJvYcCUO2QstiFXsXhuigRl1q6zbg/cFs8Xyc/lQpSu4SRC+orFrtRZB1rF+8PSFu5Dkmb+RSLgF/ruX+3nKdzywTLTuiDmNTVFMPzqim1oD8z9t
X-Gm-Message-State: AOJu0YykPefEPVLDqrU3pPPQQ+oDjlDhjicSKrELnUCDC/CwR4FYpl2D
	qyf1SELqRw/YJtvDF7Pb9YqT7Onb4xySFswrh+relvwKSU9QOZDuGfwflebPJ0g12P5nOGTRNcE
	Ez+n38Dm30914I9KLsAloKKcigdB7wUv3ENNKxg==
X-Google-Smtp-Source: AGHT+IHAAccVfpcl3odE8dq7FIsrDS4Zdmdj/lG6qMcWh0FaS2LCp/xk2oU88/wFffkyqJb9KTSOpeFaSgJ/4p3CnT4=
X-Received: by 2002:a05:6512:23a1:b0:530:e228:779c with SMTP id
 2adb3069b0e04-532eda6d816mr4514750e87.19.1723732262175; Thu, 15 Aug 2024
 07:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
 <87jzgjnh9z.ffs@tglx> <CAJM55Z8WERQgs=QMyFGWvAHOpwcnOAudBqovaEuDudPSXCvL5Q@mail.gmail.com>
 <87ttfmm2ns.ffs@tglx> <CAJM55Z88H635Crc-Aeq+K0qcAk7NC89WVTAFdXDd2aQKQ7QmEg@mail.gmail.com>
 <CAJM55Z_qQX7n8tAeOFqrAH1BFjA9vaWA8rtsPG2BcKmiO88m=Q@mail.gmail.com>
 <87plqalyd4.ffs@tglx> <686d61c4-e7ac-4dca-a7fd-decdd72e84d9@sifive.com>
In-Reply-To: <686d61c4-e7ac-4dca-a7fd-decdd72e84d9@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 15 Aug 2024 20:00:50 +0530
Message-ID: <CAK9=C2VHfPnYx8gMjodJNLu9+yR4KvuPXeQZiyZcbu1Mvze-0Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_073105_329963_707B0982 
X-CRM114-Status: GOOD (  28.99  )
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

T24gVGh1LCBBdWcgMTUsIDIwMjQgYXQgNzowMuKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIFRob21hcywgRW1pbCwKPgo+IE9uIDIw
MjQtMDgtMTUgODoxNiBBTSwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+ID4gT24gVGh1LCBBdWcg
MTUgMjAyNCBhdCAwNToxNCwgRW1pbCBSZW5uZXIgQmVydGhpbmcgd3JvdGU6Cj4gPj4gRW1pbCBS
ZW5uZXIgQmVydGhpbmcgd3JvdGU6Cj4gPj4+IDYuMTEtcmMzICsgdGhlc2UgcmV2ZXJ0czogIGh0
dHBzOi8vdXMwMS56LmFudGlnZW5hLmNvbS9sL0VyNGtaV0Rtdkw1LWJMekhISm9adjBrNzFpd1cy
akNENXFOcGl6MHgwWGRZWTZvT1JGX25YaDdVN2p3Nm91YmhpfjMySEk0aTcxalVXOXY4fk52U3ZQ
ZVVXcmRZeDNXSkJyMkdQRFVqT3U2TFlQQ09CZlIyZFZRdU1XdmxOajR0RGpYRnAzUUVRQW1lYXda
ZmxENEpySUpqdFNZSWJLZmU2di10Z0g3U0V1SE1lU1NyaVU2MzNMdgo+ID4+PiA2LjExLXJjMyAr
IFNhbXVlbCdzIHBhdGNoOiBodHRwczovL3VzMDEuei5hbnRpZ2VuYS5jb20vbC9FVUx0QVlreTZa
dmdxWjQ5S0dTLVdCc1lUZ35IdDFOb1F0RVltVVZiNTZ5bVM5akRhZ3FZSExLOTBXRGpuVnQ2OUdm
QjRJWDVOU1JRWG1TZmtOc1R6QjhsSm1GdkRpaEhRbUdyc0N2OUZ6bG9yRDl5R2ZYRGxRNnJHNnZt
bjVCTkR3bGlwbXNzR2FPR2ZoOXlrbzhuOUFyV1I0VExoRWZ+ZjlPRHFtZX5OWFh3QTlETExjOXAK
PiA+Pgo+ID4+IEkgdGhpbmsgdGhpcyBjb25maXJtcyB3aGF0IENoYXJsaWUgZm91bmQgaGVyZToK
PiA+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9ab3lkVjd2YWQ1SldJY1pi
QGdob3N0Lwo+ID4KPiA+IFllcy4gU28gdGhlIHJpc2N2IHRpbWVyIGlzIG5vdCB3b3JraW5nIG9u
IHRoaXMgdGhpbmcgb3IgaXQgc3RvcHMKPiA+IHNvbWVob3cuCj4KPiBUaGF0J3MgY29ycmVjdC4g
V2l0aCB0aGUgKGZpcm13YXJlKSBkZXZpY2V0cmVlIHRoYXQgRW1pbCBpcyB1c2luZywgdGhlIE9w
ZW5TQkkKPiBmaXJtd2FyZSBkb2VzIG5vdCBoYXZlIGEgdGltZXIgZGV2aWNlLCBzbyBpdCBkb2Vz
IG5vdCBleHBvc2UgdGhlIChvcHRpb25hbFsxXSkKPiBTQkkgdGltZSBleHRlbnNpb24sIGFuZCBz
Ymlfc2V0X3RpbWVyKCkgZG9lcyBub3RoaW5nLgoKT3BlblNCSSB1c2VzIHBsYXRmb3JtIHNwZWNp
ZmljIE0tbW9kZSB0aW1lciAobXRpbWUgYW5kIG10aW1lY21wKSB0bwpwcm92aWRlIFNCSSB0aW1l
IGV4dGVuc2lvbiB0byBMaW51eC4KClRoZSBSSVNDLVYgcHJpdmlsZWdlZCBzcGVjaWZpY2F0aW9u
ICh2MS4xMCBvciBoaWdoZXIpIHJlcXVpcmVzIHBsYXRmb3JtIHRvCnByb3ZpZGUgYSBNLW1vZGUg
dGltZXIgKG10aW1lIGFuZCBtdGltZWNtcCkuCgpUaGlzIHBsYXRmb3JtIG5vdCBoYXZpbmcgYW55
IE0tbW9kZSB0aW1lciBpcyB5ZXQgYW5vdGhlciBSSVNDLVYgc3BlYwp2aW9sYXRpb24gYnkgdGhp
cyBwbGF0Zm9ybS4KClJlZ2FyZHMsCkFudXAKCj4KPiBJIHdyb3RlIGEgcGF0Y2ggKG5vdCBzdWJt
aXR0ZWQpIHRvIHNraXAgcmVnaXN0ZXJpbmcgcmlzY3ZfY2xvY2tfZXZlbnQgd2hlbiB0aGUKPiBT
QkkgdGltZSBleHRlbnNpb24gaXMgdW5hdmFpbGFibGUsIGJ1dCB0aGlzIGRvZXNuJ3QgZnVsbHkg
c29sdmUgdGhlIGlzc3VlCj4gZWl0aGVyLCBiZWNhdXNlIHRoZW4gd2UgaGF2ZSBubyBjbG9ja2V2
ZW50IGF0IGFsbCB3aGVuCj4gY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19hbGxfY3B1cygpIGlzIGNh
bGxlZC4KPgo+IEhvdyBlYXJseSBpbiB0aGUgYm9vdCBwcm9jZXNzIGFyZSB3ZSAicmVxdWlyZWQi
IHRvIGhhdmUgYSBmdW5jdGlvbmFsIGNsb2NrZXZlbnQ/Cj4gRG8gd2UgbmVlZCB0byByZWZhY3Rv
ciBjaGVja191bmFsaWduZWRfYWNjZXNzX2FsbF9jcHVzKCkgc28gaXQgd29ya3Mgb24gc3lzdGVt
cwo+IHdoZXJlIHRoZSBvbmx5IGNsb2NrZXZlbnQgaXMgcHJvdmlkZWQgYnkgYSBwbGF0Zm9ybSBk
ZXZpY2U/Cj4KPiBSZWdhcmRzLAo+IFNhbXVlbAo+Cj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9y
aXNjdi1ub24taXNhL3Jpc2N2LXNiaS1kb2MvYmxvYi9tYXN0ZXIvc3JjL2ludHJvLmFkb2MKPgo+
ID4gQ2FuIHlvdSBhcHBseSB0aGUgZGVidWcgcGF0Y2ggYmVsb3cgYW5kIGNoZWNrIHdoZXRoZXIg
eW91IHNlZSB0aGUKPiA+ICdKOiAuLi4uJyBvdXRwdXQgYXQgYWxsIGFuZCBpZiBzbyB3aGV0aGVy
IGl0IHN0b3BzIGF0IHNvbWUgcG9pbnQuCj4gPgo+ID4gVGhhbmtzLAo+ID4KPiA+ICAgICAgICAg
dGdseAo+ID4KPiA+IC0tLQo+ID4gLS0tIGEva2VybmVsL3RpbWUvdGltZXIuYwo+ID4gKysrIGIv
a2VybmVsL3RpbWUvdGltZXIuYwo+ID4gQEAgLTI0NTksNiArMjQ1OSw5IEBAIHN0YXRpYyB2b2lk
IHJ1bl9sb2NhbF90aW1lcnModm9pZCkKPiA+ICB7Cj4gPiAgICAgICBzdHJ1Y3QgdGltZXJfYmFz
ZSAqYmFzZSA9IHRoaXNfY3B1X3B0cigmdGltZXJfYmFzZXNbQkFTRV9MT0NBTF0pOwo+ID4KPiA+
ICsgICAgIGlmICghKGppZmZpZXMgJiAweEZGKSkKPiA+ICsgICAgICAgICAgICAgcHJfaW5mbygi
SjogJWx4XG4iLCBqaWZmaWVzKTsKPiA+ICsKPiA+ICAgICAgIGhydGltZXJfcnVuX3F1ZXVlcygp
Owo+ID4KPiA+ICAgICAgIGZvciAoaW50IGkgPSAwOyBpIDwgTlJfQkFTRVM7IGkrKywgYmFzZSsr
KSB7Cj4gPgo+ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
