Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF051CEB2E2
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 18:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MDb0OpoI86u+G92XpJ4ecF+DpkC4JslHQxXNag8+DAM=; b=BJLU6u6t8yyUMK
	ezZHpx7Q2TV4ht9LaaZP57hzbumdFlCTgdPT4IqyLWdTcYXPEf8TPr5MLSiJrVpuRMmPgB9H5Hf7a
	/KXv8S4zrsh8GDcTdCtQXN0nL0PrstGwu4axnxs3xLtE2ttZ0wRg6PeWnmf0JTSf5EuBJ319zLcm2
	P81Mt09m8BLSBVNZuzGTbsGNirFRrFDzqxu+FVsvpYICCUqZyoAdYnleIf+EU1wCUFfzmIetyYaf4
	zOZKcsIQ/FcQ4s6lzVsi2uQ84AVuyhavY+bKhN/8BrZDlrCemolFASM+pn95BereVriKQq56EgQLT
	oryFcnBDUK3VBAUyxJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw4Bl-00000007Br6-13jb;
	Wed, 02 Oct 2024 18:35:05 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw4Bh-00000007BoE-2xTa
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 18:35:04 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20b90984971so474385ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Oct 2024 11:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727894100; x=1728498900; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2bn2F/yqD7qU/04cqSEQXSLsFN+5ARfldGIgsw/yx6w=;
        b=BrFY4HcIgLH3J+UWDsL4bPO3Q62ybPnG38ufwHz0RmM96Adg0VgdYgcWeUcnXVTpL3
         6rDKZeCIyJhdcMQPNCRyB2ZgS5I/NNjXuaK8UyY1nIMqYwUnuHgVmyFlx1tdKZsNMii6
         g9ERt3HiZwJTIsdy2GRe1Up6NVva+sInnhZiKYfA4ibnPUrfGDz/HGqT915vDiDJemqo
         IaBxQ3pKX/o3j+tGo1/END30PL3PmXjm6dXwMuX7XpsoiTWCNtGpI91oBZL7YUsIhjke
         4/qB1OeaBGX+LsSOPV9l2UQHHQ6NoxB1yWuGbIU6kOIw5eHgW0Ca4Vuq+vXR5xuH+niE
         dkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727894100; x=1728498900;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2bn2F/yqD7qU/04cqSEQXSLsFN+5ARfldGIgsw/yx6w=;
        b=V3ol+893YDZoYCCmHA40A9mGe8kfmHA2AKW3q8i9NOsIShx/gkcZT0fgVc9OHIhgGk
         xyHdw7wN0G7OOnn9mly/brnL31nNk3pyaMIWVYiuDViMo/ucTTQAqaXBslvHFqGMB6xw
         KceBen+sKfA3kBkuSO5XAheqVo/fTfwCBX1FwxozR8a5ZUsK3B77wms6QbHIOotxk3lP
         9larkIiQLGwEOJH1twKzevTVeBsfeuXvpyb6kBPro7nnaV7zZP3rrvLao5QH4WbRUI48
         /ZddowRwL6eKfSBSiYzMIvvHO2g2voSmHpLM3AlFenWM3YieQEge8HJoEUJmExDQvFhF
         hu6g==
X-Forwarded-Encrypted: i=1; AJvYcCWzwRyyMCMux/SyfSFW0vYrIDO1KPgP5Iqfycz9nfB6imyw6IshPd9oxSOkLKSHapu5+ITBHgbgzo//sA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp75L/ow8903T9KIM+F1Ujao5GNeXwkD97pvnoRmKm/6cBZM6s
	KYXCRaVGsYhnbHBVi8aM60B+41bmbnHkWiSzWbeHckElfjLlr1qIWyDA5He3uJc=
X-Google-Smtp-Source: AGHT+IGyYDFCPfBUD6cqyyaq/aeFBAk0GqWubZItpSq29H18WWXrjLh/21OEwSnJg9ub9uTxFHI7LQ==
X-Received: by 2002:a17:902:dac4:b0:20b:13a8:9f67 with SMTP id d9443c01a7336-20bc59ec852mr70149115ad.1.1727894100059;
        Wed, 02 Oct 2024 11:35:00 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b5b167128sm69551315ad.283.2024.10.02.11.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 11:34:59 -0700 (PDT)
Date: Wed, 2 Oct 2024 11:34:57 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/8] pinctrl: Add T-Head TH1520 SoC pin controllers
Message-ID: <Zv2SUVv2PUYqwOzh@x1>
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
 <CACRpkdavPAv2sPRREQhx_A7EtOj6Ld_n+NcO+vH0QCnfVedXKw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdavPAv2sPRREQhx_A7EtOj6Ld_n+NcO+vH0QCnfVedXKw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_113502_153648_82759255 
X-CRM114-Status: GOOD (  18.38  )
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

T24gVHVlLCBPY3QgMDEsIDIwMjQgYXQgMDI6MTM6MjBQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBNb24sIFNlcCAzMCwgMjAyNCBhdCA5OjUx4oCvUE0gRHJldyBGdXN0aW5pIDxk
ZnVzdGluaUB0ZW5zdG9ycmVudC5jb20+IHdyb3RlOgo+IAo+ID4gVGhpcyBhZGRzIGEgcGluIGNv
bnRyb2wgZHJpdmVyIGNyZWF0ZWQgYnkgRW1pbCBmb3IgdGhlIFQtSGVhZCBUSDE1MjAKPiA+IFJJ
U0MtViBTb0MgdXNlZCBvbiB0aGUgTGljaGVlIFBpIDRBIGFuZCBCZWFnbGVWIEFoZWFkIGJvYXJk
cyBhbmQgdXBkYXRlcwo+ID4gdGhlIGRldmljZSB0cmVlcyB0byBtYWtlIHVzZSBvZiBpdC4KPiAK
PiBUaGFua3MgRHJldywgdjMgbG9va3MgZ29vZC4gSSd2ZSBtZXJnZWQgaXQgdG8gYW4gaW1tdXRh
YmxlIGJyYW5jaDoKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9saW51c3cvbGludXgtcGluY3RybC5naXQvbG9nLz9oPWliLXRoZWFkLXRoMTUyMAo+IAo+
IFRoZW4gSSBtZXJnZWQgdGhhdCBpbnRvIG15ICJkZXZlbCIgYnJhbmNoIGZvciB2Ni4xMy4KClRo
YW5rcyBmb3IgdGFraW5nIHRoaXMuIFdpbGwgdGhhdCBhbHNvIGVuZCB1cCBpbiBsaW51eC1uZXh0
IGV2ZW50dWFsbHk/CgpJJ20gd29ya2luZyBvbiBhIFRIMTUyMCBFdGhlcm5ldCBkcml2ZXIgd2hp
Y2ggZGVwZW5kcyBvbiB0aGUgcGluY3RybApkcml2ZXIuIEFuZHJldyBMdW5uIHJlcGxpZWQgdG8g
bWUgdGhhdCBhbGwgdGhlIGRlcGVuZGVuY2llcyBuZWVkIHRvIGJlCmluIGxpbnV4LW5leHQgWzFd
LgoKPiBZb3UgY2FuIG1lcmdlIHRoZSBEVFMvRFRTSSBmaWxlcyB0aHJvdWdoIHRoZSBTb0MgdHJl
ZSwgRldJVzoKPiBBY2tlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPgoKVGhhbmtzLCBJJ2xsIHRha2UgdGhlIGR0cyB0aHJvdWdoIG15IHRoZWFkIHRyZWUgWzJd
LgoKPiBJIHRoaW5rIEknbGwgbWFrZSBhIHN0YWIgYXQgdXNpbmcgZ3VhcmRlZCBtdXRleGVzIGV0
YyBhbmQgc2VlIHdoYXQKPiB5b3UgdGhpbmsgYWJvdXQgaXQhCgpEbyB5b3UgbWVhbiB1c2luZyBz
Y29wZWRfZ3VhcmQoKSBmb3IgdGhwLT5tdXRleCBpbgp0aDE1MjBfcGluY3RybF9kdF9ub2RlX3Rv
X21hcCgpPwoKdGhhbmtzLApkcmV3CgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvOTlhZjQxMWMtZmY0MC00Mzk2LWE2ZTItNWFhYzE3OWJhMWJlQGx1bm4uY2gvVC8jdApb
Ml0gaHR0cHM6Ly9naXRodWIuY29tL3BkcDcvbGludXgvdHJlZS90aGVhZC1kdC1mb3ItbmV4dAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
