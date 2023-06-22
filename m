Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC5CEB64D8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 17:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QxAA503ryQLvGoAHjBPDJR1VpKSObC+3s7mwS0aUfQw=; b=LMiTWvrX70Zo9R
	CigWOxVCxctP3/XmCPSlrR5etoQckqSkQUPkRWYCrFm8xC60cKSvjZPgMlWhBdszuzCV4YCPgFkPR
	1seg5glReoKWpKMF4TTKJCQtSecdTF+DC+O8ALrJvzWHpQdLVfMpxIldClMTARdysgm40IIbs7/Nf
	TEY1I0WuFx6UPYd1PxMpnjSOoUQUHJZOsVggTbeiHYtyIYsUpHjWGzG0LOAinWg6WPt/h0cT3ZdA1
	o8XkYlKkfvCUQq2c8haXpoa0JBIojOvjoJxitw9f0KOHdo+b0hixA/Cp1MbAaTxjMG+v6w0r6UvH+
	BSxZkUnYZaKduc5UjjrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCOAj-001LSc-0y;
	Thu, 22 Jun 2023 17:32:41 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCOAg-001LRo-0q
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 17:32:40 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f90b8ace97so64863265e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jun 2023 10:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687455155; x=1690047155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYzOr+m6ZxzxEvl2PF3jrjUYErtnMeTqwLS2G94marM=;
        b=ibqirJS/+biMpP8g0L5piVynHBTRRV0bAE5mOryNRHtbZi+mUnHRxl1c12p9uwMXoo
         VIA3AI2PNjkLGz2Lni0gPEPKYC1WiIWn39+K/xKx3l2kv003L3E5cnDW8khAhpgiXT1o
         zZhWog/JvqMDRqfmAEF1tlWoTjKMM18+q3PudZ8F1Id2V5ef5Vpi+xNIR1WDV2vDgad+
         hDiD0aKhjmRs29GFgxUG/6gtQL5Uv69OvhuVtj861qNiHJ7ZcnpLdQsMYtt3xOStWaiu
         Ew1FgY0Pbc3vEwbdd//PJgWVjUMI/q7UnDKCy3eGhRGfFQ8d5Zt6lnxi/L1gzBRm3nhm
         JfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687455155; x=1690047155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYzOr+m6ZxzxEvl2PF3jrjUYErtnMeTqwLS2G94marM=;
        b=jJlD0NNmJNlPnpjVaksZ/BiHOlcXNdnkBUM9q09ns6MrGF9M8gO/VfIxDSuyR1T2Mc
         ccAQzU/uua8GGBaMP/xwVs2os3O3Z6jZC/eXKN3tblsuy4v/Nks6kXYYv1hdsaCMNEsk
         FEaHifQvf74vsD8XSX4K4vSicmnsIh/LYiqbE3bJEbSD6d5rpEVlAyM8XlZh5WGB1OUv
         IC48j6GQV13e0IAoe5+nsBHf8YfxsqO9p3AXuEujKwKCOExYS0FIExfO8GnXbSgcFbUM
         um4F6RSCwENm2lKxKpOXLFJS1kPp3imWeRkRmIShnsrsd/SD8B+Y9SNTKw17zR600o68
         1b7Q==
X-Gm-Message-State: AC+VfDwAZKqBCvlBwfdhFXYV3Ql1uUSPcUWjb52CtG50BthjrJCF3O6F
	g3GEkn7uZHBm3Hn6ICFH4uao7Cs5ys5aavAxrlktmA==
X-Google-Smtp-Source: ACHHUZ4a2mEPLo7cxfgHRoQCrjnAyTY6kt8y7S9iJ/FgJPnbTeWHOErvMKTvucsyVTz5v4YV/fO/IM9DesMd11bIA1U=
X-Received: by 2002:adf:de87:0:b0:311:1029:e325 with SMTP id
 w7-20020adfde87000000b003111029e325mr16013813wrl.70.1687455155123; Thu, 22
 Jun 2023 10:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230621072234.9900-1-alexghiti@rivosinc.com> <20230621072234.9900-2-alexghiti@rivosinc.com>
 <20230621-d6da578719f8af903d6746ef@orel> <20230622-4af59422f118ea634836d351@orel>
In-Reply-To: <20230622-4af59422f118ea634836d351@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 22 Jun 2023 19:32:23 +0200
Message-ID: <CAHVXubgJQhShbOfaQeOTxM61g_tUnLBxa-0JK+WE+YQRGkYRQA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Documentation: riscv: Add early boot document
To: Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_103238_524911_B3330AE2 
X-CRM114-Status: GOOD (  13.88  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Song Shuai <songshuaishuai@tinylab.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gMjIsIDIwMjMgYXQgNzoyNOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgMDI6MTk6
NTBQTSArMDIwMCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+ID4gT24gV2VkLCBKdW4gMjEsIDIwMjMg
YXQgMDk6MjI6MzNBTSArMDIwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IC4uLgo+ID4gPiAr
SGFyZHdhcmUgZGVzY3JpcHRpb24KPiA+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ICsK
PiA+ID4gK1RoZSBmaXJtd2FyZSBjYW4gcGFzcyBlaXRoZXIgYSBkZXZpY2V0cmVlIG9yIEFDUEkg
dGFibGVzIHRvIHRoZSBSSVNDLVYga2VybmVsLgo+ID4gPiArCj4gPiA+ICtUaGUgZGV2aWNldHJl
ZSBpcyBlaXRoZXIgcGFzc2VkIGRpcmVjdGx5IHRvIHRoZSBrZXJuZWwgZnJvbSB0aGUgcHJldmlv
dXMgc3RhZ2UKPiA+ID4gK3VzaW5nIHRoZSBgJGExYCByZWdpc3Rlciwgb3Igd2hlbiBib290aW5n
IHdpdGggVUVGSSwgaXQgY2FuIGJlIHBhc3NlZCB1c2luZyB0aGUKPiA+ID4gK0VGSSBjb25maWd1
cmF0aW9uIHRhYmxlLgo+ID4gPiArCj4gPiA+ICtUaGUgQUNQSSB0YWJsZXMgYXJlIHBhc3NlZCB0
byB0aGUga2VybmVsIHVzaW5nIHRoZSBFRkkgY29uZmlndXJhdGlvbiB0YWJsZS4gSW4KPiA+ID4g
K3RoaXMgY2FzZSwgYSB0aW55IGRldmljZXRyZWUgaXMgc3RpbGwgY3JlYXRlZCBieSB0aGUgRUZJ
IHN0dWIuIFBsZWFzZSByZWZlciB0bwo+ID4gPiArIkVGSSBzdHViIGFuZCBkZXZpY2V0cmVlIiB0
cmVlIHNlY3Rpb24gYmVsb3cgZm9yIGRldGFpbHMgYWJvdXQgdGhpcyBkZXZpY2V0cmVlLgo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIHJlZHVuZGFudCAndHJlZScgaGVyZQo+ID4K
Pgo+IENhbiB3aG9ldmVyIGFwcGxpZXMgdGhpcyBkcm9wIHRoaXMgJ3RyZWUnIEkgcG9pbnRlZCB3
aGlsZSBhcHBseWluZz8KClllcywgc29ycnk6IEBDb25vciBEb29sZXkgZ2l2ZSBtZSB0aGUgb3Zl
cmx5IGxvbmcgbGluZXMgeW91IHdhbnRlZCBtZQp0byBicmVhayBhbmQgSSdsbCBzZW5kIGEgdjMs
IGl0IHdvbid0IHRha2UgbXVjaCB0aW1lIGFuZCBJJ2xsIGZpeCB0aGlzCnRvbyEKCj4KPiBUaGFu
a3MsCj4gZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
