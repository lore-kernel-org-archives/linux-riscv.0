Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2023BC2BA18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 01:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KG6IlIPJHHH2c31DGAckP77zbAvfZvxnH0gkRYUDbZk=; b=vXdVB5slCE/6EA
	CuQdB+kGpfTAIRBaogyMxlOGQBdC0tpnUNW7u3Jjdo2Au1pmXxKlorlwwvdiHCmRNpTv0bSDLbG3S
	6r44edXa+m6qJtcw2ORwwsIiXCJrn8f86SSFPhNoj2UU9O7wyuf3KDuLhNGb/XYxWPkoVRb6RJ/XR
	0IqBWOiP5CrAZcQP709Zt3g4FIemYxACGAbT91ZlcmIiQgSA0cFC2R9Z2hZ1cEbYAJ/TcRowujDaR
	jT6Z5BwHfhnrpvOzxcf5B8fC91k69tGp8HhTI4vYa5ckd8ACdTtGI03lcn/J8bXQC/QCOfBBU7v3m
	23kdDNRRuMLUOTSF8NDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJNRA-0000000DAA0-3P7o;
	Tue, 18 Jun 2024 01:15:04 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJNR7-0000000DA88-2PMe
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 01:15:03 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-7eb01106015so220282439f.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2024 18:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718673300; x=1719278100; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7Mw9balXkdXrpGP42GBrIywjp+7pg5Y/72fbcj8y6A=;
        b=h1DD+F6dQ7Unpber1svCCG46SkLD2K9pROibCZ617iEgZRxELe1h+Rym9NMjX3Nq28
         1IJQ39y943xMpQBLqWi7/9hPBuKe7K4c1ZIAU2KkxcC+oHh9A4e56rbvQa0DFaFOZVdI
         Q84LA3wCcCSJ/KHCV0oOqzkX4H5an4kOtFiJ5a7HXp0aGou0fgnpsmfw3DSgsG65VP4Q
         dADrXJ/8XpN0HGrcCoNodr3B70nHEaVWwrGbB4ukGczYhXdgKnf0HjxIVxSEjgDlwwF/
         tiOWkR5+7ktfPP8qxtsMHbbB8ILaEhoJEWbhcuZlT6zkoS6eFeamNjOEicDCYCU2WXuF
         U/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718673300; x=1719278100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7Mw9balXkdXrpGP42GBrIywjp+7pg5Y/72fbcj8y6A=;
        b=HHOr/Nq3GTPixpUv473N+C0oqz8eYyMKkXXWFghMKhghO1jOSs2aReIHyY6J64G8Fa
         fxk+Lux2rNQ4einv3rS9YVBTEBhKEExNE6+FEXqyvf0x0gPYiFUpiAaCKQEKPo9ds0/H
         n/G2sgRg6op9npgBNQCsU0EmC+KEKwksEjJx5l8LodNzZ+9LjAiH0w3KgsQshkc6E+f/
         sL/pmQL00ev6/To5aw3xFgik7GPtxMK5rgI7OLSuULVto46LtfVB3yPCDvPD+9htTIB0
         derMfW11mQBGQWvwCq1TXPDMgLZkEUkoOyAYLsBDhtMYIgxKUksQNG6Ed+WzWjihIl/H
         BuDA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Y2N/6SUVWP9qLSgEA8nfz6UYBaSRG3kIj4NCllQFJHfw6b13aOpcnYaNdnlW3/lJPD3lsoDZRnPKeMpqP1SjfJYmeltivudPeR2h1vIK
X-Gm-Message-State: AOJu0Yy7bAr5ynx9u4DWx5mpAW6SNXqd+7ciMWQ4XA90B0ox8mQ173HZ
	DJDN0oFep4iTAFGf+QkFl20x3MYpbptHGbSQ1TTqDDOhrVclrB08lhbrT5Gh7bdBvZaIIVYhA7R
	sdjG7XJTRUs+eZ0XN+tNL3COSa1ArT96spePuHw==
X-Google-Smtp-Source: AGHT+IHVk2V/zxfCC+TEYjE1GLUfJe8wd2/UBNvu0XGLc1b3cPwbgU0WKTC0+y5CcD6xobj4+R6Bbm6kIWf56tesqFQ=
X-Received: by 2002:a05:6602:2dc8:b0:7eb:7df7:461c with SMTP id
 ca18e2360f4ac-7ebeb644d32mr1162260739f.21.1718673300529; Mon, 17 Jun 2024
 18:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240614142156.29420-1-zong.li@sifive.com> <20240614142156.29420-2-zong.li@sifive.com>
 <20240617145521.GE791043@ziepe.ca>
In-Reply-To: <20240617145521.GE791043@ziepe.ca>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 18 Jun 2024 09:14:49 +0800
Message-ID: <CANXhq0oq=JjwjneJ+S2YtuaaPWdHYHuKrtcm+_Agn4CfjbyfDw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/10] iommu/riscv: add RISC-V IOMMU PMU support
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kevin.tian@intel.com, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_181501_707315_6B88BDED 
X-CRM114-Status: GOOD (  11.02  )
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

T24gTW9uLCBKdW4gMTcsIDIwMjQgYXQgMTA6NTXigK9QTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6
aWVwZS5jYT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAxNCwgMjAyNCBhdCAxMDoyMTo0N1BNICsw
ODAwLCBab25nIExpIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBpbXBsZW1lbnRzIHRoZSBSSVNDLVYg
SU9NTVUgaGFyZHdhcmUgcGVyZm9ybWFuY2UgbW9uaXRvciwgaXQKPiA+IGluY2x1ZGVzIHRoZSBj
b3VudGluZyBhbnMgc2FtcGxpbmcgbW9kZS4KPiA+Cj4gPiBTcGVjaWZpY2F0aW9uIGRvZXNuJ3Qg
ZGVmaW5lIHRoZSBldmVudCBJRCBmb3IgY291bnRpbmcgdGhlIG51bWJlciBvZgo+ID4gY2xvY2sg
Y3ljbGVzLCB0aGVyZSBpcyBubyBhc3NvY2lhdGVkIGlvaHBtZXZ0MC4gQnV0IHdlIG5lZWQgYW4g
ZXZlbnQgZm9yCj4gPiBjb3VudGluZyBjeWNsZSBpbiBwZXJmLCByZXNlcnZlIHRoZSBtYXhpbXVt
IG51bWJlciBvZiBldmVudCBJRCBmb3IgaXQgbm93Lgo+Cj4gV2h5IGlzIHRoaXMgcGFydCBvZiB0
aGUgbmVzdGluZyBzZXJpZXM/CgpBcyB5b3UgbWVudGlvbmVkLCBpdCBzaG91bGQgYmUgYSBzZXBh
cmF0ZSBwYXRjaCBzZXQsIGxldCBtZSBzdWJtaXQgaXQKaW5kaXZpZHVhbGx5IGluIHRoZSBuZXh0
IHZlcnNpb24uIFRoYW5rcwoKPgo+IEphc29uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
