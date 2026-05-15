Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB6CCD4F3C
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 03:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZhAb2ylVZIF465qgi7PQdC35Dr5/A5HT6Y/Y4x1ieoM=; b=3E7TCFA34pYtbI
	DFKfslMVaH5GGyVHx6x43BwyTldHDkfq/SlLztDNZTF7M6Phd0FjAnDfsmiV1zXXO2zUtIc8IMQc7
	tCc9w2p3PHaWsMhBbpbARRHhQ1+PUFeOZOSwpN2qsclP97A1AYYORj3oPNR/GI72KNE5UpFOrZd3U
	LUUb9435ZWmXuc4/UqD6a36Q7zd2MjiJVgQMLjBgGBSapAtPUMY4m5cz/HVF42G2Opn0MoSzCRWdJ
	mZaYKwIi5pxdVlZ+aPzhr4siasvLR6e0l39Hw+3BYkbtQcKcIamhY/uEWiyZDoZo5UTJT5T0rlBIk
	Qxz56JHlwmt2QSwyOZQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNjS2-00000007F7g-0Ijt;
	Fri, 15 May 2026 03:43:02 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNjRz-00000007F6x-0Q69
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 03:43:00 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-bd4d7f4fa02so357797266b.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 May 2026 20:42:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778816577; cv=none;
        d=google.com; s=arc-20240605;
        b=FgDh2v+yxdlI1E5Yq5E2Q+kjcM5RQrev5bZoXlQ3msFxAzJVTJqkyuFp9ZwhIAhi4y
         AKSy+jjjOkF1acwxTTPglLRoEU7XEfCCaH3ymUOvW/NV2oyu3/WN6/zSJfpNbosaGqKj
         rEGhMX8gw0PPm9fDhaF6aLkpzMYu2NXfW/pkO255PAab/tm1C2pxqxh4rDy296AJHqtG
         FSJ1QYVcovE/ptJasLcfTFMOEwp/lXyjxWEpiwamsANIy6/75SD8/SREiANSL9c9t2EI
         JiFyCZM/LfuOrVr8zpk0K/LaxY9D4J9k3oRgEKz3yR81jgXmW4cPnND1TvI+FfXgLBXd
         swTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NBxcRjd4EcyrnqzXR6znMRlgjiUTKATxVRvzeKv028I=;
        fh=6pWWjPsZgkMBuow/OGKNgzexB1ljGK10GUnaGJavSzc=;
        b=VnNyNOy69LtfAerq1+9VwxT8o1XCiderm53JfmVluOYcldBLHyrt2KOQPUViuHcdYP
         TKgZ3UtyZBEH7qLWqxPBhrXMZ2HfXZCKYH983cHDMUElF69JEyrVVbI0/emb9Oz6JfxR
         8dU995kelmcuWhmbBKBmpjT9mfTb0ie4X+U3bqdkD0rUQCag4ocf9gAHXk2nSeggfaz8
         29SMCPMf3C7HqPhbBCaMfaJ9kWVjr/QpZfd17+sI33emZO0PmOrr4pw2giJFrHw+JvDB
         1ZPVfQF+Ue0xFACBl4SazVZNo7wBIJwRa11DC/PZQRSNiIX52b1o7gTbj6binFMOvhRF
         LABw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1778816577; x=1779421377; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBxcRjd4EcyrnqzXR6znMRlgjiUTKATxVRvzeKv028I=;
        b=XEwN1Wb03QmKEGWZfqfPC58kvOCvppB9IWue2qWhTpmHk2dlRw6JRCkesVWBuAwiTS
         Q/Tv2TlJhLjWXgnMCTBcX40O2PnhuGKtVECLpZb33CuwZs/HpsCZFUdAvu6lxKyhbNRC
         IO+qTFgtCq2uNJY2FVYuuERO8+Btwr1J7BAVX4Fjx/meiv1i1GR2TuZhbzosSBGABK1Y
         J7SM8LLqr8qc2KZv7LQARz4ElJIBy3x9XgqtCeO7QgpJLujHqkBPxtsmNcOU4KZM3pVr
         bkDyKlbYUe3liYR2yQmKzapnI86pOsiLCIWNT9G0EPLtHLNjQseVT/gkEcFgezzwzIUQ
         GNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778816577; x=1779421377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NBxcRjd4EcyrnqzXR6znMRlgjiUTKATxVRvzeKv028I=;
        b=ok6P+vuKO699BRWoyIxusGZbxv7Z31jLX363dq3zXb7mxCpVNX/JYHC5LA4x/otySG
         Ne6tDseokLZYa2Ube2yD305tIMazZDlBpUjgUJCSK2J0qzUKEJFITxtHl+T+VFm4f0VL
         ybkRtkibFHt0NfH6j28RaWdn+A284fOFhzQYn/aYkzhEv51jSGwRSXvkSb+kBkouXKWD
         ALggUW9Ykt4iF2o4WUu7CuRFlDIMaQr5mlN3RH+MpacSVbVn4u/8oJ//nEcxvQNEqJaR
         bk7VvmRGyO+VWnmO39S43SbMTrahZQva3D0nl8oayQ09N4AO/IZK1FEJSNkYiW5VliyA
         sd8Q==
X-Forwarded-Encrypted: i=1; AFNElJ911wLCGXuQd/QR/b4CvL9Kf5nVTO78LVpgtUYq4U2WAsh22HVxpM3VSrdC6de0I0PXomMapxRlP91W4A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/MlSGsy1LAwIGXZ0LD/J0SOXvHP4JoDU53Fi3FuVlRIw9fByL
	u31Z2xHE/wXB7WDQ4hqZxxkb/DLxKG9mCvjQcV+9CkA7vEMTVt9wgGVoxi3azn7JTFLSlm3YEQb
	BOT18uSndoSk4wzE2QEA7fSabMQIS1nmEDQiK7775Ng==
X-Gm-Gg: Acq92OEqrUAH9/dbYEjbaG/cce/Rdzcr6MdwBFsmNlPpUW9M8F+pfXf8nucjq1ZsTi/
	1PIvYNFiWOi2pwkD0Z1w0DlLhAW6pnLWwIPqcpr3EAgSnQHDx7Jp2R1CTpMEw7Iiaz9uK8tZa40
	miCRabDvpJ+nVab3JNvkJFTmc6BICTiFaL8SGj0+u81Y6fu1WhPE+xnm3b1HNXOWAe/LgVKp4eJ
	sCWTK+2UHest5ftSzASkwNwyZHazDZyZUaZiauQDQg9z4U+K0XZKiATN1tjRRBwk5ScyvtoCO4e
	AbybdboNHA==
X-Received: by 2002:a17:907:97d2:b0:ba6:e18f:1568 with SMTP id
 a640c23a62f3a-bd51797076dmr98640966b.32.1778816576822; Thu, 14 May 2026
 20:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260514075036.1432352-1-zong.li@sifive.com> <20260514095605.2c7d8761@pumpkin>
In-Reply-To: <20260514095605.2c7d8761@pumpkin>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 15 May 2026 11:42:45 +0800
X-Gm-Features: AVHnY4KNwg2rsWb84nFjU2lxTxhMMd8CvwPryziwnjLJka6yCHUkZ-tzFu8BAcA
Message-ID: <CANXhq0rY8wb-0x2whLGMSuWLujtZwrEsmpWh_PUhxoZ0gpA96w@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: cif: reduce shadow stack size limit from 4GB to 2GB
To: David Laight <david.laight.linux@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	debug@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_204259_180267_A4E6423F 
X-CRM114-Status: GOOD (  40.52  )
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

T24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgNDo1NuKAr1BNIERhdmlkIExhaWdodAo8ZGF2aWQubGFp
Z2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIDE0IE1heSAyMDI2IDAwOjUw
OjM1IC0wNzAwCj4gWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPgo+ID4gRm9s
bG93IHRoZSBBUk02NCBHQ1MgKEd1YXJkZWQgQ29udHJvbCBTdGFjaykgaW1wbGVtZW50YXRpb24g
YXBwcm9hY2gKPiA+IGJ5IHJlZHVjaW5nIHRoZSBzaGFkb3cgc3RhY2sgc2l6ZSBhbGxvY2F0aW9u
IGZyb20gbWluKFJMSU1JVF9TVEFDSywgNEdCKQo+ID4gdG8gbWluKFJMSU1JVF9TVEFDSy8yLCAy
R0IpLiBzZWUgY29tbWl0ICc1MDY0OTZiY2JiNDIgImFybTY0L2djczogRW5zdXJlCj4gPiB0aGF0
IG5ldyB0aHJlYWRzIGhhdmUgYSBHQ1MiKScKPiA+Cj4gPiBSYXRpb25hbGU6Cj4gPgo+ID4gMS4g
U2hhZG93IHN0YWNrcyBvbmx5IHN0b3JlIHJldHVybiBhZGRyZXNzZXMgKDggYnl0ZXMgcGVyIGVu
dHJ5KSwgbm90Cj4gPiAgICBsb2NhbCB2YXJpYWJsZXMsIGZ1bmN0aW9uIHBhcmFtZXRlcnMsIG9y
IHNhdmVkIHJlZ2lzdGVycy4gQSAyR0IKPiA+ICAgIHNoYWRvdyBzdGFjayBpcyBmYXIgbW9yZSB0
aGFuIHN1ZmZpY2llbnQgZm9yIGFueSBwcmFjdGljYWwKPiA+ICAgIGFwcGxpY2F0aW9uLCBldmVu
IHdpdGggZXh0cmVtZWx5IGRlZXAgcmVjdXJzaW9uLiBVc2luZyBoYWxmIHRoZSBzaXplCj4gPiAg
ICBtYWludGFpbnMgYWRlcXVhdGUgd2hpbGUgYmVpbmcgbW9yZSByZXNvdXJjZS1lZmZpY2llbnQg
bWFyZ2luCj4gPgo+ID4gMi4gT24gbWVtb3J5LWNvbnN0cmFpbmVkIHN5c3RlbXMgKGUuZy4sIHBs
YXRmb3JtcyB3aXRoIG9ubHkgNEdCIG9mCj4gPiAgICBwaHlzaWNhbCBtZW1vcnksIHdoaWNoIGlz
IGEgY29tbW9uIGNvbmZpZ3VyYXRpb24pLCBhbGxvY2F0aW5nIDRHQgo+ID4gICAgb2YgdmlydHVh
bCBhZGRyZXNzIHNwYWNlIGZvciBzaGFkb3cgc3RhY2sgcGVyIHByb2Nlc3MvdGhyZWFkIGNhbgo+
ID4gICAgbGVhZCB0byB2aXJ0dWFsIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmVzIHdoZW4gdGhl
IG92ZXJjb21taXQgbW9kZQo+ID4gICAgaXMgc2V0IHRvIE9WRVJDT01NSVRfR1VFU1Mgb3IgT1ZF
UkNPTU1JVF9ORVZFUjoKPiA+ICAgIEVycm9yOiAiX192bV9lbm91Z2hfbWVtb3J5OiBub3QgZW5v
dWdoIG1lbW9yeSBmb3IgdGhlIGFsbG9jYXRpb24iCj4gPgo+ID4gVGhpcyByZWR1Y2VzIHZpcnR1
YWwgYWRkcmVzcyBzcGFjZSBjb25zdW1wdGlvbiBieSA1MCUgd2hpbGUgbWFpbnRhaW5pbmcKPiA+
IG1vcmUgdGhhbiBhZGVxdWF0ZSBzcGFjZSBmb3IgcmV0dXJuIGFkZHJlc3Mgc3RvcmFnZS4KPiA+
Cj4gPiBBZGRpdGlvbmFsbHksIGFkZCBtYXgoUEFHRV9TSVpFLCBzaXplKSBjb25zdHJhaW50LCB3
aGljaCBjb3ZlcnMgdGhlCj4gPiBjYXNlIHdoZXJlIFJMSU1JVF9TVEFDSyBpcyBzbWFsbGVyIHRo
YW4gUEFHRV9TSVpFLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lm
aXZlLmNvbT4KPiA+IC0tLQo+ID4KPiA+IENoYW5nZWQgaW4gdjI6Cj4gPiAtIEFkZCBtYXgoKSBp
biBjYXNlIFJMSU1JVF9TVEFDSyBpcyBzbWFsbGVyIHRoYW4gUEFHRV9TSVpFLiBTdWdnZXN0ZWQg
YnkKPiA+ICAgUGF1bCBXYWxtc2xleSBhbmQgU2FzaGlrbwo+ID4KPiA+IENoYW5nZWQgaW4gdjE6
Cj4gPiAtIFVzZSBtaW4oKSBpbnN0ZWFkIG9mIG1pbl90KCkuIFN1Z2dlc3RlZCBieSBEYXZpZCBM
YWlnaHQKPiA+Cj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvdXNlcmNmaS5jIHwgOCArKysrKy0tLQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3VzZXJjZmkuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3VzZXJjZmkuYwo+ID4gaW5kZXggNmVhYTBkOTRmZGZlLi4wZjc1ZThmNWQwZWMgMTAw
NjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC91c2VyY2ZpLmMKPiA+ICsrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL3VzZXJjZmkuYwo+ID4gQEAgLTEwOSwxNSArMTA5LDE3IEBAIHZvaWQgc2V0
X2luZGlyX2xwX2xvY2soc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCBib29sIGxvY2spCj4gPiAg
ICAgICB0YXNrLT50aHJlYWRfaW5mby51c2VyX2NmaV9zdGF0ZS51ZmNmaV9sb2NrZWQgPSBsb2Nr
Owo+ID4gIH0KPiA+ICAvKgo+ID4gLSAqIElmIHNpemUgaXMgMCwgdGhlbiB0byBiZSBjb21wYXRp
YmxlIHdpdGggcmVndWxhciBzdGFjayB3ZSB3YW50IGl0IHRvIGJlIGFzIGJpZyBhcwo+ID4gLSAq
IHJlZ3VsYXIgc3RhY2suIEVsc2UgUEFHRV9BTElHTiBpdCBhbmQgcmV0dXJuIGJhY2sKPiA+ICsg
KiBUaGUgc2hhZG93IHN0YWNrIG9ubHkgc3RvcmVzIHRoZSByZXR1cm4gYWRkcmVzcyBhbmQgbm90
IGFueSB2YXJpYWJsZXMKPiA+ICsgKiAyRyBzaG91bGQgYmUgbW9yZSB0aGFuIHN1ZmZpY2llbnQg
Zm9yIG1vc3QgYXBwbGljYXRpb25zLgo+ID4gICAqLwo+ID4gIHN0YXRpYyB1bnNpZ25lZCBsb25n
IGNhbGNfc2hzdGtfc2l6ZSh1bnNpZ25lZCBsb25nIHNpemUpCj4gPiAgewo+ID4gICAgICAgaWYg
KHNpemUpCj4gPiAgICAgICAgICAgICAgIHJldHVybiBQQUdFX0FMSUdOKHNpemUpOwo+ID4KPiA+
IC0gICAgIHJldHVybiBQQUdFX0FMSUdOKG1pbl90KHVuc2lnbmVkIGxvbmcgbG9uZywgcmxpbWl0
KFJMSU1JVF9TVEFDSyksIFNaXzRHKSk7Cj4gPiArICAgICBzaXplID0gUEFHRV9BTElHTihtaW4o
cmxpbWl0KFJMSU1JVF9TVEFDSykgLyAyLCBTWl8yRykpOwo+Cj4gUEFHRV9BTElHTigpIGFscmVh
ZHkgcm91bmRzIHVwLCBzbyB0aGUgb25seSBwcm9ibGVtIHdvdWxkIGJlIGlmIHJsaW1pdChTVEFD
SykKPiB3ZXJlIDAgb3IgMSwgSSdtIHN1cmUgdGhhdCB3b3VsZCBmYWlsIGVhcmxpZXIgKG9yIG5v
dCBiZSBhbGxvd2VkKS4KClRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuIElmIHRoaXMg
Y2FzZSBkb2Vzbid0IGhhcHBlbiwgSSB3aWxsCnJlbW92ZSB0aGUgbWF4IGNoZWNrLgoKPgo+IEkg
YWxzbyBkb24ndCB1bmRlcnN0YW5kIHRoZSByYXRpb25hbCBmb3IganVzdCAvMiBhbmQgdGhlIDJH
IHVwcGVyIGxpbWl0Lgo+IFlvdSBuZWVkIDUxMiBuZXN0ZWQgZnVuY3Rpb24gY2FsbHMgdG8gZXZl
biB1c2UgNGsuCj4gVGhhdCB3b3VsZCBoYXZlIHRvIGJlIHF1aXRlIGRlZXAgcmVjdXJzaW9uLgoK
RHVyaW5nIHRoZSBkaXNjdXNzaW9ucyBhYm91dCB0aGUgQVJNIEdDUyB2MyBzZXJpZXMsIGNvbW11
bml0eSBwb2ludGVkCm91dCB0aGF0IGEgNEcgc2hhZG93IHN0YWNrIG1pZ2h0IGJlIHRvbyBsYXJn
ZS4gVGhpcyBzaXplIGlzIGhhcmQgdG8Kc3VwcG9ydCBpbiBtZW1vcnktY29uc3RyYWluZWQgZW52
aXJvbm1lbnRzIGxpa2UgQW5kcm9pZC4gSG93ZXZlciwgdGhlCnNpemUgY2Fubm90IGJlIHRvbyBz
bWFsbCBlaXRoZXIsIG9yIHdlIG1pZ2h0IGZhY2Ugc3RhY2sgb3ZlcmZsb3cKaXNzdWVzLiBBdCB0
aGF0IHRpbWUsIGEgcGVyZmVjdCBzaXplIHdhcyBub3QgZGVjaWRlZC4KCkluIGxhdGVyIHZlcnNp
b25zLCB0aGUgR0NTIGltcGxlbWVudGF0aW9uIGN1dCB0aGUgc2l6ZSBpbiBoYWxmLApyZWR1Y2lu
ZyBpdCB0byAyRy4gSSBkaWQgbm90IHNlZSBhbnkgZGV0YWlsZWQgYW5hbHlzaXMgZm9yIHRoaXMK
Y2hhbmdlOyBpdCBzZWVtZWQgdG8gYmUganVzdCBhIHNpbXBsZSByZWR1Y3Rpb246Cmh0dHBzOi8v
cGF0Y2hldy5vcmcvbGludXgvMjAyMzA4MDctYXJtNjQtZ2NzLXY0LTAtNjhjZmEzN2Y5MDY5QGtl
cm5lbC5vcmcvMjAyMzA4MDctYXJtNjQtZ2NzLXY0LTE5LTY4Y2ZhMzdmOTA2OUBrZXJuZWwub3Jn
LwoKTXkgcGF0Y2ggYWxzbyBhaW1zIHRvIHJlZHVjZSB0aGUgc2hhZG93IHN0YWNrIHNpemUgZnJv
bSA0RywgYXMgNEcKbWlnaHQgYmUgdG9vIGxhcmdlIGZvciBtYW55IHN5c3RlbXMsIGVzcGVjaWFs
bHkgZm9yIGVtYmVkZGVkIHN5c3RlbXMuCkZvciBub3csIHdlIGFyZSBzaW1wbHkgYWxpZ25pbmcg
d2l0aCB0aGUgMkcgbGltaXQgdXNlZCBpbiBHQ1MuIFRoZQpyZWFzb24gaXMgdGhhdCBzaW5jZSAy
RyBpcyBhbHJlYWR5IGFjY2VwdGVkIGJ5IHRoZSBjb21tdW5pdHkgYW5kCkFuZHJvaWQgc3lzdGVt
LCBpdCBtaWdodCBiZSBhIHNhZmUgc3RhcnRpbmcgcG9pbnQuIFdlIGNhbiB1c2UgMkcgZm9yCm5v
dywgdW50aWwgd2UgZmluZCB0aGF0IGl0IG5vIGxvbmdlciBtZWV0cyBjb21tb24gbmVlZHMuCgpJ
IGRvIG5vdCBoYXZlIGEgc3Ryb25nIG9waW5pb24gZm9yIHRoZSBkZWZhdWx0IHZhbHVlLiBEbyB5
b3UgaGF2ZSBhCnN1Z2dlc3Rpb24gZm9yIHRoZSBzaXplPyBJZiBzbywgSSB3b3VsZCBoYXBwaWx5
IHVzZSB5b3VyIHN1Z2dlc3RlZAp2YWx1ZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKVGhhbmtzCgo+
Cj4gLS0gRGF2aWQKPgo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIG1heChQQUdFX1NJWkUsIHNpemUp
Owo+ID4gIH0KPiA+Cj4gPiAgLyoKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
