Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655A0D1950D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 17:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5Ga1Tmz+IN+f6ju5v5Irj+6nMq/n8/QOVSuxpK/FNo=; b=ZzMeJtzYab6toQ
	IN6yF4Ak2ttDd3P4eadctJN22qhAzpagfPftt9Z9SOIq9jzRKDqoAkV5YvJCHdCBib9h1g3SuWV+8
	JcY2V5CKOBtEhcZgDg1QWwLDwFMOjzEXeuTBZS2y00p8N3doED9bVRYebpCr7RbvSPzf1mRFCnHU/
	cXjQdcQI91yCM+DTUhVNVpTLz8KjXFKf55vxkzIprrswwhePDEFkt2FPKO7F1zAHF0gNukuVKPSsc
	ipQZtoGmJXSLvWnVl0HuCoLBcuXhAT5uTk0jFm8LzRd4l71YsT3Ua5dwtO7sLLcNGHhjItcXx+AlU
	exzZLnpaqy8b3etv/CBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQGe-0000000CxUk-21fA;
	Mon, 26 Jan 2026 17:20:48 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQGc-0000000CxTp-0VXT
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 17:20:47 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a35ae38bdfso162495ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jan 2026 09:20:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769448045; cv=none;
        d=google.com; s=arc-20240605;
        b=Zcqt/h8QRbiwQ1w5A0xIfRmLQXU5RbrihH4HObt2NPXDRucw1L4+8zJXsU5kZ8DAFn
         /JRwbMeeJ8j/oY6RSTbuRB/sG/ROtqp57Mfsoy/PEwhqQqSI5PgP3aUztXkVfhAQTgbZ
         kJLPLeDLkA3Kbo5cPHSdDAoHSCvgQf0WaVQwo9WxpPDCPWA0VbEBdieJ6lVSf1i0kdNf
         D00A+aoRr+7rDqVUZkTur3J0J1RaOLdYsTm1Jaqx6fX5dmMFJMkOnO5rC9Z3g/E6CAnX
         pmFjz+X7WR313Ecyp30b6eULBjknyOGVijA2gtMGYBOANkLiB0fJKl3tw6bp3KfQr6ld
         TVmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YTrAJV93417SJ1k64zXhl0ztZbQ5SmW8B1gkjSgEdrQ=;
        fh=B6e6pngSrshI2/dJT/lrEgkcF7KVcEz/axJ/xj8tG54=;
        b=VzRv3uUuqEpDz7/bdUljOWcoBLIPwTo2Qc1nddLkHCaNCrlLD5Pd86hdOrXQcGr+ml
         bTviq28bibhie3szUPuFums0YDnY8lizbXJ05z3kSrsMxNNpIjB2K+JM32EIXC2A0V9Y
         Bz3M6u2LjS/5rB2SoRsi+hvCdq26mMwbK6TMzCYPt3eGMqiAeGv+Mgnecal2k/Dgw7qn
         G+77B0X9i5Ysl2dej/naoXLVD2QNBxYSodx3XBgJJcojgUE8HTuqW5q9fpozJ5zs1FCy
         rY2F+ts+gVa5ZdREaZ2fiKfDHfA1V71PFSVAGtN6IPuNpXNcDHxYKP5Hudn3I+e2PpNN
         Hf2Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769448045; x=1770052845; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTrAJV93417SJ1k64zXhl0ztZbQ5SmW8B1gkjSgEdrQ=;
        b=lJJ8VW72v+Wv9AspZ7941t/616JD3nS/mNIvtWOo8w9tbZFD9JdaiytsPhehGJiIVz
         yQFyjhspUpP4DoNmoZbuEBNqwFp6GOReq8JvV3uI8Nor2eKyfkljFOIA8SclrpX4oseO
         5umsrJ+8S7JFuraNkSoDHELE9cPiss4NaByiw0VieN+P2d8PA1u2JWst1yCCxAVKpqIg
         ZoQvQnEP8ibIIC8ohwMtRPVO3kZai/8DUSVcoX/5ifISeNKsJ7RW3Y6gGXcVzI5mcqrU
         sX5skVYvIHvxYtgnfLKN2T90Jcyuprmky2+kSf28b4yA3B9Af2LEFuzoIB9kLfvowFfn
         prCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769448045; x=1770052845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YTrAJV93417SJ1k64zXhl0ztZbQ5SmW8B1gkjSgEdrQ=;
        b=B9jS5DtA06fx2VA9UA77Se7i/A71tAtmwp8cTqyrWmeRZ5XaxQs5IHuSsrKDANOwNO
         t9EB+x96SXifeF4282raSGftqWYeDk0/UDWOr/9/iWWi4PI5gZhJFli0RTDTgZIY+Aq+
         UKOEiaPKuM6U85wr4DCjodIzVLpq1fECU8RrCzzMfjHcHMMC1v6qoxmBywzQJwG5n+CE
         HGbJ1Rlj3cBPUqfnE2gBsuQj5yTvgYW9swcjyDk+0opxFk00oJeF+HugDRFHBzvdGbfe
         H2AQwoLV6O4eH3XVhH9/K0jDkyn34rhHVDAofEiX0PfsnQBDbRm7H8VIeExqq+qQ9YbB
         eC2A==
X-Forwarded-Encrypted: i=1; AJvYcCXgSRQl/vj/ZKMTEvLrNdCkBApssAWRjXUfCbLN41OSx6yr7yU8FbG/9kx+C6HnAaCuzWLWzKSBNzL04w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiGThuX4IGrcyTy1DSd8PNG0uoiX66+4MtZxc9MAdrHf/zOVg6
	Ej8Xi3C1/QdE1cxiX/55A0DIe8aeMnY2zBbiTx4x7/T5h/gL5fkXXNCjxafoCBioR+vbQ/FwN6b
	YCCY6ilGuhOcdC3Hrp2ayODaeyM+dDp84fe76foeC
X-Gm-Gg: AZuq6aLpyFsHrDgEVwrvC78HrtrzGhx05cGDz8J2bMDmH1IFFThyouAP4faQl6uggTy
	PRHwjvLc+oW7t7qHmiN3p/4uo5VZmC0cDNgDJve1zHCCV/EXOde48GhBDGO/FANJEAEcyuLm8bI
	YhZRTH97YIyI3a8HlyQQbO+2rhPdyR0lkYAbHO2tLQoFJcr/MzAsd4pc75A4GfBo+izyeaORnnb
	QQpvmzJtxVWS8LEgPCc0BCOAJ+qlllAUEieCDOjh8DPOAhIUSkoRHyS3JwhuyiMHtbx6H+1v7fU
	RtZO8c7a9A6qS7nSNHfUVyQ+58Q2gB1ey8vy
X-Received: by 2002:a17:902:ef09:b0:2a0:89b0:71d7 with SMTP id
 d9443c01a7336-2a844e77f45mr2224565ad.13.1769448044951; Mon, 26 Jan 2026
 09:20:44 -0800 (PST)
MIME-Version: 1.0
References: <20260126071822.447368-1-irogers@google.com> <363a4dd6-25c1-4bb4-8b53-64e00baa1a9a@linux.intel.com>
In-Reply-To: <363a4dd6-25c1-4bb4-8b53-64e00baa1a9a@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 26 Jan 2026 09:20:33 -0800
X-Gm-Features: AZwV_QiYFZrSRICCEHDlo9iaERVIgmWlIz5vZDkYKD-ocOUvTWQSdsXVMYftoaQ
Message-ID: <CAP-5=fV30XHi78SBHc=mJUK-7t9uiJb_YPHWZSG2g0Rm745pbw@mail.gmail.com>
Subject: Re: [RFC PATCH v1] perf sample: Add evsel to sample and avoid passing
 as a pair
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Quan Zhou <zhouquan@iscas.ac.cn>, Anup Patel <anup@brainfault.org>, 
	Tianyou Li <tianyou.li@intel.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Derek Foreman <derek.foreman@collabora.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Howard Chu <howardchu95@gmail.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, tanze <tanze@kylinos.cn>, 
	Hrishikesh Suresh <hrishikesh123s@gmail.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	Chun-Tse Shao <ctshao@google.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	Blake Jones <blakejones@google.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_092046_165124_1BDCAFAD 
X-CRM114-Status: GOOD (  19.84  )
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

T24gTW9uLCBKYW4gMjYsIDIwMjYgYXQgMTowNOKAr0FNIE1pLCBEYXBlbmcgPGRhcGVuZzEubWlA
bGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+Cj4gT24gMS8yNi8yMDI2IDM6MTggUE0sIElhbiBS
b2dlcnMgd3JvdGU6Cj4gPiBUaGUgcGVyZl9zYW1wbGUgYW5kIGV2c2VsIGFyZSB0eXBpY2FsbHkg
cGFzc2VkIGFzIGEgcGFpci4gVGhpcyBjcmVhdGVzCj4gPiAyIGFyZ3VtZW50cyBmb3IgdGhlIHBy
aWNlIG9mIDEuIEl0IGlzIGFsc28gaW5jb252ZW5pZW50IGlmIHlvdSB3aXNoIHRvCj4gPiByZXdy
aXRlIGEgc2FtcGxlLCBhcyB0aGUgZXZzZWwgd2lsbCBuZWVkIHVwZGF0aW5nIGluIGFsbCBjYXNl
cywKPiA+IHNvbWV0aGluZyBzaW1pbGFyIHRvIHRoaXMgY3VycmVudGx5IGhhcHBlbnMgZm9yIG9m
Zi1jcHUgb3V0cHV0LiBBdm9pZAo+ID4gcGFzc2luZyB0aGUgZXZzZWwgYnkgYWRkaW5nIGl0IGlu
dG8gdGhlIHNhbXBsZS4gU28gdGhhdCB0d28gZXZzZWxzCj4gPiBhcmVuJ3QgYmVpbmcgcGFzc2Vk
IGFyb3VuZCwgZml4IHVwIGZ1bmN0aW9ucyB0YWtpbmcgYSBzYW1wbGUgYW5kIGFuCj4gPiBldnNl
bCBhcmd1bWVudCB0byBvbmx5IHRha2UgYSBzYW1wbGUsIHRoZSBldnNlbCBub3cgYmVpbmcgYWJs
ZSB0byBiZQo+ID4gcmVhZCBmcm9tIHRoZSBzYW1wbGUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
SWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgo+ID4gLS0tCj4gPiBUaGlzIGlzIGEgZmFp
cmx5IGxhcmdlIGFuZCBpbnZhc2l2ZSBjaGFuZ2UgYnV0IGRvaW5nIHNvbWV0aGluZyBzb21lCj4g
PiB3aGF0IG11bmRhbmUuIFNlbmRpbmcgb3V0IGFzIGFuIFJGQyBmb3IgZWFybHkgZmVlZGJhY2su
Cj4KPiBOaWNlIGNsZWFudXAuIEJldHRlciBzcGxpdCB0aGlzIGh1Z2UgcGF0Y2ggaW50byBzZXZl
cmFsIHBhdGNoZXMgaW4gdGhlCj4gZm9ybWFsIHBhdGNoLXNldC4gVGhhbmtzLgoKSGF2aW5nIHNl
dmVyYWwgcGF0Y2hlcyBtZWFucyBoYXZpbmcgaW50ZXJtZWRpYXRlIHN0YXRlcyB3aGVyZSB0aGVy
ZQphcmUgMiBldnNlbHMgKGEgcGFyYW1ldGVyIGFuZCBvbmUgaW4gdGhlIHNhbXBsZSkuIEdldHRp
bmcgdGhpbmdzCmJ1aWxkaW5nIHdpdGggbG90cyBvZiBpbnRlcm1lZGlhdGUgc3RhdGVzIGlzIG9u
ZSB0aGluZywgaGF2aW5nIHRoaW5ncwp3b3JrIGFuZCBub3QgYnJlYWsgdGVzdHMgaXMgYW5vdGhl
ci4gSSdsbCBzZWUgd2hhdCBjYW4gYmUgZG9uZSwgYnV0IGl0CndhcyBzb21ld2hhdCBkZWxpYmVy
YXRlIG5vdCB0byBoYXZlIGludGVybWVkaWF0ZSBicm9rZW4gc3RhdGVzIHdpdGgKdGhlIGFsYmVp
dCBsYXJnZSBwYXRjaC4KClRoYW5rcywKSWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
