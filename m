Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA565D68B34
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 15:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3V6dt1OSbCBJeAtGm2mmnTLB4kY1ATNBKQERQOJ6UE=; b=dV8sNDM3/CFRh3oQHTqasxg5QO
	juc/kMODJldWjvGLKD4yRh7Dq46/rQUXCyt/67biagkwpbv30HnspJLhtgxJp7fmzx6muTPw3eizX
	mweYNGQ37xA69v3szJXGhgGy4J/ItEvdXXxw+k0xjnIZwQDdJSnsoz0e+2ITlNS/zF0qXcPkMhrEv
	BmNqFQNrKl/tkFw4l0D9p+N+zyoju4oHCesPg77vF82QVWNy6yoD5wtxR0crldAGzOhqKt0hQk64m
	jN9f1w9IYUT0gZTgQJ5pPo2f6/jR1u2mim5g68gau+ci58VAVBEPmGQtDq7CNYsl3IsZydjw2V/4W
	RgsW4e3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBc8h-00000000Gs0-1oTr;
	Thu, 14 Nov 2024 15:52:11 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBc7O-00000000GSd-2gXu
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 15:50:52 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20c693b68f5so9070705ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 07:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731599449; x=1732204249; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AuaBMTy+AeJsJU9fm4AZ56hQq3E5HBpfOKLhTwWZNeQ=;
        b=Gwk+qKXlWM294yJOOdQTVeEBe5Po2aQ0rSOy+zrFfvjHl8MaFINsD/m8vOpr8vmSO7
         lPD9a5pMDdJ6DfvSi+qHb84VpBMZGtqIF903vg1jvNZhR1obsUAvVmtOn38yqeMRwcav
         /UUZNhLwszpLeNNyQAzNR58qdm1KRCJV802rtnJTVq2IND3+5RAPDYf+sM/wMX5LYu8S
         Do54rv67z0mtdJMzzlEH6FJd8pZ949ar3I6rSAwInXa8wEzghEt/QTECbcLnwZswUEj9
         TuUDTeB1uvZXv85j+bpuDG7Q3Hk6QKaJuhBbxtlsrMJIwXGGYhoM9Fec6aEyHURMgikx
         tC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731599449; x=1732204249;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AuaBMTy+AeJsJU9fm4AZ56hQq3E5HBpfOKLhTwWZNeQ=;
        b=ZdsPKgnTRn2TARgTY9/erop97z/+1NuH1Uu/6o1yC/oKQrLB+luFmmApf3cJRAGTQv
         ox1rdz85AlAOIM43zTiNARiYOc/gHPuG/wu3KEuxWvW53L1M7xCgTpFEf+/TOVZ1njXc
         oeb07MAXHWyOPELdjoEgXIU1GJ85DWXdjx0T+2jscBcvfHlnS1XBQ3nTSTdSUjmcOe76
         EJ0t5kEIPGzLvPDmojjhyjwqz5+mdF6mhz/L2NPLiGfLFk4V6Mo1p3OBPgetxdpGRPpf
         1DUQZN3vVHMyd6eQEBw3tzY3WkV+c/bjKDb/HdZCpz6t62Mz9Ck1Qk1YCq96Ov1L4P88
         A6TQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6BdV+HHcnGxppl4qSECG/LE6Gh2M0x0n+6XToAhZEaeG5CVprJln3701fL/OLQRVyQ7J/NFoyR0kGtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPGAa0pjKsdRmJcDch2LOf/EMuip+M7I9z1e1Nz13R9FIVSYPF
	U9emdsWiuZFVzBBtFGhjswd0B9zkK4/uvvP6grzp7bBiuZPe2BXyncUxJK1Rcd0=
X-Google-Smtp-Source: AGHT+IHTSbLYPW9H6IMMv3J9GeiSG052ik1ZNbE+SJ7zga3eJUIE3+gCfX95oRz+I+/KI8Ko3d5rzw==
X-Received: by 2002:a17:902:cec7:b0:20c:7d4c:64db with SMTP id d9443c01a7336-211b5d542aemr85459765ad.49.1731599449294;
        Thu, 14 Nov 2024 07:50:49 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7d377ecsm12256145ad.265.2024.11.14.07.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 07:50:48 -0800 (PST)
Date: Thu, 14 Nov 2024 07:50:45 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Nick Hu <nick.hu@sifive.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: Re: [PATCH v8 24/29] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
Message-ID: <ZzYcVW/4M0jab1T4@debug.ba.rivosinc.com>
References: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
 <20241111-v5_user_cfi_series-v8-24-dce14aa30207@rivosinc.com>
 <CAKddAkCCVjNHUinPWtOiK8Ki_ZkdoUCawfv1-+0B69J_1aJv5Q@mail.gmail.com>
 <ZzVNKvCu4MOs7O5z@debug.ba.rivosinc.com>
 <CAKddAkDbGYeONaksq6fzLzx47BHZo3Ar7Sog3MOgf7Y+Birovw@mail.gmail.com>
 <ZzVRbCZP9N4Os8Bj@debug.ba.rivosinc.com>
 <CAKddAkBCByf570PXfz798FtBbeGQWe2LJpdzxkE+jv3Zd3ZV1w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKddAkBCByf570PXfz798FtBbeGQWe2LJpdzxkE+jv3Zd3ZV1w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_075050_853367_8EA3A278 
X-CRM114-Status: GOOD (  20.47  )
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

CkhpIE5pY2ssCgpUaGFua3MgZm9yIHJldmlld2luZyBhbmQgaGVscGluZy4KCk9uIFRodSwgTm92
IDE0LCAyMDI0IGF0IDAyOjE3OjMwUE0gKzA4MDAsIE5pY2sgSHUgd3JvdGU6Cj5IaSBEZWVwYWsK
Pgo+T24gVGh1LCBOb3YgMTQsIDIwMjQgYXQgOToyNeKAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdA
cml2b3NpbmMuY29tPiB3cm90ZToKPj4KPj4gT24gVGh1LCBOb3YgMTQsIDIwMjQgYXQgMDk6MjA6
MTRBTSArMDgwMCwgTmljayBIdSB3cm90ZToKPj4gPkhpIERlZXBhawo+PiA+Cj4+ID5PbiBUaHUs
IE5vdiAxNCwgMjAyNCBhdCA5OjA24oCvQU0gRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+IHdyb3RlOgo+PiA+PiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5T
IGIvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4+ID4+ID4+IGluZGV4IDM1NmQ1Mzk3YjJhMi4u
NjI0NDQwOGNhOTE3IDEwMDY0NAo+PiA+PiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFk
LlMKPj4gPj4gPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4+ID4+ID4+IEBAIC0x
NjQsNiArMTY0LDEyIEBAIHNlY29uZGFyeV9zdGFydF9zYmk6Cj4+ID4+ID4+ICAgICAgICAgY2Fs
bCByZWxvY2F0ZV9lbmFibGVfbW11Cj4+ID4+ID4+ICAjZW5kaWYKPj4gPj4gPj4gICAgICAgICBj
YWxsIC5Mc2V0dXBfdHJhcF92ZWN0b3IKPj4gPj4gPj4gKyAgICAgICBsaSBhNywgU0JJX0VYVF9G
V0ZUCj4+ID4+ID4+ICsgICAgICAgbGkgYTYsIFNCSV9FWFRfRldGVF9TRVQKPj4gPj4gPj4gKyAg
ICAgICBsaSBhMCwgU0JJX0ZXRlRfU0hBRE9XX1NUQUNLCj4+ID4+ID4+ICsgICAgICAgbGkgYTEs
IDEgLyogZW5hYmxlIHN1cGVydmlzb3IgdG8gYWNjZXNzIHNoYWRvdyBzdGFjayBhY2Nlc3MgKi8K
Pj4gPj4gPj4gKyAgICAgICBsaSBhMiwgU0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSwo+PiA+PiA+PiAr
ICAgICAgIGVjYWxsCj4+ID4+ID4+ICAgICAgICAgc2NzX2xvYWRfY3VycmVudAo+PiA+PiA+PiAg
ICAgICAgIGNhbGwgc21wX2NhbGxpbgo+PiA+PiA+PiAgI2VuZGlmIC8qIENPTkZJR19TTVAgKi8K
Pj4gPj4gPj4gQEAgLTMyMCw2ICszMjYsMTIgQEAgU1lNX0NPREVfU1RBUlQoX3N0YXJ0X2tlcm5l
bCkKPj4gPj4gPj4gICAgICAgICBsYSB0cCwgaW5pdF90YXNrCj4+ID4+ID4+ICAgICAgICAgbGEg
c3AsIGluaXRfdGhyZWFkX3VuaW9uICsgVEhSRUFEX1NJWkUKPj4gPj4gPj4gICAgICAgICBhZGRp
IHNwLCBzcCwgLVBUX1NJWkVfT05fU1RBQ0sKPj4gPj4gPj4gKyAgICAgICBsaSBhNywgU0JJX0VY
VF9GV0ZUCj4+ID4+ID4+ICsgICAgICAgbGkgYTYsIFNCSV9FWFRfRldGVF9TRVQKPj4gPj4gPj4g
KyAgICAgICBsaSBhMCwgU0JJX0ZXRlRfU0hBRE9XX1NUQUNLCj4+ID4+ID4+ICsgICAgICAgbGkg
YTEsIDEgLyogZW5hYmxlIHN1cGVydmlzb3IgdG8gYWNjZXNzIHNoYWRvdyBzdGFjayBhY2Nlc3Mg
Ki8KPj4gPj4gPj4gKyAgICAgICBsaSBhMiwgU0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSwo+PiA+PiA+
PiArICAgICAgIGVjYWxsCj4+ID4+ID4+ICAgICAgICAgc2NzX2xvYWRfY3VycmVudAo+PiA+PiA+
Pgo+PiA+PiA+PiAgI2lmZGVmIENPTkZJR19LQVNBTgo+PiA+PiA+Pgo+PiA+PiA+PiAtLQo+PiA+
PiA+PiAyLjQ1LjAKPj4gPj4gPj4KPj4gPj4gPlNob3VsZCB3ZSBjbGVhciB0aGUgU0JJX0ZXRlRf
U0VUX0ZMQUdfTE9DSyBiZWZvcmUgdGhlIGNwdSBob3RwbHVnCj4+ID4+ID5vdGhlcndpc2UgdGhl
IG1lbnZjZmcuc3NlIHdvbid0IGJlIHNldCBieSB0aGUgZndmdCBzZXQgc2JpIGNhbGwgd2hlbgo+
PiA+PiA+dGhlIGhvdHBsdWcgY3B1IGJhY2sgdG8ga2VybmVsPwo+PiA+Pgo+PiA+PiBIbW0uLi4K
Pj4gPj4KPj4gPj4gQW4gaW5jb21pbmcgaG90cGx1ZyBDUFUgaGFzIG5vIGZlYXR1cmVzIHNldHVw
IG9uIGl0Lgo+PiA+PiBJIHNlZSB0aGF0IGBzYmlfY3B1X3N0YXJ0YCB3aWxsIHN1cHBseSBgc2Vj
b25kYXJ5X3N0YXJ0X3NiaWAgYXMgc3RhcnQKPj4gPj4gdXAgY29kZSBmb3IgaW5jb21pbmcgQ1BV
LiBgc2Vjb25kYXJ5X3N0YXJ0X3NiaWAgaXMgaW4gaGVhZC5TIHdoaWNoIGNvbnZlcmdlcwo+PiA+
PiBpbiBgLkxzZWNvbmRhcnlfc3RhcnRfY29tbW9uYC4gQW5kIHRodXMgaG90cGx1Z2dlZCBDUFUg
c2hvdWxkIGJlCj4+ID4+IGlzc3Vpbmcgc2hhZG93IHN0YWNrIHNldCBGV0ZUIHNiaSBhcyB3ZWxs
Lgo+PiA+Pgo+PiA+PiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nID8KPj4gPj4KPj4gPlRoaXMgaXMg
dGhlIGNvcnJlY3QgZmxvdy4gSG93ZXZlciB0aGUgb3BlbnNiaSB3aWxsIGRlbnkgaXQgZHVlIHRv
IHRoZQo+PiA+U0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSyBhbHJlYWR5IGJlaW5nIHNldC4KPj4gPlNv
IHRoZSBtZW52Y2ZnLnNzZSB3aWxsIG5vdCBzZXQgYnkgdGhpcyBmbG93Lgo+PiA+Cj4+ID5pZiAo
Y29uZi0+ZmxhZ3MgJiBTQklfRldGVF9TRVRfRkxBR19MT0NLKQo+PiA+ICAgICAgICAgICAgICAg
IHJldHVybiBTQklfRURFTklFRDsKPj4gPgo+Pgo+PiBobW0uLi4gV2h5Pwo+Pgo+PiBgY29uZmAg
aXMgcG9pbnRpbmcgdG8gcGVyLWhhcnQgc3RhdGUgaW4gZmlybXdhcmUuCj4+Cj4+IE9uIHRoaXMg
aW5jb21pbmcgY3B1LCBvcGVuc2JpIChvciBlcXVpdmFsZW50KSBmaXJtd2FyZSBtdXN0IGhhdmUK
Pj4gZW5zdXJlZCB0aGF0IHRoaXMgcGVyLWhhcnQgc3RhdGUgZG9lc24ndCBoYXZlIGxvY2sgc2V0
Lgo+Pgo+PiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nPwo+Pgo+Q3VycmVudCBPcGVuU0JJIGRvZXNu
J3QgY2xlYXIgdGhlIGxvY2sgaW4gdGhlIHdhcm0gaW5pdCBvZiB0aGUgaG90cGx1ZyBwYXRoLgo+
SXQgc2VlbXMgbGlrZSB3ZSBuZWVkIGEgcGF0Y2ggdG8gYWRkcmVzcyBpdC4KCkdvdCBpdCB0aGFu
a3MuClNpbmNlIHlvdSBhbHJlYWR5IGtub3cgd2hhdCdzIHRoZSBwcm9ibGVtLCBjYW4geW91IHNl
bmQgYSBwYXRjaCB0byBvcGVuc2JpLgpJZiB5b3Ugd2FudCByYXRoZXIgaGF2ZSBtZSBkbyBpdCwg
bGV0IG1lIGtub3cuIFRoYW5rcy4KCj4KPlJlZ2FyZHMsCj5OaWNrCj4+ID5SZWdhcmRzLAo+PiA+
Tmljawo+PiA+PiA+Cj4+ID4+ID5SZWdhcmRzLAo+PiA+PiA+Tmljawo+PiA+PiA+Pgo+PiA+PiA+
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiA+PiA+
PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4gPj4gPj4gbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+PiA+PiA+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
