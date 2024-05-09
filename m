Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569D1C25B74
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 23:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=equvNL3yQ03gOUlyrSZcIMfAxoulZjjCGkiTI+tgZqM=; b=LbegPhhQlgZKg14xGonSwUmbsz
	lmhXBVTZJ0okXORpFZ1MN3bPIqSp2DxW7R3OhkKYKZElT9sqVBkBMFOM3aBLA2Lep4jncpmksE7dX
	5LFt549j5D0Bww6ErVHswcjYJeEdzkAlhWzoKziDRvYWI5Zy8EjHf/8Zgb+pw327i8e5cX+Dh7pIX
	lnYfGYsmv2Xu5kAs2GBTkO0rI1U30WSeRF36GWlLGIhtWc+RAUT6pwHU+P23TeHlZ2ezjA0tNQtIZ
	RT7QOJKCls89KPlQaPUhhW3ltVm45+WIK23Qarg5/n5wp35PPDNBYTE+KWXT574PMxa7mHTTjacR7
	caM5beRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5D9r-00000003GVJ-06AU;
	Thu, 09 May 2024 23:26:39 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5D9m-00000003GT7-0dyS
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 23:26:36 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1ed012c1afbso12245985ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 16:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715297189; x=1715901989; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KoGFJaD8EljLtrVmLvtlC7K76bro4/HY8QoalZin5IY=;
        b=FvO/4rgCC4axbqs5TPky+2akSKPd3gzFDpbxvOhdFZla7RpYpEmj3UmEA1KrFHg63D
         bHz1moN/xweLex3Ydpm6MDWKgKULlrN7Ij4Me2H8RTWE9w7ZMU2s2EnNmu646P2E173a
         UMQ2knNdAYJKaSFtFPYCyXJVPRvE/OKhREX2/trBY5MAfcQ0bun7FgBtY9WC81u+t9YA
         8Vwbi3EqeKAQ2BThgfgQvHlTc43mz+jEqBS/aHnBQgIiFetCpZDTS4M41Euzu4tkh9mc
         2SRUFlMEtzuHtc4SifgjzrGm9VadvDvGO0PRiQCs4GtUPwC5hKcxFtebqkZ14YlRCia6
         P9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715297189; x=1715901989;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KoGFJaD8EljLtrVmLvtlC7K76bro4/HY8QoalZin5IY=;
        b=m6N2HP9rU4m3Re5CTAZOLiH+mCJ4fksJeE/RD+OJhvTmMlgy6Y8Y48J3VVlk+rmO1Y
         LmVE2uA3oiXPQITo1be/jhgEh7Ni9fANrR1cMc9B+J3Y9ynFr9Q17csjyw64cfPaTC1O
         7pMaXiOvWV2ZHaX7dYNvQqfHdGqSv2QGyy0lXqt19y2nkL/PZBuhlAjG5g0Vnyo6JMhr
         C1CO/zOmNBLMOucXI/zm/oe72TC2V5KnsIORViCfUndIVqV8FohGj5sLv8aK+pIErXT/
         Y5m5V334zybSt60aXxS+n77LTTov3gOhAxtaXcFmZ8qqPnAazU67l6JpfUc82qSUPq5W
         c7Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUqCxPoPKgXBAq3I2P551gY6nUrjNW56+g29htAPgD1EsTaDzmlo/CQfYucQpzWkpVpKKQrWj1vLP3vx4dvsCCnGAnUuyXRiPgUXc4yRFkA
X-Gm-Message-State: AOJu0Yw1LlWEUw2v/8KkMgqAH4Nf8x04dN3t8wHzxaoYCSSSBpP0Qk53
	EiLGKFgTZ2Axwt37GHvaLto5UcNyBBTxJ0RcIT+fOSAFBKMMCB/+cLhgExg0CoY=
X-Google-Smtp-Source: AGHT+IEwp50qVSxIKzd3GeAEglFyHmirCQzUqIVxpG0w7MU50Y7SrsfbjsJXYlPTm4I0tHeIzltszA==
X-Received: by 2002:a17:902:c402:b0:1eb:e40:3f74 with SMTP id d9443c01a7336-1ef432a092emr15262985ad.32.1715297189377;
        Thu, 09 May 2024 16:26:29 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d1758sm19701355ad.28.2024.05.09.16.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 16:26:28 -0700 (PDT)
Date: Thu, 9 May 2024 16:26:24 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com, broonie@kernel.org,
	Szabolcs.Nagy@arm.com, kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	cleger@rivosinc.com, atishp@atishpatra.org, alex@ghiti.fr,
	bjorn@rivosinc.com, alexghiti@rivosinc.com,
	samuel.holland@sifive.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
	corbet@lwn.net, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	charlie@rivosinc.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, dbarboza@ventanamicro.com,
	sameo@rivosinc.com, shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 04/29] riscv: zicfilp / zicfiss in dt-bindings
 (extensions.yaml)
Message-ID: <Zj1boEJG4ijcdNi0@debug.ba.rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-5-debug@rivosinc.com>
 <20240410115806.GA4044117-robh@kernel.org>
 <CAKC1njSsZ6wfvJtXkp4J4J6wXFtU92W9JGca-atKxBy8UvUwRg@mail.gmail.com>
 <20240415194105.GA94432-robh@kernel.org>
 <Zh6c0FH2OvrfDLje@debug.ba.rivosinc.com>
 <20240509-cornflake-foyer-e6589c2bc364@spud>
 <Zj0aAiZiTrt9ACjj@debug.ba.rivosinc.com>
 <20240509-clatter-crewmate-9755669b9452@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240509-clatter-crewmate-9755669b9452@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_162634_971417_1018DC34 
X-CRM114-Status: GOOD (  35.01  )
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

T24gVGh1LCBNYXkgMDksIDIwMjQgYXQgMDk6MzI6NDlQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+T24gVGh1LCBNYXkgMDksIDIwMjQgYXQgMTE6NDY6MjZBTSAtMDcwMCwgRGVlcGFrIEd1
cHRhIHdyb3RlOgo+PiBPbiBUaHUsIE1heSAwOSwgMjAyNCBhdCAwNzoxNDoyNlBNICswMTAwLCBD
b25vciBEb29sZXkgd3JvdGU6Cj4+ID4gT24gVHVlLCBBcHIgMTYsIDIwMjQgYXQgMDg6NDQ6MTZB
TSAtMDcwMCwgRGVlcGFrIEd1cHRhIHdyb3RlOgo+PiA+ID4gT24gTW9uLCBBcHIgMTUsIDIwMjQg
YXQgMDI6NDE6MDVQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+ID4gPiA+IE9uIFdlZCwg
QXByIDEwLCAyMDI0IGF0IDAyOjM3OjIxUE0gLTA3MDAsIERlZXBhayBHdXB0YSB3cm90ZToKPj4g
PiA+ID4gPiBPbiBXZWQsIEFwciAxMCwgMjAyNCBhdCA0OjU44oCvQU0gUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4+ID4gPiA+ID4gPgo+PiA+ID4gPiA+ID4gT24gV2VkLCBB
cHIgMDMsIDIwMjQgYXQgMDQ6MzQ6NTJQTSAtMDcwMCwgRGVlcGFrIEd1cHRhIHdyb3RlOgo+PiA+
ID4gPiA+ID4gPiBNYWtlIGFuIGVudHJ5IGZvciBjZmkgZXh0ZW5zaW9ucyBpbiBleHRlbnNpb25z
LnlhbWwuCj4+ID4gPiA+ID4gPiA+Cj4+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IERlZXBh
ayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+PiA+ID4gPiA+ID4gPiAtLS0KPj4gPiA+ID4g
PiA+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCAgICAg
ICAgICB8IDEwICsrKysrKysrKysKPj4gPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspCj4+ID4gPiA+ID4gPiA+Cj4+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+
PiA+ID4gPiA+ID4gPiBpbmRleCA2M2Q4MWRjODk1ZTUuLjQ1Yjg3YWQ2Y2MxYyAxMDA2NDQKPj4g
PiA+ID4gPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2V4dGVuc2lvbnMueWFtbAo+PiA+ID4gPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4+ID4gPiA+ID4gPiA+IEBAIC0z
MTcsNiArMzE3LDE2IEBAIHByb3BlcnRpZXM6Cj4+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICBU
aGUgc3RhbmRhcmQgWmljYm96IGV4dGVuc2lvbiBmb3IgY2FjaGUtYmxvY2sgemVyb2luZyBhcyBy
YXRpZmllZAo+PiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgaW4gY29tbWl0IDNkZDYwNmYgKCJD
cmVhdGUgY21vYmFzZS12MS4wLnBkZiIpIG9mIHJpc2N2LUNNT3MuCj4+ID4gPiA+ID4gPiA+Cj4+
ID4gPiA+ID4gPiA+ICsgICAgICAgIC0gY29uc3Q6IHppY2ZpbHAKPj4gPiA+ID4gPiA+ID4gKyAg
ICAgICAgICBkZXNjcmlwdGlvbjoKPj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgIFRoZSBzdGFu
ZGFyZCBaaWNmaWxwIGV4dGVuc2lvbiBmb3IgZW5mb3JjaW5nIGZvcndhcmQgZWRnZSBjb250cm9s
LWZsb3cKPj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgIGludGVncml0eSBpbiBjb21taXQgM2Ey
MGRjOSBvZiByaXNjdi1jZmkgYW5kIGlzIGluIHB1YmxpYyByZXZpZXcuCj4+ID4gPiA+ID4gPgo+
PiA+ID4gPiA+ID4gRG9lcyBpbiBwdWJsaWMgcmV2aWV3IG1lYW4gdGhlIGNvbW1pdCBzaGEgaXMg
Z29pbmcgdG8gY2hhbmdlPwo+PiA+ID4gPiA+ID4KPj4gPiA+ID4gPgo+PiA+ID4gPiA+IExlc3Mg
bGlrZWx5LiBOZXh0IHN0ZXAgYWZ0ZXIgcHVibGljIHJldmlldyBpcyB0byBnYXRoZXIgY29tbWVu
dHMgZnJvbQo+PiA+ID4gPiA+IHB1YmxpYyByZXZpZXcuCj4+ID4gPiA+ID4gSWYgc29tZXRoaW5n
IGlzIHJlYWxseSBwcmVzc2luZyBhbmQgbmVlZHMgdG8gYmUgYWRkcmVzc2VkLCB0aGVuIHllcwo+
PiA+ID4gPiA+IHRoaXMgd2lsbCBjaGFuZ2UuCj4+ID4gPiA+ID4gRWxzZSB0aGlzIGdldHMgcmF0
aWZpZWQgYXMgaXQgaXMuCj4+ID4gPiA+Cj4+ID4gPiA+IElmIHRoZSBjb21taXQgc2hhIGNhbiBj
aGFuZ2UsIHRoZW4gaXQgaXMgdXNlbGVzcy4gV2hhdCdzIHRoZSBndWFyYW50ZWUKPj4gPiA+ID4g
c29tZW9uZSBpcyBnb2luZyB0byByZW1lbWJlciB0byB1cGRhdGUgaXQgaWYgaXQgY2hhbmdlcz8K
Pj4gPiA+Cj4+ID4gPiBTb3JyeSBmb3IgbGF0ZSByZXBseS4KPj4gPiA+Cj4+ID4gPiBJIHdhcyBm
b2xsb3dpbmcgZXhpc3Rpbmcgd29yZGluZ3MgYW5kIHBhdHRlcm5zIGZvciBtZXNzYWdpbmcgaW4g
dGhpcyBmaWxlLgo+PiA+ID4gWW91IHdvdWxkIHJhdGhlciBoYXZlIG1lIHJlbW92ZSBzaGEgYW5k
IG9ubHkgbWVudGlvbiB0aGF0IHNwZWMgaXMgaW4gcHVibGljCj4+ID4gPiByZXZpZXc/Cj4+ID4K
Pj4gPiBOb3BlLCBoYXZpbmcgYSBjb21taXQgc2hhIGlzIGRlc2lyZWQuIE5vbmUgb2YgdGhpcyBp
cyBtZXJnZWFibGUgdW50aWwgYXQKPj4gPiBsZWFzdCB0aGUgc3BlYyBiZWNvbWVzIGZyb3plbiwg
c28gdGhlIHNoYSBjYW4gYmUgdXBkYXRlZCBhdCB0aGF0IHBvaW50Cj4+ID4gdG8gdGhlIGZyZWV6
ZSBzdGF0ZSAtIG9yIGJldHRlciB5ZXQgdG8gdGhlIHJhdGlmaWVkIHN0YXRlLiBCZWluZyBpbgo+
PiA+IHB1YmxpYyByZXZpZXcgaXMgbm90IHN1ZmZpY2llbnQuCj4+Cj4+IFNwZWMgaXMgZnJvemVu
Lgo+PiBBcyBwZXIgUlZJIHNwZWMgbGlmZWN5Y2xlLCBzcGVjIGZyZWV6ZSBpcyBhIHByaW9yIHN0
ZXAgdG8gcHVibGljIHJldmlldy4KPj4gUHVibGljIHJldmlldyBjb25jbHVkZWQgb24gMjV0aCBB
cHJpbAo+PiBodHRwczovL2xpc3RzLnJpc2N2Lm9yZy9nL3RlY2gtc3MtbHAtY2ZpL21lc3NhZ2Uv
OTEKPj4KPj4gTmV4dCBzdGVwIGlzIHJhdGlmaWNhdGlvbiB3aGVuZXZlciBib2FyZCBtZWV0cy4K
Pgo+QWgsIEkgZGlkIHRoZSAic2lsbHkiIHRoaW5nIG9mIGxvb2tpbmcgb24gdGhlIFJWSSB3ZWJz
aXRlIGF0IGV4dGVuc2lvbgo+c3RhdHVzIChiZWNhdXNlIEkgbmV2ZXIga25vdyB0aGUgb3JkZXIg
b2YgdGhpbmdzKSBhbmQgdGhlc2UgdHdvCj5leHRlbnNpb25zIHdlcmUgbWFya2VkIG9uIHRoZXJl
IGFzIGJlaW5nIGluIHRoZSBpbmNlcHRpb24gcGhhc2UsIHNvIEkKPmluY29ycmVjdGx5IGFzc3Vt
ZWQgdGhhdCAicHVibGljIHJldmlldyIgY2FtZSBiZWZvcmUgZnJlZXplLgo+RnJlZXplIGlzIHRo
ZSBzdGFuZGFyZCB0aGF0IHdlIGhhdmUgYmVlbiBhcHBseWluZyBzbyBmYXIsIGJ1dCBpZgo+cmF0
aWZpY2F0aW9uIGlzIGltbWluZW50LCBhbmQgbm90aGluZyBoYXMgY2hhbmdlZCBpbiB0aGUgcmV2
aWV3IHBlcmlvZCwKPnRoZW4gaXQgc2VlbXMgc2FuZSB0byBqdXN0IHBpY2sgdGhlIGZyZWV6ZSBw
b2ludCBmb3IgdGhlIGRlZmluaXRpb24uCgpZZWFoIEkgZG9uJ3QgdGhpbmsgd2lraSBpcyB0aGF0
IHJlZ3VsYXJseSB1cGRhdGVkLgpCdXQgdGFrZSBhIGxvb2sgYXQgUmF0aWZpY2F0aW9uLVJlYWR5
IGxpc3Qgb2Ygc3BlY3MgaGVyZQpodHRwczovL3dpa2kucmlzY3Yub3JnL2Rpc3BsYXkvSE9NRS9S
SVNDLVYrU3BlY2lmaWNhdGlvbitTdGF0dXMKCj4KPkNoZWVycywKPkNvbm9yLgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
