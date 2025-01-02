Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF782E77188
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 15:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/sWGz/gz434hGYOfa/efFGvmUjAoEWZGUjyxu6JeJg0=; b=wc6jo+OLjBvGqp
	lPv9yXO0ge+i5b1fl5O0v72So0+Aooaeiy5nXy012Fk3ASRYxrr1AtUOgxtZ2uWfdADEckeqT0KE+
	f6F+OuwPHOT80OLd/ItbxzzH/Tc9lohSS8flO07KP0+PlpE1FKMSfcvJUhXbv63M5YUw+FsZ5tuwN
	j8b56mV2awjFAdwX8vLKPfXp9yWFUVqB8Q0B1UTtEiPtkE1BmC/kbCAgFFDiATUzYItzsgfLHlLfj
	bn000hObX2eccGDg54T/QJabLrUNLjBuHfoqxS1aIz1gVvVLTQEkafkPpAicZ9F3aaHIRP4Km2NOp
	zQ331JVpGYJE5HrPtvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTMyz-0000000AgVK-3TSl;
	Thu, 02 Jan 2025 15:19:33 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTMyx-0000000AgUq-1OYe
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 15:19:32 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-844dac0a8f4so836620639f.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jan 2025 07:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1735831170; x=1736435970; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVwFM1nzbcZAuAzPcZPazjq85Fr3hfev9mXxIxT5xA0=;
        b=CWFYcCG6tzJW+w/w7lu/elcWJsyoqEdZ20cKNnWrOgyFR36TAmYRZm/TtcOzSwqq3g
         M1YtqIWleLvUJJU51DAAHWP+oXR/VQcgXtqDVRPTiHgeAOEKKLnKJhJwbDX7iRWtxxZq
         Uo1+iMD12epvYvooeqp1PUkYhqjPBj1RAkSKloClCCIQ557CT6lILkbHvYIJs8TMszo9
         b27B9ryuWhxts84KNVt/SlzW1PBPlaPn6Vom8PvOZ0bAiwJrDRRmYhR7iX9p93MxMBPO
         EPAaipCuggkLACnxE1UpNMvMzMyF051MYAkgXdULEYGznLdyY0LliBx8AqJMe/jnbUyU
         fZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735831170; x=1736435970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVwFM1nzbcZAuAzPcZPazjq85Fr3hfev9mXxIxT5xA0=;
        b=GpExBO/VZ7QwLsiryddzLUFVozKSuH6HFxTR5z3l2R4++G3j/MvzDEMt59cLpAU5Ww
         2pm17vw1kpmc8Y4n5gjJ8kg6E+5vVA6JHRv2sYxUn3Zr4MQNNfjx7thSPW7lEbVcPGi+
         qZ1VZqrDgo1W5LeFMaNpuFS0+av+LHYDEMUYxDel7CnhME3/dCHRsY6cm42u+cT9TGc4
         tB4gS8nllE7iYVBsOlDVqOhFvbcPnRyspMMExZKmjK+1bP1DN0rpSxcSldoeq0ogMZQZ
         q0W+uaBN1SQ3MYH50E9fKvaBpdAIduDtCx0rlaO7qlBsHj5m1lsvm28aKhukvK9g1sEC
         P6yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaCmzFglpR8kcCxdJP0cKTkErWj2OagjJS1Hf1/+xQ356vutOJ3lq+sztdiexLXx60fbeXKlriG5l/og==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8AfujXcfYW79bTpNiTsoUFdynahNTEVTBRlcOWC1rJZkK8j4J
	ozl1ulOMkvvLJBzzEJNO/IY0nKn1xXxfg3d1uvrfWrXbq6ad+yzvY92K0pMkjJ6uQeBf9icNUdO
	wEVPLccnM2I2VmDoegOuBtEPciSvJmKJwvS2geXOCNnnZgpvwacc=
X-Gm-Gg: ASbGncvi8s9dHzCU4xUrGHMoycJAayxaR3qWWbe2TTmnOef7fdeEzFtLYsCMCtcDJl3
	eXyx5qxew5jI3r/AXN9OH2GrEUMllNt5A51LX5mYm
X-Google-Smtp-Source: AGHT+IETDT/tunt+8KMli1Ibyl112ngYmOYSlKiG6df1lFGrjmaDWMB9p/LI8UwF9m319Jdx7+EzU4o3N5s50EN2Wao=
X-Received: by 2002:a05:6e02:16c8:b0:3a7:d84c:f2b0 with SMTP id
 e9e14a558f8ab-3c2d277f25cmr465222875ab.8.1735831169834; Thu, 02 Jan 2025
 07:19:29 -0800 (PST)
MIME-Version: 1.0
References: <20250102094116.3847894-1-vladimir.kondratiev@mobileye.com>
 <CAAhSdy0cBkogjR1DbcS9-TLRbKiDqVTydrYQCihnEHDRu69CoQ@mail.gmail.com>
 <VI1PR09MB2333299725201F26F23A803694142@VI1PR09MB2333.eurprd09.prod.outlook.com>
 <CAAhSdy2P3AQckUXaH1XY2+zK4Cx=WYDsUUciODcLbka3z9q2XQ@mail.gmail.com> <VI1PR09MB2333013AB5FF1C5FBC14312394142@VI1PR09MB2333.eurprd09.prod.outlook.com>
In-Reply-To: <VI1PR09MB2333013AB5FF1C5FBC14312394142@VI1PR09MB2333.eurprd09.prod.outlook.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Jan 2025 20:49:19 +0530
X-Gm-Features: AbW1kvYEdig93G6e3cya3uxHujB7x6_zWtymx7CRJnGV9fuU1NQuI4pPqLVFPbg
Message-ID: <CAAhSdy3oL3doCANZLv4i9Z0v4ui82AC0oAAMnHkpnkMCS-EZNA@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv,aplic: support for hart indexes
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_071931_377327_6A0565A6 
X-CRM114-Status: GOOD (  16.89  )
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

T24gVGh1LCBKYW4gMiwgMjAyNSBhdCA4OjM34oCvUE0gVmxhZGltaXIgS29uZHJhdGlldgo8Vmxh
ZGltaXIuS29uZHJhdGlldkBtb2JpbGV5ZS5jb20+IHdyb3RlOgo+Cj4gPkhlcmUncyB0aGUgdGV4
dCBmcm9tICI0LjggSW50ZXJydXB0IGRlbGl2ZXJ5IGRpcmVjdGx5IGJ5IHRoZSBBUExJQyIgb2YK
PiA+dGhlIEFJQSBzcGVjaWZpY2F0aW9uOgo+Cj4gPiJXaGVuIGFuIGludGVycnVwdCBkb21haW4g
aXMgaW4gZGlyZWN0IGRlbGl2ZXJ5IG1vZGUgKGRvbWFpbmNmZy5ETSA9IDApLAo+ID5pbnRlcnJ1
cHRzIGFyZSBkZWxpdmVyZWQgZnJvbSB0aGUgQVBMSUMgdG8gaGFydHMgYnkgYSB1bmlxdWUgc2ln
bmFsIHRvIGVhY2gKPiA+aGFydCwgdXN1YWxseSBhIGRlZGljYXRlZCB3aXJlLiBJbiB0aGlzIGNh
c2UsIHRoZSBkb21haW7igJlzIG1lbW9yeS1tYXBwZWQKPiA+Y29udHJvbCByZWdpb24gY29udGFp
bnMgYXQgdGhlIGVuZCBhbiBhcnJheSBvZiBpbnRlcnJ1cHQgZGVsaXZlcnkgY29udHJvbCAoSURD
KQo+ID5zdHJ1Y3R1cmVzLCBvbmUgSURDIHN0cnVjdHVyZSBwZXIgcG90ZW50aWFsIGhhcnQgaW5k
ZXguIFRoZSBmaXJzdCBJREMgc3RydWN0dXJlCj4gPmlzIGZvciB0aGUgZG9tYWlu4oCZcyBoYXJ0
IHdpdGggaW5kZXggMDsgdGhlIHNlY29uZCBpcyBmb3IgdGhlIGhhcnQgd2l0aAo+ID5pbmRleCAx
OyBldGMuIgo+Cj4gPlRoZSBBSUEgc3BlYyBjbGVhcmx5IHNheXMgdGhhdCBmb3IgQVBMSUMgaW4g
ZGlyZWN0IG1vZGUgcmVxdWlyZXMKPiA+c2VxdWVudGlhbCAiSEFSVCBpbmRleCIgc3RhcnRpbmcg
ZnJvbSAwIHNvIHRoYXQgSURDIHN0cnVjdHVyZXMgY2FuCj4gPmJlIGxvY2F0ZWQgdXNpbmcgdGhl
IEFQTElDICJIQVJUIGluZGV4Ii4KPgo+IEhpIEFudXAsCj4gSSBhbSByZWFkaW5nIHNhbWUgdGV4
dCBidXQgaW50ZXJwcmV0aW5nIGl0IGRpZmZlcmVudGx5LiBJIHVuZGVyc3RhbmQgaXQgdGhpcyB3
YXk6Cj4gZm9yIGV2ZXJ5IGhhcnQsIHRoZXJlJ3MgImhhcnQgaW5kZXgiIHRoYXQgbWF5IGJlIGFy
Yml0cmFyeSAodW5pcXVlIGluIGRvbWFpbikKPiAxNC1iaXQgIGludGVnZXIuIFRoZW4gSURDIHNo
b3VsZCBiZSBhY2Nlc3NlZCB1c2luZyB0aGlzIGluZGV4LiBJIGRvbid0IHNlZQo+IGFueXRoaW5n
IHRoYXQgcHJvaGliaXRzIHNwYXJzZSBhcnJheSBvZiBJRENzLgo+Cj4gVG8gc3VwcG9ydCB0aGlz
LCAjNC41ICJNZW1vcnktbWFwcGVkIGNvbnRyb2wgcmVnaW9uIGZvciBhbiBpbnRlcnJ1cHQgZG9t
YWluIiBzYXlzOgo+Cj4gVGhlIGFycmF5IG9mIElEQyBzdHJ1Y3R1cmVzIG1heSBpbmNsdWRlIHNv
bWUgZm9yIHBvdGVudGlhbCBoYXJ0IGluZGV4IG51bWJlcnMgdGhhdCBhcmUgbm90IGFjdHVhbAo+
IGhhcnQgaW5kZXggbnVtYmVycyBpbiB0aGUgZG9tYWluLiBGb3IgZXhhbXBsZSwgdGhlIGZpcnN0
IElEQyBzdHJ1Y3R1cmUgaXMgYWx3YXlzIGZvciBoYXJ0IGluZGV4IDAsCj4gYnV0IDAgaXMgbm90
IG5lY2Vzc2FyaWx5IGEgdmFsaWQgaW5kZXggbnVtYmVyIGZvciBhbnkgaGFydCBpbiB0aGUgZG9t
YWluLiBGb3IgZWFjaCBJREMgc3RydWN0dXJlIGluCj4gdGhlIGFycmF5IHRoYXQgZG9lcyBub3Qg
Y29ycmVzcG9uZCB0byBhIHZhbGlkIGhhcnQgaW5kZXggbnVtYmVyIGluIHRoZSBkb21haW4sIHRo
ZSBJREMgc3RydWN0dXJl4oCZcwo+IHJlZ2lzdGVycyBtYXkgKG9yIG1heSBub3QpIGJlIGFsbCBy
ZWFkLW9ubHkgemVyb3MuCj4KPiBUaGlzIHN1Z2dlc3RzIDAgbWF5IGJlIG5vdCBhIHZhbGlkIGhh
cnQgaW5kZXgsIHNvIGNsZWFybHkgc29tZSBnYXBzIGFyZSBhbGxvd2VkLgoKSSBzZWUgeW91ciBw
b2ludCBhbmQgdGhpcyBpcyBhIGZhaXIgaW50ZXJwcmV0YXRpb24uCkkgd2lsbCByZXZpZXcgb3Ro
ZXIgcGF0Y2hlcy4KClRoYW5rcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
