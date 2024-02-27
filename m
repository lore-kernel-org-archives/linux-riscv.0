Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199E1C5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 16:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=cKTzsGtzbAKOOnae96uQWCmBu5uuKOVzRsvVpuTzGkg=; b=Ld+Ow62MlynqcyHlLOZ7UYYga4
	HhOLd668PVoT34junon8wW/wKD7o/j3d0aVY5f7XvJ3rkPGL+ZKNirw5aLn8ejKOQOj94EIjX65jr
	MYpEBe7YhSNz66X5P4g2AVoWoConejVNGdReFcJ6cO7lDvZUsXQBeOXJDmixZ5LYJxX8Elmqf7CCh
	G2fZxqUYZVGso+ibRD6ZdtpQhyGId4/C7oynXkPHI5zzlzbnKhcDne0Z7JfyFmTGBPXPg3Y7ZaAeC
	k9KuZpqbku6v+Swa9mnYmwRzoUjhpqiLtPtG3PHlYnrAEAvOxbTRPBaIKGwj7b9Nu+deg+Gt7zIMq
	d6/3zx3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf0Tm-000000060kJ-44S9;
	Tue, 27 Feb 2024 16:38:54 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf0Tk-000000060im-1VCr
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 16:38:53 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3651c1e1022so17505885ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 08:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1709051930; x=1709656730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBYvHRNVmUQHuF4u6D8aV99gBzMfLHOJu7wZkaD6DE8=;
        b=wvcNiPDJXdQSlhxw4HmJeBNFwz9r1bTRgD2M6ce847NE96UGQCegxV/LlZYeBGKfQD
         VSMiT86ifYcqFqfRWGdHo05FAhtoDVKi4oOcp7N/tM1Pxx5svEcSozv5zbb4gfCkz8tp
         hKtwtqGUo+sTydz6xrSXvgXrqTQwBKlvWH7ciNcxrLblRdCw80ceuM2rC+WBtz9aE8Hx
         iEwrDfwq4XgttsDItEmXUEZHTd8EQOmkF+7gCyldt9lpfpaaLbVsRw7ZC9SfQoOWLTf5
         k+ohteiPV6H73culhc/2Kwt6SJ96ickYI/5Ai9rcmf6RUfec6JV+5G0p7CyO9lUyOuvK
         KWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709051930; x=1709656730;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBYvHRNVmUQHuF4u6D8aV99gBzMfLHOJu7wZkaD6DE8=;
        b=Z53AdjMDv6Dc96hNSVk71FZcNeb0yd92wlNr5ciRrtOJpX+IdKkUVv23jbN/qUrzWt
         2fZm2q2JJ0wTODuHM+RMq5dday8LfFgnEIGyYhT4j8eLbV082FOTJncUgyKTJwIPtn20
         geEEbMzJzKjOe8jkK2hR1DJuqoFwbs6Oj/G/bN2GmUNOJQh5RnrPl7VsCxiiUodbvZme
         5Wc9koDlyJh8qdJWmZ+codxTOjJ/BfRfE22ulwCh70c9fG7Halw4CTcFjEYkkGHJu2HU
         GQss0WyzV6UsOyyBDwub3cnqWHmkDlVyo+asm8dpMPlr20qq0M3Tj5hqaBBbMtzLsvFV
         CiiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuhy/DAgjaIoAoQ/R447Tlp659bIXwtLnSa6b2vq0lJksOFJU2/qS/KKuZidnwVwA1T+RcEXhBCqOeBe628uUSSQG81p5VNQ6ybAygNbHo
X-Gm-Message-State: AOJu0Yw26zyFmT8PR3c31vN9nHnzKqCkZ5eCY8id99IFv68xvOS9yEFg
	CtAYGlx0gyxWd4ngiC85Vc439f2GRzq6Hk8HOizw5niWeT8NWRDnrlz/pujXWYc=
X-Google-Smtp-Source: AGHT+IF/piMzSGTcKm+9pvDU30C2+pCT5esgldW0sjMlovL7AeIarCO2Czmdb8PlN8+u1fgjCQQDcg==
X-Received: by 2002:a05:6e02:1bce:b0:365:24d9:9477 with SMTP id x14-20020a056e021bce00b0036524d99477mr14656459ilv.15.1709051930522;
        Tue, 27 Feb 2024 08:38:50 -0800 (PST)
Received: from localhost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id ls22-20020a056a00741600b006e533caee00sm3465541pfb.155.2024.02.27.08.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 08:38:50 -0800 (PST)
Date: Tue, 27 Feb 2024 08:38:50 -0800 (PST)
X-Google-Original-Date: Tue, 27 Feb 2024 08:38:48 PST (-0800)
Subject: Re: [PATCH] riscv: deprecate CONFIG_MMU=n
In-Reply-To: <a49546e8-6749-4458-98da-67fd37b7df18@rivosinc.com>
CC: lohr85@gmail.com, Conor Dooley <conor@kernel.org>, samuel.holland@sifive.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, ajones@ventanamicro.com,
  dlemoal@kernel.org, Bjorn Topel <bjorn@rivosinc.com>, Atish Patra <atishp@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: cleger@rivosinc.com
Message-ID: <mhng-a3b495e6-aca6-4137-a3c1-8fcacafd8596@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_083852_566502_AF218393 
X-CRM114-Status: GOOD (  31.17  )
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

T24gVHVlLCAyNyBGZWIgMjAyNCAwMToxMTo0MSBQU1QgKC0wODAwKSwgY2xlZ2VyQHJpdm9zaW5j
LmNvbSB3cm90ZToKPgo+Cj4gT24gMjYvMDIvMjAyNCAyMDowMCwgQ2hhcmxlcyBMb2hyIHdyb3Rl
Ogo+PiBXT0FIISBQbGVhc2UgRE8gTk9UIGRlcHJlY2F0ZSBOT01NVS4gSSB1c2UgdGhlIE5PTU1V
IGJ1aWxkIGNvbnN0YW50bHkKPj4gYW5kIE5PTU1VIExpbnV4IG9uIFJJU0MtViBpcyB0aGUgYXZl
bnVlIHVzZWQgYnkgbWFueSBGUEdBIHNvZnQgY29yZXMKPj4gZm9yIExpbnV4LCBhcyB3ZWxsIGFz
IHNvbWUgbGltaXRlZCBzeXN0ZW1zLgoKT0suCgpJIGp1c3QgYnVpbGQgdGVzdCB0aGlzIHN0dWZm
LCBhcyBJIGRvbid0IHJlYWxseSBoYXZlIGEgdXNlIGZvciBpdCAKcGVyc29uYWxseS4gIEkgZmln
dXJlZCBpZiBub2JvZHkncyByZXBvcnRpbmcgYnVncyB0aGVuIHByb2JhYmx5IGl0J3MgCmJyb2tl
biBhbmQgbm9ib2R5J3Mgbm90aWNlZCBiZWNhdXNlIG5vYm9keSdzIHVzaW5nIGl0LgoKPj4gSSBn
ZXQgbmV3IGNvcGllcyBvZiB0aGUga2VybmVsIHdoZW4gdGhlcmUgYXJlIHJlbGVhc2VzIGFuZCB0
ZXN0IHRoZW0KPj4gZnJlcXVlbnRseSB0byBtYWtlIHN1cmUgZXZlcnl0aGluZyBpcyBzdGlsbCB3
b3JraW5nIGFzIGV4cGVjdGVkLgoKSSdkIGFjdHVhbGx5IGV4cGVjdGVkIGl0IHRvIGJlIGJyb2tl
biwgYnV0IEkgZ3Vlc3Mgd2UgbWFuYWdlZCB0byBhdm9pZCAKc2NyZXdpbmcgdGhpbmdzIHVwIDsp
Cgo+PiBGb3IgdXMgd2UganVzdCBkb24ndCBjYXJlIGFib3V0IFhJUC4gSSBtZWFuIGlmIHNvbWVv
bmUgZGlkIHB1c2ggaXQKPj4gdGhyb3VnaCB0byBmcnVpdGlvbiwgSSdkIGFsc28gdGVzdCBhbmQg
dXNlIGl0LCBidXQgSSB1cmdlIHlvdSBwbGVhc2UKPj4gZG8gbm90IGRlcHJlY2F0ZSB0aGlzLiAg
V2hpbGUgaXQncyBzb21ldGltZXMgbmVlZGVkIGEgYml0IG9mIGEKPj4gY3JlYXRpdmUgYnVpbGQg
dG8gZ2V0IGV2ZXJ5dGhpbmcgd29ya2luZywgSSd2ZSBuZXZlciBuZWVkZWQgdG8gcGF0Y2gKPj4g
YW55dGhpbmcgaW4gdGhlIGtlcm5lbCBiZXlvbmQgcGF0Y2hpbmcgaW4gYSBjdXN0b20gY29uc29s
ZSBmb3Igc2VyaWFsCj4+IG91dHB1dC4KPj4KPgo+IEhleSBDaGFybGVzLAo+Cj4gTm8gd29ycmll
cywgd2UgYWN0dWFsbHkgZGlkIG5vdCBleHBlY3RlZCBOT01NVSB0byBoYXZlICpzbyBtYW55KiB1
c2Vycy4KPiBJIGd1ZXNzIGRlcHJlY2F0aW5nIHN0dWZmIGlzIGEgZ29vZCB3YXkgdG8gaGF2ZSBp
bW1lZGlhdGUgZmVlZGJhY2sgOykuCj4gSGF2aW5nIEZEUElDIHBzQUJJIHRvIGJlIG1lcmdlZCB1
cHN0cmVhbSBjb3VsZCBhbHNvIHByb2JhYmx5IGJlIGEKPiBwb3NpdGl2ZSBwb2ludCB0b3dhcmQg
YSBiZXR0ZXIgTk9NTVUgc3VwcG9ydC4KCllhLCB0aGF0J3MgcHJvYmFibHkgdGhlIHJpZ2h0IHdh
eSB0byBkbyBpdC4gIFRvdWNoaW5nIGFueXRoaW5nIGluIHRoZSAKcHNBQkkgaXMgcHJldHR5IG1p
c2VyYWJsZSwgdGhvdWdoLCBzbyBJIGRvbid0IHJlYWxseSB3YW50IHRvIGZvcmNlIApwZW9wbGUg
dG8gZG8gaXQuLi4KCj4+IEkgYW0gaGFwcHkgdG8gZGlzY3VzcyB0aGUgcG9zc2liaWxpdHkgb2Yg
bWUgYW5kIG9yIG9uZSBvZiB0aGUgb3RoZXIKPj4gUklTQy1WIHNvZnQgKEZQR0EpIGNvcmUgcGVv
cGxlIHN0ZXBwaW5nIHVwIHRvIHRyeSB0byBiZSBtb3JlIGFjdGl2ZSwKPj4gYnV0IHNvIGZhciB3
ZSd2ZSBqdXN0IGJlZW4gdmVyeSB3ZWxsIHNlcnZpY2VkIGJ5IHRoZSBjdXJyZW50IE5PTU1VCj4+
IExpbnV4IHNldHVwLgo+Cj4gSXQgY291bGQgcHJvYmFibHkgYmUgbmljZSB0byBoYXZlIHNvbWUg
ZmVlZGJhY2svVGVzdGVkLWJ5OiBmcm9tIE5PTU1VCj4gdXNlcnMgZm9yIG5ldyByZWxlYXNlcyB0
aGVuLgoKSGF2aW5nIG1vcmUgdXBzdHJlYW0gaW50ZXJhY3Rpb24gZnJvbSB1c2VycyBpcyBhbHdh
eXMgYXBwcmVjaWF0ZWQsIAp0aGF0J3MgdGhlIGJlc3Qgd2F5IHRvIHByb3ZlIHBlb3BsZSBhcmUg
dXNpbmcgdGhlIGNvZGUuICBJZiB5b3UgZ3V5cyAKaGF2ZSB0aGUgdGltZSBpdCdkIGJlIGdyZWF0
IHRvIGdldCB0aGlzIGludG8gc29tZSBzb3J0IG9mIENJLCBpZGVhbGx5IApydW5uaW5nIG9uIHNv
bWUgcmVhbCBwbGF0Zm9ybS4KCj4gVGhhbmtzLAo+Cj4gQ2zDqW1lbnQKPgo+Pgo+PiBDaGFybGVz
Cj4+Cj4+Cj4+IE9uIE1vbiwgRmViIDI2LCAyMDI0IGF0IDg6MDPigK9BTSBDb25vciBEb29sZXkg
PGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4KPj4+IE9uIE1vbiwgRmViIDI2LCAyMDI0IGF0
IDA0OjI1OjI0UE0gKzAxMDAsIENsw6ltZW50IEzDqWdlciB3cm90ZToKPj4+PiBJIGd1ZXNzIEkg
Y291bGQgYWxzbyBtYXJrIFhJUCBhcyBkZXByZWNhdGVkLgo+Pj4KPj4+IEknbSBub3Qgc28gc3Vy
ZSwgcGVvcGxlIHJlY2VudGx5IGFkZGVkIFhJUCBzdXBwb3J0IHRvIFFFTVUgKGFuZCBzZW50Cj4+
PiBrZXJuZWwgZml4ZXMgaW4gRGVjZW1iZXIpLiBYSVAgaXMgYWxzbyBub3QgbmVhcmx5IGFzIG11
Y2ggb2YgYSBwcm9ibGVtCj4+PiB0byBzdXBwb3J0LCB0aGVyZSdzIGZhciBsZXNzIHRoYXQgaXQg
ZG9lcyBkaWZmZXJlbnRseSwgdGhlIG1haW4gYmFycmllcgo+Pj4gd2FzIHRoZSBpbmFiaWxpdHkg
dG8gdGVzdCBpdCB3aGljaCBpcyBubyBsb25nZXIgdGhlIGNhc2UuCj4+PiBUaGF0IHNhaWQsIFhJ
UCBpcyBnb25uYSBraWxsIGl0c2VsZiBvZmYgSSBmZWVsIGFzIGl0IGRvZXMgbm90IHN1cHBvcnQK
Pj4+IHJ1bnRpbWUgcGF0Y2hpbmcgYW5kIHRoZXJlZm9yZSBpcyBleHRyZW1lbHkgbGltaXRlZCBv
biBleHRlbnNpb25zLCBnaXZlbgo+Pj4gd2UgdXNlIGFsdGVybmF0aXZlcyBmb3IgYWxsIG9mIHRo
YXQgKGFsdGhvdWdoIEkgc3VwcG9zZSBpZiBzb21lb25lIGhhcyBhCj4+PiB1c2VjYXNlIHRoZXkg
Y291bGQgbWFrZSBuYXN0eSBtYWNyb3Mgd29yc2UgYW5kIGltcGxlbWVudCBhIGNvbXBpbGV0aW1l
Cj4+PiBzd2l0Y2ggaW4gdGhlIGFsdGVybmF0aXZlcyB0b28pLgo+Pj4KPj4+IENoZWVycywKPj4+
IENvbm9yLgo+Pj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4+IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKPj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
