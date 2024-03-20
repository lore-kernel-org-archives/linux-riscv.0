Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE14C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+I0LpIvb/dMcQtcYnzJFN5scI7TBXB/8lkTzAzyXjBM=; b=E3zWCFUEYwW2Ef
	x8simWKrqyykUxGh/5dJV/G97f9fiQ/jzujiRqzIUKQAP2amFqDiupFv1gH/vxz0YNkSolPXVyqqc
	ON48eiOSdebxEzi4u6gjfG57iQI0bPSZ0jqIEkl043bXMhsRwUNSw0vtIgYKzLXLmdIPF6czX7N8T
	tayICulb7KaPeUmZ6iOPxGYLUsfLqYkO/Ao25xQDLzfng4shYSjLhXKyTOEA2GpDyB2Gb1Wo+klq8
	EsMLBkGXTO0yeXjkOaOrhOz6Wl0hyQdNTE579puaOq5yDByGasvX9EvcYlDt/yD7x7GGuA3Z/iIyp
	VhhO0j68TzgGdZMiFB2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmz1H-00000000McB-2q5k;
	Wed, 20 Mar 2024 16:42:27 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmz1E-00000000Mbe-0bYJ
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 16:42:25 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-60a046c5262so67126527b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 09:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710952942; x=1711557742; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/C0go5GeoUF1aqwd5WJWdc0gTbFG3QELgzX8R+DzOuI=;
        b=jwCd0JT5ItjHt0V0+f4Bw3vFL4+L545r54jfyLcV0rtWOPKesi8nkW6NvlIACXVczi
         cSnjzhpxhZsFtMGsdHn7Lh76gAUNXric/OdY8UAcq7CdSzs/Xr+zZq7Ky8sFmbKCRuyE
         9wUNt26G27Nje6aqre4PNabVbfZk91iCiDbTrxA/n9YEKQy5IR46TvpyYJF+zw1hNd1o
         hRW162ZuhkRKXmoTvmlKCa8F5cxQpcGv9K9zepXQH4nkDEFWuHVIYQcDarjcNZRx4Aqm
         3aIn506eJlg4vscPqeLWN1EUcxvdU85mJizzOfR8Awfi5YzeX083k8DUAR4rSaCcxcys
         ViTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710952942; x=1711557742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/C0go5GeoUF1aqwd5WJWdc0gTbFG3QELgzX8R+DzOuI=;
        b=iSb7iRU531fHiMcz+dlyjJhFLoZqzdNayKbqBCE1mpIGaGeliZ0R/2DpKJrGHMGFtJ
         xwEpeNyjM00rneo90BHruesV7xgYLiyTtniF6++TYAORPql3hRK8T7YSiFTpI3YmCetq
         Xx0Yii5PGg9HFpaAF7nK/L55XPhmrhl1DRb5MePnUcXPbo0tbVbJSSEl4WbpjJUPzAPb
         7eMCQFyhNPKV6oy0T6/eC8D5zHwKTJkpJPc9i8Wbs3aKtuXOtytCOEUzy7oYkP9ipRKp
         GZLk9QJ8Acw2dG42Dp24OW85ko3pQNXpOv/nDxdMqET0b9MfRhkVwIP41ffrzfRbpuCU
         /R7A==
X-Forwarded-Encrypted: i=1; AJvYcCW7VvDCy14aiBFH6/jvYrMkbpVO1H6Yqi7d5TAmTWu7UsACB5vRWpIy8BXj7II9jOh9XlUumDlI5PXSl6myS5ZeeyMihvgaR8mlLsbykera
X-Gm-Message-State: AOJu0Yx+V/E7LO0Tw6bUqwwNr3hABLZ84yGJOD+hR1yJXrA/dFE2bPg1
	Of/UbpnSFklK8oN/PKRLqVtXAqObVIaIoa32K54/coTTbjAOiBB3cvRkp+rB5GAWuR8oi+/kFdc
	Jd1vHSzOoctK6iHyYcZ7N31PW3+9tMW1xP3NVRQ==
X-Google-Smtp-Source: AGHT+IGYNdFruVqknweeMZibIxK5wVlRKsW3ccyqWtS2kmgKboBe+PUMsfNihhXKHZf27wB2CGJ+gDtjeYC6VWYGmH8=
X-Received: by 2002:a81:ab50:0:b0:60f:ed06:bee7 with SMTP id
 d16-20020a81ab50000000b0060fed06bee7mr6253031ywk.50.1710952942198; Wed, 20
 Mar 2024 09:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240306165904.108141-1-puranjay12@gmail.com> <87ttlhdeqb.fsf@all.your.base.are.belong.to.us>
 <ZfBbxPDd0rz6FN2T@FVFF77S0Q05N> <8734suqsth.fsf@all.your.base.are.belong.to.us>
 <mb61pplvw6grf.fsf@gmail.com> <87zfv0onre.fsf@all.your.base.are.belong.to.us> <87il1oedx8.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87il1oedx8.fsf@all.your.base.are.belong.to.us>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 21 Mar 2024 00:41:00 +0800
Message-ID: <CABgGipWPuvwi43v1+60-=0_MN_q_CD0ZGasxHHVWJ37cig5MmA@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Puranjay Mohan <puranjay12@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Guo Ren <guoren@kernel.org>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	Deepak Gupta <debug@rivosinc.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, 
	Bjorn Topel <bjorn@rivosinc.com>, Song Shuai <suagrfillet@gmail.com>, 
	"Cl'ement L'eger" <cleger@rivosinc.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Robbin Ehn <rehn@rivosinc.com>, Brendan Sweeney <brs@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_094224_221617_DE71D5E4 
X-CRM114-Status: GOOD (  39.27  )
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

SGkgQmrDtnJuLAoKT24gRnJpLCBNYXIgMTUsIDIwMjQgYXQgNDo1MOKAr0FNIEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JpdGVzOgo+Cj4gPiBQdXJhbmpheSBNb2hhbiA8cHVyYW5qYXkxMkBnbWFpbC5j
b20+IHdyaXRlczoKPiA+Cj4gPj4gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3Jp
dGVzOgo+ID4+Cj4gPj4+Cj4gPj4+IEhtbSwgZGVwZW5kaW5nIG9uIFJJU0MtVidzIENNT0RYIHBh
dGgsIHRoZSBwcm8vY29ucyBDQUxMX09QUyB2cyBkeW5hbWljCj4gPj4+IHRyYW1wb2xpbmVzIGNo
YW5nZXMgcXVpdGUgYSBiaXQuCj4gPj4+Cj4gPj4+IFRoZSBtb3JlIEkgbG9vayBhdCB0aGUgcGFp
bnMgb2YgcGF0Y2hpbmcgdHdvIGluc3RydWN0aW9uICgic3BsaXQKPiA+Pj4gaW1tZWRpYXRlcyIp
LCB0aGUgYmV0dGVyICJwYXRjaCBkYXRhIiArIG9uZSBpbnNuIHBhdGNoaW5nIGxvb2suCj4gPj4K
PiA+PiBJIHdhcyBsb29raW5nIGF0IGhvdyBkeW5hbWljIHRyYW1wb2xpbmVzIHdvdWxkIGJlIGlt
cGxlbWVudGVkIGZvciBSSVNDLVYuCj4gPj4KPiA+PiBXaXRoIENBTEwtT1BTIHdlIG5lZWQgdG8g
cGF0Y2ggdGhlIGF1aXBjK2phbHIgYXQgZnVuY3Rpb24gZW50cnkgb25seSwgdGhlCj4gPj4gb3Bz
IHBvaW50ZXIgYWJvdmUgdGhlIGZ1bmN0aW9uIGNhbiBiZSBwYXRjaGVkIGF0b21pY2FsbHkuCj4g
Pj4KPiA+PiBXaXRoIGEgZHluYW1pYyB0cmFtcG9saW5lIHdlIG5lZWQgYSBhdWlwYytqYWxyIHBh
aXIgYXQgZnVuY3Rpb24gZW50cnkgdG8ganVtcAo+ID4+IHRvIHRoZSB0cmFtcG9saW5lIGFuZCB0
aGVuIGFub3RoZXIgYXVpcGMramFsciBwYWlyIHRvIGp1bXAgZnJvbSB0cmFtcG9saW5lIHRvCj4g
Pj4gb3BzLT5mdW5jLiBXaGVuIHRoZSBvcHMtPmZ1bmMgaXMgbW9kaWZpZWQsIHdlIHdvdWxkIG5l
ZWQgdG8gdXBkYXRlIHRoZQo+ID4+IGF1aXBjK2phbHIgYXQgaW4gdGhlIHRyYW1wb2xpbmUuCj4g
Pj4KPiA+PiBTbywgSSBhbSBub3Qgc3VyZSBob3cgdG8gbW92ZSBmb3J3YXJkIGhlcmUsIENBTEwt
T1BTIG9yIER5bmFtaWMgdHJhbXBvbGluZXM/Cj4gPgo+ID4gWWVhaC4gSG9uZXN0bHksIHdlIG5l
ZWQgdG8gZmlndXJlIG91dCB0aGUgcGF0Y2hpbmcgc3RvcnkgcHJpb3IKPiA+IGNob29zaW5nIHRo
ZSBwYXRoLCBzbyBsZXQncyBzdGFydCB0aGVyZS4KPiA+Cj4gPiBBZnRlciByZWFkaW5nIE1hcmsn
cyByZXBseSwgYW5kIGRpc2N1c3Npbmcgd2l0aCBPcGVuSkRLIGZvbGtzICh3aG8gZG9lcwo+ID4g
dGhlIG1vc3QgY3JhenkgdGV4dCBwYXRjaGluZyBvbiBhbGwgcGxhdGZvcm1zKSwgaGF2aW5nIHRv
IHBhdGNoIG11bHRpcGxlCj4gPiBpbnN0cnVjdGlvbnMgKHdoZXJlIHRoZSBhZGRyZXNzIG1hdGVy
aWFsaXphdGlvbiBpcyBzcGxpdCBvdmVyIG11bHRpcGxlCj4gPiBpbnN0cnVjdGlvbnMpIGlzIGEg
bm8tZ28uIEl0J3MganVzdCBhIHRvbyBiaWcgY2FuIG9mIHdvcm1zLiBTbywgaWYgd2UKPiA+IGNh
biBvbmx5IHBhdGNoIG9uZSBpbnNuLCBpdCdzIENBTExfT1BTLgo+ID4KPiA+IEEgY291cGxlIG9m
IG9wdGlvbnMgKGluIGFkZGl0aW9uIHRvIEFuZHkncyksIGFuZCBhbGwgcmVxdWlyZSBhCj4gPiBw
ZXItZnVuY3Rpb24gbGFuZGluZyBhZGRyZXNzIGFsYSBDQUxMX09QUykgdHdlYWtpbmcgd2hhdCBN
YXJrIGlzIGRvaW5nCj4gPiBvbiBBcm0gKGdpdmVuIHRoZSBwb29yIGJyYW5jaCByYW5nZSkuCj4g
Pgo+ID4gLi4uYW5kIG1heWJlIHdlJ2xsIGdldCBSSVNDLVYgcmFpbmJvd3MvdW5pY29ybnMgaW4g
dGhlIGZ1dHVyZSBnZXR0aW5nCj4gPiBiZXR0ZXIgcmVhY2ggKGZ1bGwgNjRiISA7LSkpLgo+ID4K
PiA+IEEpIFVzZSBhdWlwYy9qYWxyLCBvbmx5IHBhdGNoIGphbHIgdG8gdGFrZSB1cyB0byBhIGNv
bW1vbgo+ID4gICAgZGlzcGF0Y2hlci90cmFtcG9saW5lCj4gPgo+ID4gIHwgPGZ1bmNfdHJhY2Vf
dGFyZ2V0X2RhdGFfOEI+ICMgcHJvYmFibHkgb24gYSBkYXRhIGNhY2hlLWxpbmUgIT0gZnVuYyAu
dGV4dCB0byBhdm9pZCBwaW5nLXBvbmcKPiA+ICB8IC4uLgo+ID4gIHwgZnVuYzoKPiA+ICB8ICAg
Li4ubWFrZSBzdXJlIHJhIGlzbid0IG1lc3NlZCB1cC4uLgo+ID4gIHwgICBhdXBpYwo+ID4gIHwg
ICBub3AgPD0+IGphbHIgIyBUZXh0IHBhdGNoIHBvaW50IC0+IGNvbW1vbl9kaXNwYXRjaAo+ID4g
IHwgICBBQ1RVQUxfRlVOQwo+ID4gIHwKPiA+ICB8IGNvbW1vbl9kaXNwYXRjaDoKPiA+ICB8ICAg
bG9hZCA8ZnVuY190cmFjZV90YXJnZXRfZGF0YV84Qj4gYmFzZWQgb24gcmEKPiA+ICB8ICAgamFs
cgo+ID4gIHwgICAuLi4KPiA+Cj4gPiBUaGUgYXVpcGMgaXMgbmV2ZXIgdG91Y2hlZCwgYW5kIHdp
bGwgYmUgb3ZlcmhlYWQuIEFsc28sIHdlIG5lZWQgYSBtdiB0bwo+ID4gc3RvcmUgcmEgaW4gYSBz
Y3JhdGNoIHJlZ2lzdGVyIGFzIHdlbGwgLS0gbGlrZSBBcm0uIFdlJ2xsIGhhdmUgdHdvIGluc24K
PiA+IHBlci1jYWxsZXIgb3ZlcmhlYWQgZm9yIGEgZGlzYWJsZWQgY2FsbGVyLgo+ID4KPiA+IEIp
IFVzZSBqYWwsIHdoaWNoIGNhbiBvbmx5IHRha2UgdXMgKy8tMU0sIGFuZCByZXF1aXJlcyBtdWx0
aXBsZQo+ID4gICAgZGlzcGF0Y2hlcnMgKGFuZCB0cmFja2luZyB3aGljaCBvbmUgdG8gdXNlLCBh
bmQgcHJvcGVybHkgZGlzdHJpYnV0ZQo+ID4gICAgdGhlbS4gSWNrLikKPiA+Cj4gPiAgfCA8ZnVu
Y190cmFjZV90YXJnZXRfZGF0YV84Qj4gIyBwcm9iYWJseSBvbiBhIGRhdGEgY2FjaGUtbGluZSAh
PSBmdW5jIC50ZXh0IHRvIGF2b2lkIHBpbmctcG9uZwo+ID4gIHwgLi4uCj4gPiAgfCBmdW5jOgo+
ID4gIHwgICAuLi5tYWtlIHN1cmUgcmEgaXNuJ3QgbWVzc2VkIHVwLi4uCj4gPiAgfCAgIG5vcCA8
PT4gamFsICMgVGV4dCBwYXRjaCBwb2ludCAtPiB3aXRoaW5fMU1fdG9fZnVuY19kaXNwYXRjaAo+
ID4gIHwgICBBQ1RVQUxfRlVOQwo+ID4gIHwKPiA+ICB8IHdpdGhpbl8xTV90b19mdW5jX2Rpc3Bh
dGNoOgo+ID4gIHwgICBsb2FkIDxmdW5jX3RyYWNlX3RhcmdldF9kYXRhXzhCPiBiYXNlZCBvbiBy
YQo+ID4gIHwgICBqYWxyCj4gPgo+ID4gQykgVXNlIGphbCwgd2hpY2ggY2FuIG9ubHkgdGFrZSB1
cyArLy0xTSwgYW5kIHVzZSBhIHBlci1mdW5jdGlvbgo+ID4gICAgdHJhbXBvbGluZSByZXF1aXJl
cyBtdWx0aXBsZSBkaXNwYXRjaGVycyAoYW5kIHRyYWNraW5nIHdoaWNoIG9uZSB0bwo+ID4gICAg
dXNlKS4gQmxvd3MgdXAgdGV4dCBzaXplIEEgTE9ULgo+ID4KPiA+ICB8IDxmdW5jX3RyYWNlX3Rh
cmdldF9kYXRhXzhCPiAjIHNvbWV3aGVyZSwgYnV0IHByb2JhYmx5IG9uIGEgZGlmZmVyZW50IGNh
Y2hlbGluZSB0aGFuIHRoZSAudGV4dCB0byBhdm9pZCBwaW5nLW9uZ3MKPiA+ICB8IC4uLgo+ID4g
IHwgcGVyX2Z1bmNfZGlzcGF0Y2gKPiA+ICB8ICAgbG9hZCA8ZnVuY190cmFjZV90YXJnZXRfZGF0
YV84Qj4gYmFzZWQgb24gcmEKPiA+ICB8ICAgamFscgo+ID4gIHwgZnVuYzoKPiA+ICB8ICAgLi4u
bWFrZSBzdXJlIHJhIGlzbid0IG1lc3NlZCB1cC4uLgo+ID4gIHwgICBub3AgPD0+IGphbCAjIFRl
eHQgcGF0Y2ggcG9pbnQgLT4gcGVyX2Z1bmNfZGlzcGF0Y2gKPiA+ICB8ICAgQUNUVUFMX0ZVTkMK
Pgo+IEJyZW5kYW4gcHJvcG9zZWQgeWV0IGFub3RoZXIgb3B0aW9uLCAiaW4tZnVuY3Rpb24gZGlz
cGF0Y2giOgo+Cj4gRCkKPiAgIHwgPGZ1bmNfdHJhY2VfdGFyZ2V0X2RhdGFfOEJfcGVyX2Z1bmN0
aW9uPiAjIGlkayBzb21ld2hlcmUKPiAgIHwgLi4uCj4gICB8IGZ1bmM6Cj4gICB8ICAgIG12IHRt
cDEsIHJhCj4gICB8ICAgIGF1cGljIHRtcDIsIDxmdW5jX3RyYWNlX3RhcmdldF9kYXRhXzhCX3Bl
cl9mdW5jdGlvbjp1cHBlcj4KPiAgIHwgICAgbXYgdG1wMywgemVybyA8PT4gbGQgdG1wMywgdG1w
MjxmdW5jX3RyYWNlX3RhcmdldF9kYXRhXzhCX3Blcl9mdW5jdGlvbjpsb3dlcj4KPiAgIHwgICAg
bm9wIDw9PiBqYWxyIHJhLCB0bXAzCj4gICB8ICAgIEFDVFVBTF9GVU5DCgpNeSBwYXRjaCBzZXJp
ZXMgdGFrZXMgYSBzaW1pbGFyICJpbi1mdW5jdGlvbiBkaXNwYXRjaCIgYXBwcm9hY2guIEEKZGlm
ZmVyZW5jZSBpcyB0aGF0IHRoZSA8ZnVuY190cmFjZV90YXJnZXRfZGF0YV84Ql9wZXJfZnVuY3Rp
b24+IGlzCmVtYmVkZGVkIHdpdGhpbiBlYWNoIGZ1bmN0aW9uIGVudHJ5LiBJJ2QgbGlrZSB0byBo
YXZlIGl0IG1vdmVkIHRvIGEKcnVuLXRpbWUgYWxsb2NhdGVkIGFycmF5IHRvIHJlZHVjZSB0b3Rh
bCB0ZXh0IHNpemUuCgpBbm90aGVyIGRpZmZlcmVuY2UgaXMgdGhhdCBteSBzZXJpZXMgY2hhbmdl
cyB0aGUgZmlyc3QgaW5zdHJ1Y3Rpb24gdG8KImogQUNUVUFMX0ZVTkMiIGZvciB0aGUgImZ0cmFj
ZSBkaXNhYmxlIiBjYXNlLiBBcyBsb25nIGFzIHRoZQphcmNoaXRlY3R1cmUgZ3VhcmFudGVlcyB0
aGUgYXRvbWljaXR5IG9mIHRoZSBmaXJzdCBpbnN0cnVjdGlvbiwgdGhlbgp3ZSBhcmUgc2FmZS4g
Rm9yIGV4YW1wbGUsIHdlIGFyZSBzYWZlIGlmIHRoZSBmaXJzdCBpbnN0cnVjdGlvbiBjb3VsZApv
bmx5IGJlICJtdiB0bXAsIHJhIiBvciAiaiBBQ1RVQUxfRlVOQyIuIEFuZCBzaW5jZSB0aGUgbG9h
ZGVkIGFkZHJlc3MgaXMKYWx3YXlzIHZhbGlkLCB3ZSBjYW4gZml4ICJtdiArIGphbHIiIGRvd24g
c28gd2UgZG9uJ3QgaGF2ZSB0bwpwbGF5IHdpdGggdGhlIGV4Y2VwdGlvbiBoYW5kbGVyIHRyaWNr
LiBUaGUgZ3VhcmFudGVlIGZyb20gYXJjaCB3b3VsZApyZXF1aXJlIHppY2NpZiAoaW4gUlZBMjIp
IHRob3VnaCwgYnV0IEkgdGhpbmsgaXQgaXMgdGhlIHNhbWUgZm9yIHVzCih1bmxlc3Mgd2l0aCBz
dG9wX21hY2hpbmUpLiBGb3IgemljY2lmLCBJIHdvdWxkIHJhdGhlciBjYWxsIHRoYXQgb3V0CmR1
cmluZyBib290IHRoYW4gYmxpbmRseSBhc3N1bWUuCgpIb3dldmVyLCBvbmUgdGhpbmcgSSBhbSBu
b3QgdmVyeSBzdXJlIGlzOiBkbyB3ZSBuZWVkIGEgZGVzdGluYXRpb24KYWRkcmVzcyBpbiBhICJw
ZXItZnVuY3Rpb24iIG1hbm5lcj8gSXQgc2VlbXMgbGlrZSBtb3N0IG9mIHRoZSB0aW1lIHRoZQpk
ZXN0aW5hdGlvbiBhZGRyZXNzIGNhbiBvbmx5IGJlIGZ0cmFjZV9jYWxsLCBvciBmdHJhY2VfcmVn
c19jYWxsLiBJZgp0aGUgbnVtYmVyIG9mIGRlc3RpbmF0aW9uIGFkZHJlc3NlcyBpcyB2ZXJ5IGZl
dywgdGhlbiB3ZSBjb3VsZApwb3RlbnRpYWxseSByZWR1Y2UgdGhlIHNpemUgb2YKPGZ1bmNfdHJh
Y2VfdGFyZ2V0X2RhdGFfOEJfcGVyX2Z1bmN0aW9uPi4KCj4KPiBUaGVyZSBhcmUgNCBDTU9EWCBw
b3NzaWJsaXRpZXM6Cj4gICAgbXYsIG5vcDogIGZ1bGx5IGRpc2FibGVkLCBubyBwcm9ibGVtcwo+
ICAgIG12LCBqYWxyOiBXZSB3aWxsIGp1bXAgdG8gemVyby4gV2Ugd291bGQgbmVlZCB0byBoYXZl
IHRoZSBpbnN0Cj4gICAgICAgICAgICAgIHBhZ2UvYWNjZXNzIGZhdWx0IGhhbmRsZXIgdGFrZSBj
YXJlIG9mIHRoaXMgY2FzZS4gRXNwZWNpYWxseQo+ICAgICAgICAgICAgICBpZiB3ZSBhbGlnbiB0
aGUgaW5zdHJ1Y3Rpb25zIHNvIHRoYXQgdGhleSBjYW4gYmUgcGF0Y2hlZAo+ICAgICAgICAgICAg
ICB0b2dldGhlciwgYmVpbmcgaW50ZXJydXB0ZWQgaW4gdGhlIG1pZGRsZSBhbmQgdGFraW5nIHRo
aXMKPiAgICAgICAgICAgICAgcGF0aCB3aWxsIGJlIHJhcmUuCj4gICBsZCwgbm9wOiAgIG5vIHBy
b2JsZW1zCj4gICBsZCwgamFscjogIGZ1bGx5IGVuYWJsZWQsIG5vIHByb2JsZW1zCj4KPiBQYXRj
aGluZyBpcyBhIDY0YiBzdG9yZS9zZCwgYW5kIHdlIG9ubHkgbmVlZCBhIGZlbmNlLmkgYXQgdGhl
IGVuZCwgc2luY2UKPiB3ZSBjYW4gaGFuZGxlIGFsbCA0IHBvc3NpYmlsaXRpZXMuCj4KPiBGb3Ig
dGhlIGRpc2FibGVkIGNhc2Ugd2UnbGwgaGF2ZToKPiBBKSBtdiwgYXVwaWMsIG5vcAo+IEQpIG12
LCBhdXBpYywgbXYsIG5vcC4KPgo+IFB1cmFuamF5LCBJJ3ZlIGZsaXBwZWQuIExldCdzIGdvIE1h
cmsncyBDQUxMX09QUyB0b2dldGhlciB3aXRoIGEgbmV3Cj4gdGV4dCBwYXRjaCBtZWNoYW5pc20g
dy9vIHN0b3BfbWFjaGluZSgpLgo+Cj4KPiBCasO2cm4KCkNoZWVycywKQW5keQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
