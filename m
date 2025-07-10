Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4143AC83F1D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 12:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eYsIrxpe27BgjcJ2RU5PUTVK7reTsyifP7arci66BCI=; b=h9X/zGVrjoTOMV
	4glzrtaujSp4b4I728tqO5bEQdaxzFC7aLLhowDqEA1FCUY0fkDvUwfYKqiGSrakmP5x/GKKAwkUc
	khqhcP0ChPLs90ldKEFG7NmEnu6Enks5zWuaceyw9mftsoaySdP6FH/quj1dTdPiKlXYtAT1b+jRS
	Ef3aSMLboQY//j+LmaG54aTX7B5uVeJYaKq/I2iK/WcR+1zaycd/gnFj58f76hv3rjJrYiYdYd4Ey
	gYOujZTx+i9ucBENRy/52Dw8V49J0vYGbmi2fSmDRUYHtmgiZ6aKE8Dcmx95zdDhqG9B1/hgbsdMw
	sWaeFbYmfHHsZEXA5GEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqoe-0000000BqWR-33WD;
	Thu, 10 Jul 2025 12:55:56 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpkc-0000000Bfek-3Jkc
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 11:47:44 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6116d9bb6ecso477971eaf.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 04:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1752148059; x=1752752859; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRJ7N+W5JU0EuTuULowXAGtXu+e/abUVNu+nA6+YkOg=;
        b=VLZpMmBkHj+yi34MdflUI2DlT/Ocv/fvmv+G9OAx7npcEYvFxp20m/4i5aM1nIb6bc
         qo9uaRKj+BMIaGKvWob+d+s/Os+O1FlcbeU3VzlVWQ/iGKEaA+uzZnR0a7gCSO10PWsv
         OCFgsJOxPpTo0U18WNiKEZDLMQGIuKpTIBKuaTkr753TI98y/J4nHjSliCuOQISUwLIJ
         isSpMKUuZF+kKVjWXhZJ2Ry2yKA6bn/FR9Uij1gyWTXKviqtwXEzmMC/0nHVG8ijKOzZ
         Xf1D79fZ5BkuwkOIZGDgacswZo44z5sJ/xMVyT08cAOyx/Lru5j9AO1fSrd2HYxJCaZp
         g38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752148059; x=1752752859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRJ7N+W5JU0EuTuULowXAGtXu+e/abUVNu+nA6+YkOg=;
        b=uQ66t6q4hxgzjLy2prrcWkhi/AVvlc2Cv250NDHnp5IoefyWPPju9psDqun9g31KTL
         IkJilPTOgehGKMK5lPNNdIsa7u8uLMAK5BA1XsxVht8PdMAmE2amvxUXOjzi9iWxkvV4
         8NkgBlSORuyDSIuUKUcK8SdtPqLFvd/aM4G4R+4Peiw9fmWkf+RkZObAlwVa+Th/nB8G
         mS+netYKs4ugZoU02T9L0/x/SC/XzKwIoNHvzCKY4SztQAyZT+t9CADECoT6ijGIX57G
         j/3Ysbtu0/tjsqfRo4U6Z60QdWIkpnLWaKDE4mWzALLA84SQ+mnRnpdRFfx7woipASHm
         32GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX+mhPy0GwNfGNm06WUfV49gemz9xZ/PIBJ99mBXaOJdNAD87VnQVkoy5u8KXK+ZTkDT+8p94ZY01XBw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+8/9abNxHa1l0WlRLLlBn6X8lpA3vc61H89ZgfjA3n1uS4D7y
	/dLSltvJXaIDk/71qIPiqH1BXH4sX3i8xbAMV32sYm2KtefVRrwW4phadgEuhIVLU9AS/xgtC9y
	iyumnNbv2/zhvQufxzbe4LzgaV9Px19IKIr1zU8IDHQ==
X-Gm-Gg: ASbGncudINgioONxBPDzV6runtatuqkOI2zs+/e5QitQKMHZhPCGT0o15Rvf2Kb9VwD
	OIHUz0BhTleZvyCurkK7l2Pnq0H8WVnNjlAh8y65nh+93aBAG/nzKLJIuGgdSFVMpbNJuvcXvSl
	u7jzndL2CAYIsY6d7HXLDQ6+lNpwwvZQEWJ2e39osPlaHbCQ==
X-Google-Smtp-Source: AGHT+IGkL47B+0utyAnO83uLx6JcDnDsO1PT+QZvP0dfZWDUEj9DS92oh6uIPmw6PeMPCn8E2rQmnD+e+3ahsKoanmI=
X-Received: by 2002:a05:6820:4c12:b0:613:d09e:7531 with SMTP id
 006d021491bc7-613d9de7a84mr1441606eaf.1.1752148059063; Thu, 10 Jul 2025
 04:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250704084500.62688-1-cuiyunhui@bytedance.com>
 <DB5U402ARSEO.4H4PE19LGCR7@ventanamicro.com> <CAEEQ3w=V6-d+YSWP=0WMt6UAZexrazq0UQjdyUmS3AnMtkdoKQ@mail.gmail.com>
 <DB6MLPA3BJ75.2U5FP5JSJD2LO@ventanamicro.com> <CAEEQ3wkoy3Jr0vZk=X4U56KYPq3=5t7Wr4RE6uNby3MS5qzh-g@mail.gmail.com>
 <DB7L9ZHZI3AI.36SXWX2SO9OS7@ventanamicro.com> <CAEEQ3wnaL5X_jXEmbbWFp3jx1Aq=02Gf7kDNBS=wcPyfEq7yBw@mail.gmail.com>
 <DB8607ITP9UR.2LOW61O3OVJ2F@ventanamicro.com>
In-Reply-To: <DB8607ITP9UR.2LOW61O3OVJ2F@ventanamicro.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 10 Jul 2025 19:47:27 +0800
X-Gm-Features: Ac12FXw9bF0Hi8EPNeiS01K8ULVFbmrHmgwK8R27PwbH4rDW7ZMa3s2RNd6nfSc
Message-ID: <CAEEQ3wmxJ50PZHVpdexeyy1ELqKw+5mrb+8gRCA4KNj9zsrykA@mail.gmail.com>
Subject: Re: [External] [PATCH] RISC-V: store percpu offset in CSR_SCRATCH
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, andybnac@gmail.com, 
	bjorn@rivosinc.com, cyrilbur@tenstorrent.com, rostedt@goodmis.org, 
	puranjay@kernel.org, ben.dooks@codethink.co.uk, zhangchunyan@iscas.ac.cn, 
	ruanjinjie@huawei.com, jszhang@kernel.org, charlie@rivosinc.com, 
	cleger@rivosinc.com, antonb@tenstorrent.com, ajones@ventanamicro.com, 
	debug@rivosinc.com, haibo1.xu@intel.com, samuel.holland@sifive.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>, wangziang.ok@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_044742_824661_000A144D 
X-CRM114-Status: GOOD (  30.18  )
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

SGkgUmFkaW0sCgpPbiBUaHUsIEp1bCAxMCwgMjAyNSBhdCAyOjM14oCvUE0gUmFkaW0gS3LEjW3D
ocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gMjAyNS0wNy0xMFQxMTo0
NTowNiswODowMCwgeXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Ogo+ID4gT24g
V2VkLCBKdWwgOSwgMjAyNSBhdCAxMDoyMOKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+PiBJcyB0aGUgb3ZlcmhlYWQgYWJvdmUgd2l0aCB0
aGlzIHBhdGNoPyAgQW5kIHdoZW4gd2UgdGhlbiB1c2UgdGhlCj4gPj4gQ1NSX1NDUkFUQ0ggZm9y
IHBlcmNwdSwgZG9lcyBpdCBkZWdyYWRlIGV2ZW4gZnVydGhlcj8KPiA+Cj4gPiBXZSBjYW4gc2Vl
IHRoYXQgdGhlIHBlcmNwdSBvcHRpbWl6YXRpb24gaXMgYXJvdW5kIDIuNSUgdGhyb3VnaCB0aGUK
PiA+IG1ldGhvZCBvZiBmaXhpbmcgcmVnaXN0ZXJzLCBhbmQgd2UgY2FuIGNvbnNpZGVyIHRoYXQg
dGhlIHBlcmNwdQo+ID4gb3B0aW1pemF0aW9uIGNhbiBicmluZyBhIDIuNSUgZ2Fpbi4gSXMgdGhl
cmUgbm8gbmVlZCB0byBhZGQgdGhlIHBlcmNwdQo+ID4gb3B0aW1pemF0aW9uIGxvZ2ljIG9uIHRo
ZSBiYXNpcyBvZiB0aGUgc2NyYXRjaCBwYXRjaCBmb3IgdGVzdGluZz8KPiA+Cj4gPiBSZWZlcmVu
Y2U6IGh0dHBzOi8vbGlzdHMucmlzY3Yub3JnL2cvdGVjaC1wcml2aWxlZ2VkL21lc3NhZ2UvMjQ4
NQo+Cj4gVGhhdCBpcyB3aGVuIHRoZSB2YWx1ZSBpcyBpbiBhIEdQUiwgdGhvdWdoLCBhbmQgd2Ug
ZG9uJ3Qga25vdyB0aGUKPiBwZXJmb3JtYW5jZSBvZiBhIENTUl9TQ1JBVENIIGFjY2Vzcy4KPiBX
ZSBjYW4gaG9wZSB0aGF0IGl0J3Mgbm90IG11Y2ggd29yc2UgdGhhbiBhIEdQUiwgYnV0IGFuIGlt
cGxlbWVudGF0aW9uCj4gbWlnaHQgY2hvb3NlIHRvIGJlIHZlcnkgc2xvdyB3aXRoIENTUl9TQ1JB
VENILgo+Cj4gSSBoYXZlIGluIG1pbmQgYW5vdGhlciBtZXRob2Qgd2hlcmUgd2UgY2FuIHVzZSB0
aGUgY3VycmVudCBDU1JfU0NSQVRDSAo+IHdpdGhvdXQgY2hhbmdpbmcgQ1NSX1RWQUwsIGJ1dCBJ
IGRvbid0IHJlYWxseSB3YW50IHRvIHNwZW5kIHRpbWUgb24gaXQKPiBpZiByZWFkaW5nIHRoZSBD
U1IgZG9lc24ndCBnaXZlIGFueSBiZW5lZml0Lgo+Cj4gSXQgd291bGQgYmUgdG8gc3RvcmUgdGhl
IHBlcmNwdSBvZmZzZXQgaW4gQ1NSX1NDUkFUQ0ggcGVybWFuZW50bHksIGRvCj4gdGhlIGVhcmx5
IGV4Y2VwdGlvbiByZWdpc3RlciBzaHVmZmxpbmcgd2l0aCBhIHBlcmNwdSBhcmVhIHN0b3JhZ2Us
IGFuZAo+IGxvYWQgdGhlIHRocmVhZCBwb2ludGVyIGZyb20gdGhlcmUgYXMgd2VsbC4KPiBUaGF0
IG1ldGhvZCB3b3VsZCBhbHNvIGVsaW1pbmF0ZSB3cml0aW5nIENTUl9TQ1JBVENIIG9uIGV2ZXJ5
IGV4Y2VwdGlvbgo+IGVudHJ5K2V4aXQsIHNvIG1heWJlIGl0IG1ha2VzIHNlbnNlIHRvIHRyeSBp
dCBldmVuIGlmIENTUnMgYXJlIHNsb3cuLi4KPgo+IFRoYW5rcy4KCgpCYXNlZCBvbiB0aGUgcGF0
Y2gsIG9wdGltaXphdGlvbnMgZm9yIHBlcmNwdSBvZmZzZXQgaGF2ZSBiZWVuIGFkZGVkLAp3aXRo
IHRoZSBmb2xsb3dpbmcgZGF0YToKNi45ODkgNy4wNDYgNi45NzYgNi45ODYgNy4wMDEgNy4wMTcg
Ny4wMDcgNy4wNjQgNy4wMDggNy4wMzkKR2VvbWV0cmljIG1lYW46IDcuMDEzMjQ4MzAzCkNvbXBh
cmVkIHRvIHJldXNpbmcgdGhlIHNjcmF0Y2ggcmVnaXN0ZXIsIHRoZSBwZXJmb3JtYW5jZSBoYXMg
aW1wcm92ZWQKYnkgYXBwcm94aW1hdGVseSAwLjclLgoKSWYgbW9yZSBvcHRpbWl6YXRpb25zIGNh
biBiZSBtYWRlIHRvIHRoZSBzY3JhdGNoIHJlZ2lzdGVyLCB0aGVyZQpzaG91bGQgYmUgZnVydGhl
ciBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudHMuCgpQYXRjaDoKLS0tCiBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BlcmNwdS5oIHwgMTQgKysrKysrKysrKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL2Fz
bS1vZmZzZXRzLmMgfCAgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TICAgICAgIHwgIDcg
KysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jICAgICB8ICAzICsrKwogNCBmaWxl
cyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wZXJjcHUuaAoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGVyY3B1LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BlcmNwdS5oCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMWZiZmNiMTA4Zjg0Ci0tLSAvZGV2L251bGwK
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZXJjcHUuaApAQCAtMCwwICsxLDE0IEBACisj
aWZuZGVmIF9fQVNNX1BFUkNQVV9ICisjZGVmaW5lIF9fQVNNX1BFUkNQVV9ICisKK3N0YXRpYyBp
bmxpbmUgdm9pZCBzZXRfbXlfY3B1X29mZnNldCh1bnNpZ25lZCBsb25nIG9mZikKK3sKKyAgICAg
ICAgY3NyX3dyaXRlKENTUl9TQ1JBVENILCBvZmYpOworfQorCisjZGVmaW5lIF9fbXlfY3B1X29m
ZnNldCBjc3JfcmVhZChDU1JfU0NSQVRDSCkKKworI2luY2x1ZGUgPGFzbS1nZW5lcmljL3BlcmNw
dS5oPgorCisjZW5kaWYKKwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNl
dHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMKaW5kZXggYTAzMTI5ZjQwYzQ2
Li4wY2U5NmYzMGJmMzIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRz
LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYwpAQCAtMzUsNiArMzUsNyBA
QCB2b2lkIGFzbV9vZmZzZXRzKHZvaWQpCiAgT0ZGU0VUKFRBU0tfVEhSRUFEX1M5LCB0YXNrX3N0
cnVjdCwgdGhyZWFkLnNbOV0pOwogIE9GRlNFVChUQVNLX1RIUkVBRF9TMTAsIHRhc2tfc3RydWN0
LCB0aHJlYWQuc1sxMF0pOwogIE9GRlNFVChUQVNLX1RIUkVBRF9TMTEsIHRhc2tfc3RydWN0LCB0
aHJlYWQuc1sxMV0pOworIE9GRlNFVChUQVNLX1RJX0NQVSwgdGFza19zdHJ1Y3QsIHRocmVhZF9p
bmZvLmNwdSk7CiAgT0ZGU0VUKFRBU0tfVElfRkxBR1MsIHRhc2tfc3RydWN0LCB0aHJlYWRfaW5m
by5mbGFncyk7CiAgT0ZGU0VUKFRBU0tfVElfUFJFRU1QVF9DT1VOVCwgdGFza19zdHJ1Y3QsIHRo
cmVhZF9pbmZvLnByZWVtcHRfY291bnQpOwogIE9GRlNFVChUQVNLX1RJX0tFUk5FTF9TUCwgdGFz
a19zdHJ1Y3QsIHRocmVhZF9pbmZvLmtlcm5lbF9zcCk7CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwppbmRleCBjYzJmZDRj
ZDU0YTAuLjgyY2FlZWU5MWMxNSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnku
UworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCkBAIC03NSw2ICs3NSwxMyBAQCBTWU1f
Q09ERV9TVEFSVF9OT0FMSUdOKGhhbmRsZV9leGNlcHRpb24pCiAgUkVHX1MgczQsIFBUX0NBVVNF
KHNwKQogIFJFR19TIHM1LCBQVF9UUChzcCkKCisgUkVHX0wgczAsIFRBU0tfVElfQ1BVKHRwKQor
IHNsbGkgczAsIHMwLCAzCisgbGEgczEsIF9fcGVyX2NwdV9vZmZzZXQKKyBhZGQgczEsIHMxLCBz
MAorIFJFR19MIHMxLCAwKHMxKQorIGNzcncgQ1NSX1NDUkFUQ0gsIHMxCisKICBsYSBzMSwgaGFu
ZGxlX2tlcm5lbF9leGNlcHRpb24KICBjc3J3IENTUl9UVkVDLCBzMQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYwpp
bmRleCBmYjZhYjdmOGJmYmQuLjZmYTEyY2M4NDUyMyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvc21wYm9vdC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYwpAQCAtNDMs
NiArNDMsNyBAQCBzdGF0aWMgREVDTEFSRV9DT01QTEVUSU9OKGNwdV9ydW5uaW5nKTsKCiB2b2lk
IF9faW5pdCBzbXBfcHJlcGFyZV9ib290X2NwdSh2b2lkKQogeworIHNldF9teV9jcHVfb2Zmc2V0
KHBlcl9jcHVfb2Zmc2V0KHNtcF9wcm9jZXNzb3JfaWQoKSkpOwogfQoKIHZvaWQgX19pbml0IHNt
cF9wcmVwYXJlX2NwdXModW5zaWduZWQgaW50IG1heF9jcHVzKQpAQCAtMjQwLDYgKzI0MSw4IEBA
IGFzbWxpbmthZ2UgX192aXNpYmxlIHZvaWQgc21wX2NhbGxpbih2b2lkKQogIG1tZ3JhYihtbSk7
CiAgY3VycmVudC0+YWN0aXZlX21tID0gbW07CgorIHNldF9teV9jcHVfb2Zmc2V0KHBlcl9jcHVf
b2Zmc2V0KGN1cnJfY3B1aWQpKTsKKwogIHN0b3JlX2NwdV90b3BvbG9neShjdXJyX2NwdWlkKTsK
ICBub3RpZnlfY3B1X3N0YXJ0aW5nKGN1cnJfY3B1aWQpOwoKLS0KMi40My4wCgpUaGFua3MsCll1
bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
