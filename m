Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49E8C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 19:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mzz4txJ3H/I2DZyImF+EadJ/HlWhPeSeW/vEpc9voU=; b=fvjBe+qU0rAI3EYh00Q7pk6D1L
	Pmye9Nbkz+o3mnHGqHk/mxvlWafmKC5cVWDtYa0Q6F6T8YiZbEkTK00ag5cItHalQ06Qo786Eck26
	QGMwqPBkRL0NxfFu9a4fb2ok1puMZGlrUfvZroPOlNjOLy+yycrNfvGSreIGWrXQl9Fqy4f7ZYv52
	i+xbX777bCHpXp3FEqXqGO/2T0FnhSz7X+oVhWuEJz7vDzVeakCI40dgvEF1h7RFFfsXdEh393OgY
	AhdTiMEkOPLx87CLIBSJtrqKOM4RHfdpzELf3YS9qb4rQqTW5tZhETNUrrCfKy47gEiXrJOTICAGR
	qO5Fylag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKjWp-0000000AJ2X-0vWt;
	Fri, 21 Jun 2024 19:02:31 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKjWl-0000000AJ1a-0dnJ
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 19:02:29 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1f9de13d6baso14134765ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 12:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718996544; x=1719601344; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ejfWjZZ+2p6n8C/uYSvX+3GJZETSO2UUSX42MmnXY0=;
        b=iZsgTIXvjh+jPOWsUQSBBsHFXdfE2X1Tvz6kFh1zbWpcToNF1hn14Dvk0q9VO/dqO9
         qx2lp+riUtOMklysf/+nEvgnhl0JHtWm12zwAYkvSmOyu1Y4ND+a2A96LzFjaPrlQcJ0
         vYbw6nXq2UidrfnNCyRJonXyxGQ93g0nb+MpFEdwQk7IJHXTvHanHC4Td3NvYoZbIDIc
         dkBbxhYtE4jH9Y+2CPVdzv4uybj/zJKlODSzqYf6kX8kpMVxEJL3UglqRQOecCjWKIbp
         ZNcse6vKFJHlQP3AUuHHo8IE+ZCg3C/FGE4kU6SEQSWqPyAXdaGkPE7xoRAoQsT0sv/h
         bXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718996544; x=1719601344;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ejfWjZZ+2p6n8C/uYSvX+3GJZETSO2UUSX42MmnXY0=;
        b=HOKM/FYLGHgDz1sRt1WAiMbkIME0LRdfyaYKmZNDFMbQ8dXOB5aSA/EE1hJ+pyfsOz
         My9ceQ4Dc8dHquoDmyQg7GruqdzSeXO0ih4ayLCmHAZnZgvxLyDvzfkO+1HagdSAc0uh
         6d7JhDlNKcpib003J1E44RT3rzqQ49F80hxtDXUJkHTn5EhcBnqiU0t0Am0Jsd4+cuJt
         Abe02lpGhrJac4oPJxzhqt3aSWYDRE/99qwNBWtMN87Wc3Z5P6BYbLmsbTGs3BPyO1Ev
         ffse9GRnWn8OYbspl/qzE844/wA8Y28GpB2akOKubUM3fkoI9S+LGuOwVFilDB8hFoNW
         MSMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWardLpV6YZLERu4Qowfrd+KriytdjLohiTTJAmxkuuSlcEHsROD++W4dqEfFCeyFxvXDEA+RrS25x1W/7hHrRrmSar90OiZRuBI0jtZDea
X-Gm-Message-State: AOJu0YynNyTmKPwSCRD/vkMwtfyffppdee8sjoPgRU/NhWEEBrtxhxo4
	l4FDF3kJ4dmbJZg0ZJyj92XN1Xu4ahR0irPe5jOWohL03zem4o+RaUfYN8Byc7Y=
X-Google-Smtp-Source: AGHT+IHNesJtO0UqquNF67ECCx6rJvGVvWqByp4IpDMUVIaiuwlaYkut+gD3Q7guqC20bvpJVZvxbQ==
X-Received: by 2002:a17:902:da91:b0:1f9:c289:7378 with SMTP id d9443c01a7336-1f9c2897606mr82016305ad.33.1718996543540;
        Fri, 21 Jun 2024 12:02:23 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb2f051bsm17459975ad.51.2024.06.21.12.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 12:02:23 -0700 (PDT)
Date: Fri, 21 Jun 2024 12:02:21 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Cyril Bur <cyrilbur@tenstorrent.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] riscv: convert bottom half of exception handling to C
Message-ID: <ZnXOPbuGe3nHNrs5@debug.ba.rivosinc.com>
References: <20240616170553.2832-1-jszhang@kernel.org>
 <20240616170553.2832-4-jszhang@kernel.org>
 <ZnMPhcaTKFRbbE1i@debug.ba.rivosinc.com>
 <CANtDSipXbYSuz6NakbXw-8k0_ZN5hdT7VWMushXvQ5VB0Am_Ng@mail.gmail.com>
 <95a081a9-2307-4e5b-8ae2-082be16b327e@rivosinc.com>
 <ZnTByNTDWnVdtiDr@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZnTByNTDWnVdtiDr@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_120227_222110_491C1CC9 
X-CRM114-Status: GOOD (  22.06  )
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

T24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMDc6NTY6NTZBTSArMDgwMCwgSmlzaGVuZyBaaGFuZyB3
cm90ZToKPk9uIFRodSwgSnVuIDIwLCAyMDI0IGF0IDEwOjA2OjE1QU0gKzAyMDAsIENsw6ltZW50
IEzDqWdlciB3cm90ZToKPj4KPj4KPj4gT24gMjAvMDYvMjAyNCAwMjowMiwgQ3lyaWwgQnVyIHdy
b3RlOgo+PiA+IE9uIFRodSwgSnVuIDIwLCAyMDI0IGF0IDM6MDTigK9BTSBEZWVwYWsgR3VwdGEg
PGRlYnVnQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+ID4+Cj4+ID4+IE9uIE1vbiwgSnVuIDE3LCAy
MDI0IGF0IDAxOjA1OjUwQU0gKzA4MDAsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4+ID4+PiBGb3Ig
cmVhZGFiaWxpdHksIG1haW50YWluYWJpbGl0eSBhbmQgZnV0dXJlIHNjYWxhYmlsaXR5LCBjb252
ZXJ0IHRoZQo+PiA+Pj4gYm90dG9tIGhhbGYgb2YgdGhlIGV4Y2VwdGlvbiBoYW5kbGluZyB0byBD
Lgo+PiA+Pj4KPj4gPj4+IE1vc3RseSB0aGUgYXNzZW1ibHkgY29kZSBpcyBjb252ZXJ0ZWQgdG8g
QyBpbiBhIHJlbGF0aXZlbHkKPj4gPj4+IHN0cmFpZ2h0Zm9yd2FyZCBtYW5uZXIuCj4+ID4+Pgo+
PiA+Pj4gSG93ZXZlciwgdGhlcmUgYXJlIHR3byBtb2RpZmljYXRpb25zIEkgbmVlZCB0byBtZW50
aW9uOgo+PiA+Pj4KPj4gPj4+IDEuIHRoZSBDU1JfQ0FVU0UgcmVnIHJlYWRpbmcgYW5kIHNhdmlu
ZyBpcyBtb3ZlZCB0byB0aGUgQyBjb2RlCj4+ID4+PiBiZWNhdXNlIHdlIG5lZWQgdGhlIGNhdXNl
IHRvIGRpc3BhdGNoIHRoZSBleGNlcHRpb24gaGFuZGxpbmcsCj4+ID4+PiBpZiB3ZSBrZWVwIHRo
ZSBjYXVzZSByZWFkaW5nIGFuZCBzYXZpbmcsIHdlIGVpdGhlciBwYXNzIGl0IHRvCj4+ID4+PiBk
b190cmFwcygpIHZpYS4gMm5kIHBhcmFtIG9yIGdldCBpdCBmcm9tIHB0X3JlZ3Mgd2hpY2ggYW4g
ZXh0cmEKPj4gPj4+IG1lbW9yeSBsb2FkIGlzIG5lZWRlZCwgSSBkb24ndCBsaWtlIGFueSBvZiB0
aGUgdHdvIHNvbHV0aW9ucyBiZWNhc2UKPj4gPj4+IHRoZSBleGNlcHRpb24gaGFuZGxpbmcgc2l0
cyBpbiBob3QgY29kZSBwYXRoLCBldmVyeSBpbnN0cnVjdGlvbgo+PiA+Pj4gbWF0dGVycy4KPj4g
Pj4KPj4gPj4gQ0M6IENsZW1lbnQuCj4+ID4+Cj4+ID4+IEkgdGhpbmsgaXRzIGJldHRlciB0byBz
YXZlIGF3YXkgY2F1c2UgaW4gcHRfcmVncyBwcmlvciB0byBjYWxsaW5nCj4+ID4+IGBkb190cmFw
c2AuIE9uY2UgY29udHJvbCBpcyB0cmFuc2ZlcnJlZCB0byBDIGNvZGUgaW4gYGRvX3RyYXBzYCwK
Pj4gPj4gYW5vdGhlciB0cmFwIGNhbiBoYXBwZW4uIEl0J3MgYSBwcm9ibGVtIGFueXdheXMgdG9k
YXkgd2l0aG91dCBDUFUgc3VwcG9ydC4KPj4gPj4KPj4gPj4gQWx0aG91Z2ggd2l0aCBTc2RibHRy
cCBbMV0gZXh0ZW5zaW9uIGFuZCBpdCBrZXJuZWwgc3VwcG9ydCBbMl0gZm9yIGl0LAo+PiA+PiBJ
IGV4cGVjdCBhc20gY29kZSB3b3VsZCBjbGVhciB1cCBgU0RUYCBiaXQgaW4gbXN0YXR1cy4gV2hl
bmV2ZXIgYFNzZGJsdHJwYCBsYW5kcywKPgo+SGkgRGVlcGFrLCBDbMOpbWVudCwKPgo+Q3VycmVu
dGx5LCBTUl9JRSBiaXQgaXMgaXMgc2V0KHNldHRpbmcgbWVhbnMgZW5hYmxlIGlycSkgaW4gYywg
Y291bGQgdGhlCj4nU0RUJyBiaXQgYmUgY2xlYXJlZCBpbiBjIGFzIHdlbGwgd2hlbiBTc2RibHRy
cCBsYW5kcz8KClNEVCBpcyBwbGFjZWQgaW4gc3N0YXR1cyBDU1IuIFNvIHllcyBpdHMgcG9zc2li
bGUgdG8gY2xlYXIgaXQgaW4gQyBpbiBgZG9fdHJhcHNgLgpBbHRob3VnaCB0aGVuIHlvdSAoYW5k
IGFueSBmdXR1cmUgZGV2ZWxvcGVyKSB3aWxsIGhhdmUgdG8gcGF5IGV4dHJhIGF0dGVudGlvbiB0
byB0aGlzCmZ1bmN0aW9uIGJlY2F1c2UgdGhpcyBmdW5jdGlvbiBjYW4gYmUgbmVzdGVkIGRlcGVu
ZGluZyBvbiB3aGVuIFNEVCBpcyBjbGVhcmVkIG9yIG5vdC4KTWFpbnRhaW5lbmNlIChhbmQgaW50
cm9kdWN0aW9ucyBvZiBlcnJvcikgd2lzZSBpdCBkb2Vzbid0IGxvb2sgaWRlYWwuCgpJZiB3ZSBr
ZWVwIHJlYWQgb2YgYGNhdXNlYCBpbiBhc20gY29kZSBhbmQgcGFzcyBpdCBhcyBwYXJhbWV0ZXIg
dG8gYGRvX3RyYXBzYCwgaXQKY2xlYW5seSBkZWZpbmVzIHRoZSBib3VuZGFyeSBvZiB3aGljaCBm
dW5jdGlvbnMgY2FuIGJlIG5lc3RlZCBhbmQgd2hpY2ggY2FuJ3QuIEl0CmhlbHBzIGZlYXR1cmVz
IGxpa2UgU1NFIFsxLCAyXSAod2hpY2ggZXhwZWN0IG5lc3Rpbmcgb2YgZXZlbnRzIGFuZCBoYWQg
dG8gYmUgY3JlYXRpdmUpCnRvIGltcGxlbWVudCBjbGVhbmVyIGxvZ2ljLgoKWzFdIGh0dHBzOi8v
bGlzdHMucmlzY3Yub3JnL2cvdGVjaC1wcnMvbWVzc2FnZS81MTUKWzJdIGh0dHBzOi8vbHBjLmV2
ZW50cy9ldmVudC8xNy9jb250cmlidXRpb25zLzE0NzkvYXR0YWNobWVudHMvMTI0My8yNTI2L1NT
RV9QbHVtYmVycy5wZGYKCj4KPlRoYW5rcwo+PiA+PiBJIHRoaW5rIGBkb190cmFwc2Agc2hvdWxk
IGV4cGVjdCBuZXN0aW5nIG9mIHRyYXBzIGFuZCB0aHVzIGNhdXNlIHNob3VsZCBiZSBzYXZlZAo+
PiA+PiBhd2F5IGJlZm9yZSBpdCBnZXRzIGNvbnRyb2wgc28gdGhhdCBzYWZlbHkgdHJhcHMgY2Fu
IGJlIG5lc3RlZC4KPj4KPj4gSGksCj4+Cj4+IEluZGVlZCwgZXZlcnkgcmVnaXN0ZXIgdGhhdCBp
cyAidW5pcXVlIiB0byBhIHRyYXAgYW5kIHRoYW4gY2FuIGJlCj4+IG92ZXJ3cml0dGVuIGJ5IGEg
c2Vjb25kIHRyYXAgc2hvdWxkIGJlIHNhdmVkIGJlZm9yZSByZWVuYWJsaW5nIHRoZW0gd2hlbgo+
PiB1c2luZyBTc2RibHRycC4gU28gdGhhdCB3b3VsZCBiZSBuaWNlIHRvIHByZXNlcnZlIHRoYXQu
Cj4+Cj4+ID4+Cj4+ID4KPj4gPiBJcyBhIHBvc3NpYmxlIHNvbHV0aW9uIHRvIGRvIGJvdGggb3B0
aW9ucyBKaXNoZW5nIHN1Z2dlc3RlZD8gU2F2ZSB0aGUKPj4gPiBjYXVzZSBiZWZvcmUKPj4gPiBj
YWxsaW5nIGRvX3RyYXBzIGJ1dCBhbHNvIHBhc3MgaXQgdmlhIHNlY29uZCBwYXJhbT8KPj4KPj4g
SSBndWVzcyBzbyBpZiBpdCBmaXRzIHlvdXIgcGVyZm9ybWFuY2UgcmVxdWlyZW1lbnRzLgo+Pgo+
PiBUaGFua3MsCj4+Cj4+IENsw6ltZW50Cj4+Cj4+ID4KPj4gPj4gWzFdIC0gaHR0cHM6Ly9naXRo
dWIuY29tL3Jpc2N2L3Jpc2N2LWRvdWJsZS10cmFwL3JlbGVhc2VzL2Rvd25sb2FkL3YxLjAtcmMx
L3Jpc2N2LWRvdWJsZS10cmFwLnBkZgo+PiA+PiBbMl0gLSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyNDA0MTgxMzM5MTYuMTQ0MjQ3MS0xLWNsZWdlckByaXZvc2luYy5jb20vCj4+ID4+
Cj4+ID4+Pgo+PiA+Pj4gMi5UbyBjb3BlIHdpdGggU0lGSVZFX0NJUF80NTMgZXJyYXRhLCBpdCBs
b29rcyBsaWtlIHdlIGRvbid0IG5lZWQKPj4gPj4+IGFsdGVybmF0aXZlIG1lY2hhbmlzbSBhbnkg
bW9yZSBhZnRlciB0aGUgYXNtLT5jIGNvbnZlcnRpb24uIEp1c3QKPj4gPj4+IHJlcGxhY2UgdGhl
IGV4Y3BfdmVjdF90YWJsZSB0d28gZW50cmllcy4KPj4gPj4+Cj4+ID4+PiBTaWduZWQtb2ZmLWJ5
OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4+ID4+Cj4+ID4+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+ID4+IGxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdAo+PiA+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+ID4+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
