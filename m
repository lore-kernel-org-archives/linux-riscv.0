Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C3DC25B79
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 19:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHgLmHzS74e1RT37uEbURSD50TnThQhb3hVa9OSmu3w=; b=CnJP2aHnmt3WdkvwUlG6LXm1MP
	gr8w8qHj7sLgqnVYZy3UvU8bXD0dBDmOBUAe9zj/6P1/8LfeerOE3zDuc/RMXUw//BRtznLWdUEYi
	QtfoO8l5tDt51oSiC7/TAMqudMVylbW/XTodwCDgCo3KBE92eb4tVcKnKpb9qiW+YIoD6iV/I1uvE
	dBdd/C3Sv7vMp14bXYFA/+MxydE/PPzYqR0Is9dYWEzMYJu9AgzN4NYB+fkfD/O7dslH0r31MIEJh
	QzHT4mXezXMizo7MTZin8YdUkEq/w5DsJp4zXh368BSsWjtXMxFdtSo5klbkyx8fP8Af5xz5RgQ/C
	bgMSTwJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAaKC-00000009fi4-1dUi;
	Fri, 24 May 2024 19:11:32 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAaK9-00000009fhF-0yyP
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 19:11:30 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6f693fb0ad4so4150505b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 12:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716577887; x=1717182687; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NHWDoWZZfWuUu/P0x+kbvgCTb8gOtuuYHKkIDhOcYik=;
        b=Sj7bF5bPOi1bmsSTMkC40a0NOmh2NhzYg6fuaAuao55x9I7s5DA39KbfdXM89xJJXJ
         tSb7Wjd++Y0clqzBkETlPmfWRNasIn+KDn1n6yZkSHg5EfaRLEnCpbILsw6qvYAJTwXl
         wFwmI4vvjLgKVjv6u79bjO2nCIlGRS/VAKbHTw7JM/HVPOCTOBWE6a0emlDaCSTtYZMB
         XGZSYN2VKSqn+EZnbekHHe3iOHNc7hCOHwFJ8L2Rd5dQEmYwEwrPNRrLZ7N03HxdoeRD
         /go8SXDNJLxweA6DMMoFmPEHWRCmTOBQVU0eZswwNrqSON3w+APdzeBaPyfO4ZxVxP71
         39ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716577887; x=1717182687;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHWDoWZZfWuUu/P0x+kbvgCTb8gOtuuYHKkIDhOcYik=;
        b=DK47pvk0QwajC5TutIULezQkq6bdLEwSSiHZWp/warjiLR8BXQ/kwCHVQGJsLUCQF/
         tKA9Twa/460mSlim+XnTjQ5UNdEWJnOl0EvmqojpVB4IR6ToG9+Osz6nsCZu50NI4d5H
         UvXWSDw50WcFseiSXOR35sGS3IwBlO8vdT12UhsUjQ3egQEMI0APC2gO8i+M+qOhZUPF
         OqWVAC0tN+IPvNyGWWX6Gffnb+gX0h/1UaSOBuSHQb8v/IhE5nVx3lPJZlzimR007Ay3
         QWzMSIU7yhRZwPGD/Bg3amcm81DNKp0THXiyIASI/ZGE0l9GKEbK+hTxGO6pCXGyxdpR
         GK8w==
X-Forwarded-Encrypted: i=1; AJvYcCV83W5nv8WeXqyqzInyJQ2RvgNBW1VIGiz50TgYoz1Bi2D4rPAhgjbGxrQGac0LcXQ/Rx3Wp5BQd9DsNcAmw/uK3TskdhPyI37sMM13rRXS
X-Gm-Message-State: AOJu0YxYLr/a/MBzjUnrer5SNrJbwPpileghAryadMi4Qo20L+NvLKTH
	xUHF1mN8ZBXiQfvYVJqGxnkD+ABedXvaeuGquQ/QLppiQAXyQ3B1C+xfXIqyqHE=
X-Google-Smtp-Source: AGHT+IEwWQZpFilaYbUUGlopJo1f2TdPyB2rRnSl7U/MDmzei8hNgpy175SX2dTVTzyB8unJyM8ICQ==
X-Received: by 2002:a05:6a20:12ca:b0:1af:93b0:f007 with SMTP id adf61e73a8af0-1b212cc4fd5mr4361727637.1.1716577887327;
        Fri, 24 May 2024 12:11:27 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fcfe5961sm1424089b3a.164.2024.05.24.12.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 12:11:26 -0700 (PDT)
Date: Fri, 24 May 2024 12:11:22 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, jerry.shih@sifive.com,
	hankuan.chen@sifive.com, greentime.hu@sifive.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, charlie@rivosinc.com,
	apatel@ventanamicro.com, mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com, sameo@rivosinc.com,
	shikemeng@huaweicloud.com, willy@infradead.org,
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
Subject: Re: [PATCH v3 22/29] riscv sigcontext: adding cfi state field in
 sigcontext
Message-ID: <ZlDmWoo6EVZ1MKbN@debug.ba.rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-23-debug@rivosinc.com>
 <CABgGipW4ZTFLh1dkiRuWD0WP4RRkfhyFCc+RsUjCD2EkA5GhSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABgGipW4ZTFLh1dkiRuWD0WP4RRkfhyFCc+RsUjCD2EkA5GhSQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_121129_285364_27D30C0D 
X-CRM114-Status: GOOD (  19.99  )
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

T24gRnJpLCBNYXkgMjQsIDIwMjQgYXQgMDU6NDY6MTZQTSArMDgwMCwgQW5keSBDaGl1IHdyb3Rl
Ogo+SGkgRGVlcGFrLAo+Cj5PbiBUaHUsIEFwciA0LCAyMDI0IGF0IDc6NDLigK9BTSBEZWVwYWsg
R3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+Cj4+IFNoYWRvdyBzdGFjayBuZWVk
cyB0byBiZSBzYXZlZCBhbmQgcmVzdG9yZWQgb24gc2lnbmFsIGRlbGl2ZXJ5IGFuZCBzaWduYWwK
Pj4gcmV0dXJuLgo+Pgo+PiBzaWdjb250ZXh0IGVtYmVkZGVkIGluIHVjb250ZXh0IGlzIGV4dGVu
ZGlibGUuIEFkZGluZyBjZmkgc3RhdGUgaW4gdGhlcmUKPj4gd2hpY2ggY2FuIGJlIHVzZWQgdG8g
c2F2ZSBjZmkgc3RhdGUgYmVmb3JlIHNpZ25hbCBkZWxpdmVyeSBhbmQgcmVzdG9yZQo+PiBjZmkg
c3RhdGUgb24gc2lncmV0dXJuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8ZGVi
dWdAcml2b3NpbmMuY29tPgo+PiAtLS0KPj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9z
aWdjb250ZXh0LmggfCA1ICsrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
Cj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vc2lnY29udGV4
dC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3NpZ2NvbnRleHQuaAo+PiBpbmRleCBj
ZDRmMTc1ZGM4MzcuLjVjY2RkOTRhMDg1NSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL3NpZ2NvbnRleHQuaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20vc2lnY29udGV4dC5oCj4+IEBAIC0yMSw2ICsyMSwxMCBAQCBzdHJ1Y3QgX19zY19yaXNj
dl92X3N0YXRlIHsKPj4gICAgICAgICBzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSB2X3N0YXRl
Owo+PiAgfSBfX2F0dHJpYnV0ZV9fKChhbGlnbmVkKDE2KSkpOwo+Pgo+PiArc3RydWN0IF9fc2Nf
cmlzY3ZfY2ZpX3N0YXRlIHsKPj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHNzX3B0cjsgICAvKiBz
aGFkb3cgc3RhY2sgcG9pbnRlciAqLwo+PiArICAgICAgIHVuc2lnbmVkIGxvbmcgcnN2ZDsgICAg
ICAgICAgICAgLyoga2VlcGluZyBhbm90aGVyIHdvcmQgcmVzZXJ2ZWQgaW4gY2FzZSB3ZSBuZWVk
IGl0ICovCj4+ICt9Owo+PiAgLyoKPj4gICAqIFNpZ25hbCBjb250ZXh0IHN0cnVjdHVyZQo+PiAg
ICoKPj4gQEAgLTI5LDYgKzMzLDcgQEAgc3RydWN0IF9fc2NfcmlzY3Zfdl9zdGF0ZSB7Cj4+ICAg
Ki8KPj4gIHN0cnVjdCBzaWdjb250ZXh0IHsKPj4gICAgICAgICBzdHJ1Y3QgdXNlcl9yZWdzX3N0
cnVjdCBzY19yZWdzOwo+PiArICAgICAgIHN0cnVjdCBfX3NjX3Jpc2N2X2NmaV9zdGF0ZSBzY19j
Zmlfc3RhdGU7Cj4KPkkgYW0gY29uY2VybmVkIGFib3V0IHRoaXMgY2hhbmdlIGFzIHRoaXMgY291
bGQgcG90ZW50aWFsbHkgYnJlYWsgdWFiaS4KPkxldCdzIHNheSB0aGVyZSBpcyBhIHByZS1DRkkg
cHJvZ3JhbSBydW5uaW5nIG9uIHRoaXMga2VybmVsLiBJdAo+cmVjZWl2ZXMgYSBzaWduYWwgc28g
dGhlIGtlcm5lbCBsYXlzIG91dCB0aGUgc2lnLXN0YWNrIGFzIHByZXNlbnRlZCBpbgo+dGhpcyBz
dHJ1Y3R1cmUuIElmIHRoZSBwcm9ncmFtIGFjY2Vzc2VzIHNjX2ZwcmVncywgaXQgd291bGQgbm93
IGdldAo+c2NfY2ZpX3N0YXRlLiBBcyB0aGUgb2Zmc2V0IGhhcyBjaGFuZ2VkLCBhbmQgdGhlIHBy
ZS1DRkkgcHJvZ3JhbSBoYXMKPm5vdCBiZWVuIHJlLWNvbXBpbGVkLgoKWWVhaCB0aGlzIGlzIGEg
cHJvYmxlbSBpZiBwcm9ncmFtIHdhcyBidWlsdCB3aXRoIG9sZGVyIGtlcm5lbC9vbGQgdG9vbGNo
YWluCihvciBjZmkgdW5hd2FyZSB0b29sY2hhaW4pLiBUaGFua3MuCgo+Cj4+ICAgICAgICAgdW5p
b24gewo+PiAgICAgICAgICAgICAgICAgdW5pb24gX19yaXNjdl9mcF9zdGF0ZSBzY19mcHJlZ3M7
Cj4+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgX19yaXNjdl9leHRyYV9leHRfaGVhZGVyIHNjX2V4
dGRlc2M7Cj4+IC0tCj4+IDIuNDMuMgo+Pgo+Cj5UaGVyZSBtYXkgYmUgdHdvIHdheXMgdG8gZGVh
bCB3aXRoIHRoaXMuIE9uZSBpcyB0byB1c2UgYSBkaWZmZXJlbnQKPnNpZ25hbCBBQkkgZm9yIENG
SS1lbmFibGVkIHByb2dyYW1zLiBUaGlzIG1heSBjb21wbGljYXRlIHRoZSB1c2VyCj5zcGFjZSBi
ZWNhdXNlIG5ldyBwcm9ncmFtcyB3aWxsIGhhdmUgdG8gZGV0ZXJtaW5lIHdoZXRoZXIgaXQgc2hv
dWxkCj51c2UgdGhlIENGSS1BQkkgYXQgcnVuIHRpbWUuIEFub3RoZXIgd2F5IGlzIHRvIGZvbGxv
dyB3aGF0IFZlY3RvciBkb2VzCj5mb3Igc2lnbmFsIHN0YWNrLiBJdCBhZGRzIGEgd2F5IHRvIGlu
dHJvZHVjZSBuZXcgZXh0ZW5zaW9ucyBvbiBzaWduYWwKPnN0YWNrIHdpdGhvdXQgaW1wYWN0aW5n
IEFCSS4KPgo+UGxlYXNlIGxldCBtZSBrbm93IGlmIEkgbWlzdW5kZXJzdGFuZCBhbnl0aGluZywg
dGhhbmtzLgoKSSB0aGluayBmb2xsb3dpbmcgaG93IHZlY3RvciBkb2VzIHdvdWxkIGJlIGNsZWFu
ZXIuCkxldCBtZSBtdW5jaCBvbiB0aGlzIGEgbGl0dGxlIGJpdC4KCj4KPkNoZWVycywKPkFuZHkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
