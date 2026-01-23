Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CEDD74EFC
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 16:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JW3+p+tGPWRA5UtITyEZF9jsjla+gJuChYHSMxknxk=; b=TnzKFhlA+XMMb0
	FAGRxipmCYvQ3cWI0SBbMEk0eO+LMoNqovquymXhX+/zfH37lV84qghlMWqqbcviWt346VwH2hGvI
	NbHUKyNqXNx3Ak0rnEnIsOYSSzKXAHtMyQ27lvqlxnq77F5nI+0/jA2leGZqopEsSWZbSX595c7yK
	CEx2s08/d8LaVwYhKW7UviRjts/FbyZgge97G2SqIw7GFw+q1YsDNzGAe/NyqxSHI51iaSlnca9KG
	jgFl9YJdVvhmlqeQp0z7Xpklor+BjSq506J8tpCK+QHV6pcCWmbjyc1AV2USoQJV8IWSxtoydOBgz
	GNO29CARY4DI4WTRSLdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjK3U-00000009CaZ-3SsK;
	Fri, 23 Jan 2026 16:30:40 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjK3Q-00000009CZi-32nT
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 16:30:38 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a76b39587aso121015ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jan 2026 08:30:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769185835; cv=none;
        d=google.com; s=arc-20240605;
        b=QemS4SGiNNI+CQcFQH/yRp+QHxCPR0S6CsH/Pa49tbRIK4JLd6rpsr3488+AnzsrSS
         NHTL5IkkYa7hTd9laXgIOKlNYil3cBRoxDXnI9sggKismsyVCHTiDkx0ka5r5JNunLcf
         i02NHqenQ+99noOhPT+PjyZYAKEyxE64Ii1qDwpVz3ev/ZMfh7/EwN+UF6MqnXXlfCyy
         VKi6vVYowucwFDF6gw/mXSeveEGcG84uByhmpn/RGT2GTsmxQZpMIsD/hn5awV0OAVWo
         75imCFgM7EF4VzQcKfpRN/dXJerMJYrMGhhJqdTofCDOaNemJkwnt+8iblX5rzDuAA8k
         uEOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vOkRLjnifceecHRFjfFtA9Hu0YVFrmdtZP58mWOpjc8=;
        fh=kMbCi40/ZUi4cH/eNDQlweInRvyZw6GBeCFuXUKVDBA=;
        b=GxlNyndRk9oI53W/t59be2pxoisegQl7pIsQXjwSQyz6WDYtPUzitPggQyMki6cpnt
         00oWV9t+jITXd8isFGWYxFjQyHS9I1t0SaJDvLVkz1IuofHrTEXjlpITdrNWUnBIwXSt
         2hIujGA1dyMAqiy/LPqvo48djo8x18A2JVpK6VfLoMyTTTrAQvbOpAm16fTTJaJqzUYu
         Ca5nB2pG4NFx5jpaAESZZdpkW+asloJOibrArf1e5lS8yMmEHVd5EV23BD+WXebdhuV7
         NBC4FW0gbSyUsgJyvkR/o3yLL9ZTesupEGv6938yhaORUE+FtyWRCdolFsRK6uRivQyF
         yV0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769185835; x=1769790635; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOkRLjnifceecHRFjfFtA9Hu0YVFrmdtZP58mWOpjc8=;
        b=rqTRurjId1+36FhA1ipsJ4ILjta1zkSafRC6j6O/NkwxRy4SapCpCK+sFS6ClgKIOc
         5RScswGD91zpgZGeDNP1pOus4yGPejfN9EoKIYIMcl6feNMfzDYVcp6OqSoHpzkJ5tRh
         53Xmw87P7AgRsuuLQOHcJMxBV13ApDAQ0MSKZv9glRorCcRediTO/4BI5xGH6TPE0AKW
         8+DrwXD3ehC70lXaoE/ZEQjaLAr5O2uNr/mGDsODgTCMlPq8F8/FPhCsfD55mWk1rN8l
         tu5MTri4nyCrtzs38WqYdOFjVtL86nVQOEnGq/mW16AeBN4WoFkCirV9ne0mCUH77sKM
         z58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769185835; x=1769790635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vOkRLjnifceecHRFjfFtA9Hu0YVFrmdtZP58mWOpjc8=;
        b=rkwpo49uRxEPI9dMJU92BOYSXsHav89I9buHtfrQPWivOmk7/gZ2syDuUKkfsnPPa5
         hgJmhQO8078uXfBvSdoIHdMLqqc4d93VdGnUjhuqGRLpcR6Rik2+2yx4KIcIBOPQFLO/
         cGFvUFT51ucgWcqJ4LebD3ip+NcnL66KP3tmyHamW+ATdNvhDVYlfgWDCyyy8F7Viznz
         x21BMZtwcUVZQSS98+7bcU0bWsDtVGufV/ybbJFd4UC2SfCpVxbDF9QJB2B7vuK7nGwH
         6982X3H65EqSqfQFEEM1bhnuMW5+qZk4/hCIIc3jt5I0Gn7WRkYgu6CO0KryFptiKSsf
         nSCg==
X-Forwarded-Encrypted: i=1; AJvYcCVQygABH4tcJSGzuG5/GTV05vOW5rE+r49Q4IN3eZPsGUuE2NC8GXiQs/IaN9kh3CP531FRiSIZ5dDEdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAhbE4GR4fLdf/i5n+gVHuZ7uYV/ukbs8dzhoW96GpbgVhoqw4
	pLk3Gq/5kAKn7fxe/FjpYC4NBWREUGLnuKHc3QlC6k5z21kLkInsM5nSSJ36tfgILOHM117nfZS
	AyETHhcDgDc8/llL/2SIXWQ9kWDM2dF3BIEAt7yiq
X-Gm-Gg: AZuq6aKFoTQ1XweywitFzq7kAWm4xNpwTxgDKhDx4mm5roWnu4g2oeUooGqZiPowhsj
	DMT1TzIXQFE+FEKp5FIuEJ81z7TmeHSjJg2Woe30ftaiUcjhQylPl/zSBpKkE7rVna/bZM9cm0k
	lyXij1neMr+1pOrAJL/UuHgyj4QGM1QsCRKhLiBDrCmvz0XlDxHIlopQoau2Dztfl96QC8dWfIl
	GDyjj1KMlVzJnd5s1pfhfay+5haEItkryEj44mz4Lxj0N3zyd7adkdrmciWQDxiHQAPdu/Bvy3o
	JjYfKLvcnf5uxapo2rGK7idlcw==
X-Received: by 2002:a17:902:cf01:b0:2a1:3cda:8e99 with SMTP id
 d9443c01a7336-2a805d45517mr2449745ad.21.1769185834577; Fri, 23 Jan 2026
 08:30:34 -0800 (PST)
MIME-Version: 1.0
References: <20260122213516.671089-1-irogers@google.com> <1310a240-077a-49f6-b83a-a8a4fd52127b@linaro.org>
In-Reply-To: <1310a240-077a-49f6-b83a-a8a4fd52127b@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 23 Jan 2026 08:30:22 -0800
X-Gm-Features: AZwV_QjNay75wDxp2FcK9a1wDgjF2FHge-tLUo_wNfVirsr-f2GGtodRNG80OvI
Message-ID: <CAP-5=fWrJoej0XprvPmYg5qa7SRU2s3yeCF-hWgj+3MTdTZLzQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] perf annotate arch clean up
To: James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Zecheng Li <zecheng@google.com>, 
	Tianyou Li <tianyou.li@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Suchit Karunakaran <suchitkarunakaran@gmail.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Howard Chu <howardchu95@gmail.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_083036_781023_3D711768 
X-CRM114-Status: GOOD (  30.25  )
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

T24gRnJpLCBKYW4gMjMsIDIwMjYgYXQgMzowMuKAr0FNIEphbWVzIENsYXJrIDxqYW1lcy5jbGFy
a0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+Cj4KPiBPbiAyMi8wMS8yMDI2IDk6MzUgcG0sIElhbiBS
b2dlcnMgd3JvdGU6Cj4gPiAzIGluaXRpYWwgbWVtb3J5IGxlYWsgZml4IHBhdGNoZXMgZm9yIHBl
cmYgYW5ub3RhdGUuCj4gPgo+ID4gTW92ZSB0aGUgZGlzYXNtLmMgI2luY2x1ZGVkIGFyY2ggZmls
ZXMgaW50byBhIG5ldyB1dGlsL2Fubm90YXRlLWFyY2gKPiA+IGRpcmVjdG9yeS4gTWFrZSB0aGUg
Y29kZSBjb21waWxlIHN0YW5kYWxvbmUuIFRyeSB0byBiZXR0ZXIgZW5jYXBzdWxhdGUKPiA+IGFy
Y2hpdGVjdHVyZSBzcGVjaWZpYyBjb2RlIHdpdGhpbiB0aGUgZmlsZXMgYW5kIHdpdGggYQo+ID4g
YXJjaF9fbmV3XzxhcmNoPiBmdW5jdGlvbiB0aGF0IGFsbG93cyBhZGRpdGlvbmFsIGRhdGEgdG8g
YmUgYXNzb2NpYXRlZAo+ID4gd2l0aCB0aGUgc3RydWN0IGFyY2ggdXNpbmcgdGhlIHN0YW5kYXJk
IGNvbnRhaW5lcl9vZiB0cmljay4KPiA+Cj4gPiBNYWtlIHRoZSBsb29rdXAgb2Ygc3RydWN0IGFy
Y2ggdXNlIHRoZSBFTEYgbWFjaGluZSBnYXRoZXIgZnJvbSBhCj4gPiB0aHJlYWQgcmF0aGVyIHRo
YW4gYW4gZXZzZWwuIEZvciBleGFtcGxlLCB0aGUgZXZzZWwgY2FuJ3QgZGV0ZXJtaW5lCj4gPiB0
aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIEVNXzM4NiBhbmQgRU1fWDg2XzY0IHNvIGdlbmVyYWxseSB0
aGUgbGF0dGVyCj4gPiBoYXMgY3VycmVudGx5IGJlZW4gdXNlZC4gVGhpcyBtZWFucyB0aGUgZHdh
cmYgcmVnaXN0ZXJzIGFyZSBvZmYgYXMKPiA+IHJlZ2lzdGVyIDEgaXMgQ1ggd2l0aCBFTV8zODYg
YW5kIERYIHdpdGggRU1fWDg2XzY0LiBUbyBmYWNpbGl0YXRlIHRoaXMKPiA+IGNoYW5nZSBtYXBf
c3ltYm9sIGlzIHJlZmFjdG9yZWQgdG8gdXNlIGEgc3RydWN0IHRocmVhZCByYXRoZXIgdGhhbiBh
Cj4gPiBzdHJ1Y3QgbWFwcywgdGhlIG1hcHMgYmVpbmcgb2J0YWluYWJsZSBmcm9tIHRoZSB0aHJl
YWQuCj4gPgo+ID4gVG8gbWFrZSBpbiBhbmQgb3V0IGFyZ3VtZW50cyBjbGVhcmVyLCBmb3Igc2Fm
ZXR5LCBldGMuIHRyeSB0byBjb25zdGlmeQo+ID4gc3RydWN0IGFyY2ggYW5kIGl0cyByZWxhdGVk
IHN0cnVjdHMuCj4gPgo+ID4gdjM6IEZpeCBhcmNoIGluaXRpYWxpemF0aW9uIG9uIGFybSwgYXJt
NjQsIHBvd2VycGMgYW5kIHNwYXJjIGFzIHNwb3R0ZWQgYnkgU3VjaGl0Cj4gPiAgICAgIEthcnVu
YWthcmFudy4KPiA+Cj4gPiB2MjogQWRkIGEgcGF0Y2ggdG8gZml4IGEgZG9tYWluIGluZm8gbWVt
b3J5IGxlYWsgdGhhdCB3YXMgYmxvY2tpbmcKPiA+ICAgICAgbGVhayBzYW5pdGl6ZXIgYW5hbHlz
aXMuIEZpeCBtb3JlIG1hcF9zeW1ib2wgbGVha3Mgb3IgdXNlcyBhZnRlcgo+ID4gICAgICByZWZl
cmVuY2UgY291bnQgcHV0IChTdWNoaXQgS2FydW5ha2FyYW53Cj4gPiAgICAgIDxzdWNoaXRrYXJ1
bmFrYXJhbkBnbWFpbC5jb20+KS4gIFRyeSB0byByZXBybyBhbm5vdGF0ZSB0ZXN0IGNyYXNoCj4g
PiAgICAgIChKYW1lcyBDbGFyaykgYnV0IHN1c3BlY3QgaXQgd2FzIGFkZHJlc3NlZCBpbiB0aGUg
b3RoZXIgcmVmZXJlbmNlCj4gPiAgICAgIGNvdW50IGZpeGVzLgo+ID4gICAgICBodHRwczovL2xv
cmUua2VybmVsLm9yZy9sa21sLzIwMjYwMTIyMTY1NDA3LjU2MTg4OC0xLWlyb2dlcnNAZ29vZ2xl
LmNvbS8KPiA+Cj4gPiB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI2MDEyMjA3
MzEyNy4zNzUxMzktMS1pcm9nZXJzQGdvb2dsZS5jb20vCj4gPgo+ID4gSWFuIFJvZ2VycyAoMTIp
Ogo+ID4gICAgcGVyZiBoZWFkZXI6IEZpeCBtZW1vcnkgbGVha3MgaW4gcHJvY2Vzc19jcHVfZG9t
YWluX2luZm8KPiA+ICAgIHBlcmYgYW5ub3RhdGU6IEZpeCBhcmdzIGxlYWsgb2YgbWFwX3N5bWJv
bAo+ID4gICAgcGVyZiBtYXBzOiBGaXggcmVmZXJlbmNlIGNvdW50IGxlYWsgaW4gbWFwc19fZmlu
ZF9hbXMKPiA+ICAgIHBlcmYgZGlzYXNtOiBDb25zdGlmeSB1c2Ugb2Ygc3RydWN0IGFyY2gKPiA+
ICAgIHBlcmYgZGlzYXNtOiBDb25zdGlmeSB1c2Ugb2Ygc3RydWN0IGluc19vcAo+ID4gICAgcGVy
ZiBkaXNhc206IENvbnN0aWZ5IHVzZSBvZiBzdHJ1Y3QgaW5zCj4gPiAgICBwZXJmIGRpc2FzbTog
UmV3b3JrIHRoZSBzdHJpbmcgYXJjaF9faXMgdG8gdXNlIHRoZSBFTEYgbWFjaGluZQo+ID4gICAg
cGVyZiBkaXNhc206IERvbid0IGluY2x1ZGUgQyBmaWxlcyBmcm9tIHRoZSBhcmNoIGRpcmVjdG9y
eQo+ID4gICAgcGVyZiBkaXNhc206IFJlZmFjdG9yIGluc19faXNfY2FsbC9qdW1wIHRvIGF2b2lk
IGV4cG9zaW5nIGFyY2ggaW5zX29wcwo+ID4gICAgcGVyZiBtYXBfc3ltYm9sOiBTd2l0Y2ggZnJv
bSBob2xkaW5nIG1hcHMgdG8gaG9sZGluZyB0aHJlYWQKPiA+ICAgIHBlcmYgZGlzYXNtOiBSZWZh
Y3RvciBhcmNoX19maW5kIGFuZCBpbml0aWFsaXphdGlvbiBvZiBhcmNoIHN0cnVjdHMKPiA+ICAg
IHBlcmYgZGlzYXNtOiBNaW5vciBsYXlvdXQgdHdlYWtzIGZvciBzdHJ1Y3QgYXJjaAo+ID4KPiA+
ICAgdG9vbHMvcGVyZi9hcmNoL2FyYy9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYyAgIHwgIDExIC0K
PiA+ICAgLi4uL3BlcmYvYXJjaC9yaXNjdjY0L2Fubm90YXRlL2luc3RydWN0aW9ucy5jIHwgIDM2
IC0tCj4gPiAgIHRvb2xzL3BlcmYvdWkvYnJvd3NlcnMvYW5ub3RhdGUuYyAgICAgICAgICAgICB8
ICAgNiArLQo+ID4gICB0b29scy9wZXJmL3VpL2Jyb3dzZXJzL2hpc3RzLmMgICAgICAgICAgICAg
ICAgfCAgIDMgKy0KPiA+ICAgdG9vbHMvcGVyZi91dGlsL0J1aWxkICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAxICsKPiA+ICAgdG9vbHMvcGVyZi91dGlsL2FkZHJfbG9jYXRpb24uYyAgICAg
ICAgICAgICAgIHwgICA0IC0KPiA+ICAgdG9vbHMvcGVyZi91dGlsL2FkZHJfbG9jYXRpb24uaCAg
ICAgICAgICAgICAgIHwgICAxIC0KPiA+ICAgdG9vbHMvcGVyZi91dGlsL2Fubm90YXRlLWFyY2gv
QnVpbGQgICAgICAgICAgIHwgIDExICsKPiA+ICAgdG9vbHMvcGVyZi91dGlsL2Fubm90YXRlLWFy
Y2gvYW5ub3RhdGUtYXJjLmMgIHwgIDE4ICsKPiA+ICAgLi4uL2Fubm90YXRlLWFyY2gvYW5ub3Rh
dGUtYXJtLmN9ICAgICAgICAgICAgIHwgIDUwICstCj4gPiAgIC4uLi9hbm5vdGF0ZS1hcmNoL2Fu
bm90YXRlLWFybTY0LmN9ICAgICAgICAgICB8ICA1OSArLS0KPiA+ICAgLi4uL2Fubm90YXRlLWFy
Y2gvYW5ub3RhdGUtY3NreS5jfSAgICAgICAgICAgIHwgIDI5ICstCj4gPiAgIC4uLi9hbm5vdGF0
ZS1hcmNoL2Fubm90YXRlLWxvb25nYXJjaC5jfSAgICAgICB8ICA3MSArLS0KPiA+ICAgLi4uL2Fu
bm90YXRlLWFyY2gvYW5ub3RhdGUtbWlwcy5jfSAgICAgICAgICAgIHwgIDI5ICstCj4gPiAgIC4u
Li9hbm5vdGF0ZS1hcmNoL2Fubm90YXRlLXBvd2VycGMuY30gICAgICAgICB8IDEyNyArKysrKy0K
PiA+ICAgLi4uL3V0aWwvYW5ub3RhdGUtYXJjaC9hbm5vdGF0ZS1yaXNjdjY0LmMgICAgIHwgIDQx
ICsrCj4gPiAgIC4uLi9hbm5vdGF0ZS1hcmNoL2Fubm90YXRlLXMzOTAuY30gICAgICAgICAgICB8
ICA3MCArLS0KPiA+ICAgLi4uL2Fubm90YXRlLWFyY2gvYW5ub3RhdGUtc3BhcmMuY30gICAgICAg
ICAgIHwgIDI4ICstCj4gPiAgIC4uLi9hbm5vdGF0ZS1hcmNoL2Fubm90YXRlLXg4Ni5jfSAgICAg
ICAgICAgICB8ICA4OSArKy0tCj4gPiAgIHRvb2xzL3BlcmYvdXRpbC9hbm5vdGF0ZS1kYXRhLmMg
ICAgICAgICAgICAgICB8ICAxMiArLQo+ID4gICB0b29scy9wZXJmL3V0aWwvYW5ub3RhdGUtZGF0
YS5oICAgICAgICAgICAgICAgfCAgIDIgKy0KPiA+ICAgdG9vbHMvcGVyZi91dGlsL2Fubm90YXRl
LmMgICAgICAgICAgICAgICAgICAgIHwgIDg4ICsrLS0KPiA+ICAgdG9vbHMvcGVyZi91dGlsL2Fu
bm90YXRlLmggICAgICAgICAgICAgICAgICAgIHwgIDEwICstCj4gPiAgIHRvb2xzL3BlcmYvdXRp
bC9jYWxsY2hhaW4uYyAgICAgICAgICAgICAgICAgICB8ICAxMiArLQo+ID4gICB0b29scy9wZXJm
L3V0aWwvY2Fwc3RvbmUuYyAgICAgICAgICAgICAgICAgICAgfCAgMTggKy0KPiA+ICAgdG9vbHMv
cGVyZi91dGlsL2RiLWV4cG9ydC5jICAgICAgICAgICAgICAgICAgIHwgICAxIC0KPiA+ICAgdG9v
bHMvcGVyZi91dGlsL2Rpc2FzbS5jICAgICAgICAgICAgICAgICAgICAgIHwgNDI4ICsrKysrKyst
LS0tLS0tLS0tLQo+ID4gICB0b29scy9wZXJmL3V0aWwvZGlzYXNtLmggICAgICAgICAgICAgICAg
ICAgICAgfCAgOTUgKystLQo+ID4gICB0b29scy9wZXJmL3V0aWwvZXZlbnQuYyAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDIgLQo+ID4gICB0b29scy9wZXJmL3V0aWwvaGVhZGVyLmMgICAgICAg
ICAgICAgICAgICAgICAgfCAgMTcgKy0KPiA+ICAgdG9vbHMvcGVyZi91dGlsL2hpc3QuYyAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDE4ICstCj4gPiAgIHRvb2xzL3BlcmYvdXRpbC9sbHZtLmMg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCArLQo+ID4gICB0b29scy9wZXJmL3V0aWwvbWFj
aGluZS5jICAgICAgICAgICAgICAgICAgICAgfCAgMTMgKy0KPiA+ICAgdG9vbHMvcGVyZi91dGls
L21hcF9zeW1ib2wuYyAgICAgICAgICAgICAgICAgIHwgICA1ICstCj4gPiAgIHRvb2xzL3BlcmYv
dXRpbC9tYXBfc3ltYm9sLmggICAgICAgICAgICAgICAgICB8ICAgMyArLQo+ID4gICB0b29scy9w
ZXJmL3V0aWwvbWFwcy5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ID4gICB0b29s
cy9wZXJmL3V0aWwvc29ydC5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiA+ICAg
dG9vbHMvcGVyZi91dGlsL3Vud2luZC1saWJkdy5jICAgICAgICAgICAgICAgIHwgICAyICstCj4g
PiAgIHRvb2xzL3BlcmYvdXRpbC91bndpbmQtbGlidW53aW5kLWxvY2FsLmMgICAgICB8ICAgMiAr
LQo+ID4gICAzOSBmaWxlcyBjaGFuZ2VkLCA3NzUgaW5zZXJ0aW9ucygrKSwgNjQ4IGRlbGV0aW9u
cygtKQo+ID4gICBkZWxldGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9hcmNoL2FyYy9hbm5vdGF0
ZS9pbnN0cnVjdGlvbnMuYwo+ID4gICBkZWxldGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9hcmNo
L3Jpc2N2NjQvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMKPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHRvb2xzL3BlcmYvdXRpbC9hbm5vdGF0ZS1hcmNoL0J1aWxkCj4gPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCB0b29scy9wZXJmL3V0aWwvYW5ub3RhdGUtYXJjaC9hbm5vdGF0ZS1hcmMuYwo+ID4gICBy
ZW5hbWUgdG9vbHMvcGVyZi97YXJjaC9hcm0vYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMgPT4gdXRp
bC9hbm5vdGF0ZS1hcmNoL2Fubm90YXRlLWFybS5jfSAoNTklKQo+ID4gICByZW5hbWUgdG9vbHMv
cGVyZi97YXJjaC9hcm02NC9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYyA9PiB1dGlsL2Fubm90YXRl
LWFyY2gvYW5ub3RhdGUtYXJtNjQuY30gKDcwJSkKPiA+ICAgcmVuYW1lIHRvb2xzL3BlcmYve2Fy
Y2gvY3NreS9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYyA9PiB1dGlsL2Fubm90YXRlLWFyY2gvYW5u
b3RhdGUtY3NreS5jfSAoNjclKQo+ID4gICByZW5hbWUgdG9vbHMvcGVyZi97YXJjaC9sb29uZ2Fy
Y2gvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMgPT4gdXRpbC9hbm5vdGF0ZS1hcmNoL2Fubm90YXRl
LWxvb25nYXJjaC5jfSAoNjAlKQo+ID4gICByZW5hbWUgdG9vbHMvcGVyZi97YXJjaC9taXBzL2Fu
bm90YXRlL2luc3RydWN0aW9ucy5jID0+IHV0aWwvYW5ub3RhdGUtYXJjaC9hbm5vdGF0ZS1taXBz
LmN9ICg1OSUpCj4gPiAgIHJlbmFtZSB0b29scy9wZXJmL3thcmNoL3Bvd2VycGMvYW5ub3RhdGUv
aW5zdHJ1Y3Rpb25zLmMgPT4gdXRpbC9hbm5vdGF0ZS1hcmNoL2Fubm90YXRlLXBvd2VycGMuY30g
KDczJSkKPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvdXRpbC9hbm5vdGF0ZS1h
cmNoL2Fubm90YXRlLXJpc2N2NjQuYwo+ID4gICByZW5hbWUgdG9vbHMvcGVyZi97YXJjaC9zMzkw
L2Fubm90YXRlL2luc3RydWN0aW9ucy5jID0+IHV0aWwvYW5ub3RhdGUtYXJjaC9hbm5vdGF0ZS1z
MzkwLmN9ICg2NiUpCj4gPiAgIHJlbmFtZSB0b29scy9wZXJmL3thcmNoL3NwYXJjL2Fubm90YXRl
L2luc3RydWN0aW9ucy5jID0+IHV0aWwvYW5ub3RhdGUtYXJjaC9hbm5vdGF0ZS1zcGFyYy5jfSAo
ODUlKQo+ID4gICByZW5hbWUgdG9vbHMvcGVyZi97YXJjaC94ODYvYW5ub3RhdGUvaW5zdHJ1Y3Rp
b25zLmMgPT4gdXRpbC9hbm5vdGF0ZS1hcmNoL2Fubm90YXRlLXg4Ni5jfSAoOTMlKQo+ID4KPgo+
IFJldmlld2VkLWJ5OiBKYW1lcyBDbGFyayA8amFtZXMuY2xhcmtAbGluYXJvLm9yZz4KClRoYW5r
cyBKYW1lcyEKCkFybmFsZG8sIGl0J2QgYmUgbmljZSBmb3IgdGhpcyB0byBsYW5kIHNvIEkgY2Fu
IGxvb2sgaW50byBhZGRyZXNzaW5nCnRoZSBtaXNzaW5nIGVfZmxhZ3MgaXNzdWUgLSBuYW1lbHks
IHdlIHNob3VsZCBvcHRpb25hbGx5IHJlYWQgdGhlCmVfZmxhZ3MgYWxvbmcgd2l0aCB0aGUgZV9t
YWNoaW5lIHNvIHRoYXQgd2UgaGF2ZSBhIHByb3BlciBlX2ZsYWdzCnZhbHVlIHRvIG1ha2UgY3Nr
eSB3b3JrIHByb3Blcmx5IChub3QgYW4gaXNzdWUgb24gYW55dGhpbmcgZWxzZSkuIEF0CnRoZSBz
YW1lIHRpbWUgSSB0aGluayBzb21lIG9mIHRoZSBlX21hY2hpbmUgc2hvdWxkIGJlIG1hZGUgbW9y
ZSByb2J1c3QKbGlrZSB3aXRoOgpodHRwczovL3dlYi5naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvcGVyZi9wZXJmLXRvb2xzLW5leHQuZ2l0L2NvbW1pdC90b29scy9wZXJm
P2g9cGVyZi10b29scy1uZXh0JmlkPWU5OWQ1NDRjN2YzNjkxZWIzMjFjODhmZGJhZGYwNGI3Nzdj
MTE0YzQKYnV0IGhlcmU6Cmh0dHBzOi8vd2ViLmdpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9wZXJmL3BlcmYtdG9vbHMtbmV4dC5naXQvdHJlZS90b29scy9wZXJmL3V0aWwv
dGhyZWFkLmM/aD1wZXJmLXRvb2xzLW5leHQjbjQ1Mgp0aGUgY29kZSBzaG91bGQgcHJvYmFibHkg
YmUgc2hhcmVkLgpBbnl3YXksIHRoaXMgc2VyaWVzIGRvZXMgZW5vdWdoIHdpdGhvdXQgYWRkaW5n
IGFsbCB0aGF0IHRvIGl0IGFuZAp3YWl0aW5nIGZvciBtb3JlIHRhZ3MuCgpUaGFua3MsCklhbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
