Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3FAC369D5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 19:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LfpdGQFULHzvagDht5OVjCPBEpNqEipcAQlYdW+yNuY=; b=gAVbmDz2ZX+8qsCUG+iKAW9xde
	M00zVCUly17F/H+dJa1ZchaMNNyXmdER3OhtJL1I2GtlyQAAnZCp6gw2lqezJU15dmScVSKho/BKl
	GndByXTpnMrs/Ko0EBYlGpG/dHCR1vzIHxepHaZWBwcbmUR5XekYzAi2xOZlUKooa6nrCX3Q3YAh9
	RqKJiWx4gtbLz5hxPuQV7Z1psJv7tqzAZzL4+7qzJi/WUtdivDCTzk0uQPbca3rZc2bBRXpeg15wl
	CnTYyICxPy8E0mVLDpq+CFWUj6Y7Bnwf38EqsVI5HXCskZqgrEx+Rs5baTS5ZHPXXBiMZM6+zZqco
	k7H8BR9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81zf-0000000F8N3-3j9r;
	Thu, 24 Apr 2025 19:12:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80oV-0000000ExYk-3skF
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 17:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KOLy/80XFfLxXJDNfbBZwCZ4HqYR8Mbf5OU8mj5q3uc=; b=li9DBwjOMewmcbvNx22phZL+sC
	FQVP++WuiAxmNET4fwiLRrwD1Oc7NUbAFp9Ov08RoqDMoMP7jHf4rtEAHb39zR16vQMlbJQUnYGxK
	V9eatqfn3RfWJEUrv7HRy6nqqaRPbgdTG7vLbS3KHs7a08FsV1CDQP51C3ju30HUBYn+PJstR/JMI
	bWt8m86MdUtNZfwYj7jr3wuXt+Spxld6GQy5a3iTcmLQ8Go02VK3CK6GrDvRxC0KGlULjWrxsfcJ0
	xaBPzMQe8EdrTh7/yreHmIxMWVAH/WVsY1lg6mO9BAJhsHry5IGyc6QHcAndxxGY2yxSU9lL2k02O
	p+prpx8A==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u80oS-0000000BtHa-2Ofq
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 17:56:42 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso1822640b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 10:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745517398; x=1746122198; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KOLy/80XFfLxXJDNfbBZwCZ4HqYR8Mbf5OU8mj5q3uc=;
        b=utwDTPBJj8oLWsjhnWv3F0MECIXf07qMHhWoZAnftBgS3gnhN2hCWS/ZKEMs0Ycrh/
         Yta76/SweA2Wr4OCUk/2Rg40W0XK9grBEv7oBpHdHmOxBw1Oq6rpNXB6wouYrH51y0vW
         BQLm3IRuPacCFNPObZi+um7bZvFIJ9PrGxkwxC5rSMDQLWhvX2KR1DW8dHMyAOV2bHU8
         pZcrHcxCpfSkDj8tpfX+QhZlZfLMHFusmaoewphsO6vCwRSlt8mOs8MvkX4hp5dgJQK7
         wLyg6rx+9GwFYzSFBgrvEFDqRd96WCMsjvlA8lGjywf52mtRXTwjnDUQaUdvSwngWAxy
         mgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745517398; x=1746122198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KOLy/80XFfLxXJDNfbBZwCZ4HqYR8Mbf5OU8mj5q3uc=;
        b=xQoNE0nPCCm1Un8WY+32VgvEy0ebsomeCGwJ/Td9Fzty61CI27P/HBiM5A1GoT0C0H
         nA/ibaFQIr97Pryzg74QEFlrBw56PAVoseo0C0hQyBMZWCgjoA05whGjsvxA/DSBo/9U
         3VnGDI63Kw+ac6L4wypOGqoTgToto+TTHEJTLguT8AvEZ94M4kd/eG/ADQyjbWd7ZCVu
         V6LHsvL3zDsIxtHFsbit+5CjaRS84mDPPHz7BaRVIgMgqIP4rwlRTy1Jf3Xm4+6AuGPo
         nYW1B3dYa5PXbb+zz/JQr/ty0YRlT7w2kHeJEMX5pJJ+zeiRWvuwmU1LOoptaE2T8N1y
         XMpA==
X-Forwarded-Encrypted: i=1; AJvYcCUR4Um4/I5c243VsqTBK9WAAtOb85mSewf5/9WQhjWsZgECQ6XIFQhT6dTaLCwYVrL+Mi2qNWL5ezGsZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwySgU6paf8SShppElUF1jTohwS/iUvhO+qY6vBKGcIgXEZZk+j
	t8Ewl15KXzUGPm/+DkXkzr34qYK4l71eba3qqIcAJ9+Dfmju6pnmfa8/Le0gsEw=
X-Gm-Gg: ASbGncu493NHeuDxDab6MdF+rC7FvDIlRk935Nt2/Xjby0Ehd0YJ866N26GrK9Id69Y
	mKlRgjX6c7xT5NS2BRZ6/jPRaPrvo6Y8TRCCK+tX56lUEvMMisaIPpjn3sBvXAh1ivp/2KjZZTk
	Or5/ltzwdyee0Eq2sPLMYoGkik+Y6y24Irn3O1B4uuAFFhDoMvG4Jo1YiByK4RUlV1ecNSUc2zU
	Tr7iw4666uNhaKPTxqDdWMY9m8k6EVZD4WDFB0k7bodvNHjDY8XtwWTk10m9lsz9XO9MgyqsQBt
	V+q8rp4s24kHNjAPtV8C8RErQurZoKuKr8i131wVVZKKMW/FdPs=
X-Google-Smtp-Source: AGHT+IEvwKAWcL1BB3CDYo6zsE5OWQQndt5nVMjDwtZXDpnZ2rdOW1imvzSm4O5fk1CTzTK9UpqvkQ==
X-Received: by 2002:a05:6a00:1744:b0:735:d89c:4b8e with SMTP id d2e1a72fcca58-73e32fbafeemr709517b3a.5.1745517398496;
        Thu, 24 Apr 2025 10:56:38 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9940esm1697082b3a.129.2025.04.24.10.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:56:38 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:56:34 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
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
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, broonie@kernel.org, rick.p.edgecombe@intel.com,
	Zong Li <zong.li@sifive.com>,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v12 05/28] riscv: usercfi state for task and save/restore
 of CSR_SSP on trap entry/exit
Message-ID: <aAp7Un415hNqtshd@debug.ba.rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-5-e51202b53138@rivosinc.com>
 <D92WQWAUQYY4.2ED8JAFBDHGRN@ventanamicro.com>
 <aAl_HRk49lnseiio@debug.ba.rivosinc.com>
 <D9EUJBQ5OHN0.2KUJHGXK262TR@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D9EUJBQ5OHN0.2KUJHGXK262TR@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_185640_849229_3E7B6ED1 
X-CRM114-Status: GOOD (  33.12  )
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

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMDE6NTI6NDNQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+MjAyNS0wNC0yM1QxNzowMDoyOS0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0By
aXZvc2luYy5jb20+Ogo+PiBPbiBUaHUsIEFwciAxMCwgMjAyNSBhdCAwMTowNDozOVBNICswMjAw
LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+PjIwMjUtMDMtMTRUMTQ6Mzk6MjQtMDc6MDAsIERl
ZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPjoKPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90
aHJlYWRfaW5mby5oCj4+Pj4gQEAgLTYyLDYgKzYyLDkgQEAgc3RydWN0IHRocmVhZF9pbmZvIHsK
Pj4+PiAgCWxvbmcJCQl1c2VyX3NwOwkvKiBVc2VyIHN0YWNrIHBvaW50ZXIgKi8KPj4+PiAgCWlu
dAkJCWNwdTsKPj4+PiAgCXVuc2lnbmVkIGxvbmcJCXN5c2NhbGxfd29yazsJLyogU1lTQ0FMTF9X
T1JLXyBmbGFncyAqLwo+Pj4+ICsjaWZkZWYgQ09ORklHX1JJU0NWX1VTRVJfQ0ZJCj4+Pj4gKwlz
dHJ1Y3QgY2ZpX3N0YXR1cwl1c2VyX2NmaV9zdGF0ZTsKPj4+PiArI2VuZGlmCj4+Pgo+Pj5JIGRv
bid0IHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIHB1dCBhbGwgdGhlIGRhdGEgaW4gdGhyZWFkX2lu
Zm8uCj4+Pmtlcm5lbF9zc3AgYW5kIHVzZXJfc3NwIGlzIG1vcmUgdGhhbiBlbm91Z2ggYW5kIHRo
ZSByZXN0IGNhbiBjb21mb3J0YWJseQo+Pj5saXZlIGVsc2V3aGVyZSBpbiB0YXNrX3N0cnVjdC4K
Pj4+Cj4+PnRocmVhZF9pbmZvIGlzIHN1cHBvc2VkIHRvIGJlIGFzIHNtYWxsIGFzIHBvc3NpYmxl
IC0tIGp1c3Qgc3Bhbm5pbmcKPj4+bXVsdGlwbGUgY2FjaGUtbGluZXMgY291bGQgYmUgbm90aWNl
YWJsZS4KPj4KPj4gSSBjYW4gY2hhbmdlIGl0IHRvIG9ubHkgaW5jbHVkZSBvbmx5IGB1c2VyX3Nz
cGAsIGJhc2UgYW5kIHNpemUuCj4KPk5vIG5lZWQgZm9yIGJhc2UgYW5kIHNpemUgZWl0aGVyIC0t
IHdlIGRvbid0IHRvdWNoIHRoYXQgaW4gdGhlIGNvbW1vbgo+ZXhjZXB0aW9uIGNvZGUuCgpnb3Qg
aXQuCgo+Cj4+IEJ1dCBiZWZvcmUgd2UgZ28gdGhlcmUsIHNlZSBiZWxvdzoKPj4KPj4gJCBwYWhv
bGUgLUMgdGhyZWFkX2luZm8ga2J1aWxkL3ZtbGludXgKPj4gc3RydWN0IHRocmVhZF9pbmZvIHsK
Pj4gICAgICAgICAgbG9uZyB1bnNpZ25lZCBpbnQgICAgICAgICAgZmxhZ3M7ICAgICAgICAgICAg
ICAgIC8qICAgICAwICAgICA4ICovCj4+ICAgICAgICAgIGludCAgICAgICAgICAgICAgICAgICAg
ICAgIHByZWVtcHRfY291bnQ7ICAgICAgICAvKiAgICAgOCAgICAgNCAqLwo+Pgo+PiAgICAgICAg
ICAvKiBYWFggNCBieXRlcyBob2xlLCB0cnkgdG8gcGFjayAqLwo+Pgo+PiAgICAgICAgICBsb25n
IGludCAgICAgICAgICAgICAgICAgICBrZXJuZWxfc3A7ICAgICAgICAgICAgLyogICAgMTYgICAg
IDggKi8KPj4gICAgICAgICAgbG9uZyBpbnQgICAgICAgICAgICAgICAgICAgdXNlcl9zcDsgICAg
ICAgICAgICAgIC8qICAgIDI0ICAgICA4ICovCj4+ICAgICAgICAgIGludCAgICAgICAgICAgICAg
ICAgICAgICAgIGNwdTsgICAgICAgICAgICAgICAgICAvKiAgICAzMiAgICAgNCAqLwo+Pgo+PiAg
ICAgICAgICAvKiBYWFggNCBieXRlcyBob2xlLCB0cnkgdG8gcGFjayAqLwo+Pgo+PiAgICAgICAg
ICBsb25nIHVuc2lnbmVkIGludCAgICAgICAgICBzeXNjYWxsX3dvcms7ICAgICAgICAgLyogICAg
NDAgICAgIDggKi8KPj4gICAgICAgICAgc3RydWN0IGNmaV9zdGF0dXMgICAgICAgICAgdXNlcl9j
Zmlfc3RhdGU7ICAgICAgIC8qICAgIDQ4ICAgIDMyICovCj4+ICAgICAgICAgIC8qIC0tLSBjYWNo
ZWxpbmUgMSBib3VuZGFyeSAoNjQgYnl0ZXMpIHdhcyAxNiBieXRlcyBhZ28gLS0tICovCj4+ICAg
ICAgICAgIGxvbmcgdW5zaWduZWQgaW50ICAgICAgICAgIGEwOyAgICAgICAgICAgICAgICAgICAv
KiAgICA4MCAgICAgOCAqLwo+PiAgICAgICAgICBsb25nIHVuc2lnbmVkIGludCAgICAgICAgICBh
MTsgICAgICAgICAgICAgICAgICAgLyogICAgODggICAgIDggKi8KPj4gICAgICAgICAgbG9uZyB1
bnNpZ25lZCBpbnQgICAgICAgICAgYTI7ICAgICAgICAgICAgICAgICAgIC8qICAgIDk2ICAgICA4
ICovCj4+Cj4+ICAgICAgICAgIC8qIHNpemU6IDEwNCwgY2FjaGVsaW5lczogMiwgbWVtYmVyczog
MTAgKi8KPj4gICAgICAgICAgLyogc3VtIG1lbWJlcnM6IDk2LCBob2xlczogMiwgc3VtIGhvbGVz
OiA4ICovCj4+ICAgICAgICAgIC8qIGxhc3QgY2FjaGVsaW5lOiA0MCBieXRlcyAqLwo+PiB9Owo+
Pgo+PiBJZiB3ZSB3ZXJlIHRvIHJlbW92ZSBlbnRpcmUgYGNmaV9zdGF0dXNgLCBpdCB3b3VsZCBz
dGlsbCBiZSA3MiBieXRlcyAoODggYnl0ZXMKPj4gaWYgc2hhZG93IGNhbGwgc3RhY2sgd2VyZSBl
bmFibGVkKSBhbmQgYWxyZWFkeSBzcGFucyBhY3Jvc3MgdHdvIGNhY2hlbGluZXMuCj4KPkl0IGhh
cyBvbmx5IDY0IGJ5dGVzIG9mIGRhdGEgd2l0aG91dCBzaGFkb3cgY2FsbCBzdGFjaywgYnV0IGl0
IHdhc3RlZCA4Cj5ieXRlcyBvbiB0aGUgaG9sZXMuCj5hMiBpcyBzb21ld2hhdCBhbiBvdXRsaWVy
IHRoYXQgaXMgbm90IHVzZWQgbW9zdCBleGNlcHRpb24gcGF0aHMgYW5kCj5leGNsdWRpbmcgaXQg
bWFrZXMgZXZlcnl0aGluZyBmaXQgbmljZWx5IGV2ZW4gbm93LgoKQnV0IHdlIGNhbid0IGV4Y2x1
ZGUgc2hhZG93IGNhbGwgc3RhY2suIEl0J2xsIGxlYWQgdG8gaW5jcmVhc2VkIHNpemUgaWYgdGhh
dApjb25maWcgaXMgc2VsZWN0ZWQuIEEgc29sdXRpb24gaGFzIHRvIHdvcmsgZm9yIGFsbCB0aGUg
Y2FzZXMgYW5kIG5vdCBoYWxmCmhlYXJ0ZWQgZWZmb3J0LgoKPgo+PiBpZiBzaGFkb3cgY2FsbCBz
dGFjayB3ZXJlIGVuYWJsZWQpIGFuZCBhbHJlYWR5IHNwYW5zIGFjcm9zcyB0d28gY2FjaGVsaW5l
cy4gSQo+PiBkaWQgc2VlIHRoZSBjb21tZW50IGFib3ZlIHRoYXQgaXQgc2hvdWxkIGZpdCBpbnNp
ZGUgYSBjYWNoZWxpbmUuIEFsdGhvdWdoIEkKPj4gYXNzdW1lZCBpdHMgc3RhbGUgY29tbWVudCBn
aXZlbiB0aGF0IGl0IGFscmVhZHkgc3BhbnMgYWNyb3NzIGNhY2hlbGluZSBhbmQgSQo+PiBkaWRu
J3Qgc2VlIGFueSBzcGVjaWFsIG1lbnRpb24gaW4gY29tbWl0IG1lc3NhZ2VzIG9mIGNoYW5nZXMg
d2hpY2ggZ3JldyB0aGlzCj4+IHN0cnVjdHVyZSBhYm92ZSBvbmUgY2FjaGVsaW5lLiBTbyBJIGFz
c3VtZWQgdGhpcyB3YXMgYSBzdGFsZSBjb21tZW50Lgo+Pgo+PiBPbiB0aGUgb3RoZXIgaGFuZCwg
d2hlbmV2ZXIgZW5hYmxlL2xvY2sgYml0cyBhcmUgY2hlY2tlZCwgdGhlcmUgaXMgYSBoaWdoCj4+
IGxpa2VseWhvb2QgdGhhdCB1c2VyX3NzcCBhbmQgb3RoZXIgZmllbGRzIGFyZSBnb2luZyB0byBi
ZSBhY2Nlc3NlZCBhbmQKPj4gdGh1cyBpdCBhY3R1YWxseSBtaWdodCBiZSBoZWxwZnVsIHRvIGhh
dmUgaXQgYWxsIGluIG9uZSBjYWNoZWxpbmUgZHVyaW5nCj4+IHJ1bnRpbWUuCj4KPlllcywgYWx0
aG91Z2ggYWNjZXNzaW5nIGVuYWJsZS9sb2NrIGJpdHMgd2lsbCBiZSByZWxhdGl2ZWx5IHJhcmUu
Cj5JdCBzZWVtcyBiZXR0ZXIgdG8gaGF2ZSB0aGUgb3ZlcmhlYWQgZHVyaW5nIHRocmVhZCBzZXR1
cCwgcmF0aGVyIHRoYW4gb24KPmV2ZXJ5IHRyYXAuCj4KPj4gU28gSSBhbSBub3Qgc3VyZSBpZiBp
dHMgaGVscGZ1bCBzdGlja2luZyB0byB0aGUgY29tbWVudCB3aGljaCBhbHJlYWR5IGlzIHN0YWxl
Lgo+Cj5XZSBjb3VsZCBmaXggdGhlIGhvbGVzIGFuZCBhbHNvIHVzZSBzcCBpbnN0ZWFkIG9mIGEw
IGluIHRoZQo+bmV3X3ZtYWxsb2NfY2hlY2ssIHNvIGV2ZXJ5dGhpbmcgd291bGQgZml0IGJldHRl
ci4KPgo+V2UgYXJlIHJlYWxseSBjbG9zZSB0byBmaXR0aW5nIGludG8gYSBzaW5nbGUgY2FjaGUt
bGluZSwgc28gSSdkIHByZWZlcgo+aWYgc2hhZG93IHN0YWNrIG9ubHkgZmlsbGVkIHRocmVhZF9p
bmZvIHdpdGggZGF0YSB0aGF0IGlzIHVzZWQgdmVyeQo+b2Z0ZW4gaW4gdGhlIGV4Y2VwdGlvbiBo
YW5kbGluZyBjb2RlLgoKSSBkb24ndCBnZXQgd2hhdCdzIHRoZSBiaWcgZGVhbCBpZiBpdCByZXN1
bHRzIGluIHR3byBjYWNoZWxpbmVzLiBXZSBjYW4KKHJlKW9yZ2FuaXplIGRhdGEgc3RydWN0dXJl
IGluIGEgd2F5IHRoZSBtb3N0IGZyZXF1ZW50bHkgYWNjZXNzZWQgbWVtYmVycyBhcmUKdG9nZXRo
ZXIgaW4gYSBzaW5nbGUgY2FjaGVsaW5lLiBXZSBqdXN0IG5lZWQgdG8gZmluZCB0aG9zZSBtZW1i
ZXJzLgoKSW4gdGhlIGhvdCBwYXRoIG9mIGV4Y2VwdGlvbiBoYW5kbGluZywgSSBzZWUgYWNjZXNz
ZXMgdG8gcHRfcmVncyBvbiBzdGFjayBhcwp3ZWxsLiBUaGVzZSBhcmUgZGVmaW5pdGxleSBkaWZm
ZXJlbnQgY2FjaGVsaW5lIHRoYW4gdGhyZWFkX2luZm8uCgpJIHVuZGVyc3RhbmQgdGhlIGFyZ3Vt
ZW50IG9mIG9uZSBtZW1iZXIgZmllbGQgY3Jvc3NpbmcgaW50byB0d28gY2FjaGVsaW5lcyBjYW4K
aGF2ZSB1bmRlc2lyZWQgcGVyZiBlZmZlY3RzLiBJIGRvIG5vdCB1bmRlcnN0YW5kIHJlYXNvbmlu
ZyB0aGF0IHRocmVhZF9pbmZvCmV4YWN0bHkgaGFzIHRvIGZpdCBpbnNpZGUgb25lIGNhY2hlbGlu
ZS4KCklmIHRoaXMgd2FzIGFsd2F5cyBzdXBwb3NlZCB0byBmaXQgaW4gYSBzaW5nbGUgY2FjaGVs
aW5lLCBjbGVhcmx5IHRoaXMKaW52YXJpYW50IGlzbid0L3dhc24ndCBtYWludGFpbmVkIGFzIGNo
YW5nZXMgdHJpY2tsZWQgaW4uIEkgd291bGQgbGlrZSB0byBzZWUKd2hhdCBtYWludGFpbmVycyBo
YXZlIHRvIHNheSBvciBzb21lb25lIHdobyBkaWQgZGF0YSBhbmFseXNpcyBvbiB0aGlzLgoKCj4K
PkkgdGhpbmsgd2UgY291bGQgZG8gd2l0aG91dCB1c2VyX3NwIGluIHRocmVhZF9pbmZvIGFzIHdl
bGwsIHNvIHRoZXJlIGFyZQo+b3RoZXIgcGFja2luZyBvcHRpb25zLgoKU3VyZSwgcHJvYmFibHkg
c29tZXdoZXJlIGluIHRhc2tfc3RydWN0LiBCdXQgZmFjdCBvZiB0aGUgbWF0dGVyIGlzIHRoYXQg
aXQgaGFzCnRvIGJlIHNhdmVkL3Jlc3RvcmUgZHVyaW5nIGV4Y2VwdGlvbiBlbnRyeS9leGl0LiBC
dXQgdGhlbiBsb2FkL3N0b3JlIHRvCnRhc2tfc3RydWN0IGlzIGVzc2VudGlhbGx5IGEgZGlmZmVy
ZW50IGNhY2hsaW5lLiBOb3Qgc3VyZSB3aGF0IHdlIHdpbGwgYWNoaWV2ZQpoZXJlPwoKPgo+QnR3
LiBjb3VsZCBzc3AgYmUgYWRkZWQgdG8gcHRfcmVncz8KCkkgaGFkIHRoYXQgZWFybGllci4gSXQg
YnJlYWtzIHVzZXIgYWJpLiBBbmQgaXQgd2FzIGEgbm8gZ28uCgo+Cj5UaGFua3MuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
