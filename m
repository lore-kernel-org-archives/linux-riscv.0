Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE06C48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 15:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6GvxzzAtBnxsPphRcZqHcyAFLE7PbaqK/l5PWlC/Lvc=; b=BJewjOZzJQKlEI
	dCAe7GcL9uCg49TUr4vf2waVlDIelMgF8g7ciZC9uvPKcdxKuRXJj0IWE378CplhSgwx4blkK0cFF
	Vq8+Z2yk8aAcDULnYp803xbvAPQIdvJb6A5RscsePXOyyJVzeti/Qu/6g2VRhMi+aLd/tl2z0cDSg
	vMcOAiXsgQvaeiuEwSZpBPSvfLJ41wuycsiNXNpo4c1rLTo3ib0bWCAOHa6J+uZtiVWFqlLmEpuwa
	5X4+j0CfQxWq/xUS8k2GZjFQnaICEsV8rhHSrQaSLZl3hNUdbTrbmgQI+KVO2ovfYcTOoThxaB5hg
	XRlQ6e7cyg2upqSgu6ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raHWm-0000000DO3c-1yxz;
	Wed, 14 Feb 2024 15:50:28 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raHWk-0000000DO2y-2n4q
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 15:50:27 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7c4359c5d33so224158039f.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 07:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1707925825; x=1708530625; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSlVGbEelZs1+mCJGuJE5TbiYr0MAiLjyMJwC22PtNU=;
        b=NTTWZTYt3imIkHohQw6biwnBW3ouQTNZ88ckZhHoLaN0mWSfGMFfbLcPCBIhJJSMbd
         8f9HLy+mQcG41JePsxmJjJALcfx8Gp3aFOEtCWuXIPE4k6tXKcsMDVTZwdIEbScF50v9
         cF8FD7aaCSLmfyotk0p7cdYfaS1eYCLcKjnmwNVhxJU9F66R2PBI6aHGXwrlpmM/mGzo
         wTNRm2YwoLSqsXTJ6x4MKish87W6Jla3Kh8K8EwcOGe67JA5JOQIGavbCUh5ht92IqtL
         YP0AcaHxnaawm+ZB9Ta4mMsRvsfc9TGiT8oeeUeMTQqJ/fShA6tKuRL+up6luCb5QBf1
         pi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707925825; x=1708530625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSlVGbEelZs1+mCJGuJE5TbiYr0MAiLjyMJwC22PtNU=;
        b=CAITFqRdQk10LMDyo05mCYWtq3mE32Yn3XFTjAzPdTLBSuxZDBBQgW0b/eMbHbjr9i
         dvVdeViEt8tARyRLT1zrC+KjI7l8AjMzcbdkB/O9iMfy5QboRJi20NrUiE6GcOQtvMo7
         JpnSUuOG6YILo3r26TKUu9LR/cumjOqZuLCMVPYDn4Y+kuSFbTEN70K9I/2kDGh9zpgz
         pH4p5UDiaIMNMCRBMHFEyPMktCfptZnMPzVVGFcKYmuAPduRAWjw6azg1/1cxgTb/wKa
         hqCJ+fqjOP7A49MsobqtdKkLdM+i2vXNwtkREUNQoxtUtAyasEEiVjs3diHagcX2oKtJ
         +JNg==
X-Gm-Message-State: AOJu0YwOmXfSVNHPEMxOD7B34AQVT6HHCevjdc3X5RrjZXtJgkyCyGS1
	F7/VRGs69xmt/VFr1weMCKVvitaSLpnHYzCTqNEMMJSf+5m1LGGSkU4h9l5r7f8r6nDxGraoRQC
	njCi053D+iysG7VHybJLWRTCbQ2eybwaOlVyiKQ==
X-Google-Smtp-Source: AGHT+IEg1mjBag5fQq6IiYnFAmtRUKSsf1C8M5YPUMlpqUwiUYtvbiinLPu7A8tR+cYW+rVJo79k/QL1npQnEykKim4=
X-Received: by 2002:a92:ca89:0:b0:363:d9eb:dae2 with SMTP id
 t9-20020a92ca89000000b00363d9ebdae2mr2993529ilo.13.1707925825474; Wed, 14 Feb
 2024 07:50:25 -0800 (PST)
MIME-Version: 1.0
References: <20240214153429.16484-2-palmer@rivosinc.com>
In-Reply-To: <20240214153429.16484-2-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 14 Feb 2024 21:20:13 +0530
Message-ID: <CAAhSdy3Tf=9jD1Cd11RjwKyDFPA_gHTqxMXSJ3HwANFFnR-8dA@mail.gmail.com>
Subject: Re: [PATCH] tty: hvc: Don't enable the RISC-V SBI console by default
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Greg KH <gregkh@linuxfoundation.org>, 
	jirislaby@kernel.org, Atish Patra <atishp@rivosinc.com>, ajones@ventanamicro.com, 
	apatel@ventanamicro.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_075026_874346_43B4662F 
X-CRM114-Status: GOOD (  19.60  )
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

T24gV2VkLCBGZWIgMTQsIDIwMjQgYXQgOTowNuKAr1BNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
cml2b3NpbmMuY29tPiB3cm90ZToKPgo+IEZyb206IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2
b3NpbmMuY29tPgo+Cj4gVGhlIG5ldyBTQkkgY29uc29sZSBoYXMgdGhlIHNhbWUgcHJvYmxlbSBh
cyB0aGUgb2xkIG9uZTogdGhlcmUncyBvbmx5Cj4gb25lIHNoYXJlZCBiYWNraW5nIGhhcmR3YXJl
IGFuZCBubyBzeW5jaHJvbml6YXRpb24sIHNvIHRoZSB0d28gZHJpdmVycwo+IGVuZCB1cCBzdGVw
cGluZyBvbiBlYWNoIG90aGVyLiAgVGhpcyB3YXMgdGhlIHNhbWUgaXNzdWUgdGhlIG9sZCBTQkkt
MC4xCj4gY29uc29sZSBkcml2ZXJzIGhhZCwgYnV0IHRoYXQgd2FzIGRpc2FibGVkIGJ5IGRlZmF1
bHQgd2hlbiBTQkktMC4xIHdhcy4KPgo+IFNvIGp1c3QgbWFyayB0aGUgbmV3IGRyaXZlciBhcyBu
b25wb3J0YWJsZS4KPgo+IFJlcG9ydGVkLWJ5OiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8a2VybmVs
QGVzbWlsLmRrPgo+IEZpeGVzOiA4OGVhZDY4ZTc2NGMgKCJ0dHk6IEFkZCBTQkkgZGVidWcgY29u
c29sZSBzdXBwb3J0IHRvIEhWQyBTQkkgZHJpdmVyIikKPiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIg
RGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KCkxUR00uCgpSZXZpZXdlZC1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGRyaXZl
cnMvdHR5L2h2Yy9LY29uZmlnIHwgOCArKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L2h2
Yy9LY29uZmlnIGIvZHJpdmVycy90dHkvaHZjL0tjb25maWcKPiBpbmRleCA2ZTA1YzVjN2JjYTEu
LmMyYTRlODhiMzI4ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3R0eS9odmMvS2NvbmZpZwo+ICsr
KyBiL2RyaXZlcnMvdHR5L2h2Yy9LY29uZmlnCj4gQEAgLTEwOCwxMyArMTA4LDE1IEBAIGNvbmZp
ZyBIVkNfRENDX1NFUklBTElaRV9TTVAKPgo+ICBjb25maWcgSFZDX1JJU0NWX1NCSQo+ICAgICAg
ICAgYm9vbCAiUklTQy1WIFNCSSBjb25zb2xlIHN1cHBvcnQiCj4gLSAgICAgICBkZXBlbmRzIG9u
IFJJU0NWX1NCSQo+ICsgICAgICAgZGVwZW5kcyBvbiBSSVNDVl9TQkkgJiYgTk9OUE9SVEFCTEUK
PiAgICAgICAgIHNlbGVjdCBIVkNfRFJJVkVSCj4gICAgICAgICBoZWxwCj4gICAgICAgICAgIFRo
aXMgZW5hYmxlcyBzdXBwb3J0IGZvciBjb25zb2xlIG91dHB1dCB2aWEgUklTQy1WIFNCSSBjYWxs
cywgd2hpY2gKPiAtICAgICAgICAgaXMgbm9ybWFsbHkgdXNlZCBvbmx5IGR1cmluZyBib290IHRv
IG91dHB1dCBwcmludGsuCj4gKyAgICAgICAgIGlzIG5vcm1hbGx5IHVzZWQgb25seSBkdXJpbmcg
Ym9vdCB0byBvdXRwdXQgcHJpbnRrLiAgVGhpcyBkcml2ZXIKPiArICAgICAgICAgY29uZmxpY3Rz
IHdpdGggcmVhbCBjb25zb2xlIGRyaXZlcnMgYW5kIHNob3VsZCBub3QgYmUgZW5hYmxlZCBvbgo+
ICsgICAgICAgICBzeXN0ZW1zIHRoYXQgZGlyZWN0bHkgYWNjZXNzIHRoZSBjb25zb2xlLgo+Cj4g
LSAgICAgICAgIElmIHlvdSBkb24ndCBrbm93IHdoYXQgZG8gdG8gaGVyZSwgc2F5IFkuCj4gKyAg
ICAgICAgIElmIHlvdSBkb24ndCBrbm93IHdoYXQgZG8gdG8gaGVyZSwgc2F5IE4uCj4KPiAgY29u
ZmlnIEhWQ1MKPiAgICAgICAgIHRyaXN0YXRlICJJQk0gSHlwZXJ2aXNvciBWaXJ0dWFsIENvbnNv
bGUgU2VydmVyIHN1cHBvcnQiCj4gLS0KPiAyLjQzLjAKPgo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
