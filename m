Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04177EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 20:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WyrvDaBvcjQGOkvut/Pn6LcdQgAIFAAFuk/tYVOcmA=; b=PA+vksX0W8C1eC
	ycNim3QTMIFUzhmNdsACDv5+isTTJNloqrFfcuILJgYD7Dl/oTK8gtJ37Y5xipVv6U7U3qPOeZkwM
	6MVoJCAfb/9xZiKbmorBbScQJHV8yAECc3j/9pT11PygXhZqfB7l3Ii6cJSjaA/BCCRgAQ5hzoqET
	4BI9l1eK+FsrQO/fW1BL1sZHWhKicOhpDspaSfNNCUAc0qi6aJGwzv6Kk7QBil4IpXVAoqxMBtSf7
	C2CbE41arsHkfQmUqHew4JgNLsNJwA6R/6bliMnrqAuBWAV6+I0gTH6JqV84T3CZUTzrpmPVY0lnx
	2MR8RNYbNGPee5g4rKEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBLKc-009PO1-1K;
	Mon, 19 Jun 2023 20:18:34 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBLKY-009PMH-2k;
	Mon, 19 Jun 2023 20:18:32 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-544c0d768b9so3195442a12.0;
        Mon, 19 Jun 2023 13:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687205909; x=1689797909;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmEEut0OCJI0jheFei8v4KFIgPFEx+9Zr0oYZPTVJvw=;
        b=ML1POuSF5TNYpNiqkU7Wmm/FZLBDFoP32DY+WPylpmv43DoaA/AoXnTGG2wwzhld3j
         kjkKToRZCKl1S0ycKV+IUNrHAQ8Dvck3h+D7ZuCxy/PFvkOP44vPViwvWsYYl0BBuNgy
         b/5HPeUCxmK/jPGro6a0V6gtwlQJxSWG+MjbaRDV7mR48t508gCxLWi7cw8WSlTAdLEO
         3p+win9LgLE5lOsK+rw7eJ7na0iRAHUh7i2pWPNrn0k/YllS2kfgOgB31VmT4hCseChr
         k2Wm+WLNvD9nhPcsjkRc0OVcXyGOSUiyWGCOpqitL1ReK2kli6NusXAAxFAtCrHDui7k
         NzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687205909; x=1689797909;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmEEut0OCJI0jheFei8v4KFIgPFEx+9Zr0oYZPTVJvw=;
        b=hWDfgRM6ALmXlJUwpJ+lBxdSC4pchhy4Ct6Zr72FJeMejY5AzFmgX2Inq9bgWtFD72
         UjZplI6kPC+5+IMb2nxnNuxxYaz/XWy7/ktRyeFYh/jkxh1IDqh9JpNj2oxCav69nL+s
         w3w81prRsDi3o1KMrgbxhsorbmTVCqavHX/SczdzOVi4TJhjU9FK0tQYQuFb0KLh8puR
         FNqarNhzDM3mDkL9GGcq/+/en5vuVeiyC/8MqeLQ+A2tf6k0C4GpRn/LCeUMqhnsBXl0
         4efF3DNjYLOHLONL9AU5wem1EHTRldDDff5SpcasaYYmQaCmzDGs8oGLfv0xLazudQQ3
         3gMQ==
X-Gm-Message-State: AC+VfDxtNQKUgcDb1e/hoLhmjRxdUKdn091bXSUb2Vt5ras0Cvr9TucN
	x9I0v+SDnJ1OkxtV+al2wr4=
X-Google-Smtp-Source: ACHHUZ4MAGz/Bbdlo+4DcmVI4O990mBmojRaVLNYuDWhcs7i7MC/1uf1G62Dkn3iaVvHJNN3c8J+8g==
X-Received: by 2002:a05:6a21:78a9:b0:10a:cb95:5aa3 with SMTP id bf41-20020a056a2178a900b0010acb955aa3mr14231287pzc.7.1687205909086;
        Mon, 19 Jun 2023 13:18:29 -0700 (PDT)
Received: from smtpclient.apple ([66.170.99.1])
        by smtp.gmail.com with ESMTPSA id k18-20020a637b52000000b005538bf7e3d6sm87568pgn.88.2023.06.19.13.18.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Jun 2023 13:18:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and
 jit_text_alloc()
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com>
Date: Mon, 19 Jun 2023 13:18:15 -0700
Cc: Mike Rapoport <rppt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Kees Cook <keescook@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>,
 Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Puranjay Mohan <puranjay12@gmail.com>,
 Rick P Edgecombe <rick.p.edgecombe@intel.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Steven Rostedt <rostedt@goodmis.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>,
 bpf <bpf@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org,
 linux-mm <linux-mm@kvack.org>,
 linux-modules@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 linux-s390 <linux-s390@vger.kernel.org>,
 linux-trace-kernel@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 loongarch@lists.linux.dev,
 netdev@vger.kernel.org,
 sparclinux@vger.kernel.org,
 the arch/x86 maintainers <x86@kernel.org>
Message-Id: <7F566E60-C371-449B-992B-0C435AD6016B@gmail.com>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-3-rppt@kernel.org>
 <f9a7eebe-d36e-4587-b99d-35d4edefdd14@app.fastmail.com>
 <20230618080027.GA52412@kernel.org>
 <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com>
To: Andy Lutomirski <luto@kernel.org>,
 Song Liu <song@kernel.org>
X-Mailer: Apple Mail (2.3731.600.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_131830_889772_6859CB30 
X-CRM114-Status: GOOD (  16.09  )
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

Cgo+IE9uIEp1biAxOSwgMjAyMywgYXQgMTA6MDkgQU0sIEFuZHkgTHV0b21pcnNraSA8bHV0b0Br
ZXJuZWwub3JnPiB3cm90ZToKPiAKPiBCdXQgaml0X3RleHRfYWxsb2MoKSBjYW4ndCBkbyB0aGlz
LCBiZWNhdXNlIHRoZSBvcmRlciBvZiBvcGVyYXRpb25zIGRvZXNuJ3QgbWF0Y2guICBXaXRoIGpp
dF90ZXh0X2FsbG9jKCksIHRoZSBleGVjdXRhYmxlIG1hcHBpbmcgc2hvd3MgdXAgYmVmb3JlIHRo
ZSB0ZXh0IGlzIHBvcHVsYXRlZCwgc28gdGhlcmUgaXMgbm8gYXRvbWljIGNoYW5nZSBmcm9tIG5v
dC10aGVyZSB0byBwb3B1bGF0ZWQtYW5kLWV4ZWN1dGFibGUuICBXaGljaCBtZWFucyB0aGF0IHRo
ZXJlIGlzIGFuIG9wcG9ydHVuaXR5IGZvciBDUFVzLCBzcGVjdWxhdGl2ZWx5IG9yIG90aGVyd2lz
ZSwgdG8gc3RhcnQgZmlsbGluZyB2YXJpb3VzIGNhY2hlcyB3aXRoIGludGVybWVkaWF0ZSBzdGF0
ZXMgb2YgdGhlIHRleHQsIHdoaWNoIG1lYW5zIHRoYXQgdmFyaW91cyBhcmNoaXRlY3R1cmVzIChl
dmVuIHg4NiEpIG1heSBuZWVkIHNlcmlhbGl6YXRpb24uCj4gCj4gRm9yIGVCUEYtIGFuZCBtb2R1
bGUtIGxpa2UgdXNlIGNhc2VzLCB3aGVyZSBKSVR0aW5nL2NvZGUgZ2VuIGlzIHF1aXRlIGNvYXJz
ZS1ncmFpbmVkLCBwZXJoYXBzIHNvbWV0aGluZyB2YWd1ZWx5IGxpa2U6Cj4gCj4gaml0X3RleHRf
YWxsb2MoKSAtPiByZXR1cm5zIGEgaGFuZGxlIGFuZCBhbiBleGVjdXRhYmxlIHZpcnR1YWwgYWRk
cmVzcywgYnV0IGRvZXMgKm5vdCogbWFwIGl0IHRoZXJlCj4gaml0X3RleHRfd3JpdGUoKSAtPiB3
cml0ZSB0byB0aGF0IGhhbmRsZQo+IGppdF90ZXh0X21hcCgpIC0+IG1hcCBpdCBhbmQgc3luY2hy
b25pemUgaWYgbmVlZGVkIChubyBzeW5jIG5lZWRlZCBvbiB4ODYsIEkgdGhpbmspCgpBbmR5LCB3
b3VsZCB5b3UgbWluZCBleHBsYWluaW5nIHdoeSB5b3UgdGhpbmsgYSBzeW5jIGlzIG5vdCBuZWVk
ZWQ/IEkgbWVhbiBJIGhhdmUgYSDigJxmZWVsaW5n4oCdIHRoYXQgcGVyaGFwcyBUU08gY2FuIGd1
YXJhbnRlZSBzb21ldGhpbmcgYmFzZWQgb24gdGhlIG9yZGVyIG9mIHdyaXRlIGFuZCBwYWdlLXRh
YmxlIHVwZGF0ZS4gSXMgdGhhdCB0aGUgYXJndW1lbnQ/CgpPbiB0aGlzIHJlZ2FyZCwgb25lIHRo
aW5nIHRoYXQgSSBjbGVhcmx5IGRvIG5vdCB1bmRlcnN0YW5kIGlzIHdoeSAqdG9kYXkqIGl0IGlz
IG9rIGZvciB1c2VycyBvZiBicGZfYXJjaF90ZXh0X2NvcHkoKSBub3QgdG8gY2FsbCB0ZXh0X3Bv
a2Vfc3luYygpLiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nPwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
