Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD8FC47DAF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 22:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=aMejWPNUwRrtQbmHVAVSvRJBn0UMnCgsf/dngQf5RU8=; b=kGl/mNF6A1L2O4kF/+Y1aZhXoV
	E7XDw6guQNNZURY0F95QBmSYIw4amlbsBMoXhaVyUxEHIP3DX2j9od+kFYAxFw2VTJ0OdImpoVMMY
	IJrEKsSi5zD524v4qd/oh9N/fH8fY38zyLqgdD/QjcNtLRdxW3Dmcnr6bNFCcnwcxDmAIBxYK8WlG
	4rptr3AeWFNTxGKnYVoFMBO/IH/V/XEesrLqfjdvutq2A9or1Qo3KVsML1hN8nkJBKbdsbCLUtDXn
	LzsKJmVrA+AE/TQzY2AgUthHHiZV6Mk9p0klMAGrae4XuBnhQQvoboLgaDfEEPH2DNyOqn2fFqS0r
	b6usdoFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQwuj-006jaE-0t;
	Fri, 19 Jan 2024 22:00:37 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQwuf-006jZ1-1d
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 22:00:36 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-598bcccca79so620722eaf.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 14:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1705701571; x=1706306371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5S7IqMYVGKNqJZ35fEQj0xzfnTIX8E84YBSqWvhnC0=;
        b=HFTYTVS25Yj1XjiE+Q7mxVLOm4wM2rfwEJvvNgfz0MQbU3KRevKDruntQUHICNova+
         eMupWTLPWz+b7bbJiuOJi/qlXLZcAbHj6Zf7WPIIH3x46DshvLy4F2HSCphw9Y3zCq+j
         vAig/q2//7nf8NCPtgXc7hbrRq7Kq90VGile9sWu3aA2mjd3/fAWwUYQdcGYC9OvnzTJ
         Jmr8ujxQtNJOhOT63yVwd5amfP0eSmzIfc/qSTBJRh3FzOdZI/SpmjtOdtLR3IRWcbuL
         YvOm1BZpcMJOfpBLr677/CIAXKbadM6U+Ab5ra8eIfydTdou4ADsGAwrRuiTkw98jnW4
         q/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705701571; x=1706306371;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5S7IqMYVGKNqJZ35fEQj0xzfnTIX8E84YBSqWvhnC0=;
        b=bcNqdoNqCzODJiWXOXRqgIBlCM2q7F9p7HHMlLVwVInv9tpM9dZAxLC8ZsHaOtZBOr
         OtxmutU+k8nM3UOorCLrLvYYfm7TpAy0yaTmeGPqr3N7gBojWosvLeMB7cG85NVlU/Rw
         9mWZU8Ntx3xSnYBVf2ryEJKSrUarfvGGbbTn//hZkAbvr/rflpvYCh0irdrOfEchdTKQ
         A7qwTOCOkC7GdWOI+/zKwB9ldB0gI8XRfhD/bdw0q+aH9r8TJF0Jw8jMPk527LLSJL0H
         TJXsRc2rXTSx17ziOqkDi5vpI8O9Gw49ZaJNtr9Y9AI4XnzS3r7kSmpb/ahkOeyu9Gv4
         28zw==
X-Gm-Message-State: AOJu0YxNVcteBSdNmjayuPTS3+Jq53S7TZo8wjfE/N3I713k7T6zzjGv
	bcvI7fUH7U03OxgBT57D+KFXlMbBqLkoEm01NfBfYHgT3LGg7WdLsuQF9GJQEyc=
X-Google-Smtp-Source: AGHT+IESicOUtDUT+5BwgwqSfPXAdnKkq3SaMukVEeCzOBMaA+ge58Litoyb9vV7itnjx54Th0+h3w==
X-Received: by 2002:a05:6359:4290:b0:175:bf72:cfd4 with SMTP id kp16-20020a056359429000b00175bf72cfd4mr419654rwb.31.1705701570687;
        Fri, 19 Jan 2024 13:59:30 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 37-20020a630a25000000b005ceb4a6d72bsm3824521pgk.65.2024.01.19.13.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 13:59:30 -0800 (PST)
Date: Fri, 19 Jan 2024 13:59:30 -0800 (PST)
X-Google-Original-Date: Fri, 19 Jan 2024 13:58:56 PST (-0800)
Subject: Re: [PATCH v5 0/5] RISC-V SBI debug console extension support
In-Reply-To: <CAK9=C2UV8J52a1pZjsNpFNwpUKn5K3nhS-+bS-3pohDwi3HrfQ@mail.gmail.com>
CC: Greg KH <gregkh@linuxfoundation.org>, nathan@kernel.org,
  linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, jirislaby@kernel.org,
  Conor Dooley <conor@kernel.org>, ajones@ventanamicro.com, linux-serial@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com
Message-ID: <mhng-f5f3ec82-ce6a-4e20-8799-f36fd82d74b6@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_140033_550670_8156B660 
X-CRM114-Status: GOOD (  23.90  )
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

T24gRnJpLCAxOSBKYW4gMjAyNCAwMjowOToxOCBQU1QgKC0wODAwKSwgYXBhdGVsQHZlbnRhbmFt
aWNyby5jb20gd3JvdGU6Cj4gT24gU2F0LCBKYW4gMTMsIDIwMjQgYXQgMTI6MDDigK9BTSBQYWxt
ZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPiB3cm90ZToKPj4KPj4gT24gVGh1LCAxMSBK
YW4gMjAyNCAwNjo1MDozNyBQU1QgKC0wODAwKSwgcGF0Y2h3b3JrLWJvdCtsaW51eC1yaXNjdkBr
ZXJuZWwub3JnIHdyb3RlOgo+PiA+IEhlbGxvOgo+PiA+Cj4+ID4gVGhpcyBzZXJpZXMgd2FzIGFw
cGxpZWQgdG8gcmlzY3YvbGludXguZ2l0IChmb3ItbmV4dCkKPj4gPiBieSBQYWxtZXIgRGFiYmVs
dCA8cGFsbWVyQHJpdm9zaW5jLmNvbT46Cj4+ID4KPj4gPiBPbiBGcmksIDI0IE5vdiAyMDIzIDEy
OjM5OjAwICswNTMwIHlvdSB3cm90ZToKPj4gPj4gVGhlIFNCSSB2Mi4wIHNwZWNpZmljYXRpb24g
aXMgbm93IGZyb3plbi4gVGhlIFNCSSB2Mi4wIHNwZWNpZmljYXRpb24gZGVmaW5lcwo+PiA+PiBT
QkkgZGVidWcgY29uc29sZSAoREJDTikgZXh0ZW5zaW9uIHdoaWNoIHJlcGxhY2VzIHRoZSBsZWdh
Y3kgU0JJIHYwLjEKPj4gPj4gZnVuY3Rpb25zIHNiaV9jb25zb2xlX3B1dGNoYXIoKSBhbmQgc2Jp
X2NvbnNvbGVfZ2V0Y2hhcigpLgo+PiA+PiAoUmVmZXIgdjIuMC1yYzUgYXQgaHR0cHM6Ly9naXRo
dWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3Ytc2JpLWRvYy9yZWxlYXNlcykKPj4gPj4KPj4gPj4g
VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBTQkkgZGVidWcgY29uc29sZSAoREJDTikgZXh0
ZW5zaW9uIGluCj4+ID4+IExpbnV4IFJJU0MtVi4KPj4gPj4KPj4gPj4gWy4uLl0KPj4gPgo+PiA+
IEhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKPj4gPiAgIC0gW3Y1LDEvNV0gUklTQy1W
OiBBZGQgc3R1YnMgZm9yIHNiaV9jb25zb2xlX3B1dGNoYXIvZ2V0Y2hhcigpCj4+ID4gICAgIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy9mNTAzYjE2N2I2NjAKPj4gPiAgIC0gW3Y1LDIv
NV0gUklTQy1WOiBBZGQgU0JJIGRlYnVnIGNvbnNvbGUgaGVscGVyIHJvdXRpbmVzCj4+ID4gICAg
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy9mNDNmYWJmNDQ0Y2EKPj4gPiAgIC0gW3Y1
LDMvNV0gdHR5L3NlcmlhbDogQWRkIFJJU0MtViBTQkkgZGVidWcgY29uc29sZSBiYXNlZCBlYXJs
eWNvbgo+PiA+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvYzc3YmYzNjA3YTBm
Cj4+ID4gICAtIFt2NSw0LzVdIHR0eTogQWRkIFNCSSBkZWJ1ZyBjb25zb2xlIHN1cHBvcnQgdG8g
SFZDIFNCSSBkcml2ZXIKPj4gPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzg4
ZWFkNjhlNzY0Ywo+PiA+ICAgLSBbdjUsNS81XSBSSVNDLVY6IEVuYWJsZSBTQkkgYmFzZWQgZWFy
bHljb24gc3VwcG9ydAo+PiA+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvNTA5
NDJhZDZkZGI1Cj4+ID4KPj4gPiBZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKPj4KPj4gTmF0
aGFuIHBvaW50cyBvdXQgdGhhdCB0aGlzIGhhcyBzb21lIHNlbWFudGljIGNvbmZsaWN0cyB3aXRo
IGEgcGF0Y2ggaW4KPj4gR3JlZydzIFRUWSB0cmVlOiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9ncmVna2gvdHR5LmdpdC9jb21taXQvP2lkPWYzMmZjYmVk
YmU5MjkwNTY1ZTRlYWMzZmQ3YzRjNDUxZDU0Nzg3ODcKPj4KPj4gU28gSSB0aGluayB0aGUgYmVz
dCBiZXQgaXMgdG8gd2FpdCBvbiBHcmVnJ3MgcGF0Y2ggdG8gbGFuZCBpbiBMaW51cycKPj4gdHJl
ZSwgYW5kIHRoZW4gYmFzZSBhIHY2IG9mIHRoaXMgcGF0Y2ggc2V0IG9uIHRoYXQgbWVyZ2VkIHBh
dGNoLiAgSSdtCj4+IGdvaW5nIHRvIGRyb3AgdGhpcyBvbmUgZnJvbSBmb3ItbmV4dC4KPgo+IEdy
ZWcncyBwYXRjaCBpcyBub3cgYXZhaWxhYmxlIGluIHVwc3RyZWFtIExpbnV4IHNvIEkgd2lsbCBy
ZWJhc2UgYW5kCj4gc2VuZCBvdXQgdjYuCgpTb3JyeSwgSSBmb3Jnb3QgYWJvdXQgdGhpcyBvbmUg
YW5kIG1lcmdlZCBpdC4gIEkganVzdCBzZW50IHVwIGEgZml4dXA6IApodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNDAxMTkyMTU2MTIuMjA1MjktMi1wYWxtZXJAcml2b3NpbmMuY29tLyAK
LgoKPgo+IFRoYW5rcywKPiBBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
