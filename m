Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6317C2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 21:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0E6lsk7FvjosWTwSFhqZJNCkEknDAlvNmEiZB6/4OE=; b=vkwVphvNz/Q9yV
	MUo5H6nAx0tctp45qTmhw3jioJ85OCtKR6/Ylh3rABNghC35AijlCG26vnTdsLdyPgpPUb/SZSeam
	lTIWEJRURfjkGkWK1etDZqqDrNY1sx0a7EdOfVsZ4zmAfMrPfAPg8NERmoSU3sPBxj4AUOcLzgLP6
	LU5yFD2usT7l/8DTBZ2NV4RyaCOB791v0DBOLB/FVcZd4zTmjs9cWAzy7MK5QYybZdDUsem6SHViU
	zblZXCjFpF+To3J5moDFhVHmAKSvayzZjHyl2CiPsIIm2TpMCMfYX9jUKebFQ9AbXIlrutPOfX/5A
	DpYQi7XXg/xap2eU0qgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7pr-0000000BYTp-0uRH;
	Wed, 03 Jul 2024 21:48:19 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7po-0000000BYRt-0GKB
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 21:48:17 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-70afe18837cso17452b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jul 2024 14:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720043295; x=1720648095; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UChrIK89B9K7cuKgj8bOFdUeR8mLezBJok3MLp29Mcs=;
        b=Gb4YR/sxVDslCNJqvM8CW9z/27LnBsOGbJjFLB8I+VlIsXiDQfj6oIpO6nL0J8pKh2
         RyI/XNzWUgexMTTbfO4GKY6YIu6OWwYi262m8eT2kN6UMQ9ywMZLDgHKDA1P+IGTqhDP
         g1ERuYCt93ZeKfZHq7qxLhsvlIzag2DW7b2wK1iX1Km719IWFpz4PogR9My5k4APSg/W
         yxvzctITmqjOeiAtQVH/MQ2/0nL0jvxTUiQtHhdrYx3GcEHnyxJos6c4vgIGS+c69tuT
         uhWVHMPE/qvE/pc4qeRsUUsr3CBF4B5QnbWz4w7WZ8a9byffYTLLj/dsZ+xjURMErYlJ
         3Q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720043295; x=1720648095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UChrIK89B9K7cuKgj8bOFdUeR8mLezBJok3MLp29Mcs=;
        b=q0wUfBUNuRUoxDgWYTWPC4S7ptvRclFikkRL0lwYp9skDWgfcL7dMfQKCY0zoco4g/
         0g7kFqbJ4vvtSEWZDi5WB04SiwfHfXegRD7vwuQnOCc2/Ef6vD95ePUCw+QqYaQwcfmk
         flhwRQsd68RwQv1i/b7w4a8O8aRJPH+kBNyKKKSd9bfL9WzD6dBxlizLsOJHCuqQfh3w
         ow3tymaJgjXrBN/U4yiJsLW+KO3kWWBUUebXgQ3OzCdYzKN+OUWmKhBXrneOi655HGLg
         4xBb6Gubl5gA/fFyPqziT4MLHQ1dRzh/0LPvcRcH3lWEB/0UV6RW+GjJPwrHrqkSFY1z
         5Y7g==
X-Forwarded-Encrypted: i=1; AJvYcCUixQviGqD3wvlKKVWY0WSiT+ZwZP1pWkuGWezYVg6Btt7JBmCw7w+DgjYi1zy+cHErvMXqnLSYVknHVxTvncKWru5RoH3V2Ss6xQn1+y07
X-Gm-Message-State: AOJu0Yx/mKNOQ4ebuPerwuG4ItSxEMKuLN8giJC5OEudJDZQXsBI9Bc7
	cYK0xYwe1KJ/0K/BYkZgy0nilJn7EUpUNPspEjSZuY3wEu/RiIX4/eO8B1wvEp4=
X-Google-Smtp-Source: AGHT+IGCFvZKLFgfmIruwOMYP5UweFpC7y18o0GWCxrjodbL6cekNPIX/dzwODmQX9gRejI2KQfg1g==
X-Received: by 2002:a05:6a00:2e18:b0:70a:f0a3:dbc2 with SMTP id d2e1a72fcca58-70af0a3dfc7mr2807543b3a.30.1720043294835;
        Wed, 03 Jul 2024 14:48:14 -0700 (PDT)
Received: from [10.4.10.38] (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70afa00122asm526367b3a.112.2024.07.03.14.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 14:48:14 -0700 (PDT)
Message-ID: <3da77593-bc22-46e6-9cff-dd7f8eb02cd9@rivosinc.com>
Date: Wed, 3 Jul 2024 17:47:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] RISC-V: Check Zicclsm to set unaligned access
 speed
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
 Eric Biggers <ebiggers@google.com>, Greentime Hu <greentime.hu@sifive.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240625005001.37901-1-jesse@rivosinc.com>
 <20240625005001.37901-5-jesse@rivosinc.com>
 <20240626-march-abreast-83414e844250@spud> <Zn3XrLRl/yazsoZe@ghost>
 <43941f48-9905-4b25-89ef-6ad75bf1a123@rivosinc.com>
 <20240701-ajar-italicize-9e3d9b8a0264@spud>
 <ef639748-3979-4236-b48d-c0c44e2d5ad2@rivosinc.com> <ZoR9swwgsGuGbsTG@ghost>
 <af3152b6-adf7-40fa-b2a1-87e66eec45b0@rivosinc.com>
Content-Language: en-US
From: Jesse Taube <jesse@rivosinc.com>
In-Reply-To: <af3152b6-adf7-40fa-b2a1-87e66eec45b0@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144816_149619_7413A344 
X-CRM114-Status: GOOD (  31.58  )
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

CgpPbiA3LzMvMjQgMDM6MTMsIENsw6ltZW50IEzDqWdlciB3cm90ZToKPiAKPiAKPiBPbiAwMy8w
Ny8yMDI0IDAwOjIyLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4+IE9uIE1vbiwgSnVsIDAxLCAy
MDI0IGF0IDA0OjIwOjE1UE0gKzAyMDAsIENsw6ltZW50IEzDqWdlciB3cm90ZToKPj4+Cj4+Pgo+
Pj4gT24gMDEvMDcvMjAyNCAxNTo1OCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+Pj4+IE9uIE1vbiwg
SnVsIDAxLCAyMDI0IGF0IDA5OjE1OjA5QU0gKzAyMDAsIENsw6ltZW50IEzDqWdlciB3cm90ZToK
Pj4+Pj4KPj4+Pj4KPj4+Pj4gT24gMjcvMDYvMjAyNCAyMzoyMCwgQ2hhcmxpZSBKZW5raW5zIHdy
b3RlOgo+Pj4+Pj4gT24gV2VkLCBKdW4gMjYsIDIwMjQgYXQgMDM6Mzk6MTRQTSArMDEwMCwgQ29u
b3IgRG9vbGV5IHdyb3RlOgo+Pj4+Pj4+IE9uIE1vbiwgSnVuIDI0LCAyMDI0IGF0IDA4OjQ5OjU3
UE0gLTA0MDAsIEplc3NlIFRhdWJlIHdyb3RlOgo+Pj4+Pj4+PiBDaGVjayBmb3IgWmljY2xzbSBi
ZWZvcmUgY2hlY2tpbmcgZm9yIHVuYWxpZ25lZCBhY2Nlc3Mgc3BlZWQuIFRoaXMgd2lsbAo+Pj4+
Pj4+PiBncmVhdGx5IHJlZHVjZSB0aGUgYm9vdCB1cCB0aW1lIGFzIGZpbmRpbmcgdGhlIGFjY2Vz
cyBzcGVlZCBpcyBubyBsb25nZXIKPj4+Pj4+Pj4gbmVjZXNzYXJ5Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBKZXNzZSBUYXViZSA8amVzc2VAcml2b3NpbmMuY29tPgo+Pj4+Pj4+
PiAtLS0KPj4+Pj4+Pj4gVjIgLT4gVjM6Cj4+Pj4+Pj4+ICAgLSBOZXcgcGF0Y2ggc3BsaXQgZnJv
bSBwcmV2aW91cyBwYXRjaAo+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4gICBhcmNoL3Jpc2N2L2tlcm5l
bC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMgfCAyNiArKysrKysrKysrKysrKy0tLS0tLS0tCj4+
Pj4+Pj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWdu
ZWRfYWNjZXNzX3NwZWVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3Nw
ZWVkLmMKPj4+Pj4+Pj4gaW5kZXggYTlhNmJjYjAyYWNmLi4zMjlmZDI4OWI1YzggMTAwNjQ0Cj4+
Pj4+Pj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYwo+
Pj4+Pj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMK
Pj4+Pj4+Pj4gQEAgLTI1OSwyMyArMjU5LDMxIEBAIHN0YXRpYyBpbnQgY2hlY2tfdW5hbGlnbmVk
X2FjY2Vzc19zcGVlZF9hbGxfY3B1cyh2b2lkKQo+Pj4+Pj4+PiAgIAlrZnJlZShidWZzKTsKPj4+
Pj4+Pj4gICAJcmV0dXJuIDA7Cj4+Pj4+Pj4+ICAgfQo+Pj4+Pj4+PiArI2Vsc2UgLyogQ09ORklH
X1JJU0NWX1BST0JFX1VOQUxJR05FRF9BQ0NFU1MgKi8KPj4+Pj4+Pj4gK3N0YXRpYyBpbnQgY2hl
Y2tfdW5hbGlnbmVkX2FjY2Vzc19zcGVlZF9hbGxfY3B1cyh2b2lkKQo+Pj4+Pj4+PiArewo+Pj4+
Pj4+PiArCXJldHVybiAwOwo+Pj4+Pj4+PiArfQo+Pj4+Pj4+PiArI2VuZGlmCj4+Pj4+Pj4+ICAg
Cj4+Pj4+Pj4+ICAgc3RhdGljIGludCBjaGVja191bmFsaWduZWRfYWNjZXNzX2FsbF9jcHVzKHZv
aWQpCj4+Pj4+Pj4+ICAgewo+Pj4+Pj4+PiAtCWJvb2wgYWxsX2NwdXNfZW11bGF0ZWQgPSBjaGVj
a191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKCk7Cj4+Pj4+Pj4+ICsJYm9vbCBh
bGxfY3B1c19lbXVsYXRlZDsKPj4+Pj4+Pj4gKwlpbnQgY3B1Owo+Pj4+Pj4+PiArCj4+Pj4+Pj4+
ICsJaWYgKHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9aSUNDTFNN
KSkgewo+Pj4+Pj4+PiArCQlmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkgewo+Pj4+Pj4+PiArCQkJ
cGVyX2NwdShtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1KSA9IFJJU0NWX0hXUFJPQkVfTUlT
QUxJR05FRF9GQVNUOwo+Pj4+Pj4+Cj4+Pj4+Pj4gLSBjb25zdDogemljY2xzbQo+Pj4+Pj4+ICAg
IGRlc2NyaXB0aW9uOgo+Pj4+Pj4+ICAgICAgVGhlIHN0YW5kYXJkIFppY2Nsc20gZXh0ZW5zaW9u
IGZvciBtaXNhbGlnbmVkIHN1cHBvcnQgZm9yIGFsbCByZWd1bGFyCj4+Pj4+Pj4gICAgICBsb2Fk
IGFuZCBzdG9yZSBpbnN0cnVjdGlvbnMgKGluY2x1ZGluZyBzY2FsYXIgYW5kIHZlY3RvcikgYnV0
IG5vdCBBTU9zCj4+Pj4+Pj4gICAgICBvciBvdGhlciBzcGVjaWFsaXplZCBmb3JtcyBvZiBtZW1v
cnkgYWNjZXNzLiBEZWZpbmVkIGluIHRoZQo+Pj4+Pj4+ICAgICAgUklTQy1WIFJWQSBQcm9maWxl
cyBTcGVjaWZpY2F0aW9uLgo+Pj4+Pj4+Cj4+Pj4+Pj4gRG9lc24ndCwgdW5mb3J0dW5hdGVseSwg
c2F5IGFueXdoZXJlIHRoZXJlIHRoYXQgdGhleSdyZSBhY3R1YWxseSBmYXN0IDooCj4+Pj4+Pgo+
Pj4+Pj4gT2ggbm8hIFRoYXQgaXMgdW5mb3J0dW5hdGUgdGhhdCB0aGUgSVNBIGRvZXMgbm90IGV4
cGxpY2l0bHkgY2FsbCB0aGF0Cj4+Pj4+PiBvdXQsIGJ1dCBJIHRoaW5rIHRoYXQgYWNjZXB0YWJs
ZS4KPj4+Pj4+Cj4+Pj4+PiBJZiBhIHZlbmRvciBwdXRzIFppY2Nsc20gaW4gdGhlaXIgaXNhIHN0
cmluZywgdGhleSBzaG91bGQgZXhwZWN0Cj4+Pj4+PiBzb2Z0d2FyZSB0byB0YWtlIGFkdmFudGFn
ZSBvZiBtaXNhbGlnbmVkIGFjY2Vzc2VzLiBGQVNUIGlzIG91ciBzaWduYWwgdG8KPj4+Pj4+IHRl
bGwgc29mdHdhcmUgdGhhdCB0aGV5IHNob3VsZCBlbWl0IG1pc2FsaWduZWQgYWNjZXNzZXMuCj4+
Pj4+Cj4+Pj4+IEFGQUlLLCBaaWNjbHNtIGlzIG5vdCBldmVuIGFuIElTQSBleHRlbnNpb24sIHNp
bXBseSBhIHByb2ZpbGUKPj4+Pj4gc3BlY2lmaWNhdGlvbiB3aGljaCBtZWFucyB0aGF0IG9ubHkg
dGhlIGV4ZWN1dGlvbiBlbnZpcm9ubWVudCB3aGljaAo+Pj4+PiBwcm92aWRlcyB0aGUgcHJvZmls
ZSBzdXBwb3J0IG1pc2FsaWduZWQgYWNjZXNzZXMgKGNmCj4+Pj4+IGh0dHBzOi8vbGlzdHMucmlz
Y3Yub3JnL2cvdGVjaC1wcm9maWxlcy9tZXNzYWdlLzU2KS4KPj4+Pgo+Pj4+IEkgZHVubm8sIHRo
ZSBzcGVjaWZpY2F0aW9uIHN0YXR1cyBwYWdlIHVzZWQgdG8gZGVzY3JpYmUgaXQgYXMgYW4KPj4+
PiBleHRlbnNpb246Cj4+Pj4gaHR0cHM6Ly93aWtpLnJpc2N2Lm9yZy9kaXNwbGF5L0hPTUUvU3Bl
Y2lmaWNhdGlvbitTdGF0dXMrLStIaXN0b3JpY2FsCj4+Pj4gTXkgdW5kZXJzdGFuZGluZyB3YXMg
dGhhdCB0aGVzZSBjb3VsZCBiZSBjb25zaWRlcmVkIGV4dGVuc2lvbnMsIGp1c3QKPj4+PiBsaWtl
IHdlIGFyZSBjb25zaWRlcmluZyBzdmFkZSB0byBiZSBvbmUuCj4+Pj4KPj4+Pj4gLiBJIGRvbid0
IHRoaW5rIHdlCj4+Pj4+IGNhbiBleHRyYXBvbGF0ZSB0aGF0IHRoZSBtaXNhbGlnbmVkIGFjY2Vz
c2VzIHdpbGwgYmUgZmFzdCBhdCBhbGwuCj4+Pj4KPj4+PiBUaGF0IGlzIG15IG9waW5pb24gb24g
aXQgdG9vLiBJZiBpdCBkb2Vzbid0IHNheSAiZmFzdCIgYW5kIGdpdmUgYQo+Pj4+IGRlZmluaXRp
b24gZm9yIHdoYXQgdGhhdCBtZWFucyBpbiB0aGUgYmluZGluZywgdGhlbiB3ZSBjYW4ndCBhc3N1
bWUgdGhhdAo+Pj4+IGl0IGlzIGZhc3QuIEknbSBhbHNvIHdhcnkgb2YgZXh0ZW5kaW5nIGRlZmlu
aXRpb25zIG9mIGV4dGVuc2lvbnMgaW4gdGhlCj4+Pj4gYmluZGluZywgYmVjYXVzZSBhKSBJIGFt
IDkwJSBzdXJlIHRoYXQgcGVvcGxlIHdyaXRpbmcgZGV2aWNldHJlZXMgZG9uJ3QKPj4+PiBjYXJl
IGFuZCBiKSBpdCdkIGJlIGEgcG90ZW50aWFsIGRpZmZlcmVuY2UgYmV0d2VlbiBEVCBhbmQgQUNQ
SSB3aXRob3V0IGEKPj4+PiByZWFsIGp1c3RpZmljYXRpb24gKHVubGlrZSB0aGUgemtyIG9yIHN2
YWRlL3N2YWR1IHNpdHVhdGlvbnMpLgo+Pj4KPj4+IEJUVywgdGhlIHByb2ZpbGUgc3BlYyBbMV0g
aGFzIGEgbm90ZSB0aGF0IHN0YXRlcyB0aGUgZm9sbG93aW5nIGZvciBaaWNjbHNtOgo+Pj4KPj4+
ICJFdmVuIHRob3VnaCBtYW5kYXRlZCwgbWlzYWxpZ25lZCBsb2FkcyBhbmQgc3RvcmVzIG1pZ2h0
IGV4ZWN1dGUKPj4+IGV4dHJlbWVseSBzbG93bHkuIFN0YW5kYXJkIHNvZnR3YXJlIGRpc3RyaWJ1
dGlvbnMgc2hvdWxkIGFzc3VtZSB0aGVpcgo+Pj4gZXhpc3RlbmNlIG9ubHkgZm9yIGNvcnJlY3Ru
ZXNzLCBub3QgZm9yIHBlcmZvcm1hbmNlLiIKPj4+Cj4+PiBXaGljaCB3YXMgYWxzbyBxdW90ZWQg
aW4gcGF0Y2ggMSwgc28gSSBndWVzcyB0aGF0IHNldHRsZXMgaXQuCj4+Cj4+IFRoZSBpbnRlbnRp
b24gaGVyZSB3YXMgdG8gYWxsb3cgdmVuZG9ycyB0byBjb25maWd1cmUgYW4gb3B0aW9uIHRvIHNr
aXAKPj4gdGhlIHByb2JpbmcuIFRoaXMgZXh0ZW5zaW9uIGRvZXMgbm90IHNlZW0gdXNlZnVsIGFz
IGl0IGlzIHdyaXR0ZW4hIEEgd2F5Cj4+IGFyb3VuZCB0aGlzIHdvdWxkIGJlIHRvIGFkZCBhIGtl
cm5lbCBhcmcgdG8gc2V0IHRoZSBhY2Nlc3Mgc3BlZWQgYnV0Cj4+IG1heWJlIGl0IGRvZXNuJ3Qg
bWF0dGVyLiBGb3IgdGhlIHNha2Ugb2YgdGhpcyBwYXRjaCwgaXQgbG9va3MgbGlrZSB3ZQo+PiBz
aG91bGQgZ2V0IHJpZCBvZiB0aGlzIFppY2Nsc20gY2hlY2suCj4gCj4gSSB0aGluayBhIHBhcmFt
ZXRlciBjb3VsZCBiZSBhcHByb3ByaWF0ZSBmb3IgdmVuZG9ycyB0aGF0IHdhbnQgdG8gc2tpcAo+
IHRoZSBwcm9iaW5nIGFuZCBnYWluIGEgYml0IG9mIHRpbWUgb24gYm9vdCB0aW1lLiBPdGhlciBv
cHRpb25zIGFscmVhZHkKPiBleGlzdHMgdG8gZm9yY2Ugc3BlY2lmaWMgc2V0dGluZ3Mgc28sIHdo
eSBub3QgIQoKU291bmRzIGxpa2UgYSBnb29kIHNvbHV0aW9uIHRoYW5rcyBmb3IgdGhlIGlkZWEg
Q2hhcmxpZSEKSSB3aWxsIGRyb3AgdGhpcyBwYXRjaCBhbmQgc2VuZCBhIHNlcGFyYXRlIHBhdGNo
IHRvIGltcGxlbWVudCB0d28ga2VybmVsIApwYXJhbWV0ZXJzIGZvciBza2lwcGluZyhhbmQgc2V0
dGluZyB0aGUgc3BlZWQgb2YpIHZlY3RvciBhbmQgc2NhbGFyIApzcGVlZCB0ZXN0cy4KClRoYW5r
cywKSmVzc2UgVGF1YmUKCj4gCj4gVGhhbmtzLAo+IAo+IENsw6ltZW50Cj4gCj4+Cj4+IC0gQ2hh
cmxpZQo+Pgo+Pj4KPj4+IFRoYW5rcywKPj4+Cj4+PiBDbMOpbWVudAo+Pj4KPj4+IExpbms6Cj4+
PiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtcHJvZmlsZXMvYmxvYi9tYWluL3NyYy9w
cm9maWxlcy5hZG9jP3BsYWluPTEjTDUyNAo+Pj4gWzFdCj4+Pgo+Pj4+Cj4+Pj4+PiBUaGlzIGFs
bG93cyBmb3IgYSBnZW5lcmljIGtlcm5lbCwgbGlrZSB0aGUgb25lIGEgZGlzdHJvIHdvdWxkIGNv
bXBpbGUsIHRvCj4+Pj4+PiBza2lwIHRoZSBwcm9iaW5nIHdoZW4gYm9vdGluZyBvbiBhIHN5c3Rl
bSB0aGF0IGV4cGxpY2l0bHkgY2FsbGVkIG91dAo+Pj4+Pj4gdGhhdCB0aGUgaGFyZHdhcmUgc3Vw
cG9ydHMgbWlzYWxpZ25lZCBhY2Nlc3Nlcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
