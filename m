Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16217606A331
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4rt/umE2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DAMbtQMO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=etCvgY5eY6/AiPYJWOTP4R+AT8HEWnq9nSx/6E6N+lI=; b=4rt/umE2hkDqFZ4E3Q6qcnxaez
	cXNUWRBgii1F8pSYmC4Hyh/6m/jFiKIrfDjOuC3gcRdf5nlZVFwgX5HoD1bRW7nuMY46/arQ6bSdK
	5/PjZk+U26Xnz4tf3gLzDA5ZlX2k7WUfvMJRJqK8lCb4ik2IFex/hE9MGVpJKG/JL0Yl1zE7N0cTt
	xexpipa8wuB2RMExXZ2Y2xF7yP4/sgHw12RbBbVnkVU7PZ9F9wnEAtimCmjjl1vV/azDZLZvYsIPL
	i1zAS26bROHtmVV8PS2fe4bDVacsLK6IgYrMQrURXlr7QZdT02xzPH33Q4MHCM/dQ+guV2UyzNW9j
	YQdQAcZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKxf-0000000ESqb-1hEQ;
	Fri, 20 Nov 2026 09:31:15 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKxc-0000000ESq4-3u43
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 09:31:14 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-847ac7ccd85so442906a34.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2026 01:31:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795167072; cv=none;
        d=google.com; s=arc-20260327;
        b=nWe/TNZK0nf4u0qPjiitsVUIqRglgLLDgz3mVp/vnUyRXzrRmGsN7X7AFIkaTSXYsD
         mlO2S01yp9BrK/vAOKSXiV6sCjws7WSVsb3xqeBxxi3MKz0kmlQUdp/TCtIc8NqGBMqa
         gn6ndGDh8JG83E5rUqrV+oPcC7eDWcGtQu2Y7y2yiCCc091vw4ds7rx+k/wdzeWJHZiY
         in4cacK1k5+bcnrRg9bvyelZy+gGym4OvdyEAOEFOQJnu3IvzrOcntjtjmP3LfYWVaRY
         ti7nd9gY4gjLs2ZsIKcH7+3QJrJuMhO8SZXyQKDbj89oyCwQhSUUk0HCYqZuBZhxUBwI
         amHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4i941FDPhpmYcUdo3BnCKwVlDsg7lnYxXVRnzu5LkiA=;
        fh=VHnyByfiJKw3PCNbkxaIxsFZLUGbUyLJ7heRF0zFj6A=;
        b=CEWcaZHAmYCqt+unKJBIlQI6mR4F/muQ3vlpjz6zxtRlA6uQaDWPqm5FSkAdAzkWWe
         /INe3UwCTHXWdeSviWF7E7S0G6KQOUBFTBpMN/0BMQIfUAFx7xgzpTkdYZ1VFZpRNdqW
         sFjsm9kfDva7OaEDXq/8qVeKP+8oCRHBaXayW+P0By/TWd2xMBXU6qSt3oWU+LCyIql2
         +qE/aMnjRnqIUrWnbmXXC+MMYeim5JPrJGEcPCmr6Ncmva1lDuD+uM6S6QBpUdWkDzg0
         OnM1k/CZGS93F1idc2DUQMUrj48V6npv+P9tItlQKdIliG7Ly8sZ6f57IB02C3FEKZd0
         +ehw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795167072; x=1795771872; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4i941FDPhpmYcUdo3BnCKwVlDsg7lnYxXVRnzu5LkiA=;
        b=DAMbtQMOcL8rYWGdxEJa3QovCJIl0OBTX5KggRTw3GOKCoZHSLpzWLFXYv4g5Gr16v
         IezDbyNBLDx+oqGDPWaPL538Z7l0LPPSb7rAzpRHkYRKGcAlMEyhkVELDU6ezOyRzkwT
         6ECkdYXyc5XLScAp1oqhdUf8HHuDt0gGkhcBeQfXJo3xgQvfkhK5DtSWeBHh+HflTU/4
         uIwyDCWtEZMQ2YKwkFC0Rcy+ifiyDQPNoUrQScARhIbdwFItA5LS2SCy6p2ug1e/R9tF
         jJC/FcI83ScbilPHr9FhhnF4MjQTa4rNirMqYbtADwui0KZTSEM5cp4oWZ6crHoWOWAb
         4HtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167072; x=1795771872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4i941FDPhpmYcUdo3BnCKwVlDsg7lnYxXVRnzu5LkiA=;
        b=b4bWXEkMVVswFPj/QORufnMkOra5gKuUhaWuIg+vp4+X2FJ9fZ7Os98OEGMDhAGINL
         tf1SLDJ8mpTDtXMOuTbV+mH/NWMrLvtsFMJBNuEe3goOEhRgdj9KZbKs0zzgsp7bnYr7
         h+rJpLegbItOWPiKoF+y96uwY1bLuXBhbX71kgbAAnsFBLFL1aeOproE5ZUnTOnVROs7
         aOOpKqe33HnZ/AAEM0MDecgUlbuXD3ao4kPNGGmfvRKCMhNia4nmLBCLz/JlyvQdyrxY
         BpI+CF3evc8Tf+bhqTA+V8XXac8/fS0gzEWofzGDrVCJS61Rq9eRRwdSlFvqJq06akuC
         ROxg==
X-Forwarded-Encrypted: i=1; AL+hErHW6Lb0Xz8n0mePONkwE+BpFtfGcXDyNaiX1ldBjco+sl9ipSGjZicFFZa+BKGQQhfZgjhB299oTdXuzQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/+JUoGoR/c7eZqa5R09MmXlIC/dvV6S/CDWcox4CpH+5/i7/Bh
	iRSL/ZzUYAI/DvFX45oQKX0AQ/ClZcFV0P58XyF5TB5f5CzFFKsH786KvBZSCpHILg4pvXaHvAl
	wFyLB09eIKfGGuXhMHKEqpLT611oWekTb/cRBEb1rcg==
X-Gm-Gg: AYBFou2xCSjfXTtFMEh9Z1mMKEq60boCxxsqLUUeVztddszIRMZ1bq85Jb72kVUHJPc
	oLIS7xo4aUhsTk15j69XbYkMtvOkcR2VmbprdxfqXvKeHOeDYZ0ysnypmNMhKpx8YwOl7O9HoVW
	ZxfjpSTBiw1jYQxQffiK7BRpbPvngIu9Hk/MlImXisHxj9Bdl60ZX/quMEftHLmmhS0oDZeVWH9
	psX9gdUv9rTzdt5zpGhxRi1kYR6D7rXQ7IUjBCx/UW8E7bRtWvBS0KK2jUdvt8PtchHRPbAoCvf
	dxv7oH5nTpdJMN0BF8zpNlP8hFNq4gW4vLAKIn/8FZPHBn2I1PsWU2sUag8NolKm+8gTX1CWb0n
	AlEb+A11eta6CXdghaCH7u9V+Ue18YIJtvjtQzCib+k4=
X-Received: by 2002:a05:6830:6814:b0:862:e9e6:6297 with SMTP id
 46e09a7af769-86315985934mr3086650a34.18.1795167071723; Fri, 20 Nov 2026
 01:31:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
 <20261114-dfustini-atl-sc-cbqri-dt-v12-1-6ef1f627072d@kernel.org>
 <20261119000846.776930b3@jic23-hlaptop> <CAEEQ3w=voZYrfcMuKC_SQG9U8hYN_thcc02nf_PgMu5UyuG32Q@mail.gmail.com>
 <av-WvzoxSv7QpMhQ@thelio>
In-Reply-To: <av-WvzoxSv7QpMhQ@thelio>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 20 Nov 2026 17:30:59 +0800
X-Gm-Features: AclHuK-k8TRNXUVZzhRA9w-uB92JwpYAjGJmp8KpAUe03HieCcNAOF5c9k-Hbw8
Message-ID: <CAEEQ3w=zXTYjAoWcBZB_CSVYKsbOSjGvp4JW63HET_BwLnW1Nw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v12 1/5] riscv_cbqri: Add capacity
 controller core
To: Drew Fustini <fustini@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Adrien Ricciardi <aricciardi@baylibre.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
	Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dave Martin <Dave.Martin@arm.com>, 
	Fenghua Yu <fenghuay@nvidia.com>, Gong Shuai <gong.shuai@sanechips.com.cn>, 
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn, 
	James Morse <james.morse@arm.com>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Peter Newman <peternewman@google.com>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Sunil V L <sunilvl@oss.qualcomm.com>, 
	Tony Luck <tony.luck@intel.com>, Weiwei Li <liwei1518@gmail.com>, 
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, 
	Zeng Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_013113_010586_36F2AC0C 
X-CRM114-Status: GOOD (  34.29  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRHJldywKCk9uIEZyaSwgTm92IDIwLCAyMDI2IGF0IDg6MznigK9BTSBEcmV3IEZ1c3Rpbmkg
PGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIE5vdiAxOSwgMjAyNiBhdCAw
NzowMDoyMVBNICswODAwLCB5dW5odWkgY3VpIHdyb3RlOgo+ID4gSGkgRHJldywKPiA+Cj4gPiBP
biBUaHUsIE5vdiAxOSwgMjAyNiBhdCA4OjA54oCvQU0gSm9uYXRoYW4gQ2FtZXJvbiA8amljMjNA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFNhdCwgMTQgTm92IDIwMjYgMTQ6MDY6
MjEgLTA4MDAKPiA+ID4gRHJldyBGdXN0aW5pIDxmdXN0aW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+
ID4gPgo+ID4gPiA+IEFkZCB0aGUgY29yZSBmb3IgUklTQy1WIENCUVJJIGNhcGFjaXR5IGNvbnRy
b2xsZXJzOiB0aGUgcmVnaXN0ZXIKPiA+ID4gPiBsYXlvdXQsIHRoZSBjYXBhYmlsaXR5IHByb2Jl
LCBhbmQgdGhlIGFsbG9jYXRpb24gb3BlcmF0aW9ucyB0aGF0Cj4gPiA+ID4gcHJvZ3JhbSBhIGNh
cGFjaXR5IGJsb2NrIG1hc2sgZm9yIGFuIFJDSUQgYW5kIHJlYWQgaXQgYmFjay4KPiA+ID4gPgo+
ID4gPiA+IEEgZGlzY292ZXJ5IGxheWVyIG1hcHMgdGhlIHJlZ2lzdGVyIGJsb2NrIGFuZCBkZXNj
cmliZXMgdGhlIGNvbnRyb2xsZXIKPiA+ID4gPiBpbiBhIGNicXJpX2NvbnRyb2xsZXJfaW5mbyBk
ZXNjcmlwdG9yLiByaXNjdl9jYnFyaV9yZWdpc3Rlcl9jYygpIHByb2Jlcwo+ID4gPiA+IHRoZSBj
b250cm9sbGVyIGZyb20gdGhhdCBkZXNjcmlwdG9yIGFuZCBhZGRzIGl0IHRvIHRoZSBjb250cm9s
bGVyIGxpc3QsCj4gPiA+ID4gd2hpY2ggc3RheXMgcHJpdmF0ZSB0byB0aGUgY29yZS4gVGhlIGNv
cmUgb3ducyB0aGUgY29udHJvbGxlciBzdGF0ZQo+ID4gPiA+IGFmdGVyIHJlZ2lzdHJhdGlvbiwg
c28gbm90aGluZyBpbiBpdCBkZXBlbmRzIG9uIGhvdyB0aGUgY29udHJvbGxlciB3YXMKPiA+ID4g
PiBkaXNjb3ZlcmVkLiBUaGUgY2FsbGVyIGtlZXBzIHRoZSByZWdpc3RlciBtYXBwaW5nIGFsaXZl
Lgo+ID4gPiA+Cj4gPiA+ID4gVGVzdGVkLWJ5OiBaZW5nIEhlbmcgPHplbmdoZW5nQHBpY29oZWFy
dC5jb20+Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IFplbmcgSGVuZyA8emVuZ2hlbmdAcGljb2hlYXJ0
LmNvbT4KPiA+ID4gPiBDby1kZXZlbG9wZWQtYnk6IEFkcmllbiBSaWNjaWFyZGkgPGFyaWNjaWFy
ZGlAYmF5bGlicmUuY29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFkcmllbiBSaWNjaWFyZGkg
PGFyaWNjaWFyZGlAYmF5bGlicmUuY29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVz
dGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPgo+IFsuLl0KPiA+ID4gPiArICAgICAvKiBUaGUgcmVz
Y3RybCBnbHVlIGtleXMgaXRzIGRvbWFpbnMgb24gY2FjaGVfaWQsIG9uZSBjb250cm9sbGVyIGVh
Y2guICovCj4gPiA+ID4gKyAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeShvdGhlciwgJmNicXJpX2Nv
bnRyb2xsZXJzLCBsaXN0KSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICBpZiAob3RoZXItPmNhY2hl
LmNhY2hlX2xldmVsID09IGluZm8tPmNhY2hlX2xldmVsICYmCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgb3RoZXItPmNhY2hlLmNhY2hlX2lkID09IGluZm8tPmNhY2hlX2lkKSB7Cj4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgIHByX3dhcm4oIkNDIGF0ICVwYSBkdXBsaWNhdGVzIHRoZSBM
JXUgY2FjaGUgaWQgJXUgY29udHJvbGxlciBhdCAlcGEsIHNraXBwaW5nXG4iLAo+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICZjdHJsLT5hZGRyLCBpbmZvLT5jYWNoZV9sZXZl
bCwgaW5mby0+Y2FjaGVfaWQsCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Jm90aGVyLT5hZGRyKTsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FRVhJ
U1Q7Cj4gPgo+ID4gQSBjb250cm9sbGVyIHdpdGggdGhlIHNhbWUgY2FjaGUgbGV2ZWwgYW5kIENh
Y2hlIElEIGlzIG5vdCBuZWNlc3NhcmlseQo+ID4gYSBkdXBsaWNhdGUuIEEgZGlzdHJpYnV0ZWQg
TExDIG1heSBoYXZlIG11bHRpcGxlIHBoeXNpY2FsIGNvbnRyb2xsZXJzCj4gPiBtYW5hZ2luZyB0
aGUgc2FtZSBsb2dpY2FsIEwzIHJlc291cmNlLgo+ID4KPiA+IE1hdGNoaW5nIGNvbnRyb2xsZXJz
IHNob3VsZCBpbnN0ZWFkIGJlIGdyb3VwZWQgaW50byBhIGxvZ2ljYWwgY29tcG9uZW50Cj4gPiBr
ZXllZCBieSAoY2FjaGVfbGV2ZWwsIGNhY2hlX2lkKSwgd2l0aCB0aGUgcGh5c2ljYWwgY29udHJv
bGxlcnMga2VwdCBpbgo+ID4gYSBsaW5rZWQgbGlzdC4gVXNlciBzcGFjZSB3b3VsZCBzZWUgb25l
IGxvZ2ljYWwgY29udHJvbGxlciBhcyBhIHNpbmdsZQo+ID4gcmVzY3RybCBMMyBkb21haW4sIHdo
aWxlIHRoZSB1cGRhdGUgcGF0aCB3b3VsZCBpdGVyYXRlIHRoZSBsaXN0IGFuZAo+ID4gcHJvZ3Jh
bSBldmVyeSBwaHlzaWNhbCBjb250cm9sbGVyLgo+Cj4gR29vZCBwb2ludCB0aGF0IGl0IGlzIG5v
dCBhIGR1cGxpY2F0ZS4gSG93ZXZlciwgSSB3b3VsZCBsaWtlIHRvIGtlZXAgdGhlCj4gc2NvcGUg
b2YgdGhpcyBzZXJpZXMgZnJvbSBleHBhbmRpbmcsIHNvIEkgd291bGQgcHJlZmVyIGZvciB0aGF0
IHNjZW5hcmlvCj4gdG8gYmUgaGFuZGxlZCBpbiBhIGZ1dHVyZSBzZXJpZXMuIFRoZSBkb21haW4g
aWQgaXMgdGhlIGNhY2hlIGlkIGluIGJvdGgKPiBjYXNlcywgc28gaXQgd29uJ3QgYmUgYSBwcm9i
bGVtIHRvIGFkZCBsYXRlci4KPgo+IERvIHlvdSBoYXZlIGEgcGxhdGZvcm0gd2l0aCBzdWNoIGFu
IEwzIHRoYXQgaXQgY291bGQgYmUgdGVzdGVkIG9uPwo+Cj4gRm9yIHYxMywgSSBjb3VsZCBjaGFu
Z2UgdGhlIGNvbW1lbnQgYW5kIHRoZSB3YXJuaW5nIHNvIHRoYXQgdGhleSBzYXkgYQo+IHNlY29u
ZCBjb250cm9sbGVyIGZvciBhIGNhY2hlIGlzIG5vdCBzdXBwb3J0ZWQsIGluc3RlYWQgb2YgY2Fs
bGluZyBpdCBhCj4gZHVwbGljYXRlLiBUaGUgYWx0ZXJuYXRpdmUgY291bGQgYmUgdG8gc2tpcCB0
aGUgd2hvbGUgZ3JvdXAgaWYgaXQgaXMKPiBhIHByb2JsZW0gdG8ganVzdCBsZWF2ZSB0aGUgZmly
c3Qgb2YgdGhlIGdyb3VwIGVuYWJsZWQuCgpLZWVwaW5nIG9ubHkgdGhlIGZpcnN0IGNvbnRyb2xs
ZXIgY291bGQgZXhwb3NlIG9uZSBsb2dpY2FsIEwzIGRvbWFpbiB0bwp1c2VyIHNwYWNlIHdoaWxl
IGNvbmZpZ3VyaW5nIG9ubHkgcGFydCBvZiB0aGUgcGh5c2ljYWwgcmVzb3VyY2UuIFJlcXVlc3Rz
CmhhbmRsZWQgYnkgdGhlIHJlbWFpbmluZyBjb250cm9sbGVycyB3b3VsZCBub3QgcmVjZWl2ZSB0
aGUgc2FtZSBhbGxvY2F0aW9uLgoKVGhpcyB0b3BvbG9neSBzaG91bGQgYmUgdGVzdGFibGUgaW4g
UUVNVSBieSBjcmVhdGluZyB0d28gY2FwYWNpdHkKY29udHJvbGxlcnMgd2l0aCBkaWZmZXJlbnQg
TU1JTyBiYXNlcyBhbmQgbWFraW5nIGJvdGggUlFTQyByZXNvdXJjZQplbnRyaWVzIHJlZmVyZW5j
ZSB0aGUgc2FtZSBQUFRUIENhY2hlIElELgoKT25lIHBvc3NpYmxlIGdyb3VwaW5nIG1vZGVsIGlz
OgoKMS4gSW5pdGlhbGl6YXRpb24KR3JvdXAgY29udHJvbGxlcnMgYnkgKGNhY2hlX2xldmVsLCBj
YWNoZV9pZCkuIFJlcHJlc2VudCBlYWNoIGdyb3VwCmFzIG9uZSBsb2dpY2FsIGNvbXBvbmVudCBj
b250YWluaW5nIGEgbGlua2VkIGxpc3Qgb2YgaXRzIHBoeXNpY2FsIGNvbnRyb2xsZXJzLgoKMi4g
U2V0CkxldCB0aGUgcmVzY3RybCBkb21haW4gcmVmZXJlbmNlIHRoZSBsb2dpY2FsIGNvbXBvbmVu
dC4gT24gYSBzY2hlbWF0YQp1cGRhdGUsIGl0ZXJhdGUgb3ZlciB0aGUgY29udHJvbGxlciBsaXN0
IGFuZCBwcm9ncmFtIGV2ZXJ5IHBoeXNpY2FsIGNvbnRyb2xsZXIuCgozLiBHZXQKUmVhZCB0aGUg
Y29uZmlndXJhdGlvbiBmcm9tIHRoZSBmaXJzdCBjb250cm9sbGVyIGFuZCB2ZXJpZnkgdGhhdCB0
aGUKcmVtYWluaW5nIGNvbnRyb2xsZXJzIHJlcG9ydCB0aGUgc2FtZSB2YWx1ZS4KCjQuIE1vbml0
b3IKV2hlbiBtb25pdG9yaW5nIHN1cHBvcnQgaXMgYWRkZWQsIHJlYWQgdGhlIGNvdW50ZXIgZm9y
IHRoZSBzYW1lIE1DSUQKZnJvbSBldmVyeSBwaHlzaWNhbCBjb250cm9sbGVyIGFuZCByZXBvcnQg
dGhlIHN1bSBmb3IgdGhlIGxvZ2ljYWwKcmVzY3RybCBkb21haW4uCgpVc2VyIHNwYWNlIHdvdWxk
IGNvbnRpbnVlIHRvIHNlZSBvbmUgbG9naWNhbCBMMyBkb21haW4sIHdoaWxlIGFsbApwaHlzaWNh
bCBjb250cm9sbGVycyBiZWhpbmQgaXQgcmVtYWluIHN5bmNocm9uaXplZC4KClVudGlsIHRoaXMg
Z3JvdXBpbmcgaXMgc3VwcG9ydGVkLCBpdCB3b3VsZCBiZSBzYWZlciB0byBza2lwIHRoZSB3aG9s
ZQpjb21wb25lbnQgcmF0aGVyIHRoYW4gZW5hYmxlIG9ubHkgdGhlIGZpcnN0IGNvbnRyb2xsZXIu
IFNpbmNlIHRoaXMgaXMgYQp2YWxpZCBSUVNDIHRvcG9sb2d5IGFuZCBjYW4gYmUgY292ZXJlZCBi
eSBRRU1VLCBzdXBwb3J0aW5nIHRoZSBncm91cGluZwppbiB0aGUgY3VycmVudCB3b3JrIHdvdWxk
IGJlIHByZWZlcmFibGUuCgpUaGFua3MsCll1bmh1aQoKCj4KPiBUaGFua3MsCj4gRHJldwo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
