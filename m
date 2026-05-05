Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7E4FF8855
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 16:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hvLK6pSvD8uR6qcle+pCsGbGkgAMnRCOscfHX9FffLc=; b=u8E6tAjBkxVPWe
	Urb6BXEzs04MUctdcMZ+iBknYWhbaQF1fEAb/En7Zh50h1usUfTnioeNlX4yB17E9m69NnaMoudVX
	WYt4+aCJyaDTTGC9Hlnb9W1ZFw48I8vh6VAkhvbMsprkX9hMqSmt67kSrv4Qq+DPLEL6CUhgoTtdY
	R0X6fMaQeu+SNyQmCpUNcRVozKXbfvB9fZ71tjcx4vptdM9Sdyj4I7iLsmrRI3+0MEqUROyVYsL1G
	vkDfpUcsRTDfAeoB0CAOVSCxR+TgTorfI93Qvbr7o70Bq3e8KSFTdggnTNHEQEFTdpNDloxH9dr2e
	lUaBvNz6sJxIoELQO10g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIgu-0000000GtZL-0Z8g;
	Tue, 05 May 2026 16:32:12 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIgr-0000000GtXy-00is
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 16:32:10 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-66ee7b9af94so2275819eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 May 2026 09:32:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777998727; cv=none;
        d=google.com; s=arc-20240605;
        b=IYnsBFKv/yUfckweTRa+YjUEJugIYd1nBYFuCSLBAdUSpoIEsxtVje5QXTDRBxA8Yk
         kKo/c+gfZq1VtPAAiuvhGU1632Gfq0u1lcIVGnTC8jBbWpt6pYZtK6tJB+TF3+VhL1Ro
         PN8hlSb7U2Vp/WmzNJDGENXZTvOp3iEsLBz7UrDkT1acc70jUtPxG6riumGSQ/9x7J2x
         Rm3JrM0fdPVeAVgWoWA4pESj3IMACSylnBE4rE7AAP9vSqkGApv5S7oaPyK6y+1s5Tsh
         F8b9zXn3OGolEnUUrT53fI2ls8GDR8fakgf4sR2VdynB/zeIkuoYVMYpg+ncefz8TYGO
         Tmjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7eXEy6+DCrmMWFnLDZ4Fw27+W46tPenXbPYSAHMIGQY=;
        fh=f3NfX2njPEQeuqseyWPJTegd6SiDuexMZSEe7GJ0k+E=;
        b=J4DNMxViLLGDslNKZkKt/ibDJPtTbiYD7r6LvWxBFjWj8Nk8aRey+G2QR7SXzE4syL
         +23lqEMbT00JpAJtcRJ/Bn/S3g9fMWLUw6bNRDG/+HM8/rG5BhmZ+V6NVUDdiVXzWph/
         KRmfi0At/w3rZXaN3znXLcGgn9IAGXyXizI29vOxA9W1OSvYidtQn8TI3IuJ3hRQwPl5
         bPGGqx56qzCWlmElyjNuIEebqSUDQ7kzhrxDb0Z0IUbCn6e7FKSfF7ER6U7RdjqHNd/M
         bEpkSTodeipBimRPoFEZqtEfdrFLe6gUptT46TKP0DOV7D+On09iPw4pnqv47oCZx/iS
         U7kA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1777998727; x=1778603527; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eXEy6+DCrmMWFnLDZ4Fw27+W46tPenXbPYSAHMIGQY=;
        b=dLzMu5E0llh2p42pSymn4/v7/Zgj7HfJExQ5aEYmVS55ixN/AelQdg2zReOLX7hrpk
         16MWENJbW6wp5VtJftJKAO2rLV9sqGGOC5iwhyz/gUu6WSiZCmIWL2YNwLpvf2v4FQgb
         tRRRPP+uH5v9Y2T74pxdeT/4tbOQr8IhdmplbPtOSNE1mwqWCo29108FUD1FqZ8BOqfU
         V++2yAYra081ypXaQTP2Egu4R8VnXiQg3auoJLBfAq7doTzkKNxLG/OIOJrh5hG6gKoT
         F8uQ9kqJGPouM+1rNpOvL4SNK5/A8K+PJYa1fddE6aVM091l3BX+OrGtUNyNb20c8Bt1
         BkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777998727; x=1778603527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7eXEy6+DCrmMWFnLDZ4Fw27+W46tPenXbPYSAHMIGQY=;
        b=lEqtz7W4EaO+9wfm35CwgLPx5D51PEIWkIUl9qT1XuqW51kCMj7PjRoTOV0pa0W1Mk
         /4HxaRQwAimXyAU+gqvjgiFAVZbrio4p2JXmJGET6EGQklLIR7exsJJIc490+oQLAvgM
         nK6+bci7cDlcwIYH6K3RJ04Rpcx4aytLKqJ+Ndfo7A0K8d07SfA8ayg8XFDRNYnXvjoa
         TXBtCn96TunlXVVqxTr8YSw2wWpDGpKBSrhIWBU710xpqADNOVocXbshBIo48xay5koc
         2jkmSMFd/y6FeXi7fahkIJhnSeb+9to4lZGrkfHRCtt4n6Y2E/FbuYIVB3nD0C5614VQ
         c2/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8EsETzveg9+scurQI2MOd9Cc52mS0AqI9Xzamz8roEY9e69OcNjv5xDayIiT1zj3ddMXsMDU6KoNM5OQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzANG410jI4YcuMn1Y29REEMJxiXckN/MhWbxfJDTjkoHOGvB+A
	/aUqbeYOftS3O40S/9WWT/UaR5gxnetQgT7ZfSNJ6qVct3k6QIn5jOwVBellQBf8b45SSSm62Uc
	4ZQTq9DEy1Vi6E5IeOOzhsZWk1vAlpbNZRXWAEiR4og==
X-Gm-Gg: AeBDiesvoyZXuTE63eJKWluAX0VJxmq5+ubAL0r0+34LWJ6latlLtJ2f6haye+TQd6f
	7wvnMpi4qowBzDvxgwmOG0KAnfTYZxqJeHuYLBs7Jpgfkz9QjvfMqKNuJvMpA+Y7mNEO5bLe5SO
	spXZ9u2eagECOw35tgPTnF2iN8vCP2mVyHnnHIPmJixYhz4ZrV+jueCU4F+OsWbbituTA2klNlM
	voONYcv3rkTCSggxKrVKPnvbZWyQX7bp/HO0A3jcM5VelDaa85+AhtNfh8HwLkDmqcMIE5a2YFI
	WRRq9daeuBY8i1+H2jQ04CyKtbD1
X-Received: by 2002:a05:6808:2518:b0:479:ffcf:52dc with SMTP id
 5614622812f47-47c8930caadmr7143176b6e.44.1777998727293; Tue, 05 May 2026
 09:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <0-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com>
In-Reply-To: <0-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Tue, 5 May 2026 09:31:55 -0700
X-Gm-Features: AVHnY4KXzwjaC_Gb5GnddRMzX9LqC580rYOWyeA1_Y7wcl4kfXs2AQTViUP1SDo
Message-ID: <CAH2o1u699nbGABw1mcZR=BrZcyy7s_WNz-szpe8bn8bPhuv-yQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] Support non-leaf and range invalidation features in RISC-V
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Will Deacon <will@kernel.org>, Fangyu Yu <fangyu.yu@linux.alibaba.com>, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_093209_148602_D5B7BED6 
X-CRM114-Status: GOOD (  20.95  )
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

VGhhbmtzIEphc29uIGZvciB0aGlzIHNlcmllcy4KSSd2ZSB2ZXJpZmllZCBnaXRodWIvaW9tbXVf
cHRfYXJtNjQgb24gUklTQy1WLCBsb29rcyBnb29kLgoKLSBUb21hc3oKCk9uIEZyaSwgQXByIDEw
LCAyMDI2IGF0IDg6NTfigK9BTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0BudmlkaWEuY29tPiB3cm90
ZToKPgo+IFRoaXMgaXMgcGFydCBvZiB0aGUgcGF0Y2ggcGlsZSB0byBnZXQgU01NVXYzIG1vdmVk
IHRvIGlvbW11cHQuIEZyb20KPiB0aGF0IHBlcnNwZWN0aXZlIGl0IGludHJvZHVjZXMgdGhlIFBU
X0ZFQVRfREVUQUlMRURfR0FUSEVSIHdoaWNoIHdpbGwKPiBiZSB1c2VkIGJ5IGJvdGggUklTQy1W
IGFuZCBTTU1VdjMgdG8gZ2VuZXJhdGUgb3B0aW1pemVkIGludmFsaWRhdGlvbgo+IGNvbW1hbmRz
Lgo+Cj4gSSBkb24ndCBoYXZlIGFueSBSSVNDLVYgYW55dGhpbmcgc28gdGhpcyBuZWVkcyB0byBi
ZSB0ZXN0ZWQgYnkgc29tZW9uZSB3aG8KPiBkb2VzLgo+Cj4gSW1wcm92ZSB0aGUgaW52YWxpZGF0
aW9uIGZsb3cgaW4gUklTQy1WOgo+ICAtIEZvciBzaW5nbGUgYWRkcmVzcyBpbnZhbGlkYXRpb24s
IGNvbXB1dGUgYSBzdHJpZGUgYmFzZWQgb24gd2hhdAo+ICAgIElPUFRFcyB3ZXJlIGNoYW5nZWQg
YnkgaGF2aW5nIHRoZSBnYXRoZXIgdHJhY2sgbGV2ZWwgY2hhbmdlcyBpbgo+ICAgIGJpdG1hcHMu
IFRoaXMgYWxsb3dzIHRoaW5ncyBsaWtlIHVubWFwcGluZyBodWdldGxiLWJhY2tlZCBtYXBwaW5n
cwo+ICAgIHRvIGF2b2lkIGp1bXBpbmcgdG8gZ2xvYmFsIGludmFsaWRhdGlvbi4KPgo+ICAtIFN1
cHBvcnQgdGhlIE5MIGJpdCB0byBhdm9pZCBnbG9iYWwgaW52YWxpZGF0aW9uIHdoZW4gdGFibGUK
PiAgICBzdHJ1Y3R1cmUgaXMgY2hhbmdlZAo+Cj4gIC0gU3VwcG9ydCB0aGUgUyByYW5nZSBpbnZh
bGlkYXRpb24gZmVhdHVyZSB0byBjb252ZXJ0IGFueSBnYXRoZXIKPiAgICBpbnRvIGEgc2luZ2xl
IGludmFsaWRhdGlvbiBjb21tYW5kIHVzaW5nIGFuIGFsaWduZWQgcG93ZXItb2YtMgo+ICAgIHNp
emUgbGlrZSBBTUQgYW5kIFZULWQuCj4KPiBUaGlzIGlzIGFsc28gYSByZXF1aXJlbWVudCBmb3Ig
dGhlIGt1bml0IGlvdGxiIHNlcmllcywgd2hpY2ggd2FzIHVzZWQKPiB0byB0ZXN0IHRoZSBtYXRo
IHVzZWQgdG8gZ2VuZXJhdGUgdGhlIGludmFsaWRhdGlvbiBjb21tYW5kcyBmcm9tIHRoZQo+IGdh
dGhlciBpbiB0aGlzIHNlcmllcy4KPgo+IEl0IHJlcGxhY2VzIGEgc2ltaWxhciBzZXJpZXMgRmFu
Z3l1IHNlbnQgcHJpb3IgdG8gdGhlIGlvbW11cHQKPiBjb252ZXJzaW9uOgo+Cj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtaW9tbXUvMjAyNjAyMDgxNDQyMTMuOTQ4NTYtMS1mYW5neXUu
eXVAbGludXguYWxpYmFiYS5jb20vCj4KPiBUaGUgZnVsbCBwYXRjaCBwaWxlIGlzIGhlcmU6Cj4K
PiBodHRwczovL2dpdGh1Yi5jb20vamd1bnRob3JwZS9saW51eC9jb21taXRzL2lvbW11X3B0X2Fy
bTY0Lwo+Cj4gSmFzb24gR3VudGhvcnBlICg3KToKPiAgIGlvbW11OiBTcGxpdCB0aGUga2RvYyBj
b21tZW50IGZvciBzdHJ1Y3QgaW9tbXVfaW90bGJfZ2F0aGVyCj4gICBpb21tdXB0OiBBZGQgc3Ry
dWN0IGlvbW11cHRfcGVuZGluZ19nYXRoZXIKPiAgIGlvbW11cHQ6IEFkZCBQVF9GRUFUX0RFVEFJ
TEVEX0dBVEhFUgo+ICAgaW9tbXUvcmlzY3Y6IEVuYWJsZSBQVF9GRUFUX0RFVEFJTEVEX0dBVEhF
UiBhbmQgcGFzcyBnYXRoZXIgdG8KPiAgICAgaW90bGJfaW52YWwKPiAgIGlvbW11L3Jpc2N2OiBD
b21wdXRlIGJlc3Qgc3RyaWRlIGZvciBzaW5nbGUgaW52YWxpZGF0aW9uCj4gICBpb21tdS9yaXNj
djogQWRkIFJJU0NWX0lPTU1VX0NBUEFCSUxJVElFU19OTAo+ICAgaW9tbXUvcmlzY3Y6IEFkZCBO
QVBPVCByYW5nZSBpbnZhbGlkYXRpb24gc3VwcG9ydAo+Cj4gIGRyaXZlcnMvaW9tbXUvZ2VuZXJp
Y19wdC9mbXQvaW9tbXVfcmlzY3Y2NC5jIHwgICA0ICstCj4gIGRyaXZlcnMvaW9tbXUvZ2VuZXJp
Y19wdC9pb21tdV9wdC5oICAgICAgICAgIHwgIDk4ICsrKysrKysrLS0tLQo+ICBkcml2ZXJzL2lv
bW11L3Jpc2N2L2lvbW11LWJpdHMuaCAgICAgICAgICAgICB8ICAyNCArKysKPiAgZHJpdmVycy9p
b21tdS9yaXNjdi9pb21tdS5jICAgICAgICAgICAgICAgICAgfCAxNjAgKysrKysrKysrKysrKyst
LS0tLQo+ICBpbmNsdWRlL2xpbnV4L2dlbmVyaWNfcHQvY29tbW9uLmggICAgICAgICAgICB8ICAg
NSArCj4gIGluY2x1ZGUvbGludXgvaW9tbXUuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQy
ICsrKystCj4gIDYgZmlsZXMgY2hhbmdlZCwgMjU5IGluc2VydGlvbnMoKyksIDc0IGRlbGV0aW9u
cygtKQo+Cj4KPiBiYXNlLWNvbW1pdDogYWM4MWMwZjJlNmE3NzllNDQ0YzViNmZkNDM3NTZlZjgx
MTY1NjA5OAo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
