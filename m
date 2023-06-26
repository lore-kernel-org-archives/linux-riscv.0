Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C1DEB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 14:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GCT0HIOzX1keclbN8zhlwVMTxLUpeztl9ojiD0V9To4=; b=N2huCyBiQGN73S6KBtmpinPriF
	41OZv69g/5NwyrZCQo5vVBTLHhaE2Ia6G/50xEN02faHRolVIyZkapM6cHRARt4Tne1q9Y8676nia
	NjhmqG9ohM8mVZGonAWKgWQIlX1+K7tWE0NqrBdgUSB/ecfsxowq8lL/RYMAUe4P5/qtl7pddZ3dw
	XoBhj5aZoMwSZAP56DAsEFyJ0NeTyx+cU0Uwnu4mronjR7E3qqNXGioPXaei4Ft6N8gPGxUUn6xQx
	0g5Mk78tGH7i07lOPhPrbjj+ntJ+0PtCSRsjyK5kuS1s1kzmreGd/TQ6CuodpzINkwaAXDY69b/nj
	rsDcvkyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDnRW-00APxx-00;
	Mon, 26 Jun 2023 14:43:50 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDnRS-00APx5-1F
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 14:43:48 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6687446eaccso3145840b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 07:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687790623; x=1690382623;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLwVC7ihwJgCLNAPdbYZ1bRYjS7hN3YK9btRuGB162w=;
        b=OiF+mqIEDLR+vsRfE9GqbFFYC38vHP5P012nTnSj3OP2PidFhBwtflPE0+0txPNHmv
         LhnKSwTEMGSiV+A9BdWZ2tgdTmVjAF7Wr6K99AjtPjLcCBCsurGzM9Qzw6fdbFN+32hd
         GgzIm71SA9INcIBFB8pHtvzScCYKqm7Fwmz6H97CIMM6UlJZsPJM+8nnZZep+0yYF4Mn
         3eC5v6pUhKVptMWQd+jtB5r4MFz6vMNmOe2sDdeP6EZNegvTloNYDfYoo18as4K0MaER
         YstNBClDRhUT7pqrLtA8nwt2SH3iDD3AjL6NZQQYfAhKFTDG9FvKVpqM2vuSkWB06gKz
         BM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687790623; x=1690382623;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLwVC7ihwJgCLNAPdbYZ1bRYjS7hN3YK9btRuGB162w=;
        b=cDgM9epLc0xYQ/CxQ5WGLrC/wibjHm2QPZ7MRZ278rHkaTeumVdIu0mNszeg5GByn8
         b23VjPjCYwP5D34udxMU6Jh0E70mQMKxI6BdvD0hCyPfpRx4VlOv+V9bVMgaqbJwOUUh
         uALJb1j2cw8PcbXzjspajy+jxy37UQOwLTE5divRM8+OyYDzMN4rox7h+TGLfuHk2XcQ
         IPcwad9u2/QyRexXZetFgoYbFTsft+WaXlKM4vfbW0EjSWzPivpW7jZDeoezeR0BO55u
         4RNpVvq272ZVEVxF/lCLYKtfvs6q/JsUiO6R7aIYQbXItG5yHwfkjxwonfLGYdRXaJGa
         t+Bw==
X-Gm-Message-State: AC+VfDzjWdx7zzS4G0xgnZk6Jc2NKmw0syHr1aVnbNshK2eA46dNjIEV
	/bCFhOIPskEi1eann+hNtPL6NQ==
X-Google-Smtp-Source: ACHHUZ7ozozA+9/vM7RpuhtbNja+Yppkp8D7Oz2+QNA1Rr+8637hn1QfzKDpsKeKamfqiVtfb83iAg==
X-Received: by 2002:a05:6a00:10d5:b0:666:e42c:d5fb with SMTP id d21-20020a056a0010d500b00666e42cd5fbmr32869624pfu.32.1687790622785;
        Mon, 26 Jun 2023 07:43:42 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id d6-20020aa78146000000b0066145d63b1asm3898769pfn.138.2023.06.26.07.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 07:43:42 -0700 (PDT)
Date: Mon, 26 Jun 2023 07:43:42 -0700 (PDT)
X-Google-Original-Date: Mon, 26 Jun 2023 07:43:04 PDT (-0700)
Subject: Re: [PATCH V1 1/3] Revert "RISC-V: mark hibernation as nonportable"
In-Reply-To: <20230626-mousy-latter-ad8088de089f@wendy>
CC: Conor Dooley <conor@kernel.org>, suagrfillet@gmail.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, robh+dt@kernel.org, frowand.list@gmail.com,
  ajones@ventanamicro.com, alexghiti@rivosinc.com, mpe@ellerman.id.au, Arnd Bergmann <arnd@arndb.de>,
  rppt@kernel.org, samuel@sholland.org, panqinglin2020@iscas.ac.cn, anup@brainfault.org,
  xianting.tian@linux.alibaba.com, anshuman.khandual@arm.com, heiko@sntech.de, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-f018e5e3-61f5-47ee-a2ae-95309bbdb208@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_074346_655441_4F26176C 
X-CRM114-Status: GOOD (  43.69  )
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

T24gTW9uLCAyNiBKdW4gMjAyMyAwNjozNDo0MyBQRFQgKC0wNzAwKSwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFN1biwgSnVuIDI1LCAyMDIzIGF0IDAzOjM2OjA2UE0gLTA3MDAsIFBhbG1lciBE
YWJiZWx0IHdyb3RlOgo+PiBPbiBTdW4sIDI1IEp1biAyMDIzIDE1OjE1OjE0IFBEVCAoLTA3MDAp
LCBDb25vciBEb29sZXkgd3JvdGU6Cj4+ID4gT24gU3VuLCBKdW4gMjUsIDIwMjMgYXQgMTE6MDk6
MjFQTSArMDgwMCwgU29uZyBTaHVhaSB3cm90ZToKPj4gPiA+IOWcqCAyMDIzLzYvMjUgMjI6MTgs
IENvbm9yIERvb2xleSDlhpnpgZM6Cj4+ID4gPiA+IE9uIFN1biwgSnVuIDI1LCAyMDIzIGF0IDEw
OjA5OjI5UE0gKzA4MDAsIFNvbmcgU2h1YWkgd3JvdGU6Cj4+ID4gPiA+ID4gVGhpcyByZXZlcnRz
IGNvbW1pdCBlZDMwOWNlNTIyMTg1NTgzYjE2M2JkMGM3NGYwZDlmMjk5ZmUxODI2Lgo+PiA+ID4g
PiA+ID4gPiBXaXRoIHRoZSBjb21taXQgMzMzNTA2OGY4NzIxICgicmlzY3Y6IFVzZSBQVUQvUDRE
L1BHRCBwYWdlcwo+PiA+ID4gZm9yIHRoZQo+PiA+ID4gPiA+IGxpbmVhciBtYXBwaW5nIikgcmV2
ZXJ0ZWQsIHRoZSBNSU5fTUVNQkxPQ0tfQUREUiBwb2ludHMgdGhlIGtlcm5lbAo+PiA+ID4gPiA+
IGxvYWQgYWRkcmVzcyB3aGljaCB3YXMgcGxhY2VkIGF0IGEgUE1EIGJvdW5kYXJ5Lgo+PiA+ID4g
PiA+ID4gQW5kIGZpcm13YXJlIGFsd2F5cwo+PiA+ID4gPiA+IGNvcnJlY3RseSBtYXJrIHJlc2lk
ZW50IG1lbW9yeSwgb3IgbWVtb3J5IHByb3RlY3RlZCB3aXRoIFBNUCBhcwo+PiA+ID4gPiA+IHBl
ciB0aGUgZGV2aWNldHJlZSBzcGVjaWZpY2F0aW9uIGFuZC9vciB0aGUgVUVGSSBzcGVjaWZpY2F0
aW9uLgo+PiA+ID4gPiA+IEJ1dCB0aGlzIGlzIG5vdCB0cnVlPyBUaGUgdmVyc2lvbnMgb2YgT3Bl
blNCSSB0aGF0IHlvdSBtZW50aW9uCj4+ID4gPiBpbiB5b3VyCj4+ID4gPiA+IGNvdmVyIGxldHRl
ciBkbyBub3QgZG8gdGhpcy4KPj4gPiA+ID4gUGxlYXNlIGV4cGxhaW4uCj4+ID4gPiA+Cj4+ID4g
PiAKPj4gPiA+IEF0IHRoaXMgdGltZSwgT3BlblNiaSBbdjAuOCx2MS4zKSBhbmQgZWRrMihSaXNj
VlZpcnQpIGluZGVlZCBkb24ndCBvYmV5IHRoZQo+PiA+ID4gRFQvVUVGSSBzcGVjLiBUaGlzIHN0
YXRlbWVudCBpcyBleGNlcnB0ZWQgZnJvbSAiUmVzZXJ2ZWQgbWVtb3J5IGZvciByZXNpZGVudAo+
PiA+ID4gZmlybXdhcmUiIHBhcnQgZnJvbSB0aGUgdXBjb21pbmcgcmlzY3YvYm9vdC5yc3QuIEl0
IGlzbid0IGFjY3VyYXRlIGZvciBub3cuCj4+ID4gPiBIb3cgYWJvdXQgZGVsZXRpbmcgdGhpcyBv
bmU/Cj4+ID4gCj4+ID4gSXQgaXMgaW5jb3JyZWN0LCBzbyBpdCB3aWxsIG5lZWQgdG8gYmUgcmVt
b3ZlZCwgeWVzLgo+PiA+IFVuZm9ydHVuYXRlbHkgd3JpdGluZyBhIGRvYyBkb2VzIG5vdCBmaXgg
dGhlIGV4aXN0aW5nIGltcGxlbWVudGF0aW9ucyA6KAo+PiA+IAo+PiA+ID4gQWN0dWFsbHkgd2l0
aCAzMzM1MDY4Zjg3MjEgcmV2ZXJ0ZWQsIHRoZSBjaGFuZ2Ugb2YgTUlOX01FTUJMT0NLX0FERFIg
Y2FuCj4+ID4gPiBhdm9pZCB0aGUgbWFwcGluZyBvZiBmaXJtd2FyZSBtZW1vcnksIEkgd2lsbCBt
YWtlIGl0IGNsZWFyIGluIHRoZSBuZXh0Cj4+ID4gPiB2ZXJzaW9uLgo+PiA+IAo+PiA+IFRvIGJl
IGhvbmVzdCwgSSdkIGxpa2UgdG8gc2VlIHRoaXMgcmV2ZXJ0IGFzIHRoZSBmaW5hbCBjb21taXQg
aW4gYQo+PiA+IHNlcmllcyB0aGF0IGRlYWxzIHdpdGggdGhlIHByb2JsZW0gYnkgYWN0dWFsbHkg
cmVzZXJ2aW5nIHRoZSByZWdpb25zLAo+PiA+IHJhdGhlciB0aGFuIGEgc2V0IG9mIHJldmVydHMg
dGhhdCBnbyBiYWNrIHRvIGhvdyB3ZSB3ZXJlLgo+PiA+IEkgd2FzIGhvcGluZyB0aGF0IHNvbWVv
bmUgd2hvIGNhcmVzIGFib3V0IGhpYmVybmF0aW9uIHN1cHBvcnQgd291bGQgYmUKPj4gPiBpbnRl
cmVzdGVkIGluIHdvcmtpbmcgb24gdGhhdCAtICpjb3VnaCogc3RhcmZpdmUgKmNvdWdoKiwgYWx0
aG91Z2ggbWF5YmUKPj4gPiB0aGV5IGp1c3QgZml4ZWQgdGhlaXIgT3BlblNCSSBhbmQgbW92ZWQg
b24uCj4+ID4gSWYgdGhlcmUgd2VyZSBubyB2b2x1bnRlZXJzLCBteSBpbnRlbnRpb24gd2FzIHRv
IGFkZCBhIGZpcm13YXJlIGVycmF0dW0KPj4gPiB0aGF0IHdvdWxkIHByb2JlIHRoZSBTQkkgaW1w
bGVtZW50YXRpb24gJiB2ZXJzaW9uIElEcywgYW5kIGFkZCBhIGZpcm13YXJlCj4+ID4gZXJyYXR1
bSB0aGF0J2QgcGFyc2UgdGhlIERUIGZvciB0aGUgb2ZmZW5kaW5nIHJlZ2lvbnMgYW5kIHJlc2Vy
dmUgdGhlbS4KPj4gCj4+IElzIHRoZXJlIGFueSBhY3R1YWwgdXNlIGNhc2UgZm9yIGhpYmVybmF0
aW9uIG9uIHRoZXNlIGJvYXJkcz8gIE1heWJlIGl0J3MKPj4gc2ltcGxlciB0byBqdXN0IGFkZCBh
ICJyZXNlcnZlZCByZWdpb25zIGFjdHVhbGx5IHdvcmsiIHNvcnQgb2YgcHJvcGVydHkgYW5kCj4+
IHRoZW4gaGF2ZSBuZXcgZmlybXdhcmUgc2V0IGl0IC0tIHRoYXQgd2F5IHdlIGNhbiBhdm9pZCBz
b3J0aW5nIHRocm91Z2ggYWxsCj4+IHRoZSBvbGQgc3R1ZmYgbm9ib2R5IGNhcmVzIGFib3V0IGFu
ZCBqdXN0IGdldCBvbiB3aXRoIGZpeGluZyB0aGUgc3R1ZmYKPj4gcGVvcGxlIHVzZS4KPgo+IFdo
YXQgaXMgIm9sZCBzdHVmZiBub2JvZHkgY2FyZXMgYWJvdXQiPyBUaGUgZmlyc3QgdmVyc2lvbiBv
ZiBPcGVuU0JJIHdpdGgKPiB0aGUgZml4IHNoaXBwZWQgb25seSB0aGUgb3RoZXIgZGF5LCBzbyBl
ZmZlY3RpdmVseSBhbGwgY3VycmVudCBzdHVmZiBoYXMKPiB0aGlzIHByb2JsZW0uIENlcnRhaW5s
eSBldmVyeXRoaW5nIHNoaXBwaW5nIGZyb20gdmVuZG9ycyBhdCB0aGUgbW9tZW50Cj4gaGFzIHRo
ZSBwcm9ibGVtLCBhbmQgcHJvYmFibHkgd2hhdGV2ZXIgZG93bnN0cmVhbSwgY3VzdG9tIHZlcnNp
b25zIG9mCj4gT3BlblNCSSBhbHNvIGhhdmUgaXQuCgpZYSwgc28gIm9sZCBzdHVmZiIgaXMgZXZl
cnl0aGluZyAtLSBidXQgdGhhdCdzIGFsbCBhbHJlYWR5IGJyb2tlbiwgc28gCm5vdGhpbmcgd2Ug
Y2FuIGRvIGFib3V0IGl0LiAgSUlVQyB0aGVyZSdzIG5vdGhpbmcgc2hpcHBpbmcgdGhhdCAKZnVu
Y3Rpb25zIGNvcnJlY3RseSBoZXJlLCBzbyBpdCdzIGp1c3QgYSBtYXR0ZXIgb2YgZGV0ZWN0aW5n
IGV2ZXJ5dGhpbmcgCmJlZm9yZSB0aGUgYnVnLgoKPiBBbHNvLCB0aGUgcHJvYmxlbSBpc24ndCBq
dXN0IGxpbWl0ZWQgdG8gaGliZXJuYXRpb24gYXBwYXJlbnRseS4gSQo+IHRoaW5rIGl0IHdhcyBt
ZW50aW9uZWQgaW4gdGhlIGNvdmVyIGxldHRlciB0aGF0IGFjY29yZGluZyB0byBSb2IsCj4gd2l0
aG91dCBiZWluZyBtYXJrZWQgYXMgbm8tbWFwIHdlIGNvdWxkIGFsc28gc2VlIHNwZWN1bGF0aXZl
IGFjY2VzcyAmCj4gcG90ZW50aWFsbHkgc29tZSBvZiB0aGUgbWVtb3J5IGRlYnVnZ2luZyBzdHVm
ZiB3YWxraW5nIHRoZXNlIHJlZ2lvbnMuCgpXZSd2ZSBnb3QgYSBidW5jaCBvZiBvdGhlciBwcm9i
bGVtcyBhcm91bmQgc3BlY3VsYXRpdmUgYWNjZXNzZXMgdG8gdGhlc2UgCnJlZ2lvbnMgaW4gTS1t
b2RlLCBzbyB3ZSdsbCBoYXZlIHRvIGRlYWwgd2l0aCBpdCBhdCBzb21lIHBvaW50IGFueXdheS4K
Cj4gSSdtIG5vdCBzdXJlIGhvdyB5b3UnZCBpbnRlbmQgY29tbXVuaWNhdGluZyAicmVzZXJ2ZWQg
cmVnaW9ucyBhY3R1YWxseQo+IHdvcmsiLCBJIGZpZ3VyZSB5b3UgbWVhbiB2aWEgRFQ/CgpTb21l
d2hlcmUgaW4gRFQuICBJIGhhZG4ndCB0aG91Z2h0IGFib3V0IGl0IGEgdG9uLCBqdXN0IGFkZGlu
ZyBzb21lIApwcm9wZXJ0eSB0aGF0IHNheXMgInRoaXMgZG9lc24ndCBoYXZlIHRoZSBidWciIHdh
cyByb3VnaGx5IHRoZSBpZGVhLgoKPiBJIGRvbid0IHJlYWxseSBzZWUgdGhlIGJlbmVmaXQgb2Yg
YWRkaW5nIGEgcHJvcGVydHkgZm9yIHRob3NlIHdobyBhcmUKPiBiZWhhdmluZywgaWYgd2UgY2Fu
IGRldGVjdCB0aGUgdmVyc2lvbnMgb2YgdGhlIG9uZSByZWxldmFudCBTQkkKPiBpbXBsZW1lbnRh
dGlvbiB0aGF0IGFyZSBicm9rZW4gYXQgcnVudGltZS4gRFQgaGF0IG9uLCBldmVuIGxlc3Mgc28u
Cj4gUGVyaGFwcyBJIGFtIG1pc3NpbmcgeW91ciBwb2ludCwgYW5kIHRoZXJlJ3MgYW5vdGhlciBh
bmdsZSAobGlrZSB0cnlpbmcKPiB0byBwZXIgZmlybXdhcmUgY29kZSk/CgpJZiBpdCdzIGVhc3kg
dG8gZmlndXJlIG91dCB3aGljaCB2ZXJzaW9ucyBhcmUgYnJva2VuIHRoYXQgc2VlbXMgZmluZSB0
byAKbWUuICBNeSB3b3JyeSB3YXMganVzdCB0aGF0J3MgaGFyZCB0byBkbyAoZm9sa3MgZm9ya2lu
ZyBPcGVuU0JJKSBhbmQgaXQgCm1pZ2h0IGJlIGVhc2llciB0byBqdXN0IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
