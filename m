Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36F3C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 06:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Sf7FMpEASEIQTk7ajm8rLm+mRsfu/4DNr5kYQ07AmY=; b=teW9vqOZXGwwRQ
	yePg7VleK4M5WPqtTwQ+2HNjwsNM5muBbQjYoKbWd2tI5D706Z9AQUijmu4woguU8hmANpMClCY6A
	bbJsWnznMBFUN0H+d5Qz3vDqWoMmkydMzyRJMSswhy6ZXrB3vBDOs9lDjHsvrc1z1UR9rESETVcYt
	WaZ1t0J4l8V2h9zHwy6oY0N4u3zwKHmsoi3f1mcNH/khrbTzWrnHzFDrfu74YeRcYVL08nArr2Yy1
	l45TZKulMdiduYlTP37mdP43epe+cxuSuNJF3yvk/fSTaBD7hYKrLwi16qwqaE5k8OMT0oGxTx8J6
	LFVopDzAF3nVn34wr5kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1KhV-00000001hbG-3u3s;
	Mon, 29 Apr 2024 06:41:21 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1KhR-00000001hZO-2A3t
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 06:41:19 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1e4266673bbso35702835ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 28 Apr 2024 23:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714372872; x=1714977672; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g3CHl/SFXqYAERGdLxtaMngC8S6DnU6XgXGwCxtAafo=;
        b=hzWfqg5NnX5d32peS4bH1qKlVqKSWeAhribnkxYOJJkNOjG4oQS3RMhzcLP4o9Muo3
         dT0V7leY5XN+hWVT8NlNymlyP2o/aJkW0i66SYW/l6HmP/xti4W4q27gK/C+n0KKDF2O
         ZK68sBVvsOECf8ijfFb6o9YDpaHAeKluBOM7G2mxBKWDIuBvLZLCo9imd7lMj/o5LYCy
         2+pg5bKkCBNg7HcsTJT8XHVtjMictNBYhRccFbjO3LHBk9+op2HEv5nU/Ztesjr6hWwH
         1+a6FadZ1Zb83JdrvwxF+gYvrwvHQqbh4q3b9edEU0Xz5TZ870rwTYPjWBuzwlAYlKbi
         7CEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714372872; x=1714977672;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g3CHl/SFXqYAERGdLxtaMngC8S6DnU6XgXGwCxtAafo=;
        b=UgsChQ80pO+TU4Zc895sTt8UcgCJ+BasCQ9a3ZNLstMAyMBiWxg0J7St0dycIfUxx+
         ePXuDv2ZGJG/prea8CuXqsxuLy8A+RYMixVPLLVKwFe071hcYQIT8hKkKH6q/x0QyJJO
         A1VAMk2bpzBHWD2MTf39cygRqOvBplIUlElpHqB4pDl8qzEsTe78vcodltaTiAxkhaUq
         MyR+EuiRiUmW6IamxCz4+4eFm244wUDmIKFow3+bDuoB0Lh2hYKMgheV0/nX4SkgpVN6
         IgWdCTL07Pe/iEnkHTg8nu7plqE/4xVAAMGOmKnV3OnkG/jFs2CrHiMrqyleFgVpxYtK
         TgHA==
X-Forwarded-Encrypted: i=1; AJvYcCVx3LqniCfvuTg69PnmcMKyESzkwVj1uiBh9K1Fex1Dn2oVsZrmMwhQFqZYQtyaItn/B+qbBMIypYJUmbQ0ZpKyBJuBYE7OroT8bC++Ktws
X-Gm-Message-State: AOJu0Yzsk3BuPP5ASGVfFWtbpHtmTMxLeSFNN6C0U5sSqcXLFv9MH2bb
	X/u88FvUthgT2XI6+J2TNP6WcyWYBKEr2p7nw0fuRBNvp0pErDeQxCbc57hIxYA=
X-Google-Smtp-Source: AGHT+IHJIq5O7lAJlnVgT2TPMMefYPHPYX81CZ0/PXoTk2cDvl0s5hdpuoLRaOXaOY+XM//0LK1HGQ==
X-Received: by 2002:a17:902:bf01:b0:1e8:32ed:6f6d with SMTP id bi1-20020a170902bf0100b001e832ed6f6dmr9271613plb.39.1714372871641;
        Sun, 28 Apr 2024 23:41:11 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.62])
        by smtp.gmail.com with ESMTPSA id u9-20020a170902bf4900b001e26b7ac950sm19421830pls.272.2024.04.28.23.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 23:41:11 -0700 (PDT)
Date: Mon, 29 Apr 2024 12:11:00 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Robert Moore <robert.moore@intel.com>,
	Haibo1 Xu <haibo1.xu@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Andrei Warkentin <andrei.warkentin@intel.com>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC PATCH v4 00/20] RISC-V: ACPI: Add external interrupt
 controller support
Message-ID: <Zi9A/KQv5fB/8nB3@sunil-laptop>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
 <CAJZ5v0gTzn3TDoh0+0UQjMeJVdU+z16dDOT_fKMhr0XrOxyRtA@mail.gmail.com>
 <871q6uir15.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871q6uir15.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_234117_579835_AB882478 
X-CRM114-Status: GOOD (  20.66  )
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

T24gV2VkLCBBcHIgMjQsIDIwMjQgYXQgMDc6NTU6NTBQTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3
cm90ZToKPiAiUmFmYWVsIEouIFd5c29ja2kiIDxyYWZhZWxAa2VybmVsLm9yZz4gd3JpdGVzOgo+
IAo+ID4gT24gTW9uLCBBcHIgMTUsIDIwMjQgYXQgNzowMeKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2
bEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Pgo+ID4+IFRoaXMgc2VyaWVzIGFkZHMgc3Vw
cG9ydCBmb3IgdGhlIGJlbG93IEVDUiBhcHByb3ZlZCBieSBBU1dHLgo+ID4+IDEpIE1BRFQgLSBo
dHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFvTUdQeU9ENThKYVBnTWwxcEthc1QtVktz
SUtpYTd6Ui92aWV3P3VzcD1zaGFyaW5nCj4gPj4KPiA+PiBUaGUgc2VyaWVzIHByaW1hcmlseSBl
bmFibGVzIGlycWNoaXAgZHJpdmVycyBmb3IgUklTQy1WIEFDUEkgYmFzZWQKPiA+PiBwbGF0Zm9y
bXMuCj4gPj4KPiA+PiBUaGUgc2VyaWVzIGNhbiBiZSBicm9hZGx5IGNhdGVnb3JpemVkIGxpa2Ug
YmVsb3cuCj4gPj4KPiA+PiAxKSBQQ0kgQUNQSSByZWxhdGVkIGZ1bmN0aW9ucyBhcmUgbWlncmF0
ZWQgZnJvbSBhcm02NCB0byBjb21tb24gZmlsZSBzbwo+ID4+IHRoYXQgd2UgZG9uJ3QgbmVlZCB0
byBkdXBsaWNhdGUgdGhlbSBmb3IgUklTQy1WLgo+ID4+Cj4gPj4gMikgQWRkZWQgc3VwcG9ydCBm
b3IgcmUtb3JkZXJpbmcgdGhlIHByb2JlIG9mIGludGVycnVwdCBjb250cm9sbGVycyB3aGVuCj4g
Pj4gSVJRQ0hJUF9BQ1BJX0RFQ0xBUkUgaXMgdXNlZC4KPiA+Pgo+ID4+IDMpIFRvIGVuc3VyZSBw
cm9iZSBvcmRlciBiZXR3ZWVuIGludGVycnVwdCBjb250cm9sbGVycyBhbmQgZGV2aWNlcywKPiA+
PiBpbXBsaWNpdCBkZXBlbmRlbmN5IGlzIGNyZWF0ZWQgc2ltaWxhciB0byB3aGVuIF9ERVAgaXMg
cHJlc2VudC4KPiA+Pgo+ID4+IDQpIFdoZW4gUE5QIGRldmljZXMgbGlrZSBHZW5lcmljIDE2NTUw
QSBVQVJULCBoYXZlIHRoZSBkZXBlbmRlbmN5IG9uIHRoZQo+ID4+IGludGVycnVwdCBjb250cm9s
bGVyLCB0aGV5IHdpbGwgbm90IGJlIGFkZGVkIHRvIFBOUCBkYXRhIHN0cnVjdHVyZXMuIFNvLAo+
ID4+IGFkZGVkIHNlY29uZCBwaGFzZSBvZiBwbnBhY3BpX2luaXQgdG8gaGFuZGxlIHRoaXMuCj4g
Pj4KPiA+PiA1KSBBQ1BJIHN1cHBvcnQgYWRkZWQgaW4gUklTQy1WIGludGVycnVwdCBjb250cm9s
bGVyIGRyaXZlcnMuCj4gPj4KPiA+PiBUaGlzIHNlcmllcyBpcyBzdGlsbCBrZXB0IGFzIFJGQyB0
byBzZWVrIGZlZWRiYWNrIG9uIGFib3ZlIGRlc2lnbgo+ID4+IGNoYW5nZXMuIExvb2tpbmcgZm9y
d2FyZCBmb3IgdGhlIGZlZWRiYWNrIQo+ID4KPiA+IEkndmUgbG9va2VkIGF0IHRoZSBwYXRjaGVz
IGFuZCBJIGRvbid0IHNlZSBhbnl0aGluZyBkZWVwbHkgY29uY2VybmluZwo+ID4gaW4gdGhlbSBm
cm9tIHRoZSBBQ1BJIGNvcmUgY29kZSBwZXJzcGVjdGl2ZS4KPiA+Cj4gPiBUaGUgY2hhbmdlcyBs
b29rIHJlYXNvbmFibHkgc3RyYWlnaHRmb3J3YXJkIHRvIG1lLgo+IAo+IFN1bmlsLCBnaXZlbiBS
YWZhZWwncyBpbnB1dCwgaXQgc291bmRzIGxpa2UgaXQncyB0aW1lIGZvciBhIHBhdGNoCj4gcHJv
cGVyLiBUaGlzIGlzIHJlYWxseSB0aGUgbWlzc2luZyBwaWVjZSB0byBtYWtlIEFDUEkgdXNhYmxl
IG9uIFJJU0MtViEKPiAKPiBUaGFua3MgZm9yIHRoZSBuaWNlIHdvcmshCj4gQmrDtnJuCj4gCj4g
RldJVywKPiBUZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAK
U29ycnkgZm9yIHRoZSBkZWxheWVkIHJlc3BvbnNlLiBJIHdhcyBBRksgbGFzdCB3ZWVrLgoKTWFu
eSB0aGFua3MhISwgUmFmYWVsLiBMZXQgbWUgc2VuZCBuZXh0IHZlcnNpb24gd2l0aG91dCBSRkMu
CgpUaGFuayB5b3UgdmVyeSBtdWNoIEJqw7ZybiBmb3IgdGVzdGluZyBpdC4KClRoYW5rcywKU3Vu
aWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
