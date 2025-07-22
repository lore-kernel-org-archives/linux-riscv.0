Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484AAC83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 04:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H+l1ubJnAlzuraA8XZ+a/Fpq0+gTo1Iwz+MuVgx3ZrQ=; b=r9RuNv2s3ru/DK
	7fiAAlMNPYpCOBTdJAymLqaZp/U4iidVOfI/98aWJ48da0G316vBN0U9naNCbVDFxjg277xojuw+0
	Eqp0kDZa11GpSNm1mFM1tZVeMFd+zsOSItuSrXuR0gzOgZS4whacbfDHfmAekbhvm3KPil/eGJGge
	7qxjMg3sj98OvlRNwdRnNHCeMy37vCQcTxZ5ardyZChBE1TuVZWGQ9pfpLVkqLEV6YrizObag1Hxi
	XBHEGp2kB4SnHejukdDX/wz/6VKWrSCJORUO051HUEaaA7mB7jje6B89wLT28aheE5fuZQtgsunjr
	V6quS8IH07k6m/F767ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue4AW-00000001Dsu-1Yo9;
	Tue, 22 Jul 2025 03:59:56 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue4AS-00000001Drh-3rtj
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 03:59:54 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3e2a3873132so40696625ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Jul 2025 20:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753156792; x=1753761592; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azXxDouz3VhvVI25kVzCdndCbjprC2M8LL1OP84oLB4=;
        b=qPj89OhPdB+BCgWsbcQhFEwrJFqU0AwjOyrxYSt34ga2IHhrHlDs/ZTlrR5HjSOMUF
         lstpQDrOzvKfNJLB0uXvJavSChYlKRzz3HzonmP2jlM/E0RVYyMjptbU2XWcX2fdRijL
         H4FcSgUzlbk33eY5PR1eKNAtmecOGUqOje6fVjsIObuftmPhs3zaC6Upn1Xt9LUB58zo
         6WWEKqUtIdtJYfwVCt+WQ+1svcnb0wVFXUu8tL8YpzjaPZrBK1Lxo2dCdh3PUE2sW1L7
         jjjLUHeM2LSJBoAxlGj1GGaxm+HPriepHzpDCsZ9ZOg+ps+ik/gZ4ZKd13iXyJUsDR12
         fUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753156792; x=1753761592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azXxDouz3VhvVI25kVzCdndCbjprC2M8LL1OP84oLB4=;
        b=AacqfTa2YdryJczXj8tuK2g4ttbHeNnQjCDKtNPeF4yikHAJj83/uG88/JhtuCxunI
         fM/hVHdrSlikBAcDk5c0GJqm0eg+cEM5OmpmjSUEOLOowqosGKXzvUnnR34Dbi0Yiga5
         ftYu2AYb6HKd6iAG0mE0abF7ydmrBC5Qhgs9GCDAfZxSRmtjcsCGS+1PWJFqzL77/F42
         tVnfCPls/UEkMCJayhI6U7tCWQ3FUD3aZs5kuhgfrCPqIA+G+VyEramHNkYRKyTfLpFg
         Fy5AGSBEnshMnvOFD2MDa6CQwOxnzq9iYXRcLtiZsNP/H4r82lcUG5xHtMdNW0c+DwAx
         4g3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsY+cR3itEwiKpqLe19awikiubfh6VQXGJMmwTjNNQ3xNTCLYCb9JgnokI+ASe9OV7TMJ30aDUoSHJuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzMJNqzyB3ojErWs33BHuAYsZPPzxBK6u6uUORNc6kb2bFI9Ss
	GyRGyMcjaEb+GzAkt5a7ZLOWFWccir4OYC83nbuEm3C8O+U2VSlz+wS5MvjT/rFsnqxH0PHtPD1
	WmATK98FhCsVpmR0lsso9nt7MHB3AVOqk27eGtsPgoA==
X-Gm-Gg: ASbGncuCug+FathfLmDCGbirHD8m9+D+5BxhqjgAhPyisGJwG3BUo8r3mCmOepUxcbk
	scU8g8TAO+c0q6MaUFOTzMfXLkjMBbAY+rTBdvptmEeXaj3RKBbvEhZpv0v5qVxFYWeaZOrzWOv
	kZqcfAOPKUSsCnKiId9BbKwGtxJx4/nPlvFdbdBGt741O+30ZIouh5J3IVNZ1nwaUt1SAo3mjdD
	qYkgz1g
X-Google-Smtp-Source: AGHT+IHpX4gv3L9qRgmkg5vRrd6Bn1uOwCgW3ASTBkfj3oy85sashnMtNel4xRNvCLmx3HyMPs1rhWWMG3wCUitrJq8=
X-Received: by 2002:a05:6e02:1a2d:b0:3e2:9f01:a87f with SMTP id
 e9e14a558f8ab-3e29f01aacamr172092815ab.22.1753156791976; Mon, 21 Jul 2025
 20:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
In-Reply-To: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Jul 2025 09:29:40 +0530
X-Gm-Features: Ac12FXzjUPyCjGixcXNmSF9Z7RGo8cjqQ1deNGPVZVPzKJzPPazl7D1wVYDTxbU
Message-ID: <CAAhSdy2XM+3UQD0FZehJnmCbjwRMCZQpt1cEkb4gmJu+LFsaKQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Add SBI v3.0 PMU enhancements
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_205953_037028_27898548 
X-CRM114-Status: GOOD (  20.41  )
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

SGkgV2lsbCwKCk9uIFR1ZSwgSnVsIDIyLCAyMDI1IGF0IDg6NDXigK9BTSBBdGlzaCBQYXRyYSA8
YXRpc2hwQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBTQkkgdjMuMCBzcGVjaWZpY2F0aW9uWzFd
IGFkZGVkIHR3byBuZXcgaW1wcm92ZW1lbnRzIHRvIHRoZSBQTVUgY2hhcGVyLgo+IFRoZSBTQkkg
djMuMCBzcGVjaWZpY2F0aW9uIGlzIGZyb3plbiBhbmQgdW5kZXIgcHVibGljIHJldmlldyBwaGFz
ZSBhcwo+IHBlciB0aGUgUklTQy1WIEludGVybmF0aW9uYWwgZ3VpZGVsaW5lcy4KPgo+IDEuIEFk
ZGVkIGFuIGFkZGl0aW9uYWwgZ2V0X2V2ZW50X2luZm8gZnVuY3Rpb24gdG8gcXVlcnkgZXZlbnQg
YXZhaWxhYmxpdHkKPiBpbiBidWxrIGluc3RlYWQgb2YgaW5kaXZpZHVhbCBTQkkgY2FsbHMgZm9y
IGVhY2ggZXZlbnQuIFRoaXMgaGVscHMgaW4KPiBpbXByb3ZpbmcgdGhlIGJvb3QgdGltZS4KPgo+
IDIuIFJhdyBldmVudCB3aWR0aCBhbGxvd2VkIGJ5IHRoZSBwbGF0Zm9ybSBpcyB3aWRlbmVkIHRv
IGhhdmUgNTYgYml0cwo+IHdpdGggUkFXIGV2ZW50IHYyIGFzIHBlciBuZXcgY2xhcmlmaWNhdGlv
biBpbiB0aGUgcHJpdiBJU0FbMl0uCj4KPiBBcGFydCBmcm9tIGltcGxlbWVudGluZyB0aGVzZSBu
ZXcgZmVhdHVyZXMsIHRoaXMgc2VyaWVzIGltcHJvdmVzIHRoZSBncGEKPiByYW5nZSBjaGVjayBp
biBLVk0gYW5kIHVwZGF0ZXMgdGhlIGt2bSBTQkkgaW1wbGVtZW50YXRpb24gdG8gU0JJIHYzLjAu
Cj4KPiBUaGUgb3BlbnNiaSBwYXRjaGVzIGhhdmUgYmVlbiBtZXJnZWQuIFRoaXMgc2VyaWVzIGNh
biBiZSBmb3VuZCBhdCBbM10uCj4KPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1p
c2EvcmlzY3Ytc2JpLWRvYy9yZWxlYXNlcy9kb3dubG9hZC92My4wLXJjNy9yaXNjdi1zYmkucGRm
Cj4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsL2lzc3Vlcy8x
NTc4Cj4gWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9hdGlzaHAwNC9saW51eC90cmVlL2I0L3BtdV9l
dmVudF9pbmZvX3Y0Cj4KPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9z
aW5jLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHY0Ogo+IC0gUmViYXNlZCBvbiB0b3Agb2YgdjYu
MTYtcmM3Cj4gLSBGaXhlZCBhIHBvdGVudGlhbCBjb21waWxhdGlvbiBpc3N1ZSBpbiBQQVRDSDUu
Cj4gLSBNaW5vciB0eXBvcyBmaXhlZCBQQVRDSDIgYW5kIFBBVENIMy4KPiAtIEZpeGVkIHZhcmlh
YmxlIG9yZGVyaW5nIGluIFBBVENINgo+IC0gTGluayB0byB2MzogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDI1MDUyMi1wbXVfZXZlbnRfaW5mby12My0wLWY3YmJhN2ZkOWNmZUByaXZvc2lu
Yy5jb20KPgo+IENoYW5nZXMgaW4gdjM6Cj4gLSBSZWJhc2VkIG9uIHRvcCBvZiB2Ni4xNS1yYzcK
PiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTAxMTUtcG11X2V2
ZW50X2luZm8tdjItMC04NDgxNWI3MDM4M2JAcml2b3NpbmMuY29tCj4KPiBDaGFuZ2VzIGluIHYy
Ogo+IC0gRHJvcHBlZCBQQVRDSCAyIHRvIGJlIHRha2VuIGR1cmluZyByY1guCj4gLSBJbXByb3Zl
ZCBncGEgcmFuZ2UgY2hlY2sgdmFsaWRhdGlvbiBieSBpbnRyb2R1Y2luZyBhIGhlbHBlciBmdW5j
dGlvbgo+ICAgYW5kIGNoZWNraW5nIHRoZSBlbnRpcmUgcmFuZ2UuCj4gLSBMaW5rIHRvIHYxOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQxMTE5LXBtdV9ldmVudF9pbmZvLXYxLTAtYTRm
OTY5MTQyMWY4QHJpdm9zaW5jLmNvbQo+Cj4gLS0tCj4gQXRpc2ggUGF0cmEgKDkpOgo+ICAgICAg
IGRyaXZlcnMvcGVyZjogcmlzY3Y6IEFkZCBTQkkgdjMuMCBmbGFnCj4gICAgICAgZHJpdmVycy9w
ZXJmOiByaXNjdjogQWRkIHJhdyBldmVudCB2MiBzdXBwb3J0Cj4gICAgICAgUklTQy1WOiBLVk06
IEFkZCBzdXBwb3J0IGZvciBSYXcgZXZlbnQgdjIKPiAgICAgICBkcml2ZXJzL3BlcmY6IHJpc2N2
OiBJbXBsZW1lbnQgUE1VIGV2ZW50IGluZm8gZnVuY3Rpb24KPiAgICAgICBkcml2ZXJzL3BlcmY6
IHJpc2N2OiBFeHBvcnQgUE1VIGV2ZW50IGluZm8gZnVuY3Rpb24KPiAgICAgICBLVk06IEFkZCBh
IGhlbHBlciBmdW5jdGlvbiB0byB2YWxpZGF0ZSB2Y3B1IGdwYSByYW5nZQo+ICAgICAgIFJJU0Mt
VjogS1ZNOiBVc2UgdGhlIG5ldyBncGEgcmFuZ2UgdmFsaWRhdGUgaGVscGVyIGZ1bmN0aW9uCj4g
ICAgICAgUklTQy1WOiBLVk06IEltcGxlbWVudCBnZXQgZXZlbnQgaW5mbyBmdW5jdGlvbgo+ICAg
ICAgIFJJU0MtVjogS1ZNOiBVcGdyYWRlIHRoZSBzdXBwb3J0ZWQgU0JJIHZlcnNpb24gdG8gMy4w
Cj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9wbXUuaCB8ICAgMyArCj4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggfCAgIDIgKy0KPiAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9zYmkuaCAgICAgICAgICB8ICAxMyArKysKPiAgYXJjaC9yaXNjdi9rdm0v
dmNwdV9wbXUuYyAgICAgICAgICAgICB8ICA3NSArKysrKysrKysrKystCj4gIGFyY2gvcmlzY3Yv
a3ZtL3ZjcHVfc2JpX3BtdS5jICAgICAgICAgfCAgIDMgKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaV9zdGEuYyAgICAgICAgIHwgICA2ICstCj4gIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2Jp
LmMgICAgICAgICAgfCAxOTEgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ICBp
bmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggICAgICAgICAgICAgIHwgICAyICsKPiAgaW5jbHVkZS9s
aW51eC9wZXJmL3Jpc2N2X3BtdS5oICAgICAgICB8ICAgMSArCj4gIHZpcnQva3ZtL2t2bV9tYWlu
LmMgICAgICAgICAgICAgICAgICAgfCAgMjEgKysrKwo+ICAxMCBmaWxlcyBjaGFuZ2VkLCAyNTgg
aW5zZXJ0aW9ucygrKSwgNTkgZGVsZXRpb25zKC0pCgpBcmUgeW91IG9rYXkgd2l0aCB0aGlzIHNl
cmllcyBnb2luZyB0aHJvdWdoIHRoZSBLVk0gUklTQy1WIHRyZWUgPwoKUmVnYXJkcywKQW51cAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
