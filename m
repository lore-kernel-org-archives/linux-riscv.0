Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FFAC02194
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 18:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QgwmZiVJBwaNok9wizm87VWLpzuzAYTCyeFe5D2JMdo=; b=C50NQKMSAMsc0r
	0eGjOO1cO+xXRDBBTUAEK4GkyH8YCAvz/IljeSQUC9vLA57SzqHTfed79Arbo9ifFfEhJovXXGWXb
	1p07jYIC8I6hoqCEcSGvNhtssrK4AhE47sBvy4gvmKVDUiiKYBsLZvFVM4iXT1Nt1GkvWaFZfaxRZ
	uyXdJ9V/OrTnc+c2WRhZKjHoAVAxkdWg1AePqIObzd7R3AI+eOg3YDRFxNSi+UmWJGUBFXQKfiR6c
	pRRTj7GHzvRRl04q/PQyE9zKFMFdbVi2CkmHY9rc5fJ9xgKjroc5IS2D+znFs6Fy4i9Dh+GdANfy9
	4ImHyMPh9ymSlJWT2k0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6U6-000000079kv-06Lv;
	Thu, 06 Feb 2025 18:20:18 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6Ok-000000077jc-36Hi;
	Thu, 06 Feb 2025 18:14:48 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38db6e13947so969958f8f.2;
        Thu, 06 Feb 2025 10:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738865685; x=1739470485; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTbbT4CsuJ/iXGmiqeOEuQTztaWXsApJ6CIEHLfEbjE=;
        b=FUBkHqJY7hhneH8f5GGmXg6VUbg0Iox53YBwzLEpKzxT2QkriDiieqpg3spzoEn0fM
         Dl0EybuDhD8aAaIuynKZpM1sQEZgmvhjL91CwHk59Cq5drigW8hDgScZGUl8NRjqsIm4
         FFDw6wZ3GBiw2ha078yF4JZJEv+I/cI4F99fMHStMQ4PUh1NaQfI3ukl6+nPdZkfwRrP
         A2le3o2a/xJXd8/9Hqc5Y5a0M41kTBx94ib8ZesUhdeB9cZEbeCLZyVev6M9dAenXHJE
         mGb0o109RwjS39XvjnjGDI4eXbFYg5z+mqyTawH9cjUR7CQLDdsE+BxDvqU/guzj4VdY
         YhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865685; x=1739470485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTbbT4CsuJ/iXGmiqeOEuQTztaWXsApJ6CIEHLfEbjE=;
        b=owf5mAyLvjp9m9iYSOEeHapkhJTMTHVUoW7YdLBnn4ZCM4P3hnDKrCMTieI6DbL1ej
         GQC/9g3QCSUwchZJk60leDs46H70chEwYeiqMaKNFBEKfXsO5Kw7EnK8spr4/3oX6FKw
         M0kQ2M+Sd8JeyTUeIWzInIra1jdP2bXf3JNTNQ8rJ3dVRfhkBONGx25+znom6IeJcPQj
         Ek9GQ8h6StN/HuBTrLxlKwdBimTyKzRuDKkhzJsjLMeKll9gGLysjgSPERsroLVm1aIu
         atAmXpC3mpFd5EAoFlJMFxrzy04gWmoudMFPe4nRxCRpw1C2GkWCtZwkMzk1P98XwE95
         9hfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmbmfgZbOcMvAymUat4Eza+smcjNYulLM1IJfSyXEiWXOfa3ZbvTYa6GaLuyHaNKUQcClH0R2LNNp5mvvwiL+3@lists.infradead.org, AJvYcCXvV4tVhWZRVjnYATyBKRjTR9ljlkbsfUaVYgERyw/ZrUM71Ft+OZUpD6eM1j1FM06ULmygqsKC9+ItnCU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzGSwCuvNzTgp6HnlqfTiK+bqKwRSUUYomdBUMoNaSxi3dWib1P
	87P7CfvuBiMaBa4w66WTtrw/Vuv1Yco2xDfn3T+z+kXLuBI4ROHIZMooCeQG7bJte07XZEGrhFP
	SIBwj/terUieL+6rgS1IMIfhGBMA=
X-Gm-Gg: ASbGncvoIA2oXhjbRn+IcWseCJ/aIMTDd0hL2rR8M1PZyEv9vOXG0koFq94donoxnUN
	hzKS/EEzODg1jQAd2ywBuA2jY473AbhComGTZ+0BMsn2Iqwwz/JPuh8lmaXGqbM8X2JrRiow+WQ
	==
X-Google-Smtp-Source: AGHT+IHBkaKzKisMLjhYNPQEk4vOcutkS0bItT/CuWo+2lyB11rB/+L1N95UZJSHFEtHE7FQsPK4hkaRlaOSWfeGMWw=
X-Received: by 2002:a05:6000:1acc:b0:38d:c2ef:e291 with SMTP id
 ffacd0b85a97d-38dc2efe475mr1873314f8f.39.1738865684758; Thu, 06 Feb 2025
 10:14:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <808cc6516f47d5f5e811d2c237983767952f3743.1738686764.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZd3sP1_x2c5FvztA6LzsBY3Fq3cD5cJ6FQ+FAnmawe06Q@mail.gmail.com> <zwug3yr7p7x7276g5tpwsvuxefkxn2pwggozgq7krdaquqktc5@eefn3vi3tynu>
In-Reply-To: <zwug3yr7p7x7276g5tpwsvuxefkxn2pwggozgq7krdaquqktc5@eefn3vi3tynu>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 6 Feb 2025 19:14:33 +0100
X-Gm-Features: AWEUYZmr-sZ7H7rQ5pJvdgslU5r_pD-83ZAYiTMD0XxDDSXEdCYqWWqGvarMkGQ
Message-ID: <CA+fCnZfsT3jO96rewM3wZw7n4hHJ44wRDG8g_55NFS5VG34grg@mail.gmail.com>
Subject: Re: [PATCH 01/15] kasan: Allocation enhancement for dense tag-based mode
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: luto@kernel.org, xin@zytor.com, kirill.shutemov@linux.intel.com, 
	palmer@dabbelt.com, tj@kernel.org, brgerst@gmail.com, ardb@kernel.org, 
	dave.hansen@linux.intel.com, jgross@suse.com, will@kernel.org, 
	akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, dvyukov@google.com, 
	richard.weiyang@gmail.com, ytcoode@gmail.com, tglx@linutronix.de, 
	hpa@zytor.com, seanjc@google.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, justinstitt@google.com, jason.andryuk@amd.com, 
	glider@google.com, ubizjak@gmail.com, jannh@google.com, bhe@redhat.com, 
	vincenzo.frascino@arm.com, rafael.j.wysocki@intel.com, 
	ndesaulniers@google.com, mingo@redhat.com, catalin.marinas@arm.com, 
	junichi.nomura@nec.com, nathan@kernel.org, ryabinin.a.a@gmail.com, 
	dennis@kernel.org, bp@alien8.de, kevinloughlin@google.com, morbo@google.com, 
	dan.j.williams@intel.com, julian.stecklina@cyberus-technology.de, 
	peterz@infradead.org, cl@linux.com, kees@kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_101446_776470_AEA17B4B 
X-CRM114-Status: GOOD (  27.14  )
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

T24gVGh1LCBGZWIgNiwgMjAyNSBhdCAxOjU44oCvUE0gTWFjaWVqIFdpZWN6b3ItUmV0bWFuCjxt
YWNpZWoud2llY3pvci1yZXRtYW5AaW50ZWwuY29tPiB3cm90ZToKPgo+ID5JcyB0aGVyZSBhIHJl
YXNvbiB0aGVzZSBkZWZpbml0aW9ucyBhcmUgYWRkZWQgdG8KPiA+aW5jbHVkZS9saW51eC9rYXNh
bi5oPyBBdCBsZWFzdCB3aXRoaW4gdGhpcyBwYXRjaCwgdGhleSBhcmUgb25seSB1c2VkCj4gPndp
dGhpbiBtbS9rYXNhbiwgc28gbGV0J3Mga2VlcCB0aGVtIGluIG1tL2thc2FuL2thc2FuLmguCj4K
PiBQYXJ0cyBvZiB4ODYgYXJjaCB1c2UgdGhlc2UgbGF0ZXIgKG1pbmltYWwgc2xhYiBhbGlnbm1l
bnQsIGthc2FuIHNoYWRvdyBzdGFydAo+IGFkZHJlc3MpIHNvIEkgdGhvdWdodCBpdCB3YXMgY29u
dmVuaWVudCB0byBhbHJlYWR5IGhhdmUgaXQgaW4gcGxhY2UgaGVyZT8KCkFGQUlDVCwgS0FTQU5f
U0hBRE9XX1NUQVJUIG9ubHkgcmVsaWVzIG9uIEtBU0FOX1NIQURPV19TQ0FMRV9TSElGVCwKd2hp
Y2ggaXMgZGVmaW5lZCBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rYXNhbi5oIGFueXdheS4KCkFuZCBB
UkNIX1NMQUJfTUlOQUxJR04gaXMgZGVmaW5lZCBpbiBhc20gaGVhZGVycywgc28gdGhlIGRlZmlu
aXRpb25zCmZyb20gaW5jbHVkZS9saW51eC9rYXNhbi5oIHNob3VsZG4ndCBiZSB2aXNpYmxlIHRv
IGl0PwoKSSB0aGluayB0aGF0IHdlIG5lZWQgdG8gZG8gaXMgdG8gZGVmaW5lIEtBU0FOX0dSQU5V
TEVfU0hJRlQgbmV4dCB0bwpLQVNBTl9TSEFET1dfU0NBTEVfU0hJRlQgZm9yIHg4NiBhbmQgdGhl
biB1c2UgaXQgaW4gbW0va2FzYW4va2FzYW4uaAp0byBkZWZpbmUgS0FTQU5fR1JBTlVMRV9TSVpF
IGZvciBTV19UQUdTLiAoU2ltaWxhcmx5IGFzIHdpdGggYXJtNjQsCndoZXJlIEFSQ0hfU0xBQl9N
SU5BTElHTiBkZXBlbmRzIG9uIGVpdGhlciBLQVNBTl9TSEFET1dfU0NBTEVfU0hJRlQgb3IKTVRF
X0dSQU5VTEVfU0laRSwgYm90aCBvZiB3aGljaCBhcmUgZGVmaW5lZCBpbiBhcm02NCBhc20gaGVh
ZGVycy4pCgpCdHcsIEkgdGhpbmsgQVJDSF9TTEFCX01JTkFMSUdOIG5lZWRzIHRvIGJlIGRlZmlu
ZWQgaW4KaW5jbHVkZS9hc20vY2FjaGUuaDogYXQgbGVhc3QgYWxsIG90aGVyIGFyY2hpdGVjdHVy
ZXMgaGF2ZSBpdCB0aGVyZS4KCj4gU2luY2UgSSdsbCBiZSByZW9yZGVyaW5nIHBhdGNoZXMgSSBj
YW4ganVzdCBtb3ZlIHRoZXNlIGNoYW5nZXMgdG9nZXRoZXIuCgpPdGhlcndpc2UsIGlmIHlvdSBu
ZWVkIHRvIGV4cG9zZSBzb21ldGhpbmcgbmV3IGluCmluY2x1ZGUvbGludXgva2FzYW4uaCwgcGxl
YXNlIGRvIGl0IHRvZ2V0aGVyIHdpdGggdGhlIGNoYW5nZSB0aGF0IHVzZXMKaXQuIE9yIHlvdSBj
YW4gZXZlbiBwdXQgaXQgaW50byBhIHNlcGFyYXRlIHBhdGNoIHdpdGggYW4gZXhwbGFuYXRpb24K
b2Ygd2h5IGl0J3MgcmVxdWlyZWQgLSBhdCBsZWFzdCBmcm9tIHRoZSByZXZpZXcgcGVyc3BlY3Rp
dmUgaGF2aW5nCnNlcGFyYXRlIHNtYWxsZXIgcGF0Y2hlcyBpcyBvZnRlbiBiZXR0ZXIuCgpJbiBn
ZW5lcmFsLCBpZiBzb21ldGhpbmcgZG9lc24ndCBuZWVkIHRvIGdldCBleHBvc2VkIHRvIHRoZSBy
ZXN0IG9mCnRoZSBrZXJuZWwsIGtlZXAgaXQgaW4gbW0va2FzYW4va2FzYW4uaC4KCj4gPkkgdGhp
bmsgdGhpcyBzaG91bGQgYWxzbyBkZXBlbmQgb24gS0FTQU5fT1VUTElORTogQ2xhbmcvR0NDIGFy
ZW4ndAo+ID5hd2FyZSBvZiB0aGUgZGVuc2UgbW9kZS4KPgo+IEkgd2Fzbid0IHN1cmUgSSBmdWxs
eSB1bmRlcnN0b29kIGhvdyBpbmxpbmUvb3V0bGluZSBpbnRlcmFjdHMgd2l0aCBjbGFuZy9nY2Mg
b24KPiB4ODYgKGVzcGVjaWFsbHkgdGhhdCBJIHRoaW5rIHNvbWUgcGFydHMgYXJlIHN0aWxsIG1p
c3NpbmcgaW4geDg2IGNsYW5nIGZvcgo+IHRhZy1iYXNlZCBLQVNBTikuIFNvIEkgdW5kZXJzdGFu
ZCB0aGF0IGNvbXBpbGluZyB3aXRoIGlubGluZSBkb2Vzbid0IGRvCj4gYW55dGhpbmc/IElmIHNv
LCBpcyBpdCBub3QgZG9pbmcgYW55dGhpbmcgYmVjYXVzZSBvZiBtaXNzaW5nIGNvbXBpbGVyIGNv
ZGUgb3IKPiBzb21ldGhpbmcgaW4gdGhlIGtlcm5lbD8KCldpdGggaW5saW5lIGluc3RydW1lbnRh
dGlvbiwgdGhlIGNvbXBpbGVyIGRpcmVjdGx5IGVtYmVkcyB0aGUKaW5zdHJ1Y3Rpb25zIHRvIGNh
bGN1bGF0ZSB0aGUgc2hhZG93IGFkZHJlc3MgYW5kIGNoZWNrIHRoZSBzaGFkb3cKdmFsdWUuIFNp
bmNlIHRoZSBjb21waWxlciBhc3N1bWVzIHRoYXQgb25lIHNoYWRvdyBieXRlIGNvcnJlc3BvbmRz
IHRvCjE2IGJ5dGVzIG9mIG1lbW9yeSBhbmQgbm90IDMyLCB0aGUgZ2VuZXJhdGVkIGluc3RydWN0
aW9ucyB3b24ndCBiZQpjb21wYXRpYmxlIHdpdGggdGhlIGRlbnNlIG1vZGUuIFdpdGggb3V0bGlu
ZSBpbnN0cnVtZW50YXRpb24sIHRoZQpjb21waWxlciBqdXN0IGFkZHMgZnVuY3Rpb24gY2FsbHMg
YW5kIHRodXMgYWxsIHRoZSBzaGFkb3cgY2FsY3VsYXRpb25zCmFyZSBwZXJmb3JtZWQgYnkgdGhl
IEMgY29kZS4KCk9yIGRpZCB0aGUgZGVuc2UgbW9kZSB3b3JrIGZvciB5b3Ugd2l0aCBLQVNBTl9J
TkxJTkUgZW5hYmxlZD8gSSB3b3VsZApleHBlY3QgdGhpcyBub3QgdG8gd29yay4gT3IgbWF5YmUg
dGhlIGlubGluZSBpbnN0cnVtZW50YXRpb24gc29tZWhvdwpnb3QgYXV0by1kaXNhYmxlZC4uLgoK
PiA+V291bGQgaXQgYmUgcG9zc2libGUgdG8gbW92ZSB0aGlzIHBhcnQgdG8ga2FzYW5fcG9pc29u
X2xhc3RfZ3JhbnVsZSgpPwo+ID5UaGF0IGZ1bmN0aW9ucyBzZWVtcyB0byBiZSBzZXJ2aW5nIGEg
c2ltaWxhciBwdXJwb3NlIGJ1dCBmb3IgdGhlCj4gPkdlbmVyaWMgbW9kZS4KPiA+Cj4gPkl0IG1p
Z2h0IGFsc28gYmUgY2xlYW5lciB0byBhZGQgYSBrYXNhbl9wb2lzb25fZmlyc3RfZ3JhbnVsZSgp
IHRoYXQKPiA+Y29udGFpbnMgdGhlIGlmIChhZGRyNjQgJSBLQVNBTl9TSEFET1dfU0NBTEVfU0la
RSkgY2hlY2suCj4gLi4uCj4gc3VyZSwgSSdsbCB0cnkgdG8gbW92ZSB0aGVzZSBjaGVja3MgdG8g
a2FzYW5fcG9pc29uX2ZpcnN0L2xhc3RfZ3JhbnVsZS4KCkZvciBrYXNhbl9wb2lzb25fbGFzdF9n
cmFudWxlKCksIEkgdGhpbmsgdGhlIGNoYW5nZSBtYWtlcyBzZW5zZS4gRm9yCmthc2FuX3BvaXNv
bl9maXJzdF9ncmFudWxlKCksIHBsZWFzZSBjaGVjayB3aGV0aGVyIGl0IGdpdmVzIGFueQpyZWFk
YWJpbGl0eSBiZW5lZml0IC0gaWYga2FzYW5fcG9pc29uKCkgaXMgdGhlIG9ubHkgY2FsbGVyLCBt
YXliZQphZGRpbmcgYW5vdGhlciBmdW5jdGlvbiBpcyBub3Qgd29ydGggaXQuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
