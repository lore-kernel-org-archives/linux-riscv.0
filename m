Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75544C02181
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 22:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RkTNHv2ah9Up2OYhuiZGJA/VMGL6fak3nhmtY6y1WFQ=; b=qAPMj7YdKTjO4+
	JNoljb/FlllkuaXerEFpKUK+UJ9eTqBww+qI0eLbiCcQCarBxBP+Fe9yEQ//ivGv3eF4yNFmL+DeM
	LBK7wdV+GwMg4NmINf2hLeZ4rT9eE+1nq1LOG5RKQlZNXZk1TM4Vkr/LA1g8m1ap4iTo4HT0cUEj0
	tipUcnEYtCfbOPHBceWNW/cbf+lFpbeQcz4O+4oKZD2JB/aS1qcNzQ3t3EuMr7f9kjIrctDJMpmD4
	JNPRZAWirkx+YL7n1ZvqTTpuPZnp/09J2xsFdovbAjTzz54/S2TedTxCBPyCaNtnnh9xyM3JOowOL
	qMW7yjtvWRttmmWrQgpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbS5e-0000000FcCM-1rGW;
	Fri, 24 Jan 2025 22:23:50 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbS5a-0000000FcBh-2xjs
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 22:23:48 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21619108a6bso45323735ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jan 2025 14:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737757426; x=1738362226; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yUv+RaNlBSnMfG9KxmG6AfxJdG5ylIteL5qAdF6dzeg=;
        b=AgjHPLU2paQVOHSYYhGmyjWl4cLQkgTgN2A9xjKLXYifIsoHxV6ex8nn3pO4lha/xs
         mrnyyH5+HyEyBGo2dm2ydD3rUAUHIBk9H4/nayrdis+392pF80GblbD5Qxm20R02PI3i
         qF54RQ7TbKCUtfcUyuclCimGhwlaRx9kBB2CgkkzdS9W/jhUjmeAhKW7y90g1QQKGspN
         m+hf6Aj35/KQmougFF2Q2PB3jxehhq22l6X+UsK/1bo0hefDzw1pt622mYtHEQJDdBBC
         uAKgeBrRQmKzrWw6AB8rlR+vDq/Zk+vD3NbqMXrCTlVXmuyQWuk0do5IJAoUizf3DVAi
         qA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737757426; x=1738362226;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUv+RaNlBSnMfG9KxmG6AfxJdG5ylIteL5qAdF6dzeg=;
        b=dcUtqtmsui9UzuB+HmxUk3infOhjubblkriIMCNCtOt8dYU2ew7kjK9wveYRrTNoj9
         W9+9dDwFv43cjGIGaP2HG3GrioBExFq1fW/cZkDt1fY94BayzscOLtCRJRaRzA974bkm
         0FQzsWjm5X5Y42hiIwI0N0VA3JyjdYzDWBOE6q+lUqOb2VsUgjjuWfSmThvubONhbGHG
         qYN+3y84+y3ka2GmCCYa54d/enhq6635tn7iHnMsuTyRD4rNutWTEvUoWWnbemPz2Tpf
         zTQxfBRaE20fsgXx4bDneyB8kPpd1284w8Bg1UrRiZ3Fu/klNqdfEM0xQq78SCO0PPW1
         dy/A==
X-Forwarded-Encrypted: i=1; AJvYcCUOLJm0uD0Ud28oGublvI7hovSvG9oXn7G+CbKMajMXeH44jCzgY9omvFUf67FhVRRFBbDM5MMWTqVM6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdVyWNX3LO/odLtN+DhBf9eksDQ0FX/XoFlW7/jpzoVRiiWyji
	apMy7a7rZoBfIm9Mz4JMNSMSEZ903RD1zgpf2hf6CGiNYPbYdaiDd6vkYb6KPbou+XZCJj20sxK
	fcvI=
X-Gm-Gg: ASbGncvLEzHxyy/RJ5L9Bg7H81M/Od/FjaHmMAjGcRNV0njxe8ztsE/+V2YNlHYQHIP
	47OJKzCbPQ5I+XxfAUR/eq+QinfZsLukGHJdyk0ulnZqYRk+Gw/b4EbTcjY1pYnqfhKqrkfDkrQ
	81J8mpsCeYxyoODJIWc4dnSMfW6pbKgmN0dr+pDL8Xxk770kpO/AMs9eAq56zk6DOuPSarQwhGZ
	6/68tJqf/PzbltellCbUgdHuBJ9XiiuhJSMNKHPypyKFJeSF7ywPrts9jJPrCOCpqP+fQM=
X-Google-Smtp-Source: AGHT+IGSiDeyaor3Xyykrpa+3fW1EiHgGhOjTWTXaUtdnDW0jN1fxxyzeFLtuFtvlggZGKCMyzKnSQ==
X-Received: by 2002:a05:6a00:92a0:b0:729:9f1:69bc with SMTP id d2e1a72fcca58-72dafa410aemr45756556b3a.12.1737757425781;
        Fri, 24 Jan 2025 14:23:45 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a77c560sm2492231b3a.142.2025.01.24.14.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 14:23:45 -0800 (PST)
Date: Fri, 24 Jan 2025 14:23:42 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v2 3/4] loongarch: entry: Migrate ret_from_fork() to C
Message-ID: <Z5QS7iQroTpt5kpr@ghost>
References: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com>
 <20250123-riscv_optimize_entry-v2-3-7c259492d508@rivosinc.com>
 <CAAhV-H7RSn2ek5CeLnohTcrh=0unDNmaLDq+yDH2oqshoeRMNQ@mail.gmail.com>
 <Z5Pb4jsO_qH6Wrx7@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z5Pb4jsO_qH6Wrx7@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_142346_746100_245CD041 
X-CRM114-Status: GOOD (  20.51  )
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

T24gRnJpLCBKYW4gMjQsIDIwMjUgYXQgMTA6Mjg6NTBBTSAtMDgwMCwgQ2hhcmxpZSBKZW5raW5z
IHdyb3RlOgo+IE9uIEZyaSwgSmFuIDI0LCAyMDI1IGF0IDA1OjA1OjIxUE0gKzA4MDAsIEh1YWNh
aSBDaGVuIHdyb3RlOgo+ID4gSGksIENoYXJsaWUsCj4gPiAKPiA+IE9uIEZyaSwgSmFuIDI0LCAy
MDI1IGF0IDM6MTXigK9BTSBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3
cm90ZToKPiA+ID4KPiA+ID4gTG9vbmdhcmNoIGlzIHRoZSBvbmx5IGFyY2hpdGVjdHVyZSB0aGF0
IGNhbGxzCj4gPiBXZSB1c3VhbGx5IHVzZSAiTG9vbmdBcmNoIiBpbnN0ZWFkIG9mICJsb29uZ2Fy
Y2giIG9yICJMb29uZ2FyY2giLgo+ID4gCj4gPiA+IHN5c2NhbGxfZXhpdF90b191c2VyX21vZGUo
KSBmcm9tIGFzbS4gTW92ZSB0aGUgY2FsbCBpbnRvIEMgc28gdGhhdCB0aGlzCj4gPiA+IGZ1bmN0
aW9uIGNhbiBiZSBpbmxpbmVkIGFjcm9zcyBhbGwgYXJjaGl0ZWN0dXJlcy4KPiA+ID4KPiA+ID4g
U2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiA+
ID4gLS0tCj4gPiA+ICBhcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBlcy5o
IHwgIDUgKysrKysKPiA+ID4gIGFyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3N3aXRjaF90by5o
ICAgICAgfCAgOCArKysrKysrCj4gPiA+ICBhcmNoL2xvb25nYXJjaC9rZXJuZWwvZW50cnkuUyAg
ICAgICAgICAgICAgIHwgMjIgKysrKysrKysrLS0tLS0tLS0tLQo+ID4gPiAgYXJjaC9sb29uZ2Fy
Y2gva2VybmVsL3Byb2Nlc3MuYyAgICAgICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tCj4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDE4IGRl
bGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gvaW5jbHVk
ZS9hc20vYXNtLXByb3RvdHlwZXMuaCBiL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL2FzbS1w
cm90b3R5cGVzLmgKPiA+ID4gaW5kZXggNTFmMjI0YmNmYzY1NDIyOGFlNDIzZTlhMDY2YjI1YjM1
MTAyYTViOS4uMDE5NWQ0MzA5ZmQyOWY5NDY2NGQ1ZjM0MjQ3MTk4Yzc2OTAzM2IxYiAxMDA2NDQK
PiA+ID4gLS0tIGEvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vYXNtLXByb3RvdHlwZXMuaAo+
ID4gPiArKysgYi9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBlcy5oCj4g
PiA+IEBAIC0xMiwzICsxMiw4IEBAIF9faW50MTI4X3QgX19hc2hsdGkzKF9faW50MTI4X3QgYSwg
aW50IGIpOwo+ID4gPiAgX19pbnQxMjhfdCBfX2FzaHJ0aTMoX19pbnQxMjhfdCBhLCBpbnQgYik7
Cj4gPiA+ICBfX2ludDEyOF90IF9fbHNocnRpMyhfX2ludDEyOF90IGEsIGludCBiKTsKPiA+ID4g
ICNlbmRpZgo+ID4gPiArCj4gPiA+ICthc21saW5rYWdlIHZvaWQgbm9pbnN0ciBfX25vX3N0YWNr
X3Byb3RlY3RvciByZXRfZnJvbV9rZXJuZWxfdGhyZWFkKHN0cnVjdCB0YXNrX3N0cnVjdCAqcHJl
diwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVncywKPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpbnQgKCpmbikodm9pZCAqKSwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpmbl9hcmcpOwo+ID4g
SXQgaXMgYSBsaXR0bGUgc3RyYW5nZSB0aGF0IHdlIG9ubHkgbmVlZCB0byBkZWNsYXJlCj4gPiBy
ZXRfZnJvbV9rZXJuZWxfdGhyZWFkKCkgYnV0IG5vdCByZXRfZnJvbV9mb3JrKCkuCj4gCj4gSnVz
dCBhbiBvdmVyc2lnaHQgYnkgbWUsIHRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgdGhhdCBvdXQuCgpP
aCBJIHNlZSB3aGF0IEkgZGlkLCBJIG1lYW50IHRvIHB1dCB0aGVzZSBmdW5jdGlvbnMgaW4gYXNt
LXByb3RvdHlwZXMKYW5kIG5vdCBpbiBzd2l0Y2hfdG8gYnV0IEkgZW5kZWQgdXAgcHV0dGluZyB0
aGVtIGluIGJvdGguCgotIENoYXJsaWUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
