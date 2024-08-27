Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCA5C5472F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 17:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PebdM/CUo01SR675U1/RWfrY4Ami1L+6bZIKez9huHc=; b=tA5XehfOzG5eH2
	1pytK2A0+kdqsjhWqmfUuJCBDf6OWLyNMpSyFRym7z88otdWa/xmu8sMMPoLkDjFiHY4Q2uh4a/DR
	1v1oRJdFTP7b/cXNhZEfGy5fkNTBI3zvw4WjTTINLbNrvxXIg6X04/V0C54LwVt8Uz4Xy25wtTWJc
	f95ZsJNwdunPjLxPQXrlxpIjAWPb6GPWOE2d4fzR6Fle7wO4MRVIaa3V2dgJpFUdnQPMu5gohMvOP
	q3YGPuGtt8XX7anYOpgT080QR0RzVuNYBM7FC8IbtNx7qfNjgOUxoyFFlKO0I4F79Z6BbK0N1F9Ul
	Tao/u7QkJ9ZXGxQwtFqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj03j-0000000CJCO-0kbG;
	Tue, 27 Aug 2024 17:32:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sizkG-0000000CFKo-0Han;
	Tue, 27 Aug 2024 17:12:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GsPidUHkz4C3/JOcnXhLkx5eUAmH8j+kPTyAA4w6q6k=; b=iFJoKhzKM/WCnw78qLxZegC87b
	iElDgjdp7Hw6mK95dDQsBkqN6yoifpmLct4swIPcgdZgG2a+d+mXVdxm9Lb70QKXfsXM1vF7oD+bf
	ZeNiQVf9Lkow6FpMmsC5GuHOf4+Fg3zf+IGbI4tpE93t27rp4q6/Lol7qU3Ry9704+Ehl995o3PnH
	4MFWejTpxb6E4Qj9UqBBaQof5X2W50BrrlawudYfQDGvBcX0rn8w8nmu7TrwbvGkWzvIfHVDSeN/J
	jXkNWnEEMLAi99XcoChMqAuPIj1YL0+s5/r81lv2bym4a4sl+amsllw/P4izWX8SdHIk2wkzgwQe5
	Hnmrygmg==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sizkC-0000000Auy5-2DvC;
	Tue, 27 Aug 2024 17:12:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D14E5A42525;
	Tue, 27 Aug 2024 17:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A9CC4DE12;
	Tue, 27 Aug 2024 17:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724778743;
	bh=089Q0VO8GXMKA5GhUHPQu2rPCYw84zh09Ml5OYxdz68=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dhBvK4Sb/o23wrZW7Mrt5iWQIiEn+jadXQTYu1Rk2n915iNQ4gZQbkEf5G1TaOk7k
	 PXLr7c8PZZV1AozzrJTnD9lppGB1j7AurrJpQEYkX3yCKSlNwYVynRBYhX5tKCFZ8B
	 OKLZQ69zPJNqNiNMEm4ga0zi4UZ3JAp2WdLtGwr6Gcalhao+7BrSIoffhar+yV5LIt
	 jf29LRVcJnQKEliVHu1M6h0jmyrljxMxwXhkOJ4J33kQ23gByKi2hwFl37Nq+VBsrH
	 4MVdD6TI4zcjK683eaexn+32y2m7Jh8M+8lkUmj6q3t+g3AStgAYMIDaUKirQLlNsQ
	 wuBExyyLxjDJw==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2705d31a35cso5008605fac.0;
        Tue, 27 Aug 2024 10:12:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqVx+qu7IniXMegFq3DyMWo36s+NXjeHMypNmtP6RLBEQh2ErA1k/CEgP7OECk/cC9l+RXaOkdfuj3M1o=@lists.infradead.org, AJvYcCWDFEvU/VQ6OKSU0SQZ8Agj+5B6kIpWYeWdGJLeQ4SaNPeEej6ePtF8GCeLaylmc/ER+TN/RWODqNHrm17S3hz2@lists.infradead.org
X-Gm-Message-State: AOJu0YxQEs2Hy3aOuqvdV+DRCZtLlkwvzH0qFMXb9zeP7YQpNbEq/D6Z
	EX1I9KUQ7gcgmh5rBH5fmbMz1B62EAP9/5pAiYcHKRapylPDOMXluVApVH8u+9PqbslJNSHA11t
	mkrpt1cBwxFUHJTtyLQQgZdLVkng=
X-Google-Smtp-Source: AGHT+IEi+8s9/sVzsiTVwscNVREvFCPTsaKYFoVZmsBGqFAgUmBmznctQE6RetdHOf6mO/SZ096Q9h8qJmnqUy0gcrs=
X-Received: by 2002:a05:6870:210a:b0:270:6bae:5573 with SMTP id
 586e51a60fabf-27759e7bb0fmr4006576fac.28.1724778742659; Tue, 27 Aug 2024
 10:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
 <ZrlgVUXC_dCW9ISM@sunil-laptop> <87mskzcnmf.ffs@tglx> <CAJZ5v0imJcU4cwDuZKEvGf93fZm4ea4s2Ocp3Cnfb3+nBQ0-Gg@mail.gmail.com>
 <Zsy3o_N8hvc6GfTp@sunil-laptop> <CAJZ5v0hxoT9tBjm3xRPU4fHx3MgHfYAx_Vyf4oe2toa3GWAN+Q@mail.gmail.com>
 <87jzg3c7bz.ffs@tglx> <CAJZ5v0iMpaxBevgPWmD2Ym_JG1ChkjzVFf22fV7Xw8-ssg9+Ag@mail.gmail.com>
 <Zs4HCZH3M9nRXUvu@sunil-laptop>
In-Reply-To: <Zs4HCZH3M9nRXUvu@sunil-laptop>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 27 Aug 2024 19:12:11 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0i-8N8VG-D4FRh0qFxt44Ax4TKY_CiFhZxLCzkhQrt0=Q@mail.gmail.com>
Message-ID: <CAJZ5v0i-8N8VG-D4FRh0qFxt44Ax4TKY_CiFhZxLCzkhQrt0=Q@mail.gmail.com>
Subject: Re: [PATCH v8 00/17] RISC-V: ACPI: Add external interrupt controller support
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Anup Patel <anup@brainfault.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Robert Moore <robert.moore@intel.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
	Drew Fustini <dfustini@tenstorrent.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_181236_964163_02D008C0 
X-CRM114-Status: GOOD (  20.21  )
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

T24gVHVlLCBBdWcgMjcsIDIwMjQgYXQgNzowNOKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXVnIDI3LCAyMDI0IGF0IDA2OjIwOjI0
UE0gKzAyMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gT24gTW9uLCBBdWcgMjYsIDIw
MjQgYXQgMTE6MjLigK9QTSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgQXVnIDI2IDIwMjQgYXQgMTk6MjcsIFJhZmFlbCBKLiBX
eXNvY2tpIHdyb3RlOgo+ID4gPiA+IE9uIE1vbiwgQXVnIDI2LCAyMDI0IGF0IDc6MjLigK9QTSBT
dW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPiA+ID4+IFRoZXJl
IHdpbGwgYmUgYSBjb25mbGljdCBpbiBQTElDIGlycWNoaXAgZHJpdmVyIGR1ZSB0byBhIHJlY2Vu
dCBwYXRjaCBbMV0uCj4gPiA+ID4+IFRoaXMgcGF0Y2ggaXMgbm90IGluIGxhdGVzdCBSQzUgcmVs
ZWFzZSBidXQgaW4gbGludXgtbmV4dC4gSSB1c3VhbGx5IGJhc2UgdGhlCj4gPiA+ID4+IHNlcmll
cyBvbiBsYXRlc3QgUkMgcmVsZWFzZS4gU2hvdWxkIEkgcmViYXNlIHRvIGxpbnV4LW5leHQgaW4g
dGhpcyBjYXNlCj4gPiA+ID4+IGFuZCBzZW5kIHRoZSBuZXh0IHJldmlzaW9uIG9mIHRoZSBzZXJp
ZXMgcmVzb2x2aW5nIHRoZSBjb25mbGljdD8KPiA+ID4gPgo+ID4gPiA+IE5vLCBwbGVhc2UgZG9u
J3QuCj4gPiA+ID4KPiA+ID4gPiBUaGF0IHdpbGwgYmUgcmVzb2x2ZWQgYXQgdGhlIG1lcmdlIHRp
bWUuCj4gPiA+Cj4gPiA+IEFsdGVybmF0aXZlbHkgeW91IGNhbiBwdWxsCj4gPiA+Cj4gPiA+ICAg
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RpcC90aXAuZ2l0
IGlycS11cmdlbnQtMjAyNC0wOC0yNQo+ID4gPgo+ID4gPiB3aGljaCBJJ20gYWJvdXQgdG8gc2Vu
ZCB0byBMaW51cyBsYXRlc3QgdG9tb3Jyb3cgbW9ybmluZy4gVGhhdCBjb250YWlucwo+ID4gPiB0
aGUgY29uZmxpY3RpbmcgY2hhbmdlLgo+ID4KPiA+IFNvIEkndmUgYXBwbGllZCB0aGUgc2VyaWVz
IG9uIHRvcCBvZiB0aGUgYWJvdmUuCj4gPgo+IFRoYW5rcyEKPgo+ID4gVGhpcyBpbmNsdWRlZCBh
IGZ1bGwtc3dpbmcgcmViYXNlIG9mIHRoZSBsYXN0IHBhdGNoLCB3aGljaCBJIGhvcGUgSSd2ZQo+
ID4gZG9uZSBjb3JyZWN0bHksIGJ1dCBTdW5pbCBwbGVhc2Ugc2VlCj4gPgo+IFllYWgsIHNvcnJ5
IGFib3V0IHRoYXQuIFlvdSBoYXZlIHJlc29sdmVkIG1vc3Qgb2YgdGhlIGNvbmZsaWN0cyBidXQg
ZmV3Cj4gYXJlIG1pc3NpbmcgKHdoaWNoIHdlcmUgbm90IG9idmlvdXMgYW55d2F5KS4gQ291bGQg
eW91IHBsZWFzZSB0YWtlIGJlbG93Cj4gY29tbWl0IGFuZCBzcXVhc2g/Cj4KPiBodHRwczovL2dp
dGh1Yi5jb20vdmxzdW5pbC9saW51eC9jb21taXQvYzg1ZjlkMGRjMzFjMGU3NzkxNmVjZGJiNDU3
NzQ4YzA1Y2Y0ZTc1YQoKQ2FuIHlvdSBwbGVhc2Ugc2VuZCBtZSBhIGRpZmY/CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
