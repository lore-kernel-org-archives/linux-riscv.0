Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AFECD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 16:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cKEcv4oa8KhHWY9Tmn/NjyzKeDmUUUOGKQFovO3RMIw=; b=N2DANrbNBngV1z
	T/6ddlMYNIC/RT4d2bEC/Z0gH7BxG0xf9dzCMI/vUPGek01wCdfq6Unjl6LvrHty/iCklzZlaAq0x
	rRUrVN4sgTBiz3NTcjgZpeJX81PP3cUG6PsegRZwAZj9EWHUYT8lWnKNy5VgnKo6Dg7ZQpwqv7As4
	6Q4LJPMyRgi/L6D8SRdFLsSYRHgylcAA9PqCiXRPS8WmuZ03294pIqbj/71MdiC65RVwVvrt6t18y
	U8/H432BQeQD7Pmb/3NMGRDVCBMIwu4bJcxcbP9HJR+CeGx99ClbI5vJ54nY8QftmAt2hCOMS8fkn
	+ucJM2YYAhf9ubO0SyRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvQg-00000008s74-1HdG;
	Fri, 15 May 2026 16:30:26 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvQd-00000008s5x-3vsI
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 16:30:25 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so1865ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 May 2026 09:30:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778862622; cv=none;
        d=google.com; s=arc-20240605;
        b=j+argyD+gCHLaBuujzpAnC+TimPKlASkwzj2RKOnN9TLb9jI++f8SaTmLzOOfvmnen
         33tpKea2TnWWVBz0HJ5fobROxTgoTCvE2M3mA0a25F6Q3Ibb67uwJkPCRr8ssv/rYsfb
         xu0TUCHik+9XottKu7iCbJyh/ssFM3WrjRx5+9yPIr4NjSSJSnQ9JjfYXXtZnsv2L+DS
         6BSf/Pe0DBYTYjjfqw721StDco2Fw/gvFI8oi8eDikW9zxWSzgwuQRdMRLVGuYwOZJwT
         vyJ2ohae849m7vMct/V6Iw7MPxxhkD+6avvfXD+tpiPJq9oSSzWPAD2YG8wOgQqgWVBh
         hNag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N8X36HUs6rqQl1PIy+2NqoP5v4KEcuNa4UBTx84v5R0=;
        fh=L45g5NjHs7hBubXAp+ELszCxBy0YwsPOclOga5Hdix0=;
        b=JWq7UGxDFqouctSv7Qvp4giZkIm+RzRvxrPbef5pPYSeqT2nL8A9oTpL3sRzNoFM3p
         zF4LFVDy/mPb5zTR33SyvdLon48l37VU/xBVfeM5UjRH9ccOo/Tq16Zg1H4FrvAO7ptc
         Kd8DPT1F853b6VsErgCGd+ISXEAuC8ScNBsRlVxcD5zeMYyGUdDfRrTob8I/yEyIOkyC
         XOKnWzBpRAe0reQ/5DRINOVUH2NlWqAodbj1Rwa+P8O+0UM657/vzn8+8kiW8iylvS7V
         DHtEWQ/GgG7wGOmo1VAaRCYFMsNIwBgRaR2SfG/2YTMdRs3H0E2ESDIDxMSMApiTndgd
         RYog==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778862622; x=1779467422; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8X36HUs6rqQl1PIy+2NqoP5v4KEcuNa4UBTx84v5R0=;
        b=nq4eiLkN/bCgCJkkFxpwy7EWJf2a7JXmrqg+uxcXHfG5ihPGAVQVjVnb7qOhhf3Qoz
         b/QIEwJdfnTEurx1SFVuQBDAt79o3h7e0GFusU9/wO5PG1Eu16B5+5yttkJmEEsAPGw/
         bpOBrwtYNPJEymEMynIFt+mRpopVYr52k5IDxJGxFHnUFeGeLk/9paXw1/qkOOIob489
         2CCJ8/2I8wYudYLJ+1fQ/hfM8KLk2N6KshLThknN3rRWXqiMGvz5gNGY9DrBpoArokYV
         J7fZ5ZXRCudl/1H19v770Ll9pLiTAlWW4594midp0YFrnjovbmdKBMfzGIzmEEB6Jk0L
         t6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778862622; x=1779467422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N8X36HUs6rqQl1PIy+2NqoP5v4KEcuNa4UBTx84v5R0=;
        b=FtBd/B9BRvJHkeuFPIWIejZWibINdDzH/v97fE7OOegL2He6DCpfp0qqXRAVfcMjgV
         WmQ12X5XzBwh0VO7CZ72nGEG7xNbl7OtaVsHOq2iCoxc0L7/RBqUIsNzyv7c4ZEpTYGZ
         2h6UlR017LOzlgidQa2ut1HCl76uJNnkfuZqiQGOkEuWIGzRkoX15XLu2ZWr4iVbltkh
         pGLC2smTO5g1Ke1LWp8Kg0QlwVy2EJ+c+pYLdyylVsSTGCSagdCxolpO5Aw3/nRWaSoz
         MoGdfZVbVm4PuZjsGFZb+9RxxsdJlsVhnBCh5VzS9RgLJ3CKPIpc0+2sGutJFh9Usiun
         yypQ==
X-Forwarded-Encrypted: i=1; AFNElJ849RrCcPhPO6NFsHySZMEYqljihnG+qvcdBtFa95+Y60/6VWzPbYPlWO1vd/i0WrcxFCXKoPSJEOX9xg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4uwsW9d8AjwL7WqIUe/409UNS5oAfeHS5VrFH7etN1cZdYury
	fgSed6OunQGjfdFrE6275xhchlhp2kLOXCk/aXNI8xaZyQutgtmD07K1KS0BX2dB2NIGoFCyKHY
	wp2LMDi6PDCgBP9mTn6tkXAr8sBs2SFzRIhihtWlb
X-Gm-Gg: Acq92OHE0SCGwn2cG0X1Rzm/bsnLpZDAH4WAsODzsnVotZe0Ak0clpyhYfC7aZgare6
	ovi8CtPM+hmEOnYu54fCtxojPQZ++YDf1Xw+eTwVIGbVC3Cvj87R7XPETLWw3p1nzTitMU+2xTU
	1uri43uiYgz+kLMh1pdRG9j91JkP8R8wHAhRrYTA/G/BKGiaO7bnJ8WtkH5Hh0Kh+yn32wGij8c
	Na8FbdLGyHxJa9zR2/gHysAP8u6BxKsP6pESuzs//BI+7wT2JYb7A8Q9rJ3Et2hN/K6Dckgb4G2
	KqXjOkOkh6Ct4zqoEzE=
X-Received: by 2002:a17:903:3203:b0:2bd:907:2ce5 with SMTP id
 d9443c01a7336-2bd855b3f82mr2291875ad.7.1778862621458; Fri, 15 May 2026
 09:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260413024805.1316480-1-irogers@google.com> <20260513233151.572332-1-irogers@google.com>
 <20260513233151.572332-2-irogers@google.com> <agZk-CCrLUMTyWE4@x1> <agcDOac0qbP1KZ4Y@x1>
In-Reply-To: <agcDOac0qbP1KZ4Y@x1>
From: Ian Rogers <irogers@google.com>
Date: Fri, 15 May 2026 09:30:08 -0700
X-Gm-Features: AVHnY4Jj3RombHh7dzSY677EqlEwmw-S-zqP0uGxlB6k_ARgnj2jPXbNAf5RD5M
Message-ID: <CAP-5=fUO67hKRV0C48uT5zF4uj6ptT+ApYE1jOitnJ=Af700=Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] perf unwind: Refactor get_entries to allow dynamic
 libdw/libunwind selection
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, namhyung@kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Li Guan <guanli.oerv@isrc.iscas.ac.cn>, 
	9erthalion6@gmail.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	howardchu95@gmail.com, john.g.garry@oracle.com, jolsa@kernel.org, 
	leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org, 
	shimin.guo@skydio.com, tglozar@redhat.com, tmricht@linux.ibm.com, 
	will@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_093024_012139_937165D5 
X-CRM114-Status: GOOD (  23.51  )
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

T24gRnJpLCBNYXkgMTUsIDIwMjYgYXQgNDoyN+KAr0FNIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVs
bwo8YWNtZUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTWF5IDE0LCAyMDI2IGF0IDA5
OjEyOjQwUE0gLTAzMDAsIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyB3cm90ZToKPiA+IE9uIFdl
ZCwgTWF5IDEzLCAyMDI2IGF0IDA0OjMxOjQ1UE0gLTA3MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4K
PiA8U05JUD4KPgo+ID4gPiArKysgYi90b29scy9wZXJmL3V0aWwvdW53aW5kLmgKPgo+IDxTTklQ
Pgo+Cj4gPiA+ICtzdGF0aWMgaW5saW5lIGludCBsaWJkd19fZ2V0X2VudHJpZXModW53aW5kX2Vu
dHJ5X2NiX3QgY2IgX19tYXliZV91bnVzZWQsIHZvaWQgKmFyZyBfX21heWJlX3VudXNlZCwKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHRocmVhZCAqdGhyZWFk
IF9fbWF5YmVfdW51c2VkLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgcGVyZl9zYW1wbGUgKmRhdGEgX19tYXliZV91bnVzZWQsCj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGludCBtYXhfc3RhY2sgX19tYXliZV91bnVzZWQsCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgYmVzdF9lZmZvcnQgX19tYXli
ZV91bnVzZWQpCj4gPiA+ICt7Cj4gPiA+ICsgICBwcl9lcnIoIkVycm9yOiBsaWJkdyBkd2FyZiB1
bndpbmRpbmcgbm90IGJ1aWx0IGludG8gcGVyZlxuIik7Cj4gPiA+ICsgICByZXR1cm4gMDsKPiA+
ID4gK30KPiA+ID4gKyNlbmRpZgo+Cj4gSSBhbHNvIGFkZHJlc3NlZCB0aGlzIGxvY2FsIHNhc2hp
a28gcmV2aWV3IGNvbW1lbnQ6Cj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gU2luY2UgdW53aW5kaW5n
IGlzIHBlcmZvcm1lZCBwZXItc2FtcGxlIGluIHRoZSBob3QgcGF0aCwgd2lsbCB1c2luZyBwcl9l
cnIoKQo+IGhlcmUgY2F1c2UgY29uc29sZSBmbG9vZGluZyBpZiB0aGUgdXNlciBleHBsaWNpdGx5
IGNvbmZpZ3VyZXMgYW4gdW5zdXBwb3J0ZWQKPiB1bndpbmQgc3R5bGU/Cj4gU2hvdWxkIHRoaXMg
dXNlIHByX3dhcm5pbmdfb25jZSgpIGluc3RlYWQsIHNpbWlsYXIgdG8gdGhlIFVOV0lORF9TVFlM
RV9VTktOT1dOCj4gZmFsbGJhY2sgYmVoYXZpb3IgaW4gdW53aW5kLmM/Cj4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+Cj4gQW5kIGluIG9uZSBvdGhlciBwbGFjZSwgcGxlYXNlIGFjaywKCkFja2VkLWJ5OiBJ
YW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+CgpJIHRoaW5rIFNhc2hpa28gaXMgaGVhdmls
eSBiaWFzZWQgdG93YXJkIHdhcm5pbmcgYWJvdXQgdG9vIG11Y2gKcHJpbnRpbmcgZHVlIHRvIGhv
dyB0aGUga2VybmVsIGhhbmRsZXMgcHJpbnRrLCBsb2cgc3BhbSwgZXRjLiBGb3IgcGVyZgp3ZSBo
YXZlIGEgcHJvYmxlbSB0aGF0IHRoZXJlJ3MgbG90cyBvZiB2ZXJib3NlIGxvZ2dpbmcgYW5kIGxv
Z2dpbmcKc29tZXRoaW5nIGp1c3Qgb25jZSBtYXkgbG9zZSB0aGUgd2FybmluZy4gVGhpcyBpcyBz
b21ld2hhdCB0aGUKb3Bwb3NpdGUgcHJvYmxlbSB0byB0aGUga2VybmVsJ3MuIERvIEkgY2FyZSBh
Ym91dCB0aGUgY2hhbmdlIHRoYXQKbXVjaD8gTm90IHJlYWxseS4gSWYgc29tZW9uZSBpcyBoYXZp
bmcgYSBiYWQgdGltZSwgcGVyaGFwcyBpdCBtYWtlcyBpdAphIGxpdHRsZSBoYXJkZXIgZm9yIHRo
ZW0gdG8ga25vdyB3aHkgYnV0IHRoZSBwcmlvcml0eSBpcyB0byBub3QgbWFrZQpwZW9wbGUgaGF2
ZSBhIGJhZCB0aW1lLgoKVGhhbmtzLApJYW4KCj4gLSBBcm5hbGRvCj4KPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvcGVyZi91dGlsL3Vud2luZC5oIGIvdG9vbHMvcGVyZi91dGlsL3Vud2luZC5oCj4gaW5k
ZXggMjhkYjNlM2I5YjUxMzQwMS4uNjliYTA4YWZkYTc5MmQxNyAxMDA2NDQKPiAtLS0gYS90b29s
cy9wZXJmL3V0aWwvdW53aW5kLmgKPiArKysgYi90b29scy9wZXJmL3V0aWwvdW53aW5kLmgKPiBA
QCAtNTMsNyArNTMsNyBAQCBzdGF0aWMgaW5saW5lIGludCBsaWJkd19fZ2V0X2VudHJpZXModW53
aW5kX2VudHJ5X2NiX3QgY2IgX19tYXliZV91bnVzZWQsIHZvaWQgKgo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpbnQgbWF4X3N0YWNrIF9fbWF5YmVfdW51c2VkLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIGJlc3RfZWZmb3J0IF9fbWF5
YmVfdW51c2VkKQo+ICB7Cj4gLSAgICAgICBwcl9lcnIoIkVycm9yOiBsaWJkdyBkd2FyZiB1bndp
bmRpbmcgbm90IGJ1aWx0IGludG8gcGVyZlxuIik7Cj4gKyAgICAgICBwcl93YXJuaW5nX29uY2Uo
IkVycm9yOiBsaWJkdyBkd2FyZiB1bndpbmRpbmcgbm90IGJ1aWx0IGludG8gcGVyZlxuIik7Cj4g
ICAgICAgICByZXR1cm4gMDsKPiAgfQo+ICAjZW5kaWYKPiBAQCAtODEsNyArODEsNyBAQCBzdGF0
aWMgaW5saW5lIGludCBsaWJ1bndpbmRfX2dldF9lbnRyaWVzKHVud2luZF9lbnRyeV9jYl90IGNi
IF9fbWF5YmVfdW51c2VkLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaW50IG1heF9zdGFjayBfX21heWJlX3VudXNlZCwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJvb2wgYmVzdF9lZmZvcnQgX19tYXliZV91bnVzZWQpCj4gIHsK
PiAtICAgICAgIHByX2VycigiRXJyb3I6IGxpYnVud2luZCBkd2FyZiB1bndpbmRpbmcgbm90IGJ1
aWx0IGludG8gcGVyZlxuIik7Cj4gKyAgICAgICBwcl93YXJuaW5nX29uY2UoIkVycm9yOiBsaWJ1
bndpbmQgZHdhcmYgdW53aW5kaW5nIG5vdCBidWlsdCBpbnRvIHBlcmZcbiIpOwo+ICAgICAgICAg
cmV0dXJuIDA7Cj4gIH0KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
