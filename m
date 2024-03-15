Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34763C54E60
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 03:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=st9ePNq/g0wg2Tk6hVXeDmOAK/vVHx5FhAYFu13fHSI=; b=ldCPHLue/okhOTSLxdpi0Z00Aq
	hFt01Qt4xfZC5zpZlCWiFP8BfnSHGPzkCnU1hHDfEixhf0aaFqmK9bMyacOGv/rzWhsju/NpSTTWj
	vzMxYlhRnaUXm0MgYG82mkfZg4+hBQoqMX5POZ+wAc3BDnppIZFnG+S7mrSUJsq5NWFepq5lcUpJ8
	ndE94M3EvW5IEEjNn5HdgAuY/5LuW+1u3YZpuKA5mSq6Fs3Zo0HaFb0I58WO+GZBzqEpVuhj8cSy/
	afrsQ+C2dFIcokaAfWwpq7F7uvnd86mW+WIC9vyMWwctECKXRTKTmKR6PJqU5OX7Bu7t1AU9Sg973
	i1O2WQHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkyJv-0000000GXa5-28vy;
	Fri, 15 Mar 2024 03:33:23 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkyJt-0000000GXZF-0sXW
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 03:33:22 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2d23114b19dso18727711fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 20:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710473598; x=1711078398; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H32FltJCYmRuT1xpAWB9CWf2fiNQNrbCsZf2QEEHNWY=;
        b=J6ObR1fwG2YhGVTF7Y+fWvRmmqBo6bxSHCPS8w7l7sUhqDyaATe/dLYygBbi6dm5e9
         FhXVUboK2I5Avxvg3v4ssMfnB78z2aN4ljibhQ8NSXHIfMdjsX6CZ2mAa0lnNU0gGdqb
         /5C48dNlrq/t9U7B20Sjzsm9xSG1ctDuSx3Ph9856r2Pgkrhn8gqFPAk8yppNRRzwEdQ
         2jhfTP0asBaQCZ1J255e3OhP55gvCAoyhfLW9hHkhGI5RZrKQNZBrIpCCj5boqY5OxFj
         ld41yIs18LtGll6rgfsOZATKxG6Zpe2hiQATsNOTle+opJ1iPDeGzfEkFikC4k0xS6jm
         SsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710473598; x=1711078398;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H32FltJCYmRuT1xpAWB9CWf2fiNQNrbCsZf2QEEHNWY=;
        b=CbJgDB00Pa7HbnuSmuqa1zeg+57Ho/5uKbo9VhepWsLWvJUgPzwPPqoeu9AVgR2Yko
         z6jBubLpbY8Z0j/RXnhU12/luaEbbOQMTC2YAEbK4l88TXVBPEgIaxNuRMByRcXVh2ve
         cmxSi4xx3kMxtLpQAPLCOhAwfxiKlAxnJLws/nSPYv5+C0Adux9wobB5IUC5ToJropYX
         +OYXexfSrC7WP+X96QU9+oZCn1ZEmo6+uHEaogb07xpgnPlo2ZYxWzfs5uGKP1qISmMQ
         Xkb2hb9dTH0/Q7JBxcGp+fL3RkRBCXnIKISjZSlPm4qESnmJ6Gyk6O/KTSUG7op6e5CV
         oO7A==
X-Gm-Message-State: AOJu0Ywq1HA2KotYxCsJCFrcDtIcUm2GJUvCBvCGCNSGo//wN/5R3/9Y
	mGbviIbyeMNF0gq4SWYtl93BjncJktIfswccEdTGr+poQid7MaMDZdj8+2EX81F/m7rMEzEj8tf
	6CxUu0lal9+GnDA4yDw/HF3JweckSUVZdZ/c=
X-Received: by 2002:a2e:91cd:0:b0:2d4:24cc:b499 with SMTP id
 u13-20020a2e91cd000000b002d424ccb499mt2098031ljg.15.1710473597737; Thu, 14
 Mar 2024 20:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
 <20240314-sublevel-jargon-4234df3fa614@spud>
In-Reply-To: <20240314-sublevel-jargon-4234df3fa614@spud>
From: Eva Kurchatova <nyandarknessgirl@gmail.com>
Date: Fri, 15 Mar 2024 05:33:06 +0200
Message-ID: <CA+eeCSPgxB9VCyB9fmEy4A1rEynNFv34LYA1UDBNT8Po=ag28w@mail.gmail.com>
Subject: Re: Boot hang with SiFive PLIC when routing I2C-HID level-triggered interrupts
Cc: linux-riscv <linux-riscv@lists.infradead.org>, bugs@lists.linux.dev, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_203321_291179_2A243DB4 
X-CRM114-Status: GOOD (  28.02  )
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

T24gVGh1LCBNYXIgMTQsIDIwMjQgYXQgMTE6NDbigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+IFRoaXMgaW1tZWRpYXRlbHkgc2VlbWVkIG9kZCB0byBtZSwgYnV0
IEkgaGF2ZSBubyByZWFzb24gdG8gZGlzYmVsaWV2ZQo+IHlvdSwgZ2l2ZW4geW91IHNheSB0aGlz
IHdhcyBkaXNjb3ZlcmVkIGluIFJWVk0gd2hpY2ggaXMgYW4gZW11bGF0b3IgYW5kCj4geW91IHNo
b3VsZCBrbm93IHdoZXRoZXIgb3Igbm90IHJlZ2lzdGVycyBhcmUgYWNjZXNzZWQuCj4gVGhlIHZl
cnkgZmlyc3QgYWN0aW9uIHRha2VuIGJ5IHRoZSBvY29yZXMgaTJjIGNvbnRyb2xsZXIgZHJpdmVy
IHdoZW4gaXQKPiBnZXRzIGFuIGludGVycnVwdCB0aG91Z2ggaXMgdG8gcmVhZCBhIHJlZ2lzdGVy
Ogo+Cj4gICAgICAgICB1OCBzdGF0ID0gb2NfZ2V0cmVnKGkyYywgT0NJMkNfU1RBVFVTKTsKPgo+
IEkgd291bGQgZXhwZWN0IHRoYXQgdGhpcyBoYW5kbGVyIHdvdWxkIGJlIGNhbGxlZCwgYW5kIHRo
ZXJlZm9yZSB5b3UnZAo+IHNlZSB0aGUgcmVnaXN0ZXIgcmVhZCwgaGFkIHRoZSBwcm9iZSBmdW5j
dGlvbiBvZiB0aGF0IGRyaXZlciBydW4gdG8KPiBjb21wbGV0aW9uLiBJJ2QgYWxzbyBleHBlY3Qg
dGhhdCB0aGUgaW50ZXJydXB0IHdvdWxkIG5vdCBldmVuIGJlCj4gdW5tYXNrZWQgaWYgdGhhdCBw
cm9iZSBmdW5jdGlvbiBoYWQgZmFpbGVkLgo+IEluIHlvdXIgY2FzZSB0aG91Z2gsIHlvdSBjYW4g
c2VlIHRoYXQgdGhlIGludGVycnVwdCBpcyBub3QgbWFza2VkLAo+IHNpbmNlIGl0IGlzIGJlaW5n
IHJhaXNlZCBhbmQgaGFuZGxlZCByZXBlYXRlZGx5IGJ5IHRoZSBQTElDIGRyaXZlci4KPiBIYXMg
dGhlIGkyYyBjb250cm9sbGVyIGRyaXZlciBwcm9iZWQgaW4gdGhlIHBlcmlvZCBvZiBib290IHRo
YXQgeW91IHNheQo+IHRoaXMgcHJvYmxlbSBtYW5pZmVzdHM/CgpUaGVyZSBpcyBub3QgYSBzaW5n
bGUgcHJvYmxlbSB3aXRoIHRoZSBvY29yZXMgSTJDIGRyaXZlci4gSTJDLUhJRCBkZXZpY2UKaXRz
ZWxmIGhhcyBhIHNlcGFyYXRlIElSUSBsaW5lIHdoaWNoIGlzIGxldmVsLXRyaWdnZXJlZC4KVGhp
cyBpcyB0byBzaWduYWwgdGhlIGhvc3QgdGhhdCB0aGVyZSBpcyBpbnB1dCBhdmFpbGFibGUgd2l0
aG91dCBwb2xsaW5nLApzaW5jZSBJMkMgaXMgYSBtYXN0ZXItZHJpdmVuIGJ1cyB3aXRoIG5vICJk
YXRhIGF2YWlsYWJsZSIgbm90aWZpY2F0aW9ucy4KU28gaW4gcmVhbGl0eSB0aGUgSTJDLUhJRCBk
cml2ZXIgc2hvdWxkIGhhbmRsZSB0aGUgaW50ZXJydXB0OyBUaGVuIGl0CnVzZXMgdGhlIEkyQyBj
b250cm9sbGVyIHRvIGFjY2VzcyBJMkMtSElEIHNsYXZlIHJlZ2lzdGVycyAodmlhIEkyQykgdG8K
cmVhZCB0aGUgaW5jb21pbmcgSElEIGlucHV0IHJlcG9ydC4gSTJDIGNvbnRyb2xsZXIgaW50ZXJy
dXB0cyBhcmUgdW5yZWxhdGVkOwppdCdzIHRoZSBsaW5rIGJldHdlZW4gdGhlIEhJRCBkZXZpY2Ug
YW5kIHRoZSBob3N0IGFuZCBpdCBkb2Vzbid0IHNlZW0KdG8gYmUgdG91Y2hlZCBhdCBhbGwgaW5z
aWRlIHRoZSBJMkMtSElEIElSUSBoYW5kbGVyIChTbyBpdCdzIGp1c3QgYSBwYWlyCm9mIENsYWlt
L0NvbXBsZXRlIGFjdGlvbnMpLiBJMkMgb2NvcmVzIGludGVycnVwdHMgYXJlIG5vdCBnZW5lcmF0
ZWQKKGFuZCBzaG91bGRuJ3QpIGF0IHRoYXQgcG9pbnQsIGJlY2F1c2Ugbm8gSTJDIHRyYW5zZmVy
IHdhcyBpbml0aWF0ZWQgYXQgYWxsLgoKVGhlcmUgaXMgYSB3YXkgdG8gbWFrZSBJMkMtSElEIGRl
dmljZSBlZGdlLXRyaWdnZXJlZCwgaW4gUlZWTQplbXVsYXRpb24gY29kZSwgYnV0IGl0J3Mgbm90
IGFjdHVhbGx5IHNwZWMgY29tcGxpYW50LiBJdCBnZXRzIHJpZCBvZiB0aGUKaGFuZyB0b287IEhv
d2V2ZXIgdGhlIHNhbWUgQ2xhaW0vQ29tcGxldGUgYWN0aW9ucyB3aXRob3V0IGFueQpoYW5kbGlu
ZyBpbnNpZGUgdGhlIElSUSBoYW5kbGVyIGFyZSBvYnNlcnZlZCBhdCBsZWFzdCBvbmNlLCB3aGlj
aAp0ZWNobmljYWxseSBtZWFucyBhIGxvc3QgaW50ZXJydXB0IChQcmVzc2luZyBhIGtleSBzb21l
d2hlcmUgZWFybHkgaW4KYm9vdCB0aHVzIGRvZXNuJ3QgcHJvcGFnYXRlIHRoZSBrZXlwcmVzcyB0
byB0aGUgZ3Vlc3QgdW50aWwgeW91IHByZXNzCmFub3RoZXIga2V5IGxhdGVyLCBhZnRlciB3aGlj
aCBib3RoIEhJRCByZXBvcnRzIGFyZSByZWFkKSwgc28gaXQncyBub3QKYSB3YXkgaG93IEknZCBs
aWtlIHRvIG1pdGlnYXRlIHRoaXMgaW4gdGhlIGVtdWxhdG9yIGNvZGUuCkksIGFuZCBhbm90aGVy
IGRldmVsb3BlciBmcm9tIEhhaWt1IE9TIHRlYW0gKFg1MTIpLCBhcmUgYWxtb3N0IHN1cmUKdGhp
cyBpcyBhIGtlcm5lbCBidWcgcmVsYXRlZCB0byBsZXZlbCB0cmlnZ2VyZWQgSVJRcyB3aXRoIFBM
SUMgb3IgYQpzcGVjaWZpYyBpbmNvbXBhdGliaWxpdHkgb2YgUExJQy9JMkMtSElEIChOb3QgdGhl
IG9jb3JlcyBJMkMgY29udHJvbGxlcikuCgpUaGlzIGhhbmcgaXMgbm90IHJlcHJvZHVjaWJsZSB3
aXRoIGEgSGFpa3UgT1MgZ3Vlc3QgaW4gYW55IHdheSBhbmQKbW9zdCBvZiB0aGUgZHJpdmVycyBp
bnZvbHZlZCBzZWVtIHRvIGJlIEZyZWVCU0QgYmFzZWQgb3Igd3JpdHRlbiBieQpYNTEyIChTcGVj
aWZpY2FsbHkgdGhlIFBMSUMgYW5kIEkyQy1ISUQgZHJpdmVycyBhcmUpLiBUaGlzIHBlcnNvbiBh
bHNvCmJlbGlldmVzIHRoYXQgdGhpcyBDbGFpbS9Db21wbGV0ZSBiZWhhdmlvciBvbiBQTElDIHNp
ZGUgd2l0aG91dCBhbnkKb3RoZXIgYWN0aW9ucyBtYWRlIGluIGJldHdlZW4gaXMgZXJyb25lb3Vz
IGtlcm5lbCBiZWhhdmlvciB0b28uCgpJIGFtIG9wZW4gdG8gZGlzY3Vzc2lvbnMgd2hhdCBzcGVj
aWZpY2FsbHkgY291bGQgYmUgd3Jvbmcgd2l0aCB0aGUgVk0Kc2luY2Ugb25lIG9mIG15IGVuZCBn
b2FscyBpcyB0byBqdXN0IG1ha2UgSElEIGRldmljZXMgd29yayB3aXRob3V0Cmlzc3VlcyB0aGVy
ZTsgSG93ZXZlciBpZiBhIHNpbXBsZSAyLWxpbmUgcGF0Y2ggKHdoaWNoIEknbSBub3QgZW50aXJl
bHkKc3VyZSBvZiBpdCdzIGltcGxpY2F0aW9ucykgdGhhdCByZW1vdmVzIHJldHVybiBwYXRoIGF0
IGxpbmUgMjIzIGluIFBMSUMKZHJpdmVyIHJlc29sdmVzIHRoZSBpc3N1ZSAoSSBrZXB0IGEgZ3Vl
c3QgaW4gYSAyNCBociByZWJvb3QgbG9vcCB3aGlsc3QKc3BhbW1pbmcgZmFrZSBJMkMtSElEIGlu
cHV0IGFuZCBubyBoYW5nIHdhcyBvYnNlcnZlZCksIHRoZW4gaXQgZG9lcwpsZWFkIG1lIHRvIGJl
bGllZiB0aGF0IGl0J3MgYXQgbGVhc3Qgbm90IHNvbWUgYmxhdGFudCBlbXVsYXRpb24gaXNzdWUu
CgpJIGNhbWUgaGVyZSB0byBjb2xsZWN0IHNvbWUga2VybmVsIGRldnMgb3BpbmlvbnMgc2luY2Ug
d2UgYXJlCmRlYnVnZ2luZyB0aGlzIGZvciBzb21lIDIgd2Vla3MgYWxyZWFkeS4gWW91ciBpbml0
aWFsIHVuZGVyc3RhbmRpbmcKdGhhdCBzb21ldGhpbmcgaXMgd3Jvbmcgd2l0aCBvY29yZXMgSTJD
IGNvbnRyb2xsZXIgaXMgbm90IHdoYXQgSSBtZWFudCwKc29ycnkgZm9yIGxhY2tpbmcgaW4gbXkg
ZXhwbGFuYXRpb24uCgo+QXJlIGludGVycnVwdHMgdW5tYXNrZWQgYnkgZGVmYXVsdCBvbiBSVlZN
PwoKQnkgZGVmYXVsdCBhbGwgUExJQyBFTkFCTEUgcmVnaXN0ZXJzIGFyZSBzZXQgdG8gemVyby4g
QWxsIFBSSU8sClRIUkVTSE9MRCByZWdpc3RlcnMgYXJlIHplcm8gb24gcmVzZXQuIFNvIGFsbCBQ
TElDIHN0YXRlIGlzCnNpbXBseSB6ZXJvZWQgb24gcmVzZXQsIGFzIGNhbiBiZSBzZWVuIGhlcmU6
Cmh0dHBzOi8vZ2l0aHViLmNvbS9MZWtLaXQvUlZWTS9ibG9iL2Y4MWRmNTdhMmFmNzdjYmFlMjVm
ZDNjYzY1ZDA3MTA2ZDk1MDVlMjMvc3JjL2RldmljZXMvcGxpYy5jI0wyNjUKCj4gSGF2ZSB5b3Ug
Y2hlY2tlZCB0aGF0IHRoaXMgYWN0dWFsbHkgYWZmZWN0cyBhbnkgYWN0dWFsIGhhcmR3YXJlPwoK
SSBtaWdodCB2ZXJ5IHNvb24gaWYgbm8gb25lIGhhcyBpbW1lZGlhdGUgaWRlYXMgd2hhdCBpcyB3
cm9uZzsKUHJvYmxlbSBpcyB0aGF0IEkgZG9uJ3QgaGF2ZSBoYXJkd2FyZSB0aGF0IGV4cG9zZXMg
UExJQyBJUlEgbGluZXMgdG8KdGhlIHVzZXIuIEl0IG1pZ2h0IGJlIHBvc3NpYmxlIHRvIHVzZSBz
b21lIEZQR0Egb3IgYXQgbGVhc3QgcmVwcm9kdWNlCmluIG90aGVyIHNpbXVsYXRvcnMuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
