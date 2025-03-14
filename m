Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC56CC35FF1
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 08:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cl96qnAnLORy0coPGZ5HM3rrwstEqTRjRpnHRpFMZzk=; b=hai1JK7nCfttZ+
	uztTrUUbarh8BWrCZ20S44mjV/DGg1iJXAx4x9oWmxYNcIjSweJAgqdcXrnCNtb2lk8xG6TZyEexk
	/BlKK6wnbwz4H2rFwRmiKd/ESKA+BtlKhC4ExziGeWogGW1WPKJM4h0VoqiSvJP8g1yNxrZNOTH4R
	xMcD5AAtdX7L0pEc7cSwm0DbxUpXS2C3+snHvri1tHeKHfF3lPFUqK3F/gEFXiyLtPkaRnbuGDHNP
	daO+gLNrl+0gnFvwMLG9+oWfK58/aMkscNcjbHYmJ+jl2kSeeGN7Vo+D8tjD4Y+qAUHcRxm/rfFPt
	UvC0KG2PluAdMYwIJuIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0lK-0000000DXMt-2HuR;
	Fri, 14 Mar 2025 08:51:26 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0TW-0000000DUNu-1P4X
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 08:33:03 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3d445a722b9so10672995ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 01:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741941181; x=1742545981; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CV+0B9PMq9Sjr8aBQyixXXym4Bdz4psV6MbgJ2u7viA=;
        b=QhB/lJQGVyIgh+jpoupjUtUXOBrx3AJTfDemjFmaoy6LGeHijGdL+J6enoHCJu7Nms
         ZywnOd6uGWycoHy4zBY9h8TyCWrBZGA1ACk0T6k+ExaOxtWh5MZvajRkN/0irJS3sorY
         NQ/te/9I97QaNzNNcB5XfJIOULyS0ANyJONXucAl0QBaPpgnF7r7kWTdH5cgrPlf2o/t
         92SYTf+5cQyJdzg/7xtcQ9SoYKgNXocYFdgOKYnOWZPK+54WOzJmr6SknRaK9K7Limsm
         gsWviz5MF43++SGDPIoH3uae8ad8Kf0MJ7sdSysWmIcByS0Mk98gKtPn722DF7/SA9pZ
         Av0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741941181; x=1742545981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CV+0B9PMq9Sjr8aBQyixXXym4Bdz4psV6MbgJ2u7viA=;
        b=w3F1iQco+ns6lq95e6QXsnKm6bFw1QuragyQKl5uSlZ9dPXQ+9AcfIQxiaaXTYwLFQ
         ayUv6cmJL+K5Zq8PYmVcvDHTXCobxTxg5/guSHsC6pQ4fXWferB/frpWfPJg+VcNH0iZ
         FjCYwydyCF5CwRg/wuLEpPJ3Y1ARNDeHj5+iJkuyhz+lWPl71UvxzBuRUhhTLIrMrfNz
         PBKPIBaRdKCPqqRtQdS5EsniZ6smTrnLrZfHv/ouTZuAj6Euzk8D2ACl8KzqOpljmJMO
         HD+J8H86dak3ME56ffBqAaG6gjLTt/ja8CW9cdauDKoqqKowa9+m9IA8m1dKWaoA84Yv
         iG6Q==
X-Forwarded-Encrypted: i=1; AJvYcCViD/Szaf2wngmkj2zoHQ2wVJWE3AsMKf4p0u1WJ/hdQzfOU0eXQKi30xT0Sgl724kQxXJ+gIKYeMErag==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVM6S2W78oToSSKNalV5BZHutr5XhKDBnI+GsMJ0BKSkR0gFKN
	4DgrikjwuvEXaFqNXch8/Q0dZFzD9Xy8RHgJYynGvoBUmmJhPXYKWWySc3xqh8YiZmOPxC9bmjN
	60KTX9TD2R2tLyJIx5kuLLOLc71pUtbzmb2hZ6w==
X-Gm-Gg: ASbGncvFgWMqBYvFmmNtpdsdeA6AfTu1UgecOSGap8m9kN6GkLqhmlYROJwb4l/Nhvb
	MXVCpMDzvUXEtpu9nTCDsWrzgcwKgsLYFj/j7TaAgMlEGait99aLK1HvloMZmjTfumrEoS6CfJD
	9anj2nb1sDwbbP2+g7rZYcoQEpX3g=
X-Google-Smtp-Source: AGHT+IEK8x1+7mzx/mnDrC0M1b3ETC4HGejLwUZPvYTs3VLjL6kfJlzbOoQCxNSGwzcmIdWjSKb0aGOGjwHoH1VTRPk=
X-Received: by 2002:a05:6e02:1747:b0:3d4:3ab3:e1a4 with SMTP id
 e9e14a558f8ab-3d483a8a2femr13198795ab.22.1741941181448; Fri, 14 Mar 2025
 01:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com> <20250310-v5_user_cfi_series-v11-20-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-20-86b36cbfb910@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 14 Mar 2025 16:32:50 +0800
X-Gm-Features: AQ5f1JroBVweXAVM7x9VC6V9Zhe5tUAc0jIbedQxG7U-9QMDJKkaaRUA9PVo_hg
Message-ID: <CANXhq0oC4mgVRjQ0ZCdnqZupitJaGOb1_=Goad8bbqkAY_bqbg@mail.gmail.com>
Subject: Re: [PATCH v11 20/27] riscv: Add Firmware Feature SBI extensions definitions
To: Deepak Gupta <debug@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_013302_373942_47F0B4AC 
X-CRM114-Status: GOOD (  15.77  )
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

T24gTW9uLCBNYXIgMTAsIDIwMjUgYXQgMTE6NDLigK9QTSBEZWVwYWsgR3VwdGEgPGRlYnVnQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZv
c2luYy5jb20+Cj4KPiBBZGQgbmVjZXNzYXJ5IFNCSSBkZWZpbml0aW9ucyB0byB1c2UgdGhlIEZX
RlQgZXh0ZW5zaW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJA
cml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgMjYg
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+IGluZGV4IDNkMjUwODI0MTc4Yi4uMjNiZmIyNTRl
M2Y0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPiArKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gQEAgLTM1LDYgKzM1LDcgQEAgZW51bSBzYmlf
ZXh0X2lkIHsKPiAgICAgICAgIFNCSV9FWFRfREJDTiA9IDB4NDQ0MjQzNEUsCj4gICAgICAgICBT
QklfRVhUX1NUQSA9IDB4NTM1NDQxLAo+ICAgICAgICAgU0JJX0VYVF9OQUNMID0gMHg0RTQxNDM0
QywKPiArICAgICAgIFNCSV9FWFRfRldGVCA9IDB4NDY1NzQ2NTQsCj4KPiAgICAgICAgIC8qIEV4
cGVyaW1lbnRhbHMgZXh0ZW5zaW9ucyBtdXN0IGxpZSB3aXRoaW4gdGhpcyByYW5nZSAqLwo+ICAg
ICAgICAgU0JJX0VYVF9FWFBFUklNRU5UQUxfU1RBUlQgPSAweDA4MDAwMDAwLAo+IEBAIC00MDEs
NiArNDAyLDMxIEBAIGVudW0gc2JpX2V4dF9uYWNsX2ZlYXR1cmUgewo+Cj4gICNkZWZpbmUgU0JJ
X05BQ0xfU0hNRU1fU1JFVF9YKF9faSkgICAgICAgICAgICAgKChfX3Jpc2N2X3hsZW4gLyA4KSAq
IChfX2kpKQo+ICAjZGVmaW5lIFNCSV9OQUNMX1NITUVNX1NSRVRfWF9MQVNUICAgICAgICAgICAg
IDMxCj4gKy8qIFNCSSBmdW5jdGlvbiBJRHMgZm9yIEZXIGZlYXR1cmUgZXh0ZW5zaW9uICovCj4g
KyNkZWZpbmUgU0JJX0VYVF9GV0ZUX1NFVCAgICAgICAgICAgICAgIDB4MAo+ICsjZGVmaW5lIFNC
SV9FWFRfRldGVF9HRVQgICAgICAgICAgICAgICAweDEKPiArCj4gK2VudW0gc2JpX2Z3ZnRfZmVh
dHVyZV90IHsKPiArICAgICAgIFNCSV9GV0ZUX01JU0FMSUdORURfRVhDX0RFTEVHICAgICAgICAg
ICA9IDB4MCwKPiArICAgICAgIFNCSV9GV0ZUX0xBTkRJTkdfUEFEICAgICAgICAgICAgICAgICAg
ICA9IDB4MSwKPiArICAgICAgIFNCSV9GV0ZUX1NIQURPV19TVEFDSyAgICAgICAgICAgICAgICAg
ICA9IDB4MiwKPiArICAgICAgIFNCSV9GV0ZUX0RPVUJMRV9UUkFQICAgICAgICAgICAgICAgICAg
ICA9IDB4MywKPiArICAgICAgIFNCSV9GV0ZUX1BURV9BRF9IV19VUERBVElORyAgICAgICAgICAg
ICA9IDB4NCwKPiArICAgICAgIFNCSV9GV0ZUX0xPQ0FMX1JFU0VSVkVEX1NUQVJUICAgICAgICAg
ICA9IDB4NSwKPiArICAgICAgIFNCSV9GV0ZUX0xPQ0FMX1JFU0VSVkVEX0VORCAgICAgICAgICAg
ICA9IDB4M2ZmZmZmZmYsCj4gKyAgICAgICBTQklfRldGVF9MT0NBTF9QTEFURk9STV9TVEFSVCAg
ICAgICAgICAgPSAweDQwMDAwMDAwLAo+ICsgICAgICAgU0JJX0ZXRlRfTE9DQUxfUExBVEZPUk1f
RU5EICAgICAgICAgICAgID0gMHg3ZmZmZmZmZiwKPiArCj4gKyAgICAgICBTQklfRldGVF9HTE9C
QUxfUkVTRVJWRURfU1RBUlQgICAgICAgICAgPSAweDgwMDAwMDAwLAo+ICsgICAgICAgU0JJX0ZX
RlRfR0xPQkFMX1JFU0VSVkVEX0VORCAgICAgICAgICAgID0gMHhiZmZmZmZmZiwKPiArICAgICAg
IFNCSV9GV0ZUX0dMT0JBTF9QTEFURk9STV9TVEFSVCAgICAgICAgICA9IDB4YzAwMDAwMDAsCj4g
KyAgICAgICBTQklfRldGVF9HTE9CQUxfUExBVEZPUk1fRU5EICAgICAgICAgICAgPSAweGZmZmZm
ZmZmLAo+ICt9Owo+ICsKPiArI2RlZmluZSBTQklfRldGVF9HTE9CQUxfRkVBVFVSRV9CSVQgICAg
ICAgICAgICAoMSA8PCAzMSkKPiArI2RlZmluZSBTQklfRldGVF9QTEFURk9STV9GRUFUVVJFX0JJ
VCAgICAgICAgICAoMSA8PCAzMCkKPiArCj4gKyNkZWZpbmUgU0JJX0ZXRlRfU0VUX0ZMQUdfTE9D
SyAgICAgICAgICAgICAgICAgKDEgPDwgMCkKPgo+ICAvKiBTQkkgc3BlYyB2ZXJzaW9uIGZpZWxk
cyAqLwo+ICAjZGVmaW5lIFNCSV9TUEVDX1ZFUlNJT05fREVGQVVMVCAgICAgICAweDEKPgoKTEdU
TS4KClJldmlld2VkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gLS0KPiAyLjM0
LjEKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
