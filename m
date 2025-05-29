Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FA6C5AD49
	for <linux-riscv@archiver.kernel.org>; Thu, 29 May 2025 10:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pyu9eLX+uVONEIpdJDkReD92/kPbS3DTeiLBEC+ynT8=; b=fwlXrJMcLPCTeg
	15cy12F4RoFZtB9R3zXKhRnBkfsVIJfAxNbBQ+zfpfiQM9S29zu0EGon6icI403O+endLsO3yyLQT
	4pypQKYvK6G2yMaJ57O5Zb5IIrXY3n/VRKn7EyWanGwj/DE2ATZdJJzN+ewpI8TQ7sBChU9rN0tuc
	81c5F1Y3/KrOliG3F2w9KrEEmGyrQ4GEdRBjdMWedV2oxwGaiL+3miTy7kOlAPukQU/hFnwBL8wr9
	XF5/V/KWJToSsJfH+DDTSuw+1CK7xE/Em8wQ2SUqofVIAbJNxvJRDJ/+iJZxnCISRKx96y0afv6S/
	KeKiqiVA5h9V6UyxR/GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKaRa-0000000FV2c-31jb;
	Thu, 29 May 2025 10:25:02 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKaRY-0000000FV12-2uFm
	for linux-riscv@lists.infradead.org;
	Thu, 29 May 2025 10:25:01 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a4e575db1aso128501f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 May 2025 03:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748514298; x=1749119098; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkPmfDr8qV4AFwb/7zNDmYiDn/SPJXtSs6w3iYw5HaE=;
        b=dHFxwxv0LIcsBi26VOHrlt0YgXYJlTGbSgAPdGpQjPlRIgNHh/dStaFSWbErtyWBFP
         i+qrKDE8LwfEANrS/BVqB3blZeCYXvRk+SzLBTTAewrs0OhfHA+yMzB51kzFLAnIN5/l
         0SMtivcpGtCWEgn40imKhhvu+KXAQpIYOA3AAMrCYukV/dfIxpSo2OutLUzuwKDFq78W
         XNtxgvGti6qqZ86zHw0ECdNmci4QZFQjAaWgpKVlYBfmxWvqlaRe/SAL5NG5p6zlYGdX
         T5Wz6ZRCeVSvEfSwkOGsiKUd/mLXhGRhFlJ/NZT+HpO0njVEIw7XdWIBfs+TopfhEvJ9
         ByFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748514298; x=1749119098;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bkPmfDr8qV4AFwb/7zNDmYiDn/SPJXtSs6w3iYw5HaE=;
        b=NsnwAt5ez3wfriJPdXu7vMonzY+19/u2AQbDIHjTi5DXPh4cQoXw/OSaIC6KW+Q4ff
         U3WKYCeZncpjVGDRUXiaacRs53qlEsk75qWNrtzcJ+r3vVI/YgeKk6VGp50EubKwSX7M
         n1+lbeHCPKvW9fxh7VXZsaEF6B9GCP2lZDwAkCfH22GijnNCFkX8GIzzs6Tr1Gk13j61
         6uuc+r6kbfHkwoDQIu0pllY02Cde202tkOrZmbAkCO3ItI0wLMMp7LQFocCScStWBPqq
         jFty5HQxzuLoQa4jRkOlomOjrbWSKuM4TfgzrDhYKwHu7oPwvjq/5ndn2vI4PxPYdn21
         shNw==
X-Forwarded-Encrypted: i=1; AJvYcCVhFkBG9lO8hVA65EXkLKTADivq3qDqIRxCbinENO8Gk+mpY6OhKtdP4Cniy7nUq5xwFj1ZoM9pVgsMjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBMJ2gdwvkCZCN0w93Nk7kSqPx3XMYqJiaRpyc/2T6IrGo379J
	EsXttVfGGzEgewjyvWqWubF9RK/LEEujUQ8FDeNHas2vx0bdEYn84nb6GMzlK6L+oIM=
X-Gm-Gg: ASbGncvn7NKLN1dea1R31R/CYZ0aAJX+XjZA1EFrloPecUoy709Al8W3ECsPNMDQOK9
	eXdtvy4zlEzLhmzQ+cmhXyFYLHe9yr06P09eBRzfVRMd8IfFaR3C2WWSdkON8Gxp8t+jzlQYZ0m
	kA2SS2ogzf6wZueKAt/krKx/D9LL/5Z/xlbxp+DrEKUWsmgAK9tZmc8VqdyyxL/HLW+HMmYOKDy
	RIkhJhZ4lCxegQsGp65+cR3RWiv9GHX7B/p7f0lhijJkFX/M2QM0bLy2ROwh3Kn8Pe7ihQnpHMf
	sfyImy2kKVP/P4OsxvK8X1aLwRo599Ztcbi17XnM9dmKWw8PlizcPVf2a04=
X-Google-Smtp-Source: AGHT+IHTjhkw8mY9U5Lw6amMsITMkGfFMYsq7IkB3jEfobdCq2XVznCgFv/wQTr+NkDTK2KFhJhB5w==
X-Received: by 2002:a05:6000:1885:b0:3a4:e672:df0c with SMTP id ffacd0b85a97d-3a4e672e083mr2365564f8f.13.1748514298394;
        Thu, 29 May 2025 03:24:58 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:f5e7:eb4d:155d:d79e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73fbcsm1558329f8f.48.2025.05.29.03.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:24:57 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 29 May 2025 12:24:57 +0200
Message-Id: <DA8KL716NTCA.2QJX4EW2OI6AL@ventanamicro.com>
Cc: "Anup Patel" <anup@brainfault.org>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Mayuresh Chitale" <mchitale@ventanamicro.com>,
 <linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atish.patra@linux.dev>, "Andrew Jones"
 <ajones@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version
 to 3.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
 <20250526-224478e15ee50987124a47ac@orel>
 <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
 <20250528-ff9f6120de39c3e4eefc5365@orel>
 <1169138f-8445-4522-94dd-ad008524c600@linux.dev>
In-Reply-To: <1169138f-8445-4522-94dd-ad008524c600@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_032500_738389_3BBC8F42 
X-CRM114-Status: GOOD (  36.18  )
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

SSBvcmlnaW5hbGx5IGdhdmUgdXAgb24gdGhlIGlkZWEsIGJ1dCBJIGZlZWwga2luZGEgYmFkIGZv
ciBEcmV3IG5vdywgc28KdHJ5aW5nIGFnYWluOgoKMjAyNS0wNS0yOFQxMjoyMTo1OS0wNzowMCwg
QXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4LmRldj46Cj4gT24gNS8yOC8yNSA4OjA5IEFN
LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+IE9uIFdlZCwgTWF5IDI4LCAyMDI1IGF0IDA3OjE2OjEx
QU0gLTA3MDAsIEF0aXNoIFBhdHJhIHdyb3RlOgo+Pj4gT24gNS8yNi8yNSA0OjEzIEFNLCBBbmRy
ZXcgSm9uZXMgd3JvdGU6Cj4+Pj4gT24gTW9uLCBNYXkgMjYsIDIwMjUgYXQgMTE6MDA6MzBBTSAr
MDIwMCwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+Pj4+PiAyMDI1LTA1LTIzVDEwOjE2OjExLTA3
OjAwLCBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAbGludXguZGV2PjoKPj4+Pj4+IE9uIDUvMjMv
MjUgNjozMSBBTSwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+Pj4+Pj4+IDIwMjUtMDUtMjJUMTI6
MDM6NDMtMDc6MDAsIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPjoKPj4+Pj4+Pj4g
VXBncmFkZSB0aGUgU0JJIHZlcnNpb24gdG8gdjMuMCBzbyB0aGF0IGNvcnJlc3BvbmRpbmcgZmVh
dHVyZXMKPj4+Pj4+Pj4gY2FuIGJlIGVuYWJsZWQgaW4gdGhlIGd1ZXN0Lgo+Pj4+Pj4+Pgo+Pj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPj4+
Pj4+Pj4gLS0tCj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2
bV92Y3B1X3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+Pj4+
Pj4+PiAtI2RlZmluZSBLVk1fU0JJX1ZFUlNJT05fTUFKT1IgMgo+Pj4+Pj4+PiArI2RlZmluZSBL
Vk1fU0JJX1ZFUlNJT05fTUFKT1IgMwo+Pj4+Pj4+IEkgdGhpbmsgaXQncyB0aW1lIHRvIGFkZCB2
ZXJzaW9uaW5nIHRvIEtWTSBTQkkgaW1wbGVtZW50YXRpb24uCj4+Pj4+Pj4gVXNlcnNwYWNlIHNo
b3VsZCBiZSBhYmxlIHRvIHNlbGVjdCB0aGUgZGVzaXJlZCBTQkkgdmVyc2lvbiBhbmQgS1ZNIHdv
dWxkCj4+Pj4+Pj4gdGVsbCB0aGUgZ3Vlc3QgdGhhdCBuZXdlciBmZWF0dXJlcyBhcmUgbm90IHN1
cHBvcnRlZC4KPj4+PiBXZSBuZWVkIG5ldyBjb2RlIGZvciB0aGlzLCBidXQgaXQncyBhIGdvb2Qg
aWRlYS4KPj4+Pgo+Pj4+Pj4gV2UgY2FuIGFjaGlldmUgdGhhdCB0aHJvdWdoIG9uZXJlZyBpbnRl
cmZhY2UgYnkgZGlzYWJsaW5nIGluZGl2aWR1YWwgU0JJCj4+Pj4+PiBleHRlbnNpb25zLgo+Pj4+
Pj4gV2UgY2FuIGV4dGVuZCB0aGUgZXhpc3Rpbmcgb25lcmVnIGludGVyZmFjZSB0byBkaXNhYmxl
IGEgc3BlY2lmaWMgU0JJCj4+Pj4+PiB2ZXJzaW9uIGRpcmVjdGx5Cj4+Pj4+PiBpbnN0ZWFkIG9m
IGluZGl2aWR1YWwgb25lcyB0byBzYXZlIHRob3NlIElPQ1RMIGFzIHdlbGwuCj4+Pj4+IFllcywg
SSBhbSBhbGwgaW4gZmF2b3Igb2YgbGV0dGluZyB1c2Vyc3BhY2UgcHJvdmlkZSBhbGwgdmFsdWVz
IGluIHRoZQo+Pj4+PiBCQVNFIGV4dGVuc2lvbi4KPj4+IFdlIGFscmVhZHkgc3VwcG9ydCB2ZW5k
b3JpZC9hcmNoaWQvaW1waWQgdGhyb3VnaCBvbmUgcmVnLiBJIHRoaW5rIHdlIGp1c3QKPj4+IG5l
ZWQgdG8gYWRkIHRoZSBTQkkgdmVyc2lvbiBzdXBwb3J0IHRvIHRoYXQgc28gdGhhdCB1c2VyIHNw
YWNlIGNhbiBzZXQgaXQuCj4+Pgo+Pj4+IFRoaXMgaXMgY292ZXJlZCBieSB5b3VyIHJlY2VudCBw
YXRjaCB0aGF0IHByb3ZpZGVzIHVzZXJzcGFjZV9zYmkuCj4+PiBXaHkgZG8gd2UgbmVlZCB0byBp
bnZlbnQgbmV3IElPQ1RMIGZvciB0aGlzID8gT25jZSB0aGUgdXNlciBzcGFjZSBzZXRzIHRoZQo+
Pj4gU0JJIHZlcnNpb24sIEtWTSBjYW4gZW5mb3JjZSBpdC4KPj4gSWYgYW4gU0JJIHNwZWMgdmVy
c2lvbiBwcm92aWRlcyBhbiBleHRlbnNpb24gdGhhdCBjYW4gYmUgZW11bGF0ZWQgYnkKPj4gdXNl
cnNwYWNlLCB0aGVuIHVzZXJzcGFjZSBjb3VsZCBjaG9vc2UgdG8gYWR2ZXJ0aXNlIHRoYXQgc3Bl
YyB2ZXJzaW9uLAo+PiBpbXBsZW1lbnQgYSBCQVNFIHByb2JlIGZ1bmN0aW9uIHRoYXQgYWR2ZXJ0
aXNlcyB0aGUgZXh0ZW5zaW9uLCBhbmQKPj4gaW1wbGVtZW50IHRoZSBleHRlbnNpb24sIGV2ZW4g
aWYgdGhlIEtWTSB2ZXJzaW9uIHJ1bm5pbmcgaXMgb2xkZXIKPj4gYW5kIHVuYXdhcmUgb2YgaXQu
IEJ1dCwgaW4gb3JkZXIgdG8gZG8gdGhhdCwgd2UgbmVlZCBLVk0gdG8gZXhpdCB0bwo+PiB1c2Vy
c3BhY2UgZm9yIGFsbCB1bmtub3duIFNCSSBjYWxscyBhbmQgdG8gYWxsb3cgQkFTRSB0byBiZSBv
dmVycmlkZGVuCj4gWW91IG1lYW4gb25seSB0aGUgdmVyc2lvbiBmaWVsZCBpbiBCQVNFIC0gQ29y
cmVjdCA/CgpObywgIkJBU0UgcHJvYmUgZnVuY3Rpb24iIGlzIHRoZSBzYmlfcHJvYmVfZXh0ZW5z
aW9uKCkgZWNhbGwuCgo+PiBieSB1c2Vyc3BhY2UuIFRoZSBuZXcgS1ZNIENBUCBpb2N0bCBhbGxv
d3Mgb3B0aW5nIGludG8gdGhhdCBuZXcgYmVoYXZpb3IuCj4KPiBCdXQgd2h5IHdlIG5lZWQgYSBu
ZXcgSU9DVEwgZm9yIHRoYXQgPyBXZSBjYW4gYWNoaWV2ZSB0aGF0IHdpdGggZXhpc3RpbmcKPiBv
bmUgcmVnIGludGVyZmFjZSB3aXRoIGltcHJvdmVtZW50cy4KCkl0J3MgYW4gZXhpc3RpbmcgSU9D
VEwgd2l0aCBhIG5ldyBkYXRhIHBheWxvYWQsIGJ1dCBJIGNhbiBlYXNpbHkgdXNlCk9ORV9SRUcg
aWYgeW91IHdhbnQgdG8gZG8gZXZlcnl0aGluZyB0aHJvdWdoIHRoYXQuCgpLVk0gZG9lc24ndCBy
ZWFsbHkgbmVlZCBhbnkgb3RoZXIgSU9DVEwgdGhhbiBPTkVfUkVHcywgaXQncyBqdXN0CnNvbWV0
aW1lcyBtb3JlIHJlYXNvbmFibGUgdG8gdXNlIGEgZGlmZmVyZW50IElPQ1RMLCBsaWtlIEVOQUJM
RV9DQVAuCgo+PiBUaGUgb2xkIEtWTSB3aXRoIG5ldyBWTU0gY29uZmlndXJhdGlvbiBpc24ndCB0
b3RhbGx5IGZhci1mZXRjaGVkLiBXaGlsZQo+PiBob3N0IGtlcm5lbHMgdGVuZCB0byBnZXQgdXBk
YXRlZCByZWd1bGFybHkgdG8gaW5jbHVkZSBzZWN1cml0eSBmaXhlcywKPj4gZW50ZXJwcmlzZSBr
ZXJuZWxzIHRlbmQgdG8gc3RvcCBhZGRpbmcgZmVhdHVyZXMgYXQgc29tZSBwb2ludCBpbiBvcmRl
cgo+PiB0byBtYXhpbWl6ZSBzdGFiaWxpdHkuIFdoaWxlIGVudGVycHJpc2UgVk1NcyB3b3VsZCBh
bHNvIGV2ZW50dWFsbHkgc3RvcAo+PiBhZGRpbmcgZmVhdHVyZXMsIGVudGVycHJpc2UgY29uc3Vt
ZXJzIGFyZSBhbHdheXMgZnJlZSB0byB1c2UgdGhlaXIgb3duCj4+IFZNTXMgKGF0IHRoZWlyIG93
biByaXNrKS4gU28sIHRoZXJlJ3MgYSByZWFsIGNoYW5jZSB3ZSBjb3VsZCBoYXZlCj4KPiBJIHRo
aW5rIHdlIGFyZSB5ZWFycyBhd2F5IGZyb20gdGhhdCBoYXBwZW5pbmcgKGlmIGl0IGhhcHBlbnMp
LiBNeSAKPiBzdWdnZXN0aW9uIHdhcyBub3QgdG8KPiB0cnkgdG8gYnVpbGQgYSB3b3JsZCB3aGVy
ZSBubyBib2R5IGxpdmVzIDspLiBXaGVuIHdlIGdldCB0byB0aGF0IAo+IHNjZW5hcmlvLCB0aGUg
ZGVmYXVsdCBLVk0KPiBzaGlwcGVkIHdpbGwgaGF2ZSBtYW55IGV4dGVuc2lvbiBpbXBsZW1lbnRl
ZC4gU28gdGhlcmUgd29uJ3QgYmUgbXVjaCAKPiBhZHZhbnRhZ2UgdG8KPiByZWltcGxlbWVudCB0
aGVtIGluIHRoZSB1c2VyIHNwYWNlLiBXZSBjYW4gYWxzbyB0YWtlIGFuIGluZm9ybWVkIAo+IGRl
Y2lzaW9uIGF0IHRoYXQgdGltZQo+IGlmIHRoZSBjdXJyZW50IHNlbGVjdGl2ZSBmb3J3YXJkaW5n
IGFwcHJvYWNoIGlzIGJldHRlcgoKUGxlYXNlIGRvbid0IHJlcGVhdCB0aGUgZGVzaWduIG9mIFNV
U1AvU1JTVC9EQkNOLgpTZWVpbmcgdGhlbSBpcyBvbmUgb2YgdGhlIHJlYXNvbnMgd2h5IEkgcHJv
cG9zZWQgdGhlIG5ldyBpbnRlcmZhY2UuCgoiQmxpbmRseSIgZm9yd2FyZGluZyBEQkNOIHRvIHVz
ZXJzcGFjZSBpcyBldmVuIGEgbWlub3Igb3B0aW1pemF0aW9uLiA6KQoKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3Igd2UgbmVlZCB0byAK
PiBibGluZGx5IGZvcndhcmQgYW55Cj4gdW5rbm93biBTQkkgY2FsbHMgdG8gdGhlIHVzZXIgc3Bh
Y2UuCgpZZXMsIEtWTSBoYXMgdG8gZG8gd2hhdCB1c2VycGFjZSBjb25maWd1cmVzIGl0IHRvIGRv
LgoKSSBkb24ndCB0aGluayB0aGF0IGltcGxlbWVudGluZyB1bnN1cHBvcnRlZCBTQkkgZXh0ZW5z
aW9ucyBpbiBLVk0gaXMKaW1wb3J0YW50IC0tIHRoZXkgc2hvdWxkIG5vdCBiZSBhIGhvdCBwYXRo
LgoKPj4gZGVwbG95bWVudHMgd2l0aCBvbGRlciwgc3RhYmxlIEtWTSB3aGVyZSB1c2VycyB3YW50
IHRvIGVuYWJsZSBsYXRlciBTQkkKPj4gZXh0ZW5zaW9ucywgYW5kLCBpbiBzb21lIGNhc2VzLCB0
aGF0IHNob3VsZCBiZSBwb3NzaWJsZSBieSBqdXN0IHVwZGF0aW5nCj4+IHRoZSBWTU0gLS0gYnV0
IG9ubHkgaWYgS1ZNIGlzIG9ubHkgYWN0aW5nIGFzIGFuIFNCSSBpbXBsZW1lbnRhdGlvbgo+PiBh
Y2NlbGVyYXRvciBhbmQgbm90IGFzIGEgdXNlcnNwYWNlIFNCSSBpbXBsZW1lbnRhdGlvbiBnYXRl
a2VlcGVyLgo+Cj4gQnV0IHNvbWUgb2YgdGhlIFNCSSBleHRlbnNpb25zIGFyZSBzbyBmdW5kYW1l
bnRhbCB0aGF0IGl0IG11c3QgYmUgCj4gaW1wbGVtZW50ZWQgaW4gS1ZNCj4gZm9yIHZhcmlvdXMg
cmVhc29ucyBwb2ludGVkIGJ5IEFudXAgb24gb3RoZXIgdGhyZWFkLgoKTm8sIFNCSSBkb2VzIG5v
dCBoYXZlIHRvIGJlIGltcGxlbWVudGVkIGluIEtWTSBhdCBhbGwuCgpXZSBkbyBoYXZlIGEgZGVl
cCBkaXNhZ3JlZW1lbnQgb24gd2hhdCBpcyB2aXJ0dWFsaXphdGlvbiBhbmQgdGhlIHJvbGUgb2YK
S1ZNIGluIGl0LiAgSSB0aGluayB0aGF0IHVzZXJzcGFjZSB3YW50cyBhIGdlbmVyaWMgSVNBIGFj
Y2VsZXJhdG9yLgoKRXZlbiBpZiB1c2Vyc3BhY2Ugd2FudHMgU0JJIGZvciB0aGUgTS1tb2RlIGlu
dGVyZmFjZSwgc2VjdXJpdHkgbWluZGVkCnVzZXJzcGFjZSBhaW1zIGZvciBhcyBsaXR0bGUga2Vy
bmVsIGNvZGUgYXMgcG9zc2libGUuClVzZXJzcGFjZSBtaWdodCB3YW50IHRvIGFjY2VsZXJhdGUg
c29tZSBTQkkgZXh0ZW5zaW9uIGluIEtWTSwgYnV0IGl0CnNob3VsZCBub3QgYmUgS1ZNIHdobyBk
ZWNpZGVzIHdoYXQgdXNlcnNwYWNlIHdhbnRzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
